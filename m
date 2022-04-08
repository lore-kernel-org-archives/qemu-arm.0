Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp387338lfq;
        Fri, 8 Apr 2022 07:18:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVcwvui2p6sa4OzM1GxynryvgcRPpS+/RDPjIHKC0R2ay1t2RuU/c6XzM2bk0SYCHRvx9z
X-Received: by 2002:a81:3dd5:0:b0:2e5:d6be:7a56 with SMTP id k204-20020a813dd5000000b002e5d6be7a56mr15376529ywa.91.1649427499709;
        Fri, 08 Apr 2022 07:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649427499; cv=none;
        d=google.com; s=arc-20160816;
        b=GbwCtTujSgS2qEgxzTMSmv0z5y1pJx/s7F4EBigBhVWNUgeyUTU9oiFQQrMl/gz1nZ
         BoXt04UfpQ14JKUGMHlbRSDObXXl50qgXQAG5sKl1kgM2Tu6Uda9nNswShS1CDoF6lk2
         PK/5g2eqQ15fUHkiiUzYg0imfyojxrFwc9kuAUehiZYqek8rF97yWdW73N61iGJvb+tl
         6Tv4ssp4xwlRGkKtwZcsfMPn+stky5ppdagiaXUkkHLsXfZBvHZGkKvZG2w4ak9H/+Wv
         Ojw41sCnVmn6SeZJqYIoYROlRflpPeDXTA3Zai2mgd7BBIaWRZmXKx7uGPsrjMHhvQs+
         Kcew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3Se3GkmVa4NV7sCfZ/9G2/g6YhJ+ing9knztzsyRUdw=;
        b=Wt6rOP5bv8rg+X3GK2aXKGQdm/JmTc5tvBOo8+oZCYp6yaQjeE0JGnzZc6I9NnRwRf
         vYL03WWhdEbSaAwMqumxKaA7WsG8KSCO40gnXOgv0axRUhhgIQ1Iu6tX3tW+gIvAh6Ps
         vryHYWjmce2Ehxvb8eXYo7CN5pn7/xXzCEfnQuOVZvUJqDz6GEdzCwgYPOcA8CKZnhS+
         iG87sqlkHiMOIv7I+R/F2cNbWSL8iiCUNXB3D1QaLh44rWq0gBbNUks0dhK/AJ+rgVBF
         eHssIzQqOJL/XTcmIEfZ2AzQuvStHpfHomVOKmMPmHhAK5N+d/yeTu+V5DPsBxS94qdl
         QuVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ysNJeUqh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j64-20020a815543000000b002e5e6f10534si490150ywb.60.2022.04.08.07.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ysNJeUqh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpRL-0002La-4P
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP9-0006ic-Mc
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:04 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP6-0002Eo-QE
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:03 -0400
Received: by mail-wm1-x32a.google.com with SMTP id p189so5571437wmp.3
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Se3GkmVa4NV7sCfZ/9G2/g6YhJ+ing9knztzsyRUdw=;
 b=ysNJeUqh55770PzjpyFe0agtIaPOfNg5a01pcs8UjKG1K+7zOd3wZZxErZ3LWV6AIf
 uvACZt4O07RIxRNF92+c55AlvRpIowJ5g3uwDxOXVsa7B+72jzCsw8nvRLwQu0GQh9Qi
 ri431gpQ5FzSEkarADnGL9VIJkO3ckXHga5a3F/ITLGAv8c5vFHCKzl89av4wgyF9IOU
 hhD9YRKiZaATzqrYqcgPAGv2VoRRJTsroZJHi48SD+0fK7YgLddygQjY21i8eECFaMch
 HuCRL/HfF/cytg0gMcpRsXhW+C/+dwcyWDQI0qrlY5Wd+JIhWyiK4mAcfVQnY0XwDWGc
 yR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Se3GkmVa4NV7sCfZ/9G2/g6YhJ+ing9knztzsyRUdw=;
 b=PFhEP1OOUG7doy/jUgatxYRogMWIHt0s90KY6DjRRBaxaSQy10RfvmTOCvQNGlbA4c
 5xuLS5q7KhUbd51MNomi/7ZXtG2f5oHZcWAJXUTtnXK/Gz2TvgN8nfe3LszfA8eg59dO
 ms4FP+Zyg3Mr/BBW31cWuls1fZlh965HUNU7z9ex/2+wsqgu/IL45/qNxXeMRGRdwxgR
 Nbq+il+LD+UB2TiwDxELflmB1hT1LwMq4dZ8M3sUkc624tZksY2FUy8tHhtcv4YWucUj
 ToU0klMxmk2FErHTk7mCp+mycsNUfDgV5ZMK6YCdIm6tHdHjTzcQP1rG0LuzDSJDe4rF
 /ctw==
X-Gm-Message-State: AOAM531JX7nY7G7uaZ/tv0yt2w9xeZqziItJ4l8fyaqSE+XszjHp1Fml
 /tD6vVerahcPT9ZtS1r8QSEAehLB/S/3ng==
X-Received: by 2002:a7b:c382:0:b0:388:2e76:49ed with SMTP id
 s2-20020a7bc382000000b003882e7649edmr17374489wmj.195.1649427359125; 
 Fri, 08 Apr 2022 07:15:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:15:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/41] target/arm/cpu.c: ignore VIRQ and VFIQ if no EL2
Date: Fri,  8 Apr 2022 15:15:14 +0100
Message-Id: <20220408141550.1271295-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4sls0COuhuOq

In a GICv3, it is impossible for the GIC to deliver a VIRQ or VFIQ to
the CPU unless the CPU has EL2, because VIRQ and VFIQ are only
configurable via EL2-only system registers.  Moreover, in our
implementation we were only calculating and updating the state of the
VIRQ and VFIQ lines in gicv3_cpuif_virt_irq_fiq_update() when those
EL2 system registers changed.  We were therefore able to assert in
arm_cpu_set_irq() that we didn't see a VIRQ or VFIQ line update if
EL2 wasn't present.

This assumption no longer holds with GICv4:
 * even if the CPU does not have EL2 the guest is able to cause the
   GIC to deliver a virtual LPI by programming the ITS (which is a
   silly thing for it to do, but possible)
 * because we now need to recalculate the state of the VIRQ and VFIQ
   lines in more cases than just "some EL2 GIC sysreg was written",
   we will see calls to arm_cpu_set_irq() for "VIRQ is 0, VFIQ is 0"
   even if the guest is not using the virtual LPI parts of the ITS

Remove the assertions, and instead simply ignore the state of the
VIRQ and VFIQ lines if the CPU does not have EL2.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5d4ca7a2270..1140ce5829e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -694,6 +694,16 @@ static void arm_cpu_set_irq(void *opaque, int irq, int level)
         [ARM_CPU_VFIQ] = CPU_INTERRUPT_VFIQ
     };
 
+    if (!arm_feature(env, ARM_FEATURE_EL2) &&
+        (irq == ARM_CPU_VIRQ || irq == ARM_CPU_VFIQ)) {
+        /*
+         * The GIC might tell us about VIRQ and VFIQ state, but if we don't
+         * have EL2 support we don't care. (Unless the guest is doing something
+         * silly this will only be calls saying "level is still 0".)
+         */
+        return;
+    }
+
     if (level) {
         env->irq_line_state |= mask[irq];
     } else {
@@ -702,11 +712,9 @@ static void arm_cpu_set_irq(void *opaque, int irq, int level)
 
     switch (irq) {
     case ARM_CPU_VIRQ:
-        assert(arm_feature(env, ARM_FEATURE_EL2));
         arm_cpu_update_virq(cpu);
         break;
     case ARM_CPU_VFIQ:
-        assert(arm_feature(env, ARM_FEATURE_EL2));
         arm_cpu_update_vfiq(cpu);
         break;
     case ARM_CPU_IRQ:
-- 
2.25.1

