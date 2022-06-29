Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp446333lft;
        Wed, 29 Jun 2022 06:27:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tK3lIwJCwhMNZM7RwSdwoHc8NoYdWaB4oy1X8xCxczCcLUdELxu+v2gZnCGVY12NTQVsdn
X-Received: by 2002:ac8:4e87:0:b0:31b:eb4f:3808 with SMTP id 7-20020ac84e87000000b0031beb4f3808mr2428044qtp.545.1656509258161;
        Wed, 29 Jun 2022 06:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656509258; cv=none;
        d=google.com; s=arc-20160816;
        b=GIwda3WU/Ca5ch9oETLkL8HUr4PYPWcpJQNq5s4MyuUdK2PKKlUDQE8rdRUuwZwnH4
         m8Tb93U4r6+RmwZKnVBBLtD+Yled5twu4ZIJ2gQdDyuSbOzjKea1B2Ur/wl8cewGyTts
         tPB7avTT9HH0H+ragy1yDA2u3On7ovcf5rsGVraJOcb6iFXWVezh6yf5tdpj11xmewir
         wosqMSuFcHM9+ldQ+OZuNCZGaZVYeC/QtpL8hra04U5oJ/+qY8l0l/2dBXItraEQXPmd
         LFrWPIs6WGdmNN2tlEQyghSq95MP5Zjz21AhhsbnjXcJmUUGqLvLZRAiVPuo5aRWaQY7
         0k5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=0nmOnBynzw7DZuINWBYXE5I8ii2Adx8EQBfqD8pJrDM=;
        b=r1x7iqYM0Ob3lAmV8ISDFrl6UrBdnXVPQxeE/Zl9BWoeUMw94Mc7mxnHXO7xEh1Yat
         7T82/SxH1CBZyMq8Pzmr+vJNUD+ESyCIgAz66px1taxgERIurEuNcEbLUR0PfAape6vc
         eHj08gVJ5JUj16Aa0snAaOOUCAf02PmGGGf9oC4tJcm2UleGgjfhXtvqd71fnB/EdmrB
         rPc6hIrPi/qj6syBor/aIkEr3FkseyYOfxPZdU4A8jbonBvjL9/MLLdjINiJ4Ort+7bC
         r4ajxk4xIGZjEDnjBFvGHKc3LMBdo8q7A3Gf2w3ZqqDr0Nothyx7YcwwwnIA3mTvgxLn
         i8Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=1wWkmLZc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jx13-20020a0562142b0d00b00471d1a5c81bsi5027040qvb.254.2022.06.29.06.27.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 06:27:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=1wWkmLZc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:46196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6XjF-000163-HK
	for alex.bennee@linaro.org; Wed, 29 Jun 2022 09:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1G-0000fq-0e; Wed, 29 Jun 2022 08:42:10 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6X1E-0004lQ-FL; Wed, 29 Jun 2022 08:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0nmOnBynzw7DZuINWBYXE5I8ii2Adx8EQBfqD8pJrDM=; b=1wWkmLZcDuLuolA6BOlTC8kP3l
 zgbTLFgdX64ShQ7iyY7kkwgz42njL4q6BGok/iSE9Tn5CoWjR/541Y+yQe74LfCaCsKQ1dftU5lkb
 I9niU/6h9J8cCtD7oDMhBcGWaryyh9yKOekMDUngkJ+QjxGAIOUtrg3gc9q2dpL8+KCaDYya5jefW
 aGhlDtzNasa4Ky/XWBzvpglMXaLQqMFFqEC0k5yuLIkjKyJOKZBxrnrOIN3Z9ORh5SFEstkobl4q8
 91YdlbasntRp3q67U8Rk1aJwVv2ANt5zy/SauMEep4YZ3Psok5c5T2QYbvX2BbI+WlcEa52ZreC7n
 Y0nVukihcYEeBqiaa0x8Cfn6j/QaN6dG/4EAlYxNZjd7on/4p7qhsl5tsLcCxvCC6gWBtRyejnIVc
 pQGqGn2bOtZ8HRdYxEZCxI3ms5fAiD0p5+JOp42kwy5DdVpbqj6oIJT6cAA+0IOhhJbrlt+IIz7eI
 itwcAj817d4tYBLnEgPXcL0g1c31wfJnlgm5YQc52gsi0oB23HEdhxD7th43Cn+AiaQsOspvjEY+4
 H0OCaJ9u8jCm/TnMm5jzeVN22kgz77+vv788rKFH+LLe7Piu4XOZ/s0PTc+VTO6v2wbGKVAt8J31H
 Xb6rw88r+uHVgqrwm0OP8FKQKp1cO5kZWMgiR+0JQ=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o6Wzb-0002tZ-Ee; Wed, 29 Jun 2022 13:40:28 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, f4bug@amsat.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed, 29 Jun 2022 13:40:13 +0100
Message-Id: <20220629124026.1077021-28-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 27/40] lasips2: add named input gpio to handle incoming port
 IRQs
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
X-TUID: P4BBbOcMaxsL

The LASIPS2 device named input gpio is soon to be connected to the port output
IRQs. Add a new int_status field to LASIPS2State which is a bitmap representing
the port input IRQ status.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c         | 15 +++++++++++++++
 include/hw/input/lasips2.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index ec1661a8f1..013d891af6 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -125,6 +125,19 @@ static void lasips2_update_irq(LASIPS2State *s)
                          s->mouse_port.parent_obj.birq);
 }
 
+static void lasips2_set_irq(void *opaque, int n, int level)
+{
+    LASIPS2State *s = LASIPS2(opaque);
+
+    if (level) {
+        s->int_status |= BIT(n);
+    } else {
+        s->int_status &= ~BIT(n);
+    }
+
+    lasips2_update_irq(s);
+}
+
 static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
                               unsigned size)
 {
@@ -303,6 +316,8 @@ static void lasips2_init(Object *obj)
                             "ps2-kbd-input-irq", 1);
     qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_mouse_irq,
                             "ps2-mouse-input-irq", 1);
+    qdev_init_gpio_in_named(DEVICE(obj), lasips2_set_irq,
+                            "lasips2-port-input-irq", 2);
 }
 
 static void lasips2_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 35e0aa26eb..b79febf64b 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -69,6 +69,7 @@ struct LASIPS2State {
 
     LASIPS2KbdPort kbd_port;
     LASIPS2MousePort mouse_port;
+    uint8_t int_status;
     qemu_irq irq;
 };
 
-- 
2.30.2

