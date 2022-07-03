Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2436256lft;
        Sun, 3 Jul 2022 01:33:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uNYN935Wl/f9MiALLbMXYUTMRQdUnWA5cwgH+GvyvBuoT4gjWv/VvWl3awIwR5hp0EFB+V
X-Received: by 2002:a81:754:0:b0:314:59e0:ceb7 with SMTP id 81-20020a810754000000b0031459e0ceb7mr25808586ywh.178.1656837224420;
        Sun, 03 Jul 2022 01:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656837224; cv=none;
        d=google.com; s=arc-20160816;
        b=k3u9IzcJk1/hNYch4tqhzApp75zm0JGSBRNanJ+pAPRhjayujvS6ZiXWZVL7s8nhA0
         +kJPL49Vki0tBYkhkU7QLj/nEOQaQ+7/AV8W4HHnbRH4LBMPK+PTEVXqut2yEzSbpwOm
         g6ij43DTwMojt8u1iZ80AXpPtAIN81eRkQSncA1SKlouUHPLQ2s+soR/r8+PEwLpJ3cd
         8jONySN5KwISC26cJXW/nnm4EfTgWPW5kQuoWqDTqwnyr9Y7BU1H/qKjtUcjFqYWbeo0
         6Z0+hD/16zwnsM6SlRHKeFaCPgWlmcYyT0Vy1LTQT2DXb8MNx9hSajb3febnkuEuDn5s
         ginw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BdrXyYuvZwqHVq9JTmbUhOhUUmR+wJ0WR8LQ9U+RKOA=;
        b=URow4ifEWnoQ4p1UOYGIlP18syMtcu70JKkyIkD4/jkKJbzdQRbATR4J9jPKng1JSX
         XFhplIDuc4hERFq/lVXOBRCMiyFLajGYPjcGbXLbcYVHXEN7TGqdFsGb1k1SOGgxGwL7
         QdVj8MxpjsSsLJrJaJfK9PCHQNthCOeMnluEwX57/pYlU924yenKj/02Pu1xIY3KVUSa
         Er8+bIcjG1HoNxtyxQeRTge3ue0EpLu7giP5kMxvjjnkNIESpLyqWMdv0YM4Cy6eDBdr
         t73EMtWAa7Q/atKx3GC7q+hpgEPUWci657uuwWQrlMJ3Wjm855jqUCoX9nqKWc5DLDiF
         hlnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Aq+1NYol;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i64-20020a252243000000b0066c87071d16si33341463ybi.495.2022.07.03.01.33.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:33:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Aq+1NYol;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7v31-0005AI-O8
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuc-00072M-Ja
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:02 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuZ-0005st-VA
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:25:02 -0400
Received: by mail-pf1-x432.google.com with SMTP id t21so6362878pfq.1
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BdrXyYuvZwqHVq9JTmbUhOhUUmR+wJ0WR8LQ9U+RKOA=;
 b=Aq+1NYolkM7YqfsNWkBP5uhP9NiFd3m3rRT7VBlrZPl/vTHYovAF4ht6Vajl0cO+IK
 ED4A+7+2Fn2YNhwwZ5BcDkKv4HhwiAjWulISzKDbjEYgRh35M03WAJEgYsloPyXw/JIy
 BV4/p+7pE3o0uLJ10w2HwT+xWqHQxVoG/HguqULigv0cwNIYska90nHo2fWI3jGc6wRQ
 R+6uKTfaB5grPY84AtGYeK6nTnVJnjkEOUX/g5Jp3zDsopZdzFWj7Z1CaYy61t+LbF+t
 +97KEuWYkV4czPL7oX7K1Yoxy8pyRXzCKbc/GqOw5+w1ThS+KpMbEXNnjlJQI/fV1dtd
 w8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BdrXyYuvZwqHVq9JTmbUhOhUUmR+wJ0WR8LQ9U+RKOA=;
 b=eWLbT0cyKeTAKzl3m/reXwx5UJV2/zzss2GUxQ++pBzFhGlUxL/Qu+20dj5HRAYD1u
 lhhMST9xSTOlwvxNd4r/lIKJletfzaoSFHSVlcVvF03oWBVVpgpcBahRdGmojipwX8gJ
 h3AWQlyS6P8trUbLF9vin8zR/syF2T42GMJQ/oaBokrRDJyezIt5U1nuIa2pekCaHkLf
 lP0ga3lSHQLh+PupX4JPOfqRhxJgUvWgI1UZH18uepPAryceOR9kWbViOuCxcd+0kNr5
 bkYP+aycueMUFgli/DWAGh6wHhB8Nmms5BZc2v5a5rvYPxcq/HPZzAudTvYb/UCOdnSY
 X2OQ==
X-Gm-Message-State: AJIora/ERi5ggcTCSsS9T3asobwBz5S3aEoDoN/YeO5JvxpA0tFRGngY
 65V2r05/LFwL2P1UfsrzNN1xax5gM38DLsU1
X-Received: by 2002:a63:cf18:0:b0:40d:5506:df97 with SMTP id
 j24-20020a63cf18000000b0040d5506df97mr19590146pgg.43.1656836698632; 
 Sun, 03 Jul 2022 01:24:58 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:24:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 11/62] target/arm: Use GetPhysAddrResult in get_phys_addr_v6
Date: Sun,  3 Jul 2022 13:53:28 +0530
Message-Id: <20220703082419.770989-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +bdW2noruhjy

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5e79c9be98..d70c9120fc 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -532,8 +532,7 @@ do_fault:
 
 static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
-                             target_ulong *page_size, ARMMMUFaultInfo *fi)
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int level = 1;
@@ -593,11 +592,11 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
             phys_addr = (desc & 0xff000000) | (address & 0x00ffffff);
             phys_addr |= (uint64_t)extract32(desc, 20, 4) << 32;
             phys_addr |= (uint64_t)extract32(desc, 5, 4) << 36;
-            *page_size = 0x1000000;
+            result->page_size = 0x1000000;
         } else {
             /* Section.  */
             phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
-            *page_size = 0x100000;
+            result->page_size = 0x100000;
         }
         ap = ((desc >> 10) & 3) | ((desc >> 13) & 4);
         xn = desc & (1 << 4);
@@ -623,12 +622,12 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         case 1: /* 64k page.  */
             phys_addr = (desc & 0xffff0000) | (address & 0xffff);
             xn = desc & (1 << 15);
-            *page_size = 0x10000;
+            result->page_size = 0x10000;
             break;
         case 2: case 3: /* 4k page.  */
             phys_addr = (desc & 0xfffff000) | (address & 0xfff);
             xn = desc & 1;
-            *page_size = 0x1000;
+            result->page_size = 0x1000;
             break;
         default:
             /* Never happens, but compiler isn't smart enough to tell.  */
@@ -636,7 +635,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         }
     }
     if (domain_prot == 3) {
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
     } else {
         if (pxn && !regime_is_user(env, mmu_idx)) {
             xn = 1;
@@ -654,14 +653,14 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                 fi->type = ARMFault_AccessFlag;
                 goto do_fault;
             }
-            *prot = simple_ap_to_rw_prot(env, mmu_idx, ap >> 1);
+            result->prot = simple_ap_to_rw_prot(env, mmu_idx, ap >> 1);
         } else {
-            *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+            result->prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
         }
-        if (*prot && !xn) {
-            *prot |= PAGE_EXEC;
+        if (result->prot && !xn) {
+            result->prot |= PAGE_EXEC;
         }
-        if (!(*prot & (1 << access_type))) {
+        if (!(result->prot & (1 << access_type))) {
             /* Access permission fault.  */
             fi->type = ARMFault_Permission;
             goto do_fault;
@@ -672,9 +671,9 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
          * the CPU doesn't support TZ or this is a non-secure translation
          * regime, because the attribute will already be non-secure.
          */
-        attrs->secure = false;
+        result->attrs.secure = false;
     }
-    *phys_ptr = phys_addr;
+    result->phys = phys_addr;
     return false;
 do_fault:
     fi->domain = domain;
@@ -2512,8 +2511,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                   result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
-                                &result->phys, &result->attrs,
-                                &result->prot, &result->page_size, fi);
+                                result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
                                 &result->phys, &result->prot,
-- 
2.34.1

