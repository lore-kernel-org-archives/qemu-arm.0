Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g17sm2392881wrp.61.2021.06.04.09.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:12:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DEA8720026;
	Fri,  4 Jun 2021 16:53:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Willian Rampazzo <willianr@redhat.com>
Subject: [PATCH  v16 99/99] gitlab: defend the new stripped down arm64 configs
Date: Fri,  4 Jun 2021 16:53:12 +0100
Message-Id: <20210604155312.15902-100-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GX0CfSSP3JCW

We can now build a KVM only aarch64-softmmu image which we need to
cross build. We can also build a version that only supports a limited
set of 64 bit images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml   | 10 ++++++++++
 .gitlab-ci.d/crossbuilds.yml |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index b72c57e4df..a48e723efe 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -645,6 +645,16 @@ build-without-default-features:
         --target-list-exclude=arm-softmmu,i386-softmmu,mipsel-softmmu,mips64-softmmu,ppc-softmmu
     MAKE_CHECK_ARGS: check-unit
 
+build-64bit-only-aarch64-softmmu:
+  extends: .native_build_job_template
+  needs:
+    job: amd64-debian-container
+  variables:
+    IMAGE: debian-amd64
+    TARGETS: aarch64-softmmu
+    CONFIGURE_ARGS: --with-devices-aarch64=../configs/aarch64-softmmu/64bit-only.mak
+    MAKE_CHECK_ARGS: check
+
 build-libvhost-user:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 6b3865c9e8..a118aa3052 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -36,6 +36,15 @@ cross-arm64-system:
   variables:
     IMAGE: debian-arm64-cross
 
+cross-arm64-kvm-only-system:
+  extends: .cross_accel_build_job
+  needs:
+    job: arm64-debian-cross-container
+  variables:
+    IMAGE: debian-arm64-cross
+    ACCEL: kvm
+    EXTRA_CONFIGURE_OPTS: --disable-tcg
+
 cross-arm64-user:
   extends: .cross_user_build_job
   needs:
-- 
2.20.1
