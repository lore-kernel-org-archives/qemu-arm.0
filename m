Received: by 10.223.134.117 with SMTP id 50csp7024343wrw;
        Fri, 29 Dec 2017 10:21:37 -0800 (PST)
X-Google-Smtp-Source: ACJfBosjwpdYZEwPwMcqJ6vP9mxTiu4fZPfXGS2AQl8v0bew+J9qWYv365lKyZIN0Ugf/Z5fdOrw
X-Received: by 10.37.4.147 with SMTP id 141mr27289020ybe.445.1514571697019;
        Fri, 29 Dec 2017 10:21:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514571697; cv=none;
        d=google.com; s=arc-20160816;
        b=rKPqj9dS3yCfJm2dYAMfuqj5eXjGoYA/3qQaH7qndGmJp9vdfPXTL2mB1j6so8E4oR
         28ZLttzQ0jdxxfM5bfZoDXj+TfpHK5Y/j1jxdLjoYMALQXg5s9PQF0cYbyU6sQ6lb7Et
         lq3cY3CCLK4tfjkaCttgI326nCLlhLbcWl59h6EWBLVzrbZIQzwZLyA950XLHTUFJSQJ
         YDBeDND7+glbyEIKyg3N/rE7mTngRvLV3jGERBP90j5/RwrAzMMZYs97jEIcgADayEn/
         JppJjHoxbsaf7RDMk+YBpnARpEc/NMg4M60UtxQ7E/ggI3xXViZQISR4EzRGCJLcYNmn
         CYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=KLSH73+PhrTDeU5qHRVEPzwUQ7axdsLgk+Caal09PE0=;
        b=f02bZDws3ivWL2GlMxfzY28LAM2nInreXzuRPUwMuNek7Y/FUASARqgUrcGpV1OLm1
         5s09ChYkZ0mh5SPcllRX8P8J1iOKkhVPSPBABR70XJOaH30kotSU3fncWsPPWosX5B+X
         hi9zXLYxkmE991jCWzw5w6KsYPp6g6MGyerijh2r0qycsjr6s7BGtp6WXX8NnIy5xI+c
         T4QT48J6tLEGXrqp+hLm0NN8hef4Rta77zwhZ4QSsb7gVGdVoegi4rNIrNGO0Xyvbnlx
         hmX/zpYL8D34E9vTDZP/sJYaWZv0zbZCxLclj3XMd2j327wbfvnFyoCKdcxCzg6GduJt
         fKdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G+ts4i4Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v69si2677554ybg.74.2017.12.29.10.21.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Dec 2017 10:21:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G+ts4i4Q;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eUzHk-0003Bc-Gb
	for alex.bennee@linaro.org; Fri, 29 Dec 2017 13:21:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyoI-0003rr-Eg
	for qemu-devel@nongnu.org; Fri, 29 Dec 2017 12:51:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyoF-0007QI-DF
	for qemu-devel@nongnu.org; Fri, 29 Dec 2017 12:51:10 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:40253)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyoF-0007P1-9R; Fri, 29 Dec 2017 12:51:07 -0500
Received: by mail-qt0-x244.google.com with SMTP id u42so54932822qte.7;
	Fri, 29 Dec 2017 09:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KLSH73+PhrTDeU5qHRVEPzwUQ7axdsLgk+Caal09PE0=;
	b=G+ts4i4Q7ngbB1wXEia42iJL0vHTWW6qpk9L+9sD7/Ziu1MQNNF8esnLFZz7WmVc8D
	3871KNjGux/4kAMmuR0wuLK8Wa7JD6WlvIgGXs2WlloM/ZKWacMLbzbS7+fEAzat/PE7
	gu8pVIBYBfPO//OM2mblfJjoDZjS+HsBD40xn7iQ1/Mc4rKr6U4qolsgJh6zMWihKOvP
	7GEPWtHeOTNVTSt36LR2CVSyKNi0WQfrTFpaI8C9VbKO7w047gc9ipalQeZztiMEk+rT
	paViR+4N5/5oMppWEfIoXlDeL1TyCyK476fW3FKojHIH2RxEfRTmyZnIIpr/z3/oZQYT
	W2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KLSH73+PhrTDeU5qHRVEPzwUQ7axdsLgk+Caal09PE0=;
	b=OeTebbAy9MmzK00d+qxjS0j2DZ3Klg9PGEIfVONrD5Q00qUfbiqewhhZAMSnE5Bj/z
	qEpbC4G/JvaEn1IwnYk3Q594CW9+dYYDE1l00b3OJJmNb9gMMcrbTiXRbs5F8ONFWIrI
	kxnG8lksnkurdZ5dwgXkgvMsaVSZkMGlTTq7Cm2sRKv8PWx6PCXslo93zKQ1M/I43nhq
	mPgPJy+5OIT0jTr32Y2lTII6H7UuPIYChYVWCQSkLVEB7kS5EwUHI+HzkXOoqerdNR1H
	IzwhfHa/+90JE6MWISek6IgfLeaUDfR9c3nef6CmZ7EGcN7CFraKWoj5o99K6kj/u3CW
	kamw==
X-Gm-Message-State: AKGB3mJdLJJbyPJhqzX+OWehRpm5v98xEWa776mvRzcma2HnV+7FAPsV
	FCxQc2Yb/L7UVTTx8X45gUU=
X-Received: by 10.200.27.172 with SMTP id z41mr46770986qtj.104.1514569866735; 
	Fri, 29 Dec 2017 09:51:06 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	t41sm24223893qtt.84.2017.12.29.09.51.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Dec 2017 09:51:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri, 29 Dec 2017 14:49:18 -0300
Message-Id: <20171229174933.1781-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171229174933.1781-1-f4bug@amsat.org>
References: <20171229174933.1781-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH v3 27/42] hw/arm/exynos4210: implement SDHCI
 Spec v2
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
X-TUID: 8P2plbcoom6Q

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/exynos4210.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index e8e1d81e62..0e6acac784 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -75,7 +75,6 @@
 #define EXYNOS4210_INT_COMBINER_BASE_ADDR   0x10448000
 
 /* SD/MMC host controllers */
-#define EXYNOS4210_SDHCI_CAPABILITIES       0x05E80080
 #define EXYNOS4210_SDHCI_BASE_ADDR          0x12510000
 #define EXYNOS4210_SDHCI_ADDR(n)            (EXYNOS4210_SDHCI_BASE_ADDR + \
                                                 0x00010000 * (n))
@@ -377,8 +376,18 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
         BlockBackend *blk;
         DriveInfo *di;
 
+        /* Compatible with:
+         * - SD Host Controller Specification Version 2.0
+         * - SDIO Specification Version 2.0
+         * - MMC Specification Version 4.3
+         *
+         * - SDMA
+         * - ADMA
+         */
         dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
-        qdev_prop_set_uint32(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
+        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
+        qdev_prop_set_bit(dev, "suspend", true);
+        qdev_prop_set_bit(dev, "1v8", true);
         qdev_init_nofail(dev);
 
         busdev = SYS_BUS_DEVICE(dev);
-- 
2.15.1

