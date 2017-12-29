Received: by 10.223.134.117 with SMTP id 50csp7027936wrw;
        Fri, 29 Dec 2017 10:25:58 -0800 (PST)
X-Google-Smtp-Source: ACJfBosLfhIIzpxxsdV/WmOnsSJLa2g7qk1oQnkDRy45kDETU9x5FPCUCtSR3E/cPa7YdMEi1r/O
X-Received: by 10.37.246.39 with SMTP id t39mr25802932ybd.257.1514571958331;
        Fri, 29 Dec 2017 10:25:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514571958; cv=none;
        d=google.com; s=arc-20160816;
        b=u/Sbac4MeeSVuBU4ScsxhHAQGFYLMsyxMreaS1m+OlOarIk8rq+lM7BngOyOcxs9qQ
         B1qsdS+/VsGf2ZrZmiwPiJjkBU0tlrkBjw0TNBus/XPecTD9Nl1zbFoe+VglcZqoIxFC
         wT690TMPPKgdXRMO2ltJSi75ohpOaKqm1ZjT+o9zo7vm36GznB+2T37jtlpB1wN73ThH
         fuBmTpcjYhCBD3ezdAW7ByNrUQcweD7hPyDG8d9fTEfjVUsY7ZVcYjKXixtV7rGPkoBU
         PPZPiiY6jp0+MeQfxFtoL7fj86jchk0vEdd3jWb4KKAWrzuSR3X4cUilI0cZH1OG1wi/
         yWDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uny4mSTjMXZBjtnnqOPmWKw33YCFfPu8RUMg8C5c1t0=;
        b=Z3o5pVwevRSRrMnRD/2ulQCtnMEEhEFGZPbWlcSkRaYins8g2Ll0Lx9FInByzIsv5m
         BY6wG44BBQUtZNVgyXtboRGDOx4ctb3UijUbwi7hnUhfxk+p0KH80HG57JPyd9S60HxZ
         ZS0iLHgHhZ74UqsB5p8LudgYkRT9uhNpAERyZDaHUT/0eR4kjIlqKYjD3D00zZxXGHII
         2PrvDlcM7tbul/xXnkB269xNzj9nhyXzZIHFVF+JX3gXlc3uhxaiDhRwPl0invnzvsnL
         14vBNq4/BJI6s8Q/oLqf+I7Cm/qaGcOgz6tCwG0TUI4PE7dPuE51lp98mg66MmxQu3gj
         dJjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cpLc+v6e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y15si7064401ywd.138.2017.12.29.10.25.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Dec 2017 10:25:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cpLc+v6e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eUzLx-00064F-RV
	for alex.bennee@linaro.org; Fri, 29 Dec 2017 13:25:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyoc-00049I-MC
	for qemu-devel@nongnu.org; Fri, 29 Dec 2017 12:51:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyob-0007nP-Sp
	for qemu-devel@nongnu.org; Fri, 29 Dec 2017 12:51:30 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33779)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyob-0007mm-O4; Fri, 29 Dec 2017 12:51:29 -0500
Received: by mail-qk0-x242.google.com with SMTP id x7so36175916qkb.0;
	Fri, 29 Dec 2017 09:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uny4mSTjMXZBjtnnqOPmWKw33YCFfPu8RUMg8C5c1t0=;
	b=cpLc+v6e3I8dqakuuPDPaFhWufha/FpkYzTMfEBNWeH2RqXm0z7WOFl8WieIBPoGJi
	1lomKsqHFH8hShZlUxSRwLFJ26pWB3r8GzgobsIUdcbbQwXxHOVAR44LpmZUg062OTwZ
	wW0KL9RroGyMPkv4kVGsG5k796vRfCdPJRPo0WfV3SrlXEMM7q58h1ldfiEGTyk73/bT
	TDadXylglmnZLWto0dCylJyAB4I89uIhfmm2IoezWQSc5R/LO1FdcN8GIvs+XPq1oXQd
	r+LKxguZWw8l02KuuMN/cAI/gcTa3JZ6ku5SHPdHyBlteEje+2Kc73u574F9F6sqixe3
	T87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=uny4mSTjMXZBjtnnqOPmWKw33YCFfPu8RUMg8C5c1t0=;
	b=DK2HB0v2w7bvKnwzh203Bp7rfD3Dfl/dULKRHJZZnarsfruQyhwpqq5CKb/n3EFo+W
	sfoYIvnGjg5SM4NWDe8ZZ0bCvFfVRvy/gBGyLlWqgtREsmt1WVnr+hUTrkDJGp+6mMxK
	BNg/udqxXLPZ63rHnevuTSqSnjbWxVP/XXLDOC65hOSJBMJllZxKNWjqUyJ7Re30xfil
	pGhZYlo2/jjN+vqKABkgbpVgfNdV/t1Y9794R77j60Qye6zfAuHyKFDRW7etB8WdOfzJ
	rtuezdybHMBoi005tusknvm5s9mJDWPjmJXGl6LlWY3VhG4bfTieQPOlJMhJ7sfYc6xl
	EKOQ==
X-Gm-Message-State: AKGB3mKDezZJvUfXN6WrOxXio8ycNw3Hwv4IUkUlir1EIjsoW36hdvR0
	tMSlM7krD33tHfNsTGz+Os2KALw8
X-Received: by 10.55.130.133 with SMTP id e127mr44664762qkd.279.1514569889184; 
	Fri, 29 Dec 2017 09:51:29 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	t41sm24223893qtt.84.2017.12.29.09.51.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Dec 2017 09:51:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri, 29 Dec 2017 14:49:26 -0300
Message-Id: <20171229174933.1781-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171229174933.1781-1-f4bug@amsat.org>
References: <20171229174933.1781-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [PATCH v3 35/42] hw/arm/xilinx_zynqmp: implement SDHCI
 Spec v3
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S96f1XF4MNUn

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xlnx-zynqmp.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 325642058b..dacf89c566 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -381,22 +381,38 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
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
+         *
+         * Host clock rate variable between 0 and 208 MHz
+         * Transfers the data in SDR104, SDR50, DDR50 modes
+         * (SDR104 mode: up to 832Mbits/s using 4 parallel data lines)
+         * Transfers the data in 1 bit and 4 bit SD modes
+         * UHS speed modes, 1.8V
+         * voltage switch, tuning commands
+         */
+        object_property_set_uint(sdhci, 3, "sd-spec-version", &err);
+        object_property_set_bool(sdhci, true, "suspend", &err);
+        object_property_set_bool(sdhci, true, "1v8", &err);
+        object_property_set_bool(sdhci, true, "64bit", &err);
+        object_property_set_uint(sdhci, 0b111, "bus-speed", &err);
+        object_property_set_uint(sdhci, 0b111, "driver-strength", &err);
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

