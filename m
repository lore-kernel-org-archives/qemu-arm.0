Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3082044lfh;
        Sun, 22 May 2022 12:15:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN6gTIAOBMQOInWgC71aXWB6QWJ2lKbduWnY47f1q4RAB8Fy+x+iqmbPumXDCWCHocA0X5
X-Received: by 2002:a05:620a:119a:b0:6a3:7258:f7f with SMTP id b26-20020a05620a119a00b006a372580f7fmr3610146qkk.380.1653246907573;
        Sun, 22 May 2022 12:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653246907; cv=none;
        d=google.com; s=arc-20160816;
        b=GZONFWF7s5Vdw2ZJP0RhBhyQko9rCwWA/bDUfaARCjMNG+7MeL4K9RM/4IpNuli2fL
         GYZ52U5ElyGBc76xX735+Kuh9n+SEC1oFzW4z4UEcA69c3GYDkiiOGWGLmsXaBKPyMsH
         NHDozp2ps9UmKm8Eoll39AbRYCaUKD2mvTTznutHk8u3q0ZoCXbd0UTME0MWiDRgATSL
         r4Hp9RwRe5SK1wXncKQly+LL+vQy7vDU4i6zbEo+YaRAQawrThCNxLlAwvxAjeLKb/XF
         ouErx403KwcKUz3hP3XWsqphr2gy4yTaGdezpuPe+6LT2P18OSaxQ9JXfDpodlEbNoil
         qi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=/KiA1jjRPf96HAVP0LvSIOhp26CBxIEFK5l9CvtOXRQ=;
        b=NIIWj+Jky6IYZmNIGM2ZjL+zrtMwOS9KzArIoj3ZSlOmQTeDlpMsV8CHWqCc4rS3L9
         f15BRAA6K4QvXpI76OWHjOae4wL0IiP8WQ9kyg3+vWGBwlh0Nii4nubtdRtvfpTsd+3M
         a9mm0jZustksEr1Ss4OTSj/ki/qYQWdOHYVe6qKK4Q8JJJhjJPJ2pIwOj0NWWYbMbsZO
         tBLhyMnb9V9ms+DVggeWCjKefKI/YZAT/Nbv8YxohznM74/SC7TAgQDYeFqRKLxxJam+
         OavHlK4JhBbBa9ZivNJjHWIm487ftOdFaiig95PpLzzcMq1bjnl/WEdeNnmJIlNqQ69I
         43cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=X0voVORl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6-20020a05622a118600b002f3c1558575si2064811qtk.294.2022.05.22.12.15.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 May 2022 12:15:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=X0voVORl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:39990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nsr2g-00068i-R2
	for alex.bennee@linaro.org; Sun, 22 May 2022 15:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCN-0000Z1-G9; Sun, 22 May 2022 14:21:03 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqCF-0003ug-Fy; Sun, 22 May 2022 14:20:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/KiA1jjRPf96HAVP0LvSIOhp26CBxIEFK5l9CvtOXRQ=; b=X0voVORlFl0xp+ci036YHJhBRN
 yHC6mbbTKDtrV3qJhDuVwBmSyRCK6bmgF4SpgcTzJwQYkF3gXkOOTud+m1X+PQFfeXYxYq1YbgxGM
 6KvtcOR3GMipLo/na0kdNRdr2B9cQWRua6tuyuJc0JxQ2DxJM4d+goGiWgKvei17S7+/mNNR4a3WZ
 T9bBh7IF9rpWsd6FkWJeVlySl3vv6dXGu/eqqKO6ePnCZCLYGLVtHbbeUSB69GixiJZU0vPQnPYK9
 5YrfZNzv0+9+XlgC9BKZ/8qCnVTMEvItm3Wm4dbKt6QgNDEjtP7yCuGpKkhiD8HXtQR3117C+5ZWb
 M1pUqTOxHP6bxKJuVdo699ejgg2REHYuEVSYKHsz1ysDjrCUAnkhGZ/omJNOB7gdTuXVCJjshMojy
 68LV9MjoTP9xCH+G6zAW9CaTl73CwKvTlg1sFIVgpQ4/Ww9a/EtOLN35rI/HOjQe1jBO7vVH2IOFE
 VHRq8/oahdRvq6qgIe3Uu/mBuDmQQHqMhjeT+nZ0OIShTmHjwizxlbVrnzw4qTC5PzuffmbChZQRq
 CrKezec9tnye46s2xzpb3OitzyCwCfBPm+9cEPqIrwDtAiaVTbVewxsU5DpmR82iJaZ20CN69DrBv
 kCl++GrMWbnKsqir6YTUVLL999jRinfQE5CStt/xE=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nsqAn-0007pH-4u; Sun, 22 May 2022 19:19:29 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Sun, 22 May 2022 19:18:28 +0100
Message-Id: <20220522181836.864-43-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 42/50] lasips2: move initialisation of PS2 ports from
 lasi_initfn() to lasi_init()
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
X-TUID: Ecd0/XRjHGxv

This can be improved once the ps2_kbd_init() and ps2_mouse_init() functions have
been removed, but for now move the existing logic from lasi_initfn() to
lasi_init(). At the same time explicitly set keyboard port id to 0, even if it
isn't technically required.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 84e7a1feee..bd89c03996 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -255,9 +255,6 @@ LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
     s = LASIPS2(dev);
 
     s->irq = irq;
-    s->mouse.id = 1;
-    s->kbd.parent = s;
-    s->mouse.parent = s;
 
     vmstate_register(NULL, base, &vmstate_lasips2, s);
 
@@ -271,6 +268,11 @@ static void lasips2_init(Object *obj)
 {
     LASIPS2State *s = LASIPS2(obj);
 
+    s->kbd.id = 0;
+    s->mouse.id = 1;
+    s->kbd.parent = s;
+    s->mouse.parent = s;
+
     memory_region_init_io(&s->kbd.reg, obj, &lasips2_reg_ops, &s->kbd,
                           "lasips2-kbd", 0x100);
     memory_region_init_io(&s->mouse.reg, obj, &lasips2_reg_ops, &s->mouse,
-- 
2.20.1

