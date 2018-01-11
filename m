Received: by 10.28.173.206 with SMTP id w197csp1011133wme;
        Thu, 11 Jan 2018 13:02:25 -0800 (PST)
X-Google-Smtp-Source: ACJfBotWZAolU/KtgtVajszraWW4pvoaXHRu6ns79ue021wo6uG9Dh8FsafVN78QyOL3mfroUTzb
X-Received: by 10.37.216.3 with SMTP id p3mr21433044ybg.84.1515704545142;
        Thu, 11 Jan 2018 13:02:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515704545; cv=none;
        d=google.com; s=arc-20160816;
        b=GF8HE+xUEGC+Vb2UV6M472qTOXwxVd3G9cg6+DrdFkodF5JZrsNwfJ9ITTD6xSc9mn
         1BODvZNQahrfA6uYWlhFx8Wq1FUPfnfqtCCVloVphKKiXc7q8AWmHQMA3Sg8DhKWYJLg
         qRd7wmYD4uad5kXt2GvPkmZ0eYQ6ILJLziP250f3SgxJJ6xPDCAIdbIsYzzR0IQOctW3
         xi88F+TNTWNsVIZMP7oVDnVmLebKuZvsGgMD1l6LxrpgbtaId5SKKJAqnLT7u6D9pIAH
         cqplB3YgXFcY4L2VKyk56d84e/mUODpt/8bR8D1i8QQoz0aAd8YVy75nwpN0jvE3SDah
         v6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uny4mSTjMXZBjtnnqOPmWKw33YCFfPu8RUMg8C5c1t0=;
        b=HV6V3nS5qhXpJUxXGpfWeZlHkg+Zt7zAFjI0eOrDe3BlGoTGkLYW1mSmDENCcV8SRi
         14IoI5dZm34c+u5FVdOk9Oi9/lpDQO4cxHgzj+6NYECyQKyjgBJwz5niwzx2IzpV4q7x
         XyERmWq0TJKjOcCHMjHJr4bbWQlSDAjRbi3QGp6b5qRbuD9TMibtalP8s118y1Mhup06
         abXlQXkP/3gIBhboWgkzlcWsxPM9A/+8E5ulXTDf5a/cMdtLedjUEty3mrc4mqNOmtl0
         c81xdmw5mJarSrQFZvpttWy6U2vF78CyxT3WEvpMoPlJLAcHIgLkDoCujgUem/z6VRvO
         5JmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k1rrklLb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v197si1392551ybv.25.2018.01.11.13.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 13:02:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=k1rrklLb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZjzU-00024u-GR
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 16:02:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvL-0006jE-W3
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:58:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvL-000391-3c
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 15:58:08 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:40079)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjvF-00031j-C7; Thu, 11 Jan 2018 15:58:01 -0500
Received: by mail-qk0-x244.google.com with SMTP id d18so6089293qke.7;
	Thu, 11 Jan 2018 12:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uny4mSTjMXZBjtnnqOPmWKw33YCFfPu8RUMg8C5c1t0=;
	b=k1rrklLbMddz2PMUegpn4rGkMF4h41szRRgXBwpv+55Zk4UxkxVWlAcMPwetnn1Kar
	sYCWzDYVomli6NZKRCPPjIMaO64CkpZGUU6O/4IBhFyrx2V7UTX12OmwiZPPkrahhiEZ
	APfTYy2ur7Fj0quj4j3rq0IwUXG/I8t0TF1wIKZt1FCho1I/nxmaKpcoTfnd+1jfzqY6
	O8UC8MGc6G+/aeptBd+jiJREtLKsAcMsnvfmXno86eZF61GHojlpQpcU16IeQcCgCpY0
	CWTNXw+HiLijZOjWoI5JxjtJ/9dQ54AFzRMVnVUZyGLiHw2oWl+WbpD9pLLEFviw9cNA
	h8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=uny4mSTjMXZBjtnnqOPmWKw33YCFfPu8RUMg8C5c1t0=;
	b=tBEToYtVI2RYZBhlYxfX5/Ks3JPOszMKXBZkuIiNvavDqyl7hjxkti79Tq/jDZgcsK
	QqGngZS8ZABjSkNA91W4D7PigrmP6ebej4zK66l2stu8pBhLQbKen//aGk9h4ZPtMopr
	xIsYWA3lre63MsdG+X3JjqiUguGSikBWWOPJk3xo4/U9+O990tmVFRIrYSP80E8woj2Q
	dIMeOWhqZEmWiW94XXlNdOxrGPiPtcZGx+bdLNrm2rHVAeSdZnL10KYX9t3lgPCntYUL
	syTsNlIFilNs01Xl/0RU8pbEUsUqlSz/WnjXURoGy2+w0o1+2NG4AzM4JodWYpSaAAuq
	5LeQ==
X-Gm-Message-State: AKGB3mLzvX2yeWmL/GNkVGac4lbEYMQYddL0Qfl2afl3RrdVsSfRhOK5
	wOkobwloceT6s8AXCKGOS+8=
X-Received: by 10.55.66.133 with SMTP id p127mr34597180qka.45.1515704280839;
	Thu, 11 Jan 2018 12:58:00 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.57.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:57:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:20 -0300
Message-Id: <20180111205626.23291-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-arm] [PATCH v6 15/21] hw/arm/xilinx_zynqmp: implement SDHCI
 Spec v3
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
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kgZs5UMabi8f

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

