Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp347610lft;
        Fri, 24 Jun 2022 07:05:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u+0bo35dP7/PdBXWKcywu4ROxWVpC4lDli0In+MsFRxqYEi/VOEtfO0y2CbxhVIBN75FtB
X-Received: by 2002:a05:620a:1023:b0:6ae:e861:935f with SMTP id a3-20020a05620a102300b006aee861935fmr8953900qkk.164.1656079551642;
        Fri, 24 Jun 2022 07:05:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656079551; cv=none;
        d=google.com; s=arc-20160816;
        b=YGOdWK6H5l1K/W/AwjD7WSkBLZ26/xDA78BivJIkOOvhVCn2LuwgETwB8XZHNet9YR
         vk5J+s7nI48ykpdIhC1gdQAmLue4siQOFCitqsUT+d5c0Zp8pSLixrveRVZpMk2ddSIo
         7NnCAJKKc/Au7tmeexkIInbu1YZe6n+Yy3OAkYsBRDBKXyaJQ5JNusRsD4I6qUNZzxR0
         brMttvHGrS8RdT8Y4I1I4Ix4JNNkFPVqN48wKVqHxnn01LDTxnafvL8xuBPp7kQXQ9aM
         HYDj4EpprtpTUIrX6aqeJ2y+tdKj3xJUwnJFEHiZFm9ASbpWIlFx8+GIBnOqOvPqSny7
         rOdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=shXzR4RW99BCzkfYBhf/duWH5beI9dd02mUMMo9ssG8=;
        b=AD2f9moCLBRf3Xv0igX1pn/l+OoNxSGybwiUfFQ/auTh8hjI0kxW5A9a4abvNfamm0
         rJ3m2kM8D2RhNsi8C+aq1hJfLyw9VkhWizSubNsUdQzNbVbDbgFAU+qsz12I8IJd3QI5
         kSDRSGKnNJGofnpdthJVKnaHXI4SotHR4iFXQhBxbcS+7a1B2w+KV2Ayv3u5OMVfg7w+
         G+oefBDtngZhS4WXv93FOf6ZrgtmBvzpCvjLbMNOCI3rV5sJdShckifWqOl6D3B1DHDV
         e7syMvndXmMJ/A0qsrQunk2AJkDRkCGh2SSOIi1XZPnrMbPHRc7grbJ8bCUNAQwOwv/v
         Lzkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=LG5iF73s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a05620a430c00b006aefe58333fsi2081813qko.492.2022.06.24.07.05.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:05:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=LG5iF73s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:40998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4jwV-0004F6-4B
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaT-0001QJ-6F; Fri, 24 Jun 2022 09:43:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaQ-0005FK-3O; Fri, 24 Jun 2022 09:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=shXzR4RW99BCzkfYBhf/duWH5beI9dd02mUMMo9ssG8=; b=LG5iF73spawH7eWf1wthH1LebU
 mk2osnQGj305MoJoJLkZsQSxXBvb956vcpEv5wXt5YcDv8bVMd7N2aC7RWK7utJdxAlQ4huKqsykU
 Xpl6BrMW2fhwjcHJL9xEUKwaScLIgzYZUpLDr8mHYTnckfsCi0z8juhthNCmSxGuw3Omh1/bMTWR6
 e6Pgdssozfa1FuMcf750dYFm0qrVLgArO7f8yesNPoO7JVlFKKMPTwnQWe5hXmwA8fQGd4x9RyG2C
 JsKa4KFwkCnXqogbDS64zduFDGcUNc3F6is/wkU2ZaPsGHB2KoaQ3Sr/cVKum0bC8LX7uGjq2Bfvk
 ZLSp+j93cxWAqo6fvREpUYNfQxTW+5Xt4yp8lAOfX8fcT3Jgdn/n8IOLfWZQXjVrOAJ2Ja+FTGZu9
 oTm6IUhaUIRxxlRefKgiPJoB4QUPkYwG5eEuNzi+tCdmDxlI7z59X65+Ro0NBwuUBdwRNT/5kTqps
 zjzn/HWZAVvAVqY1Ya1vaMOHK8QpXCx6nS1D0dXod5wkJ3FlzvWYAycqyyRIPJsGemM75n+Y022z7
 TP+GjF2nuJH3GIdpzVT5B405NZ4t/NLMoXn2BTjcP69Nnnt70e8sK7B3Za7vELjcBYvsLiEFek9Aj
 Vh6vcIToEhCukBpK5Tn58lOaoJo8wKzp4m4ItMMDY=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYn-00037t-4x; Fri, 24 Jun 2022 14:41:24 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:36 +0100
Message-Id: <20220624134109.881989-22-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 21/54] pckbd: introduce new I8042_MMIO QOM type
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
X-TUID: OheGtG2dFCo2

Currently i8042_mm_init() creates a new KBDState directly which is used by the MIPS
magnum machine. Introduce a new I8042_MMIO QOM type that will soon be used to
allow the MIPS magnum machine to be wired up using standard qdev GPIOs.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pckbd.c         | 22 +++++++++++++++++++++-
 include/hw/input/i8042.h | 10 ++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index f99e10cfcf..89a41ed566 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -665,11 +665,23 @@ static const MemoryRegionOps i8042_mmio_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void i8042_mmio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+}
+
 void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
                    MemoryRegion *region, ram_addr_t size,
                    hwaddr mask)
 {
-    KBDState *s = g_new0(KBDState, 1);
+    DeviceState *dev;
+    KBDState *s;
+
+    dev = qdev_new(TYPE_I8042_MMIO);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    s = &I8042_MMIO(dev)->kbd;
 
     s->irq_kbd = kbd_irq;
     s->irq_mouse = mouse_irq;
@@ -686,6 +698,13 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     qemu_register_reset(kbd_reset, s);
 }
 
+static const TypeInfo i8042_mmio_info = {
+    .name          = TYPE_I8042_MMIO,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(MMIOKBDState),
+    .class_init    = i8042_mmio_class_init
+};
+
 void i8042_isa_mouse_fake_event(ISAKBDState *isa)
 {
     KBDState *s = &isa->kbd;
@@ -841,6 +860,7 @@ static const TypeInfo i8042_info = {
 static void i8042_register_types(void)
 {
     type_register_static(&i8042_info);
+    type_register_static(&i8042_mmio_info);
 }
 
 type_init(i8042_register_types)
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index a246250d1f..b7df9ace6e 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -9,6 +9,7 @@
 #define HW_INPUT_I8042_H
 
 #include "hw/isa/isa.h"
+#include "hw/sysbus.h"
 #include "qom/object.h"
 
 typedef struct KBDState {
@@ -49,6 +50,15 @@ struct ISAKBDState {
     uint8_t mouse_irq;
 };
 
+#define TYPE_I8042_MMIO "i8042-mmio"
+OBJECT_DECLARE_SIMPLE_TYPE(MMIOKBDState, I8042_MMIO)
+
+struct MMIOKBDState {
+    SysBusDevice parent_obj;
+
+    KBDState kbd;
+};
+
 #define I8042_A20_LINE "a20"
 
 
-- 
2.30.2

