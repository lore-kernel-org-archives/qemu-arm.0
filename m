Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp739703ejb;
        Thu, 15 Feb 2024 10:04:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX7mFR75Y3OEehMuX1vZ+6mnMmfoFpL81WV6rbvl0QMfQa0s0cwjHxGhXwIcc55b3FQqPONhzCAP5M4BU+EhbTeZYVUVZf0
X-Google-Smtp-Source: AGHT+IGhAqfVJT09d6vm2nd7vE48N30s5jijv45Z8CF1wroO6J7idSix3gJVZhvKi18XGsNA3oJ/
X-Received: by 2002:a67:e945:0:b0:46d:28b4:95a2 with SMTP id p5-20020a67e945000000b0046d28b495a2mr2927039vso.32.1708020276656;
        Thu, 15 Feb 2024 10:04:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020276; cv=none;
        d=google.com; s=arc-20160816;
        b=B7KIM199UmNn3rklzNAABExhFK1JzbEqk+TDFoXmg+Q5OuWqOpsSJ/H2kuQBwQ5CJ6
         4xS5FMRcAYBoz+WlZGc/RDYQawGoot6wo3GKun/hlmgrM/bevfc+fRe3JpgwtPTcivhk
         BUb8QDgByLXwwARjtVoyq96wA83CsCv2AGkilV8W5x8CtWaJwUy/ARE2JvJkSeozIswd
         bdtEYKbGwaGa452vB03fyhFEFKU0+u98lTk9GnWq41zWQYQGcJeSUzSlAAVyt+UQl1KD
         KWcud5c0dMXQ96sq5UCdWw+ar3PWEAlqX0euXSO9P/W0g6AC7lY8ewR7FdRXpc8AOgLf
         ClYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ruX53CbVKYFd9a03NjcuApvlZnuC4B/Alw04ClG0uNE=;
        fh=r+mbcaIVBB+d5Ke8c8av/RXIbk1kcul/Ph9l9m3Dfks=;
        b=A5nI/i9k0anC7ImWu1XUneb8ggvjXPlmKE8Wskmn+t220PUZw5SOHraNJEnedAR4Cd
         dCU4V5HncsAjJ63OYG+aq3M7gQt0jbEs9WRyzzRYnYLNiNcf+kqn9fgadfb6922fk1La
         PVgiYudcAaU/slXpmnB6hSh3bD8sON9cTM0K2Garnal7bTsYSD9IM/96/T+JElgY0j55
         fd/ZlYQLSl/1fWP6H1SIHjtC3CBEi4s+eFJyc2RgGWxg+gyOzGMJVznEfbe3zUOsUY7h
         EZIHK+n4DScwQnEH9RwLdQINuMbZy4IrGx6iqaScvkcx1SuiTL5znp4edN5QBXfpJwAT
         b3XA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hOI1M3o3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h29-20020a056102209d00b0046d1303f8a3si350585vsr.764.2024.02.15.10.04.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:04:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hOI1M3o3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rag3y-00046h-D0; Thu, 15 Feb 2024 13:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag3Q-00036Z-65
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 13:01:49 -0500
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag3M-0002cw-F1
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 13:01:47 -0500
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d1025717c7so13584431fa.2
 for <qemu-devel@nongnu.org>; Thu, 15 Feb 2024 10:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020102; x=1708624902; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ruX53CbVKYFd9a03NjcuApvlZnuC4B/Alw04ClG0uNE=;
 b=hOI1M3o3q8YkX1TJw4hk7FpfS30B9odCwTpiUYRav0slATxtzhMhHcN4kXR6+bvVUL
 GSWpo6Jkr1GLfhyefDS+Hi6AgX3gg/FW5pLzEoznNepSAhfpk/v98FXsHUGF6Cl8msWE
 Q3jIm1HRWoFdowT8vJeDucf9hZGY8j+jLUDkLfdS0f63VyvmmoNw3+5he2Fb+3EU4rML
 bA/vJbn9p+kDEQV4PKOvRZT7vURuWqLeh4K0H3xhZVSFr6G8McSE2lApV3C0xbIKutgc
 v2884sok21qrRl9dKOWYVWUwkNlYIwBkw/GSA15anwHVTsW8bcXPaIFy8p+EFESbKbU1
 +JEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020102; x=1708624902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ruX53CbVKYFd9a03NjcuApvlZnuC4B/Alw04ClG0uNE=;
 b=HWv0fVyVhPzFTSm54zXuWbQsliCSdqg/okE5fU0jWfWQZSASU8T9BaM9zARO+fiv2M
 QUgNBfS9BpKkTux3c/l6BY1F9E73kfNG+nUJUIf2ShdGDns098pYe5n3JlygNortVwUM
 mvmJXjQgUsJrQ1BZ8bDvETd6TZU06MJFLHE8GKJzCoBVjQVBfJRqoyjxcE+X6bjuupKj
 5SPcTzgRknZ/pHghEuMBpgL0q6Vy2XWDpkc2F83Sidj2hyFD9FeFlVyR7mSVFSxtMe2M
 H5PME7BOygLxB/nAjMd4SFz0HuyvMa9AQFg6fr1hSr+1p40894H8xFILqLB+yXeAT++m
 JMmA==
X-Gm-Message-State: AOJu0YzE7WN/sRPMPkGygJnPXDRkWvQSys5Scy19gRyxWT29CDKfcDby
 9enC1KxRTAcj+9nA2ZudQNnxESr9a4ilTB2x227ktt/sm/P7zFYvlMaVH6xoYK0QKXEmWj7hsuy
 Cw9k=
X-Received: by 2002:a2e:9058:0:b0:2d1:1c54:12d with SMTP id
 n24-20020a2e9058000000b002d11c54012dmr1857104ljg.38.1708020102325; 
 Thu, 15 Feb 2024 10:01:42 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05600c190c00b00410bca333b7sm5918918wmq.27.2024.02.15.10.01.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:01:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PULL 34/56] hw/intc/grlib_irqmp: add ncpus property
Date: Thu, 15 Feb 2024 18:57:28 +0100
Message-ID: <20240215175752.82828-35-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22a.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aObjr1mRj4DD

From: Clément Chigot <chigot@adacore.com>

This adds a "ncpus" property to the "grlib-irqmp" device to be used
later, this required a little refactoring of how we initialize the
device (ie: use realize instead of init).

Co-developed-by: Frederic Konrad <konrad.frederic@yahoo.fr>
Signed-off-by: Clément Chigot <chigot@adacore.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240131085047.18458-3-chigot@adacore.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/grlib_irqmp.c | 30 +++++++++++++++++++++---------
 hw/sparc/leon3.c      |  2 +-
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
index 11eef62457..744cd64c58 100644
--- a/hw/intc/grlib_irqmp.c
+++ b/hw/intc/grlib_irqmp.c
@@ -1,7 +1,7 @@
 /*
  * QEMU GRLIB IRQMP Emulator
  *
- * (Multiprocessor and extended interrupt not supported)
+ * (Extended interrupt not supported)
  *
  * SPDX-License-Identifier: MIT
  *
@@ -63,6 +63,7 @@ struct IRQMP {
 
     MemoryRegion iomem;
 
+    unsigned int ncpus;
     IRQMPState *state;
     qemu_irq irq;
 };
@@ -326,33 +327,44 @@ static void grlib_irqmp_reset(DeviceState *d)
     irqmp->state->parent = irqmp;
 }
 
-static void grlib_irqmp_init(Object *obj)
+static void grlib_irqmp_realize(DeviceState *dev, Error **errp)
 {
-    IRQMP *irqmp = GRLIB_IRQMP(obj);
-    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
+    IRQMP *irqmp = GRLIB_IRQMP(dev);
 
-    qdev_init_gpio_in(DEVICE(obj), grlib_irqmp_set_irq, MAX_PILS);
-    qdev_init_gpio_out_named(DEVICE(obj), &irqmp->irq, "grlib-irq", 1);
-    memory_region_init_io(&irqmp->iomem, obj, &grlib_irqmp_ops, irqmp,
+    if ((!irqmp->ncpus) || (irqmp->ncpus > IRQMP_MAX_CPU)) {
+        error_setg(errp, "Invalid ncpus properties: "
+                   "%u, must be 0 < ncpus =< %u.", irqmp->ncpus,
+                   IRQMP_MAX_CPU);
+    }
+
+    qdev_init_gpio_in(dev, grlib_irqmp_set_irq, MAX_PILS);
+    qdev_init_gpio_out_named(dev, &irqmp->irq, "grlib-irq", 1);
+    memory_region_init_io(&irqmp->iomem, OBJECT(dev), &grlib_irqmp_ops, irqmp,
                           "irqmp", IRQMP_REG_SIZE);
 
     irqmp->state = g_malloc0(sizeof *irqmp->state);
 
-    sysbus_init_mmio(dev, &irqmp->iomem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &irqmp->iomem);
 }
 
+static Property grlib_irqmp_properties[] = {
+    DEFINE_PROP_UINT32("ncpus", IRQMP, ncpus, 1),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void grlib_irqmp_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
+    dc->realize = grlib_irqmp_realize;
     dc->reset = grlib_irqmp_reset;
+    device_class_set_props(dc, grlib_irqmp_properties);
 }
 
 static const TypeInfo grlib_irqmp_info = {
     .name          = TYPE_GRLIB_IRQMP,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(IRQMP),
-    .instance_init = grlib_irqmp_init,
     .class_init    = grlib_irqmp_class_init,
 };
 
diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index e80b9410d4..bc6a85be9c 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -264,11 +264,11 @@ static void leon3_generic_hw_init(MachineState *machine)
 
     /* Allocate IRQ manager */
     irqmpdev = qdev_new(TYPE_GRLIB_IRQMP);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(irqmpdev), &error_fatal);
     qdev_init_gpio_in_named_with_opaque(DEVICE(cpu), leon3_set_pil_in,
                                         env, "pil", 1);
     qdev_connect_gpio_out_named(irqmpdev, "grlib-irq", 0,
                                 qdev_get_gpio_in_named(DEVICE(cpu), "pil", 0));
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(irqmpdev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(irqmpdev), 0, LEON3_IRQMP_OFFSET);
     env->irq_manager = irqmpdev;
     env->qemu_irq_ack = leon3_irq_manager;
-- 
2.41.0

