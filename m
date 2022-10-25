Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp614828ejc;
        Sun, 30 Oct 2022 19:18:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM45V9okR3CciJWThFXn/vybxD68QvW4FHHUc5wMByTqhWpemGelUpmeE4gdWFBwD/MludDi
X-Received: by 2002:a05:622a:1e10:b0:3a5:24af:bc71 with SMTP id br16-20020a05622a1e1000b003a524afbc71mr2846437qtb.514.1667182719076;
        Sun, 30 Oct 2022 19:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667182719; cv=none;
        d=google.com; s=arc-20160816;
        b=zwmtU1c7XrcJCAD2DnQ9pPxb8axXZ8fFI3KAX692D+3z4nyIaTvmt7qWE+0VW48r2h
         jbtGaqKimsLH+ReecxAoNi1pCsExn9Q5Uj0vkTDNK4RLC7jPvhAP/QqaVpFLWWPvoxaZ
         biRSjnkR96dvJBHedk++oveInuH022nuzMC6J2S3mattFU+PrGd35N2srI8X4PgW2/gp
         CRsobY/Q8lRZIgPM3qVHw/N9RPjlc/HmHzgylYnTj70H2/O8/hD2pIOlt4hOdehkdAxy
         sbwiFYqCJ+RIAeRKCL7o9FEEEQSO3d7Hyu0oo2YYIwUKRycnbfpRHW+FJ4siRwyTVKaG
         Ztpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=e3Pw6nmsNvWJvcEGWlKLef1tlXEw4XmVFZRJPyWq1us=;
        b=boEHRhdSoyD/h6jdi3IP2KXiIqqm+03zTl6GYDF2O6CFQuMgqcEBeOVCiCx3OlKwzx
         9hXG0l5DbrZX8h4uHhdMmCgk6lwl1ke+b9EVcgP6NSC8rfwnHeosYYk6UtlUxwQ7Hnrt
         r78poJGGluFSsYRG8brNHbYDZTTZXE7IaAnlbrU6HvQEYja/5hhs6mrOFZHpljRhk5CN
         1395hBXnS2/FZi9bPFI5jEdzr92zzpp0Yubg6Ar/hP/foibPFA+rFbqJPpRLxzOcEw8r
         ns4pSf7FvY7A0XbWNvDc1LrT3Vpxw/ufaS/O9+Be5kBsIDu2O9JNpxyFm4N7pcVv9rkq
         G8Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk6-20020ad45d46000000b004b17a404fb9si3295226qvb.490.2022.10.30.19.18.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Oct 2022 19:18:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opKLD-0001As-Tp; Sun, 30 Oct 2022 22:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL8-00015Z-Tl; Sun, 30 Oct 2022 22:15:50 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL7-00035d-HT; Sun, 30 Oct 2022 22:15:50 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 4EDE811F264;
 Mon, 31 Oct 2022 02:15:46 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 25 Oct 2022 13:23:07 +0200
Subject: [PATCH qemu.git 05/11] hw/timer/imx_epit: simplify interrupt logic
Message-ID: <166718254546.5893.5075929684621857903-5@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166718254546.5893.5075929684621857903-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: ~axelheider <axelheider@gmx.de>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ml+ilmjSCjpV

From: Axel Heider <axel.heider@hensoldt.net>

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 37b04a1b53..d21cbf16f6 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -61,18 +61,6 @@ static const IMXClk imx_epit_clocks[] =3D  {
     CLK_32k,       /* 11 ipg_clk_32k -- ~32kHz */
 };
=20
-/*
- * Update interrupt status
- */
-static void imx_epit_update_int(IMXEPITState *s)
-{
-    if (s->sr && (s->cr & CR_OCIEN) && (s->cr & CR_EN)) {
-        qemu_irq_raise(s->irq);
-    } else {
-        qemu_irq_lower(s->irq);
-    }
-}
-
 /*
  * Must be called from within a ptimer_transaction_begin/commit block
  * for both s->timer_cmp and s->timer_reload.
@@ -242,7 +230,7 @@ static void imx_epit_write_sr(IMXEPITState *s, uint32_t v=
alue)
     /* writing 1 to OCIF clears the OCIF bit */
     if (value & 0x01) {
         s->sr =3D 0;
-        imx_epit_update_int(s);
+        qemu_irq_lower(s->irq);
     }
 }
=20
@@ -320,7 +308,14 @@ static void imx_epit_cmp(void *opaque)
     DPRINTF("sr was %d\n", s->sr);
=20
     s->sr =3D 1;
-    imx_epit_update_int(s);
+
+    /*
+     * An interrupt is generated only if both the peripheral is enabled and =
the
+     * interrupt generation is enabled.
+     */
+    if ((s->cr & (CR_EN | CR_OCIEN)) =3D=3D (CR_EN | CR_OCIEN)) {
+        qemu_irq_raise(s->irq);
+    }
 }
=20
 static void imx_epit_reload(void *opaque)
--=20
2.34.5

