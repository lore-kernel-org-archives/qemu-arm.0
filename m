Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp333900lft;
        Fri, 24 Jun 2022 06:44:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ub535JhZmeiOydJIB7Lbsegy3QwQgXulcanHPC1fnTCbRqImsTrZ9eeLOFZa1jmC2YSvHa
X-Received: by 2002:ac8:5b96:0:b0:304:eb7a:2232 with SMTP id a22-20020ac85b96000000b00304eb7a2232mr12573605qta.510.1656078252530;
        Fri, 24 Jun 2022 06:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656078252; cv=none;
        d=google.com; s=arc-20160816;
        b=nCN2fmqybgWv3mcahGs9KR8tw6OF4Q8OzAKcgj/8B2J9OJMAlqbAMa7NFZOeJJde2m
         5dmvTFzqkE5A0HITJ9bhgApCLX/ctmr/ClTSCAyObszI396zQF7j6lR67/mAUTLGne2L
         wS9ksgXFpPuIM+4Nm5olMl17sLd7ithOuldfl4eeEu1qe1ksCDKD7L0JTpqeU4SknkR8
         j+mGfbPWjTbnPs2VP9FNXRsOR8FgckVBj6PimQAb6BcB7eiCDJD/DJk51BNIsBSYswlF
         tLxCMbiujeqO/rtiXwgzhy+mO2mE1yqVYb4LMle2HLDvfAXLbu5ZM9JZKATaoPspTN3h
         87Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=lfDuz37fOMUqZYiLyRe+MhEJbnef/mqksNzkVOXSL/M=;
        b=STan7BNgBjyG8tQ15t1RKpA0cL02ETF8gJapV+2gZNV8Y7aT2+yzpKAlyvfVJorgLq
         KxVG6hNvPYiDYCjlmyDdCKYdOXoZ6/kmB7ju7rFOFvSCw7yaJnzI1ecRFgLoso6OeAMP
         OXgNq8uG5ReM4qrVUe3ZQKvQe7Etvsc433LokfcxhpC9+HZ3G4kp3JyiTr1uIJQU5prE
         c6X24+nd4iVe6w1UpHRfkMZRMwyseHRjizg+7wSlnvO5RHTFtohQ4sE9pjx0Hcy+y3LB
         ktzk4qY7aveOaV9LyGXzGQ42WBjOfBksGmw+0oT0HwpjRgAX/qaJy4NhYiQquOnpBHbA
         8n+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=UdGEALOr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020a05622a029200b003053480e980si1685830qtw.226.2022.06.24.06.44.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 06:44:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=UdGEALOr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:47002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4jbX-00020a-Tx
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 09:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYy-0006xz-4s; Fri, 24 Jun 2022 09:41:32 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYw-00052Z-HF; Fri, 24 Jun 2022 09:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lfDuz37fOMUqZYiLyRe+MhEJbnef/mqksNzkVOXSL/M=; b=UdGEALOrXq2AhFK8uWNpWkjEEs
 Op3yT2+MO4pCe0GJgTGzEtK64U0IcMi5fi6c0DETqTjzCLk5pzz4bT+hL1BV/zBJShyrrYaos5OH6
 iSHeqpKNSBNF1U/qhJALUw7VE4i9Deth1V18dTym0rwU8YBCJ4DyTI7iD4DIWdUc+M3o4hmFnuSki
 H97hhPJer8JShGc9cgeCm+ZwE67VyAlogEt1H5vRcjcefK0nGOY2MZIFt2TpfwO9D2z55rkl5ncrp
 jSGWhGkj5PnG8J/uqGXhaqXozojdIbFbXtX28Mx4SpF9Hm6/oQcaK2o6GL5eaPvu4cNHgb+AmfI95
 qwkUs+azU1EgOpq5qi86GAGziRf7l4hHfEvuk0rgu/tL3LUsibnjh0d9XHPLQ71EzB5L7TP3+h0uS
 uwv7mJ2hGOK1coLze6++mbAGGLXnoQCTPnSfKZx0SXkAOMBnq2LoOlLD4PhCWOxgrUrOA/rR2jhd5
 Xh9Hw4RTRpsZlUiI8xY7qYWI9rSV5WDWUl0xZNxOWgEHfyjpvkOpuZ5zeZRvLrDEQ4HBMep7RCuQX
 L07ZcfWHKBvj1CctfkOHtcCtbYHqUCtR7CZJQiRxy1jBri0yZ/Kbmzshemf6HsTKwcl687AsZcwvI
 oZJQaLjSwxdl8sQ/gRShf9ybRKhR1Bi6vQVBZ55LI=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jXc-00037t-Dm; Fri, 24 Jun 2022 14:40:12 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:17 +0100
Message-Id: <20220624134109.881989-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 02/54] ps2: QOMify PS2State
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CV/2CPF0cgfI

Make PS2State a new abstract PS2_DEVICE QOM type to represent the common
functionality shared between PS2 keyboard and mouse devices.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/ps2.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 67dd2eca84..514e55cbb6 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "hw/sysbus.h"
 #include "hw/input/ps2.h"
 #include "migration/vmstate.h"
 #include "ui/console.h"
@@ -96,12 +97,17 @@ typedef struct {
 } PS2Queue;
 
 struct PS2State {
+    SysBusDevice parent_obj;
+
     PS2Queue queue;
     int32_t write_cmd;
     void (*update_irq)(void *, int);
     void *update_arg;
 };
 
+#define TYPE_PS2_DEVICE "ps2-device"
+OBJECT_DECLARE_SIMPLE_TYPE(PS2State, PS2_DEVICE)
+
 typedef struct {
     PS2State common;
     int scan_enabled;
@@ -1277,3 +1283,25 @@ void *ps2_mouse_init(void (*update_irq)(void *, int), void *update_arg)
     qemu_register_reset(ps2_mouse_reset, s);
     return s;
 }
+
+static void ps2_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+}
+
+static const TypeInfo ps2_info = {
+    .name          = TYPE_PS2_DEVICE,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(PS2State),
+    .class_init    = ps2_class_init,
+    .abstract      = true
+};
+
+static void ps2_register_types(void)
+{
+    type_register_static(&ps2_info);
+}
+
+type_init(ps2_register_types)
-- 
2.30.2

