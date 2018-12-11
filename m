Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp114596wrt;
        Mon, 10 Dec 2018 19:13:25 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XZii0ypercTgYYSzz9tlurOeRgkdXZ2/vb3HJ7dp9T+0lRBsEpOSN5bWeRgu/0mhMOm27g
X-Received: by 2002:a0c:b517:: with SMTP id d23mr14088993qve.221.1544498005606;
        Mon, 10 Dec 2018 19:13:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544498005; cv=none;
        d=google.com; s=arc-20160816;
        b=dhh1zG8uthLwR1f2aUmlQwJcStY7kP0/T8CfAz5A8AD3wS5Cfrw+23nd8N+Eb3Ri3p
         IZZfupFz2USbTn9t/gsAm66sVbA2QCrAer0LW/uW0muedpZOflZ6/3OId6Nw9pegmX+O
         3XDrZzAM4u21QVTrb7Gx2Jc9OY2uu75lRk3hDdXKz6Iv2Q3Eb8/79Svp5J4xx8zoI4pF
         kwX5pFFYsvy7F6Xtg+WyF3o8MbszD+xuGdG2v/UX472eE5asXpqWHRLdoXdlPPYOTyrA
         KuwcdjHRTPKQhgRkgdZ6WrRIhdc6lH8eSh6Ha2Ve+TNdSdUIok4nuXfXJU6579FzRddA
         Xfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Owaa0etSLo2k3dAshl9kEULzMNPSCOex++05WUPptiw=;
        b=os7hRpm5S9Ipb/xLeC6j8Pwkjznsq1dJ8GPUrC5v+wDy2+YXo5Bd0zCCuqUas0MCvR
         I0114LDfEBvB/gPMcmf3vixGcdtNLeUJFOBRjHBpkxVU9ppJYc0Q4l7pxwCCA0L9KUYt
         6Y0iA2lxDnjuNs5usNvHVHW7gqyKPXuGc6PZMc5IseDrliDMShp85xbho21gJpSzkhAW
         5O8+QdoROntsAQALZ2V3cvdRqw2qQIA0FVYZh6OF+5KCLu+hjUHbJa6+N4lgo+ChNCWg
         CW1kcELdNKA1gbhBaD2ZC0Br1cvOAw6xWXuewyrEey54ZDLHVKlYKG8BUeQzlYtb3ltu
         OOjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UqmxTvRV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h50si1779459qte.159.2018.12.10.19.13.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 19:13:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UqmxTvRV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWYU9-0004qg-3A
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 22:13:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1gWYS8-0003VE-Hb
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 22:11:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1gWYS3-0005bP-4S
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 22:11:20 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41733)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1gWYS2-0005b3-Te; Mon, 10 Dec 2018 22:11:15 -0500
Received: by mail-pg1-x541.google.com with SMTP id 70so5947083pgh.8;
	Mon, 10 Dec 2018 19:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Owaa0etSLo2k3dAshl9kEULzMNPSCOex++05WUPptiw=;
	b=UqmxTvRVomwG7SaelVMO1dbagxokFx2Jga1Phq63+0PhGKRYXoetJOmALOmknoTgVF
	3/H5RzfvI0pZu/VELEY80/BkrDZ6Exgm/1JB+4qD3v/r8B1CUJgjC6APDx54GPmuUvUH
	EHVzVM/CW6qwFIVLtKILtEYGHE415r5ZJTQbl2dtytel10ASdfCdYn285RIkXc3ruG1R
	MGDbrcp2NgiEBRhrTWT6GeEcrXufSKEo7MY5NGdq6E4og0PoH5u2+GJZ6DeTJ/E+Fd3f
	jBy7NMg2RVA4zhDhWNRCwJ3tI1yLR1mNtQraYt2q7zqTNQgru6kuGim/xgMVL3wfuMYM
	72eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Owaa0etSLo2k3dAshl9kEULzMNPSCOex++05WUPptiw=;
	b=CIlovtFXCLUF3NVu7JZGU0jDWrfi7luezTROUR1EqikpQKphqXn5sP/d2UL8F4Al64
	W9fOUUhpdEMeBAfoi6LVvmaM69HS10qjN8+i5dyDyIzPzqcMsA/ptAugtWPGwRdbT/au
	+/4F8Xn85gRiHV1/Ul9n19QaHxzIuWI1y1W3Ko7sYifASrCZifuHmh5IA3uz+aTWX350
	ezkFZgubb6j27PFn85+NH62aTbq7/pNrHQMYDiRTx57TaP9KLiuL4SSvQOM6jK1c6qxi
	oJRBgJeLUEcOMSxUZJI+q7B/NFwI3No9wstVVneZgdF6utizY/Pztw9DwnPQ7rJVqxFR
	GvJA==
X-Gm-Message-State: AA+aEWabcn8VLd5FHeqwpBCA9ArCuUa4cvcKTqm5Fu60OD0nWDljFr2b
	Igv0VTbm+GE7mJEovmVJroI=
X-Received: by 2002:a65:6684:: with SMTP id b4mr13188170pgw.55.1544497873935; 
	Mon, 10 Dec 2018 19:11:13 -0800 (PST)
Received: from aurora.jms.id.au ([45.124.203.15])
	by smtp.gmail.com with ESMTPSA id
	x27sm29243034pfe.178.2018.12.10.19.11.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 10 Dec 2018 19:11:13 -0800 (PST)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Tue, 11 Dec 2018 13:41:07 +1030
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Tue, 11 Dec 2018 13:40:44 +1030
Message-Id: <20181211031044.27628-3-joel@jms.id.au>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181211031044.27628-1-joel@jms.id.au>
References: <20181211031044.27628-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH 2/2] aspeed/scu: Implement power off register
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3UeeDz1SB8x1

This register does not exist in hardware. It is here to allow the guest
code to cause Qemu to exit when required.

The register address chosen is unused in the emulated machines
datasheets.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_scu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index c8217740efc1..aa17d032ba93 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -16,6 +16,7 @@
 #include "qapi/visitor.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
+#include "sysemu/sysemu.h"
 #include "crypto/random.h"
 #include "trace.h"
 
@@ -84,6 +85,7 @@
 #define SRAM_DECODE_BASE1    TO_REG(0x194)
 #define SRAM_DECODE_BASE2    TO_REG(0x198)
 #define BMC_REV              TO_REG(0x19C)
+#define POWEROFF             TO_REG(0x1A0)
 #define BMC_DEV_ID           TO_REG(0x1A4)
 
 #define SCU_IO_REGION_SIZE 0x1000
@@ -264,6 +266,9 @@ static void aspeed_scu_write(void *opaque, hwaddr offset, uint64_t data,
         }
         /* Avoid assignment below, we've handled everything */
         return;
+    case POWEROFF:
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        break;
     case FREQ_CNTR_EVAL:
     case VGA_SCRATCH1 ... VGA_SCRATCH8:
     case RNG_DATA:
-- 
2.19.1

