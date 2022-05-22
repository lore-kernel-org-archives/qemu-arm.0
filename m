Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3082896lfh;
        Sun, 22 May 2022 12:17:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjUoeAhKC50epNNcygzFZLPWt7Bw4oBfiyGqU000k2y1nYQrUCeeK7ivTQv3V3qZ+ZY+9P
X-Received: by 2002:a05:6214:e66:b0:461:f7a4:528e with SMTP id jz6-20020a0562140e6600b00461f7a4528emr13316850qvb.45.1653247050335;
        Sun, 22 May 2022 12:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653247050; cv=none;
        d=google.com; s=arc-20160816;
        b=qxixVXMjX7kAvx4kJgZkqSTFvo1/SUMwmeEvacmeAWNunexdBbwwrYH46sivC8qMC1
         pC9cEO8Pu+rPxvcuzXJ0Xwv0oFLLOwgUlMxAPn/4fj8PjMcc3lBLyt6wqX5CLAvtycS3
         ljihTAY94S6Xq8xW7GhO24Gft3nUfQ/eOY+wGJbkrl3ERf/yR5/MKhaMzCgFEF+sWH80
         B4OokdyS5IUhkMDBlS8+/Acb69Yrlng9ioFLzL/75RHfFg7KZjvOwzrnPMgAXcsd3sm6
         5megS/+wPZp3RZqI3qBMrrvuZfTWtuGTV8fd9/gBQDSvnkiyuQ6BgGiUbK3sSW+sbv4O
         JsGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=CkGI+yMYz98UoKIk+686p+wq9HrH384uQjmkoONqm1M=;
        b=fE0wi45wRr22MWup81hwCHkIH1c5VU7/cOtP/KFE9cQ2IX5MM/e6qMg2uk37JDK9i9
         7Q+yqxCt/QOGhF+6M6fJ85bdG+vLHNV5O0RkytPdKvvgpQV7TX1YxMzar2GzvwejERMr
         1USvwP4V3a6xLdPoXIWeM/1dKzFXplpWmCsPM0XsfAvEgoFqcw1cPYXZgCjVhjeg2Lzt
         +424REm8mp+6bozocBZEfuluU2ciG1JrAcLajz0hHKkKv4/0UBM+S3kwQc7kxB7ShCpa
         Gi0j02ulagDdpJ8xlMecHFTnnlBHA0aXdwdyl3sLnI4v2tx1hbloM5pn2IOSHVSNUScc
         DWrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=OhmwKAKX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv4-20020ad44ee4000000b00461f1db16d2si2032820qvb.430.2022.05.22.12.17.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 12:17:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=OhmwKAKX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:46674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsr4z-0002Ha-6r
	for alex.bennee@linaro.org; Sun, 22 May 2022 15:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqC7-0008In-8F; Sun, 22 May 2022 14:20:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBy-0003rH-Ly; Sun, 22 May 2022 14:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CkGI+yMYz98UoKIk+686p+wq9HrH384uQjmkoONqm1M=; b=OhmwKAKXj3BwPtv+4dnZWdKSIj
 jXrC0TKGVlE+EZK3qBsUPEG8yWIYdaVNletjtr+pnkJK4rgrN6G9zhUR0/uVKCjPgRplFjiV8Ti0D
 ozu/dKVH1Z/ja4teFarx/lAn8SFHN3JYjqeWaku6dr+mrRuEIKKcf+eu2vFt6/iJjsPXGjDQf3Tef
 /IksOk1hdgD8reXZlk1NK3PuCUgrntneSrupNROR3VvbsRy7WlaIDrJOGYP++KTJDiu+4F1BvVjmO
 DivHHUgTxevXbmvGHxinUUStuerC5c8SvUtfeg15VYe1ikQHgRO2TFO1Q7PZ53R7IbOAujHDcBHM3
 QUGlopDCNVdtJQKEnH4F3lkG6FHLB+rgpsU/gCKyq285bVblXvKMF8twTbodKNSzv+CIteUvVmxnw
 sPaqoxrDWmjYSRckCDIKqkykkjXfZNor59m6T4wHvEB9PTRH/GLtw3+aMO3X33MrhsuhGy50Rcapp
 fz5Hz1+W8BESW56gUuPCd68IWJnFlc+6A/dzg4RXwKoeuG3zJPuND3UeAl4Yg6fwV9R7YvHhYiEMr
 H1jkK3SM/Hh3RLn+RbzAy18JNWdfZ2dXjbu3pJQJxCvPV0knODN4VAQSeGHY7aINg7rOZ/fX1bg5M
 Xq4T07qlavKeyzaNuJESLU+671Q6QtSSZOCPG2DR4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAV-0007pH-Cc; Sun, 22 May 2022 19:19:11 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:23 +0100
Message-Id: <20220522181836.864-38-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 37/50] lasips2: QOMify LASIPS2State
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 01zTvV2K9Fp2

Currently lasip2_init() creates a new LASIPS2State directly which is used by the HPPA
machine. Introduce a new LASIPS2 QOM type that will soon be used to allow the HPPA
machine to be wired up using standard qdev GPIOs.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index adfde1684f..db0a791e6c 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -24,6 +24,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
 #include "hw/input/ps2.h"
 #include "hw/input/lasips2.h"
 #include "exec/hwaddr.h"
@@ -31,6 +32,7 @@
 #include "exec/address-spaces.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
+#include "qapi/error.h"
 
 
 struct LASIPS2State;
@@ -45,11 +47,16 @@ typedef struct LASIPS2Port {
     bool irq;
 } LASIPS2Port;
 
-typedef struct LASIPS2State {
+struct LASIPS2State {
+    SysBusDevice parent_obj;
+
     LASIPS2Port kbd;
     LASIPS2Port mouse;
     qemu_irq irq;
-} LASIPS2State;
+};
+
+#define TYPE_LASIPS2 "lasips2"
+OBJECT_DECLARE_SIMPLE_TYPE(LASIPS2State, LASIPS2)
 
 static const VMStateDescription vmstate_lasips2 = {
     .name = "lasips2",
@@ -265,8 +272,11 @@ void lasips2_init(MemoryRegion *address_space,
                   hwaddr base, qemu_irq irq)
 {
     LASIPS2State *s;
+    DeviceState *dev;
 
-    s = g_new0(LASIPS2State, 1);
+    dev = qdev_new(TYPE_LASIPS2);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    s = LASIPS2(dev);
 
     s->irq = irq;
     s->mouse.id = 1;
@@ -286,3 +296,16 @@ void lasips2_init(MemoryRegion *address_space,
                           "lasips2-mouse", 0x100);
     memory_region_add_subregion(address_space, base + 0x100, &s->mouse.reg);
 }
+
+static const TypeInfo lasips2_info = {
+    .name          = TYPE_LASIPS2,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(LASIPS2State)
+};
+
+static void lasips2_register_types(void)
+{
+    type_register_static(&lasips2_info);
+}
+
+type_init(lasips2_register_types)
-- 
2.20.1

