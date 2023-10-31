Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id dk6-20020a0560000b4600b0032f7f4089b7sm1673586wrb.43.2023.10.31.07.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 07:44:02 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0183C65722;
	Tue, 31 Oct 2023 14:44:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 02/19] tests/tcg: Add -fno-stack-protector
Date: Tue, 31 Oct 2023 14:43:44 +0000
Message-Id: <20231031144401.1238210-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031144401.1238210-1-alex.bennee@linaro.org>
References: <20231031144401.1238210-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jbFcdqF0HW86

From: Akihiko Odaki <akihiko.odaki@daynix.com>

A build of GCC 13.2 will have stack protector enabled by default if it
was configured with --enable-default-ssp option. For such a compiler,
it is necessary to explicitly disable stack protector when linking
without standard libraries.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20230731091042.139159-3-akihiko.odaki@daynix.com>
[AJB: fix comment string typo]
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231029145033.592566-3-alex.bennee@linaro.org>

diff --git a/tests/tcg/mips/hello-mips.c b/tests/tcg/mips/hello-mips.c
index 4e1cf501af..38e22d00e3 100644
--- a/tests/tcg/mips/hello-mips.c
+++ b/tests/tcg/mips/hello-mips.c
@@ -5,8 +5,8 @@
 * http://www.linux-mips.org/wiki/MIPSABIHistory
 * http://www.linux.com/howtos/Assembly-HOWTO/mips.shtml
 *
-* mipsel-linux-gcc -nostdlib -mno-abicalls -fno-PIC -mabi=32 \
-*                  -O2 -static -o hello-mips hello-mips.c
+* mipsel-linux-gcc -nostdlib -mno-abicalls -fno-PIC -fno-stack-protector \
+*                  -mabi=32 -O2 -static -o hello-mips hello-mips.c
 *
 */
 #define __NR_SYSCALL_BASE	4000
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index f3a189c9d4..8cf65f68dd 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -123,7 +123,7 @@ else
 # For system targets we include a different Makefile fragment as the
 # build options for bare programs are usually pretty different. They
 # are expected to provide their own build recipes.
-EXTRA_CFLAGS += -ffreestanding
+EXTRA_CFLAGS += -ffreestanding -fno-stack-protector
 -include $(SRC_PATH)/tests/tcg/minilib/Makefile.target
 -include $(SRC_PATH)/tests/tcg/multiarch/system/Makefile.softmmu-target
 -include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.softmmu-target
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 62b38c792f..0c84b61ae0 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -53,7 +53,7 @@ endif
 # bti-1 tests the elf notes, so we require special compiler support.
 ifneq ($(CROSS_CC_HAS_ARMV8_BTI),)
 AARCH64_TESTS += bti-1 bti-3
-bti-1 bti-3: CFLAGS += -mbranch-protection=standard
+bti-1 bti-3: CFLAGS += -fno-stack-protector -mbranch-protection=standard
 bti-1 bti-3: LDFLAGS += -nostdlib
 endif
 # bti-2 tests PROT_BTI, so no special compiler support required.
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 0038cef02c..3473f4619e 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -12,7 +12,7 @@ float_madds: CFLAGS+=-mfpu=neon-vfpv4
 
 # Basic Hello World
 ARM_TESTS = hello-arm
-hello-arm: CFLAGS+=-marm -ffreestanding
+hello-arm: CFLAGS+=-marm -ffreestanding -fno-stack-protector
 hello-arm: LDFLAGS+=-nostdlib
 
 # IWMXT floating point extensions
diff --git a/tests/tcg/cris/Makefile.target b/tests/tcg/cris/Makefile.target
index 43587d2769..713e2a5b6c 100644
--- a/tests/tcg/cris/Makefile.target
+++ b/tests/tcg/cris/Makefile.target
@@ -30,7 +30,7 @@ AS	= $(CC) -x assembler-with-cpp
 LD      = $(CC)
 
 # we rely on GCC inline:ing the stuff we tell it to in many places here.
-CFLAGS  = -Winline -Wall -g -O2 -static
+CFLAGS  = -Winline -Wall -g -O2 -static -fno-stack-protector
 NOSTDFLAGS = -nostartfiles -nostdlib
 ASFLAGS += -mcpu=v10 -g -Wa,-I,$(SRC_PATH)/tests/tcg/cris/bare
 CRT_FILES = crt.o sys.o
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 87ed2c90b9..f839b2c0d5 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -19,7 +19,7 @@
 EXTRA_RUNS =
 
 CFLAGS += -Wno-incompatible-pointer-types -Wno-undefined-internal
-CFLAGS += -fno-unroll-loops
+CFLAGS += -fno-unroll-loops -fno-stack-protector
 
 HEX_SRC=$(SRC_PATH)/tests/tcg/hexagon
 VPATH += $(HEX_SRC)
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index fdf757c6ce..3dec7c6c42 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -35,7 +35,7 @@ run-test-aes: QEMU_OPTS += -cpu max
 #
 # hello-i386 is a barebones app
 #
-hello-i386: CFLAGS+=-ffreestanding
+hello-i386: CFLAGS+=-ffreestanding -fno-stack-protector
 hello-i386: LDFLAGS+=-nostdlib
 
 # test-386 includes a couple of additional objects that need to be
diff --git a/tests/tcg/minilib/Makefile.target b/tests/tcg/minilib/Makefile.target
index c821d2806a..af0bf54be9 100644
--- a/tests/tcg/minilib/Makefile.target
+++ b/tests/tcg/minilib/Makefile.target
@@ -12,7 +12,7 @@ SYSTEM_MINILIB_SRC=$(SRC_PATH)/tests/tcg/minilib
 MINILIB_SRCS=$(wildcard $(SYSTEM_MINILIB_SRC)/*.c)
 MINILIB_OBJS=$(patsubst $(SYSTEM_MINILIB_SRC)/%.c, %.o, $(MINILIB_SRCS))
 
-MINILIB_CFLAGS+=-nostdlib -ggdb -O0
+MINILIB_CFLAGS+=-nostdlib -fno-stack-protector -ggdb -O0
 MINILIB_INC=-isystem $(SYSTEM_MINILIB_SRC)
 
 .PRECIOUS: $(MINILIB_OBJS)
diff --git a/tests/tcg/mips/Makefile.target b/tests/tcg/mips/Makefile.target
index 1a994d5525..5d17c1706e 100644
--- a/tests/tcg/mips/Makefile.target
+++ b/tests/tcg/mips/Makefile.target
@@ -14,6 +14,6 @@ MIPS_TESTS=hello-mips
 
 TESTS += $(MIPS_TESTS)
 
-hello-mips: CFLAGS+=-mno-abicalls -fno-PIC -mabi=32
+hello-mips: CFLAGS+=-mno-abicalls -fno-PIC -fno-stack-protector -mabi=32
 hello-mips: LDFLAGS+=-nostdlib
 endif
-- 
2.39.2
