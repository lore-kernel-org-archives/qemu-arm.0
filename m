Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b13sm10107786wrq.48.2020.02.03.01.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 01:09:48 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7EB001FF9D;
	Mon,  3 Feb 2020 09:09:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	richard.henderson@linaro.org,
	balrogg@gmail.com,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	stefanb@linux.vnet.ibm.com,
	marcandre.lureau@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v3 13/17] tests/tcg: gate pauth-% tests on having compiler support
Date: Mon,  3 Feb 2020 09:09:28 +0000
Message-Id: <20200203090932.19147-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200203090932.19147-1-alex.bennee@linaro.org>
References: <20200203090932.19147-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bsynv/n23OSi

Otherwise we end up failing to build our tests on CI which may have
older compilers that the user expects. We can get rid of this once we
can fallback to multiarch containers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.softmmu-target | 12 +++++++++---
 tests/tcg/aarch64/Makefile.target         |  2 ++
 tests/tcg/configure.sh                    |  4 ++++
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index f6b5121f5ce..d2299b98b76 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -61,7 +61,13 @@ run-memory-replay: memory-replay run-memory-record
 	   	  $(QEMU_OPTS) memory, \
 	  "$< on $(TARGET_NAME)")
 
-run-pauth-3: pauth-3
-pauth-3: CFLAGS += -march=armv8.3-a
+EXTRA_TESTS+=memory-record memory-replay
 
-EXTRA_TESTS+=memory-record memory-replay pauth-3
+ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_3),)
+pauth-3: CFLAGS += -march=armv8.3-a
+else
+pauth-3:
+	$(call skip-test, "BUILD of $@", "missing compiler support")
+run-pauth-3:
+	$(call skip-test, "RUN of pauth-3", "not built")
+endif
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index efa67cf1e9e..8ed477d0d51 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -18,9 +18,11 @@ run-fcvt: fcvt
 	$(call diff-out,$<,$(AARCH64_SRC)/fcvt.ref)
 
 # Pauth Tests
+ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_3),)
 AARCH64_TESTS += pauth-1 pauth-2 pauth-4
 run-pauth-%: QEMU_OPTS += -cpu max
 pauth-%: CFLAGS += -march=armv8.3-a
+endif
 
 # Semihosting smoke test for linux-user
 AARCH64_TESTS += semihosting
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index e0d1fbb182f..9eb6ba3b7ea 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -227,6 +227,10 @@ for target in $target_list; do
                -march=armv8.1-a+sve -o $TMPE $TMPC; then
                 echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
             fi
+            if do_compiler "$target_compiler" $target_compiler_cflags \
+               -march=-march=armv8.3-a -o $TMPE $TMPC; then
+                echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
+            fi
         ;;
     esac
 
-- 
2.20.1
