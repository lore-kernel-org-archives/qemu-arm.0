Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp739610ejb;
        Thu, 15 Feb 2024 10:04:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXcbCG2Oy2VDKEYo96998JJLB7StfJiK92lHAToJEUO/MV9H3k/O4rgx8ez21snAO/QDacFX3kZ1SLz/xGOGMUvGEeLmxUW
X-Google-Smtp-Source: AGHT+IEWuHHJ6k0brHsJ8kz8sj2XC5IcxDWgbMPCbki1JTiUKSBqGNQOG6Gl+iPmKE7DnpRel0EZ
X-Received: by 2002:a9d:6a11:0:b0:6e4:323c:131 with SMTP id g17-20020a9d6a11000000b006e4323c0131mr1019273otn.29.1708020270938;
        Thu, 15 Feb 2024 10:04:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020270; cv=none;
        d=google.com; s=arc-20160816;
        b=qjqHC9nmI45XWIEqCHQQNgOG7oD5Qmx2JnlivwT3ZfyjEetdemwnUajYOES5zQJ54j
         vVd6lfjdFxpgXZg/29+yB2TvuwqZE39fyJ4IjkC4tzAFyFBsvO5sRN3pb2znrrc4cMVb
         dCp3o2s4JNF9zEQAaN/bnmdNxY9Y3xyui4ovzGAY0USUZVR1/kmqvI1D11P5+gE97kv5
         VJS3zYRRF6poht9iUYoFdgcIgnAsCImVOSprALXG/MhEBbr0gM7yJvfjR4UCPlGJUyUW
         VUfoHlZ39fuQ+rzVHjQDsM91Me472I08NLirVXtLfa9OnlLObCHa06XhHGuOQuhlCPLq
         IlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=d24ptjop5v0vDtRVKzO4zmRV4raxlddQ2KCuegz4KuQ=;
        fh=2F6BCO1RRN0Fjy8Mt0G7Jo5a43pg6Ew4+wayHz6ZGhk=;
        b=X2Y3SievP4g/KYGz22zznxhqU4gA08Ix7fJzSrRbXM2GkwNoxnWkKYkRiz+iVLIvXO
         yIQZ1swTlrRp0Uz+6Bj6Ui6rpzgMdekhINzQhh+x4Rwbe13oiyR3BOqnvT3DuGGgcuce
         XAZ6yQ6OnNwZiLQio3zh+RaorSZocBuR3Eza3eW/9LUzMZY/FdTeNNBx/syG9tjx3o7p
         pwbhQwgwR6O4nyr1S/lsFJq3E+9TxsKWELsy15zx8EatQ3n8YFXAfkJ9qWc9W+6q1zxG
         g50sdm30hQ7icJo+14RYrPis04GHpxaYVQbfJOzL5R+gsB5bSijS7b3NNLKWdflo0nG7
         Fk0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iE1pr4Ad;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hp8-20020a0561022a6800b0046d32e7f998si339735vsb.322.2024.02.15.10.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:04:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iE1pr4Ad;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag46-00051T-7u; Thu, 15 Feb 2024 13:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag3a-0003NO-GL
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:02:00 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag3U-0002dw-Vv
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:01:58 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33d00a999b4so486192f8f.0
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020109; x=1708624909; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d24ptjop5v0vDtRVKzO4zmRV4raxlddQ2KCuegz4KuQ=;
 b=iE1pr4AdBSs5B4LHUVicwSvRTLthFEBDiRbnz0Isko64bZsM3CqB46gUyW0vDZORJg
 XD3ZoywU/irnjJUmju++FF7OagnN07+bSym5iUEP5IrO0bZsU+zVkSG7xXOfbaEU1ARC
 NkKbnrI7UnjRihnJNh6J0OnHaT1OfLdFVEr6jrWLz+84b0M01M4Yy4e/BZqfS7YhlUza
 0vcx+QAuM1hPd1uxkYIjPJsh7PvlduvrR2AkD4NC42qOABDxfBdT+6/jvzviN7l/el1H
 BuO3TC5xiF+W0CrjdjdhZ3cSKE0xV/DK04fwNgzAFnNAiAi3m0hTWpdnjeD9DUo57Mam
 v3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020109; x=1708624909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d24ptjop5v0vDtRVKzO4zmRV4raxlddQ2KCuegz4KuQ=;
 b=MIHNwU6DIpnRPe1IxuYMmW3RHEX7FEA8KhwFaU8vjEsI/7CX1hs5MerYCcWHy2+wWi
 7/IqUH345IFFivNP921lUd4314zoYQs7fmsBI7Iez0r+hnLDZeeeU3wSrwETYrX0qW5O
 478heEAbowu0+HpEgdzm4nfh0vsbeUvswQGlkUoUC0+Q8pNXynYXgLHjVQ9eFWfuUjTo
 zsNtugZAWV2arHShhqgsxit+PICDpt5mQJqMVYTxqlVGSsuWR2yEluZtLga8906v/pMR
 LpjtI4NJKfr0ldk3dMhyWXv960FsUSYnmkA5rj2vn4BWhWU8aDme9OSSMm48nik9K73/
 i1sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6JYOMeWXCWYGfYKEBSMLhMTGV6o1Qg1fGPKCC0SxsQcGEDciNlXvB/4S5qXWi/7LZR2eJEGytHcwx3o3nqUCwXi0n
X-Gm-Message-State: AOJu0YyZYlHqVPIZz10d1tmY9AJHkd7M+bDiWnvh3GDLjsZHY0H7acBU
 H0May+hYheHufWxpRVJZ7r3ssufbo7qHFCmdz1d3M7psBeOZ68Ux6z5t8qZLh5g=
X-Received: by 2002:a5d:4491:0:b0:33b:87a0:3af with SMTP id
 j17-20020a5d4491000000b0033b87a003afmr1863512wrq.67.1708020108771; 
 Thu, 15 Feb 2024 10:01:48 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 bu23-20020a056000079700b0033cdf4bea19sm2621169wrb.9.2024.02.15.10.01.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:01:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 35/56] hw/intc/grlib_irqmp: implements the multiprocessor
 status register
Date: Thu, 15 Feb 2024 18:57:29 +0100
Message-ID: <20240215175752.82828-36-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IHLWeEtWzIqb

From: Clément Chigot <chigot@adacore.com>

This implements the multiprocessor status register in grlib-irqmp and
bind it to a start signal, which will be later wired in leon3-generic
to start a cpu.

The EIRQ and BA bits are not implemented.

Based on https://gaisler.com/doc/gr712rc-usermanual.pdf, §8.3.5.

Co-developed-by: Frederic Konrad <konrad.frederic@yahoo.fr>
Signed-off-by: Clément Chigot <chigot@adacore.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240131085047.18458-4-chigot@adacore.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/grlib_irqmp.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
index 744cd64c58..1e073bd232 100644
--- a/hw/intc/grlib_irqmp.c
+++ b/hw/intc/grlib_irqmp.c
@@ -52,6 +52,10 @@
 #define FORCE_OFFSET     0x80
 #define EXTENDED_OFFSET  0xC0
 
+/* Multiprocessor Status Register  */
+#define MP_STATUS_CPU_STATUS_MASK ((1 << IRQMP_MAX_CPU)-2)
+#define MP_STATUS_NCPU_SHIFT      28
+
 #define MAX_PILS 16
 
 OBJECT_DECLARE_SIMPLE_TYPE(IRQMP, GRLIB_IRQMP)
@@ -65,6 +69,7 @@ struct IRQMP {
 
     unsigned int ncpus;
     IRQMPState *state;
+    qemu_irq start_signal[IRQMP_MAX_CPU];
     qemu_irq irq;
 };
 
@@ -72,6 +77,7 @@ struct IRQMPState {
     uint32_t level;
     uint32_t pending;
     uint32_t clear;
+    uint32_t mpstatus;
     uint32_t broadcast;
 
     uint32_t mask[IRQMP_MAX_CPU];
@@ -182,10 +188,12 @@ static uint64_t grlib_irqmp_read(void *opaque, hwaddr addr,
         return state->force[0];
 
     case CLEAR_OFFSET:
-    case MP_STATUS_OFFSET:
         /* Always read as 0 */
         return 0;
 
+    case MP_STATUS_OFFSET:
+        return state->mpstatus;
+
     case BROADCAST_OFFSET:
         return state->broadcast;
 
@@ -224,8 +232,9 @@ static uint64_t grlib_irqmp_read(void *opaque, hwaddr addr,
 static void grlib_irqmp_write(void *opaque, hwaddr addr,
                               uint64_t value, unsigned size)
 {
-    IRQMP      *irqmp = opaque;
+    IRQMP *irqmp = opaque;
     IRQMPState *state;
+    int i;
 
     assert(irqmp != NULL);
     state = irqmp->state;
@@ -258,7 +267,18 @@ static void grlib_irqmp_write(void *opaque, hwaddr addr,
         return;
 
     case MP_STATUS_OFFSET:
-        /* Read Only (no SMP support) */
+        /*
+         * Writing and reading operations are reversed for the CPU status.
+         * Writing "1" will start the CPU, but reading "1" means that the CPU
+         * is power-down.
+         */
+        value &= MP_STATUS_CPU_STATUS_MASK;
+        for (i = 0; i < irqmp->ncpus; i++) {
+            if ((value >> i) & 1) {
+                qemu_set_irq(irqmp->start_signal[i], 1);
+                state->mpstatus &= ~(1 << i);
+            }
+        }
         return;
 
     case BROADCAST_OFFSET:
@@ -325,6 +345,8 @@ static void grlib_irqmp_reset(DeviceState *d)
 
     memset(irqmp->state, 0, sizeof *irqmp->state);
     irqmp->state->parent = irqmp;
+    irqmp->state->mpstatus = ((irqmp->ncpus - 1) << MP_STATUS_NCPU_SHIFT) |
+        ((1 << irqmp->ncpus) - 2);
 }
 
 static void grlib_irqmp_realize(DeviceState *dev, Error **errp)
@@ -338,6 +360,13 @@ static void grlib_irqmp_realize(DeviceState *dev, Error **errp)
     }
 
     qdev_init_gpio_in(dev, grlib_irqmp_set_irq, MAX_PILS);
+
+    /*
+     * Transitionning from 0 to 1 starts the CPUs. The opposite can't
+     * happen.
+     */
+    qdev_init_gpio_out_named(dev, irqmp->start_signal, "grlib-start-cpu",
+                             IRQMP_MAX_CPU);
     qdev_init_gpio_out_named(dev, &irqmp->irq, "grlib-irq", 1);
     memory_region_init_io(&irqmp->iomem, OBJECT(dev), &grlib_irqmp_ops, irqmp,
                           "irqmp", IRQMP_REG_SIZE);
-- 
2.41.0

