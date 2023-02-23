Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1087450ejc;
        Thu, 23 Feb 2023 12:46:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/VdPdb8mUZ7Nh4GjIXgs4wfCgFzbjrCI8+jc6Nxomb9aRBaLjg0uAUJE1gHyUL5LqxU15f
X-Received: by 2002:ac8:7fd6:0:b0:3b9:bcac:725b with SMTP id b22-20020ac87fd6000000b003b9bcac725bmr22914503qtk.22.1677185194491;
        Thu, 23 Feb 2023 12:46:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677185194; cv=none;
        d=google.com; s=arc-20160816;
        b=JfBUOUDhd4TmKaNgNyNxMKplzRjxVhv/fdtoRdQ63wPuOCo2PXbM440WTKlSahaFVq
         3415fMvb6Wv0M7DGF7a0KMwkSIFafEDad1W2/8P3Uc7Bk2JDlYcPa7U/eLc+jMeHHXI5
         B8uU0IWmOd9bSuo0WAnzlpKkj+RxdEIwGkNOtcR3YPlUs0W54182y5My41R0bZV2MBFZ
         QfwdXMxHayafAfHAyYr58BDAmpvLmlHq5ifOLQs4zHPEu5H+4tF5ZDm9hi0+KnPR6a9l
         YoZWeUaTQFw7j5spddhIA7+Uz/ZU3qu9RF9pNDfbVk8QWAVJLIZBjvmrYcyy1/d0OeZt
         YDhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fgeja5IA7DWdfWMaQJS17wRQUp+VgamC4WOakECeEuY=;
        b=UZxEPN+MTjgImd2ImKW7h0UKUhqBBikGwSIvmPxqvGT/tLp3AcaEvR3Jupicbg7mqg
         byZwSQq9QIvGBvF1DIvgP4ENhLdYcZI/FddPLEGiPMCQAjkXrFIi3Hp1FwQAs0f9jGhx
         ACOFbHW0GmBF9PVgrqpeAVY6V/7veOKN3yuhZfdG9FsH+0xvSbIJtUA/uRO+UViaBGj8
         fA8hHFa1anARElBBkE5oSxLVO88etEl8DQwd7tQDVtJAaT5FH5R0tviUVLhq2CbB8taj
         zklB0AAw7VXA/uh06fzjqSpNz6LALkwBJTaLvIOUVIGi4UguFUrwKYmfRbwGS0f7nR9B
         rslw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ir9tHoG4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020a37d203000000b0071f6c1228ddsi3615101qkj.562.2023.02.23.12.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 12:46:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ir9tHoG4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVIRd-0002pJ-9M; Thu, 23 Feb 2023 15:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRb-0002oY-TP
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 15:43:59 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRa-0007QA-8A
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 15:43:59 -0500
Received: by mail-pl1-x62f.google.com with SMTP id q11so14829803plx.5
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 12:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fgeja5IA7DWdfWMaQJS17wRQUp+VgamC4WOakECeEuY=;
 b=ir9tHoG4bsr+QA+SyzdOL6EpVyYOzyabKXIYOwVIjI+DLC1zDMGmBvcVFICgy1dMPC
 OzT7anpVeng+qdQ16ZWbBoR11q3BURhdZOx9Bxel2EAc7hKSVi1KF3ZpwBGhyFZk+egH
 DZOFlzPbhCXc+dREWssE+sXJrZIp4qsjHLiItw0JsGhxMwQxfwPKi+oRXF2wzWLpsYiR
 w4gwUpME0YtbHrvX7lIOoioQIdgfG6eaqHaqv8aTJlj1wSG0NyGiA4wDZf9mL3VgbkgR
 7jSUmqil0NeSwfijuTMyZA8wIBuSjSsinzi3cb1Zj/mHUTKqwbhxLEiEJtUQk1SMZvBi
 MxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fgeja5IA7DWdfWMaQJS17wRQUp+VgamC4WOakECeEuY=;
 b=G3hMQdXkiLMCynTCCdn9ygH+m1CtxTt1hS8an+53tf+TeXit/KcENTg4nyy9lt6fZ6
 ICTMqurjZWOE4GtEvU9RsG7VoKjbR6pSZPlAYC3kw99mxLO1+02B/HsMPGvfOl+kY8ff
 CGUyC1nxZWs1R+s4aP4Wlr9XTCCA+h4LtalS+udECd1Njv71ZBuwYo+GyTiAeGRLah5o
 xsbP9zS3Vp98IEOmXYUqDTzfXE1CWHvaPlC8pLUHGNFnJboXrgziEBv6MhBQncTslhxJ
 N2DxYBmAN7NbdHuBOwl+E5dYwWmxL1mpG6qVQRe5oENtLnjGLPUHSDsZur2ge1K0wECp
 O4aw==
X-Gm-Message-State: AO0yUKVmYAbEz2hWwtiHHnK7dVCbq2LiNV3Nq1JfCsmiW5+ar0qSlarn
 EruE6oNiMGkyeI4dEjyAtcT0dzpGrHSV7du6Z/I=
X-Received: by 2002:a05:6a20:3d81:b0:cc:32aa:8570 with SMTP id
 s1-20020a056a203d8100b000cc32aa8570mr2804404pzi.14.1677185037488; 
 Thu, 23 Feb 2023 12:43:57 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:43:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/13] accel/tcg: Trigger watchpoints from atomic_mmu_lookup
Date: Thu, 23 Feb 2023 10:43:35 -1000
Message-Id: <20230223204342.1093632-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5quZoeCmiEVC

Fixes a bug in that we weren't reporting these changes.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 74ad8e0876..e0765c8c10 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1908,6 +1908,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     CPUTLBEntry *tlbe;
     target_ulong tlb_addr;
     void *hostaddr;
+    CPUTLBEntryFull *full;
 
     tcg_debug_assert(mmu_idx < NB_MMU_MODES);
 
@@ -1947,17 +1948,26 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
             tlb_addr = tlb_addr_write(tlbe) & ~TLB_INVALID_MASK;
         }
 
-        /* Let the guest notice RMW on a write-only page.  */
-        if ((prot & PAGE_READ) &&
-            unlikely(tlbe->addr_read != (tlb_addr & ~TLB_NOTDIRTY))) {
-            tlb_fill(env_cpu(env), addr, size,
-                     MMU_DATA_LOAD, mmu_idx, retaddr);
+        if (prot & PAGE_READ) {
             /*
-             * Since we don't support reads and writes to different addresses,
-             * and we do have the proper page loaded for write, this shouldn't
-             * ever return.  But just in case, handle via stop-the-world.
+             * Let the guest notice RMW on a write-only page.
+             * We have just verified that the page is writable.
+             * Subpage lookups may have left TLB_INVALID_MASK set,
+             * but addr_read will only be -1 if PAGE_READ was unset.
              */
-            goto stop_the_world;
+            if (unlikely(tlbe->addr_read == -1)) {
+                tlb_fill(env_cpu(env), addr, size,
+                         MMU_DATA_LOAD, mmu_idx, retaddr);
+                /*
+                 * Since we don't support reads and writes to different
+                 * addresses, and we do have the proper page loaded for
+                 * write, this shouldn't ever return.  But just in case,
+                 * handle via stop-the-world.
+                 */
+                goto stop_the_world;
+            }
+            /* Collect TLB_WATCHPOINT for read. */
+            tlb_addr |= tlbe->addr_read;
         }
     } else /* if (prot & PAGE_READ) */ {
         tlb_addr = tlbe->addr_read;
@@ -1981,10 +1991,18 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     }
 
     hostaddr = (void *)((uintptr_t)addr + tlbe->addend);
+    full = &env_tlb(env)->d[mmu_idx].fulltlb[index];
 
     if (unlikely(tlb_addr & TLB_NOTDIRTY)) {
-        notdirty_write(env_cpu(env), addr, size,
-                       &env_tlb(env)->d[mmu_idx].fulltlb[index], retaddr);
+        notdirty_write(env_cpu(env), addr, size, full, retaddr);
+    }
+
+    if (unlikely(tlb_addr & TLB_WATCHPOINT)) {
+        QEMU_BUILD_BUG_ON(PAGE_READ != BP_MEM_READ);
+        QEMU_BUILD_BUG_ON(PAGE_WRITE != BP_MEM_WRITE);
+        /* therefore prot == watchpoint bits */
+        cpu_check_watchpoint(env_cpu(env), addr, size,
+                             full->attrs, prot, retaddr);
     }
 
     return hostaddr;
-- 
2.34.1

