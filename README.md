renderdoc_jffm
===

[![Maven Central](https://img.shields.io/maven-central/v/com.io7m.renderdoc_jffm/com.io7m.renderdoc_jffm.svg?style=flat-square)](http://search.maven.org/#search%7Cga%7C1%7Cg%3A%22com.io7m.renderdoc_jffm%22)
[![Maven Central (snapshot)](https://img.shields.io/maven-metadata/v?metadataUrl=https%3A%2F%2Fcentral.sonatype.com%2Frepository%2Fmaven-snapshots%2Fcom%2Fio7m%2Frenderdoc_jffm%2Fcom.io7m.renderdoc_jffm%2Fmaven-metadata.xml&style=flat-square)](https://central.sonatype.com/repository/maven-snapshots/com/io7m/renderdoc_jffm/)
[![Codecov](https://img.shields.io/codecov/c/github/io7m-com/renderdoc_jffm.svg?style=flat-square)](https://codecov.io/gh/io7m-com/renderdoc_jffm)
![Java Version](https://img.shields.io/badge/25-java?label=java&color=5ce67e)

![com.io7m.renderdoc_jffm](./src/site/resources/renderdoc_jffm.jpg?raw=true)

| JVM | Platform | Status |
|-----|----------|--------|
| OpenJDK (Temurin) Current | Linux | [![Build (OpenJDK (Temurin) Current, Linux)](https://img.shields.io/github/actions/workflow/status/io7m-com/renderdoc_jffm/main.linux.temurin.current.yml)](https://www.github.com/io7m-com/renderdoc_jffm/actions?query=workflow%3Amain.linux.temurin.current)|
| OpenJDK (Temurin) LTS | Linux | [![Build (OpenJDK (Temurin) LTS, Linux)](https://img.shields.io/github/actions/workflow/status/io7m-com/renderdoc_jffm/main.linux.temurin.lts.yml)](https://www.github.com/io7m-com/renderdoc_jffm/actions?query=workflow%3Amain.linux.temurin.lts)|
| OpenJDK (Temurin) Current | Windows | [![Build (OpenJDK (Temurin) Current, Windows)](https://img.shields.io/github/actions/workflow/status/io7m-com/renderdoc_jffm/main.windows.temurin.current.yml)](https://www.github.com/io7m-com/renderdoc_jffm/actions?query=workflow%3Amain.windows.temurin.current)|
| OpenJDK (Temurin) LTS | Windows | [![Build (OpenJDK (Temurin) LTS, Windows)](https://img.shields.io/github/actions/workflow/status/io7m-com/renderdoc_jffm/main.windows.temurin.lts.yml)](https://www.github.com/io7m-com/renderdoc_jffm/actions?query=workflow%3Amain.windows.temurin.lts)|

## renderdoc_jffm

A Java interface to the [RenderDoc API](https://renderdoc.org).

## Features

* A friendly Java interface to the RenderDoc API.
* [JPMS](https://en.wikipedia.org/wiki/Java_Platform_Module_System)-ready.
* ISC license.

## Usage

When running your application, you must allow access to the
[FFM](https://openjdk.org/jeps/454) API for the module
`com.io7m.renderdoc_jffm.core`:

```
$ java --enable-native-access=com.io7m.renderdoc_jffm.core ...
```

Run your application from RenderDoc. RenderDoc works by injecting a native
library into your application. Then, inside your application, call
`RenderDoc.open()`:

```
try (final var doc = RenderDoc.open()) {
  ...
}
```

The obtained `RenderDocType` interface is a type-safe, memory-safe interface
to the API exposed by the RenderDoc native library. The interface allows for
setting options and triggering captures.

The `open()` method will raise an `IOException` with a useful error message
if the `renderdoc` native library is not present in the current application
process.

### LD_LIBRARY_PATH

It may be necessary on some systems (notably Fedora Linux) to set the
`LD_LIBRARY_PATH` environment variable. It seems that some packaging systems
place `renderdoc` into its own subdirectory under `/lib64`:

```
$ file /lib64/renderdoc/librenderdoc.so
/lib64/renderdoc/librenderdoc.so: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, BuildID[sha1]=c8dcf24af968317d361ea1bb021f8a5919fefb1f, stripped
```

The Java FFM API will use the system's default library path, and this tends
not to contain `/lib64/renderdoc` on those systems.

```
$ export LD_LIBRARY_PATH=/lib:/lib64:/lib64/renderdoc
```

