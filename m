Received: by 10.223.188.70 with SMTP id a6csp1834321wrh;
        Wed, 30 Aug 2017 20:58:27 -0700 (PDT)
X-Received: by 10.80.143.70 with SMTP id 64mr396205edy.264.1504151907045;
        Wed, 30 Aug 2017 20:58:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504151907; cv=none;
        d=google.com; s=arc-20160816;
        b=bri5qq2poMNQiL93/NJ8A52a5/1Ao3u3zl1oQRwbRQJ+nhmvGdHl5O+6YlH0VkfUPo
         ITTLM6ks4uYU9BNBiE4bvXeZtBuW99RQ+BWc7Z0T/0amXTanEsMYFB7sQa2+XCrLs5Ks
         EM1GUnGsiOKIv9cxA8wE+d10g/yKMrxdPiQ+WZyCtuhgrAf1MEn26opu/PjmtWL9BcBN
         pUUeC5AmQocB0oXIuyRKfy5Z2yMwYqumuEqsl9uwxmEvg5UGsCKP1KpoRWvf9KjQSSPa
         LlKRUDbuCOFA6uXdjL0kj9pwy+4P883gbnGKKmueZ3JKRfl0izmHNZOins3qcDpAEkd4
         eVhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=KIodJgPfyDNKVJDKXwpUl9qXpUSHSusQbEpLvuy+wCM=;
        b=0ac/eH+L01DVqsi7se6k7nVWmG86ueONINWXDJ780s7FyyY7VKq+XMHstbAvY/S7Nf
         GjpoQrBCgWQybHUeTERhTmcsS76JGiRCsMABfzOGaUnj1f8w9ytMp/pGPzsDxgLGGoCQ
         c2rC1qZ3b63/cTqgDK2f3lRf8YZrd9dIj/RyTldZfC64fbP6tggfob8KYJb4HfQpX1CY
         8xycgaS687Aee0irn5PPQfCnLsOM7koZKwE3CEvwDGGMLnc/fnhT1IWtfZWTfhP8mWr3
         kRaqaQ/fHpUPFKSFGk41cEDY44VCPFvifmL8QYTIOggBsYQ0aGh7Hf4io46tDneNBxbX
         Y4Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AUz8fd82;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h35si6050506edc.443.2017.08.30.20.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Aug 2017 20:58:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AUz8fd82;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53806 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnGcc-0004uo-0s
	for alex.bennee@linaro.org; Wed, 30 Aug 2017 23:58:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnGXt-0000nD-Rv
	for qemu-arm@nongnu.org; Wed, 30 Aug 2017 23:53:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnGXt-0006cQ-3z
	for qemu-arm@nongnu.org; Wed, 30 Aug 2017 23:53:33 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33896)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnGXr-0006bf-3k; Wed, 30 Aug 2017 23:53:31 -0400
Received: by mail-qk0-x242.google.com with SMTP id a77so6862452qkb.1;
	Wed, 30 Aug 2017 20:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KIodJgPfyDNKVJDKXwpUl9qXpUSHSusQbEpLvuy+wCM=;
	b=AUz8fd82/Y7Bmt9Cs5c6V4dHbIBAtchd8VzAHpA46xMEeYOTMqstyjlwww1DPyHxS2
	CC/oNb9z9PVJPb8HUBFj+b8QvBcW3/Toj9MjLd+/ofDyr9p5joLH/GNrZw1UCD5eJMak
	9vtqS9kjd7YCJx2B2HNO4w7qXuN2jrSXHANJk99P930E7Ns0I1TLdMposb+ifK+X4s/3
	fkQMGZjZzwH6MiK2sZylstHisdVhjBMc5okkpg0A2eWiqJLBGgJX0TVHAwJWsMudvS9W
	VUZ5fQAaGL1lw5DksmJQqRPTGfdN9SKiO0g+lDggMQB4N2zn/3Kk1T7oytIbCdwKImeV
	e2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KIodJgPfyDNKVJDKXwpUl9qXpUSHSusQbEpLvuy+wCM=;
	b=nHyX4g98meCY2XhrWUws/Pp+kIW+11YnstD9waf+6P5eA0u3FVD7JZYxxJq4H3FRGK
	8DRkazZOSdIOD1upqSzknaKTTSbdmvzT57GBUiuY/bHhXE8ypZxRwvA6rVeVGSDH1KW9
	Y6J/ZLOKOg0yYiLCzcR0vRZRmvtYhLIhgruVh0D4tDaR5IjBHaSeUEqJiBrW6mEm26QK
	r+grfq/F2g0KfHAo4/iHZzHCXhvd/sbhFgH49bh/RgvNBzmrCcat/aRUGRNbCFGNIBVx
	C68Pq2VPXVGXYs4+cM6eCLhzX2uI3UF73aP8Fc2Y4lqpeZupzOCTIQBsoT4RemKKh/72
	k/XQ==
X-Gm-Message-State: AHYfb5iE2nHsqyqkHKBRKLraeRtOPV2YWZPbAxOw7KIu2smahFy4ETwF
	mzrYC7yY9Syog/nxqftG0w==
X-Received: by 10.55.74.194 with SMTP id x185mr1965505qka.237.1504151610556;
	Wed, 30 Aug 2017 20:53:30 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id x20sm5072398qtb.5.2017.08.30.20.53.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 20:53:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Aug 2017 00:53:05 -0300
Message-Id: <20170831035306.29170-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170831035306.29170-1-f4bug@amsat.org>
References: <20170831035306.29170-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-arm] [PATCH 6/7] hw/char/omap_uart: serial_mm_init() already
 check for null chr
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Q2PPJ/Ju4gc

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/omap_uart.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/char/omap_uart.c b/hw/char/omap_uart.c
index 6fd1b9cf6b..1f0ac0a053 100644
--- a/hw/char/omap_uart.c
+++ b/hw/char/omap_uart.c
@@ -63,8 +63,7 @@ struct omap_uart_s *omap_uart_init(hwaddr base,
     s->irq = irq;
     s->serial = serial_mm_init(get_system_memory(), base, 2, irq,
                                omap_clk_getrate(fclk)/16,
-                               chr ?: qemu_chr_new(label, "null"),
-                               DEVICE_NATIVE_ENDIAN);
+                               chr, DEVICE_NATIVE_ENDIAN);
     return s;
 }
 
@@ -183,6 +182,5 @@ void omap_uart_attach(struct omap_uart_s *s, Chardev *chr)
     /* TODO: Should reuse or destroy current s->serial */
     s->serial = serial_mm_init(get_system_memory(), s->base, 2, s->irq,
                                omap_clk_getrate(s->fclk) / 16,
-                               chr ?: qemu_chr_new("null", "null"),
-                               DEVICE_NATIVE_ENDIAN);
+                               chr, DEVICE_NATIVE_ENDIAN);
 }
-- 
2.14.1

