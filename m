Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3158204ejx;
        Mon, 7 Nov 2022 08:44:05 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5G+6YpADXic++cPCykaR9oUjhYE8lMclcMdUvaU05Xu4GZACGAV3exPcE4WafFfNvBGD0s
X-Received: by 2002:a05:620a:688:b0:6fa:259a:c345 with SMTP id f8-20020a05620a068800b006fa259ac345mr33146145qkh.739.1667839445289;
        Mon, 07 Nov 2022 08:44:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667839445; cv=none;
        d=google.com; s=arc-20160816;
        b=XoHbrt1vZN7zy8hR3t5YtY+HX8CEGvFKDoTBI2/WeeS9TMXQBuVH7Er5h+DiLQgIM4
         K9p6DJBQVBL0U/ht6pB/y8UfcrEG1ZAlozvOT9ks9niaKvkOoZ1j9skQR5/39Cg861jO
         uIeZxa4dTe5W3qrZ/is6j2UM2FqEtblWpJL5yffBieVDA6GBXFAd9ADXYP6VgpJJfQaP
         1sw/m/C5VS+ZoPyOATePCGUN3e1b0r7iQEjOjp6KdBiDLnGetNvJn+OCFwVz5MuTKiaI
         PI0hiSo3jRH48bZF0ZYg434PGHYUeFj3g9B0eJvsXUknTB04lFbwTscEE4N/y2LwoRUC
         squg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=RBn339Md1zqAA4YrJ0tm1U/LxUssEbs1Ikg3VrzRnpU=;
        b=d1j0aCpcKPlpXAdQl3yzj+GFXFx6uJUr5vivHdOAt++DbSxqn+igE+gV8xKeoTEBwR
         dBEXwBOKeLZhfdiN2ofZdVYPfgx44s+2uzeWgd93Jtto3aJZ7rJa8c3rjzPSfI3AW1AR
         rH3yxmIgksGsvVgclrf51i7aagN/nqdXOvO+5FOJ/vy0kNq/Cwejq+8HIWczGavEAblW
         pjmvKiu7/GmBjDAPzp7HGfnhQ2RoiGB7haCniATjt2d+P0Fug7/2lJN4Rr5hnFN2hsEh
         aOKV0ZB+/ObzGo3v6o0WbjpDPKKjf2RMYI9Mrl0upmk6NljteeImvgmfLLGeqc6AHPzV
         /TPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f25-20020a05620a12f900b006f64a82024esi4264363qkl.721.2022.11.07.08.44.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Nov 2022 08:44:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os5Ck-0002FH-QR; Mon, 07 Nov 2022 11:42:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CQ-00025u-Bb; Mon, 07 Nov 2022 11:42:14 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1os5CN-0005Jo-6h; Mon, 07 Nov 2022 11:42:13 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 08F6611F847;
 Mon,  7 Nov 2022 16:42:05 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Wed, 02 Nov 2022 16:36:43 +0100
Subject: [PATCH qemu.git v2 5/9] hw/timer/imx_epit: do not persist CR.SWR bit
Message-ID: <166783932395.3279.1096141058484230644-5@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166783932395.3279.1096141058484230644-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xui/3y5wa9QX

From: Axel Heider <axel.heider@hensoldt.net>

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 5315d9633e..6af460946f 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -191,8 +191,9 @@ static void imx_epit_write(void *opaque, hwaddr offset, u=
int64_t value,
     case 0: /* CR */
=20
         oldcr =3D s->cr;
-        s->cr =3D value & 0x03ffffff;
-        if (s->cr & CR_SWR) {
+        /* SWR bit is never persisted, it clears itself once reset is done */
+        s->cr =3D (value & ~CR_SWR) & 0x03ffffff;
+        if (value & CR_SWR) {
             /* handle the reset */
             imx_epit_reset(DEVICE(s));
             /*
@@ -205,7 +206,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, u=
int64_t value,
         ptimer_transaction_begin(s->timer_reload);
=20
         /* Update the frequency. Has been done already in case of a reset. */
-        if (!(s->cr & CR_SWR)) {
+        if (!(value & CR_SWR)) {
             imx_epit_set_freq(s);
         }
=20
--=20
2.34.5

