Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1008492ejc;
        Mon, 22 Aug 2022 09:23:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR40M7fDPozyhVj1v8WaH/KXYTWaFR6Ex2gt6a+NDBpu+I1mjN8sxs9aZSXBTDOTmri6nwlm
X-Received: by 2002:a05:6214:5185:b0:472:f9b0:cbc6 with SMTP id kl5-20020a056214518500b00472f9b0cbc6mr16031139qvb.92.1661185381930;
        Mon, 22 Aug 2022 09:23:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661185381; cv=none;
        d=google.com; s=arc-20160816;
        b=vG+H242/M27UZeIOqzWj1Jx3I6yiU5DL0szksY8GUg/N+8QwPNzVPFfdDI1fD0tmv9
         +OHYGE+u7hvV+nvoHeH1x4JVn4cdiBKw2+DeiPINDjFERyLdT+6wJw7gJRd/UIvnrDMS
         l9f8LV9dEdFYthpMaN49bcK0FXf+hjKAtrrFgoYTMklcmYYmctSg6zTrMj1Okz3mObvz
         hYwKlPfEaPhH+EamrlGsWNTxGEDyaz7bpDcAJnl9IR4t9/zDntnE6+vu1tDNPteCEwPf
         eeI03k67RjUmSPyjBTSAn9kQFhvqyOa3E3LDtP5iXAayc000cJdr9IPUJ3PyDvPox/vM
         bIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hP5+8v+RzVZCLhdFfgMbyeBX5j55jrO26f4OY0zFxiA=;
        b=jtujCAu0ly5ICK5vQ+TnHB3RQhpyATSQuWfNt5rLYnFoW7owYPH8hamPQ8NlPZ3tqV
         Zxt5pch4I3pqbOc1gBHljmExu43VtTv48pxeBUL51Jp1d6jM1aQOJkH9rIll3WdQvY0z
         4oJWhhBttgz8P/uGwpzk41Mb0JAh3gzHPyAze2uVX8xglbU+qDNo9mm7LcjGuaG2mDg3
         9CqV1veag0LEyP9OFKeXtXws3VMhjRxZS6wJ/GQc4/SCSoW1/64/T/M2cnVfA+IUAITf
         7ucHoLliPPCxDGDV0HJpAHuUJgMwM7bqB2zwbe3pL/mNc/1fzihESXoHCQssmkyGxZVU
         s/tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O8YRS71z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4-20020a05620a44c400b006bbc0e74256si4980438qkp.365.2022.08.22.09.23.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 09:23:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O8YRS71z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQACb-0006cL-79
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 12:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Om-0004gW-Es
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:34 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:37778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Oh-0001dF-0x
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:31 -0400
Received: by mail-pl1-x634.google.com with SMTP id m2so10259418pls.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=hP5+8v+RzVZCLhdFfgMbyeBX5j55jrO26f4OY0zFxiA=;
 b=O8YRS71zzDOs2TnlO+clL0QYI4M5PdDtCcQBJnhIagijyKQ62eaOFfKU61/8Slu1FP
 anQ0+O7AKqkuEoUdZsgX99KPsmGM9+6Wwxl/v1zYNs3WlEQy5A/IPn2X99q5lYC+VeaM
 jY4uJDlA/M6tjhQYQUN/M5gLNi5Y5gSaMA7lN6h9H2CPqrkY/7JcKnRZP7i1FRqxGRQy
 pXu7UwLWuj3JrsWKqvhKB7E8eXTNHxzwWidvimTaIwJcjRS6Vlb2PnyFaJUlKunWHHkH
 bY6P/idNqXeQ8+TEUg+J/R5yy2Lws+i0Ns36e/z6xOI+oAubJ4rq5cXDkSQqe97KRmCx
 kAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=hP5+8v+RzVZCLhdFfgMbyeBX5j55jrO26f4OY0zFxiA=;
 b=r4DsFGrPzQdUMh165K1ag9tpVGe3zLUjiiPe/YU+V3ZVHlvPzoVzCdW2+q4TOHvl7v
 AdO8fC5Icd2O0/UPaccJGtIpagk71UyqL1foEV3974VmC56AK/YwKtK+506Bvb3yd1SD
 3MiWq599Fj3fKoZbEx/kzm1AKenAzoyg0JKSxN5KL34olx9hfwRI45BqiSpw3yyur5Na
 /eJCf12T2MwuhkHhV7YJUlgJsLJVxFajtEemR0OYs0VbxSsc+gXMLraSWASKqtRFoX2K
 OJNBV14kvFnizH+n3iL8Q0H0/8GD2YuTPgyczliPQwSdO/oQUlFWUojjeUZhLw3U3Gu1
 dI3g==
X-Gm-Message-State: ACgBeo2Sei3Ug66Cemc2DDivpPWMiQa5QnMSoJyUv2eUcleQRPx3itCz
 t/S6BDUGrrjts9ZKE/4iA/VHK9/jttAkqw==
X-Received: by 2002:a17:90b:2802:b0:1fb:4efd:a1ca with SMTP id
 qb2-20020a17090b280200b001fb4efda1camr2300608pjb.198.1661182285730; 
 Mon, 22 Aug 2022 08:31:25 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 48/66] target/arm: Add ARMMMUIdx_Phys_{S,NS}
Date: Mon, 22 Aug 2022 08:27:23 -0700
Message-Id: <20220822152741.1617527-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: AXZp40xZJX2d

Not yet used, but add mmu indexes for 1-1 mapping
to physical addresses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h | 2 +-
 target/arm/cpu.h       | 4 ++++
 target/arm/ptw.c       | 9 +++++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 689a9645dc..98bd9e435e 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -40,6 +40,6 @@
     bool guarded;
 #endif
 
-#define NB_MMU_MODES 8
+#define NB_MMU_MODES 10
 
 #endif
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f48dcadad6..76391dc47d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2959,6 +2959,10 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_E2        = 6 | ARM_MMU_IDX_A,
     ARMMMUIdx_E3        = 7 | ARM_MMU_IDX_A,
 
+    /* TLBs with 1-1 mapping to the physical address spaces. */
+    ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
+
     /*
      * These are not allocated TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 69c22c039b..e409c8034f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -179,6 +179,11 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
     case ARMMMUIdx_E3:
         break;
 
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_S:
+        /* No translation for physical address spaces. */
+        return true;
+
     default:
         g_assert_not_reached();
     }
@@ -2289,6 +2294,8 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     switch (mmu_idx) {
     case ARMMMUIdx_Stage2:
     case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_S:
         memattr = 0x00;    /* unused, but Device, nGnRnE */
         shareability = 0;  /* unused, but non-shareable */
         break;
@@ -2579,6 +2586,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         is_secure = arm_is_secure_below_el3(env);
         break;
     case ARMMMUIdx_Stage2:
+    case ARMMMUIdx_Phys_NS:
     case ARMMMUIdx_MPrivNegPri:
     case ARMMMUIdx_MUserNegPri:
     case ARMMMUIdx_MPriv:
@@ -2587,6 +2595,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         break;
     case ARMMMUIdx_E3:
     case ARMMMUIdx_Stage2_S:
+    case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_MSPrivNegPri:
     case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
-- 
2.34.1

