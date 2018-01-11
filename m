Received: by 10.28.173.206 with SMTP id w197csp1018961wme;
        Thu, 11 Jan 2018 13:09:14 -0800 (PST)
X-Google-Smtp-Source: ACJfBot+M6PhWbzieacTA8+MmWjcObjbn8zv19Yku1g3s5yXBxrn7/EpUuV7uALLI8Vs+p1ziBmO
X-Received: by 10.129.51.68 with SMTP id z65mr21064622ywz.475.1515704954032;
        Thu, 11 Jan 2018 13:09:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515704954; cv=none;
        d=google.com; s=arc-20160816;
        b=AqOEd/RjthaUf0LPv6/m0Tr5S76wzxPoSeggMuV6LO+iWZJqQapXK57dnkD21AE+0i
         XTa8QnTaFU4S5s3i0pfksWDRNG46kwuuuzLOumwCQeK8ihtKKc0JH940zJEfpKX3e6YX
         /oco1aVblzGNgL7tBuDD87nt7nKHiItjbLfqKWh48JRNwlNniAB0hh9fRG0dSKhm9wP6
         0nOmjHoDJBjVzXdy8XDraLcFejfBlHqoUmZahbFeMI7VQp5QLruECUSx7XnrD/QUzUnT
         W+6zKiZcS23a4JCy0RZMCKpxBW8EwDapqV3zfxajFqzFzYo+5Fg8CP0hPxP/4HW0qJVe
         qOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=TO+UjhDYmNYUT5347vMorHWZVMV/hSTmwoKB3PiqHqE=;
        b=VMwyp6+JuZvPrAQPS7ZSoSvz5L4Ve6stxNyL4zgPo7ykcmqNLXVqqRznyM0pUuFYMk
         JSnmeh7Wu2QviiRVRnHWA7QhyswRYvORk/2ikb6dSn9HozNF5+RFhDMurZh7LhXcy7pp
         HKr8S4R4q4ZcFvYiEoIXjXDF01RzGbgjnDU0rND2+2BNBjHPx2WK174RoKSkpKyI4tMx
         9RxUXGwX1lqMd6NtN76VBGEetIsel3eNOn2LLd+G1dV8mJ2zaQ3J6ou/G0lC41uME3AG
         yBxsgz8DEnYjNF84f/MqJzQn33YVKUnSJClNNfaWrjX/Bc2OYDDcXDOdRe6r9sSzFECh
         F+mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hdLI0xPn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g81si4099800ywe.483.2018.01.11.13.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 13:09:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hdLI0xPn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42416 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZk65-0007Wq-Dh
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 16:09:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjv1-00069H-Gw
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:57:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjv0-0002sJ-MM
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:57:47 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:46865)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjv0-0002rz-HG; Thu, 11 Jan 2018 15:57:46 -0500
Received: by mail-qt0-x241.google.com with SMTP id r39so3552650qtr.13;
	Thu, 11 Jan 2018 12:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TO+UjhDYmNYUT5347vMorHWZVMV/hSTmwoKB3PiqHqE=;
	b=hdLI0xPnnBDFOVSEt32T+1EzwwZ0Gni3V7axs1lDLJKSjxm1ZG3h+WuY+NI91ukdvR
	7lGnMuxe7x0joRwkMvSp5JVpzev95tWRJvk4A/494P6MgXX7kQKdvhHFqJGRiwXUC3ix
	AzsatmB4JZQwNz5YotGXfGN1U9G0gyBmAlMq2bWTXI2gVBP2vUtaEqfoak1mtw/CKTPp
	2wvf721afDDhuXwNWEk0xZ8YPBdQ/qeWGfeEBbADlIcORUWZYLClp5BmA/alogSmhEpv
	pstvKxaUxmf2QXOqxXL4YxWdIuacKyxXVlBEbEHxMCgz0vWkCaTTTdq6LmLDUT6lRjRc
	Hgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=TO+UjhDYmNYUT5347vMorHWZVMV/hSTmwoKB3PiqHqE=;
	b=qgDumqkj0/nZ8k4vcDb65RhgPcveWxqy5O5N8o9nTgl01E+Tvs9WBJiXbBCI1wGhuP
	E4DLpbO5m6OHDOiUHPs3oSxiWLMPnLIjeY9dnG8dKKA/QMgfCSFAMJpq/a2Ig/k2uRVd
	93Fn2Ck8sJONnuhD8JsOGiBrAFJe2KYxjcr30VILbqtFYmPpDP7z0qQujufsFBvYq0px
	VX+gx2edpFvZOiMN9Yb4kJ1gEdC2mV9sqx1D7hjvSxfYJiYEQVD662bNWb2joY43SlPU
	6zc2jbMv5Q53/8TccJtFDm56YJs3KaCbR4vM5UnZYMq0SP5k/7yo5YkekJeSMOkpQ3Vl
	GuzA==
X-Gm-Message-State: AKwxyteWLiCdARdzSVICYVtRUlAWYL10xlKb4H1qHtRjk5iUXUtLqC6y
	CcmUs/gZGKw5u2ryb1LFUd4=
X-Received: by 10.200.24.18 with SMTP id q18mr33205311qtj.210.1515704265975;
	Thu, 11 Jan 2018 12:57:45 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.57.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:57:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:17 -0300
Message-Id: <20180111205626.23291-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v6 12/21] hw/arm/bcm2835_peripherals: implement
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zg0La2t1twJh

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

