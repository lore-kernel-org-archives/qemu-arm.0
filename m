Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id c13-20020adfe74d000000b0032da49e18fasm6185006wrn.23.2023.10.29.07.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 07:50:34 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 6EA405F7A4;
	Sun, 29 Oct 2023 14:50:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Brad Smith <brad@comstyle.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Kyle Evans <kevans@freebsd.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Brian Cain <bcain@quicinc.com>,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH v2 04/19] gitlab: clean-up build-soft-softmmu job
Date: Sun, 29 Oct 2023 14:50:18 +0000
Message-Id: <20231029145033.592566-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231029145033.592566-1-alex.bennee@linaro.org>
References: <20231029145033.592566-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xZEYWlutzPy7

Having dropped alpha we also now drop xtensa as we don't have the
compiler in this image. It's not all doom and gloom though as a number
of other targets have gained softmmu TCG tests so we can add them. We
will take care of the other targets with their own containers in
future commits.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index bb24e052f6..5e9cbf9385 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -290,7 +290,9 @@ build-user-hexagon:
     CONFIGURE_ARGS: --disable-tools --disable-docs --enable-debug-tcg
     MAKE_CHECK_ARGS: check-tcg
 
-# Only build the softmmu targets we have check-tcg tests for
+# Build the softmmu targets we have check-tcg tests and compilers in
+# our omnibus all-test-cross container. Those targets that haven't got
+# Debian cross compiler support need to use special containers.
 build-some-softmmu:
   extends: .native_build_job_template
   needs:
@@ -298,7 +300,9 @@ build-some-softmmu:
   variables:
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools --enable-debug
-    TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu
+    TARGETS: arm-softmmu aarch64-softmmu i386-softmmu riscv64-softmmu
+      s390x-softmmu x86_64-softmmu
+    MAKE_CHECK_ARGS: check-tcg
     MAKE_CHECK_ARGS: check-tcg
 
 # We build tricore in a very minimal tricore only container
-- 
2.39.2
