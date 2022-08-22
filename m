Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1021639ejc;
        Mon, 22 Aug 2022 09:48:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6KLztk8oRAI4ugI9t/dQOZY6ttb6K5t34w59662PvgNon/Sl6lEWhzOryHQqILZigFMnY5
X-Received: by 2002:ae9:ef0c:0:b0:6ba:c385:d7de with SMTP id d12-20020ae9ef0c000000b006bac385d7demr13225523qkg.585.1661186887530;
        Mon, 22 Aug 2022 09:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661186887; cv=none;
        d=google.com; s=arc-20160816;
        b=BiPUym92Z+pBNCwk7KTdou26fc4uBlSPXa0ERl0wZ+Sv3+SlPkC2HaM2MLxWgViwRz
         Jy3SEFKsg30ovbSNmD4xkZXC/85h+IMB6yrFu1DTQ6nKJTFNvPd3Ue1N/90QGYznHY1s
         9RH0pvgMVN4p3si0kqGG5GXWk4Da7hlyd/c4ziGW7sipKzTsi7Vbj9xjgSQy/5KNFZFS
         qesp0yWvQaDlSLDVEFNiWv9xOjkiMGTZGoLq+TdB3L9auXSc2I6YKUntugLBQy1m4uL4
         HxcmaUeA9EarXBPxsuA8uxtdZ9x4MJOVyxNzo/jAGIKinnRGIMxyr0xoEXfeOLgVwQs2
         rDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Zb+z0FjSLpuiqB1QCemcMh6uuV1Mpuz70yGjsr65duc=;
        b=oVQapMbEgpFEMTmRcoqt8u39+ybF4OSnBYMh21WeCS4UKWBrdS9h4i+QHlOWee1Vlx
         6ECXpw2Vp2Z9+Gem1TX3f/lNYCet4YKGx/+JMIos3hz4KB1NYbV5o/qTgCYi1nXQ7NxC
         SLBe/tLUCGvJ04H61HndYyB8Y/kvE2UjFqhUqjXUkyX58lf7OBSa0xXVHJj9PA4xB1Jc
         KCJJC+uAR6W1UHEugdrMkD1YMkIE+qhqFiJLUi23hExQzOXYiHPThWYwzbGHrjZJ8p/6
         d6RmXioGqLpC8xnGueVEm5EXo8XEA2DEIp52aMZy3gZkQ+cnyCkF6sMcnexpXsju+ISY
         UAOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E9rcRkjr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 207-20020a370bd8000000b006bb2cc58c52si4434362qkl.140.2022.08.22.09.48.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 09:48:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E9rcRkjr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQAas-0008Dv-Uk
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 12:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Lr-0000Vu-Jj
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:31 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:42981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LZ-0000nY-P1
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:31 -0400
Received: by mail-pg1-x529.google.com with SMTP id 73so9668111pgb.9
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Zb+z0FjSLpuiqB1QCemcMh6uuV1Mpuz70yGjsr65duc=;
 b=E9rcRkjr7AHEk9+4lfY3HJ7xUVpDDndz0I28JYB4KuTCO3BGfUrDrjZmGhqZQS3vCF
 ekMP6jOxLfzNXDIv0Mr0qJjVB2uPz4xhTv/YDjSMbtQn5eYBoy8gB34DvlurJDtW6LC/
 d1cPXxyHABiXBFp7C4EqqN5JbNTu6Z8VzjopZeCiSz3sLVzVCwiyIU9diDUjj8IKxAZG
 9Lw6tBf9L8qS8qFu0kL4Ybb++Dw5FVelTL5ubKNqw1+oZXg/X2d+xzGpgbSctdzjkmw1
 FkuYIANe33u0j56IGZp3m8tZDf10W18xjYZJnn45pUlYbShnFD+ewE7w6d+QNiRIQ19V
 sVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Zb+z0FjSLpuiqB1QCemcMh6uuV1Mpuz70yGjsr65duc=;
 b=lZr9kCdI442Jo9zafE76zjxsQhtDtQP/bPjxeYbtRA0qsiF+Z3FTcEk4GIPvFjcAEx
 KGtvdp3HXCzmZ461vSSwxMdgMT6I0OEojryYp41LmQRwiwrq8+YAaGXIhDhtb1LIXyWR
 V9ksYLmnW2B7eyTn6DDE2DA6f59iuc7DWaTvnSPTNZu5KNkkITEhOt8TiImvIx4I2xTu
 GGT9wlKvt7NYVUbxumEK+HZD63MqqqrVAku0DmFBr9Mj/omNxW5SYyc9ufgMPQClbMsf
 2oOZb1NneoSPXGmUGHGRSqBpMJSHpO/8GglJZi3JOQQu7m5OHes01Iiz06ZweNUKNv+N
 +Yaw==
X-Gm-Message-State: ACgBeo3oi1+VPaH/K5JYqbLzKomVOsDgs0y+FXOc/xaBSACwoDJxPGlY
 0qK+kUcLJ2m0LPg5SIUd36ExJWsX++Wumg==
X-Received: by 2002:a63:1a18:0:b0:419:aa0d:4f9c with SMTP id
 a24-20020a631a18000000b00419aa0d4f9cmr16693722pga.389.1661182092906; 
 Mon, 22 Aug 2022 08:28:12 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 34/66] target/arm: Fix ATS12NSO* from S PL1
Date: Mon, 22 Aug 2022 08:27:09 -0700
Message-Id: <20220822152741.1617527-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L1M9SeusmEez

Use arm_hcr_el2_eff_secstate instead of arm_hcr_el2_eff, so
that we use is_state instead of the currend security state.
These AT* operations have been broken since arm_hcr_el2_eff
gained a check for "el2 enabled" for Secure EL2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index fe06bb032b..4da932b464 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -146,7 +146,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
         }
     }
 
-    hcr_el2 = arm_hcr_el2_eff(env);
+    hcr_el2 = arm_hcr_el2_eff_secstate(env, is_secure);
 
     switch (mmu_idx) {
     case ARMMMUIdx_Stage2:
@@ -230,7 +230,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             return ~0;
         }
 
-        hcr = arm_hcr_el2_eff(env);
+        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
         if ((hcr & HCR_PTW) && ptw_attrs_are_device(hcr, s2.cacheattrs)) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
@@ -2360,7 +2360,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
             }
 
             /* Combine the S1 and S2 cache attributes. */
-            hcr = arm_hcr_el2_eff(env);
+            hcr = arm_hcr_el2_eff_secstate(env, is_secure);
             if (hcr & HCR_DC) {
                 /*
                  * HCR.DC forces the first stage attributes to
@@ -2493,7 +2493,7 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
         result->page_size = TARGET_PAGE_SIZE;
 
         /* Fill in cacheattr a-la AArch64.TranslateAddressS1Off. */
-        hcr = arm_hcr_el2_eff(env);
+        hcr = arm_hcr_el2_eff_secstate(env, is_secure);
         result->cacheattrs.shareability = 0;
         result->cacheattrs.is_s2_format = false;
         if (hcr & HCR_DC) {
-- 
2.34.1

