Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j12sm3697753wrt.35.2020.02.26.07.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 07:27:19 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id ACD9C1FF87;
	Wed, 26 Feb 2020 15:27:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	f4bug@amsat.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] accel/tcg: remove link between guest ram and TCG cache size
Date: Wed, 26 Feb 2020 15:27:10 +0000
Message-Id: <20200226152710.31751-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2f1j8mtlJvXT

Basing the TB cache size on the ram_size was always a little heuristic
and was broken by a1b18df9a4 which caused ram_size not to be fully
realised at the time we initialise the TCG translation cache.

At the same time the default code generation size seems mainly set to
deal with the fact we use a static code buffer for CONFIG_USER to
avoid mmap allocation problems on constrained systems. So we:

  - only use a static code buffer on 32 bit systems
  - up the default buffer size for bigger systems
  - ignore the ram_size and just go with the default
  - document the fact tb-size is ignored for 32 bit linux-user

The could potentially slow down softmmu emulation on 32 bit systems
with lots (3gb?) of spare memory. Those users can still manually up
the tb-size via the command line if they do in fact exist.

Fixes: a1b18df9a4
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Igor Mammedov <imammedo@redhat.com>
---
 accel/tcg/translate-all.c | 23 ++++++++++-------------
 qemu-options.hx           |  3 ++-
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index a08ab11f657..cdfa2db7c56 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -891,11 +891,12 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
     }
 }
 
-#if defined(CONFIG_USER_ONLY)
-/* Currently it is not recommended to allocate big chunks of data in
-   user mode. It will change when a dedicated libc will be used.  */
-/* ??? 64-bit hosts ought to have no problem mmaping data outside the
-   region in which the guest needs to run.  Revisit this.  */
+#if defined(CONFIG_USER_ONLY) && TCG_TARGET_REG_BITS == 32
+/*
+ * For user mode on smaller 32 bit systems we may run into trouble
+ * allocating big chunks of data in the right place. On these systems
+ * we utilise a static code generation buffer directly in the binary.
+ */
 #define USE_STATIC_CODE_GEN_BUFFER
 #endif
 
@@ -927,7 +928,11 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
 # define MAX_CODE_GEN_BUFFER_SIZE  ((size_t)-1)
 #endif
 
+#if TCG_TARGET_REG_BITS == 32
 #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32u * 1024 * 1024)
+#else
+#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (2ul * 1024 * 1024 * 1024)
+#endif
 
 #define DEFAULT_CODE_GEN_BUFFER_SIZE \
   (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
@@ -937,15 +942,7 @@ static inline size_t size_code_gen_buffer(size_t tb_size)
 {
     /* Size the buffer.  */
     if (tb_size == 0) {
-#ifdef USE_STATIC_CODE_GEN_BUFFER
         tb_size = DEFAULT_CODE_GEN_BUFFER_SIZE;
-#else
-        /* ??? Needs adjustments.  */
-        /* ??? If we relax the requirement that CONFIG_USER_ONLY use the
-           static buffer, we could size this on RESERVED_VA, on the text
-           segment size of the executable, or continue to use the default.  */
-        tb_size = (unsigned long)(ram_size / 4);
-#endif
     }
     if (tb_size < MIN_CODE_GEN_BUFFER_SIZE) {
         tb_size = MIN_CODE_GEN_BUFFER_SIZE;
diff --git a/qemu-options.hx b/qemu-options.hx
index ac315c1ac45..0a4bbdb8eb9 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -139,7 +139,8 @@ irqchip completely is not recommended except for debugging purposes.
 @item kvm-shadow-mem=size
 Defines the size of the KVM shadow MMU.
 @item tb-size=@var{n}
-Controls the size (in MiB) of the TCG translation block cache.
+Controls the size (in MiB) of the TCG translation block cache. It has no effect on
+32 bit linux-user binaries.
 @item thread=single|multi
 Controls number of TCG threads. When the TCG is multi-threaded there will be one
 thread per vCPU therefor taking advantage of additional host cores. The default
-- 
2.20.1
