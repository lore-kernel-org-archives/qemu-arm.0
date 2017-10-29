Received: by 10.223.161.27 with SMTP id o27csp1207341wro;
        Sat, 28 Oct 2017 22:00:00 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Qryz11FD1IRIi0nCTFq9uCPSqfIS0MNuBh7xbs+UENw5o48xJaxMR1moH4DKJYFTUQac02
X-Received: by 10.129.41.212 with SMTP id p203mr3420653ywp.369.1509253200862;
        Sat, 28 Oct 2017 22:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509253200; cv=none;
        d=google.com; s=arc-20160816;
        b=ejHN1CVH0LX/W4JEN65nMwucFbkT9IR2WVunot4avc2tlimboyUBaM9WHAzXSMCFEJ
         AHBl0Hu0ncleKS0oweCpHddafnlNKSNHtkCO1vw+dNKFljW5o2ACwVxxOQ/CFAYxc7XY
         68kkTDJZd1kb9aaB+sD/XTy3onmloE0TtvRZYiOyWwWaomJoTiTuW8/HbSMyO7RjyEzO
         E53Ie0K9gBzijp7Iq/354UuGn3bNBG1nz6RE4FJSxATaY8Spbhko1FrUysUKUC/H/m2w
         AG7su3m/kXCubPUS2cVrXH3+buEm9DLZ+vKiop3g3Gft35FkfvhXaf/+cuQdZTX3Kxz0
         PoEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=Rw/J51EpNgbnjj8ILG+OSVqh4GzL55aurVoCB+ygXOg=;
        b=GWV6AitfuKTHArHvSOxiI+fYMrPwyxreJVvvko+QOAuNjL7ddk0bEDVlKKcg/4BH9L
         rOY45BfyeTRNVY7USFAHPnm45yL7wV5oUn4lzjqbhaW4z/5qwK4t1ESzHy5tHMD8OdgG
         bxzWa7z2kNTQO0FPnYw0mmoeHpQB9XscwKYdw/kkAwWZrBgJHa+8tvRSiMhw0Cb4Ryp5
         E+NJcmLNzl2asux5Dw8Aso0i9Xcsp0/Su22cCwT8+NKAcjEE5yTB9wF486QeGXmEQwki
         hyRgo8x3gxRhYFpfffWCUQw6I4KrwEwczOx5U4zjZ069i1fLlkhoLqpZyDyK9PABHH00
         Gv/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WmcrvIUE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e5si1914172ywh.432.2017.10.28.21.59.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 28 Oct 2017 22:00:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WmcrvIUE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34819 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e8fhX-0000AI-Ib
	for alex.bennee@linaro.org; Sun, 29 Oct 2017 00:59:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e8fhK-00008h-J1
	for qemu-arm@nongnu.org; Sun, 29 Oct 2017 00:59:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e8fhJ-0006Xu-UC
	for qemu-arm@nongnu.org; Sun, 29 Oct 2017 00:59:46 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:53425)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1e8fhF-0006Ts-Nj; Sun, 29 Oct 2017 00:59:41 -0400
Received: by mail-pg0-x241.google.com with SMTP id s2so8440131pge.10;
	Sat, 28 Oct 2017 21:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Rw/J51EpNgbnjj8ILG+OSVqh4GzL55aurVoCB+ygXOg=;
	b=WmcrvIUETM//5bWJ3xw1NhTfJYQB+8rZFM8R0YZuj2LjBk0QxfB2YXDplHw0wL/Ei5
	j0S4arSmZ8TKCH3ExYwQTNp7ssm9OhLExfXIrrGvFMSvInHDcCUyGLKHo/qKx+U7tPdv
	vRrpOSgZRdQV2JDV3YgMtFgQvytGJTOPxNrdChklocrcTr7EEc3BTAbxEv4G32eRQnbz
	Ij/59ZYthEjkqky8DGZJyDYNI2dwqNRX4tdxihaLujlIl4/9Yv2osssU4n1YwVzb7y1p
	sk3AInU+eeKHjCEyBbJG2VsBf4oi0LiVnoEFg+bvX7G1qtuVtn8yyoGf7KhZrDoxD+bD
	2VIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Rw/J51EpNgbnjj8ILG+OSVqh4GzL55aurVoCB+ygXOg=;
	b=pqURnYgmtjoTo/BjBcmGOi4BgXw9TCh+Mut233BNP4tJKXY54LoAmpWc5VUr0YK8aD
	zaUyIHEeeatsWFxbxz6YTkYryl22yxEzCXKFjA3r1NLwtp5wzYPekpHN7OsNSX9aO5G0
	gT1HcuRPzR+XsNbPYsNFb9JC6yBGu6q6kdYrYyL7WiS2h9DA3AyvV9DpVJoY0fK6j+0H
	XLtplvQ90y9uhcVNx5lBGWg7b9FyIqzBc5OU2Eii+y/B4GpnFBFRwKA7gZgxF2SQkoY3
	mUB1T4s8i5ttlewsxXqBx5gh62/7+qETrhX9roxQ7F/qpAHynXkYO8VU7P9iWYwwt2FG
	m4VQ==
X-Gm-Message-State: AMCzsaUwTLoWvDIkdzM2ngfAqH/kO2KIm9nA5ICavXm3spnYUd93Vqqo
	XleLzOwfYxH8hM3GlcrTNUe/mg==
X-Received: by 10.98.75.77 with SMTP id y74mr5038216pfa.78.1509253178956;
	Sat, 28 Oct 2017 21:59:38 -0700 (PDT)
Received: from localhost.localdomain ([183.82.194.3])
	by smtp.gmail.com with ESMTPSA id
	d12sm24454508pfl.140.2017.10.28.21.59.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Oct 2017 21:59:38 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sun, 29 Oct 2017 10:29:25 +0530
Message-Id: <1509253165-7434-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [Qemu devel PATCH] msf2: Wire up SYSRESETREQ in SoC for
 system reset
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	f4bug@amsat.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qpYVa8bfVyLg

Implemented system reset by creating SYSRESETREQ gpio
out from nvic.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/arm/msf2-soc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 6f97fa9..a8ec2cd 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -57,6 +57,13 @@ static const int spi_irq[MSF2_NUM_SPIS] = { 2, 3 };
 static const int uart_irq[MSF2_NUM_UARTS] = { 10, 11 };
 static const int timer_irq[MSF2_NUM_TIMERS] = { 14, 15 };
 
+static void do_sys_reset(void *opaque, int n, int level)
+{
+    if (level) {
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+    }
+}
+
 static void m2sxxx_soc_initfn(Object *obj)
 {
     MSF2State *s = MSF2_SOC(obj);
@@ -125,6 +132,10 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
         error_append_hint(errp, "m3clk can not be zero\n");
         return;
     }
+
+    qdev_connect_gpio_out_named(DEVICE(&s->armv7m.nvic), "SYSRESETREQ", 0,
+                                qemu_allocate_irq(&do_sys_reset, NULL, 0));
+
     system_clock_scale = NANOSECONDS_PER_SECOND / s->m3clk;
 
     for (i = 0; i < MSF2_NUM_UARTS; i++) {
-- 
2.5.0

