Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb675eb1bdsm2947453a12.10.2024.10.22.03.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 03:56:15 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BF0265F8A6;
	Tue, 22 Oct 2024 11:56:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	devel@lists.libvirt.org,
	Cleber Rosa <crosa@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 01/20] tests/docker: Fix microblaze atomics
Date: Tue, 22 Oct 2024 11:55:55 +0100
Message-Id: <20241022105614.839199-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241022105614.839199-1-alex.bennee@linaro.org>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: U8U99C6TfAYJ

From: Ilya Leoshkevich <iii@linux.ibm.com>

GCC produces invalid code for microblaze atomics.

The fix is unfortunately not upstream, so fetch it from an external
location and apply it locally.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20240919152308.10440-1-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .../debian-microblaze-cross.d/build-toolchain.sh          | 8 ++++++++
 tests/docker/dockerfiles/debian-toolchain.docker          | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh b/tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
index 23ec0aa9a7..c5cd0aa931 100755
--- a/tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
+++ b/tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
@@ -10,6 +10,8 @@ TOOLCHAIN_INSTALL=/usr/local
 TOOLCHAIN_BIN=${TOOLCHAIN_INSTALL}/bin
 CROSS_SYSROOT=${TOOLCHAIN_INSTALL}/$TARGET/sys-root
 
+GCC_PATCH0_URL=https://raw.githubusercontent.com/Xilinx/meta-xilinx/refs/tags/xlnx-rel-v2024.1/meta-microblaze/recipes-devtools/gcc/gcc-12/0009-Patch-microblaze-Fix-atomic-boolean-return-value.patch
+
 export PATH=${TOOLCHAIN_BIN}:$PATH
 
 #
@@ -31,6 +33,12 @@ mv gcc-11.2.0 src-gcc
 mv musl-1.2.2 src-musl
 mv linux-5.10.70 src-linux
 
+#
+# Patch gcc
+#
+
+wget -O - ${GCC_PATCH0_URL} | patch -d src-gcc -p1
+
 mkdir -p bld-hdr bld-binu bld-gcc bld-musl
 mkdir -p ${CROSS_SYSROOT}/usr/include
 
diff --git a/tests/docker/dockerfiles/debian-toolchain.docker b/tests/docker/dockerfiles/debian-toolchain.docker
index 687a97fec4..ab4ce29533 100644
--- a/tests/docker/dockerfiles/debian-toolchain.docker
+++ b/tests/docker/dockerfiles/debian-toolchain.docker
@@ -10,6 +10,8 @@ FROM docker.io/library/debian:11-slim
 # ??? The build-dep isn't working, missing a number of
 # minimal build dependiencies, e.g. libmpc.
 
+RUN sed 's/^deb /deb-src /' </etc/apt/sources.list >/etc/apt/sources.list.d/deb-src.list
+
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
@@ -33,6 +35,11 @@ RUN cd /root && ./build-toolchain.sh
 # and the build trees by restoring the original image,
 # then copying the built toolchain from stage 0.
 FROM docker.io/library/debian:11-slim
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+    apt install -y --no-install-recommends \
+        libmpc3
 COPY --from=0 /usr/local /usr/local
 # As a final step configure the user (if env is defined)
 ARG USER
-- 
2.39.5
