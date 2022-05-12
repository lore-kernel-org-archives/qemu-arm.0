Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp484494lfj;
        Thu, 12 May 2022 08:16:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaKpMwkbUIZTfHAZ8IW/fWLn8onCfN59p5TMURRJ7f3I2UUXrRl0XNY+Q5Y8fhI3jw+fJ/
X-Received: by 2002:a67:f807:0:b0:32d:577e:1efa with SMTP id l7-20020a67f807000000b0032d577e1efamr364881vso.35.1652368574873;
        Thu, 12 May 2022 08:16:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652368574; cv=none;
        d=google.com; s=arc-20160816;
        b=wwkDcbG9V4VmX34NI1cbsCjs1NpHiL8mxyjuW/FmDyO1s+yWCalpMPfdDpKA8in+8p
         zgQfVy/Ya/39nBvYm1mcWQ1sIVu+agubUjlwn0yi1pXIcmVIcPuZWOWAk5VQxZ3Z0M5S
         oWt/CjrfPvDMGczAvCDXetCpAiNhBmdyeinTV2oABpz/SjD0NBwzb6sPpWz2cJIgIpsl
         oCPjCBP2Ge4qBnUqDxIj5FrFpl8raq7duphcZPxpAt7KDpVMWJ3bPsqkP3+h4W6sBPCc
         8hfHqsBzplp4MBhQT04RTYji4G2IVLQsE44YdeOq8E9J3wdpoBhHKl3t8k2ctB9fU+ff
         TrrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hMQaJT6/V9cigeOWwKRdKjLzKXge3k4QnBfzWy9pCoI=;
        b=Dkaxn7rg+v2KyjN/HfOwmeP5PcJhC/f1znnoiPoGaOhYrVVQjmdBIeXvPv2je/zRZ+
         BUkHzOHag/9iaElf+3/aoaeTWEnTt788xk+qGuh1p0qd0yWbhN7Qb55nN/0nputqQTW2
         +oQMnwfhbhTFgNTQNz2dSvzHcQ2Hpa/DsYADWvwTAn50AuR1FqXcD/TZu4ayoOoIAnaG
         8NwCv1xl07z7y5JgSA1RPvxnwWrNyHZver4+QEHF3/jbK3b5LJODm65QmBGtGSzMV7AK
         tMOtOaLgfrndfeIESRMR/Ivgjm6TXh47w1Qx70N5vSLri95IQocCzrPeeS4jgH2kqZ5C
         JM/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AmGx09SD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020a67c904000000b0032a21fac890si1120845vsk.389.2022.05.12.08.16.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 May 2022 08:16:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AmGx09SD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npAY2-00049L-Cm
	for alex.bennee@linaro.org; Thu, 12 May 2022 11:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWu-00032r-2k
 for qemu-arm@nongnu.org; Thu, 12 May 2022 11:15:05 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npAWr-0000Au-FW
 for qemu-arm@nongnu.org; Thu, 12 May 2022 11:15:03 -0400
Received: by mail-wr1-x42c.google.com with SMTP id a5so3914016wrp.7
 for <qemu-arm@nongnu.org>; Thu, 12 May 2022 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hMQaJT6/V9cigeOWwKRdKjLzKXge3k4QnBfzWy9pCoI=;
 b=AmGx09SD9+RUYdRyBxAaH9jkRWfzIKcfrtwj6VY/CipmXTYhirXAHAyLu1ZD8W/f10
 WcKV3C1lGud2wb6Bpdv80helNWHJCTUXuCNTxetQF5EUYo+p1C4WmkIcjgpD9YYz62JG
 xJdrAPAb4gPwsV4bspt9a+N1jcq3ErXok/pRtX+EUb61T7AkMEQ1sH3k0NeBbWXtcDp1
 WbLzzxpDeGmZdhHV7d2qqJpaTSBd1Ix3dERS8K9vFD9EAxVOqq1meRuXhkP1gc5kHpjZ
 WHbo/DkO0umuTJc6nhXBd7LnFvS6KLSfPf5KMxNN8p8+CafItC85cG124nDdxGIvqdUi
 oaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hMQaJT6/V9cigeOWwKRdKjLzKXge3k4QnBfzWy9pCoI=;
 b=i+lSgQjonwrFgsRGGMeY3Sdo8Y48K3tg7clDLquyeTGyT+Tv0FaQB0IgoD7RFtuo1Z
 WaRr3dYTl6QdGcuhqyJL9As18Q68Qiu5cJmpwelD54xyLDUAKG7EAQP7+C4eiAO60nW/
 SPp6wCkycuQBcGnyy2BApvQLR/oHr7A1a8q5sE/btw7LwKfMeKfDRZwVaDM521bg59u9
 VyI5AturfS5NkXdmdPWfm5PDITjAp7POZdhQ0y8fhKKmBIjd6w95K01Hlu0w3o8ydlae
 RvtEjOXCiEPwKYFP8OIXwjj9pemkkbFmT815fWiccP1MEglOowWyX4hpmW+FK0DJGHZ2
 Jk3g==
X-Gm-Message-State: AOAM531EcCIZXA0F0HKc10deOcFqTSS7QY4f0nNLPTluAMAbOn3x824m
 eoEYenm1kepO5gPDrFOB90BdRkBEzIvqPQ==
X-Received: by 2002:a05:6000:1acd:b0:20c:811c:9f39 with SMTP id
 i13-20020a0560001acd00b0020c811c9f39mr137942wry.482.1652368500004; 
 Thu, 12 May 2022 08:15:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm3048378wmb.42.2022.05.12.08.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 08:14:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/6] hw/intc/arm_gicv3_cpuif: Handle CPUs that don't
 specify GICv3 parameters
Date: Thu, 12 May 2022 16:14:52 +0100
Message-Id: <20220512151457.3899052-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512151457.3899052-1-peter.maydell@linaro.org>
References: <20220512151457.3899052-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: pevu3XM6I+oQ

We allow a GICv3 to be connected to any CPU, but we don't do anything
to handle the case where the CPU type doesn't in hardware have a
GICv3 CPU interface and so the various GIC configuration fields
(gic_num_lrs, vprebits, vpribits) are not specified.

The current behaviour is that we will add the EL1 CPU interface
registers, but will not put in the EL2 CPU interface registers, even
if the CPU has EL2, which will leave the GIC in a broken state and
probably result in the guest crashing as it tries to set it up.  This
only affects the virt board when using the cortex-a15 or cortex-a7
CPU types (both 32-bit) with -machine gic-version=3 (or 'max')
and -machine virtualization=on.

Instead of failing to set up the EL2 registers, if the CPU doesn't
define the GIC configuration set it to a reasonable default, matching
the standard configuration for most Arm CPUs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The other approach would be to make the GIC fail realize if the
CPU type doesn't officially have a GICv3 interface, and make the
virt board check for mismatches and handle 'gic-version' accordingly,
but this seems like less effort. I don't think anybody's likely
using this corner case anyway: the only reason I ran into it is
that with my patches to add cpu->gic_prebits one of the tests
in 'make check' now runs into it because it unintentionally and
unnecessarily asks for gicv3 and cortex-a15.
---
 hw/intc/arm_gicv3_cpuif.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 9efba798f82..df2f8583564 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -2755,6 +2755,15 @@ void gicv3_init_cpuif(GICv3State *s)
         ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
         GICv3CPUState *cs = &s->cpu[i];
 
+        /*
+         * If the CPU doesn't define a GICv3 configuration, probably because
+         * in real hardware it doesn't have one, then we use default values
+         * matching the one used by most Arm CPUs. This applies to:
+         *  cpu->gic_num_lrs
+         *  cpu->gic_vpribits
+         *  cpu->gic_vprebits
+         */
+
         /* Note that we can't just use the GICv3CPUState as an opaque pointer
          * in define_arm_cp_regs_with_opaque(), because when we're called back
          * it might be with code translated by CPU 0 but run by CPU 1, in
@@ -2763,13 +2772,12 @@ void gicv3_init_cpuif(GICv3State *s)
          * get back to the GICv3CPUState from the CPUARMState.
          */
         define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
-        if (arm_feature(&cpu->env, ARM_FEATURE_EL2)
-            && cpu->gic_num_lrs) {
+        if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
             int j;
 
-            cs->num_list_regs = cpu->gic_num_lrs;
-            cs->vpribits = cpu->gic_vpribits;
-            cs->vprebits = cpu->gic_vprebits;
+            cs->num_list_regs = cpu->gic_num_lrs ?: 4;
+            cs->vpribits = cpu->gic_vpribits ?: 5;
+            cs->vprebits = cpu->gic_vprebits ?: 5;
 
             /* Check against architectural constraints: getting these
              * wrong would be a bug in the CPU code defining these,
-- 
2.25.1

