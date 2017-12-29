Received: by 10.223.134.117 with SMTP id 50csp7025846wrw;
        Fri, 29 Dec 2017 10:23:18 -0800 (PST)
X-Google-Smtp-Source: ACJfBou3zX+Fs/7moK18W66G1/K1aLXk0XmTzBpdVAmWAVRkVGjZDrNhXgac+Q37dHjeG2bsd5Tq
X-Received: by 10.13.221.133 with SMTP id g127mr24096612ywe.125.1514571797950;
        Fri, 29 Dec 2017 10:23:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514571797; cv=none;
        d=google.com; s=arc-20160816;
        b=kVjJaJrzn5h0NvSEIXDBOXkiZvR+G9jRBCZunIDcpeBPHRaycIhk6bDmeyEsUpjxFm
         GAy39CP1nYsmqE3xizKnCq3y8IwQWitSTrjScZoCmiP+ua3xCtBs05Vc6JTjes4IAFu+
         /CtftQSRXzxeIaSTny7MYSBgKqzZJTEgrmSfEANbjmyopWyfEWsc8rtUBNaTaI89Vuvc
         f++C1T6Zt7dM99/HPsRo1JN1Lv2jjeUgLTK2c9J4l+O1o99OPa822/dNWVfjyI5y8oiX
         lxoB5pyxHuc6D7vHU6rqegqAYPArfnMKaRQghbUmhEXNljz8jfHwC6YF9Xr28eMmK3qF
         W5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=cUigLLXHONMpjzhxXSL9aSC74n0okM/L7q9c1bhkpR4=;
        b=cw3JnGkW6qbuQ+bppGo5gjWt2Na0SbPM6/wxbE672WU0G9BXsoiVw9W273yENryQys
         RYc7fZcjot+1DHhTbZYlCNt/LWvAcdpbouPzoqH3cuXYzCJmRu0Oh0bNTiw0ygzk7Bor
         yftGw/qoLnF+L8S7+VWzXc0x3467qK5X/58G1H54XOl7ukYvaO3ig96vv53ggCHcvNf1
         xA5kPTnQfufOH9Iq7+s4Xd8yifdcVRhUybl9HXrE0xW9CFi4DAw2Bp3OSrzUrP1CXfqf
         QL2dKyj55DGArtB43YsGj9HTeeRDxLD+ESfu5Ze3MZnoBMhFAXOKzhn0XXM/H5YnnHtp
         nQDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MEKrXlfi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k125si6566224ywg.374.2017.12.29.10.23.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Dec 2017 10:23:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MEKrXlfi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49699 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eUzJN-0004Ix-FX
	for alex.bennee@linaro.org; Fri, 29 Dec 2017 13:23:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyoW-00043T-V3
	for qemu-devel@nongnu.org; Fri, 29 Dec 2017 12:51:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyoW-0007gz-4Z
	for qemu-devel@nongnu.org; Fri, 29 Dec 2017 12:51:25 -0500
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:39650)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyoW-0007gg-0A; Fri, 29 Dec 2017 12:51:24 -0500
Received: by mail-qt0-x22b.google.com with SMTP id k19so54935812qtj.6;
	Fri, 29 Dec 2017 09:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cUigLLXHONMpjzhxXSL9aSC74n0okM/L7q9c1bhkpR4=;
	b=MEKrXlfiY3Tp4u8baPdTuF1FrLQuGeSMtFyqkn233CZbyiNQMVzg/pIVhYm74fUXU7
	vXQCkuKR9gD0xXFO2CO7Jsw+ib5opYZpPaz7ksB7d+eHKi9XnPGuF5eGrBF0Aaa/bLyj
	5CCrYvLKA5On8pVpsp5YxJcKrUiVfcrqew/ZiZF9K39lEvmHM567gyf03Ua7INPxxCDx
	UziIcQqow7lSC0dV4yN35jpcjKR9zJ1jGsCbGUtnnbtBfZ//mfGnV2rOHUnWcPpGxjxM
	OHBD2tNN0df9jILR3iDDCJjm7F0BiADTaanSVqcus9FeJmFLsvVtVNugsETd2BEPeTSA
	1Izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=cUigLLXHONMpjzhxXSL9aSC74n0okM/L7q9c1bhkpR4=;
	b=HvschBqGwbM8i6x8HMyMT7A8yWHKUbkZexXGw4K+m/eKG2UHsUkwCbMFIOtuU/G+AT
	5yzOSn/m2QZ4/ULzwOQzKwt89ewn5R7o2oF9L01ZcGpGugNbqp4cHCQ+EkiOokN84Gr6
	/vKQTqWFUdOPmSRUKjsVQp4PwjJkW1NUUZd7dE3o5djXptYdtHXyVI/w/y+lze2c6yEC
	t0wye7qVuB4qSYcmDN4tksnmzyg7XBNVh6Af4tbWvs1uE6QLY0Csn/Ykq3o8iZvSzzYI
	2A2+c6s8qhSi6EWTjHN+HM7qzXzRFzhEWKJXtUNjaGkmRFsIcxRM+ZBJRLidqY48tFnK
	7uAQ==
X-Gm-Message-State: AKGB3mIz8tWF2asqCYupj3VJ9ti49kGfVMkqNOjzYsuG1+S+d/nyvu3c
	iCBYQllNiccwFZvN5n3RAtA=
X-Received: by 10.200.3.158 with SMTP id t30mr47134504qtg.149.1514569883405;
	Fri, 29 Dec 2017 09:51:23 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	t41sm24223893qtt.84.2017.12.29.09.51.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Dec 2017 09:51:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade=20gregory=20=2E=20estrade=20=40=20gmail=20=2E=20com=20Clement=20Deschamps?=
	<clement.deschamps@antfield.fr>, 
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Ashok kumar <ashoks@broadcom.com>
Date: Fri, 29 Dec 2017 14:49:24 -0300
Message-Id: <20171229174933.1781-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171229174933.1781-1-f4bug@amsat.org>
References: <20171229174933.1781-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: [Qemu-devel] [PATCH v3 33/42] hw/arm/bcm2835_peripherals: implement
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
X-TUID: +hw6QWAZXfvF

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

Note, the bcm2835 seems to have 1KB minimum blocksize, however the current
model is implemented with 512B.

Can someone with access to the datasheets verify?

Thanks!
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

