Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3067906lfh;
        Sun, 22 May 2022 11:36:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyXEDLBdxXDgePCHaZw6o3AWTM/PobqMO7Ttf/xgbK3WuDG3anlqbXC0NHbugiZHb/Mwb5
X-Received: by 2002:a05:622a:215:b0:2f9:bc6:a8c3 with SMTP id b21-20020a05622a021500b002f90bc6a8c3mr14584239qtx.489.1653244593926;
        Sun, 22 May 2022 11:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653244593; cv=none;
        d=google.com; s=arc-20160816;
        b=jcAqweWh0mw8u8G6Eb8rIRHggOktIE0aor1OxD5qTQjCG/i5tSOymd2+XJeIfwVdNC
         L7uxIXqX/8KScaaNTi4JtqNrX8I0u6FDdWRvnxwJbZWBSeOXHcp67DMddHG8+HK72yVr
         4F5kg35KlUP6U4Tfka0bugzJzM/u75SqFMXBd3jaSr9F2ZODJ4MCptZPC2+m3yP1xUWR
         A0sH9JyRIm7SGsHKMkZCN6ofYuXc3Gef6/RCiAL8YUVaIkFkH9Ufj8gr2+pZdtqaMBN9
         pSgy15iSaiR0P/Ry5K6eCyVwppOSltJEN9efTPR/uc6KoHLhWlqkwuYgbUaJgQsgoZMY
         jbKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=lRk97FSn/zFjn/zLFI1vCEGQSUKky7kiDMJ+Xl85PTQ=;
        b=ZDpseYsH1/nqfxVWYDIr9sbekG1ny7L5JEcJNROvPRaTFOL/0GaC5c8kNzOqAE6Fa7
         kMvL7hxLQs9NbnLUIDCVSNlH13wapNytF1Py227o2gntULSR1pnTTVNetQhDkmcCs5Bd
         AKOb9ihtLM7H+BNcMS421qsrQKFURmeLafT1vNXszydW0ttxMyrmdjrlqUv6kiqiv5PT
         ZMOH5lkxa+q9qiISD3DEFBNy24wNHho9DRtJlhddh+89E3yRUJ/wwzpyByhIBvwRPa/c
         adTLpKR9J7CdCX/Wh/V49WR0FKm0l055ARjRgc34fCcOj6azVlB2BMUV2J9BFE70s/tN
         /vew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=IsmYHelK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16-20020a05620a241000b0069fff65cf28si2285506qkn.601.2022.05.22.11.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 11:36:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=IsmYHelK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsqRN-0006Uy-CD
	for alex.bennee@linaro.org; Sun, 22 May 2022 14:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqC7-0008II-5U; Sun, 22 May 2022 14:20:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:47896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqBp-0003q8-0v; Sun, 22 May 2022 14:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lRk97FSn/zFjn/zLFI1vCEGQSUKky7kiDMJ+Xl85PTQ=; b=IsmYHelKcYPaB5QLB9Ynwo5U9q
 bJPB08YialFfIizV/2xrWopd3twpBZhvo48bCoByMn33IURY+YxFGpbe+ijIHb6Kr/Tl6G8WroKO9
 Wm15XFNTi3stXBZHalwFP2I65mX4B6WYKWCnHLtlHN3VUBrL1hJ1Lo/xVuEwSPridU1SaHAf/IhRA
 nNkANf9waIVI+jQUEv6rBggrj19z1yhR1AvCOysAE5l80vM/g8fB1HeAk+LkKU/hP6eqnMzABgN+d
 4U9VNUYUnDKb3q+8gFLGqr7CCWbUziFJ/PEMUHQ7ckEVRRvUZyrFVuOdjF6R9l3ODv3Tq3a9CPA9S
 Us+vLRLfgZh7J0CBxkrulbCT56Cf072D0mmeyxXx8SxCw42JQ584bTdirpKc73yTqD15Et+k9xwRe
 VP8thI1dSnIVDAv03nI2kRefxn0heUqcL5TyIT0SaZFsRY0fihhw7/M5+LXGCL9fRzJsLuryB4tDv
 Zs8Qh/tU8mBPXOdeBUOYDGaRtyvFZ8DrBKFz+oX6uAqDdWfenLTdAEBUnkFXxWMAIRC9jr0qDl8n2
 yzUMzCMu8AZN49UOp9VK4cEcZI++XJ6P/7cFAv5++ik0WxqMD3o3Ti7PWZLnOVDXbyzY2/bESnrFF
 2K0kd4MR8I2qyi1anqMx8xCs4EQmYcHJlrQxi3T4A=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAO-0007pH-RM; Sun, 22 May 2022 19:19:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:20 +0100
Message-Id: <20220522181836.864-35-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 34/50] ps2: add gpio for output IRQ and optionally use it in
 ps2_raise_irq() and ps2_lower_irq()
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
X-TUID: ubuO9fKFMPL9

Define the gpio for the PS2 output IRQ in ps2_init() and add logic to optionally
use it in ps2_raise_irq() and ps2_lower_irq() if the gpio is connected. If the
gpio is not connected then call the legacy update_irq() function as before.

This allows the incremental conversion of devices from the legacy update_irq()
function to use gpios instead.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/ps2.c         | 21 +++++++++++++++++++--
 include/hw/input/ps2.h |  4 ++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 214dda60bf..891eb7181c 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "hw/input/ps2.h"
 #include "migration/vmstate.h"
@@ -174,12 +175,20 @@ void ps2_queue_noirq(PS2State *s, int b)
 
 static void ps2_raise_irq(PS2State *s)
 {
-    s->update_irq(s->update_arg, 1);
+    if (s->irq) {
+        qemu_set_irq(s->irq, 1);
+    } else {
+        s->update_irq(s->update_arg, 1);
+    }
 }
 
 static void ps2_lower_irq(PS2State *s)
 {
-    s->update_irq(s->update_arg, 0);
+    if (s->irq) {
+        qemu_set_irq(s->irq, 0);
+    } else {
+        s->update_irq(s->update_arg, 0);
+    }
 }
 
 void ps2_queue(PS2State *s, int b)
@@ -1305,6 +1314,13 @@ static const TypeInfo ps2_mouse_info = {
     .class_init    = ps2_mouse_class_init
 };
 
+static void ps2_init(Object *obj)
+{
+    PS2State *s = PS2_DEVICE(obj);
+
+    qdev_init_gpio_out(DEVICE(obj), &s->irq, 1);
+}
+
 static void ps2_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1316,6 +1332,7 @@ static void ps2_class_init(ObjectClass *klass, void *data)
 static const TypeInfo ps2_info = {
     .name          = TYPE_PS2_DEVICE,
     .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = ps2_init,
     .instance_size = sizeof(PS2State),
     .class_init    = ps2_class_init,
     .abstract      = true
diff --git a/include/hw/input/ps2.h b/include/hw/input/ps2.h
index d04d291287..6e5c404cb5 100644
--- a/include/hw/input/ps2.h
+++ b/include/hw/input/ps2.h
@@ -50,11 +50,15 @@ typedef struct {
     int rptr, wptr, cwptr, count;
 } PS2Queue;
 
+/* Output IRQ */
+#define PS2_DEVICE_IRQ      0
+
 struct PS2State {
     SysBusDevice parent_obj;
 
     PS2Queue queue;
     int32_t write_cmd;
+    qemu_irq irq;
     void (*update_irq)(void *, int);
     void *update_arg;
 };
-- 
2.20.1

