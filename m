Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c350800b003928b925796sm64799wmq.47.2022.04.20.11.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 11:14:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 50EE71FFC4;
	Wed, 20 Apr 2022 19:08:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 12/25] tests/tcg: add compiler test variables when using containers
Date: Wed, 20 Apr 2022 19:08:19 +0100
Message-Id: <20220420180832.3812543-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HjFhpwber5U9

From: Paolo Bonzini <pbonzini@redhat.com>

Even for container-based cross compilation use $(CROSS_CC_HAS_*) variables.
This makes the TCG test makefiles oblivious of whether the compiler is
invoked through a container or not.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220401141326.1244422-10-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-13-alex.bennee@linaro.org>

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index a7286ac295..f6fcd4829e 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -64,7 +64,7 @@ run-memory-replay: memory-replay run-memory-record
 
 EXTRA_RUNS+=run-memory-replay
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_3),)
+ifneq ($(CROSS_CC_HAS_ARMV8_3),)
 pauth-3: CFLAGS += -march=armv8.3-a
 else
 pauth-3:
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index f7121cb4d8..6ad0ad49f9 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -18,7 +18,7 @@ run-fcvt: fcvt
 	$(call diff-out,$<,$(AARCH64_SRC)/fcvt.ref)
 
 # Pauth Tests
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_3),)
+ifneq ($(CROSS_CC_HAS_ARMV8_3),)
 AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5
 pauth-%: CFLAGS += -march=armv8.3-a
 run-pauth-%: QEMU_OPTS += -cpu max
@@ -27,7 +27,7 @@ endif
 
 # BTI Tests
 # bti-1 tests the elf notes, so we require special compiler support.
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_BTI),)
+ifneq ($(CROSS_CC_HAS_ARMV8_BTI),)
 AARCH64_TESTS += bti-1
 bti-1: CFLAGS += -mbranch-protection=standard
 bti-1: LDFLAGS += -nostdlib
@@ -36,12 +36,12 @@ endif
 AARCH64_TESTS += bti-2
 
 # MTE Tests
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_MTE),)
+ifneq ($(CROSS_CC_HAS_ARMV8_MTE),)
 AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6 mte-7
 mte-%: CFLAGS += -march=armv8.5-a+memtag
 endif
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE),)
+ifneq ($(CROSS_CC_HAS_SVE),)
 # System Registers Tests
 AARCH64_TESTS += sysregs
 sysregs: CFLAGS+=-march=armv8.1-a+sve
@@ -88,7 +88,7 @@ EXTRA_RUNS += run-gdbstub-sysregs run-gdbstub-sve-ioctls
 endif
 endif
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE2),)
+ifneq ($(CROSS_CC_HAS_SVE2),)
 AARCH64_TESTS += test-826
 test-826: CFLAGS+=-march=armv8.1-a+sve2
 endif
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 84f928f7f8..8927a2b260 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -348,6 +348,23 @@ for target in $target_list; do
                   echo "DOCKER_CROSS_LD_GUEST=$container_cross_ld" >> \
                       $config_target_mak
               fi
+              case $target in
+                  aarch64-*)
+                      echo "CROSS_CC_HAS_SVE=y" >> $config_target_mak
+                      echo "CROSS_CC_HAS_SVE2=y" >> $config_target_mak
+                      echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
+                      echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
+                      echo "CROSS_CC_HAS_ARMV8_MTE=y" >> $config_target_mak
+                      ;;
+                  ppc*)
+                      echo "CROSS_CC_HAS_POWER8_VECTOR=y" >> $config_target_mak
+                      echo "CROSS_CC_HAS_POWER10=y" >> $config_target_mak
+                      ;;
+                  i386-linux-user)
+                      echo "CROSS_CC_HAS_I386_NOPIE=y" >> $config_target_mak
+                      ;;
+              esac
+              break
           fi
       done
   fi
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index e1c0310be6..bd73c96d0d 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -30,7 +30,7 @@ hello-i386: LDFLAGS+=-nostdlib
 # test-386 includes a couple of additional objects that need to be
 # linked together, we also need a no-pie capable compiler due to the
 # non-pic calls into 16-bit mode
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_I386_NOPIE),)
+ifneq ($(CROSS_CC_HAS_I386_NOPIE),)
 test-i386: CFLAGS += -fno-pie
 
 test-i386: test-i386.c test-i386-code16.S test-i386-vm86.S test-i386.h test-i386-shift.h test-i386-muldiv.h
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 8197c288a7..babd209573 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -5,14 +5,14 @@
 VPATH += $(SRC_PATH)/tests/tcg/ppc64
 VPATH += $(SRC_PATH)/tests/tcg/ppc64le
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
+ifneq ($(CROSS_CC_HAS_POWER8_VECTOR),)
 PPC64_TESTS=bcdsub non_signalling_xscv
 endif
 $(PPC64_TESTS): CFLAGS += -mpower8-vector
 
 PPC64_TESTS += mtfsf
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+ifneq ($(CROSS_CC_HAS_POWER10),)
 PPC64_TESTS += byte_reverse sha512-vector
 endif
 byte_reverse: CFLAGS += -mcpu=power10
diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
index 9624bb1e9c..5b0eb5e870 100644
--- a/tests/tcg/ppc64le/Makefile.target
+++ b/tests/tcg/ppc64le/Makefile.target
@@ -4,12 +4,12 @@
 
 VPATH += $(SRC_PATH)/tests/tcg/ppc64le
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER8_VECTOR),)
+ifneq ($(CROSS_CC_HAS_POWER8_VECTOR),)
 PPC64LE_TESTS=bcdsub non_signalling_xscv
 endif
 $(PPC64LE_TESTS): CFLAGS += -mpower8-vector
 
-ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
+ifneq ($(CROSS_CC_HAS_POWER10),)
 PPC64LE_TESTS += byte_reverse sha512-vector
 endif
 byte_reverse: CFLAGS += -mcpu=power10
-- 
2.30.2
