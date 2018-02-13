Received: by 10.28.71.27 with SMTP id u27csp681768wma;
        Mon, 12 Feb 2018 20:23:33 -0800 (PST)
X-Google-Smtp-Source: AH8x225nuETz4EFlhXbwq/Tgp4Vg/i8oRIl+WbQXXH1LxoLDfVbc0dfw19CG6/qBjaVo0I9ExTmn
X-Received: by 10.37.194.133 with SMTP id s127mr9340841ybf.338.1518495813819;
        Mon, 12 Feb 2018 20:23:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518495813; cv=none;
        d=google.com; s=arc-20160816;
        b=pw8nDitLtTFNEpnF6nrASUHuFyr+OWtzMHugTRqMTBjw0hCoywBF20c0otO/4IlHWh
         oSt90QYYZJzSOkGI91vq2jUtHDmNMiaJW/WFFdxg1CFQjieVuXthtxBZhFZgAYbaW26u
         WRd+lKn3GisdqLZa1pFMt5TEgYfFc6HlR9OTWQuv2EQZnPSNvmz/Uan8oYwCdA3fe2kV
         odjNIyPF/0P4RrknvBzADf2XvIz48qddWX8xDdE07+pErSoC3sT2ZCX17YCu0TBInJgf
         WyJIMYXX68Ioekoej2vfimNtLY0U7Xn26cRfcIR/02L3gbRWqqdeFsmQKoP5cdP3PMn+
         NSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=wY//D2TOSIUxA/+3Tz/qnHcjRg6V0zzmBzdlX6DyMlw=;
        b=gQIRoIMdR7xWVpSLaCmHVZkMXO5bcbHg3c1KfbwyCrfNvupibIBE49iQ3qrlXH0uR4
         /O/UbRjpcJHyphSQumVux934vfuhvcABe7QN10U68fN2rFk8QYZr0VgHbiXwujx++Yvs
         AkmCdcuwrapIEQIQI1kOPjmDiA8GtT/o8P4V6Own7kH/xGVSxEyPQwoA8rSt4BXk8eEs
         GhLkAETVPP9orLI99w8MlicqLAN+WKHuNrMSIVTh+dWBtWnNPUuMf3wjMxz79A9Xj4eU
         Cm5chcaZDj+e29fLk0mOiTd3qNBzTZuqr8KRcD8km6FgNSBsNFV991niOfM7HlSWXZGI
         oVKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZOe25NcC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p77si1769537ybg.312.2018.02.12.20.23.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 20:23:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZOe25NcC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elS7x-0004cA-7F
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 23:23:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRtx-00016g-2u
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 23:09:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRtw-0007mA-3i
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 23:09:05 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:40913)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRtv-0007ls-Vn; Mon, 12 Feb 2018 23:09:04 -0500
Received: by mail-qk0-x243.google.com with SMTP id e20so21079297qkm.7;
	Mon, 12 Feb 2018 20:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wY//D2TOSIUxA/+3Tz/qnHcjRg6V0zzmBzdlX6DyMlw=;
	b=ZOe25NcCeivb1F+yjl8p1uJMLSoBSoQhqvPkcYwu1mib/reipwiVy02jHUVn1CivWV
	FuTxdivkmNlKcsfzy+4+5nD+4onMRTH0E86Vp9e3/lAVUIH4TmlPkD3gtLX2lNLsRwBd
	Daz81peQyDe9xcG0UgNVM23ZAAj6lg0zEiSaDRloatzfP+L9a7qGJOW7ofDeutENM0Nv
	B6DJBOimYILnypgrVdeykSCOSVC/LA92EYakJx3r5vxM0evsHY5RuzdlvyRtUsJrTIWX
	21SxXpFydNRmkp/rYlBVMwOUXJJQBSppTUg2aLtnJEOXuiIT6r87GUNYp5I5i9t3MgIe
	xy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wY//D2TOSIUxA/+3Tz/qnHcjRg6V0zzmBzdlX6DyMlw=;
	b=nbYiHgNI8zPBNUQJhcJm9bRGbNgdapfZAgJFxDZucugzxpJUkbVkEdOQRGL+BWECqf
	6M1Mv8LbokUeK74B8NJdYK1Bh1ursyVJnmt50ZQ0Cvb+pqzRuK2gYpEroe+CU/rusnbR
	MxmTqjfIRrbGB10D2U8b1B4a3BPIllqhJJD0idPcaWL3hUr1tmHb2/tOCqUy/j+6Z7Vi
	fhB+q1AKwE+jvdij8X8LbB+1KfHTXUL1AH79LvB54JLQicAuxce4tBNZUeFxZhGAU73H
	42C5s5TsocA3owUkH8wlWwEHvCBaAeRyLG/uXeULUb+c+8Ke/bXXChhv0Y8CJj4YqxZO
	Nu4Q==
X-Gm-Message-State: APf1xPAgNQOu1X1VB4L/hvOwvUuXJ+vVE6bpI2RJmLUywqG7bbEB9zDh
	K7GH+IXJVj9n797FSCs2Ayw=
X-Received: by 10.55.66.77 with SMTP id p74mr20095026qka.205.1518494943649;
	Mon, 12 Feb 2018 20:09:03 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id q2sm7350435qki.10.2018.02.12.20.09.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Feb 2018 20:09:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Feb 2018 01:07:53 -0300
Message-Id: <20180213040809.26021-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180213040809.26021-1-f4bug@amsat.org>
References: <20180213040809.26021-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH v13 14/30] hw/arm/exynos4210: access the 64-bit
 capareg with qdev_prop_set_uint64()
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
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ueGC39N2fUZC

We only set a 32-bit value, but this is a good practice in case this
code is used as reference.

(missed in 5efc9016e52)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/exynos4210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index e8e1d81e62..d89322c7ea 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -378,7 +378,7 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
         DriveInfo *di;
 
         dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
-        qdev_prop_set_uint32(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
+        qdev_prop_set_uint64(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
         qdev_init_nofail(dev);
 
         busdev = SYS_BUS_DEVICE(dev);
-- 
2.16.1

