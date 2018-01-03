Received: by 10.223.134.117 with SMTP id 50csp12242990wrw;
        Wed, 3 Jan 2018 10:43:03 -0800 (PST)
X-Google-Smtp-Source: ACJfBotdz56J7DNA9epzI8jjDTQII9vCdyPM4Nck+X3OYteMIVez2tVwz0hdVuHTMc0WpqqTKYxs
X-Received: by 10.129.81.147 with SMTP id f141mr2182621ywb.194.1515004983447;
        Wed, 03 Jan 2018 10:43:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515004983; cv=none;
        d=google.com; s=arc-20160816;
        b=pAZdiEFh4EyETvpeLe0i/YSX+QiVipi8e8pXbkNr8nG5ioDEDs57ZxosYzC4Twk9eF
         kf/CgwCB8BMLuBg1wdrL9VceT3JOFPbG7RELGu3vH1vy/TuY1C77JALTIcuhnAnTgkAJ
         bFLlDax2hWZVsB1bSykg8T3qIO8vkQGOk6+FFO7tGJXQ1QvkVgJeaaM27DoxfJ7+dEhl
         1L4fP0mHyjtHpmEi9WFjWzOxfQmwVCtuiroHsV3r64SGNi/2rZp1ihItqt8wO5XuhSTg
         HkXxb+9MIQ0tVgSfdIABh7Fh0WE0W57vAYcgXt3TX7+eDU2t2ZnGAmYyQz6d7aMahaPM
         t99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=y7leIEOif2Jddyf8ZwrzdSeJmqMALN4aBTDFz2uxsAs=;
        b=V/J+ROhyHLf7CJU8/Aaq9M4n4sXP9hLmXEjJedOwA/rZiXMdYR4DsnX6QaSaW7q6F9
         nZwyeFtWTSF4yFIJG8axUbRXXtZV02hq08sKN42XoQL8K/w2gGxv2XRcI6rZZSMONINk
         qpnT9IpMt4xe+aeeKCOP3TH9ghvVBq4UAiKZPp161QNdEcsTpYFHLM3qCjWSilRZjZHe
         wHxklGGWa4a/xAoJczuWHBT3mzsFJ2tQ5Q9YAZSMW80ei/cIjHmNye5cBdeatuIaGNXu
         c3vdsGzVAE0eNUqJYDqzIrUCRxmz2uROa52h8h4EsK4iSrjcoje43Sw2jvFXUcaP+y7+
         JRgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hShnVngA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s83si336895yba.85.2018.01.03.10.43.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 10:43:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hShnVngA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60817 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWo0E-0001nu-Qv
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 13:43:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnsh-0003bJ-0d
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 13:35:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnsg-0007j9-0v
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 13:35:15 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:47078)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnsf-0007ha-F6; Wed, 03 Jan 2018 13:35:13 -0500
Received: by mail-qt0-x242.google.com with SMTP id r39so3193817qtr.13;
	Wed, 03 Jan 2018 10:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=y7leIEOif2Jddyf8ZwrzdSeJmqMALN4aBTDFz2uxsAs=;
	b=hShnVngAse2txfKxzy3vKXGwrDzDYr05Qb8PnrKZ0k79oUgdphrEuGHVaXcohPxADv
	6PyMSpYFxwof1NU1iusrPy4PBPoUgqKyjY4lyUBEOS6eWdyNFxD4exZg7mWJzfbmZfK/
	TYyS4bsvg6BgzjS2cRKye+MzpSGrfva1XifXZ0E13FJP3qNC6exvHKKS98Eq1eJ7OtSt
	1hf7jsZXcDruxjfiNg7aByQjjp0Ciil8Xh64/b3/K3qkJgDHyMDX197F2EDjOR8kNjIs
	HoL2mfwqTEe6kslqcIH+QtNLY+yRBFptFUhT2hQqaWW2efrHb/0QotCW+bQybNB8D8Dw
	85cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=y7leIEOif2Jddyf8ZwrzdSeJmqMALN4aBTDFz2uxsAs=;
	b=qy1C0VRRU8RL2prH4JpAoBZP/pzyXP15RHU4KJlilEVMRbUykbLTlwMPc2r67QyqWq
	uYd2sI06/KkV/GyLcoAQflYghSJ0vYTS+XJsrJGPcKQYSHSeO/Ga6mzxmn2uI/DoD4Q7
	xLNNQcFwPI1Qv5+vDpGuE13FhP+xHKWAFJ9fW/O3qhqjLK9OiqZtRQMmr/zkDTfp6K6Z
	tPykkUXeH4zkkY+Gv8ggUIanBrI2Lk55FQjhefemxSP1LLg7hxyhpIHm2iTKljUdTCdz
	A9JQdHlmR8kWdJ2kOPNIyQ8oWUEj6vebNJDuTqQsAMlBFuD91mO/etZvR9af+teIWHNh
	nivg==
X-Gm-Message-State: AKGB3mLvqpHURNShc9Nu+l6eAwXVXwvR5dLchw/JycEcFazAwdjA5oei
	U/bolSBxj80Ba9jVG4LyjeRayyzb
X-Received: by 10.237.37.162 with SMTP id x31mr3044425qtc.58.1515004512932;
	Wed, 03 Jan 2018 10:35:12 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 185sm992854qkd.1.2018.01.03.10.35.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 10:35:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade=20gregory=20=2E=20estrade=20=40=20gmail=20=2E=20com=20Clement=20Deschamps?=
	<clement.deschamps@antfield.fr>, 
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Ashok kumar <ashoks@broadcom.com>
Date: Wed,  3 Jan 2018 15:34:09 -0300
Message-Id: <20180103183418.23730-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180103183418.23730-1-f4bug@amsat.org>
References: <20180103183418.23730-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v4 16/25] hw/arm/bcm2835_peripherals: implement
 SDHCI Spec v3
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SUdP5JzBXvBS

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 12e0dd11af..b1a7bc1617 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -18,9 +18,6 @@
 /* Peripheral base address on the VC (GPU) system bus */
 #define BCM2835_VC_PERI_BASE 0x7e000000
 
-/* Capabilities for SD controller: no DMA, high-speed, default clocks etc. */
-#define BCM2835_SDHC_CAPAREG 0x52034b4
-
 static void bcm2835_peripherals_init(Object *obj)
 {
     BCM2835PeripheralState *s = BCM2835_PERIPHERALS(obj);
@@ -254,14 +251,30 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->peri_mr, RNG_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
 
-    /* Extended Mass Media Controller */
-    object_property_set_int(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
-                            &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-
+    /* Extended Mass Media Controller
+     *
+     * Compatible with:
+     * - SD Host Controller Specification Version 3.0 Draft 1.0
+     * - SDIO Specification Version 3.0
+     * - MMC Specification Version 4.4
+     *
+     * - 32-bit access only
+     * - default clocks
+     * - no DMA
+     * - SD high-speed (SDHS) card
+     * - maximum block size: 1kB
+     *
+     * For the exact details please refer to the Arasan documentation:
+     *   SD3.0_Host_AHB_eMMC4.4_Usersguide_ver5.9_jan11_10.pdf   ¯\_(ツ)_/¯
+     */
+    object_property_set_uint(OBJECT(&s->sdhci), 3, "sd-spec-version", &err);
+    object_property_set_uint(OBJECT(&s->sdhci), 52, "timeout-freq", &err);
+    object_property_set_uint(OBJECT(&s->sdhci), 52, "clock-freq", &err);
+    object_property_set_bool(OBJECT(&s->sdhci), false, "dma", &err);
+    object_property_set_bool(OBJECT(&s->sdhci), true, "1v8", &err);
+    /* FIXME verify/validate with someone from Broadcom?
+    object_property_set_uint(OBJECT(&s->sdhci), 1024, "max-block-length", &err);
+    */
     object_property_set_bool(OBJECT(&s->sdhci), true, "pending-insert-quirk",
                              &err);
     if (err) {
-- 
2.15.1

