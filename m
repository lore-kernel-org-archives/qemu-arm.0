Received: by 10.28.173.206 with SMTP id w197csp1016451wme;
        Thu, 11 Jan 2018 13:06:52 -0800 (PST)
X-Google-Smtp-Source: ACJfBos0+aOwwRQvSvuazwePkirYge4olHi008lND/vFUvp3V5rfRJxCTBOldpUfBOTXijyzhNPq
X-Received: by 10.37.197.74 with SMTP id v71mr14478757ybe.258.1515704812532;
        Thu, 11 Jan 2018 13:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515704812; cv=none;
        d=google.com; s=arc-20160816;
        b=ddEYkLc8A6Y7hNfP2G1aeSuIAleqygmfl7IVgwC5fgmQZTh2fL/+m3kwVOdWJ0U/A1
         lTDP66v3LKDX9QZIwZ/BcnBgrpGkDxH40uT8cyi34LSVbiRZ9XiN3dwbcgvhhiyfUsSm
         O+IuTOHAwLozCyfUDUcgoVy/S2FzeR5WSpGfTz9LUgJH20fiwZ3iU7+R6qOqWhnE7Zr7
         ulpBHyBY4buzt3xjUzN59SUVr/2qwIJO/y5+gdgtHqCVmI2mPj7s31BuezEBIaess7fY
         9SutKwC+ExWCYoOCEg3MySmgl0TCxSbJdoipBxi4OZFuVDPIq8I8wfppD7BaJk1nAA87
         Xb7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=KLSH73+PhrTDeU5qHRVEPzwUQ7axdsLgk+Caal09PE0=;
        b=fisYgXH77E2BPMrWHKGrPVYvKJ2gCh+GGSPhqPHLy84ok24/JF+GXdRinS6vQXx3m0
         eLcfURIY6zFNT/Az7vNtmQh+7r/5VznvDnuY/GUBpXGMAAk3whg9u9r8QtKK4XQ1dhg6
         u7TA6hqCD4LOJ4qoj+kAKs9d2a9CDzCvxLTwWH3MeLKF6z4ccKpMzDxBB9lPuBq3hpOy
         EFn3UU+3RxaBl5JoD+tfgsOMx3mXrO0/5siCC/B4sObB+EVqyGh5gLBHEaZPL7VSV7ea
         /T+aWB66jgK5IEqdNDIT5h454AqMpjQYjRqaOeqVzHRHd2e1o+tdBvvLcxRJ/UV5ab1w
         oo3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HUQchs/I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l19si1113613ywe.370.2018.01.11.13.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 13:06:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HUQchs/I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZk3n-0005d0-Od
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 16:06:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjur-0005xe-8v
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:57:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjuq-0002l2-FP
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 15:57:37 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:41194)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eZjuq-0002kb-Ba; Thu, 11 Jan 2018 15:57:36 -0500
Received: by mail-qk0-x243.google.com with SMTP id a8so6084899qkb.8;
	Thu, 11 Jan 2018 12:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=KLSH73+PhrTDeU5qHRVEPzwUQ7axdsLgk+Caal09PE0=;
	b=HUQchs/Iae8W4XgEy8FhDr7NifHczatexTXSoeBKLOCa9rq4VL+msGpkNETA7QvweD
	ZNrrfvjxPCSkX99NnTZeAQ8D5KGG45a+9H0mePNlLuNTbRcdNmXg78qDdkyw4OSB+dRD
	qYaWgktPcsYgAqIhv0mrbP9J3A8b29b1Y8GGnlrYp6AvKLDnDwv9BgGZXmpWf02q6TPy
	UebSlbqVSDls4F7cXY999y6ZwTvY89LTyvlhKw0nsshv8QPB327D10rVHaMTGhQx2EJs
	KxAl2RgawKUW2/ppYTTcT24MPS5z+SomboyZ+zo+oiY4acnWceTKeGqzGYZotLRrkHu2
	LgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=KLSH73+PhrTDeU5qHRVEPzwUQ7axdsLgk+Caal09PE0=;
	b=PNUysqjGzbSp5TKCIgfD4eaHcRnGqfCNvf4MiegdxttUdzbEDX7VQV8qGW7GvFy87Q
	NdvEHWV75V96ntQTwsM4aF7Oe9y3ep+mDHUIr/DUBGUvvSjFb52ZcSCtSwaONMjwElcV
	sDi5Zzhy17VbSaNdEabjJKj3sJ1JRXq0r2w6D6X3oFK8cdrdCKbP7sCJ2odyu0CvBx23
	FPVVSBnOvUJ0l/kIZ9+6L2VrCSZzQwEsn+632n/DwnC7PI1Lrb4a+2EIfNp9l72j3oGs
	tpnAHKxDTUbfMmfrkhgMSC+R3PWeteEb7+9oORUklX0/Wx4/aFNvZVbADz6gOK/vaGCD
	sQTg==
X-Gm-Message-State: AKwxytcrkj3Okaw6RRnw2eE/f0cB1ED/MIcjEC+mVbLMJI268UEQIXVG
	opT9cFGxCQolJssjOve41y0=
X-Received: by 10.55.105.194 with SMTP id e185mr34134807qkc.192.1515704255834; 
	Thu, 11 Jan 2018 12:57:35 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	c1sm12818399qta.52.2018.01.11.12.57.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 12:57:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Thu, 11 Jan 2018 17:56:15 -0300
Message-Id: <20180111205626.23291-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180111205626.23291-1-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH v6 10/21] hw/arm/exynos4210: implement SDHCI
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
X-TUID: abLE9putAfQF

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

