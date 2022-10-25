Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp613792ejc;
        Sun, 30 Oct 2022 19:16:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5rFC/EvcKUP+8r5Biht38jC51IB4Qbw1VLmAWDopee4eg24mKZlDsAcOUqj/M3/iSzojZt
X-Received: by 2002:ac8:7d94:0:b0:39c:ed3c:98a3 with SMTP id c20-20020ac87d94000000b0039ced3c98a3mr8932585qtd.628.1667182598661;
        Sun, 30 Oct 2022 19:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667182598; cv=none;
        d=google.com; s=arc-20160816;
        b=RuE5EvyInL0nw9OVcmj48m33YqujYmXiCfazQi25i2DM/D2PpoLdUdOlt5aUxgig3z
         IJpYKHNF1iazQ8/F0yWBVHNOwByzQCgfSQ2e/wPtgihaqpB9tVG7lgJMAlaFVkA9T+9Q
         TbQ/PtEVnn3hsaH92yjrPo+/+i1LoXKoxSYNxCFH9iEYV7mDvE8yMeTg7H0UM4g/ShJ9
         dsmdeCZRhO5T2XbiqJLgE+yKwBQ6mzMCM1e1YOsCFv8RbvFZTU5ydjO4ObehqKsP+Ppd
         s1Hv68Zu5A2LWJi+JINS4I9FVP6Mpu4XUl8jDR0X50tsyOj1Lf2b2akV2Sh/0XfW9wtq
         +xZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=NiX7SAGKnRiNeWPNF/ITTLqcQTFgEgdnEGMNIk9dvtU=;
        b=UD0vbZGumqfvZvHZkvt05dUOTyWa82m4nzbGUIUXc9SjmBDS+hq5U2EPosh5r22hAB
         XYsWrTAEwKYS1DawscUQh3hIxO5/hp9xC+iFW4DKjivHKWBFwiTsGYuQL44Z2Qem8rS4
         cxVlJ0VA9lIDcZGaI17xN9D9DePjgBCdC75uGCKsqqCPtWDCjQekmYgOzGsRjq4+Zxea
         yYvTpSTL4acefz+7AmDpY0igKaLfl7q2Jk/j+DDPIUXl9qB0ltq0OrJLOZm6No72auWg
         wAnOlXnxmBvVLHo+9yP78+zeleiJj0dY4e4Jpf3NMyB46hjHNmp8q3Eqa5v6OuID5gib
         ZQjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d78-20020a376851000000b006bac23443b0si2961296qkc.443.2022.10.30.19.16.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Oct 2022 19:16:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opKL8-000150-FL; Sun, 30 Oct 2022 22:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL6-00014S-TJ; Sun, 30 Oct 2022 22:15:48 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL5-00033v-FT; Sun, 30 Oct 2022 22:15:48 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id E112C11F25A;
 Mon, 31 Oct 2022 02:15:45 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 25 Oct 2022 17:33:43 +0200
Subject: [PATCH qemu.git 02/11] hw/timer/imx_epit: improve comments
Message-ID: <166718254546.5893.5075929684621857903-2@git.sr.ht>
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
Reply-To: ~axelheider <axelheider@gmx.de>
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GdUAZVonwGU8

From: Axel Heider <axel.heider@hensoldt.net>

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
---
 hw/timer/imx_epit.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 06785fe6f6..b6c013292f 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -352,8 +352,18 @@ static void imx_epit_realize(DeviceState *dev, Error **e=
rrp)
                           0x00001000);
     sysbus_init_mmio(sbd, &s->iomem);
=20
+    /*
+     * The reload timer keeps running when the peripheral is enabled. It is a
+     * kind of wall clock that does not generate any interrupts. The callback
+     * needs to be provided, but it does nothing as the ptimer already suppo=
rts
+     * all necessary reloading functionality.
+     */
     s->timer_reload =3D ptimer_init(imx_epit_reload, s, PTIMER_POLICY_LEGACY=
);
=20
+    /*
+     * The compare timer is running only when the peripheral configuration is
+     * in a state that will generate compare interrupts.
+     */
     s->timer_cmp =3D ptimer_init(imx_epit_cmp, s, PTIMER_POLICY_LEGACY);
 }
=20
--=20
2.34.5

