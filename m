Received: by 2002:a17:907:686:b0:a6f:1bf6:7fc1 with SMTP id wn6csp468971ejb;
        Sun, 9 Jun 2024 22:29:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXcyclwsmul7PhaGKJCS4HwkgEe42AeY/+repkuuvbdmv/Pqv03rBmlipnqZ6m+oBIV2HK9pBYXknLGkR2O86t/dL+SrZo
X-Google-Smtp-Source: AGHT+IHXjUuxA1mcnduq/YDHuKNxaROUmKam3dbtLHlfJaRU1rm8iHEbbh2X9QOk72udYh7A3z3m
X-Received: by 2002:a05:6214:43c4:b0:6ad:716e:e13d with SMTP id 6a1803df08f44-6b059f1747fmr100256156d6.60.1717997375385;
        Sun, 09 Jun 2024 22:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717997375; cv=none;
        d=google.com; s=arc-20160816;
        b=xJ+sBmXkyTGxV9fRXab+K5+7892Y2yuU/t3oyf4OsHPfXMz5mMW9q/8bCxKgYOXS1Q
         dPj5h5b6XpSeExMbqOfbt1Eyg42VatdP4+u+FlHVZpPHpesjNfNalQwVq5MqswkiLNsD
         9D6Sd1ybtCN2h59qtbcl7hYIssidbRBKwj+uz3h0cuRfd84RC9VB/afKk4FYUlcSXnIK
         ZSYyogPi1pHKGZx7R4tXrkXPca7phFRstE6F94zxV9pgifcuRBlVIhkAz+5ZKZcCy33i
         wWgpfLSwGnZTjy2Ns8SA1pl1p5bz809Ovs0GCA3SPEy5CnabfEy0iKGH6L/l129LhcP2
         6QXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=PWMARl0I+21nxiq+w/mERyrWC5G/fWc3rrWMpD5Xb/o=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=Dhn4mAearEZif+08CMoMSqR8mAGwOYTYu0JGIULYsaCho7epKVJdvMX1ZwM+7OjNKo
         6VQ2onQKA0lLAtLuCzWTwgpmEzdqLljR76gUpB07UqEaNHEP1djIoYxGJPzQwmM0Pfwf
         kuEvyYShTrKw+Z/xXevFzAqzrQM2bbUTcOpaPEosmdkTwrpqpOMuVdP+/AeUHB0gMocz
         PWI9rT1QH6sjF3wSqArKnPzaKLHNm+8cTZvwshUFuKLBM2tUUsLoPDfJYEcuxbrv0f7k
         Xy3TRzrM0RgIDNlEW+5sNFGEnNviFOdTaHioklqO+aQbGoTDoE41uEZqsMardzGDnLF1
         GkfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b0782b2fa2si26312586d6.363.2024.06.09.22.29.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Jun 2024 22:29:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sGXao-0002Sj-Ln; Mon, 10 Jun 2024 01:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sGXan-0002ST-Jj; Mon, 10 Jun 2024 01:29:17 -0400
Received: from dedi548.your-server.de ([85.10.215.148])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sGXal-0002DT-LK; Mon, 10 Jun 2024 01:29:17 -0400
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by dedi548.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96.2) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sGXag-0006yp-1m; Mon, 10 Jun 2024 07:29:10 +0200
Received: from [82.100.198.138] (helo=mail.embedded-brains.de)
 by sslproxy01.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sebastian.huber@embedded-brains.de>)
 id 1sGXag-0004If-3B; Mon, 10 Jun 2024 07:29:10 +0200
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id 2C511480041;
 Mon, 10 Jun 2024 07:29:10 +0200 (CEST)
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10032)
 with ESMTP id u8wa-6Dm6N5D; Mon, 10 Jun 2024 07:29:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.embedded-brains.de (Postfix) with ESMTP id B2282480157;
 Mon, 10 Jun 2024 07:29:09 +0200 (CEST)
X-Virus-Scanned: amavis at zimbra.eb.localhost
Received: from mail.embedded-brains.de ([127.0.0.1])
 by localhost (zimbra.eb.localhost [127.0.0.1]) (amavis, port 10026)
 with ESMTP id j0Z8uWMYjqY9; Mon, 10 Jun 2024 07:29:09 +0200 (CEST)
Received: from zimbra.eb.localhost (unknown [192.168.96.242])
 by mail.embedded-brains.de (Postfix) with ESMTPSA id 9AE8F480041;
 Mon, 10 Jun 2024 07:29:09 +0200 (CEST)
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm/xilinx_zynq: Fix IRQ/FIQ routing
Date: Mon, 10 Jun 2024 07:29:06 +0200
Message-Id: <20240610052906.4432-1-sebastian.huber@embedded-brains.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: smtp-embedded@poldi-networks.de
X-Virus-Scanned: Clear (ClamAV 1.0.3/27301/Sun Jun  9 10:24:05 2024)
Received-SPF: pass client-ip=85.10.215.148;
 envelope-from=sebastian.huber@embedded-brains.de; helo=dedi548.your-server.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +OumNYCfXpyu

Fix the system bus interrupt line to CPU core assignment.

Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
---
 hw/arm/xilinx_zynq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 7f7a3d23fb..c79661bbc1 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -252,10 +252,11 @@ static void zynq_init(MachineState *machine)
     zynq_binfo.gic_cpu_if_addr =3D MPCORE_PERIPHBASE + 0x100;
     sysbus_create_varargs("l2x0", MPCORE_PERIPHBASE + 0x2000, NULL);
     for (n =3D 0; n < smp_cpus; n++) {
+        /* See "hw/intc/arm_gic.h" for the IRQ line association */
         DeviceState *cpudev =3D DEVICE(zynq_machine->cpu[n]);
-        sysbus_connect_irq(busdev, (2 * n) + 0,
+        sysbus_connect_irq(busdev, n,
                            qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
-        sysbus_connect_irq(busdev, (2 * n) + 1,
+        sysbus_connect_irq(busdev, smp_cpus + n,
                            qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
     }
=20
--=20
2.35.3

