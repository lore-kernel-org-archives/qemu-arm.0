Received: by 10.28.71.27 with SMTP id u27csp4680328wma;
        Tue, 27 Feb 2018 02:52:14 -0800 (PST)
X-Google-Smtp-Source: AH8x224K/LbS2V5gl9UadJb5nSqcY4T495iUqBX4dZvWztSy2T7pkHHQb6l8T/9b7Y+DQth4Qyfh
X-Received: by 10.129.173.6 with SMTP id l6mr8723184ywh.460.1519728734818;
        Tue, 27 Feb 2018 02:52:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519728734; cv=none;
        d=google.com; s=arc-20160816;
        b=FfgC1gNQfv/DDK4vAosDnot67t0/W4ZzWU8bj6sfPxeWtrKvRXARaX1UgDao060fiW
         RE3z9kvU48H2cCXfsrSDoHVg1POFGQKH5EpSIH8XUN/XCh5eTpPoY5Yfku/9CjItmJQx
         rVPxPO1nhnNY9CAeRC4jwC9fBFgiPDQ/B5ME7D2RPr2z3vEN6tzkMpmmgBcGnerMz3X+
         b4Sp/5VFcbfgf52FckIMUy74Y7vXXVyNAP/8MPx/BQ2qNoNKzSxkjC2T7inQYOXv5oOX
         nmHHw4VgTS2XMOSzgoJiR5NfZYmj9PvyZIvNcse6SWmo2oLJpFZWUxmjRceswC6RULUq
         51xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=TxFe7aQlQyN1Yd30zoh+CU5sYfNhdHMK0tgWjRr0TmE=;
        b=BsrZOx7HkdCgVe5ljiSSbP6Cnlbb4EbM741Gmgh4rEdUz7QsVgK6b0xAfbRhzbBEPL
         D9VXOcYYUFhFporxSSp7HY3otxgeCTl6ppTsxp1eHSYKttRVC6nq4qLXKT1jKNQb98m6
         H+OzMV2WAt+9Vqlp1ubC0gPGQAfEzpY+3OfbzGun8QOORm4eUGwKXkeRW/AE1ZiLe6f5
         N15i5g6XefTO6ZOHGxuPnfm7kfkf3imt05hCHObEUq5+7AcvsjRmppw7madl1Fc7mq8f
         VrVamVEBfQcj9K2vPFzM8CZ+OPRmMNIrJsZQJJGNffu0A+molhXDCqma1iDfjWyI8YIR
         SEnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kXY/LmqA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x67-v6si1922112ybh.85.2018.02.27.02.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 02:52:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kXY/LmqA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36177 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqcrm-0008JW-8a
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 05:52:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqcoq-0006JK-Uk
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 05:49:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqcon-00049H-Qn
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 05:49:12 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:40230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1eqcon-00048w-Il
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 05:49:09 -0500
Received: by mail-lf0-x243.google.com with SMTP id 37so26791613lfs.7
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 02:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=TxFe7aQlQyN1Yd30zoh+CU5sYfNhdHMK0tgWjRr0TmE=;
	b=kXY/LmqAkin4AvsDkditshRigz1cD6Fe3Ca0NOiNsXsPV/QnfkIgvjNiz9vT8bSOKO
	jolPE2ZAJXT3VFoeHh7xDPDGDPQPEWSKHlAsLYkvyyliV5Wmm1lL4+xI//aUbNQuigfm
	TMYtkdlRRDVHejiUjUSJpF95SWTqKUK73IplA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TxFe7aQlQyN1Yd30zoh+CU5sYfNhdHMK0tgWjRr0TmE=;
	b=kAvkXayHBySEkdI3oMBmfeeWQk9CcpRBCDLKXQCBB8Yr4bhSn6g29/SPwzE0piT2W9
	kCkCUQhODX3BszbqqXD631i/tUk881OVsiboUnjcnah2GReQiFcV7KJGis1oOw+uSc92
	keDqii0c2KEQ3Lsl83a8LuddoDeUHjFgCwphcyxbZfN8c+/mn1MriRa2AgjelOirDCdU
	9h5Ep79N6d3fPFWkuUyuElO5yECuaBCzk7BP7HTgJyqaHa4TISjNXyTMRlsnz1oA1Jd6
	usKqqblUFq49eQ7F7SvIqlBfu6R9hk4YGneU4rD+xmGS42QfHlL1Vfd/+//8w4A58fZG
	lvZA==
X-Gm-Message-State: APf1xPCV7WbS2eX2C7Gh6bg5TY3DW4XZit/AZ5c7b3CiSPscuBpGD8+E
	8x4ch4YJvHeNO/u3/OOPxwBWeaJPOzE=
X-Received: by 10.25.103.20 with SMTP id b20mr9910806lfc.16.1519728547894;
	Tue, 27 Feb 2018 02:49:07 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
	by smtp.gmail.com with ESMTPSA id 74sm2484148ljq.32.2018.02.27.02.49.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Feb 2018 02:49:07 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 11:48:58 +0100
Message-Id: <20180227104903.21353-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-devel] [PATCH 0/5] Versatile Express SiI9022 emulation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
	Linus Walleij <linus.walleij@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7wRmmHuP5gjz

This series adds proper display bridge/connector emulation
for the Versatile Express, implementing a simple Silicon
Image 9022 emulation spawning a DDC I2C child.

After the series the Versatile Express is successfully
presented the "QEMU monitor" through DDC I2C.

The series includes two refactorings from Corey and a
minor bug fix for the i2c-ddc so that everything is smoothly
integrated.

Corey Minyard (2):
  i2c: Fix some brace style issues
  i2c: Move the bus class to i2c.h

Linus Walleij (3):
  hw/i2c-ddc: Do not fail writes
  hw/sii9022: Add support for Silicon Image SII9022
  arm/vexpress: Add proper display connector emulation

 default-configs/arm-softmmu.mak |   2 +
 hw/arm/vexpress.c               |   6 +-
 hw/display/Makefile.objs        |   1 +
 hw/display/sii9022.c            | 188 ++++++++++++++++++++++++++++++++++++++++
 hw/display/trace-events         |   5 ++
 hw/i2c/core.c                   |  18 ----
 hw/i2c/i2c-ddc.c                |   4 +-
 include/hw/i2c/i2c.h            |  23 ++++-
 8 files changed, 222 insertions(+), 25 deletions(-)
 create mode 100644 hw/display/sii9022.c

-- 
2.14.3

