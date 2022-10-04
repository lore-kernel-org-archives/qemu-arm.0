Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id g11-20020a05600c310b00b003bdb2c7f3d1sm484280wmo.32.2022.10.04.06.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 06:19:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F141E1FFB7;
	Tue,  4 Oct 2022 14:01:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Hildenbrand <david@redhat.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs),
	qemu-s390x@nongnu.org (open list:S390 TCG CPUs)
Subject: [PULL 23/54] tests/tcg: clean up calls to run-test
Date: Tue,  4 Oct 2022 14:01:07 +0100
Message-Id: <20221004130138.2299307-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Y6rferA4v08p

From: Paolo Bonzini <pbonzini@redhat.com>

Almost all invocations of run-test have either "$* on $(TARGET_NAME)"
or "$< on $(TARGET_NAME)" as the last argument.  So provide a default
test name, while allowing an escape hatch for custom names.

As an additional simplification, remove the need to do shell quoting.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-24-alex.bennee@linaro.org>

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index c14eca82c2..cd0a2ad873 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -41,14 +41,16 @@ endif
 # for including , in command strings
 COMMA := ,
 
-quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
+quiet-@ = $(if $(V),,@$(if $1,printf "  %-7s %s\n" "$(strip $1)" "$(strip $2)" && ))
+quiet-command = $(call quiet-@,$2,$3)$1
 
 # $1 = test name, $2 = cmd, $3 = desc
 ifeq ($(filter %-softmmu, $(TARGET)),)
 run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > $1.out, \
-	"TEST",$3)
+	TEST,$(or $3, $*, $<) on $(TARGET_NAME))
 else
-run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2,"TEST",$3)
+run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2, \
+        TEST,$(or $3, $*, $<) on $(TARGET_NAME))
 endif
 
 # $1 = test name, $2 = reference
@@ -56,7 +58,7 @@ endif
 # we know it failed and then force failure at the end.
 diff-out = $(call quiet-command, diff -q $1.out $2 || \
                                  (diff -u $1.out $2 | head -n 10 && false), \
-                                 "DIFF","$1.out with $2")
+                                 DIFF,$1.out with $2)
 
 # $1 = test name, $2 = reason
 skip-test = @printf "  SKIPPED %s on $(TARGET_NAME) because %s\n" $1 $2
@@ -155,21 +157,19 @@ RUN_TESTS+=$(EXTRA_RUNS)
 
 ifeq ($(filter %-softmmu, $(TARGET)),)
 run-%: %
-	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<)
 
 run-plugin-%:
 	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
 		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
 		-d plugin -D $*.pout \
-		 $(call strip-plugin,$<), \
-	"$* on $(TARGET_NAME)")
+		 $(call strip-plugin,$<))
 else
 run-%: %
 	$(call run-test, $<, \
 	  $(QEMU) -monitor none -display none \
 		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
-	   	  $(QEMU_OPTS) $<, \
-	  "$< on $(TARGET_NAME)")
+		  $(QEMU_OPTS) $<)
 
 run-plugin-%:
 	$(call run-test, $@, \
@@ -177,8 +177,7 @@ run-plugin-%:
 		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
 	   	  -plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
 	    	  -d plugin -D $*.pout \
-	   	  $(QEMU_OPTS) $(call strip-plugin,$<), \
-	  "$* on $(TARGET_NAME)")
+		  $(QEMU_OPTS) $(call strip-plugin,$<))
 endif
 
 gdb-%: %
diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index f6fcd4829e..84a9990f8d 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -50,8 +50,7 @@ run-memory-record: memory-record memory
 	  $(QEMU) -monitor none -display none \
 		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
 		  -icount shift=5$(COMMA)rr=record$(COMMA)rrfile=record.bin \
-	   	  $(QEMU_OPTS) memory, \
-	  "$< on $(TARGET_NAME)")
+		  $(QEMU_OPTS) memory)
 
 .PHONY: memory-replay
 run-memory-replay: memory-replay run-memory-record
@@ -59,8 +58,7 @@ run-memory-replay: memory-replay run-memory-record
 	  $(QEMU) -monitor none -display none \
 		  -chardev file$(COMMA)path=$<.out$(COMMA)id=output \
 		  -icount shift=5$(COMMA)rr=replay$(COMMA)rrfile=record.bin \
-	   	  $(QEMU_OPTS) memory, \
-	  "$< on $(TARGET_NAME)")
+		  $(QEMU_OPTS) memory)
 
 EXTRA_RUNS+=run-memory-replay
 
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index d6a74d24dc..9837a809dc 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -55,7 +55,7 @@ sha1-vector: CFLAGS=-O3
 sha1-vector: sha1.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 run-sha1-vector: sha1-vector run-sha1
-	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<)
 	$(call diff-out, sha1-vector, sha1.out)
 
 TESTS += sha1-vector
@@ -75,14 +75,14 @@ run-gdbstub-sysregs: sysregs
 		--gdb $(HAVE_GDB_BIN) \
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sve.py, \
-	"basic gdbstub SVE support")
+	basic gdbstub SVE support)
 
 run-gdbstub-sve-ioctls: sve-ioctls
 	$(call run-test, $@, $(GDB_SCRIPT) \
 		--gdb $(HAVE_GDB_BIN) \
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sve-ioctl.py, \
-	"basic gdbstub SVE ZLEN support")
+	basic gdbstub SVE ZLEN support)
 
 EXTRA_RUNS += run-gdbstub-sysregs run-gdbstub-sve-ioctls
 endif
diff --git a/tests/tcg/arm/Makefile.target b/tests/tcg/arm/Makefile.target
index 2f815120a5..b3b1504a1c 100644
--- a/tests/tcg/arm/Makefile.target
+++ b/tests/tcg/arm/Makefile.target
@@ -26,7 +26,7 @@ ARM_TESTS += fcvt
 fcvt: LDFLAGS+=-lm
 # fcvt: CFLAGS+=-march=armv8.2-a+fp16 -mfpu=neon-fp-armv8
 run-fcvt: fcvt
-	$(call run-test,fcvt,$(QEMU) $<,"$< on $(TARGET_NAME)")
+	$(call run-test,fcvt,$(QEMU) $<)
 	$(call diff-out,fcvt,$(ARM_SRC)/fcvt.ref)
 
 # PC alignment test
@@ -44,13 +44,12 @@ semihosting-arm: semihosting.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
 run-semihosting-arm: semihosting-arm
-	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
+	$(call run-test,$<,$(QEMU) $< 2> $<.err)
 
 run-plugin-semihosting-arm-with-%:
 	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
 		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
-		 $(call strip-plugin,$<) 2> $<.err, \
-		"$< on $(TARGET_NAME) with $*")
+		 $(call strip-plugin,$<) 2> $<.err)
 
 ARM_TESTS += semiconsole-arm
 
@@ -75,7 +74,7 @@ sha1-vector: CFLAGS=-O3
 sha1-vector: sha1.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 run-sha1-vector: sha1-vector run-sha1
-	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<, "$< on $(TARGET_NAME)")
+	$(call run-test, $<, $(QEMU) $(QEMU_OPTS) $<)
 	$(call diff-out, sha1-vector, sha1.out)
 
 ARM_TESTS += sha1-vector
diff --git a/tests/tcg/cris/Makefile.target b/tests/tcg/cris/Makefile.target
index e72d3cbdb2..372287bd03 100644
--- a/tests/tcg/cris/Makefile.target
+++ b/tests/tcg/cris/Makefile.target
@@ -56,4 +56,4 @@ SIMG:=cris-axis-linux-gnu-run
 
 # e.g.: make -f ../../tests/tcg/Makefile run-check_orm-on-sim
 run-%-on-sim:
-	$(call run-test, $<, $(SIMG) $<, "$< on $(TARGET_NAME) with SIM")
+	$(call run-test, $<, $(SIMG) $<)
diff --git a/tests/tcg/i386/Makefile.softmmu-target b/tests/tcg/i386/Makefile.softmmu-target
index 9b9038d0be..ed922d59c8 100644
--- a/tests/tcg/i386/Makefile.softmmu-target
+++ b/tests/tcg/i386/Makefile.softmmu-target
@@ -40,8 +40,7 @@ run-plugin-%-with-libinsn.so:
 		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
                   -plugin ../../plugin/libinsn.so$(COMMA)inline=on \
 	    	  -d plugin -D $*-with-libinsn.so.pout \
-	   	  $(QEMU_OPTS) $*, \
-		  "$* on $(TARGET_NAME)")
+		  $(QEMU_OPTS) $*)
 
 # Running
 QEMU_OPTS+=-device isa-debugcon,chardev=output -device isa-debug-exit,iobase=0xf4,iosize=0x4 -kernel
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index 599f192529..8af066efc5 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -53,7 +53,7 @@ test-i386-fprem.ref: test-i386-fprem
 
 run-test-i386-fprem: TIMEOUT=60
 run-test-i386-fprem: test-i386-fprem test-i386-fprem.ref
-	$(call run-test,test-i386-fprem, $(QEMU) $<,"$< on $(TARGET_NAME)")
+	$(call run-test,test-i386-fprem, $(QEMU) $<)
 	$(call diff-out,test-i386-fprem, test-i386-fprem.ref)
 else
 SKIP_I386_TESTS+=test-i386-fprem
@@ -63,8 +63,7 @@ endif
 run-plugin-%-with-libinsn.so:
 	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
 	       -plugin ../../plugin/libinsn.so$(COMMA)inline=on \
-	       -d plugin -D $*-with-libinsn.so.pout $*, \
-		"$* (inline) on $(TARGET_NAME)")
+	       -d plugin -D $*-with-libinsn.so.pout $*)
 
 # Update TESTS
 I386_TESTS:=$(filter-out $(SKIP_I386_TESTS), $(ALL_X86_TESTS))
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 6bba523729..78104f9bbb 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -26,7 +26,7 @@ float_%: float_%.c libs/float_helpers.c
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< $(MULTIARCH_SRC)/libs/float_helpers.c -o $@ $(LDFLAGS)
 
 run-float_%: float_%
-	$(call run-test,$<, $(QEMU) $(QEMU_OPTS) $<,"$< on $(TARGET_NAME)")
+	$(call run-test,$<, $(QEMU) $(QEMU_OPTS) $<)
 	$(call conditional-diff-out,$<,$(SRC_PATH)/tests/tcg/$(TARGET_NAME)/$<.ref)
 
 
@@ -42,13 +42,11 @@ signals: LDFLAGS+=-lrt -lpthread
 
 # default case (host page size)
 run-test-mmap: test-mmap
-	$(call run-test, test-mmap, $(QEMU) $<, \
-		"$< (default) on $(TARGET_NAME)")
+	$(call run-test, test-mmap, $(QEMU) $<, $< (default))
 
 # additional page sizes (defined by each architecture adding to EXTRA_RUNS)
 run-test-mmap-%: test-mmap
-	$(call run-test, test-mmap-$*, $(QEMU) -p $* $<,\
-		"$< ($* byte pages) on $(TARGET_NAME)")
+	$(call run-test, test-mmap-$*, $(QEMU) -p $* $<, $< ($* byte pages))
 
 ifneq ($(HAVE_GDB_BIN),)
 GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
@@ -58,21 +56,21 @@ run-gdbstub-sha1: sha1
 		--gdb $(HAVE_GDB_BIN) \
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/sha1.py, \
-	"basic gdbstub support")
+	basic gdbstub support)
 
 run-gdbstub-qxfer-auxv-read: sha1
 	$(call run-test, $@, $(GDB_SCRIPT) \
 		--gdb $(HAVE_GDB_BIN) \
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-qxfer-auxv-read.py, \
-	"basic gdbstub qXfer:auxv:read support")
+	basic gdbstub qXfer:auxv:read support)
 
 run-gdbstub-thread-breakpoint: testthread
 	$(call run-test, $@, $(GDB_SCRIPT) \
 		--gdb $(HAVE_GDB_BIN) \
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/test-thread-breakpoint.py, \
-	"hitting a breakpoint on non-main thread")
+	hitting a breakpoint on non-main thread)
 
 else
 run-gdbstub-%:
@@ -94,13 +92,13 @@ VPATH += $(MULTIARCH_SRC)/arm-compat-semi
 semihosting: CFLAGS+=-I$(SRC_PATH)/tests/tcg/$(TARGET_NAME)
 
 run-semihosting: semihosting
-	$(call run-test,$<,$(QEMU) $< 2> $<.err, "$< on $(TARGET_NAME)")
+	$(call run-test,$<,$(QEMU) $< 2> $<.err)
 
 run-plugin-semihosting-with-%:
 	$(call run-test, $@, $(QEMU) $(QEMU_OPTS) \
 		-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) \
 		 $(call strip-plugin,$<) 2> $<.err, \
-		"$< on $(TARGET_NAME) with $*")
+		$< with $*)
 
 semiconsole: CFLAGS+=-I$(SRC_PATH)/tests/tcg/$(TARGET_NAME)
 
diff --git a/tests/tcg/multiarch/system/Makefile.softmmu-target b/tests/tcg/multiarch/system/Makefile.softmmu-target
index 625ed792c6..368b64d531 100644
--- a/tests/tcg/multiarch/system/Makefile.softmmu-target
+++ b/tests/tcg/multiarch/system/Makefile.softmmu-target
@@ -25,7 +25,7 @@ run-gdbstub-memory: memory
 		--qargs \
 		"-monitor none -display none -chardev file$(COMMA)path=$<.out$(COMMA)id=output $(QEMU_OPTS)" \
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/memory.py, \
-	"softmmu gdbstub support")
+	softmmu gdbstub support)
 
 else
 run-gdbstub-%:
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 5e13a41c3f..c830313e67 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -41,7 +41,7 @@ run-gdbstub-signals-s390x: signals-s390x
 		--gdb $(HAVE_GDB_BIN) \
 		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
 		--bin $< --test $(S390X_SRC)/gdbstub/test-signals-s390x.py, \
-	"mixing signals and debugging on s390x")
+	mixing signals and debugging)
 
 EXTRA_RUNS += run-gdbstub-signals-s390x
 endif
diff --git a/tests/tcg/x86_64/Makefile.softmmu-target b/tests/tcg/x86_64/Makefile.softmmu-target
index 2afa3298bf..7207fee94c 100644
--- a/tests/tcg/x86_64/Makefile.softmmu-target
+++ b/tests/tcg/x86_64/Makefile.softmmu-target
@@ -40,8 +40,7 @@ run-plugin-%-with-libinsn.so:
 		  -chardev file$(COMMA)path=$@.out$(COMMA)id=output \
                   -plugin ../../plugin/libinsn.so$(COMMA)inline=on \
 	    	  -d plugin -D $*-with-libinsn.so.pout \
-	   	  $(QEMU_OPTS) $*, \
-		  "$* on $(TARGET_NAME)")
+		  $(QEMU_OPTS) $*)
 
 # Running
 QEMU_OPTS+=-device isa-debugcon,chardev=output -device isa-debug-exit,iobase=0xf4,iosize=0x4 -kernel
-- 
2.34.1
