Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2537780wrt;
        Sun, 13 Jan 2019 17:24:11 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5JHRt4s/zzGdr0uwniV4qgMy/ffCx/J5NqC/53INU8zWSNVuPitzce/ArfUhAAwMrUeqfP
X-Received: by 2002:a5d:494a:: with SMTP id r10mr22809075wrs.272.1547429051484;
        Sun, 13 Jan 2019 17:24:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547429051; cv=none;
        d=google.com; s=arc-20160816;
        b=fsX6SjlDR+K6Irdld3RUAYYgrpLSe/fuAIhF0iISSQLZFe8bP/2GRjWGHVhI0501yC
         5xNWmGmJhXs4oNEjAroWq7KVoPp07NJ1FojiVGTCt4k1tCy4Cpx20akizyTDQ1WX/tuL
         tfYs9OR1JbGf4i3btvIVz96bMb+UawPQgKN1r6TuTa/JPNc+1g/E9kix9GuGK5vugMQ8
         ie7cWySmFvoXHxcDqtJePCimR1SptVg/27KBjv8B6vhVH1JXBH7MvHby8aQMNH2io3YN
         zhtp9CdytApomC3vT8kwu0IraSrQ5wOY/ykAtZDYoVaMapHCNiczd5x+OP5CUjG/mhF2
         O/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=QEnnJ0lnXGNqeUVPB5fOxxV2hOiG+cnB1X7vEWDXqS0=;
        b=qD8mZeyJ91BIBqWuhVWuG7RRzeQGRXA6PfYTZ7umI2aVryMK8Gbuwo3EpwrDtrirf5
         /zrpPMPkeq9g23/r0mhaq1eccLujC4w2WtA5/w0YCcpTKwUjzV1oflFWN/K/YYEfClHZ
         YRRIdDhdD4Te1fbxZh9kDZ6+f+eXzeCbZGjIwMcZGw0Mo+iWILhe2eJvkiBX8N/Xa6G/
         /tETUmvfmEbmdyGQA/9FT8vGe13XvGSVBAkTYYGSMvWa0ah2v7ETesDQgFIFsgZ2vpUW
         44yP4n1aKhni9H4E78xOrPorHv3SNI2YpwIFUnvHHQ344oIEtW5rs6tfyXfxJIT8iWSc
         d7Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DwWoYC8H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si5643489wrd.354.2019.01.13.17.24.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:24:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DwWoYC8H;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqz4-00065y-Co
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:24:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqni-000653-38
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqnZ-00016v-1M
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:21 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37008)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqnY-00016a-Rb
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:12:16 -0500
Received: by mail-pg1-x543.google.com with SMTP id c25so8739326pgb.4
	for <qemu-devel@nongnu.org>; Sun, 13 Jan 2019 17:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QEnnJ0lnXGNqeUVPB5fOxxV2hOiG+cnB1X7vEWDXqS0=;
	b=DwWoYC8HbRPzOlRLwQsLFonSKFOPmWhpB51Y7KnksUeC/e7ZlwkyHiZo+qyZDNtKdq
	4FL7XWzI8hQfYWMPgBaDFaaGMudBZyJEUdzbEZfUceONUkRyi3MrMhNVOi+fpY4g/NzB
	iAsL4wU1+haZCDKwNjEZZXn3rMzgmKtMvpTEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QEnnJ0lnXGNqeUVPB5fOxxV2hOiG+cnB1X7vEWDXqS0=;
	b=GslDnE3Tmpxxfm/uHkAwPs7vZDr+p67ghaz42tMOUfbYCr46wrIvAXje95LWQZEn93
	ruzUUVFnvycQtJ4Znzi/FdLkbOpwwIy+GKCzK5nuOsD8f+yh22Oc/1JfoO1FrMy6RJA6
	X4M1BBjtJ2BJ99oJpD9O5kOqco7xEcD3+S3D6yR/pmydznoOpJjyY4M0hfFm9WMddOdS
	DAStOYg1qxgn1e6JJE8N1lkJ/kJ8u3lHBDi4jDPzCF3KsfPZiJQT78Tp/o0EjTOWxcLi
	Q52NPyfkP+eMbZYH726SyTc87BoYHBfsttNKWNH79b0cwy0h7n4hpgDpRrQozR6g96cY
	OLjw==
X-Gm-Message-State: AJcUukc6e7ouH7ph/G2akX3dBf3TL7kakVT+q1UmrgnmiQT9OfO5seaH
	brgvV6NN1gSbzB+L/C0UANqC7xN7XqB+xQ==
X-Received: by 2002:a63:ed42:: with SMTP id m2mr21204447pgk.147.1547428335527; 
	Sun, 13 Jan 2019 17:12:15 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.12.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:12:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:19 +1100
Message-Id: <20190114011122.5995-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH 14/17] tcg: Introduce target-specific page data
 for user-only
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uH06ZQ1p+UDu

At the same time, remember MAP_SHARED as PAGE_SHARED.  When mapping
new pages, make sure that old target-specific page data is removed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h    | 10 ++++++++--
 accel/tcg/translate-all.c | 28 ++++++++++++++++++++++++++++
 linux-user/mmap.c         | 10 ++++++++--
 linux-user/syscall.c      |  4 ++--
 4 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 117d2fbbca..92ec47dc79 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -244,10 +244,14 @@ extern intptr_t qemu_host_page_mask;
 #define PAGE_WRITE_ORG 0x0010
 /* Invalidate the TLB entry immediately, helpful for s390x
  * Low-Address-Protection. Used with PAGE_WRITE in tlb_set_page_with_attrs() */
-#define PAGE_WRITE_INV 0x0040
+#define PAGE_WRITE_INV 0x0020
+/* Page is mapped shared.  */
+#define PAGE_SHARED    0x0040
+/* For use with page_set_flags: page is being replaced; target_data cleared. */
+#define PAGE_RESET     0x0080
 #if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
 /* FIXME: Code that sets/uses this is broken and needs to go away.  */
-#define PAGE_RESERVED  0x0020
+#define PAGE_RESERVED  0x0100
 #endif
 
 #if defined(CONFIG_USER_ONLY)
@@ -260,6 +264,8 @@ int walk_memory_regions(void *, walk_memory_regions_fn);
 int page_get_flags(target_ulong address);
 void page_set_flags(target_ulong start, target_ulong end, int flags);
 int page_check_range(target_ulong start, target_ulong len, int flags);
+void *page_get_target_data(target_ulong address);
+void *page_alloc_target_data(target_ulong address, size_t size);
 #endif
 
 CPUArchState *cpu_copy(CPUArchState *env);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 639f0b2728..047cd2f50d 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -111,6 +111,7 @@ typedef struct PageDesc {
     unsigned int code_write_count;
 #else
     unsigned long flags;
+    void *target_data;
 #endif
 #ifndef CONFIG_USER_ONLY
     QemuSpin lock;
@@ -2477,6 +2478,7 @@ int page_get_flags(target_ulong address)
 void page_set_flags(target_ulong start, target_ulong end, int flags)
 {
     target_ulong addr, len;
+    bool reset_target_data;
 
     /* This function should never be called with addresses outside the
        guest address space.  If this assert fires, it probably indicates
@@ -2493,6 +2495,8 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     if (flags & PAGE_WRITE) {
         flags |= PAGE_WRITE_ORG;
     }
+    reset_target_data = !(flags & PAGE_VALID) || (flags & PAGE_RESET);
+    flags &= ~PAGE_RESET;
 
     for (addr = start, len = end - start;
          len != 0;
@@ -2506,10 +2510,34 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
             p->first_tb) {
             tb_invalidate_phys_page(addr, 0);
         }
+        if (reset_target_data && p->target_data) {
+            g_free(p->target_data);
+            p->target_data = NULL;
+        }
         p->flags = flags;
     }
 }
 
+void *page_get_target_data(target_ulong address)
+{
+    PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
+    return p ? p->target_data : NULL;
+}
+
+void *page_alloc_target_data(target_ulong address, size_t size)
+{
+    PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
+    void *ret = NULL;
+
+    if (p) {
+        ret = p->target_data;
+        if (!ret && (p->flags & PAGE_VALID)) {
+            p->target_data = ret = g_malloc0(size);
+        }
+    }
+    return ret;
+}
+
 int page_check_range(target_ulong start, target_ulong len, int flags)
 {
     PageDesc *p;
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 41e0983ce8..f83874b8c1 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -562,7 +562,11 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         }
     }
  the_end1:
-    page_set_flags(start, start + len, prot | PAGE_VALID);
+    if ((flags & MAP_TYPE) == MAP_SHARED) {
+        prot |= PAGE_SHARED;
+    }
+    prot |= PAGE_RESET | PAGE_VALID;
+    page_set_flags(start, start + len, prot);
  the_end:
 #ifdef DEBUG_MMAP
     printf("ret=0x" TARGET_ABI_FMT_lx "\n", start);
@@ -754,9 +758,11 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
         new_addr = -1;
     } else {
         new_addr = h2g(host_addr);
+        /* FIXME: Move page flags (and target_data?) for each page.  */
         prot = page_get_flags(old_addr);
         page_set_flags(old_addr, old_addr + old_size, 0);
-        page_set_flags(new_addr, new_addr + new_size, prot | PAGE_VALID);
+        page_set_flags(new_addr, new_addr + new_size,
+                       prot | PAGE_VALID | PAGE_RESET);
     }
     tb_invalidate_phys_range(new_addr, new_addr + new_size);
     mmap_unlock();
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 280137da8c..715101816d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3845,8 +3845,8 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
     raddr=h2g((unsigned long)host_raddr);
 
     page_set_flags(raddr, raddr + shm_info.shm_segsz,
-                   PAGE_VALID | PAGE_READ |
-                   ((shmflg & SHM_RDONLY)? 0 : PAGE_WRITE));
+                   PAGE_VALID | PAGE_SHARED | PAGE_RESET | PAGE_READ |
+                   (shmflg & SHM_RDONLY ? 0 : PAGE_WRITE));
 
     for (i = 0; i < N_SHM_REGIONS; i++) {
         if (!shm_regions[i].in_use) {
-- 
2.17.2

