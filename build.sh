set -e

mkdir -p build/Release
(
    cd build/Release
    cmake ../.. -DCMAKE_BUILD_TYPE=Release
    make -j8 cairo_lang_venv
)

VENV_SITE_DIR=build/Release/src/starkware/cairo/lang/cairo_lang_venv-site
cp src/starkware/cairo/lang/setup.py ${VENV_SITE_DIR}
cp src/starkware/cairo/lang/MANIFEST.in ${VENV_SITE_DIR}
cp scripts/requirements-gen.txt ${VENV_SITE_DIR}/requirements.txt
( cd ${VENV_SITE_DIR}; python3 setup.py sdist --format=zip )
cp ${VENV_SITE_DIR}/dist/cairo-starkware-0.0.1.zip .
