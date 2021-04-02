Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1543181lfg;
        Fri, 2 Apr 2021 09:22:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc6ezKqakE1HkX8tg1ZwIprAOKx4I1RAt92oxyQlAfSCfkNOUAYVeeCaOFiScVgg2P6qV2
X-Received: by 2002:a92:dc49:: with SMTP id x9mr11546522ilq.281.1617380522110;
        Fri, 02 Apr 2021 09:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617380522; cv=none;
        d=google.com; s=arc-20160816;
        b=e5IWzSg1yCCpl1gGBtyrPZz71rySzQVFviQqRLYPVKfFNRIVncTXB7Q37nw/iJr/5q
         McJRmuFQB2Dk+UQrthbissxwS9xfcTWxQz94Sf3uG7UUOABqeK/Pv6GTvvj3ytIGeBb4
         ciufDcTUOZ5eoUjDqKKaWQMNJeb0LAo6TN6JVjgmY10JQQIAXIN/gfV6GPO3gM3gt054
         JpqMVpVBvRSQpkIbyrzpsvQg3rBAcSH2W3r63gep/PcSn7svvfj+1gi6M8WxJcqa1znA
         BdvT6ATuaecvwUkEkCj4gkFUYXnSOKOM7eAEmTMWPj2LRDFUrx0gzjtKh+29hINTdmLD
         BrxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=40EtQ0GsJCeH0a6Y7JFQ1124iOFiLbPm35cGCuUgHGs=;
        b=rbGyt+b74Vq6QXrptubr6FehmnMo/1nsU5AAbn9D2RB4eUXaM1NXHrh59FeMA0wFXE
         /PjbSxdQ1psmmo5yuL/bPT3QUcq8GAVkcbshYDmTPYfUnB9RuTlFEFpWiibEtpwfAPLv
         Dse7+tYafHWb5NT4Oo+wG45dpPszf7fpLOygszzORVYvLkY7zzR7XBAJVAnuWOE+GcNu
         nIMRrRm/89TkmZ0KduZjE45Db/iRMUKWzIkIWdGA+0O2QmVgmdOXzFTe8w6v61j7GudS
         BWYP0ubDaEpksZzhJV2aK+lCYYeWHLd0eiBSooQBxZ9NMUvegsXcPZl9FFxJzKoiTjmi
         6tzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IwtQGeiO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si8019566ilq.44.2021.04.02.09.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 09:22:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IwtQGeiO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSMYb-0004L0-Em
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 12:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMVR-0000wM-4k
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 12:18:45 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMVO-00037P-2S
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 12:18:44 -0400
Received: by mail-pl1-x629.google.com with SMTP id o2so2728996plg.1
 for <qemu-arm@nongnu.org>; Fri, 02 Apr 2021 09:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=40EtQ0GsJCeH0a6Y7JFQ1124iOFiLbPm35cGCuUgHGs=;
 b=IwtQGeiOJi/QpBb85ZOaOnyDWtCfLsvyWvPo6PtnLrRpJ/9D9De5lADwWEPDB33W85
 R472l6g4KJwXIaC9ojOAKhRSwKocxYnk2m/O11ffMuDX221Ftz87fSY8Y7wZb8Y8xRt8
 gl7CMSQP3AJgsGeF3+3UIaDBlq7QpVayg2+Ur8ws2tvzOCql8JIJSUAmu6X0oTet8BYc
 nEicT2kvLpTQvAZKEb+JE7znfocLzzTqv50nHki1qG62hwjFnZ8mmM4MJH/SKPrn+PpK
 KenVrOuoDGgVFlV1l7061Zzkabutuajfy8fcQk2LpC7xlOqakNjnwDPssdt2vxyQUDwI
 LZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=40EtQ0GsJCeH0a6Y7JFQ1124iOFiLbPm35cGCuUgHGs=;
 b=qZIeFOOMI55U73PiPhV/0IFQcdtCjSbU2I+V03eFjaOn4KUZd6AuPbI2T987H8IMgM
 WKN8TVlGCC7UNvv/tdpJE664PBbZnh6++RYc81c1zTWrN/Phz5SZSMdoC6VNtKWD122Z
 lsvnzELveb3Ga6wUnpWOuc8rnoVv3zXFLimVDCtJS2l1WhIOmR+ugjtY3AMW4eEMulY4
 3XAC9fyFjnncc3yICRz2VrvZe+oXQhODIJN9p3HZfxPgUwF2B2tqHxagTHy4M73I+IGs
 sgYEDLnb/Kidjanup4EkUXk99GEk7PStPVgJ+SZDMp2opYlmOpsPNWrmpvjyIVrEzFzp
 /2BQ==
X-Gm-Message-State: AOAM530aBAKB74vum+ApXkNiN4DJ8CZnwbikGAAgYNffbBHAyY6JFFW4
 svtZu1l/N9BO7zjR/Vjg7Ibniovg9PRyuQ==
X-Received: by 2002:a17:90a:d3d2:: with SMTP id
 d18mr14329233pjw.111.1617380320765; 
 Fri, 02 Apr 2021 09:18:40 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id m7sm8821761pjc.54.2021.04.02.09.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 09:18:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] accel/tcg: Preserve PAGE_ANON when changing page
 permissions
Date: Fri,  2 Apr 2021 09:18:35 -0700
Message-Id: <20210402161835.286665-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402161835.286665-1-richard.henderson@linaro.org>
References: <20210402161835.286665-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1ki1ciZBwhfq

Using mprotect() to change PROT_* does not change the MAP_ANON
previously set with mmap().  Our linux-user version of MTE only
works with MAP_ANON pages, so losing PAGE_ANON caused MTE to
stop working.

Reported-by: Stephen Long <steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/mte.h           |  3 ++-
 accel/tcg/translate-all.c         |  9 +++++--
 tests/tcg/aarch64/mte-6.c         | 43 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  2 +-
 4 files changed, 53 insertions(+), 4 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-6.c

diff --git a/tests/tcg/aarch64/mte.h b/tests/tcg/aarch64/mte.h
index 141cef522c..0805676b11 100644
--- a/tests/tcg/aarch64/mte.h
+++ b/tests/tcg/aarch64/mte.h
@@ -48,7 +48,8 @@ static void enable_mte(int tcf)
     }
 }
 
-static void *alloc_mte_mem(size_t size)
+static void * alloc_mte_mem(size_t size) __attribute__((unused));
+static void * alloc_mte_mem(size_t size)
 {
     void *p = mmap(NULL, size, PROT_READ | PROT_WRITE | PROT_MTE,
                    MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index f32df8b240..ba6ab09790 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2714,6 +2714,8 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
        a missing call to h2g_valid.  */
     assert(end - 1 <= GUEST_ADDR_MAX);
     assert(start < end);
+    /* Only set PAGE_ANON with new mappings. */
+    assert(!(flags & PAGE_ANON) || (flags & PAGE_RESET));
     assert_memory_lock();
 
     start = start & TARGET_PAGE_MASK;
@@ -2737,11 +2739,14 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
             p->first_tb) {
             tb_invalidate_phys_page(addr, 0);
         }
-        if (reset_target_data && p->target_data) {
+        if (reset_target_data) {
             g_free(p->target_data);
             p->target_data = NULL;
+            p->flags = flags;
+        } else {
+            /* Using mprotect on a page does not change MAP_ANON. */
+            p->flags = (p->flags & PAGE_ANON) | flags;
         }
-        p->flags = flags;
     }
 }
 
diff --git a/tests/tcg/aarch64/mte-6.c b/tests/tcg/aarch64/mte-6.c
new file mode 100644
index 0000000000..60d51d18be
--- /dev/null
+++ b/tests/tcg/aarch64/mte-6.c
@@ -0,0 +1,43 @@
+#include "mte.h"
+
+void pass(int sig, siginfo_t *info, void *uc)
+{
+    assert(info->si_code == SEGV_MTESERR);
+    exit(0);
+}
+
+int main(void)
+{
+    enable_mte(PR_MTE_TCF_SYNC);
+
+    void *brk = sbrk(16);
+    if (brk == (void *)-1) {
+        perror("sbrk");
+        return 2;
+    }
+
+    if (mprotect(brk, 16, PROT_READ | PROT_WRITE | PROT_MTE)) {
+        perror("mprotect");
+        return 2;
+    }
+
+    int *p1, *p2;
+    long excl = 1;
+
+    asm("irg %0,%1,%2" : "=r"(p1) : "r"(brk), "r"(excl));
+    asm("gmi %0,%1,%0" : "+r"(excl) : "r"(p1));
+    asm("irg %0,%1,%2" : "=r"(p2) : "r"(brk), "r"(excl));
+    asm("stg %0,[%0]" : : "r"(p1));
+
+    *p1 = 0;
+
+    struct sigaction sa;
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = pass;
+    sa.sa_flags = SA_SIGINFO;
+    sigaction(SIGSEGV, &sa, NULL);
+
+    *p2 = 0;
+
+    abort();
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 6c95dd8b9e..928357b10a 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -37,7 +37,7 @@ AARCH64_TESTS += bti-2
 
 # MTE Tests
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_MTE),)
-AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5
+AARCH64_TESTS += mte-1 mte-2 mte-3 mte-4 mte-5 mte-6
 mte-%: CFLAGS += -march=armv8.5-a+memtag
 endif
 
-- 
2.25.1

