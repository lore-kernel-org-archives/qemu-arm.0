Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp2272906njc;
        Sat, 15 Feb 2025 21:58:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUUKkyCOJzFluGAbYKy2Kxuveh09iKDHtuKcVDFv5uZ82Tpa/vAP6V+jcyz6m96FZKFPtxp9oK2Z0459g==@linaro.org
X-Google-Smtp-Source: AGHT+IHW8YXJAVzIBp9OD3b5PytaI1vy+PKsnX5g/T9eZJmIjeeKLUfj/x9KPKIHMm0h4WzcCnFU
X-Received: by 2002:a05:6214:ac8:b0:6e6:684f:7f6b with SMTP id 6a1803df08f44-6e66cd23992mr80106626d6.33.1739685514625;
        Sat, 15 Feb 2025 21:58:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739685514; cv=none;
        d=google.com; s=arc-20240605;
        b=aXbyDmzfYomAgHW+JoG6EcbvsfPvHbjo2BPQc6U6e7eUmDsOrxdnHK7AiBsLq7YdNV
         vcRrbk4KDUgKIY0ri5gzToMSlB4Mjigj+9oGtrzQyCfJdSq+FeH5cEbcuqvGt3MPCGnV
         fgnLfyWzgLFxFAyF5NL8TbuEAWM0l5dciAGchhsD0h6AtaN7/DAx1v4OpH2bMyymQhO1
         De8D72deq1TScyCpOtZrZCWju9jiPAYs2qYvY8714+fUktMMGciNk8zOBMNRbD/5NFyI
         3rSwCcRoc22m0jMeL4oTKVjfIgeGdztBq/2wKNZd9EFhhU0VD4MOvaGiVN7DplfaNKBc
         Eypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :subject:cc:from:to:content-language:mime-version:date:message-id
         :dkim-signature:dkim-signature;
        bh=JmtHLnlzelDiMG/aaAhaae/vF1+y41ZDzU76AdNWZlM=;
        fh=U7hL8divuZ6iKuobpEqIMijVSiAPMb4HvaCzEnaDdso=;
        b=QykTM8d7fXGE4DdfqPXo9lRndD1gF8qzvTSCvg087+JLiDqt8HCRq9872qK5u+jRW9
         JSj9rup7j02Lkty9avuDfg/CIldm6N/If4GNxv4h8XPZo+cdecDKjc3SAWz2Iq0MVcYA
         mOPTn1rqzZkwvxaiGQjimxJQf3dauWNogxjtQHNeV6hs3FW7N50OJ5waTXq34Pf0N63w
         iYc0RW/B+f/y6n/tKFr0yJfDCcNPUB3Oe5z98JWqaBwdFXIkTkcjvHhCkggTEyvq607r
         pyyO6Uo1vBZauX50bG0GGf8DlbNgJpmuRKA+hj4fx3UZCfchNJ1cINyWWStZqjVJvKBU
         qGIw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@csclub.uwaterloo.ca header.s=csc header.b=tqJopBqy;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=csclub.uwaterloo.ca
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d9c0ad6si66662146d6.314.2025.02.15.21.58.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2025 21:58:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@csclub.uwaterloo.ca header.s=csc header.b=tqJopBqy;
       dkim=neutral (no key) header.i=@nongnu.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=csclub.uwaterloo.ca
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tjXfc-00086R-Nw; Sun, 16 Feb 2025 00:58:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s23adhik@csclub.uwaterloo.ca>)
 id 1tjVk1-0003o8-An; Sat, 15 Feb 2025 22:54:49 -0500
Received: from mail.csclub.uwaterloo.ca ([129.97.134.52])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <s23adhik@csclub.uwaterloo.ca>)
 id 1tjVjz-000340-3j; Sat, 15 Feb 2025 22:54:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csclub.uwaterloo.ca;
 s=csc; t=1739678083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JmtHLnlzelDiMG/aaAhaae/vF1+y41ZDzU76AdNWZlM=;
 b=tqJopBqybRmYP3sSVvS/W4ny0Z/5LJpT9w8GxjOit1iN4v93RaVnoAJvr2iiONPhn0A+w0
 +pzbfC6HoxwICHlQF5JSlxs7OaIJFOfIKqvM6qregBnqFjtOCJ7EtIn4cYXDjn6byOUJBS
 IdZ3zKmedoKaMYsdo4O4T+kk/omwBjI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=csclub.uwaterloo.ca;
 s=202502e; t=1739678083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JmtHLnlzelDiMG/aaAhaae/vF1+y41ZDzU76AdNWZlM=;
 b=XGNIuT/chy/ms9JubnMhf+jaY3Sy8Maib76ovN+NH9p17ebODeaaH7lgGFpZi6utvLtoaw
 6c0VcoI35tT7aHBQ==
Message-ID: <3cca4eb3-09d1-4467-81fd-27a5bfe19a3e@csclub.uwaterloo.ca>
Date: Sat, 15 Feb 2025 22:54:42 -0500
MIME-Version: 1.0
Content-Language: en-US
To: qemu-devel@nongnu.org
From: Sourojeet Adhikari <s23adhik@csclub.uwaterloo.ca>
Cc: peter.maydell@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org
Subject: [PATCH] bcm2838: Add GIC-400 timer interupt connections
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=129.97.134.52;
 envelope-from=s23adhik@csclub.uwaterloo.ca; helo=mail.csclub.uwaterloo.ca
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 16 Feb 2025 00:58:23 -0500
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
X-TUID: DGqBXIf7TKto

Hello everyone,

This patch adds support for the system timer interrupts
in QEMU's BCM2838 model. It defines a new constant
called GIC400_TIMER_INT, and connects 4 timer interupts
to the GIC-400.
Previously timer interupts were not being routed to the
interupt controller, causing scheduling, and some other
stuff to have issues (me and a few friends bumped into
this, and that's why this was written lol).

Signed-off-by: Sourojeet Adhikari <s23adhik@csclub.uwaterloo.ca>
---
  hw/arm/bcm2838.c | 11 +++++++++++
  1 file changed, 11 insertions(+)

diff --git a/hw/arm/bcm2838.c b/hw/arm/bcm2838.c
index ddb7c5f..0a4179f 100644
--- a/hw/arm/bcm2838.c
+++ b/hw/arm/bcm2838.c
@@ -21,6 +21,8 @@
  #define GIC400_TIMER_S_EL1_IRQ      13
  #define GIC400_TIMER_NS_EL1_IRQ     14
  #define GIC400_LEGACY_IRQ           15
+#define GIC400_TIMER_INT            (96 - 32)
+

  /* Number of external interrupt lines to configure the GIC with */
  #define GIC_NUM_IRQS                192
@@ -176,6 +178,15 @@ static void bcm2838_realize(DeviceState *dev, Error 
**errp)
                      qdev_get_gpio_in(gicdev, PPI(n, VIRTUAL_PMU_IRQ)));
      }

+    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->systmr), 0,
+        qdev_get_gpio_in(DEVICE(&s->gic), GIC400_TIMER_INT + 
INTERRUPT_TIMER0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->systmr), 1,
+        qdev_get_gpio_in(DEVICE(&s->gic), GIC400_TIMER_INT + 
INTERRUPT_TIMER1));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->systmr), 2,
+        qdev_get_gpio_in(DEVICE(&s->gic), GIC400_TIMER_INT + 
INTERRUPT_TIMER2));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->systmr), 3,
+        qdev_get_gpio_in(DEVICE(&s->gic), GIC400_TIMER_INT + 
INTERRUPT_TIMER3));
+
      /* Connect UART0 to the interrupt controller */
      sysbus_connect_irq(SYS_BUS_DEVICE(&ps_base->uart0), 0,
                         qdev_get_gpio_in(gicdev, GIC_SPI_INTERRUPT_UART0));
-- 
2.48.1

