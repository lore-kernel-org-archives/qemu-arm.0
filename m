Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp369143lft;
        Fri, 24 Jun 2022 07:36:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1twEqWu1h5niLduOJbYH9uZU8b5+19aCnHn5+8QEZi+8z9E9e8Qz0VgkLjtexLbcSUaivUS
X-Received: by 2002:a37:9605:0:b0:6ae:e9c8:181c with SMTP id y5-20020a379605000000b006aee9c8181cmr8513433qkd.585.1656081390702;
        Fri, 24 Jun 2022 07:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656081390; cv=none;
        d=google.com; s=arc-20160816;
        b=ygiQyXKH5n7ErWPWtZ021uHXo0C7jmgYoVW6/OKgag/B8pSz52N26SSHmXQB9HFWtQ
         uqDzGZYgTMcNwFPoMYZv9bU+0HK+rsDW6Nd5VOJi4/2DM+SHdHbbZqpY7BoYIj9VWTxN
         SXZYzLM6qIul04HcVXiy+Db5Wtcx/sUyKq+KhNjloNYRwAh964H54HI7j6su08dvk6qZ
         +zkkQVIIgdyZcr2v8qzK+cPBgVYlNG6DXli3RfvK/48/66nIDHrVbIM1wFQNC1kQu/I8
         vmeh0P8NtyfPSMdAfVBXoLjGOg2559FP+5ruFA5+p8mXj5MVsDqKap7/vGLVvTb3AMkH
         TBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=6+A4fscENQVrrzKzFju9A8QlEGskcjgDeLN7mdXBr4E=;
        b=GAibYkgk1Wm22geYjNyNi0NBx0r8Ad4pXw9/WOvvc5qcLJMNKzJkipNrKomyENqaUt
         2uH1B0qLT7ukrJhTPhFcDGLe9pNnzylhMRajXwW2nSXBsQBmFpYa3bYpbXZPd+wVmlKc
         cdozbuHbyjG0iS9DV/VEMLnkEcgP9Y25I/JBYV2Zwr9pUB6cQ/uTQx+/LayUT03r++f3
         pFWS1ymbswVTSMxsZA6uXLUyLdKItxigECj+dIXPGfR1fA90ZE04sZOGaBM6BgoL/uXp
         WJcAflix6CSbfo+ZdxyRr7eRyXSsgti+UVUJZDvC7sKO6vukztfH2B1Yi+wVdfVOMi3j
         BJQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=CEKTrqI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4-20020a05622a148400b00317c9af9695si1431347qtx.760.2022.06.24.07.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:36:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=CEKTrqI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:38344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4kQA-0002S4-4J
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jc3-0004yg-2T; Fri, 24 Jun 2022 09:44:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jbn-0005Uj-Ue; Fri, 24 Jun 2022 09:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6+A4fscENQVrrzKzFju9A8QlEGskcjgDeLN7mdXBr4E=; b=CEKTrqI9ABjiKbTNPvA3H8/YFU
 qdw1bth5R+5RI68cogM+I96kfGDRQdjUibbFbDwqGGOiEFmb0DlNjlnuhLbgJxjg/04CoBGGtFsT/
 aQhhp6Bc+Lc9MkPhK3GEoEMNEGbYAZzGnk7GJvz8e/TazgWjuWc2Fl+mxqJlsa7eIiG9Ebn3K/Aix
 xoC/9aoUOnP4KbDQ4OVyyYLOPtLZtJNGoNNnFUXNbyxqj5JhF1bCJ0OeX7aUioxOUi16rSgoIqy4Q
 83bHMD70I++74Rfq4Xv4jyCY6a6RQIItwgTa8na+RkuZWyhnNLhD2/0tm7PgfR3t7eXw6DCaeN0K9
 S5hQeCfo7Hxqaml1qXEKn38Sx4JPAoJVWTLj/4zy86ZxDhpnqNlkS7RLEiH7WuLsOt0OZb9x3A8fJ
 ppW+585wlfSi8xH/5hiWRS93Z9572W/NiizDlyDwRvirmnWWAlKwSyIRJOMUaA4XK/pqw9Ci2eVeo
 yBkGYdjaISy8hiEUFK8rdkT+oF4GTDCk5J+Ltt6Kqe/bpoYCX1HH2Zvdxogsp092j19mn/A5xtRGI
 ImkmYtOqSAG/vjCL8/I/193gxsqNYAo/PIkBr7Z9uBKPrivQ4Wp/SKpjcNA9SzQ6uLBLmq0b6oJcF
 F/jaczoLkS4gCfOKIL3NNemSosPRecaa7h0d8j7jg=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4ja7-00037t-1U; Fri, 24 Jun 2022 14:42:46 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:59 +0100
Message-Id: <20220624134109.881989-45-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 44/54] lasips2: add base property
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
X-TUID: Dy2hWUEa5dOj

This is in preparation for handling vmstate_register() within the device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/lasips2.c         | 17 ++++++++++++++++-
 include/hw/input/lasips2.h |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index bd89c03996..81beb5b614 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -251,6 +251,7 @@ LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
     DeviceState *dev;
 
     dev = qdev_new(TYPE_LASIPS2);
+    qdev_prop_set_uint64(dev, "base", base);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     s = LASIPS2(dev);
 
@@ -282,11 +283,25 @@ static void lasips2_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mouse.reg);
 }
 
+static Property lasips2_properties[] = {
+    DEFINE_PROP_UINT64("base", LASIPS2State, base, UINT64_MAX),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void lasips2_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, lasips2_properties);
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+}
+
 static const TypeInfo lasips2_info = {
     .name          = TYPE_LASIPS2,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_init = lasips2_init,
-    .instance_size = sizeof(LASIPS2State)
+    .instance_size = sizeof(LASIPS2State),
+    .class_init    = lasips2_class_init,
 };
 
 static void lasips2_register_types(void)
diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index b9723073e1..7e4437b925 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -25,6 +25,7 @@ typedef struct LASIPS2Port {
 struct LASIPS2State {
     SysBusDevice parent_obj;
 
+    hwaddr base;
     LASIPS2Port kbd;
     LASIPS2Port mouse;
     qemu_irq irq;
-- 
2.30.2

