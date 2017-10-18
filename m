Received: by 10.223.197.9 with SMTP id q9csp5258789wrf;
        Tue, 17 Oct 2017 20:41:09 -0700 (PDT)
X-Received: by 10.55.190.193 with SMTP id o184mr646619qkf.88.1508298069210;
        Tue, 17 Oct 2017 20:41:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508298069; cv=none;
        d=google.com; s=arc-20160816;
        b=f38DqaEB3jnoAamgaEloCU+D03eiUfNuJ8vPFybjnfqS7NauxilyK/w1tL2iV05m7X
         sKqkssuDP+/ZDmV2tsg6ZILk+AVlRW6dH8k0JRlk1VTHvtuyaFMYUZ2zraDlyifpsrEH
         Qr1rWYHnOTXX9AInNZQnKf2y5XhYbNSkVby5bqxFckhurGxJAVX70DvCC9EdbOo4llhM
         JVIgIxUptjSuBNdOTsGE9vpvY10BTOdTKdPy5GvDNnh6yPf9fio8+7bxep7vvsGf3SHU
         hQ0Au7dsOsHjZdlHKl8sMAx7+Jld/7TP9O/3h4dmieAKPC20/25BA1/KxcqKNaKOuSwb
         ux5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=F66Yg0n+E/IZA/m/3bHo3f5IQ47YYDmJJWqrJtX1Hd8=;
        b=W0EykxtNGkXoUkevn7JSbEr2oDyt6Dm9qnS/3tL4i9fAyKBLAk5A1pKPBotcdgvySR
         +1uIhjwj1jFvIaYPxOoYWguh5/2FIWYimuDZkRmaugo4PTFdVrDi9ErSU+GkmsbKdqGB
         M8vNbg8D9+mOTPPyEwKdrx9rkW7kfqvgttsx6+BX+V204kb5+R44DJsFP4qKguFRxkB9
         LfhanvTbG5OQl4MSUeLMxrZbucpeZVPNT9sEiSC2cBEW9PdvD23irlyJnavMIXwaUWau
         xgR23wgJRainsPG1SeCWujnhtoVfADcC6M5N7RoOHQA0PIkL8BTn1/ysSzTSVb15Zc+K
         sXsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UyoOH1hG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 31si4286000qth.131.2017.10.17.20.41.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 20:41:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UyoOH1hG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4fEA-0007t3-Vp
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 23:41:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e4fE2-0007rf-Ff
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 23:40:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1e4fE1-0003kO-PX
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 23:40:58 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:47075)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1e4fDx-0003gy-Bb; Tue, 17 Oct 2017 23:40:53 -0400
Received: by mail-pg0-x244.google.com with SMTP id k7so3147876pga.3;
	Tue, 17 Oct 2017 20:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=F66Yg0n+E/IZA/m/3bHo3f5IQ47YYDmJJWqrJtX1Hd8=;
	b=UyoOH1hG1QVTrTTVgkQZkyNl3dwDqXqbCcNh6IDCd50k5Uqseu4pegOqEBsD9AUro2
	nVMBdCqj8tEB0Zf8cvYUP7ow6Z5Z0/gc5W+dJSJ5cZC/LBk7fx/q1qTRNpHLDf2MhlKI
	f5Bn9wbMjJrqP/CFigb7Cm72lrXow0mAgGfx8s1yjdR5HKsxIOZiI1m2ze7Vni6zPsUP
	8yrtCB3W9w9GlJVZqrLaHGJSXL2hCzVtll1XVPnKJsvBR0dURQ8MOKp4W2oG66B0Vdx3
	j/5s/KyViDjVLkxCa8B7mP/voSUw/Iib/fcF5YfSKRDaxRoydWS0C5eT9IvNt7qTVzCq
	j/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F66Yg0n+E/IZA/m/3bHo3f5IQ47YYDmJJWqrJtX1Hd8=;
	b=jwg0aTAULvG5fom65Ok+Hmj7cVOOSfu1V0/I6xI9qXKcCS36LDB1jllD/ZgeJm29EV
	UWjOgTohblpfQpdC01c/N+yQfPvDvqKyMuN6uRS+4feTDZq6Qq5JyoBks3azQyyEhR5z
	6XmfheaAGurE2JixqukqE45fgpm8ph2cwMG0ztZp2vRKzqXOb6gfUbbGRr9osCizLfJl
	mK75MZeAKlDhSlziDjnNlUIoWNcHoL7curD5u5UnZSAbet3Wo8Sk4A4kJ27ykEYOV0lQ
	a7rkCbe6xR21w42pUTrpWbUaUi5GKpC5f33ogA9JKo7N7PX2NpeM65Ag9V0ewqtaZWvW
	cbpg==
X-Gm-Message-State: AMCzsaUTho7e++v8mRMfTwQypAC11D1iKc+kpNRPVDbz+Q+dqDTsTX0Y
	xg1whCySSXytaVNe7WFTEZmxTw==
X-Google-Smtp-Source: AOwi7QB4y3Fpcnl2PC7nOHvPWmYFLt3fneotby/3urKzZUAT1FlD4Q/WiC73UePKaVl91h3B+VIpmw==
X-Received: by 10.101.83.70 with SMTP id w6mr12460491pgr.361.1508298052143;
	Tue, 17 Oct 2017 20:40:52 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	t25sm6295942pfh.67.2017.10.17.20.40.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Oct 2017 20:40:51 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 18 Oct 2017 09:10:38 +0530
Message-Id: <1508298038-4156-1-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [Qemu devel v2 PATCH] msf2: Remove dead code reported by
 Coverity
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, alistair23@gmail.com,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, pbonzini@redhat.com,
	imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pJ5+u0cw4MWa

Fixed incorrect frame size mask, validated maximum frame
size in spi_write and removed dead code.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
v2:
	else if -> else in set_fifodepth
	log guest error when frame size is more than 32

 hw/ssi/mss-spi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
index 5a8e308..7fef2c3 100644
--- a/hw/ssi/mss-spi.c
+++ b/hw/ssi/mss-spi.c
@@ -76,9 +76,10 @@
 #define C_BIGFIFO            (1 << 29)
 #define C_RESET              (1 << 31)
 
-#define FRAMESZ_MASK         0x1F
+#define FRAMESZ_MASK         0x3F
 #define FMCOUNT_MASK         0x00FFFF00
 #define FMCOUNT_SHIFT        8
+#define FRAMESZ_MAX          32
 
 static void txfifo_reset(MSSSpiState *s)
 {
@@ -104,10 +105,8 @@ static void set_fifodepth(MSSSpiState *s)
         s->fifo_depth = 32;
     } else if (size <= 16) {
         s->fifo_depth = 16;
-    } else if (size <= 32) {
-        s->fifo_depth = 8;
     } else {
-        s->fifo_depth = 4;
+        s->fifo_depth = 8;
     }
 }
 
@@ -301,6 +300,11 @@ static void spi_write(void *opaque, hwaddr addr,
         if (s->enabled) {
             break;
         }
+        if ((value & FRAMESZ_MASK) > FRAMESZ_MAX) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Maximum frame size is %d\n",
+                         __func__, FRAMESZ_MAX);
+            break;
+        }
         s->regs[R_SPI_DFSIZE] = value;
         break;
 
-- 
2.5.0

