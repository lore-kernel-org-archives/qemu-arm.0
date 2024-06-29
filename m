Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp499371njm;
        Sat, 29 Jun 2024 04:08:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXC+n4wCIS2dLDh+yypvzbn7CoSC73Rkh1PMrxhdiuNKwCHPL1W5mW17D/nzxPckcGp7ELBXowXa4EftGPCMvfPN8D6S1yW
X-Google-Smtp-Source: AGHT+IGjleC3LfrtmJ7tAJ/cYCplIVUyUAURjAWTltKojBiVI36wdUIpUTSE3NwHDpXm0DGbXxGO
X-Received: by 2002:a05:6214:3015:b0:6b2:b060:c7d3 with SMTP id 6a1803df08f44-6b5b717b28fmr9383106d6.52.1719659339081;
        Sat, 29 Jun 2024 04:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719659339; cv=none;
        d=google.com; s=arc-20160816;
        b=l09jndEMRqsAhJE21yYkfSLC32VLkRG7aj1XnBFCq2fVeD2+dHwg/TnNqMimUDxccD
         LYEWLcGf4eukHYcr/IppUexrHiWiDgh4XO0ilvLBTpSdE+GGiJYqtVq6FvSeV9l6OKFe
         YRmkbpsPOmMEzE4mzC1lAa9EiBFBBL+OER1z5RoHu9AChQtU29szVOpVVRhavpjgAXnE
         KCoCuFLN5GjJnke7exq49+iX+46825ZroB/xiQMBcE44Eu39HZ5Y3Yu3Tnwh4+mWnHsr
         PK6+ll5rC+Iuj4MAFrAx9oKK+JrHm43MWopksZUig6BGwW1Y71rRv5LqnNQN4AcvIno2
         ib8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=78UrQkIpOPMy4cM7L4jmyk+OfMW54+86uRenx/u5CHs=;
        fh=mWYFfzpVzlRUS/lcgYmCqBe2YGCJoEkjzBsreeH424U=;
        b=ptn4SEx9lTrCp0sh1uqcl9PcN0PnLBie4X86s+cKtbkG+7Pgeltgp4etVaatgCt/fV
         KoBRZNpvZk8iixItYGnhLBZtda5YaAOBOsxAkhX1tsSRUuh9Xc9fJG43hC4r8gbg7qA3
         jcgXxodu/5rAYaAMo5h/JXloKex0YZPi7NDk0gNFfExpg3W5EiAHkGZNKNFFbXl1bfzm
         LEBJsTPxzhumphBf+J6JDXJ3ZmUGzrHHRQSvC3shJmi99PL1rJlaRgmZ1En/l3qPtr5r
         tNylXHMLPm5GXX4pmAIaTTjFj7B7l7dTeItXC+xULxHdF0dodcclc2MQmz+vylno2dDF
         MYDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=OLnCD0i3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e5f2705si39290176d6.409.2024.06.29.04.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Jun 2024 04:08:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=OLnCD0i3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNVwN-0004QL-M0; Sat, 29 Jun 2024 07:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1sNVwG-0004Nw-Iw; Sat, 29 Jun 2024 07:08:16 -0400
Received: from zproxy2.enst.fr ([137.194.2.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1sNVwB-0002pD-En; Sat, 29 Jun 2024 07:08:14 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id 25D3C8084D;
 Sat, 29 Jun 2024 13:08:09 +0200 (CEST)
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id Ydn0V0BetW6T; Sat, 29 Jun 2024 13:08:08 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy2.enst.fr (Postfix) with ESMTP id B067580840;
 Sat, 29 Jun 2024 13:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy2.enst.fr B067580840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1719659288;
 bh=78UrQkIpOPMy4cM7L4jmyk+OfMW54+86uRenx/u5CHs=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=OLnCD0i3qBtw2+JRDWGlKwynIP+4aWL3zYOhnyW2tIld8bMMaXKTRMP423t8cxhiq
 zpcl/s7SXIul14f0314y/Ahj9PccsmNlqWbmDMV5lBFrCB9tjbe0AzGgpWjPc8AYpJ
 3Q9Smva3pvcUe/OGFanv2lrKlBU4EV0eSosYsVfc=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy2.enst.fr ([IPv6:::1])
 by localhost (zproxy2.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id ReavuA0wQ5Ea; Sat, 29 Jun 2024 13:08:08 +0200 (CEST)
Received: from inesv-Inspiron-3501.. (unknown
 [IPv6:2a02:1808:284:73f9:f191:56:9ba9:96d9])
 by zproxy2.enst.fr (Postfix) with ESMTPSA id 9E50B8084D;
 Sat, 29 Jun 2024 13:08:07 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/2] hw/misc: In STM32L4x5 EXTI,
 correct configurable interrupts
Date: Sat, 29 Jun 2024 13:07:08 +0200
Message-ID: <20240629110800.539969-2-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240629110800.539969-1-ines.varhol@telecom-paris.fr>
References: <20240629110800.539969-1-ines.varhol@telecom-paris.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=137.194.2.221;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy2.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 9nAbaEZ9+aJD

The implementation of configurable interrupts (interrupts supporting
edge selection) was incorrectly expecting alternating input levels :
this commits adds a new status field `irq_levels` to actually detect
edges.

Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 include/hw/misc/stm32l4x5_exti.h |  2 ++
 hw/misc/stm32l4x5_exti.c         | 28 +++++++++++++---------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/hw/misc/stm32l4x5_exti.h b/include/hw/misc/stm32l4x5=
_exti.h
index be961d2f01..55f763fa37 100644
--- a/include/hw/misc/stm32l4x5_exti.h
+++ b/include/hw/misc/stm32l4x5_exti.h
@@ -45,6 +45,8 @@ struct Stm32l4x5ExtiState {
     uint32_t swier[EXTI_NUM_REGISTER];
     uint32_t pr[EXTI_NUM_REGISTER];
=20
+    /* used for edge detection */
+    uint32_t irq_levels[EXTI_NUM_REGISTER];
     qemu_irq irq[EXTI_NUM_INTERRUPT_OUT_LINES];
 };
=20
diff --git a/hw/misc/stm32l4x5_exti.c b/hw/misc/stm32l4x5_exti.c
index 495a0004ab..6a2ec62d78 100644
--- a/hw/misc/stm32l4x5_exti.c
+++ b/hw/misc/stm32l4x5_exti.c
@@ -88,6 +88,7 @@ static void stm32l4x5_exti_reset_hold(Object *obj, Rese=
tType type)
         s->ftsr[bank] =3D 0x00000000;
         s->swier[bank] =3D 0x00000000;
         s->pr[bank] =3D 0x00000000;
+        s->irq_levels[bank] =3D 0x00000000;
     }
 }
=20
@@ -102,27 +103,23 @@ static void stm32l4x5_exti_set_irq(void *opaque, in=
t irq, int level)
     /* Shift the value to enable access in x2 registers. */
     irq %=3D EXTI_MAX_IRQ_PER_BANK;
=20
+    if (level =3D=3D extract32(s->irq_levels[bank], irq, 1)) {
+        /* No change in IRQ line state: do nothing */
+        return;
+    }
+    s->irq_levels[bank] =3D deposit32(s->irq_levels[bank], irq, 1, level=
);
+
     /* If the interrupt is masked, pr won't be raised */
     if (!extract32(s->imr[bank], irq, 1)) {
         return;
     }
=20
-    if (((1 << irq) & s->rtsr[bank]) && level) {
-        /* Rising Edge */
-        s->pr[bank] |=3D 1 << irq;
-        qemu_irq_pulse(s->irq[oirq]);
-    } else if (((1 << irq) & s->ftsr[bank]) && !level) {
-        /* Falling Edge */
+    if ((level && extract32(s->rtsr[bank], irq, 1)) ||
+        (!level && extract32(s->ftsr[bank], irq, 1))) {
+
         s->pr[bank] |=3D 1 << irq;
         qemu_irq_pulse(s->irq[oirq]);
     }
-    /*
-     * In the following situations :
-     * - falling edge but rising trigger selected
-     * - rising edge but falling trigger selected
-     * - no trigger selected
-     * No action is required
-     */
 }
=20
 static uint64_t stm32l4x5_exti_read(void *opaque, hwaddr addr,
@@ -255,8 +252,8 @@ static void stm32l4x5_exti_init(Object *obj)
=20
 static const VMStateDescription vmstate_stm32l4x5_exti =3D {
     .name =3D TYPE_STM32L4X5_EXTI,
-    .version_id =3D 1,
-    .minimum_version_id =3D 1,
+    .version_id =3D 2,
+    .minimum_version_id =3D 2,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(imr, Stm32l4x5ExtiState, EXTI_NUM_REGISTER)=
,
         VMSTATE_UINT32_ARRAY(emr, Stm32l4x5ExtiState, EXTI_NUM_REGISTER)=
,
@@ -264,6 +261,7 @@ static const VMStateDescription vmstate_stm32l4x5_ext=
i =3D {
         VMSTATE_UINT32_ARRAY(ftsr, Stm32l4x5ExtiState, EXTI_NUM_REGISTER=
),
         VMSTATE_UINT32_ARRAY(swier, Stm32l4x5ExtiState, EXTI_NUM_REGISTE=
R),
         VMSTATE_UINT32_ARRAY(pr, Stm32l4x5ExtiState, EXTI_NUM_REGISTER),
+        VMSTATE_UINT32_ARRAY(irq_levels, Stm32l4x5ExtiState, EXTI_NUM_RE=
GISTER),
         VMSTATE_END_OF_LIST()
     }
 };
--=20
2.43.2

