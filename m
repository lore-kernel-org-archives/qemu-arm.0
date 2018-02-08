Received: by 10.28.71.27 with SMTP id u27csp2353930wma;
        Thu, 8 Feb 2018 09:49:19 -0800 (PST)
X-Google-Smtp-Source: AH8x224znGnibX7zqb7n+TDpvAwK9Iqndks726FDHHxIAr8lMbTZT4CQQ78fBn/55AZTOYvxKT47
X-Received: by 10.129.120.203 with SMTP id t194mr1156754ywc.383.1518112159661;
        Thu, 08 Feb 2018 09:49:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518112159; cv=none;
        d=google.com; s=arc-20160816;
        b=Fam6b5ml8EjWjPyR1HDjBrSCweVseMkJIwJaPz+yweU6i9gV5L8nMzKA9EnPv8yurk
         Z5QaN+7P7ItWW32duEBqlTLioP6G+2V6iA59qznIDhF44DETy7SUmvM043eJ7fI4+nkc
         Fx2Ru1mcFFdwc57VbY19NzfUxKJzUs4VcluNxIjgZ8lOo+crqA0WT9rrBeREU/ljXnlC
         CEpCmWm+KZWtwCvPAf9WZtt1CblQgJEZ6IV2i0ITbYXH43sbpglph0Jna4t+sO4ZNBag
         g6kGxMoafxtCJOHca9gHWME9p76CmSAyG4IaVtmF8/hAfNp03vCPrPQ0lyaMpWf/BOqd
         O/3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=gVWe93aghW5erkY99SxFziTAEOlhMJl4x7Y7R5TRllA=;
        b=cE3Mg+oL3RgKUif+gPPEeXW39pI4U2P/r4BxuON4pEOFeqLtBGuLOlKYA599YclqGJ
         9/3nxeebpldn1EYihqdnfu8DMmsR4oIQDzt/yMT5ltsB4+pP/vPORCnY1vBBG+04parV
         dT9egQ/7fj7cFKefwMHlYp6/0/fnLXD4Q+znMGKCLZqWPMKcc9DsuupmcPrF+AeESq/B
         qeszT+xcoVdQU2vkf4XbpXMZ5w6euJG45zweQIqafKkKE816NC1lkWmChs9bMNzTidnv
         43R1FRidtAljsLpaW+gs8ZANUEsAmwF7RkUDV3s2SYEVQvHdI1DHpM9XR9Idefjog5r6
         UZSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O6xO0te6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 129si77950yby.527.2018.02.08.09.49.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 09:49:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=O6xO0te6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57318 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejqJz-0001Y0-1n
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 12:49:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpto-00031j-1A
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 12:22:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejptm-0006g3-CG
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 12:22:16 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:39888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejptm-0006fo-8F; Thu, 08 Feb 2018 12:22:14 -0500
Received: by mail-qk0-x241.google.com with SMTP id d72so6573349qkc.6;
	Thu, 08 Feb 2018 09:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gVWe93aghW5erkY99SxFziTAEOlhMJl4x7Y7R5TRllA=;
	b=O6xO0te6f2Fr/T7AtR2EeDbYJdNzTxikn7UdNpYg6Kkpng4ZCbqIKOtpPx0yZtbno2
	k/3RBaAxGacZghirWkcMCXE2C+8siELraIEIVVTRUMFo/OCDCDgjY2Zzai+1ecD2Jc1n
	huKaN7vFTKoPKxQuPeYhU8i7LTgIiOKOtBMEl1D7G/dDCrCwR0YoRDKNjLYVjtDopdQv
	LC8603sxBPJ7TF8PfYa3eOJz/FUsLKiMotQj44uuyiCJPE7JuPTTIxZh0KtdB8kn0UTB
	MbRvRp9ivCfA7hXWyDrJvJMzDzLLSdw15KD0UHBpJk1hiK7uMvRf2lyvOGnhihmHAwNi
	mL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=gVWe93aghW5erkY99SxFziTAEOlhMJl4x7Y7R5TRllA=;
	b=LNLoZ9c3pKBlmTTWCX6GvN8QFPEXRyzLJAX20dr8/WaVpFmlwBQGX7Xej57DwAhwSt
	HUSoNU4wVALYoRwY64uYCw1nEYdh7ubyxcHTvH5qj/KerG7kSXxUDOpN3CjiQ4gr1UyE
	6EHKCTWMa7iasAEOILUKf3KeLMO80aZiCaiMpzPOwDUVb2X/X7nyi8dxgkEJqzcZ+lzT
	JutQGQ2n7zlSCeYqCMVmazzRTGtzPK51PmaStoJe1B/HLRA0XBcS53CdOPUh0Q/slhm8
	SZupT/K/oqYvVbLuuz7s7+TUi+prrtehVjP5wdZRep7ztC812Bi2tixrDXg1x9LzDAyw
	B2cQ==
X-Gm-Message-State: APf1xPC+XcSh6LPYKhu+mtmaSm4YnxweaUS8gIGd5da2S4X2QqRa1sUH
	FSOdXw5rj2vrHQknWAeLKeybgc30
X-Received: by 10.55.207.152 with SMTP id v24mr2053898qkl.253.1518110533843;
	Thu, 08 Feb 2018 09:22:13 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id l66sm253466qkf.87.2018.02.08.09.22.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 09:22:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>
Date: Thu,  8 Feb 2018 14:22:01 -0300
Message-Id: <20180208172202.9984-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180208172202.9984-1-f4bug@amsat.org>
References: <20180208172202.9984-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH 1/2] hw/arm/aspeed: directly map the serial
 device to the system address space
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
X-TUID: BDxPE1tC+0DY

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index c83b7e207b..a786750e14 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -257,7 +257,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     /* UART - attach an 8250 to the IO space as our UART5 */
     if (serial_hds[0]) {
         qemu_irq uart5 = qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4]);
-        serial_mm_init(&s->iomem, ASPEED_SOC_UART_5_BASE, 2,
+        serial_mm_init(get_system_memory(), ASPEED_SOC_UART_5_BASE, 2,
                        uart5, 38400, serial_hds[0], DEVICE_LITTLE_ENDIAN);
     }
 
-- 
2.16.1

