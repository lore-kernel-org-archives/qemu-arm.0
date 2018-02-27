Received: by 10.28.71.27 with SMTP id u27csp4681061wma;
        Tue, 27 Feb 2018 02:53:15 -0800 (PST)
X-Google-Smtp-Source: AG47ELushM7mohd4WedE86qPkPNrTJWbk6/teT/xrIWNHuJTvLvh1PZF11bEM3hQ4fFIGrfmOkm2
X-Received: by 10.129.56.130 with SMTP id f124mr5539803ywa.160.1519728795688;
        Tue, 27 Feb 2018 02:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519728795; cv=none;
        d=google.com; s=arc-20160816;
        b=j8M356YGkLpGBjdXzM8mDjCB/+88QTW9A7g+MqPHjHmxPxEDqa+38XM1RxmO4sHL9I
         +zglVdmVxcz7pCYKj2Kj8VLVCrz3e38quE5+lFRIInnLSanIPIUW8SF3l3QyZUxikEL6
         HCvWMSCfhv1/yJD55PiCioHtgxJ5OTNptN8KuiJDLQUjIjUsFZYZ9ZXOQ2892naIZBWT
         zTc/QdwYrirBlFyQeNkwQ+yRKkeShHLU2OChl62YOAwHsLn0Ec49YbaXjeknHYt4Mzko
         gmBN+4Hlf1bbbu5+NtdAlX9e1NOUDc1cLB3stO0LGbDk9M8BycS051ohsgzZQlU8Wz1k
         pApg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=bxR4RkALHrAoI9FSOR6VpD83INuPRfeIwUlXBxL+XuI=;
        b=y76KyZGFAbluI1Z2xX3OBRBPFAFAHqMIj/2+KqlBGyzdE15iKfykCyQkL/VMTXIPjU
         HPetnp2STDVPHmjWHiL2Pqxa2xY6V+b39wRZML6lOhA16in1u8zGJwGlTMFMY6DuLqHe
         axEkKRyhO8KKiqpducHmOCqlEGvmFQLPvKc96t2pHy9bhTtw9xxyRPyOq+9mX3ERAMyU
         DzSBQeHa2sInl9tCDiRYYvyYse8Kj3Fd8HqIzKMwoSC9f3nlrqwnoqceu+9NuAeNjjdJ
         OKIZUgbWkTIN2LK6buUSkxW9FmQAQHukv0DwMXkKEIb4nAYeDJ45llS+01SUb3tt96lw
         uLDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X07j9Q7J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u206si971794ywf.120.2018.02.27.02.53.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 02:53:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X07j9Q7J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqcsl-0000b7-63
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 05:53:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqcot-0006Jv-RH
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 05:49:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqcot-0004CM-4z
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 05:49:15 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:44427)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1eqcos-0004Bo-Um
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 05:49:15 -0500
Received: by mail-lf0-x242.google.com with SMTP id v9so26819224lfa.11
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 02:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bxR4RkALHrAoI9FSOR6VpD83INuPRfeIwUlXBxL+XuI=;
	b=X07j9Q7JdSnozjw3f2TG9EkF3ccQkouGFqQe/o6Ba/PdFNiDj46gIq3WNT3oVPMbU5
	03HUdZrGr1rU0KiNfEyUKhDf6hG5Y3H5U3P3IcACyDiycrdhVAhJ6A9qJMb6kTpYVOoa
	f6Z67gJrYvkUr+WbweB2vVbzMt84OPzyz7D+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bxR4RkALHrAoI9FSOR6VpD83INuPRfeIwUlXBxL+XuI=;
	b=DpUDTZOE7g0D5wVlakeO7xczke7TsPsrFIXuoxi0pVevcreFS5ieLvlxdCRhlSJ00A
	qryaURkHR5zXxkSldSJKFm5mkoZAmUssyjy+GxDceBdZVmE9xuGk5QPdHYnathEfVw7M
	/ZWm8ApR3GYUJtjor6xxq6iseVzHo8k/hb2g6TSD8ju4vACELULBVVe2TOvqzaOPOCk6
	pPfCe/ICSLRo8kqXyn7PM9Gud1gTcq8dFn+muA718X4Cbe7FxUfGNpqb6JNUsuM5Zekh
	B0y1VBWBJ1kaNDVKiAq8AQL7uhYDD7MRDHxK4XR6xJGpFIybc+pe//QmPYZsgbQbemSG
	Jw4w==
X-Gm-Message-State: APf1xPBHcRidzvFRw8VakeA6U8+j4oLexMm4PCZgDzkT3Fqzhqcnwju1
	3tnUrNmsy8TzX4THnvMbTuHh3DHyda4=
X-Received: by 10.25.42.143 with SMTP id q15mr9742333lfq.84.1519728553405;
	Tue, 27 Feb 2018 02:49:13 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
	by smtp.gmail.com with ESMTPSA id 74sm2484148ljq.32.2018.02.27.02.49.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Feb 2018 02:49:12 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 11:49:01 +0100
Message-Id: <20180227104903.21353-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180227104903.21353-1-linus.walleij@linaro.org>
References: <20180227104903.21353-1-linus.walleij@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: [Qemu-devel] [PATCH 3/5] hw/i2c-ddc: Do not fail writes
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
X-TUID: 6v9C+0KicbzU

The tx function of the DDC I2C slave emulation was returning 1
on all writes resulting in NACK in the I2C bus. Changing it to
0 makes the DDC I2C work fine with bit-banged I2C such as the
versatile I2C.

I guess it was not affecting whatever I2C controller this was
used with until now, but with the Versatile I2C it surely
does not work.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

