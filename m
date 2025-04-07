Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6426573njd;
        Mon, 7 Apr 2025 07:48:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:843:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-73b6aa6c7f6mr12855531b3a.12.1744037297428;
        Mon, 07 Apr 2025 07:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744037297; cv=none;
        d=google.com; s=arc-20240605;
        b=MPIRUZTEXdk5rC+ikWYuCwF5uxteNvmywrljr3mEpHncm2ztVGNtH0VWONS/1EIyu8
         8iTVtcOKrnGIxfM+kkn64c/63XmGxv98pWZST3W5C2WIN+AxINal4b+mMMtytpIAAXmb
         xmYarqVSWrObWPa4E3WfmfQtuPB2CHKc2a8levEvgGd+ZD0ru6Vi196Ma+qLay7kiUF4
         0qETcRks59LIpddcr95orE2I2osIcrF8a7qIDp8lMIf2L+yjcYuUihXhzsgI1tGWzqwu
         nITNogI1WyPf91bRlZRZX5idOmaVZ9k5fxrBZXVZ9iSfTrna7I3ZH0uCw+LMauC61Zwc
         Fwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fW8XIKfaYZtOTkzwtpemEa+AlpQFv1wOG7n/PEjrSqI=;
        fh=MU98CxdXJsaZsm6ccBycn0l265M5G1AMXkcNFO7SuD8=;
        b=G/9OhoHDpOX1lSuZwIyNN1ehPu3726YAP4t5Hxn4XNPoePZ5PxNCFNyaPQih6nVNLo
         rgBxhnip3aYZIId/+57PAA0Qfg4FsQ5/Sov5PFIF6nokxUfMUdcJXLgfTVaIzQuaA345
         bpjNExRzMBJP2enmFP/TSSlDTLXmpwPNJ227FyyDjwCZZzmTKFDsnNsBxhiR6d/RxA5a
         OybNer/R5GdGU4jRUmRdf3F27OsCRoL4S9PZp7jQKhKUgSb+iuk4fsQ245AbpSzod50H
         A6evZxugyHXRgmc+5MEaCH/yVMFUmVZM7VyTW7TspBN33vjZPHvuOuyf0RhdE0rCkiR4
         uPcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="CdWPN/bG";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-739d97f381esor7070387b3a.4.2025.04.07.07.48.17
        (Google Transport Security);
        Mon, 07 Apr 2025 07:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="CdWPN/bG";
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037297; x=1744642097; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fW8XIKfaYZtOTkzwtpemEa+AlpQFv1wOG7n/PEjrSqI=;
        b=CdWPN/bGtPIz2lhL3huCIDYbfAAVn3VynACJebEbX2q2AvRQvv06o5Vwj2LVFP9X4X
         c3FEO0Xa4GjyA9cf9QljViAn2cKlYCUBB1RGjQuNJW6k47n2HqsjdRxROiB0DuICuhXZ
         VPkGolJpf7SWxuG+Q1MzpjACTMpeMUVKnjQHLUuwCLd9c6wg7EZKKQ3iUFvGpKb+SlvS
         treNfmMtmRE5kbKHcQYj6fdwnlSkLnTwfUXOL8SW1386tzalCSH22KTnhlzo0Ws22YXJ
         7lw/idHDBwDyflf3n1A0qH+lAoGDbGpAYSoDEoLP8MRzpeoMnB70fkEFhbjG7t3Xu1RT
         3bPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037297; x=1744642097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fW8XIKfaYZtOTkzwtpemEa+AlpQFv1wOG7n/PEjrSqI=;
        b=JvpKpYqEcWgtU7twby0XR/YU9VujlwhmgcjatpTor0XkAkF7Fs6sSiQ4AkFcPxC5Dk
         fmivfQ4r4SCBY5+KHtP5o8JaKW53q8Xts9jqQxharKV3FtI/rCqANhdKLifLD1WOQJwJ
         ZZEx8MKW3dW8Iu1bZjPKNYKwDqYLlG6soxMKokueR4JsNbvQYaMRI2P5DdbCve/nnStU
         awQceZvjKdHOJ9e7QLD9Qm5sQdy/ezFsrK6MwrITrbwoX9CTOUTm58sE9BddWNORQRW2
         dWAE6VIWyDof5c6xCx1fVyMOPSal/NQTKntjS6Vv/DID0PUQoB0N3lQQlnVf2CnqMvzR
         Pj1w==
X-Forwarded-Encrypted: i=1; AJvYcCUAH1pd99AjonYtJn2Ib9nwmnRHs+39wmi7X0tbODV2Paj/huffKWmd27ocRPYIUi2lWyb0CqeT@linaro.org, AJvYcCVoG0T7DRJxR7s/UerwsaKg8DLKMkyhPK98b9r3kn3zOoaIJmoeb2IpwLPaMx8rreI4K9MRM3ZsPOF2VePt@linaro.org, AJvYcCWg7WOVfclZeFqsU5pGv8R3Fyg6IH4QXZrlSsYkBEzdmUC++uVXhPPOK7im1BhWNEcb+7ZUcxVHuiQ3Tt5IVdjjuSM=@linaro.org
X-Gm-Message-State: AOJu0Yys5HZDcHBL4ZaTjEayIhQaDsefqNbbOUprmj4Y2v1BFyDtk1rC
	IN+qa8B2ct7y4ZARFdmkMexy4Baviss23TXZ8pQ+kGD8Ixupd/QA
X-Gm-Gg: ASbGncukhxaloBJB/jQwj3PiyePNL/P/KwfTAMeetPYnnOM6oad3sJnNzk8GAWwX93l
	hXmYpScXB5+tvlPP8I1U3w6+okK2Hcda/0TTf7xjCw172auBcCGxRKHm4Zmkmv4TwC2gNrLj5zq
	PkLvnS9WwGC6LYBKTnkwUYL+4damjvlqGoV46quNaJXU1oVkX5rEZcmanJOYu+YG63Wg7s3Vvq4
	v4Wz6z5lBOXrdjxresm/Cj4GxRNCQmhrUNnam1aKq6iOPe5KfjyZiVVczn0eGHSKaLziIuHk6el
	gzsUImvxJsQENyG+5Jef0AE87wC24hGco3CQU7phYZzISWE/sPsDqGomLhDKkw==
X-Google-Smtp-Source: AGHT+IEf/31V+SpzPJuGAwERtSZYT3VmroA5Y689cGqjAR92zXSAv+cv0eNY3KphtMS3srkYGNEyog==
X-Received: by 2002:a05:6a00:3922:b0:736:fff2:99b with SMTP id d2e1a72fcca58-73b6b8f7d08mr11175167b3a.23.1744037296768;
        Mon, 07 Apr 2025 07:48:16 -0700 (PDT)
Return-Path: <ktokunaga.mail@gmail.com>
Received: from localhost.localdomain ([240d:1a:3b6:8b00:8768:486:6a8e:e855])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ef3c2sm8856960b3a.59.2025.04.07.07.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:48:16 -0700 (PDT)
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Greg Kurz <groug@kaod.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH 06/10] include/exec: Allow using 64bit guest addresses on emscripten
Date: Mon,  7 Apr 2025 23:45:57 +0900
Message-Id: <04ab0a8c2ab61c47530f77b149ad29123a0ee382.1744032780.git.ktokunaga.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1744032780.git.ktokunaga.mail@gmail.com>
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WbB9VvqPV62P

To enable 64-bit guest support in Wasm 32bit memory model today, it was
necessary to partially revert recent changes that removed support for
different pointer widths between the host and guest (e.g., commits
a70af12addd9060fdf8f3dbd42b42e3072c3914f and
bf455ec50b6fea15b4d2493059365bf94c706273) when compiling with
Emscripten. While this serves as a temporary workaround, a long-term
solution could involve adopting Wasm's 64-bit memory model once it gains
broader support, as it is currently not widely adopted (e.g., unsupported by
Safari and libffi).

Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
---
 accel/tcg/cputlb.c        |  8 ++++----
 include/exec/tlb-common.h | 14 ++++++++++----
 include/exec/vaddr.h      | 11 +++++++++++
 include/qemu/atomic.h     |  4 ++++
 meson.build               |  8 +++++---
 5 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index fb22048876..8f8f5c19c4 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -104,13 +104,13 @@ static inline uint64_t tlb_read_idx(const CPUTLBEntry *entry,
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
diff --git a/meson.build b/meson.build
index bcf1e33ddf..343408636b 100644
--- a/meson.build
+++ b/meson.build
@@ -3304,9 +3304,11 @@ foreach target : target_dirs
 
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
2.25.1
