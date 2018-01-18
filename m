Received: by 10.28.173.206 with SMTP id w197csp6473998wme;
        Thu, 18 Jan 2018 04:43:03 -0800 (PST)
X-Google-Smtp-Source: ACJfBovbyd/bWdOw4YGHVLQUF5yhB6LQll8t6hh6W+vPWQYba+UxIb51/bF1lYIbPUEARbZAScrk
X-Received: by 10.129.4.202 with SMTP id 193mr5990045ywe.201.1516279383055;
        Thu, 18 Jan 2018 04:43:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516279383; cv=none;
        d=google.com; s=arc-20160816;
        b=bvAMeFd1vSdFUVpRlNn9pJtJRijKZkMigTWIF7OIHPeUcZ1CxOyJwtUMmwZqhxLj6R
         xf6URHsG2qL/+8TEtNfHfFcvOiTcYR3iXkbA56UGi9qZbRiB+xjWTO4AZV7b7jWK+hpy
         N4+/elvgPsjvvT9Q4Z8A4527UWtDsJHjTPblclqLA581vRq/8WJcJjcJ6G5hxRGJm7yh
         73CpTmllPlimcM21EMRK3oE/UdWKm5iDq/8jXX2j1s0eztgzM1hJ4BtT67P2TtZXs40e
         NPd9fEmN0F0I7O+YMg7JF1/lPMQNVK1mnOOw6epyWWHaRGhlPiYIuDhXlrHw9Fj5KEp8
         Qrtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=w4cF8nBWMgtYO8vYeoe5XnN1zsLEoTSdpZMqL5PVRxQ=;
        b=N/W/uYzvOus3zFGuXj8y4fFrUbJycaexnHF4ymrhzT7KLPXKC+qWcuEkpZaXZxaH9G
         dGl1m3soMm6bIMMqfm0NvDX/Q9w433ZTt+Aga8Dp1PYFKoFJn04t3UAc/jRRy66uZu6i
         kAjiJyq7RpYo6f2zMrUQOMywkXRmlzb2E3t+EXCyqNTsI4IbI0f1hNp+DCEX3XH8rUux
         UcyjmIPvpTh5hVREPejeDfJyMb4ipPXoOVzhKCrwhYOvXbh+x03+LcM/1iiXoJB8jZ5p
         Ex6AcR4syWvO/2hI/y2XuEsRcvn/T5BaThj7w/RpkfY3+JVpRaY1ZoRmvlY4N1sX2bM+
         T+jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qR/YVFRa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i133si1714108ywb.386.2018.01.18.04.43.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2018 04:43:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qR/YVFRa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56389 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ec9X4-0008Pj-Gi
	for alex.bennee@linaro.org; Thu, 18 Jan 2018 07:43:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ec9Nn-0000Vb-6r
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 07:33:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ec9Nh-0007Np-Ri
	for qemu-devel@nongnu.org; Thu, 18 Jan 2018 07:33:26 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33276)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ec9Nh-0007Ng-NS; Thu, 18 Jan 2018 07:33:21 -0500
Received: by mail-qt0-x242.google.com with SMTP id e2so29724973qti.0;
	Thu, 18 Jan 2018 04:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=w4cF8nBWMgtYO8vYeoe5XnN1zsLEoTSdpZMqL5PVRxQ=;
	b=qR/YVFRag7e9anWAHPapVTOWm1WuvSUheUEtQ2+na9FfMZLa51LnY6PRUx0fAnaVKd
	GNlaUaP8FISo45Q0PsRCVnPA52qgAJfthB9wDi4/vwLTuDUygk7nT+El3/iHJ95MLTAM
	MDJ20yq/gMIWrrxMjai9KN4LW/myriuDBPzvGra8HdJ4uXEyqVoU3x33VLzY4diPYukK
	5+Q28XXa39VVzIyuQmCffYCuPm3CIt6V9TApeDdaNDe3sq1jLTekXsfmn00yiBdj5Y+e
	n4sICJga7+CUG3kokI72JOhd/dBYpx8/hzzigMLFbeBr36aQffjdyUh4n/44ACI+sqnJ
	/7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=w4cF8nBWMgtYO8vYeoe5XnN1zsLEoTSdpZMqL5PVRxQ=;
	b=mDsusnPy7doK8S0UHBpbBB5Cg18E49iy+iV8YzydIuO+ImdI4pWNWcirEd1vRxGuzH
	Qk2swdTB+vW9Qz2/pGu8nk5s3xPLatwIs6s3+WZ9q6bUx+hsWyJuTx3tdi2rehYRjBuG
	cyKlwZKD50x5Ml8SbUs56CASbLM5arOKDdrdYvH+jeACjutunzFgMBH+SodbwQHnFnSp
	iOKbyyW4O2KWUfWhKra1k5yDlWra9zM7dwMgka94BKE6rTEPnHuRvnYPOCG9L2bpQ9gw
	ppN05/UH4MpU3cqzYJJSbJN7WOqEsp2WfvlVQfmiHkEMbtb7vIYXYOhz7ylYMZP/DjUI
	e6gA==
X-Gm-Message-State: AKwxytfWZLHbDNOEwuT0KLwdNs1tQOMWXXpXXFUlt2u1VckHHV1Geqmi
	JAcDA5KxhMTLI/nVfC3mWX4=
X-Received: by 10.200.46.214 with SMTP id i22mr37688916qta.157.1516278801265; 
	Thu, 18 Jan 2018 04:33:21 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id s12sm4489623qke.4.2018.01.18.04.33.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 04:33:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Date: Thu, 18 Jan 2018 09:32:17 -0300
Message-Id: <20180118123219.19410-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180118123219.19410-1-f4bug@amsat.org>
References: <20180118123219.19410-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v7 15/16] hw/arm/exynos4210: implement SDHCI
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
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Kevin O'Connor <kevin@koconnor.net>,
	"open list:Exynos" <qemu-arm@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mmF6VeD94zpT

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
---
Krzysztof kindly checked those values with Manaul, the Samsung datasheet :)

 hw/arm/exynos4210.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index e8e1d81e62..e70e234f58 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -75,7 +75,6 @@
 #define EXYNOS4210_INT_COMBINER_BASE_ADDR   0x10448000
 
 /* SD/MMC host controllers */
-#define EXYNOS4210_SDHCI_CAPABILITIES       0x05E80080
 #define EXYNOS4210_SDHCI_BASE_ADDR          0x12510000
 #define EXYNOS4210_SDHCI_ADDR(n)            (EXYNOS4210_SDHCI_BASE_ADDR + \
                                                 0x00010000 * (n))
@@ -377,8 +376,26 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
         BlockBackend *blk;
         DriveInfo *di;
 
+        /* Compatible with:
+         * - SD Host Controller Specification Version 2.0
+         * - SDIO Specification Version 2.0
+         * - MMC Specification Version 4.3
+         * - SDMA
+         * - ADMA2
+         *
+         * As this part of the Exynos4210 is not publically available,
+         * we used the "HS-MMC Controller S3C2416X RISC Microprocessor"
+         * public datasheet which is very similar (implementing
+         * MMC Specification Version 4.0 being the only difference noted)
+         */
         dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
-        qdev_prop_set_uint32(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
+        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
+        qdev_prop_set_uint8(dev, "timeout-freq", 0);
+        qdev_prop_set_uint8(dev, "max-frequency", 0);
+        qdev_prop_set_bit(dev, "suspend", true);
+        qdev_prop_set_bit(dev, "sdma", true);
+        qdev_prop_set_bit(dev, "adma1", false);
+        qdev_prop_set_bit(dev, "adma2", true);
         qdev_init_nofail(dev);
 
         busdev = SYS_BUS_DEVICE(dev);
-- 
2.15.1

