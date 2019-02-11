Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp118518wrp;
        Mon, 11 Feb 2019 16:13:05 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZs+MrKEhFVmmVsy0RIwHKADjp/gO7AR+7eBATvAuKNb/8G0PpiO+SN6FfKB5QLC2mw9Nwm
X-Received: by 2002:a81:1691:: with SMTP id 139mr740220yww.74.1549930384949;
        Mon, 11 Feb 2019 16:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549930384; cv=none;
        d=google.com; s=arc-20160816;
        b=uxRFuT+zK3WfwzZ9dVznnZj6Un4OcnVn6haxmizAbarMqXdrulBAyVAkJCMyQprnmC
         Pa7sa3dhy2widFmI0pDp5RWv9+0TPT50lrAdp2OwvOUES0l4x5hju4tH4d650bdZOSTu
         rNrbr30cFwYpmfHN8TzMeLgy4IWRIYlHjggib/PgMGQcMae3BcIo56jnml38c0B3QehC
         +STlX8to/rpezd2iuQOpjRSBE9CvxkNdjQym1dNNYQ98fPurY6hDkQJ7qsk4sJdYz40Z
         SRR1VHi5KHv1cWJM3vBmwqHhz30KjJrQg7xU1NUoAXWO2IIpwl+bc2ZWZCf4y2VMfhjl
         iXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=IYfDmawl379GZgWCUsgON1GHK8BY9wa/LpINsjn/HBc=;
        b=N8yBoiHgw2M0HD0ZRw6YsJm7gnWpKKxLOI7s3aMVnfh3azroaZSKhxiUKxONvynTsa
         bNH7EyYLf9r3TAQMTphO//LaZJRSyTB5pHKzNnVeGgGC55AZQfGlPccDoH8KcWkMZdBF
         8xCM63Sn+B1bbC/tHhTL+92MXvxDXRZGC/A0kjhRDS6tCg7jhGf7usPMQ4ib0UCBRoUt
         uDGHAa0B9uTTu/6iG44smBUnJDTlv6nak/TdGX2zKkAUV418Wogwqqnd8QgqP8WN8IyJ
         PkC4WXlRmHIXFwuWhv5xIUddZYzni5ojOYFnLC9nzmFShv+tukKJTkN4FNANoXdo7vce
         FPBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jiVgBVN1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si1539414ywh.67.2019.02.11.16.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 16:13:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jiVgBVN1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLhA-0003pK-AU
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 19:13:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOj-0005u9-D6
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:54:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOf-00050M-7D
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:54:01 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:32788)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOe-0004bZ-PO
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:56 -0500
Received: by mail-pf1-x444.google.com with SMTP id c123so349286pfb.0
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 15:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IYfDmawl379GZgWCUsgON1GHK8BY9wa/LpINsjn/HBc=;
	b=jiVgBVN1y8bC0J5OWywT2GyChDE/IAULnoZSTLGcvMrOys69hu5mtcW+NU51ta6xRg
	DAGE06PANEztOJOAWWF9ZsUaUNNBRVmlB000lut4BXeIJ7X2Om81zFP2MR0XoCFkr4az
	hGZcWtLhQ6OjpxAeDuCASVHDYaABYSTb61zYxOyZvuw5QhcC0TXzL0zc52poLc6/E6NR
	OOSaQ8AX4yKLqJ9fzaWBKxPvI6d6sU9Og+kZOIggB2dloIAx2P1nvV23CiM37Ha9lRA5
	3yXd75x5/zo7FXXDRaqcd9rmkKNOGccaY7y7NasoGh/adwiT96+S+sdfdNfXnCi0PpiM
	GHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IYfDmawl379GZgWCUsgON1GHK8BY9wa/LpINsjn/HBc=;
	b=J6rKZ3s0vqkEWULL+7+982CBqPz7Shiqc5IFMU+KjW3/26UdkzCB0CAiMYK8TQLsvy
	z3tJ1epovZQeYuNou652nt0cqveufXwXp5MVl2dxlLE6XnKFu9AWp+x05kr/qikBQMWz
	JEvh+tWazrQcBQHIrH+oI2W085lxJISQnGY+JaJHsLyAmwDF2MEqry+lpjCiNxy66e6Z
	s9h5eVIVguz5wtUCceaRB5Gtpmr6qU3wxmQ9h6K6pkjNkBMODNqQ+wGNieZnBprIemux
	b9JIzMAmGPmUpMKM/jyIjocgzXP5ZtpgzG9B2VSETMlh/CEB03zGQRKAeN6OzMRIrvp2
	WSAQ==
X-Gm-Message-State: AHQUAuaycI7LBB570FBRpxyTvefg9x5XGeZ7qaQaLI+FNzsL56gqW5/H
	QEP63qUysV+W84eu//ObpkD787mQGC0=
X-Received: by 2002:a63:4858:: with SMTP id x24mr824207pgk.420.1549929209767; 
	Mon, 11 Feb 2019 15:53:29 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:52 -0800
Message-Id: <20190211235258.542-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [PATCH v3 22/28] tcg: Introduce target-specific page
 data for user-only
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
X-TUID: h2sXVSpdwIQP

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
index b16c9ec513..e88ecad0b3 100644
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
index 8f593b926f..6cc266428d 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -107,6 +107,7 @@ typedef struct PageDesc {
     unsigned int code_write_count;
 #else
     unsigned long flags;
+    void *target_data;
 #endif
 #ifndef CONFIG_USER_ONLY
     QemuSpin lock;
@@ -2476,6 +2477,7 @@ int page_get_flags(target_ulong address)
 void page_set_flags(target_ulong start, target_ulong end, int flags)
 {
     target_ulong addr, len;
+    bool reset_target_data;
 
     /* This function should never be called with addresses outside the
        guest address space.  If this assert fires, it probably indicates
@@ -2492,6 +2494,8 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     if (flags & PAGE_WRITE) {
         flags |= PAGE_WRITE_ORG;
     }
+    reset_target_data = !(flags & PAGE_VALID) || (flags & PAGE_RESET);
+    flags &= ~PAGE_RESET;
 
     for (addr = start, len = end - start;
          len != 0;
@@ -2505,10 +2509,34 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
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
index e0249efe4f..0b786b87a2 100644
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
index 5bbb72f3d5..9d89b40321 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3884,8 +3884,8 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
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

