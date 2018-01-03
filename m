Received: by 10.223.134.117 with SMTP id 50csp12250574wrw;
        Wed, 3 Jan 2018 10:51:31 -0800 (PST)
X-Google-Smtp-Source: ACJfBotEVphzHAflOFIRD1vNzkxezkHu74gudhvMJXZdAm72EI+7KOpF4Ac/pwUINa5URYuefWCv
X-Received: by 10.37.204.86 with SMTP id l83mr2220466ybf.50.1515005491049;
        Wed, 03 Jan 2018 10:51:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515005491; cv=none;
        d=google.com; s=arc-20160816;
        b=wBD8hi0j6bMz8+Fi37o2Q7crRAt9CuU66blv+063uruwU8PfjAKL145dZqGzpmH/pJ
         31mn0l17vZA9etVjGHExyZqT1oYbgeLQwYOUUOZvGITZbtpuIuMutpzFa4ZikqUmrPmu
         n+UQh7HEFEF3HlZwwMuhaRYSk/4yLSLV1DiANbndurXI+QYM0smRnXW5kiUDNHwC2hfx
         /Jlx5BnFBLrhqXf8Zbwt7Syz6v4TbOxTzpMIwccotBU+Jx9KN85RMMP0rCCtv5X+laIU
         IZwq/Sxid7+V1g4jCiMriWUvPibatkHpSUFW9V+SZ5mvuv5SYRJoT6TtFNFBV+T54ce0
         UCww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=FbMk2G9nN+IefznQpu1WTWdyD0wXtry+4dYNm0+yH1Q=;
        b=buLmi8siFDFBA6ORbXpOAS3hKsGY7sWe0jOfoYZY6iEd2nDzyyHlWIhPBu/MFiiBUm
         h2zHVzwABFwPJbi8sUWGHY8fh3t3vuoAEuUToHEFCRhFrWze2/yHiLdet1L1FXWcN69Y
         2T7h8Tf8Ljb3nktrtCRYw0RoWEhT+z0OFBCswfxTv2Ac0ehAjyNhIophABjsi4A1flKy
         TSHSb+Np5gxSIgoRlYdPI4Nx0sUA0hJhv7/12XKhAMKTHMENrpPBMR1tn6H/hhjPoqKf
         Y0kQLGn2z33OM0xeQY7lkRCdIECeGYxtbzt70PPvnNr+cYhFtWRWgNgEhvpht2j0zwBb
         oVVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Em9tijn1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n80si336621ywn.397.2018.01.03.10.51.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 10:51:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Em9tijn1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWo8Q-0003UC-Fp
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 13:51:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnsn-0003fo-ON
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 13:35:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnsl-0007pd-Fq
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 13:35:21 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:41610)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWnsl-0007pI-9j; Wed, 03 Jan 2018 13:35:19 -0500
Received: by mail-qk0-x244.google.com with SMTP id a8so2662147qkb.8;
	Wed, 03 Jan 2018 10:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FbMk2G9nN+IefznQpu1WTWdyD0wXtry+4dYNm0+yH1Q=;
	b=Em9tijn1jVMQtv2mQ9sIm5FLtt0x11HBy5Um2OPaAk7L/yvQ+znSAmf0cU/nHs80DO
	wyQ2zuThznGNnUVQIfnmvOygN4bgoskwzMBrUuwouDqki2Ro9cWvbVJeh05v3QVeURhq
	DVqHx/WQnSV/zSgg6sOAsh3Nus/siLgRPWPpm3vTAEGDuGxLcSxBftEyOT1N63BZbs3A
	S0+Ej7hqh3gy+dtNCOue1hjsS7tYHU5F4aL4OhrkdcJCKjOaNpM8S5137RvDfwj3Kj1+
	rsQ/5njcqBPcaAcgzwfr5f/UBsdg5VXH+p2Ym2R6NCWn662qQJdjETMH0eQ6uIYyNujK
	lG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=FbMk2G9nN+IefznQpu1WTWdyD0wXtry+4dYNm0+yH1Q=;
	b=tvmbHj2ETAU4Q3pqPhUk83Ke+DkyWsQwmmwC0pLbYl6IEiheL0QmAtC0sVYtD5WSXt
	skKimANDH1GFhSzU1iSGugve5us4BfVFT30QcD3ppN2uDDwig/H9s+zt9sU2/mKDAZX5
	fs2IAftXL/Rr7agLQ+yHig5/BiFd92DGnBB5IRj/YJ/w3l6GH5Q6KoKEcMllkgGWWsX1
	rZcsSoRWGik+gevEJVxwbS2HingLtpumzPjFxZoKk4rb1d41hGktiRgc00lEtDGt7t/n
	oEMZNyLAOB59TKn9bXEz6NZsPcGPlrpHc3DlsMxpDjdbFTil98oKvuEnAUYoWa6UO9cB
	QXvA==
X-Gm-Message-State: AKGB3mIWnTY0k35nnh3fPH/bcBKTOdAJGUoNOb+u8id5yiiztSzSaTOE
	f9u6F0JjbE4iyWl/M+EVoYo=
X-Received: by 10.55.183.67 with SMTP id h64mr2867446qkf.67.1515004518798;
	Wed, 03 Jan 2018 10:35:18 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id 185sm992854qkd.1.2018.01.03.10.35.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 10:35:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed,  3 Jan 2018 15:34:11 -0300
Message-Id: <20180103183418.23730-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180103183418.23730-1-f4bug@amsat.org>
References: <20180103183418.23730-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH v4 18/25] hw/arm/xilinx_zynqmp: implement SDHCI
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
X-TUID: 45ZelEd7rjBM

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/xlnx-zynqmp.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index c707c66322..067c309f56 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -374,22 +374,38 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
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

