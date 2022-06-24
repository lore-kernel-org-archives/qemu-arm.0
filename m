Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp351733lft;
        Fri, 24 Jun 2022 07:11:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1taOizyJK2nzb/+LqwsTgjKxBKtzSKh1r7w5pejdzQxgBO4kyWh9hDqfv+DS+N7yQnuCzQI
X-Received: by 2002:a0c:ef0d:0:b0:470:4656:faf2 with SMTP id t13-20020a0cef0d000000b004704656faf2mr20368455qvr.16.1656079861067;
        Fri, 24 Jun 2022 07:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656079861; cv=none;
        d=google.com; s=arc-20160816;
        b=TGBrNGSSqeYFJAYswivhorCtmyHT/dQYpG2mTWkQL55MglJASJ2N/5vfe+mUTHQqzX
         Q5U/lRfNO5ecPYecK9E7UqMg5smGX2gne4GAN8P5IFz/sC0x013UhyE31uQU97vyP5Hi
         7eT8JlqUiq+n9VyVJSsxYi1R82BRFILF2MEwtqiq85nsKlfSnIjlAdKUatAMQVi2IJau
         HkzUcj9V/NFrmcMPw8shmY/yvtTsjgVU1gXYixbl/m6otow11RnXJQIYA6LbDlFQUIHx
         v9VRsoHk9lIkRND9iJctwztdI/GXbX0EIK8LYso8636i4EauLjotAIjI0iq344NPNf+9
         TOIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=4z3Ocvu+kc8B3MXIQntPOHtEYVDKyoKAzRpbWIjQwlY=;
        b=vXNiEt9bn1h4lsqfzj4kYT46vH5W4GXNIsmHuqOY1o+Tu9siypLFbSoq2w8WW4q9z2
         w/gbuaZUmjm3HaSYsl8+54JwU9hRspuPgYsDvcSpmLGhYUG6SgRx4G1iPepZpAPartaq
         zLbfvexXy9vkt3fjTemHH1C5vthwDnMUkhaRnIpAfCVF6g9LQOHR4MDprzrCjnXEAFkj
         1i5tmwj0kbwOlmmYox0EMYZduI0V0rYmHNEjb7NY1QwyTx6SsJvvPH45PFRq6MiHqbuU
         s/LiaiUPOXAHam2K0fEdOLqsNLz9ke6d61kahADnDi+hb3+haVEYnTxao93T6mQ3ybZQ
         LS1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Le1HP1Kj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020a05620a284500b006aede6ec220si1843544qkp.248.2022.06.24.07.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:11:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Le1HP1Kj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:56972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4k1U-0006eb-Hu
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbE-0003LQ-U6; Fri, 24 Jun 2022 09:43:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbC-0005Ko-3J; Fri, 24 Jun 2022 09:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4z3Ocvu+kc8B3MXIQntPOHtEYVDKyoKAzRpbWIjQwlY=; b=Le1HP1KjbFPh6avY+9wDJGWGOK
 tcAOSDWxUQId4vdqFJgUFlYn4WURn+sqIHPmzu9jSTyYPK896L+WeA+7hKZ65Hs0R1ZZi5uugWPo9
 swDuj0VtyqplxD1ttCMQsM283XCP08EXwReOGYQp1wqaVd1fBmIBEOmq/GdJWAixaYd1SfY+G1NHb
 x1sPyk9hV2V1InIdHgTFxnX873DwdAqIqSTaLY+HMNQEcwrt+214rq+ukpJZE8My3PGbZvidTEEkj
 pM4tISz+U3xEdidaqovtnSbCUj6e5/dopRMSfaU1hYRfGv66YhaxV5SoyvTz33YKt6Nn68/wc9jU7
 zMB3NeiYiuFYgiFgt3bx+dO6Nshd+XzRkILsJrMHMJZUZCx+Z8hDkvGVo7PfRgJ78TJ0jnr8gRagT
 yWHFEyFQ67NitfK+xA/RD7YYGx/i5EiVjvLXjOgQibEoaAy6erprbP5Ms2lULEgjxJItQVJL4mXA7
 T7pNNZ8TgsKDpN3rmaBKJMW6p4b2WEIJxz9Yz5rPfjEZvq24ca5cbJdKD20V3+MbwWri0dGSwE46o
 32uhSpnv7+LaVVhghf5kvaRMdXmFAesMSi38tZk39ymFO6ddP7LXOuq07RueUo0GyJJ9rNcLEJ2qc
 a6XK5G8KQhEiDLklSZpTJBRcgUwglOu3JLnswTabc=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZZ-00037t-71; Fri, 24 Jun 2022 14:42:13 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:50 +0100
Message-Id: <20220624134109.881989-36-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 35/54] pckbd: replace irq_kbd and irq_mouse with qemu_irq
 array in KBDState
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
X-TUID: QbjOHrku2G/o

This allows both IRQs to be declared as a single qdev gpio array.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pckbd.c         | 12 ++++++------
 include/hw/input/i8042.h |  6 ++++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 72843f770e..5d7c969fc6 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -170,8 +170,8 @@ static void kbd_update_irq_lines(KBDState *s)
             }
         }
     }
-    qemu_set_irq(s->irq_kbd, irq_kbd_level);
-    qemu_set_irq(s->irq_mouse, irq_mouse_level);
+    qemu_set_irq(s->irqs[I8042_KBD_IRQ], irq_kbd_level);
+    qemu_set_irq(s->irqs[I8042_MOUSE_IRQ], irq_mouse_level);
 }
 
 static void kbd_deassert_irq(KBDState *s)
@@ -726,8 +726,8 @@ MMIOKBDState *i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq,
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     s = &I8042_MMIO(dev)->kbd;
 
-    s->irq_kbd = kbd_irq;
-    s->irq_mouse = mouse_irq;
+    s->irqs[I8042_KBD_IRQ] = kbd_irq;
+    s->irqs[I8042_MOUSE_IRQ] = mouse_irq;
 
     return I8042_MMIO(dev);
 }
@@ -813,8 +813,8 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    s->irq_kbd = isa_get_irq(isadev, isa_s->kbd_irq);
-    s->irq_mouse = isa_get_irq(isadev, isa_s->mouse_irq);
+    s->irqs[I8042_KBD_IRQ] = isa_get_irq(isadev, isa_s->kbd_irq);
+    s->irqs[I8042_MOUSE_IRQ] = isa_get_irq(isadev, isa_s->mouse_irq);
 
     isa_register_ioport(isadev, isa_s->io + 0, 0x60);
     isa_register_ioport(isadev, isa_s->io + 1, 0x64);
diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 9d1f8af964..4ba2664377 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -12,6 +12,9 @@
 #include "hw/sysbus.h"
 #include "qom/object.h"
 
+#define I8042_KBD_IRQ      0
+#define I8042_MOUSE_IRQ    1
+
 typedef struct KBDState {
     uint8_t write_cmd; /* if non zero, write data to port 60 is expected */
     uint8_t status;
@@ -31,8 +34,7 @@ typedef struct KBDState {
     void *mouse;
     QEMUTimer *throttle_timer;
 
-    qemu_irq irq_kbd;
-    qemu_irq irq_mouse;
+    qemu_irq irqs[2];
     qemu_irq a20_out;
     hwaddr mask;
 } KBDState;
-- 
2.30.2

