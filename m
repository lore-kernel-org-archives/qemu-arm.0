Received: by 10.25.205.13 with SMTP id d13csp11030492lfg;
        Sun, 8 Jan 2017 00:39:24 -0800 (PST)
X-Received: by 10.55.197.194 with SMTP id k63mr77969844qkl.85.1483864764368;
        Sun, 08 Jan 2017 00:39:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f46si53934564qtf.165.2017.01.08.00.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 08 Jan 2017 00:39:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60673 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQ90a-0004b8-UL
	for alex.bennee@linaro.org; Sun, 08 Jan 2017 03:39:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cQ90P-0004ZE-Gy
	for qemu-arm@nongnu.org; Sun, 08 Jan 2017 03:39:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cQ90O-0000OZ-JV
	for qemu-arm@nongnu.org; Sun, 08 Jan 2017 03:39:09 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:33100)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mar.krzeminski@gmail.com>)
	id 1cQ90K-0000NX-1q; Sun, 08 Jan 2017 03:39:04 -0500
Received: by mail-lf0-x243.google.com with SMTP id k62so6502542lfg.0;
	Sun, 08 Jan 2017 00:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=auZYOGCka1gon/gyyyszR+OOjVhvLklawIsKQLzbeoc=;
	b=X1jJa4RawLps2q8Dqxsbyp7S0lCrKAQ1aH0XxyllNBaAFpWknL0s4kpTK+FBbS7YJu
	3egVxwYsMRYKw3mtLQHyWMfmR3wRPFRbZ9TpD3s5KGWQK/ufxQ6VmaHG/NTrvzH3OK1x
	sgK7ZJiV/JxdniijVy4D+XP7ydki4x7diGrFYQBT5xIfwpPCwEO3FCfc9seIkhTcgH6a
	B31ynLtm1gv68LHyZNJFMUujNOpz3CXjgGHIGoGDq8dtaV+LmkOQpdOyqJVRm73YCgsn
	mezrfdd8wbM7hz33ysLGpYbEQoPFk9JGMVKWUpV/FW8giE3S+AEf51SYts4pdUKD6/ao
	S4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=auZYOGCka1gon/gyyyszR+OOjVhvLklawIsKQLzbeoc=;
	b=cfoQO2I5/a3IDG61g7Wr+MUT3mXiASwEf33GZS+K5I8X3hNpr4c6yN4pXakZoH1pKZ
	VUzdmgCn+tX7fkCLVJwlunH0Df6Iu0XQnuhlxGWPmDvWeAk49+PWmH0mxvY/pLC6L0fs
	4Tq75KziccwG9og3Zakm8TVU6bsEKFMVh2hgiwmsfDM/WelCvikJ+6MuLTkDBnRUYBVY
	eAvVacj4ceolMcKq0zp+gMyK/zDZXW7BqJvYCTW53xwnNtHSRL0Gpz/BaS0tYc2fpL1A
	UHyO1bd+UVyF+whgV2fZZrQinXsX4WJL48XPVZmdW3MT3VQ60OCP88O08smfanVcU8Xq
	AvSA==
X-Gm-Message-State: AIkVDXKfJ7ywwgv81WhcvzTcA2D+w5dGoV40h1BUqZlbx+9nLE1y3hi60auK82AyyCSAdw==
X-Received: by 10.46.20.25 with SMTP id u25mr5332923ljd.61.1483864742484;
	Sun, 08 Jan 2017 00:39:02 -0800 (PST)
Received: from localhost.localdomain (89-78-94-50.dynamic.chello.pl.
	[89.78.94.50])
	by smtp.gmail.com with ESMTPSA id 1sm18532752ljv.40.2017.01.08.00.39.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Jan 2017 00:39:02 -0800 (PST)
From: Marcin Krzeminski <mar.krzeminski@gmail.com>
To: qemu-devel@nongnu.org,
	edgar.iglesias@xilinx.com
Date: Sun,  8 Jan 2017 09:38:51 +0100
Message-Id: <20170108083854.5006-1-mar.krzeminski@gmail.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-arm] [PATCH v3 0/3] block: m25p80: Improve mt25qu01g chip
 model
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, clg@kaod.org,
	mar.krzeminski@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DpncF2IDNP7L

This series introduce some improvememnt targeting mt25qu01g and adds
support for n25q00 device.

v3:
* Removed debug printf
v2:
* Rework die erase command functionality. Since the number of dies
is constant per chip, new field to flash description structure has
been added (instead of dynamic code from v1).
* Add definition for n25q00.

Marcin Krzeminski (3):
  block: m25p80: Add Quad Page Program 4byte
  block: m25p80: Introduce die erase command
  block: m25p80: Improve 1GiB Micron flash definition

 hw/block/m25p80.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 3 deletions(-)

-- 
2.9.3

