if(NOT VCPKG_TARGET_IS_WINDOWS)
    message(FATAL_ERROR "[D3D12MemoryAllocator] is only supported on Windows.")
endif()

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO GPUOpen-LibrariesAndSDKs/D3D12MemoryAllocator 
    REF 1509c7819695b51ad6f2b49b9f849ec7e2f821fe
    SHA512 2755e9a12029efc82084cce37f95663b4079b6cd217067aef09e8022872d5427bfa6f5547ae206b762bad535c1204b28a70f0a567bb2f6057654f51816c88d60
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH          ${SOURCE_PATH}
    OPTIONS
        -DBUILD_DOCUMENTATION=OFF
        -DD3D12MA_BUILD_SAMPLE=OFF
        -DBUILD_SHARED_LIBS=OFF
)

vcpkg_cmake_build()
vcpkg_cmake_install()
vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup(CONFIG_PATH share/cmake/D3D12MemoryAllocator)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE.txt")
