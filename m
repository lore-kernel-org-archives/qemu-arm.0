Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1948318wrq;
        Sun, 10 Feb 2019 17:19:11 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia+RAva7oPparDePk2PcS8rD7Gdeto1lUpKuewGq5AjhTXX+ooFA/vALEcNI2XH5lqUEkAJ
X-Received: by 2002:adf:dd10:: with SMTP id a16mr3270060wrm.37.1549847951668;
        Sun, 10 Feb 2019 17:19:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847951; cv=none;
        d=google.com; s=arc-20160816;
        b=OY3AMb8qlVb6eRblHgUbKX6WJiDagy0McgL/ES8FxTFBCKRulHOjPvorx1rljvTbDL
         i10TqVoIcRIBhjeIdsCLkWjhocd7xR4LuhiqiU2rjxPjsKYNle88YeWFDwR9uXmGF3y+
         Z3ySvWUWCs16Lw0+BfaAZUYtkBYRRPCWCkucDmMeCo3O8ZZ0t2rlwH+ix68QbKWeVeZl
         r+hqGK0gvmSXh2EpaqGSKeG3I9pZ3Bnvnes5MIY2lXuMfY3tpYEQdd9+tZWCWxp6WCSX
         KD+CYLFD2eCVQv493KRceXSdtdqaEGNnnOt8hNMcwCZLITvzq67k++zNfuIrMQ3CvpAl
         9r2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=IYfDmawl379GZgWCUsgON1GHK8BY9wa/LpINsjn/HBc=;
        b=STNsqvcHbvtXTnKDOzym4W8ai2XYlbwJHZgd5ocnGkKN9U1mbOUaojlU5t2Kn6dG11
         6/LWtLijX4v85CAox5cB21hk/F3CavOriTjjvdnsFzzcTlBYQqzGLcBcZeCCuH+j5Lpc
         f+RMHduk94hOYg9AjowL8Ad4IMSAQPuta7c5CwoWMAAiRbVzwT7pGHFeETpxI3iTkwd/
         NWY0IVL3kooACj5bE8bZFeL274FZTBCVrpG9gHOhCYTRaThXOiqv2gTy0j7PFwCGTY3S
         R78CF8839wHDGvtSZF2T6L7gCOlGn6wQ3DeCWPd+WJL+prNsNk8+uH0BJBgBIGZrc565
         XYCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X+1o0xIl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 143si301290wme.187.2019.02.10.17.19.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:19:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X+1o0xIl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt0Fa-0005LF-Is
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:19:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05x-0005zB-DN
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05t-0000BV-A7
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:13 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:33111)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05s-0008Mk-Rm
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:09 -0500
Received: by mail-pf1-x442.google.com with SMTP id c123so4478102pfb.0
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 17:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IYfDmawl379GZgWCUsgON1GHK8BY9wa/LpINsjn/HBc=;
	b=X+1o0xIlcU4rnnY4YsMSmvoeIktLuTh+vW6ZUxzd5U2pbMbbcbHtdfA/su8IZSsMLT
	obyPCceQM6zT/G6epiYKvtQguU392xKcwKz6D7lODC/PQLXB8D0mWmzncB1A+Ghu5QqO
	HTY2FPeAnEKPfQkDvOGRK7pQmcXHAjw7QghbpLjpbFeXBS0RAkCADh1IzIrtCiYG2nrc
	FQKnXoja/uuqnUnrR5Vubxphdc4qBc6qeWm9SeDHvsJmH/4jZmeR3MSbPT/YCdcUEUHP
	Vxn/GmGGJzJuY28MQiQhOEDZs5490xMwPymKCThO0S4P+Dae2lklZL3wBHY0j+6mrDi0
	o++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IYfDmawl379GZgWCUsgON1GHK8BY9wa/LpINsjn/HBc=;
	b=QXOLvTpYToyhwNq1ytzCnnEs2AKrSC4xxUVAJm2vcgE32uDKA7rKlDLv37gPLPp0eE
	cMBV5pXAI4uYN2LQhl5I8hdHwywnty9RqHZCV0LtbZveqvdWz00CZieOHtqs3rhhyxlj
	tzluJ5Ihtz0aDFhjFqlAKxTlIeUOJbtL++21aQKVMTe7bAiS2gQ4IqeiDCP8R0AtOFLh
	5b2LBKPPbEUnTZIDjwyibwBszO/LfMRGy7nEKNFTGyJ4qPqjJFe6gltBgTopd3AK4IDM
	GEYYM57LRGsqyxzyQZ3WGLTHWLoaq6gX/KLwvdnfM4cGqIslWJ/qgyat1WImCS049hHE
	vMIw==
X-Gm-Message-State: AHQUAuYXk84faZ2gZVgsfeeT1eR+G1atHM3Y2OhMn2CEjkSIBoPvOVLh
	y/IszG/ebHqo7iHMZnYC2JDSwg==
X-Received: by 2002:a62:9917:: with SMTP id d23mr16055952pfe.88.1549847337734; 
	Sun, 10 Feb 2019 17:08:57 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:23 -0800
Message-Id: <20190211010829.29869-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-arm] [PATCH v2 20/26] tcg: Introduce target-specific page
 data for user-only
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mhJy4vpTnWzM

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

