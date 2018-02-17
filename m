Received: by 10.28.71.27 with SMTP id u27csp1861975wma;
        Sat, 17 Feb 2018 06:03:20 -0800 (PST)
X-Google-Smtp-Source: AH8x2258SkaGetT5TPar34V5fl+PQW1yT+2/nILytqW/crRtYb67/+I52zl5RDvXIK5wiFicXdg4
X-Received: by 10.129.155.3 with SMTP id s3mr3516803ywg.427.1518876200001;
        Sat, 17 Feb 2018 06:03:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518876199; cv=none;
        d=google.com; s=arc-20160816;
        b=RRbA1jDMyYEcbJjWXgQIM/VYY7pYsMSqQcq22iLAF3VcPuv7Efvv8KFmxOqJ01OC1n
         yga3CSG4DcctBLWPT9z45dtzg3JuTKxFZcbK/krNNZOm4hmW1jh4Ck9itmJjY/uEncmU
         ehcD6sODn68hbWRPbLfDxpH86Z7L975ERhohFJmWlYjsAyBItsNicnNqJOKCO1Lauhoe
         b32NfXdA+C1Xj4amitAdx4TWLg/GYNcjxmjA1DRp0P4v5wjQh3zKbE/IupZEAgNu6e3p
         3bCOg95EA2f9lN+s2ytqxe29acF8brFMVJyLTc13AFMUV8LCD4TJzQg/pmbIKHrPtQ4P
         nvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=8g3VeqEBLLwqmfKajkLXAjgCGS5xAsK+XOXYyEJ1460=;
        b=BfAQi00fl/i25lbCUGORcKZaeDyJnrqL2lDpR73qyPurESqS3lg1UsDXCb9WfcvDKP
         A6Gq0+7Easrxly5WCsVtyEhSuUs+DglWi62cgzj3wWQIm56k4iBeMFeT7tcnOJ2CNIe9
         3hHknEx5gtQx+q9AiRYhRKL/0kfcSWoAaQD8MUDKx4hOBw1MEFTz7Wai3Uhw6bNsi4Ll
         imszUjLfZ9h61PQWdrzfqCjmtVxCvP8eN+AgkllWTRjjYTJt7kOGFhzDFdfTOMfmBx+C
         dHUAWrasNAQWbKkevzYoGqhr4vmlQ5oi2tWjecYDVAcVy0VoExlqSUIKDYlA5UrbAzW1
         hzMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dOU9yWni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 84si1571416ywd.494.2018.02.17.06.03.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 06:03:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dOU9yWni;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en35D-0005o2-DC
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 09:03:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1en34w-0005mj-RJ
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 09:03:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1en34s-0003nG-T5
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 09:03:02 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:35289)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1en34s-0003mt-HZ
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 09:02:58 -0500
Received: by mail-lf0-x244.google.com with SMTP id 70so1597567lfw.2
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 06:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=8g3VeqEBLLwqmfKajkLXAjgCGS5xAsK+XOXYyEJ1460=;
	b=dOU9yWnir0EXOfz7y+eTCzB69MQ8/P36ZIFoRc627FHtQ1pOoMW6GEmXp5j4/8mMTV
	x8qCxqNqtHpdhZcOB0bcY+6kE/bFtxDB6Q2+sWhfBuQZL1HVdxQrMNRk/+UJ2pHytlsg
	kOO1HnMB6mmp/VVoSLmlvVJBa/IY4Q1La58KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8g3VeqEBLLwqmfKajkLXAjgCGS5xAsK+XOXYyEJ1460=;
	b=SvlkzOv8Ccqia/ed+807HOb4rDyqzKY7GCpyo5OdeqeQG8hAdMxCEeqXG+rqfisSHf
	yq0AI4Cjq72jTqqVxTShc+op+GAN875dTeaHJqAWi8j1NZ/uQY/qOqhGPe7kD5rvntep
	i8SnFx01A40r5E3TZifR7bhmiVNpTp2gEm98xQ4O6X3HN0evFqR4nt/FMA9Bcr2V3dUW
	b5Avfu73SH6Tz4M3WnAGVueAoQLr7ua5ypt5bkA4bZWgQ1Bw1AwxPb7zYOfaPiIJVQW5
	PivmSl/ODleZSki8k1BvBP7WnVoebEQk/eo6iys3xSS5wT8xN4jqyylyEZJgfdvy1Dvw
	c10A==
X-Gm-Message-State: APf1xPASU8E+SChU953XKbSMXmc9xv9fhhuaHSl/D4F/A3O/no47TH63
	AvO0iWrk/MVs5NU0DDcQQhj4Vw==
X-Received: by 10.25.74.205 with SMTP id x196mr6647950lfa.46.1518876176796;
	Sat, 17 Feb 2018 06:02:56 -0800 (PST)
Received: from localhost.localdomain
	(c-cb7471d5.014-348-6c756e10.cust.bredbandsbolaget.se.
	[213.113.116.203]) by smtp.gmail.com with ESMTPSA id
	w204sm122054lff.29.2018.02.17.06.02.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 06:02:55 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 15:00:49 +0100
Message-Id: <20180217140051.22731-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-arm] [PATCH 1/3] hw/i2c-ddc: Do not fail writes
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
Cc: Linus Walleij <linus.walleij@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 45S3oYcN4xRl

The tx function of the DDC I2C slave emulation was returning 1
on all writes resulting in NACK in the I2C bus. Changing it to
0 makes the DDC I2C work fine with bit-banged I2C such as the
versatile I2C.

I guess it was not affecting whatever I2C controller this was
used with until now, but with the Versatile I2C it surely
does not work.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 hw/i2c/i2c-ddc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/i2c-ddc.c b/hw/i2c/i2c-ddc.c
index 199dac9e41c1..bec0c91e2dd0 100644
--- a/hw/i2c/i2c-ddc.c
+++ b/hw/i2c/i2c-ddc.c
@@ -259,12 +259,12 @@ static int i2c_ddc_tx(I2CSlave *i2c, uint8_t data)
         s->reg = data;
         s->firstbyte = false;
         DPRINTF("[EDID] Written new pointer: %u\n", data);
-        return 1;
+        return 0;
     }
 
     /* Ignore all writes */
     s->reg++;
-    return 1;
+    return 0;
 }
 
 static void i2c_ddc_init(Object *obj)
-- 
2.14.3

