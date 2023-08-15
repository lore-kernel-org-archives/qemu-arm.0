Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id k13-20020a5d428d000000b0030ada01ca78sm18236374wrq.10.2023.08.15.07.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 07:51:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E81411FFBC;
	Tue, 15 Aug 2023 15:51:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Thomas Huth <thuth@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/9] gitlab: enable ccache for many build jobs
Date: Tue, 15 Aug 2023 15:51:18 +0100
Message-Id: <20230815145126.3444183-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230815145126.3444183-1-alex.bennee@linaro.org>
References: <20230815145126.3444183-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: o+ecngSvI7rn

From: Daniel P. Berrangé <berrange@redhat.com>

The `ccache` tool can be very effective at reducing compilation times
when re-running pipelines with only minor changes each time. For example
a fresh 'build-system-fedora' job will typically take 20 minutes on the
gitlab.com shared runners. With ccache this is reduced to as little as
6 minutes.

Normally meson would auto-detect existance of ccache in $PATH and use
it automatically, but the way we wrap meson from configure breaks this,
as we're passing in an config file with explicitly set compiler paths.
Thus we need to add $CCACHE_WRAPPERSPATH to the front of $PATH. For
unknown reasons if doing this in msys though, gcc becomes unable to
invoke 'cc1' when run from meson. For msys we thus set CC='ccache gcc'
before invoking 'configure' instead.

A second problem with msys is that cache misses are incredibly
expensive, so enabling ccache massively slows down the build when
the cache isn't well populated. This is suspected to be a result of
the cost of spawning processes under the msys architecture. To deal
with this we set CCACHE_DEPEND=1 which enables ccache's 'depend_only'
strategy. This avoids extra spawning of the pre-processor during
cache misses, with the downside that is it less likely ccache will
find a cache hit after semantically benign compiler flag changes.
This is the lesser of two evils, as otherwise we can't use ccache
at all under msys and remain inside the job time limit.

If people are finding ccache to hurt their pipelines, it can be
disabled by setting the 'CCACHE_DISABLE=1' env variable against
their gitlab fork CI settings.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230804111054.281802-2-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/ci-jobs.rst.inc                    |  7 +++++
 .gitlab-ci.d/buildtest-template.yml           | 11 ++++++++
 .gitlab-ci.d/crossbuild-template.yml          | 26 +++++++++++++++++++
 .gitlab-ci.d/windows.yml                      | 13 ++++++++--
 .../dockerfiles/debian-hexagon-cross.docker   |  9 ++++++-
 5 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index 3f6802d51e..4c39cdb2d9 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -188,3 +188,10 @@ If you've got access to a CentOS Stream 8 x86_64 host that can be
 used as a gitlab-CI runner, you can set this variable to enable the
 tests that require this kind of host. The runner should be tagged with
 both "centos_stream_8" and "x86_64".
+
+CCACHE_DISABLE
+~~~~~~~~~~~~~~
+The jobs are configured to use "ccache" by default since this typically
+reduces compilation time, at the cost of increased storage. If the
+use of "ccache" is suspected to be hurting the overall job execution
+time, setting the "CCACHE_DISABLE=1" env variable to disable it.
diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index f3e39b7eb1..4fbfeb6667 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -2,11 +2,21 @@
   extends: .base_job_template
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:$QEMU_CI_CONTAINER_TAG
+  cache:
+    paths:
+      - ccache
+    key: "$CI_JOB_NAME"
+    when: always
   before_script:
     - JOBS=$(expr $(nproc) + 1)
   script:
+    - export CCACHE_BASEDIR="$(pwd)"
+    - export CCACHE_DIR="$CCACHE_BASEDIR/ccache"
+    - export CCACHE_MAXSIZE="500M"
+    - export PATH="$CCACHE_WRAPPERSDIR:$PATH"
     - mkdir build
     - cd build
+    - ccache --zero-stats
     - ../configure --enable-werror --disable-docs --enable-fdt=system
           ${TARGETS:+--target-list="$TARGETS"}
           $CONFIGURE_ARGS ||
@@ -20,6 +30,7 @@
       then
         make -j"$JOBS" $MAKE_CHECK_ARGS ;
       fi
+    - ccache --show-stats
 
 # We jump some hoops in common_test_job_template to avoid
 # rebuilding all the object files we skip in the artifacts
diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index d97611053b..3e5f4d9cd8 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -2,10 +2,20 @@
   extends: .base_job_template
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:$QEMU_CI_CONTAINER_TAG
+  cache:
+    paths:
+      - ccache
+    key: "$CI_JOB_NAME"
+    when: always
   timeout: 80m
   script:
+    - export CCACHE_BASEDIR="$(pwd)"
+    - export CCACHE_DIR="$CCACHE_BASEDIR/ccache"
+    - export CCACHE_MAXSIZE="500M"
+    - export PATH="$CCACHE_WRAPPERSDIR:$PATH"
     - mkdir build
     - cd build
+    - ccache --zero-stats
     - ../configure --enable-werror --disable-docs --enable-fdt=system
         --disable-user $QEMU_CONFIGURE_OPTS $EXTRA_CONFIGURE_OPTS
         --target-list-exclude="arm-softmmu cris-softmmu
@@ -18,6 +28,7 @@
       version="$(git describe --match v[0-9]* 2>/dev/null || git rev-parse --short HEAD)";
       mv -v qemu-setup*.exe qemu-setup-${version}.exe;
       fi
+    - ccache --show-stats
 
 # Job to cross-build specific accelerators.
 #
@@ -29,7 +40,15 @@
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:$QEMU_CI_CONTAINER_TAG
   timeout: 30m
+  cache:
+    paths:
+      - ccache/
+    key: "$CI_JOB_NAME"
   script:
+    - export CCACHE_BASEDIR="$(pwd)"
+    - export CCACHE_DIR="$CCACHE_BASEDIR/ccache"
+    - export CCACHE_MAXSIZE="500M"
+    - export PATH="$CCACHE_WRAPPERSDIR:$PATH"
     - mkdir build
     - cd build
     - ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
@@ -40,7 +59,14 @@
   extends: .base_job_template
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:$QEMU_CI_CONTAINER_TAG
+  cache:
+    paths:
+      - ccache/
+    key: "$CI_JOB_NAME"
   script:
+    - export CCACHE_BASEDIR="$(pwd)"
+    - export CCACHE_DIR="$CCACHE_BASEDIR/ccache"
+    - export CCACHE_MAXSIZE="500M"
     - mkdir build
     - cd build
     - ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index cd7622a761..12a987cd71 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -5,13 +5,14 @@
   - windows
   - windows-1809
   cache:
-    key: "${CI_JOB_NAME}-cache"
+    key: "$CI_JOB_NAME"
     paths:
       - msys64/var/cache
+      - ccache
     when: always
   needs: []
   stage: build
-  timeout: 80m
+  timeout: 100m
   variables:
     # This feature doesn't (currently) work with PowerShell, it stops
     # the echo'ing of commands being run and doesn't show any timing
@@ -72,6 +73,7 @@
       bison diffutils flex
       git grep make sed
       $MINGW_TARGET-capstone
+      $MINGW_TARGET-ccache
       $MINGW_TARGET-curl
       $MINGW_TARGET-cyrus-sasl
       $MINGW_TARGET-dtc
@@ -101,11 +103,18 @@
   - Write-Output "Running build at $(Get-Date -Format u)"
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
+  - $env:CCACHE_BASEDIR = "$env:CI_PROJECT_DIR"
+  - $env:CCACHE_DIR = "$env:CCACHE_BASEDIR/ccache"
+  - $env:CCACHE_MAXSIZE = "500M"
+  - $env:CCACHE_DEPEND = 1 # cache misses are too expensive with preprocessor mode
+  - $env:CC = "ccache gcc"
   - mkdir build
   - cd build
+  - ..\msys64\usr\bin\bash -lc "ccache --zero-stats"
   - ..\msys64\usr\bin\bash -lc "../configure --enable-fdt=system $CONFIGURE_ARGS"
   - ..\msys64\usr\bin\bash -lc "make"
   - ..\msys64\usr\bin\bash -lc "make check MTESTARGS='$TEST_ARGS' || { cat meson-logs/testlog.txt; exit 1; } ;"
+  - ..\msys64\usr\bin\bash -lc "ccache --show-stats"
   - Write-Output "Finished build at $(Get-Date -Format u)"
 
 msys2-64bit:
diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index c2cfb6a5d0..578269766c 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -15,6 +15,7 @@ RUN apt-get update && \
 # Install common build utilities
     apt-get install -y --no-install-recommends \
         curl \
+        ccache \
         xz-utils \
         ca-certificates \
         bison \
@@ -24,13 +25,19 @@ RUN apt-get update && \
         python3-venv && \
 # Install QEMU build deps for use in CI
     DEBIAN_FRONTEND=noninteractive eatmydata \
-    apt build-dep -yy --arch-only qemu
+    apt build-dep -yy --arch-only qemu && \
+    mkdir -p /usr/libexec/ccache-wrappers && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
+    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
 
 ENV TOOLCHAIN_INSTALL /opt
 ENV TOOLCHAIN_RELEASE 16.0.0
 ENV TOOLCHAIN_BASENAME "clang+llvm-${TOOLCHAIN_RELEASE}-cross-hexagon-unknown-linux-musl"
 ENV TOOLCHAIN_URL https://codelinaro.jfrog.io/artifactory/codelinaro-toolchain-for-hexagon/v${TOOLCHAIN_RELEASE}/${TOOLCHAIN_BASENAME}.tar.xz
+ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
 
 RUN curl -#SL "$TOOLCHAIN_URL" | tar -xJC "$TOOLCHAIN_INSTALL"
 ENV PATH $PATH:${TOOLCHAIN_INSTALL}/${TOOLCHAIN_BASENAME}/x86_64-linux-gnu/bin
-- 
2.39.2
