from conans import ConanFile, CMake, tools

class cmockalibConan(ConanFile):
    name = "cmocka"
    version = "0.4.1"
    license = "<Put the package license here>"
    author = "<Put your name here> <And your email here>"
    url = "https://github.com/elear-solutions/cmocka"
    homepage = "https://git.cryptomilk.org/projects/cmocka.git"
    description = "Unit testing framework"
    topics = ("c", "unit", "testing")
    settings = "os", "compiler", "build_type", "arch"
    generators = "cmake"
    options = {
        "shared": [True, False]
    }
    default_options = {
        "shared": False
    }

    def build(self):
        cmake = CMake(self)
        cmake.configure(source_folder=".")
        cmake.build()

    def package(self):
        self.copy("*.h", dst="include", src="include")
        self.copy("*", dst="lib", src="lib", keep_path=False)

    def package_info(self):
        self.cpp_info.libs = [ "cmocka" ]
