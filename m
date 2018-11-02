Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1461851wro;
        Thu, 1 Nov 2018 17:16:01 -0700 (PDT)
X-Google-Smtp-Source: AJdET5c5gEV2fajONmE23+lcf38l/Yg14scP4CIfasirxSs14cYLCOsmDufT/AxW64JKWlvD4tDB
X-Received: by 2002:a37:14ca:: with SMTP id 71mr8263831qku.295.1541117761865;
        Thu, 01 Nov 2018 17:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541117761; cv=none;
        d=google.com; s=arc-20160816;
        b=h6FP/WnVCVA5fBzD+QBAlzKAF0BkRw7uiOOzjWCuJ2JG9HRcWQXfTupbowHQiT12eF
         TQ4tGw4GJNgrDP42nEiUQF6P3vph//uO9QqYaLdJ+8sGWCoTZ/w0CkPgbKj0cpe1iiew
         Y9P45hNLEN/0s8a9+nvWQZ1Jos/kKtecYnpqyJKVbcnbGhTze3gy7Jpe6/hGReedTWVe
         li70T4bkuL3nz3jy7UHwvyJ5T6QCijrif2Gxv1NAsZp1V0EdjxjS8P/yuvdF6jbVZQjL
         IIQH9NPwv3Se2xX1mGUijU4jlHjCk69cPn33PXTMfDWADq91e1Wc+kN5lXjUTNU6OT2a
         Dqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=nTfLBj87cY6bTRYPpdKgILVVHqtMz6IBFBmmd7GrCiI=;
        b=hiWR9n/FXV2UPnJUEsD4SLVw9o3+TAHyvDzkOqX9DQ2WGNyhcmz6HxpQz7T45eECAl
         r+zpEjzJjHpgEWVYm03z8Uckohg4RRSji5VBOW1Cwdd/mt4Hs6Xg/y7+GHMGisOShP0l
         gl2hq52djMV6tJJlTPW063uV5EaGtJfNTpbQC9APmOdXDBC/rl3C2DprIlh42yE7Vc0E
         /DnysPgeN9/xiyqz7+MdFGhWGWyDasjykj1QbAYyZ/5Lls2EChtNXsdU6TXCLXKsV7jH
         A0GiXQXrcPtGGHVqInmVuRwI7YsYSCcG2WRfUfy8VO9vjmSDZZX3bWPVd7UCIv7V693w
         XpFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Tz+7gV2B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j22-v6si14659575qtp.239.2018.11.01.17.16.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 17:16:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Tz+7gV2B;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47667 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIN85-0002qV-A2
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 20:16:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5a-0000pT-GI
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 20:13:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5X-00050Y-Do
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 20:13:25 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:34021)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5X-0004zj-6S; Thu, 01 Nov 2018 20:13:23 -0400
Received: by mail-wr1-x442.google.com with SMTP id j26-v6so251962wre.1;
	Thu, 01 Nov 2018 17:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nTfLBj87cY6bTRYPpdKgILVVHqtMz6IBFBmmd7GrCiI=;
	b=Tz+7gV2B+akaaYG522pOzsL7ykU7Q+5fGG11H4OUc8ZoSjg8/MC58ysXV7lBb+P7Cp
	5xpXGGZ5DC8yKRnR2Nu0T8U0rE0Zny+A9KZYsr1oSIzamY0mkvOduyHgpPv5s75nn1RP
	gZMyNAUQQx5NKspe1vboiJz+M54f4A09K41A9xxUID/DoCzlW3iYmR4iIjoVJii/z90W
	WInubFV7X0jOuo8mqWNm/xHMgU0BfwElsHZDdv06RwLgpw/bYeW4olvp/dBAtpKy4XLB
	hBfWGxi0PGA4YIdtJKn5ziLp9mEMQkGm5zoawPc4SEN9M8DviOaoXJul34qrcsxyYhkc
	9E0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=nTfLBj87cY6bTRYPpdKgILVVHqtMz6IBFBmmd7GrCiI=;
	b=NToh0pq+RptvYCh5MjU+vtwANEmUL3WMz3hQdGMTRYn1vHTp147dKyg/WZHAdNK8O6
	2fPMX4Q6SH8j/3Ji7F/eWZqcpS/clJCSq/9PMwZ1RKcSVJGlmraBKk5T+SNWZuWD4hKd
	NUNRqq0EKum7eYrXNcs0J3+TCMs9opuG2uIXylBhMdWTsCrTLg4Avc0GoF2KJwhc/q2T
	tQDgBuzm64UEZazByCuxAdfpsB3AgJF4rXXveaLN/gm4s3rgAbQl0+zonwQlgxLRPvJD
	hAMHKAbhpaD9JhdUkesdY1qTnzm/AyD9MbqixIymp1CcpFfjTjeSTS64ozkNPkEcurhg
	WYTA==
X-Gm-Message-State: AGRZ1gLIXKtSqfy2CUdP56pSbSUnDSCKqtNvoNAkk2Pe5em8TtwKzAv/
	UQixKjJ0GrgEDO/D6SD8pa+KMKvt
X-Received: by 2002:a5d:4dc2:: with SMTP id f2-v6mr8873099wru.45.1541117602233;
	Thu, 01 Nov 2018 17:13:22 -0700 (PDT)
Received: from x1.redhat.com ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	z6-v6sm10539894wrs.19.2018.11.01.17.13.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 17:13:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Date: Fri,  2 Nov 2018 01:12:58 +0100
Message-Id: <20181102001303.32640-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181102001303.32640-1-f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH for 3.2 v2 2/7] hw/misc/bcm2835_property:
 Handle the 'domain state' property
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iUmolEwFFa5T

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/bcm2835_property.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 145427ae0f..5d332324bd 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -121,6 +121,12 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             resplen = 8;
             break;
 
+        case 0x00030030: /* domain state */
+            qemu_log_mask(LOG_UNIMP,
+                          "bcm2835_property: %x get domain state NYI\n", tag);
+            resplen = 8;
+            break;
+
         case 0x00038002: /* Set clock rate */
         case 0x00038004: /* Set max clock rate */
         case 0x00038007: /* Set min clock rate */
-- 
2.17.2

