Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4342185lfm;
        Tue, 23 Jun 2020 12:39:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwts+0xlW/W7mDLIbzLKyw7G+Y/W9HzU16ycwLFl5fINRLE9bYSljpPuuWbHQzqr6HVKx8Y
X-Received: by 2002:a25:388d:: with SMTP id f135mr37462601yba.201.1592941157711;
        Tue, 23 Jun 2020 12:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941157; cv=none;
        d=google.com; s=arc-20160816;
        b=ScU5GP15JYXgR1GBVpH7jHAYEX08LPVwK9t2FbeKXjBzp4OvwXNBvPBvdSKgf3nclZ
         6x0C0KzKqQv5HinzYGS5rKs3I7iUBXi7KF+7Zz4Rtctx4yC44jrhYQRf4XtFLZ6ndHzF
         pmsfhIZlZgQ3Uppwwgy+dqbwoYba/hi4hjLYuHE+TSS6B5L+bCE3QAkaFBnUGEKm8/Og
         4LhWVyBDaAyioD0SHWVDfr5Q0p+OZhxuVQYn1VSrPRZ5VAPtQdV4RGVFRw5wgNEa6q3H
         Z9wBuIj+TFvpcCyPSy6yF1miaPfhspc36xJLrsg36brgw1dkqigholBE4gyYmwafhZKc
         Fg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AlIgM6p7oAT+zID+rk9BPqh6DFQ2CZ3GNfJxW/eCI2s=;
        b=Si1RBj3S2Ql7lN6Gb7kO3cU4eblJC22nB/Sh5s5bAa91GoPuEA/VFpe9AMOiYZKEWJ
         O/5ZaW2kFvNzkRP1Cc8AALhkNT1ornmsr1jI0fQSLs04QC4dAsEsSuXLUWpxvAXY4/FK
         3rjpUenzMlv1zzWmXpSk/LePAho0Rm3oWSt/S9+nZQDGLlWBoz8CDUQefTlvpA5s/tN8
         bzesG7M4GOZzpygB6bQPMyis1QqfZ7G805fyNbW6P+BjGZ9kZuulXgbrJNl4/OFsnSAh
         b5nZT6NvX3VDm1z9RAuJON6T4vfMIjIbNao/cRkXBfp4jr5SyDwGmgKqcLJ9A3QK4j5S
         4bSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c0wevK6U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10si17299083ybp.442.2020.06.23.12.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:39:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c0wevK6U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnolI-00089c-Vz
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojF-0003Es-GH
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:09 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojD-0005W1-Lo
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:09 -0400
Received: by mail-pf1-x444.google.com with SMTP id a127so10541896pfa.12
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AlIgM6p7oAT+zID+rk9BPqh6DFQ2CZ3GNfJxW/eCI2s=;
 b=c0wevK6U65i14/qwTuSTYORUsvxx1u0fzHDtfuQM6yEuMT4D1BU91SuEDKZ6IHZnDa
 Dl7+T8tHAlaoJqyz2B6ERtTzubUZS296aY6OTRRl7ckZyb5u1VCMT7Z80lBD33jvTjFh
 hgwRjfU24w2NDUR9CtfBL9kWjuYAftZmvV4WBRNA/qO959qUF63Rgw/DJXs76qMSLpDI
 V1qtS6f5RaC69EjJ22STz5E5AzMvsUIFHyWAX4g23CtPd3X/YRklt5dC6cKJRzM9lm1U
 A5MWXvVLMVBHT9UAO07ZMbnXPqVKl91/CjxizK/QriZ1ZcZ+9ek7iMHbdM+gOaQiTc4T
 WGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AlIgM6p7oAT+zID+rk9BPqh6DFQ2CZ3GNfJxW/eCI2s=;
 b=TsOPwwy4I3ZZqt9MS9f0e5LS+Aq4eqYbWYM9Pins+O7B6cLwE+5CgFHVA2Q7Q5GBrc
 ozcx2dnbNLFieWp+/vmsZWjePY5xfqVk3s9qa/IxL8aqYlW72xpfRT/HwzSachcWYU/n
 u7AOkoIX6dJUyGvmUn3fRpN5j3PT07KXjcVsBVzSSm6wiSulEqxp5IvHe+GPJtBhzV2Y
 xvh9llK7d+68suamhStRNT7z71wAFOqlfo2oDjuzfYaK/lKMPoSC8QLxuY9LFBO/wUrf
 TrYhjPMFOu9u5iEkDQXAXohq2+Z1J90C5rFWPkYXlywv8Oq+QaDozgFf3HiO/bkxQ0u1
 VOnw==
X-Gm-Message-State: AOAM532pIMoLiExQS9+XgvekxvsoTssWdntZ5+tML66ml6MBQXkEwS1v
 SSM+njBwZR2rqfm4PSVcOy27Zw==
X-Received: by 2002:a05:6a00:801:: with SMTP id
 m1mr26967413pfk.200.1592941026133; 
 Tue, 23 Jun 2020 12:37:06 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 04/45] target/arm: Add support for MTE to HCR_EL2 and
 SCR_EL3
Date: Tue, 23 Jun 2020 12:36:17 -0700
Message-Id: <20200623193658.623279-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pUxrB3gVhEBl

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v8: Include HCR_DCT.
---
 target/arm/helper.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8a0fb01581..d6c326b58e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2021,6 +2021,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_pauth, cpu)) {
             valid_mask |= SCR_API | SCR_APK;
         }
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            valid_mask |= SCR_ATA;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
     }
@@ -5248,17 +5251,22 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_pauth, cpu)) {
             valid_mask |= HCR_API | HCR_APK;
         }
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            valid_mask |= HCR_ATA | HCR_DCT | HCR_TID5;
+        }
     }
 
     /* Clear RES0 bits.  */
     value &= valid_mask;
 
-    /* These bits change the MMU setup:
+    /*
+     * These bits change the MMU setup:
      * HCR_VM enables stage 2 translation
      * HCR_PTW forbids certain page-table setups
-     * HCR_DC Disables stage1 and enables stage2 translation
+     * HCR_DC disables stage1 and enables stage2 translation
+     * HCR_DCT enables tagging on (disabled) stage1 translation
      */
-    if ((env->cp15.hcr_el2 ^ value) & (HCR_VM | HCR_PTW | HCR_DC)) {
+    if ((env->cp15.hcr_el2 ^ value) & (HCR_VM | HCR_PTW | HCR_DC | HCR_DCT)) {
         tlb_flush(CPU(cpu));
     }
     env->cp15.hcr_el2 = value;
-- 
2.25.1

