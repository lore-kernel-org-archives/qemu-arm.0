Received: by 10.28.71.27 with SMTP id u27csp2300464wma;
        Thu, 8 Feb 2018 09:01:30 -0800 (PST)
X-Google-Smtp-Source: AH8x225zpHvNdhnl+2vkLPoSyRRsHUW5g0XgcoSyaaX0Z7YxwtGN4aFhqTDHq38EXYsdHVl4bX5P
X-Received: by 10.37.76.198 with SMTP id z189mr1005587yba.415.1518109290884;
        Thu, 08 Feb 2018 09:01:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518109290; cv=none;
        d=google.com; s=arc-20160816;
        b=t30DFmnaBVfSee7LyJbnEwozG1jLfcVsrVPBMEXqcrczWSgp2dImnjEgvU8kig8f++
         aQC6thEJFiv+XGIanUwpX6TyaRFTwEqWIHVDHdbJTLnwJFt54RaDc5Bsy5UnUWUUDrHU
         YNoGq2YRfeWOYlzdDFaeTGv37klujzXey8nz6kEqVAEiIZ4G/TWESLwfwWRRj1hwF1q0
         wD28WEMap29ClQifIjW7n6B2I51a/fZC9haMU1hfZztQI0KueYVnpMM3/5D0aopHksl3
         ecq7MHBLWV5EQC1TdzkxXSXfrhJiMj0lg4UvGHNQrq1PUT/pugqkmvy6wc20Lu7oI5Bz
         YuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=sZp8aF6avIv4FuO7MfmdU5DFjxinRjlcQGqTNkIJbBA=;
        b=qTUtXQLvIuacEj6F8pbC5qq/JFeaKifDiRvm8B7c+REX+pgUfbesoWp/Ea/8W3vw4U
         Vh1+L8BhKfeaPZuZxgb+PlfCTSCLMRxp+hhTWde/YmJrAQHyE4qZwsx49bqomcLYsamE
         tUSRRSKCOCzV6KMFikFWgqoBm87a9ao6+CbeSxUc+HOtmymF17IwZ5bPSsT2LvBq0X/g
         DWHb2kR2VKClCg4SQY7R3E1CXXAF95u+X5HAfRSljg+c5TslLnMhcIq7DEJtMpPFy28e
         hBdMbNTRZi+XXg3a/OydxXVwbOcn2tWvPCVB2j+pfjlozbfoLfnlydnvXjHCd5NwuXKe
         UUJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ORr9D5kG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b144si65642yba.435.2018.02.08.09.01.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 09:01:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ORr9D5kG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejpZg-0001eS-8a
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 12:01:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpNv-0008CR-39
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 11:49:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpNu-0004B0-BZ
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 11:49:19 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:43027)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpNs-00047K-6z; Thu, 08 Feb 2018 11:49:16 -0500
Received: by mail-qt0-x243.google.com with SMTP id m11so6969645qtn.10;
	Thu, 08 Feb 2018 08:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sZp8aF6avIv4FuO7MfmdU5DFjxinRjlcQGqTNkIJbBA=;
	b=ORr9D5kG/SBoZZSLsSJ/HkWsIsYd5vB/4kAYySygAL9xTHXIv2mk5csTNEyV7JuxNP
	dsa7xj6F/6GKViys/VUjmu2ZVvrmT3b42V5vOVafYW1/V6xwz7wuQiMt/kkSV1/w0YJY
	QL1bMWGxoG64iokkzAY6bg37Ak/cw53kkWkwFlxWJbJf2orlXKTrUvcndEHmYOUj1vt6
	GyNWSJoO5GfFhdrtc5iWDlXSjo4a42PrgB9i4LQH0xib1+SfP4U9uLrBLKS68jW3cHcr
	YIq+p1KU5F8w4OddJYCSZ9zBdYr1hAKeCUxyhbSRUa+NF8ainEq4iABKq1WduHvtIKLH
	n6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=sZp8aF6avIv4FuO7MfmdU5DFjxinRjlcQGqTNkIJbBA=;
	b=RzyUuOpYkIlnfWHiECfQYf1S27023HZs4AusQUuvL2e8PJFINsc7E4QgZHxu2o74Dv
	CrNGbu+2LKOtqvZ9XaBxR+Mntp/+hTqwiqY2XI2xa2R7cgVzpjdnb0h4lAEDu4qHAS2q
	c3iSIZglEiwiuBXFyLOnH6HVAGXp8Ay1K0aGz2wg6ZAMQyQ9+HkVb7iDgz9OKRJcXey2
	kl/SPvxfPFUhpKnDTrgwpcSIdm2stN3sfV6OZWSwD8QRps92nnF67ksS4NkQHunQvSm0
	QZRidgjwEfxH3Do23Ek8nSt0gZk1W/dZifEc0gT6EscQsZHIjh+ozyVU8iSZN+k1SHau
	TU0w==
X-Gm-Message-State: APf1xPB2adHhtDz5hFZJszghTUAZ6+8rruS6ofPqwWNbkre5KSU8c/c+
	v5jLqZ/rAW6NGVhdrp/F814=
X-Received: by 10.237.59.240 with SMTP id s45mr1993320qte.83.1518108555728;
	Thu, 08 Feb 2018 08:49:15 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id z66sm240905qkc.9.2018.02.08.08.49.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 08:49:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  8 Feb 2018 13:48:03 -0300
Message-Id: <20180208164818.7961-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180208164818.7961-1-f4bug@amsat.org>
References: <20180208164818.7961-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [PATCH v11 15/30] hw/arm/exynos4210: add a comment about
 a very similar SDHCI (Spec. v2)
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-devel@nongnu.org,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RFUw4WZfk8TX

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/exynos4210.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index d89322c7ea..06f9d1ffa4 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -377,6 +377,18 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
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
         qdev_prop_set_uint64(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
         qdev_init_nofail(dev);
-- 
2.16.1

