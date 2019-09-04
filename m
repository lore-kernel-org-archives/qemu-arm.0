Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 74sm165778wma.15.2019.09.04.13.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 13:30:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B799D1FF91;
	Wed,  4 Sep 2019 21:30:13 +0100 (BST)
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
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v1 04/42] tests/tcg: use EXTRA_CFLAGS everywhere
Date: Wed,  4 Sep 2019 21:29:35 +0100
Message-Id: <20190904203013.9028-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904203013.9028-1-alex.bennee@linaro.org>
References: <20190904203013.9028-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: SMnxdyapc6rs

From: Paolo Bonzini <pbonzini@redhat.com>

For i386 specifically, this allows using the host GCC
to compile the i386 tests.  But, it should really be
done for all targets, unless we want to pass $(EXTRA_CFLAGS)
directly as part of $(CC).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20190807143523.15917-2-pbonzini@redhat.com>
---
 tests/tcg/aarch64/Makefile.softmmu-target | 4 ++--
 tests/tcg/alpha/Makefile.softmmu-target   | 4 ++--
 tests/tcg/arm/Makefile.softmmu-target     | 2 +-
 tests/tcg/i386/Makefile.softmmu-target    | 4 ++--
 tests/tcg/minilib/Makefile.target         | 2 +-
 tests/tcg/xtensa/Makefile.softmmu-target  | 4 ++--
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 2e560e4d08e..4c4aaf61dd3 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -22,11 +22,11 @@ LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 .PRECIOUS: $(CRT_OBJS)
 
 %.o: $(CRT_PATH)/%.S
-	$(CC) $(CFLAGS) -x assembler-with-cpp -c $< -o $@
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -x assembler-with-cpp -c $< -o $@
 
 # Build and link the tests
 %: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
-	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
diff --git a/tests/tcg/alpha/Makefile.softmmu-target b/tests/tcg/alpha/Makefile.softmmu-target
index 3c0f34cc692..09193a62d68 100644
--- a/tests/tcg/alpha/Makefile.softmmu-target
+++ b/tests/tcg/alpha/Makefile.softmmu-target
@@ -22,11 +22,11 @@ LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 .PRECIOUS: $(CRT_OBJS)
 
 %.o: $(CRT_PATH)/%.S
-	$(CC) $(CFLAGS) -x assembler-with-cpp -c $< -o $@
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -x assembler-with-cpp -c $< -o $@
 
 # Build and link the tests
 %: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
-	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=0
 
diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
index 49d48d8a1c3..2deb06e6e46 100644
--- a/tests/tcg/arm/Makefile.softmmu-target
+++ b/tests/tcg/arm/Makefile.softmmu-target
@@ -18,7 +18,7 @@ CFLAGS+=-Wl,--build-id=none -x assembler-with-cpp
 LDFLAGS+=-nostdlib -N -static
 
 %: %.S %.ld
-	$(CC) $(CFLAGS) $(ASFLAGS) $< -o $@ $(LDFLAGS) -T $(ARM_SRC)/$@.ld
+	$(CC) $(CFLAGS) $(ASFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) -T $(ARM_SRC)/$@.ld
 
 # Specific Test Rules
 
diff --git a/tests/tcg/i386/Makefile.softmmu-target b/tests/tcg/i386/Makefile.softmmu-target
index 0a4364868ce..cee342017e5 100644
--- a/tests/tcg/i386/Makefile.softmmu-target
+++ b/tests/tcg/i386/Makefile.softmmu-target
@@ -32,11 +32,11 @@ TESTS+=$(MULTIARCH_TESTS)
 .PRECIOUS: $(CRT_OBJS)
 
 %.o: $(CRT_PATH)/%.S
-	$(CC) $(CFLAGS) -c $< -o $@
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c $< -o $@
 
 # Build and link the tests
 %: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
-	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
diff --git a/tests/tcg/minilib/Makefile.target b/tests/tcg/minilib/Makefile.target
index 3ed8077d0f9..c821d2806a9 100644
--- a/tests/tcg/minilib/Makefile.target
+++ b/tests/tcg/minilib/Makefile.target
@@ -18,4 +18,4 @@ MINILIB_INC=-isystem $(SYSTEM_MINILIB_SRC)
 .PRECIOUS: $(MINILIB_OBJS)
 
 %.o: $(SYSTEM_MINILIB_SRC)/%.c
-	$(CC) $(CFLAGS) -c $< -o $@
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c $< -o $@
diff --git a/tests/tcg/xtensa/Makefile.softmmu-target b/tests/tcg/xtensa/Makefile.softmmu-target
index 8212d96b81d..9530cac2ad9 100644
--- a/tests/tcg/xtensa/Makefile.softmmu-target
+++ b/tests/tcg/xtensa/Makefile.softmmu-target
@@ -34,9 +34,9 @@ $(XTENSA_USABLE_TESTS): linker.ld macros.inc $(CRT) Makefile.softmmu-target
 
 # special rule for common blobs
 %.o: %.S
-	$(CC) $(XTENSA_INC) $($*_ASFLAGS) $(ASFLAGS) -c $< -o $@
+	$(CC) $(XTENSA_INC) $($*_ASFLAGS) $(ASFLAGS) $(EXTRA_CFLAGS) -c $< -o $@
 
 %: %.S
-	$(CC) $(XTENSA_INC) $(ASFLAGS) $< -o $@ $(LDFLAGS) $(NOSTDFLAGS) $(CRT)
+	$(CC) $(XTENSA_INC) $(ASFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) $(NOSTDFLAGS) $(CRT)
 
 endif
-- 
2.20.1
