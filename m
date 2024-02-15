Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp742818ejb;
        Thu, 15 Feb 2024 10:08:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWPRz7dVjV+GU/uJUelIlcgtqQeYist8k04aYOXBtZwra2AWSNPCygOfXRGCTcQ6sw3I2fOSpfcKTwPKHZ8i07iTwdC0gBV
X-Google-Smtp-Source: AGHT+IHKrzdIJWMu9UBgOf9qNLTyGzfN5J6q7/L3pRZ+ibtVOFiQuvMaXJaV3YnJcGnMIQTtQQvt
X-Received: by 2002:a1f:e6c3:0:b0:4c0:2d9c:820a with SMTP id d186-20020a1fe6c3000000b004c02d9c820amr2337079vkh.14.1708020518209;
        Thu, 15 Feb 2024 10:08:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020518; cv=none;
        d=google.com; s=arc-20160816;
        b=SHHhr4jT4Lfh4Yo6A8YtbPjHXPWv6NPjlI2I7k4zoB17/ao/hUnC5/fzM+LV7kdZ+y
         HwWdOkso+pUNXifVivPkrzkMX2lMFOQRXZU7xspnjz/EPdNY347jSYIle51W9UlCWX6j
         UcozBdwO2+nVUZ6t0ilJSre2X+uKlN1A1pVfbW96f0Fgl0i42rBtm6Gv7MboTovnjacr
         nzK0n0SzoyQgR6uua9bHy2aWTiSuFqyNExAXxXg60TZuugsyJzPZOTz1+OUyaXPsmWoL
         40JhgAXygiTqaRD/FGQQ7i3Pn/+B62Cm3DWpE4cA2S1GQDewdLpTlrIfaQwcL2k8Z/4l
         QFNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=avVErRmCHTD7s/Wno/RUxec7ez6aln5fuHfjB8LlDS4=;
        fh=9FmWqhMZQcC4EuHtWI645KvKwclUV7VMoHjFU6Pz8/k=;
        b=ODAq4rlQQ8QzjZ29nUImlRQ8z+Fd/CsY3bMz1uPjIAGDXVhe3mxI/F9zxZl2yYCi2n
         8XcDUPPkeObhgF5BjddVFFMgobOTZQJzb+GoQ8NIJoPHbWBAH4699SDa+vtAERYlQ2wb
         /0EKP/t43uRcZgsKCBd5HFe0PpxpTNEXzeGFODBl+2Ar1UkqLby5ZoyEG7XncFgyMRwB
         p8HrPYXT9PCevy8DkKaabrH2fy99dO01+lLLlipXMbKnqUFp12QxrJr18rL86P+Qne3N
         V7nrXqNN1i5BZ478UmGLffVgUcyp06trYvBDVWeRFW72utjAbBHL0wIhgegGoK/sm7kE
         7o1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=muB9VQmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cz14-20020a056122448e00b004c0adac1ddbsi435062vkb.120.2024.02.15.10.08.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:08:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=muB9VQmX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag40-0004We-EH; Thu, 15 Feb 2024 13:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag3n-0003iB-If
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:02:15 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag3a-0002f7-20
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:02:11 -0500
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d180d6bd32so15282831fa.1
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020116; x=1708624916; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=avVErRmCHTD7s/Wno/RUxec7ez6aln5fuHfjB8LlDS4=;
 b=muB9VQmXoNWZB5wTWohU3kAoWKB41f9NiVeV/dmwSJJ5aanz7Vul3ZrowLzEFRfXFO
 4srIsGsRcorAEylAnMqbjsjm/9POY02XOboYfMVNR0Ep+bdQmu1Ke7xHUs48x60GLd2P
 3+cFjqkCvZIjVOGLx5f4oSf+EQxl1wf7qmdkTDFRjEPTIz2wXDEzhFUqpp/Wzdfz4A6N
 O/vJyx7EtBqr4lo366vmoeBw9T8XssOHkLA6fnHGbv3uqU8y2IYL4LdyZpgAVVjd4WoK
 hxM1PM9sF995WK81eJRRACYIQMQQMlqnYZXy9NKcDooaDWzirOc95dvUI7DJvy8Mx5Tw
 DVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020116; x=1708624916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=avVErRmCHTD7s/Wno/RUxec7ez6aln5fuHfjB8LlDS4=;
 b=nin0/cNw33GiRy25NlU9/Ys8vyvGO63lVtlqGAkRnTnVeDg+sugIYyi0ScHrDIVB6y
 UfeUvJ9k/wTAUSYWlLU1cfJallRCGVu9h2nYr1b+V/eoFAFbQWno3TaCffX7zlRGxuX2
 rFGEJmviIQMVGoi3TJn1XMHTGF+KU7XMNrlTzkRXHOI+FxTJLNqWV1mT5suflBeDy3n2
 rdRyPqqXvQwGBj3vrz2M+5LUKvdc83mT3ObCZ15M/A7/Ey3WDIaHQkihkhhkYN/2oJxr
 YGhdr6+Sh6IJ7EPjJF3kwI3QTowget2amY84dGHJsv8PZf+55q/AqbxwkF4gYZhLM008
 FtSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAxvMWIPb7ycM6Fp/1pmGKRqDbaL4wxeQjYr7F9wLvfRgUK61tXA6fxhNRCQaYqPZ/6qd0zh7uGQFY/vOlcKYpWTyh
X-Gm-Message-State: AOJu0Yy9A0XxEWbMYyo/E1aFu21lJu9y15fI1WCRqOYheWxzSqV5w5NZ
 n2CYyCTZebZSDx5DLfnu8oPy/qARUCeO9VX3pPj95Ca1xDNAj/I18Hq8nFeXQyyszUGviWRBznG
 QO0c=
X-Received: by 2002:a05:651c:d3:b0:2d0:cead:83cb with SMTP id
 19-20020a05651c00d300b002d0cead83cbmr1897443ljr.50.1708020116139; 
 Thu, 15 Feb 2024 10:01:56 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c294900b00410cc2f5550sm5662269wmd.19.2024.02.15.10.01.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:01:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PULL 36/56] hw/intc/grlib_irqmp: implements multicore irq
Date: Thu, 15 Feb 2024 18:57:30 +0100
Message-ID: <20240215175752.82828-37-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mxrQjeA6PSu+

From: Clément Chigot <chigot@adacore.com>

Now there is an ncpus property, use it in order to deliver the IRQ to
multiple CPU.

Co-developed-by: Frederic Konrad <konrad.frederic@yahoo.fr>
Signed-off-by: Clément Chigot <chigot@adacore.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240131085047.18458-5-chigot@adacore.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/intc/grlib_irqmp.h |  2 +-
 hw/intc/grlib_irqmp.c         | 41 +++++++++++++++++------------------
 hw/sparc/leon3.c              |  3 ++-
 3 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/hw/intc/grlib_irqmp.h b/include/hw/intc/grlib_irqmp.h
index c5a90cbb3e..a76acbf940 100644
--- a/include/hw/intc/grlib_irqmp.h
+++ b/include/hw/intc/grlib_irqmp.h
@@ -36,6 +36,6 @@
 /* IRQMP */
 #define TYPE_GRLIB_IRQMP "grlib-irqmp"
 
-void grlib_irqmp_ack(DeviceState *dev, int intno);
+void grlib_irqmp_ack(DeviceState *dev, unsigned int cpu, int intno);
 
 #endif /* GRLIB_IRQMP_H */
diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
index 1e073bd232..144b121d48 100644
--- a/hw/intc/grlib_irqmp.c
+++ b/hw/intc/grlib_irqmp.c
@@ -70,7 +70,7 @@ struct IRQMP {
     unsigned int ncpus;
     IRQMPState *state;
     qemu_irq start_signal[IRQMP_MAX_CPU];
-    qemu_irq irq;
+    qemu_irq irq[IRQMP_MAX_CPU];
 };
 
 struct IRQMPState {
@@ -89,37 +89,35 @@ struct IRQMPState {
 
 static void grlib_irqmp_check_irqs(IRQMPState *state)
 {
-    uint32_t      pend   = 0;
-    uint32_t      level0 = 0;
-    uint32_t      level1 = 0;
+    int i;
 
     assert(state != NULL);
     assert(state->parent != NULL);
 
-    /* IRQ for CPU 0 (no SMP support) */
-    pend = (state->pending | state->force[0])
-        & state->mask[0];
+    for (i = 0; i < state->parent->ncpus; i++) {
+        uint32_t pend = (state->pending | state->force[i]) & state->mask[i];
+        uint32_t level0 = pend & ~state->level;
+        uint32_t level1 = pend &  state->level;
 
-    level0 = pend & ~state->level;
-    level1 = pend &  state->level;
+        trace_grlib_irqmp_check_irqs(state->pending, state->force[i],
+                                     state->mask[i], level1, level0);
 
-    trace_grlib_irqmp_check_irqs(state->pending, state->force[0],
-                                 state->mask[0], level1, level0);
-
-    /* Trigger level1 interrupt first and level0 if there is no level1 */
-    qemu_set_irq(state->parent->irq, level1 ?: level0);
+        /* Trigger level1 interrupt first and level0 if there is no level1 */
+        qemu_set_irq(state->parent->irq[i], level1 ?: level0);
+    }
 }
 
-static void grlib_irqmp_ack_mask(IRQMPState *state, uint32_t mask)
+static void grlib_irqmp_ack_mask(IRQMPState *state, unsigned int cpu,
+                                 uint32_t mask)
 {
     /* Clear registers */
     state->pending  &= ~mask;
-    state->force[0] &= ~mask; /* Only CPU 0 (No SMP support) */
+    state->force[cpu] &= ~mask;
 
     grlib_irqmp_check_irqs(state);
 }
 
-void grlib_irqmp_ack(DeviceState *dev, int intno)
+void grlib_irqmp_ack(DeviceState *dev, unsigned int cpu, int intno)
 {
     IRQMP        *irqmp = GRLIB_IRQMP(dev);
     IRQMPState   *state;
@@ -133,7 +131,7 @@ void grlib_irqmp_ack(DeviceState *dev, int intno)
 
     trace_grlib_irqmp_ack(intno);
 
-    grlib_irqmp_ack_mask(state, mask);
+    grlib_irqmp_ack_mask(state, cpu, mask);
 }
 
 static void grlib_irqmp_set_irq(void *opaque, int irq, int level)
@@ -159,7 +157,6 @@ static void grlib_irqmp_set_irq(void *opaque, int irq, int level)
             s->pending |= 1 << irq;
         }
         grlib_irqmp_check_irqs(s);
-
     }
 }
 
@@ -263,7 +260,9 @@ static void grlib_irqmp_write(void *opaque, hwaddr addr,
 
     case CLEAR_OFFSET:
         value &= ~1; /* clean up the value */
-        grlib_irqmp_ack_mask(state, value);
+        for (i = 0; i < irqmp->ncpus; i++) {
+            grlib_irqmp_ack_mask(state, i, value);
+        }
         return;
 
     case MP_STATUS_OFFSET:
@@ -367,7 +366,7 @@ static void grlib_irqmp_realize(DeviceState *dev, Error **errp)
      */
     qdev_init_gpio_out_named(dev, irqmp->start_signal, "grlib-start-cpu",
                              IRQMP_MAX_CPU);
-    qdev_init_gpio_out_named(dev, &irqmp->irq, "grlib-irq", 1);
+    qdev_init_gpio_out_named(dev, irqmp->irq, "grlib-irq", irqmp->ncpus);
     memory_region_init_io(&irqmp->iomem, OBJECT(dev), &grlib_irqmp_ops, irqmp,
                           "irqmp", IRQMP_REG_SIZE);
 
diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index bc6a85be9c..3f86b74ba4 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -169,7 +169,8 @@ static void leon3_cache_control_int(CPUSPARCState *env)
 
 static void leon3_irq_ack(CPUSPARCState *env, int intno)
 {
-    grlib_irqmp_ack(env->irq_manager, intno);
+    /* No SMP support yet, only CPU #0 available so far.  */
+    grlib_irqmp_ack(env->irq_manager, 0, intno);
 }
 
 /*
-- 
2.41.0

