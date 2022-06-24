Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp341598lft;
        Fri, 24 Jun 2022 06:58:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v7Q+mKWUvAD5h2ANcdng61P27SBcjxEvcayKni7W+8pfZKgeMBs2QzmEumK4b7PIqE86Oi
X-Received: by 2002:ad4:5bef:0:b0:470:536a:d350 with SMTP id k15-20020ad45bef000000b00470536ad350mr15927290qvc.49.1656079098498;
        Fri, 24 Jun 2022 06:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656079098; cv=none;
        d=google.com; s=arc-20160816;
        b=AlbzsZQWBfZNGcO54GMNbc4oEPLByhV0xx8p/JkWmP92NjFlgcGxU5bnUfuar50lkD
         Sq7ACta8Cb9wx3jS8xpD6THZeHfseEXcD06AY0Wfvfm2MPDTllUVTs9pzAQeIdj+0Enj
         WcJuc4Cqx1/lGdXPFQFGZde1Wt2jE0D/m70pTA2SLpI8SYmLKg+132TOx1S6Ja7O228H
         Umsk3soQG1f0G628IlVAgYsUi9IeFYdDhvXuoPqGon8vxs+m2CwG7XuLnfsnJaUL9X5i
         /QPPM06iy24M9kG+7P68EiJP4n+TcNn21jRqjYnz7Nl1ydQ9cx32qEHe+l0qf2p3KpIQ
         S6Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=YcsPtnedy787CRYrviUMvRysA7y4KFa7Jb53DABOCoc=;
        b=miwY6FUqGztFPsawbVRDCeV8+OOjlv8O3ac9yCsZRUxGxT/yOIW3/f6Up8gSwiPwwl
         Ar1KeDJ8ooEuxubzG0Jam6DabuX2xORfGEx6PWTtyXjjKiXqQTkubqpt0rY376K8MHWi
         XdUpgDVP/fgeACvF9sgCrjzlPaA7dRfXLKQDu1jKpTjLl8O6iX3FX8OkZx2Hzu9yv4kJ
         fsxUrEl2XgBxDJ+/qpK7Jk0eVTMTR93Z1/CfdXMXAI2+9VabAgy+zPROwJu/G6tHRAxG
         VcuNGUdnvuVovLP02wZTHPgjALvrE2locnN0LB4QbiaThPHNupY0Tk0YRSKucaJbwMKB
         kD9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=ouWEs6uF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020ac85acd000000b00306aafd0066si1960180qtd.675.2022.06.24.06.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 06:58:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=ouWEs6uF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:51436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4jpC-0008LH-10
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 09:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4ja3-0001C7-SE; Fri, 24 Jun 2022 09:42:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4ja2-00059c-9C; Fri, 24 Jun 2022 09:42:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YcsPtnedy787CRYrviUMvRysA7y4KFa7Jb53DABOCoc=; b=ouWEs6uFDIzVJLzpNxdVcSWAup
 BKQXikYHWBXDR0KfglDcE6ewvJeLtqeQQBsxA0/5QqqB2pdH7G7GWvC9J7hzr5kxY3xn5V7KeAXDP
 eo3Vcq3WF6jneXWdYndD1iR+bcHj10q1uRUBflO7Ajsg6tLTfBSyHP2xAmqnY7qw9+cyam55zKMYz
 wU8kTwXoGTc+Wf5Sk6a0r0zxyq2Ub5+slKRQKx7Necw5DQS/+YdES6SEPYZui4OFhZ5rUuVkB4m+T
 9EPxI3OgzO9wt4vvZbQ1cK9iNkWkkJpej2UNO7vedTbBMcEohltaUjJBUN9QA8ZtGS+nsUwKAwNn9
 snTe0Mss1bgW57Scq0LRhpctEbFdjbNHw9BV/Zkq0ScasoZ2Z+5MDbxOTB6PxmVfg7oOHTcU0EOeN
 t75jsnJ7nnN84zKBW/KEZ7w1ETiIjhKNuzS0hk0hN6sDp1NuDtud1nefBM5DaFf5ZhTKIAF1Z4Kf9
 5RtklxMfKUnGZScYsuMz4RMjuYOfAsVcl3+PlGI4ZGtQJ6elb4hl0Rx5wIzq0zJjUBMXFZT6VmJU3
 lWiIkNEU+85BnWxeXIkVlYDqCm3YmL4ZcvH761A/sP33LQhbf9LPQDFW+ZFSIyixGYq0SU+nu/Iwe
 zOJrPM1ZGlqbnVVINywdWE23UaTUoH1S3Gc+hmKMU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYP-00037t-Sj; Fri, 24 Jun 2022 14:41:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:30 +0100
Message-Id: <20220624134109.881989-16-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 15/54] pl050: split pl050_update_irq() into separate
 pl050_set_irq() and pl050_update_irq() functions
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
X-TUID: V7P7D6qg7YsN

This will soon allow pl050_set_irq() to be used as a GPIO input function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/pl050.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 889a0674d3..66f8c20d9f 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -57,15 +57,20 @@ static const unsigned char pl050_id[] = {
     0x50, 0x10, 0x04, 0x00, 0x0d, 0xf0, 0x05, 0xb1
 };
 
-static void pl050_update(void *opaque, int level)
+static void pl050_update_irq(PL050State *s)
+{
+    int level = (s->pending && (s->cr & 0x10) != 0)
+                 || (s->cr & 0x08) != 0;
+
+    qemu_set_irq(s->irq, level);
+}
+
+static void pl050_set_irq(void *opaque, int level)
 {
     PL050State *s = (PL050State *)opaque;
-    int raise;
 
     s->pending = level;
-    raise = (s->pending && (s->cr & 0x10) != 0)
-            || (s->cr & 0x08) != 0;
-    qemu_set_irq(s->irq, raise);
+    pl050_update_irq(s);
 }
 
 static uint64_t pl050_read(void *opaque, hwaddr offset,
@@ -124,7 +129,7 @@ static void pl050_write(void *opaque, hwaddr offset,
     switch (offset >> 2) {
     case 0: /* KMICR */
         s->cr = value;
-        pl050_update(s, s->pending);
+        pl050_update_irq(s);
         /* ??? Need to implement the enable/disable bit.  */
         break;
     case 2: /* KMIDATA */
@@ -159,9 +164,9 @@ static void pl050_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     if (s->is_mouse) {
-        s->dev = ps2_mouse_init(pl050_update, s);
+        s->dev = ps2_mouse_init(pl050_set_irq, s);
     } else {
-        s->dev = ps2_kbd_init(pl050_update, s);
+        s->dev = ps2_kbd_init(pl050_set_irq, s);
     }
 }
 
-- 
2.30.2

