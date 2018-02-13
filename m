Received: by 10.28.71.27 with SMTP id u27csp676422wma;
        Mon, 12 Feb 2018 20:18:48 -0800 (PST)
X-Google-Smtp-Source: AH8x225IZli1u/jn9lI7GYvf7JTogB7P9aZWcFiYhMTEg3bu3N3izY8L9EBYEyLGSDYnSRAIT9b5
X-Received: by 10.129.108.11 with SMTP id h11mr2730344ywc.262.1518495528423;
        Mon, 12 Feb 2018 20:18:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518495528; cv=none;
        d=google.com; s=arc-20160816;
        b=AnC6A8hEMUNjaQZ+ABvBLzRfCM3iHDM4QdAsxBQJvH68PVOuSXPwk8WAj+N/aHjZy4
         O+JFlmluQ1LymxBk8NrdqkmYsSaHWTipdP4yKoGZfrujb8mXo/gh+ss77Re/IjO7vPDr
         wujNM6sAMlpNaCxrGZ71w9+97QiCalasT8MFbN/buGOj688igq5AOJHFGDrPKWjiLRSD
         UF9IRq/yXqWzoVH44cJ/hwGcCwXw2ImpqfMVMf4SH7yF/T5FtMpVKZDQFhOPOe5xBK7v
         ttzDrWP8cVW9NA25kT16Rp5O4bMi7EH7xHrCMwjwPI5g9z2eGJukssqHkOwGN2sYWBK4
         zxZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=sZp8aF6avIv4FuO7MfmdU5DFjxinRjlcQGqTNkIJbBA=;
        b=tJye0NGxnZ10mut05QZ8S84juWKvmzfmXF7pXwW01Q9pqTnbcmx5TO+qOpmJzzwNbF
         aCCRGyzVjhKWcf/6Ew08I2s8xOXp8OnEwoSj0xXOxVSit2kX/q6wD1IexdDFo3YFpJV2
         ECkD/u7gUCUg71yVcESLiEisW20g7PJGG52cF8tJOdHb40YGvfyZprsfTnNDVRP+AL/F
         6kNP1+QKR2V2inRRbpXdHHHnlgqzMT5ot8E6kBi2stE/+CCbrdqSBPziccdmFcZ43/MB
         ivKfcQ7mnw5L+ygdWFB8qkijhOWZBRnPEjtPwFz6iFvMwVfd4cZUY1HtQShBwHvlXckd
         WhQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oTvUQJLk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i9si679702ywe.304.2018.02.12.20.18.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 20:18:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oTvUQJLk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elS3L-0000dw-Po
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 23:18:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRu0-00018U-Gr
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 23:09:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRtz-0007nW-KT
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 23:09:08 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:37162)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRtz-0007nM-F6; Mon, 12 Feb 2018 23:09:07 -0500
Received: by mail-qt0-x242.google.com with SMTP id d26so653696qtj.4;
	Mon, 12 Feb 2018 20:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sZp8aF6avIv4FuO7MfmdU5DFjxinRjlcQGqTNkIJbBA=;
	b=oTvUQJLkTV81W0dCZP8gI0EFQkP/IO/lQD2MixIW2+RX9MYd9Cq7oUNxnFDPQCl35z
	in68Fs9yvSc57SSPG9Qz1rUOzj1MCBpk1l2tCJulmcLMoojVT3g8T9tGG7JFJ4YrUHIp
	Fxiv/G+XpHWZyvncdQ4B1bMnywh94hhct9Fpi1GXCn97xrGrdkIFFUDqC1r0kM9TzBM3
	aOJEnj0K1udqBV+im2PHRpC4q3Ao4uOSnIrVJ/9hZg+fj8GySL8cvk1JYTaJYbYakH9K
	gWlL/P4vx82tVYoVeKhi68Y6O9dKgF+N9QgNgtwKJcGaL+ZHnuSlWGPTu/aVus5bvCiO
	0dWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=sZp8aF6avIv4FuO7MfmdU5DFjxinRjlcQGqTNkIJbBA=;
	b=LRZCjyk4RG7dCGMsInlHQz6rjhcRdIEgB4QPezaRdgG60NvC49MBv8XmvUnJtDBMnP
	aUfg91cNYcrML25h5PhwBL3j8h8TEbUQR4AS6UWM2WXVqp03t/g1Nvkb/3Uyc+NvVrFn
	wHV55hleqtNoKwjIbsOYIFshGlIK6p1Yw2tW6sIzIGHtOGwWloO3PBxpcFLBADfw4f78
	bgZc9/kyTHzZQ3Sgh1DLWBE+1N48X+V8FVvDIBHeFSqcZbdNT6Z1N52N9qm4AbXg1n3H
	VnaIaSP3VTmvc/fask5BG5JIK8XfMrGBrLAXMBxXB5UPLMblN7kkstbxrn87Vxv59Lsd
	n91A==
X-Gm-Message-State: APf1xPDApoTRZYr6V2eCpVJy2JOSCRmRsxYN0iSbvLaX+9gqV8pkG63c
	4VkkD5CgOeVFPfTHCQMPGhOdzi+z
X-Received: by 10.237.52.228 with SMTP id x91mr21861968qtd.112.1518494947090; 
	Mon, 12 Feb 2018 20:09:07 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id q2sm7350435qki.10.2018.02.12.20.09.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Feb 2018 20:09:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Feb 2018 01:07:54 -0300
Message-Id: <20180213040809.26021-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180213040809.26021-1-f4bug@amsat.org>
References: <20180213040809.26021-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v13 15/30] hw/arm/exynos4210: add a comment
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
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uoo/ZzkyGkW0

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

