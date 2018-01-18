Received: by 10.28.173.206 with SMTP id w197csp6990682wme;
        Thu, 18 Jan 2018 12:44:21 -0800 (PST)
X-Google-Smtp-Source: ACJfBou0DV8SfI6ONAAaeke/eug+OBgu3SlWIMyvqZXDPhaC90NpVRbaJ36BOlf1+WY6pYIS6hN2
X-Received: by 10.129.87.2 with SMTP id l2mr7298885ywb.454.1516308261728;
        Thu, 18 Jan 2018 12:44:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516308261; cv=none;
        d=google.com; s=arc-20160816;
        b=l2jI7LekTyn/enHOhL2OpDy/IEcLCUlNYjk2nySGoC8KHOYxd66KvPIfgy3J0MVQx/
         FBqUgbel4rUlKeOEQilKvIV8bbPbUkhzYVnpOtxnw8OlCk2EZbpuryBZfVSiHWW5JE4c
         6tFYcYW1JSh8shctafFEuxZvbnofKoJVWMk4S8zF4V9yVUnk0IhXDqiQ/dhdK9kbiC+M
         ppvYgih50hgOMh/2gc3IntN8gVR5MOy36HIjqS00MEJmaLLkJU4FxUF13WVUTMOUsbfa
         WjRI/bNhJdhsGnLi5cKNGIU24hCbBtOZvSqgmSVF+KTCdEh4Mk2q7rbC6Yitz4Qqg4JR
         YKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=TO+UjhDYmNYUT5347vMorHWZVMV/hSTmwoKB3PiqHqE=;
        b=FP6KrzMIQtSDDwIthLj7MI1Mw+oasUHb9ZFnWVz0vnYMCdkZxAuRHaymKGxjgMXSvn
         UPkrfpTLHSU3OZIjO328AnqZgBdU+/UuORzT3C5xVY3Io+emWbSwGWNaUnkIfemN+yQP
         O+Cu/OHGO2D1AqArftzfa76JYgEsF1okYkS92TDsWX+Abg2F9Ue+GOrWyG16GXxtD2uD
         8C4PmY/lICBRASQXbXIZ6+IIBf513YmyqgG8SpkCkgfSX2RG/YHNltR3mQmPLWrfUb7J
         73O0Z8PxF0HG0h1eg7nYFjVfRnBK8ynKnLWCZ/9KQ0WvFX9gA4m2H9AU2si5iQPyUVpS
         wvLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Gg+hEdgU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x11si282271ybm.421.2018.01.18.12.44.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 12:44:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Gg+hEdgU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecH2r-0002ky-4F
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 15:44:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecH01-0000Uq-GR
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 15:41:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecH00-0007UK-Jd
	for qemu-arm@nongnu.org; Thu, 18 Jan 2018 15:41:25 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:39366)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecGzw-0007So-1p; Thu, 18 Jan 2018 15:41:20 -0500
Received: by mail-qt0-x241.google.com with SMTP id f4so12713507qtj.6;
	Thu, 18 Jan 2018 12:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TO+UjhDYmNYUT5347vMorHWZVMV/hSTmwoKB3PiqHqE=;
	b=Gg+hEdgUGwJqxqAfx8pzzT8EupAbmtn/XA9G0gRDv7WtGnY+aGQzhOtq2XrFTJF8Mi
	dYxtoUOxrD5LpMIugx8sb5EV8sDucX0VWVCyzNfV4i3A727sqT41TH2Pf8GLz+zjK3Rx
	IapdxUIUnQXhQ2Zdy+1IvXSt/nGjyzTxg22F5MneMfYk1gkXR1Cs6JZIx0R+ncwDHlnd
	yO5hEk6GPTnqs+bZemNK//getII5//ReYkh3NmzwqsOEvvBEvRH3XjzIzUfVQwqP5IF9
	r7TGWFvYa24VKbFRuI5FlTXmODJnH6RFVunqmcJ0alwCet+kkDeJfnMq9tH3Wka2T7WB
	yN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=TO+UjhDYmNYUT5347vMorHWZVMV/hSTmwoKB3PiqHqE=;
	b=FDUQPYoSL2ZMLIRYH5KnTt7ARlNxUyXMXj0UR5kDveRyqL7mr0QTirekbtCy+ty9lq
	2R9AirztGqEf1zoZTmp7GmNIT4SHNhShcs9D9KanD4BkP0Hpw+alnhx8P79VrnSaFPWf
	7oycXq77pLTklOK/lu/OV90NlNSobnz3MV3kqT6ECYw/yx+6B9xnZqlPK4OjDL3+pW3O
	iLkZAMzWakp8DTnDfYnqf05Og455//+GIbt7JOVAFm08OU7H5c6JnL4MpEGD6pyC5Uq0
	hx1ujMldNtqQiE9MFB76MaXWj1PCzJ222C82hEsWc/rtRvZXfBKc/1x0O7DL0WBjC68b
	xmHg==
X-Gm-Message-State: AKwxytfSzJW2A6ywWKyZIK3cRVMQXL+tDP3kMYOqCHmIX1lwObExRB94
	e0fhljdEkqo0g3QOadZYsT0=
X-Received: by 10.200.41.123 with SMTP id z56mr9262033qtz.189.1516308079558;
	Thu, 18 Jan 2018 12:41:19 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 24sm5484621qkv.64.2018.01.18.12.41.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 12:41:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jan 2018 17:40:47 -0300
Message-Id: <20180118204058.5768-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180118204058.5768-1-f4bug@amsat.org>
References: <20180118204058.5768-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-arm] [PATCH v7 03/14] hw/arm/bcm2835_peripherals: implement
 SDHCI Spec v3
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gmfGHnnH9FAa

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/bcm2835_peripherals.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 12e0dd11af..79d680cb1b 100644
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
@@ -254,14 +251,27 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
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
+    object_property_set_uint(OBJECT(&s->sdhci), 52, "max-frequency", &err);
+    object_property_set_bool(OBJECT(&s->sdhci), false, "adma1", &err);
+    object_property_set_bool(OBJECT(&s->sdhci), true, "1v8", &err);
     object_property_set_bool(OBJECT(&s->sdhci), true, "pending-insert-quirk",
                              &err);
     if (err) {
-- 
2.15.1

