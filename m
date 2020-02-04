Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c9sm4712061wmc.47.2020.02.04.10.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 10:40:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 60E371FF9B;
	Tue,  4 Feb 2020 18:40:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 11/16] tests/tcg: gate pauth-% tests on having compiler support
Date: Tue,  4 Feb 2020 18:40:23 +0000
Message-Id: <20200204184028.13708-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200204184028.13708-1-alex.bennee@linaro.org>
References: <20200204184028.13708-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nLhZfZctNSvK

Otherwise we end up failing to build our tests on CI which may have
older compilers that the user expects. We can get rid of this once we
can fallback to multiarch containers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200203090932.19147-14-alex.bennee@linaro.org>

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
