Received: by 10.28.71.27 with SMTP id u27csp3546437wma;
        Mon, 22 Jan 2018 19:08:50 -0800 (PST)
X-Google-Smtp-Source: AH8x225cqSnkqkhBSHGr32+7YkWdTaiAOzmp+QGd3R3xnQMHB7EQJfDxRXAOkIOPxFMNAbPsz0MQ
X-Received: by 10.129.110.68 with SMTP id j65mr1016557ywc.58.1516676930364;
        Mon, 22 Jan 2018 19:08:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516676930; cv=none;
        d=google.com; s=arc-20160816;
        b=pHRYvaL4Mpv2f4Zu/kIRS6QfvM8xO37p0nS/KnIcg/4LRaB8Tpy0L5CVJWd+35N+HN
         DuNRI2N/svXogpwW7YrzEJipwFoh/UL04ZHpMtdoZ3OyuGEC1zbiUP03Fm9yRJiWoiMA
         SD0M2NbOw9VrZ/8TcOoJCecZ+fmbE4Rcdlp1M9/qialJVlGJfv+xkjN63sy5yXVI+kms
         xcvB4H9rUbx37ggpjWDfc53GQz7i14a3wE9+ZYaNg7x0zb/rGD+c8SUqvQbJOG84n0l1
         J+uyFnqO0VNI0KmbSdF8bxERUHCjAi0uGOr5ji+p7iczgZgdO7oXfbCFNMG+YmipMARo
         4MDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=PmEmrdLS7pSLJay+3TU7YpniIW3Snqbht3RfaHUQeWs=;
        b=BBECx2mvtO5T6c+Nwjhsr7hD5ArsPlO69jHISIR+KtgEuXz2uPqcRdfkdvrahJz9HU
         23mwztSdQbxO+nm7bSCFIBbPUf/lp3XnBLogf1VK+/cLeSs3MjzrvWPDKsM/0Flbo1ww
         a0Pnmi8MKz030qv00QWaokz5G25fdE22SNL3HDGI7gCRL0VhsZiV30hZEw8/X6EFw3Ov
         Hfs8ruG/vCKAQ2lpO6BrtIyGeQdLmOQ2xvYd0gjKpswLzKG+Wr5FujXJfnGR8L1izsJG
         W8l3gFBdigi8orzE6IQRji4UILGZ44DNCezoqz7n4CtgCpfU8v9isGjVC5kvOTwNOFnY
         2YPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jIHZ6UAx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f10si2193538ywk.431.2018.01.22.19.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 19:08:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jIHZ6UAx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edox7-0001pN-Nv
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 22:08:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60243)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edovY-0000yc-To
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 22:07:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edovX-0004um-U4
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 22:07:12 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:40710)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1edovX-0004uY-Oy; Mon, 22 Jan 2018 22:07:11 -0500
Received: by mail-qt0-x241.google.com with SMTP id s39so26394004qth.7;
	Mon, 22 Jan 2018 19:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PmEmrdLS7pSLJay+3TU7YpniIW3Snqbht3RfaHUQeWs=;
	b=jIHZ6UAxOIhl6htFWHMGOT55HwXQhxedNDqIKyU8gaEbynSnefHpUbsj1hvdIuVr0K
	96WOS9RSnF3PTKw2Cf/qnBh7DJeHFRLVcQFPRPUB99Kt8z86eK66gXVk9aEu/r7iW3WQ
	0dUcUS8GgB8w8NSuj/vK1Drl0ZI5brA7JSSB1WNZwvwCYv7x1qSVyDMoNyid0NvVgXF2
	oJf+JcN3l7PD0vWKTajRnqo/Pc6Y7iGe8POGJ87O8ggRmdBZh0cMNaA9r8JIZ6XeT0zR
	XFhsSiVTN0MuyzbtJo+owJQtNI9Eebx2w3psJF6uBc5wskU13DgTy81LiFC7CbhT8EIj
	9cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=PmEmrdLS7pSLJay+3TU7YpniIW3Snqbht3RfaHUQeWs=;
	b=fOaZy6oqW8tzjm4IfjuqMKFBUHk8d52za9krMGeYQkgc+5n1XbZnx1UwKQEXH7O/fZ
	CQBAj+H1UcsG9leYOJclpN/CeDnuO9tFxdKGBc5zaVAOET9tKulUisVnaT3/6j1GVFEQ
	YiFvPi7h3BOxC9KR5thgS/YlOQm3Njz3RISd0h6IERSEejcl6f2BuHyc67aZGFIBf01j
	+tFWs2CXePqccXcly1d7ZKjQbNITRt8n05d0IoLDYVlkufGaUKQ+C15oOjZazqOTODKt
	YH4MwdB1yR9UPyoKx3juGsBIOglvrk5GAesjpIy7acNW1rNXRsTwfn7o0d7Zy+imKCAm
	brPA==
X-Gm-Message-State: AKwxytfiPbtY+O83e5npXFgEPB1Grt7M4OfxmCBIvAlEkP/WTuzx39eX
	KKR+ZQ9yhdAxeaGvFGnVRX0k8f49
X-Received: by 10.55.72.17 with SMTP id v17mr1519736qka.235.1516676831365;
	Mon, 22 Jan 2018 19:07:11 -0800 (PST)
Received: from x1.lan ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	v20sm4174785qtg.79.2018.01.22.19.07.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jan 2018 19:07:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jan 2018 00:06:26 -0300
Message-Id: <20180123030630.26613-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180123030630.26613-1-f4bug@amsat.org>
References: <20180123030630.26613-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH v8 10/14] hw/arm/xilinx_zynqmp: fix the
 capabilities/spec version to match the datasheet
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
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	"open list:Xilinx ZynqMP" <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vKAbLh8/vm3j

checking Xilinx datasheet "UG1085" (v1.7)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xlnx-zynqmp.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 325642058b..33d5fe53d8 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -50,6 +50,8 @@
 #define DPDMA_ADDR          0xfd4c0000
 #define DPDMA_IRQ           116
 
+#define SDHCI_CAPABILITIES  0x280737ec6481 /* Datasheet: UG1085 (v1.7) */
+
 static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
     0xFF0B0000, 0xFF0C0000, 0xFF0D0000, 0xFF0E0000,
 };
@@ -381,22 +383,27 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sata), 0, gic_spi[SATA_INTR]);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
-        char *bus_name;
-
-        object_property_set_bool(OBJECT(&s->sdhci[i]), true,
-                                 "realized", &err);
+        char *bus_name = g_strdup_printf("sd-bus%d", i);
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->sdhci[i]);
+        Object *sdhci = OBJECT(&s->sdhci[i]);
+
+        /* Compatible with:
+         * - SD Host Controller Specification Version 3.00
+         * - SDIO Specification Version 3.0
+         * - eMMC Specification Version 4.51
+         */
+        object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
+        object_property_set_uint(sdhci, SDHCI_CAPABILITIES, "capareg", &err);
+        object_property_set_bool(sdhci, true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
             return;
         }
-        sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdhci[i]), 0,
-                        sdhci_addr[i]);
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci[i]), 0,
-                           gic_spi[sdhci_intr[i]]);
+        sysbus_mmio_map(sbd, 0, sdhci_addr[i]);
+        sysbus_connect_irq(sbd, 0, gic_spi[sdhci_intr[i]]);
+
         /* Alias controller SD bus to the SoC itself */
-        bus_name = g_strdup_printf("sd-bus%d", i);
-        object_property_add_alias(OBJECT(s), bus_name,
-                                  OBJECT(&s->sdhci[i]), "sd-bus",
+        object_property_add_alias(OBJECT(s), bus_name, sdhci, "sd-bus",
                                   &error_abort);
         g_free(bus_name);
     }
-- 
2.15.1

