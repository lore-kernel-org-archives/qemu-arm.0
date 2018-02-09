Received: by 10.28.71.27 with SMTP id u27csp1035865wma;
        Fri, 9 Feb 2018 07:10:17 -0800 (PST)
X-Google-Smtp-Source: AH8x226hVokiv+ioErztePNW8gzGIXfJEe0ZKRCXp4dkwFGIsxpI8kZlwp1SvbrKmfbHa81+haL8
X-Received: by 10.37.104.13 with SMTP id d13mr1921516ybc.290.1518189017806;
        Fri, 09 Feb 2018 07:10:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518189017; cv=none;
        d=google.com; s=arc-20160816;
        b=B9GtoUtOs2hBbMYfFQLM1rq2kcZrzfnzBrvuVWIJZRf8vkfBQu1c4YgG7aDR+dPRRL
         sx3RqZtiMRUW/h5WYheUxmU5EXUmcOipKaxf9zhdhULQL9R/kymOcks6VGi0XVT7rbpX
         GpGKNStq4ySNERsVgcdP2QO4gCJvvYe7lMhrBmdIFVtCuXlPkLFqBYmVGXfgFqDxbRP/
         VOqq2HvXCiSqwT9Mm1QHH7JwEFC2zT9JhnopnvhgHjA1IuHO7SnBho5CTIQuk81waOdc
         dV0qW72mLNP59nPngqiGbuEIh/EQTKeZgMOyMc5ZdOIUqIVdz1ykMoBkCa8HHOWRa4jt
         wZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=sZp8aF6avIv4FuO7MfmdU5DFjxinRjlcQGqTNkIJbBA=;
        b=JL8rtZtvedkNne0g5mDZXiZRxsB8Y9+BAAniTDks+td1y9TkIm432LM902Ip/GYPrm
         SkCN5NWzkLisBGos6mO2MV/7CQK3SotORrgh83zXy8B4g6MhmT71lTycoa2Bfm1aiQ2D
         C3R6DePfybWiCnHoMM0ZlBaPga7U0PcFyhI27KikQe8ZHYINXneUgzz4fP6iQE4jtqcS
         LnD2Y1m1PiW2q/LFoHH3TedkAdY/IHMgzXQGrv/RvnvBNNhFqtz7IOH2y0pO8uu8syhr
         v/osi3KlBNHWEkcQOkKBBX5MeteGQ0p08/m4hMO3fsX6qL2/0zzMupGSG9Q1TiPmR6cz
         MMsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JmytaxZ+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b15si434915ywb.476.2018.02.09.07.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 07:10:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JmytaxZ+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekAJd-0005vP-4B
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 10:10:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5C-0002Bl-6i
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 09:55:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5B-0005V6-1f
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 09:55:22 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35348)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5A-0005Ul-SU; Fri, 09 Feb 2018 09:55:20 -0500
Received: by mail-qt0-x244.google.com with SMTP id g14so10840748qti.2;
	Fri, 09 Feb 2018 06:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sZp8aF6avIv4FuO7MfmdU5DFjxinRjlcQGqTNkIJbBA=;
	b=JmytaxZ+0c/EVJcOVm76U65GDwNhkbFUZNx7oKgU6dUsZO/hRblay9n40yOY2l6Vsl
	hdwZMUOYI94aLHoo2hTsnmDiJNzlz4lnuk4iLMtmtAnf/SvPlcihGMdnpohoq7b1oiWV
	7ubrnl9gHi5cgqP3HjIR4kNiFJ3ozNUJEF6O4FhZGqzvi7nXFENO2/8G5j29VIWlRe3L
	o8VGt+UcPb2Th4veDszbRrCQ0FZ9AOITfNCoDvBWZKoGO/1WWnhAgcZa2+N/5q+oWH1l
	VLdtKbJgtU6yjwYfPzPgj1SFZyjsqcW93YBqYc+bvnRvAVjWOFeQePCINblCnGHYux7f
	zKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=sZp8aF6avIv4FuO7MfmdU5DFjxinRjlcQGqTNkIJbBA=;
	b=umImZsOROATDwQgay7CdS1NOEh7O2Gsd1uYLjPXwpQFGpX4XW6JwtEbJt25iJDGtsc
	65qGFk2PSNOgfvAoC3AcHJ3KF+KDQyYpLweuoJoI8FKUqi/22FzWeEj16AJL+GKe5Vkt
	Haz6FES+ZG5PIBgbJAGyH6yDHJE3etzOwErp9VnItyAkQ0ubmwl4vXsVrY4PdqyWvCAd
	yjssJM92vwfoY6iRSiCJlXhuqgHX8ztPBpO08lWI4DBP5xid8JC3TYG1h+gJnawAbrdr
	lMjBA6HOGLJUkOb0DQydnVPb1UuXdcpw6QRT5wq3dc7KFTLVgelM+RbmkLf/AeCRQBAE
	sTrg==
X-Gm-Message-State: APf1xPD7ZS4+0uZHRHJ5FUyt5cye4NytF273Bj5BTw1zmxc1Ij62I1Eq
	adnuXjd91TyfLBW/EujKTaa8/50Z
X-Received: by 10.200.55.182 with SMTP id d51mr4787218qtc.61.1518188120364;
	Fri, 09 Feb 2018 06:55:20 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id b29sm747841qkb.28.2018.02.09.06.55.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 06:55:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri,  9 Feb 2018 11:54:15 -0300
Message-Id: <20180209145430.26007-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209145430.26007-1-f4bug@amsat.org>
References: <20180209145430.26007-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH v12 15/30] hw/arm/exynos4210: add a comment
 about a very similar SDHCI (Spec. v2)
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
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tXSjrX0vOpZh

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

