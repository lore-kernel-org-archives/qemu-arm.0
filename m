Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp476079njc;
        Tue, 20 May 2025 05:54:26 -0700 (PDT)
X-Received: by 2002:a17:90b:1f8b:b0:30a:2007:65b6 with SMTP id 98e67ed59e1d1-30e83235af7mr17961845a91.34.1747745666564;
        Tue, 20 May 2025 05:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747745666; cv=none;
        d=google.com; s=arc-20240605;
        b=KJx/ojYAW+NPCGTMGJgiwAeCGLuL9cl7GzaFnqVmFcIeuQLvM/awYbjEZcG8BxfWGR
         UglwMB5YJsLlbquAU+SnSnaoIwuEe8G+3zowhG6F1bhIteKpbLBlhMxMGplBvkI6XshA
         voQqCQTPh9VF8duE7UxQ9/INtMIfvXUNH+MJsvjA+eQrEbbtsTnB8qkoG0a+eQIDaXXX
         xZi6zdesVoeJoEFNE33pqT3Z6QSBOdPQwOnwx9zbsBj3IP4tUhww/Ko9H1vLLQyRv6Ku
         Y6wttyHX10Dd03NF/Ah1o+dB5yc92GU+Azk9eVTueI4AK+9Enaab8w6hoUOg3eMc5ZcE
         qsSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CvwVU9F6cQaGXnx8rRhBrrA5oqA9zp4XDJF1ywgSwYE=;
        fh=I5jdQO/9LPET3tutA1MmDGXthUpFkEeQnWgsMl+jA7A=;
        b=RQuKp1v9HcYRLtMysXXdgNAobZ93clY6f/uyCtDVHbsU3FXHbJzAtTH+uGGOvn1N4H
         0hyAo5S8oukDJeal6vrrBx7JHOVtWXljgzjFgxHYJe/QBEqCUt4g097UpAugtjAoCdG0
         dtQmY5uf5j4MefIzeuzq9ZjQjhLzEeqDzkoQPT/0ZAAwuAh4cwXxeK9zsVg6WRr3XqZT
         PUUHuoHMUqgqkl5c1Lz2D6OJC11LHnqWoCaT+jU49/A6pxzRY65zi2+lSYAcuLhOmnPu
         Xhuu78Yg5vcbqeP+wCnSd/rZ51cjVpINgHLMFtxQxzls7Kq8bT6+RMQlMUjBtvS+oYJC
         ZKJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ltdOFkhU;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30e7d5909d8sor7433408a91.6.2025.05.20.05.54.26
        (Google Transport Security);
        Tue, 20 May 2025 05:54:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=ltdOFkhU;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745666; x=1748350466; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvwVU9F6cQaGXnx8rRhBrrA5oqA9zp4XDJF1ywgSwYE=;
        b=ltdOFkhUabaWA2uE25lnmwRumX/hDCeryNIOLduHY0mGdZikx2iSott/tl9gAJrdXJ
         kOQmu0phvhR3WlR8e2BZENwkB3UvvrDiT6yG0lhRYFqrmtiSrNv5XVheu4kvGafak5qc
         AJUNJqJ7fFS7WYqrasgYN8Ij0c0LE/NbeKJm1qMCdvT3J+BO1Br08pBKkGHha6FSyws7
         22xSB6m37DAtZ5WdKEcbQOF9wmfrTKz83gTBCVDq934xwXpEZGWoXCmITiMLy0lgUBZz
         ExK+sV4cVWKesS+U1hmRirXgcKd1ur0Zn0mAB0bNIxbhAJrj33Z3U8NskLAAYZ0TEtKd
         xbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745666; x=1748350466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvwVU9F6cQaGXnx8rRhBrrA5oqA9zp4XDJF1ywgSwYE=;
        b=c25yDjEcnYMXgnUFCuE62uJk7Peqnmm0NsVn2ud022fGunf8GW4Yxxv8+7yLg5x0C7
         W5IPcgmFlX16ArJfkkoFcTvaOgOxWSTUzTn/iTrUm03+1sTQYoVNtIrB+1/pHLe5GB5w
         kuSsHOOGA4Jnd63jk9JcqaSeFzIELVJYJVn3XYAKSFPuZZ2Gy8zVJDRMDU9n4MW00GCH
         FwJwIvJommOiotg3oXy+VuDYlyxbsJ5jRMXR4hEuyf1z8Jk7zMsTgnM9DLPhXOjffDVM
         VD6nhOyWlPW4o6yai4vkGuoPpvyL3DHBFrLABr0JT7hYgQCPuad8k6rbXerQAQPZezNV
         FP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUatMl6tD/67F6tb6/PvjX8117nB6sAoQPqSs3e9i2a83Euw6C3ytvMHXlktpi01uuHJu+oz/rCNtncwi7G5cqgyl0=@linaro.org, AJvYcCVH0I0YS1GoHAWi/FT3UghI81ZvKfoMy6pc8gaV+OTWDjdHOSnNYxdPex+io0gxqp/VyjQQRO8=@linaro.org, AJvYcCVv4HjWRvqIurGLCzY5twXMN3tzhqhNu7qQEo7eFRFcViJ8OIVC/YX5gGM/+ngkaMiHdjVswhQJNuJuZLmaQPW2UA==@linaro.org
X-Gm-Message-State: AOJu0YylOAIrOOQmZpx+qe2UTyKpuf93yzBZeMErsxCZ5zdsjSG8UANt
	6Gzw9Ij2yju0+nA0POJUnOXPNr73uoCk1tbOGM1lGiWk8tbgrqm2oM0O
X-Gm-Gg: ASbGncuV/+2tcGEnlpbbktG9PqtFIuOO6PjKND1CygVhw7g72zkPi6uVoUYa8sm7KGm
	qMAMPMMPcVoANMqkuIgd63V8IjxoSgmNGOI5KWyTZqCkTmYUFwvVZiM1OnSs6qRa7eE6Ujwzm07
	6r4zC97veQbEbCVs0FH8MOe5OrFMUgKTn8VFLjybP07dLX6SZ0kjGm+CadZcRCWWuyOQKCghvlR
	rdEhUjwljBuYnqCDyHRep6urORevOJgBt50qvmpOWnMBQX1qCYj3HeMJtqqzAbn4JD1C2FtYFBv
	z+h4+oTZN8vufIw1hTf8y1w6i/4iGs/QtSiyt+/CUbhPkA607TA=
X-Google-Smtp-Source: AGHT+IHUv1Ky3GKBjVeftojRctD7ekQgFkcQPAUZGG0rypCRZbOSLLaaaceS/2YOW575tisr9dvdyA==
X-Received: by 2002:a17:90b:3c90:b0:30e:37be:6963 with SMTP id 98e67ed59e1d1-30e83228d1cmr24997945a91.29.1747745665822;
        Tue, 20 May 2025 05:54:25 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from ktock.. ([240d:1a:3b6:8b00:1bde:8310:e993:5dcc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36364f9asm1625916a91.4.2025.05.20.05.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:54:25 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	WANG Xuerui <git@xen0n.name>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 23/33] include/exec: Allow using 64bit guest addresses on emscripten
Date: Tue, 20 May 2025 21:51:25 +0900
Message-ID: <d3e7e584cf61c76952f4c9d913ba80d905c80e76.1747744132.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747744132.git.ktokunaga.mail@gmail.com>
References: <cover.1747744132.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: sZBbu84zpW3A

To enable 64-bit guest support in Wasm 32bit memory model today, it was
necessary to partially revert recent changes that removed support for
different pointer widths between the host and guest (e.g. commits
a70af12addd9060fdf8f3dbd42b42e3072c3914f and
bf455ec50b6fea15b4d2493059365bf94c706273) when compiling with
Emscripten. While this serves as a temporary workaround, a long-term
solution could involve adopting Wasm's 64-bit memory model once it gains
broader support, as it is currently not widely adopted (e.g. unsupported by
Safari and libffi).

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 accel/tcg/cputlb.c             |  8 ++++----
 include/exec/helper-head.h.inc |  6 ++++++
 include/exec/tlb-common.h      | 14 ++++++++++----
 include/exec/vaddr.h           | 11 +++++++++++
 include/qemu/atomic.h          |  4 ++++
 include/tcg/tcg.h              |  4 ++++
 meson.build                    |  8 +++++---
 7 files changed, 44 insertions(+), 11 deletions(-)

V1:
- Although I tried to use "#if HOST_LONG_BITS >= TARGET_LONG_BITS" based on
  Paolo's suggestion from the previous patch series, TARGET_LONG_BITS is
  marked as poisoned in include/exec/poison.h and cannot be used directly.

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 5f6d7c601c..b15e9e80ee 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -109,13 +109,13 @@ static inline uint64_t tlb_read_idx(const CPUTLBEntry *entry,
 {
     /* Do not rearrange the CPUTLBEntry structure members. */
     QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_read) !=
-                      MMU_DATA_LOAD * sizeof(uintptr_t));
+                      MMU_DATA_LOAD * sizeof(tlb_addr));
     QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_write) !=
-                      MMU_DATA_STORE * sizeof(uintptr_t));
+                      MMU_DATA_STORE * sizeof(tlb_addr));
     QEMU_BUILD_BUG_ON(offsetof(CPUTLBEntry, addr_code) !=
-                      MMU_INST_FETCH * sizeof(uintptr_t));
+                      MMU_INST_FETCH * sizeof(tlb_addr));
 
-    const uintptr_t *ptr = &entry->addr_idx[access_type];
+    const tlb_addr *ptr = &entry->addr_idx[access_type];
     /* ofs might correspond to .addr_write, so use qatomic_read */
     return qatomic_read(ptr);
 }
diff --git a/include/exec/helper-head.h.inc b/include/exec/helper-head.h.inc
index 5b248fd713..7dfb4cfa46 100644
--- a/include/exec/helper-head.h.inc
+++ b/include/exec/helper-head.h.inc
@@ -58,6 +58,7 @@
 # define dh_ctype_tl target_ulong
 #endif /* COMPILING_PER_TARGET */
 
+#ifndef EMSCRIPTEN
 #if __SIZEOF_POINTER__ == 4
 # define dh_alias_vaddr i32
 # define dh_typecode_vaddr dh_typecode_i32
@@ -68,6 +69,11 @@
 # error "sizeof pointer is different from {4,8}"
 #endif /* __SIZEOF_POINTER__ */
 # define dh_ctype_vaddr uintptr_t
+#else
+# define dh_alias_vaddr i64
+# define dh_typecode_vaddr dh_typecode_i64
+# define dh_ctype_vaddr uint64_t
+#endif
 
 /* We can't use glue() here because it falls foul of C preprocessor
    recursive expansion rules.  */
diff --git a/include/exec/tlb-common.h b/include/exec/tlb-common.h
index 03b5a8ffc7..679054bb44 100644
--- a/include/exec/tlb-common.h
+++ b/include/exec/tlb-common.h
@@ -19,14 +19,20 @@
 #ifndef EXEC_TLB_COMMON_H
 #define EXEC_TLB_COMMON_H 1
 
+#ifndef EMSCRIPTEN
 #define CPU_TLB_ENTRY_BITS (HOST_LONG_BITS == 32 ? 4 : 5)
+typedef uintptr_t tlb_addr;
+#else
+#define CPU_TLB_ENTRY_BITS 5
+typedef uint64_t tlb_addr;
+#endif
 
 /* Minimalized TLB entry for use by TCG fast path. */
 typedef union CPUTLBEntry {
     struct {
-        uintptr_t addr_read;
-        uintptr_t addr_write;
-        uintptr_t addr_code;
+        tlb_addr addr_read;
+        tlb_addr addr_write;
+        tlb_addr addr_code;
         /*
          * Addend to virtual address to get host address.  IO accesses
          * use the corresponding iotlb value.
@@ -37,7 +43,7 @@ typedef union CPUTLBEntry {
      * Padding to get a power of two size, as well as index
      * access to addr_{read,write,code}.
      */
-    uintptr_t addr_idx[(1 << CPU_TLB_ENTRY_BITS) / sizeof(uintptr_t)];
+    tlb_addr addr_idx[(1 << CPU_TLB_ENTRY_BITS) / sizeof(tlb_addr)];
 } CPUTLBEntry;
 
 QEMU_BUILD_BUG_ON(sizeof(CPUTLBEntry) != (1 << CPU_TLB_ENTRY_BITS));
diff --git a/include/exec/vaddr.h b/include/exec/vaddr.h
index 28bec632fb..ff57f944dd 100644
--- a/include/exec/vaddr.h
+++ b/include/exec/vaddr.h
@@ -9,6 +9,7 @@
  * We do not support 64-bit guest on 32-host and detect at configure time.
  * Therefore, a host pointer width will always fit a guest pointer.
  */
+#ifndef EMSCRIPTEN
 typedef uintptr_t vaddr;
 #define VADDR_PRId PRIdPTR
 #define VADDR_PRIu PRIuPTR
@@ -16,5 +17,15 @@ typedef uintptr_t vaddr;
 #define VADDR_PRIx PRIxPTR
 #define VADDR_PRIX PRIXPTR
 #define VADDR_MAX UINTPTR_MAX
+#else
+/* Explicitly define this as 64bit on emscripten */
+typedef uint64_t vaddr;
+#define VADDR_PRId PRId64
+#define VADDR_PRIu PRIu64
+#define VADDR_PRIo PRIo64
+#define VADDR_PRIx PRIx64
+#define VADDR_PRIX PRIX64
+#define VADDR_MAX UINT64_MAX
+#endif
 
 #endif
diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index f80cba24cf..76a8fbcd8c 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -56,6 +56,7 @@
  */
 #define signal_barrier()    __atomic_signal_fence(__ATOMIC_SEQ_CST)
 
+#ifndef EMSCRIPTEN
 /*
  * Sanity check that the size of an atomic operation isn't "overly large".
  * Despite the fact that e.g. i686 has 64-bit atomic operations, we do not
@@ -63,6 +64,9 @@
  * bit of sanity checking that other 32-bit hosts might build.
  */
 #define ATOMIC_REG_SIZE  sizeof(void *)
+#else
+#define ATOMIC_REG_SIZE  8 /* wasm supports 64bit atomics */
+#endif
 
 /* Weak atomic operations prevent the compiler moving other
  * loads/stores past the atomic operation load/store. However there is
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 041d8035bc..62bc2c4ea8 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -218,6 +218,7 @@ typedef struct TCGv_ptr_d *TCGv_ptr;
 typedef struct TCGv_vec_d *TCGv_vec;
 typedef TCGv_ptr TCGv_env;
 
+#ifndef EMSCRIPTEN
 #if __SIZEOF_POINTER__ == 4
 typedef TCGv_i32 TCGv_vaddr;
 #elif __SIZEOF_POINTER__ == 8
@@ -225,6 +226,9 @@ typedef TCGv_i64 TCGv_vaddr;
 #else
 # error "sizeof pointer is different from {4,8}"
 #endif /* __SIZEOF_POINTER__ */
+#else
+typedef TCGv_i64 TCGv_vaddr;
+#endif
 
 /* call flags */
 /* Helper does not read globals (either directly or through an exception). It
diff --git a/meson.build b/meson.build
index c533243157..f6ed867819 100644
--- a/meson.build
+++ b/meson.build
@@ -3322,9 +3322,11 @@ foreach target : target_dirs
 
   target_kconfig = []
   foreach sym: accelerators
-    # Disallow 64-bit on 32-bit emulation and virtualization
-    if host_long_bits < config_target['TARGET_LONG_BITS'].to_int()
-      continue
+    if host_arch != 'wasm32'
+      # Disallow 64-bit on 32-bit emulation and virtualization
+      if host_long_bits < config_target['TARGET_LONG_BITS'].to_int()
+        continue
+      endif
     endif
     if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
       config_target += { sym: 'y' }
-- 
2.43.0
