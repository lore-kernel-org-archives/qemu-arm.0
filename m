Received: by 10.28.71.27 with SMTP id u27csp2296310wma;
        Thu, 8 Feb 2018 08:58:11 -0800 (PST)
X-Google-Smtp-Source: AH8x224bVOqGrUyq0wvEIoYu/t4JAcCOzxBsl95t97er1z9R2ZA2pU/cwALb4e2KI+9emlq0alH6
X-Received: by 10.129.229.10 with SMTP id s10mr1035726ywl.205.1518109091498;
        Thu, 08 Feb 2018 08:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518109091; cv=none;
        d=google.com; s=arc-20160816;
        b=TcVC9zkcVe3BfuDor8up2VlqaBDCwT73T3bmEVjspAebahUoyLMcIiu4VptheMydNA
         PG8TY3Ya37R3J1ZFumes7OdQnN4SPNHvm3QCup1EKf+BlGpfr8CDmT1xnhOPw+VTE3LV
         5RxUHwjj1jPvj2TlFKece1uLlObF/Nl1JSJuqDlIGILgRYUfOq6NbN2HhHDXa++BpuoM
         i8hlEgVmYwdUm2szISEgSj3Ea/f2GNxideT8lubEkt1l41e4FfY6pas8Rxi/KpSa2Doy
         Tj+MEBM2S/yFMe9go+smr7uWOJh4o9PR+0kGbw0opjDST1ud41GjoeRGS2ma6wM8NP2E
         zeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=wY//D2TOSIUxA/+3Tz/qnHcjRg6V0zzmBzdlX6DyMlw=;
        b=a4KAipRKm9anj87pbW4w7aYO5sKAFbPKSqYkdlE0XRRpuQCVEpJwOXQJ3HA0R16c5e
         4iZbCbA82cYMGlTmROYoUiDbKNkGVxMHJCFC7iIxBY0ExszlX11M09JNb7FxzNFKn4mc
         Of9adhQ9zqK3Rbgod21IakKhCRz03r+qIVOsZN8FG5Rt5/tfXXPI3JextrDC3hlqZZOp
         2RllRZ/tuCsEWTlmclRRjFaQtLyFCyiyG4LRPKL6nB9aYpyfgB10vYckFfaOgDiiI+Us
         H4yK9LD2RK6sROa/5JZwgzQ8SX6r9H4IzXwqgCyz3YYjbA7Vr/B8QTSsdx9Iz6ap+mgV
         x6Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DZyCXNSm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z124si63675ywe.319.2018.02.08.08.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 08:58:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DZyCXNSm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejpWU-0007L4-SE
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 11:58:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpNs-00088V-01
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 11:49:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpNr-00045E-7J
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 11:49:16 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:45170)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpNp-00040F-5p; Thu, 08 Feb 2018 11:49:13 -0500
Received: by mail-qt0-x241.google.com with SMTP id x27so6966957qtm.12;
	Thu, 08 Feb 2018 08:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wY//D2TOSIUxA/+3Tz/qnHcjRg6V0zzmBzdlX6DyMlw=;
	b=DZyCXNSmIe4YpqDkMpb3N2tzlrobvMIh1oXPtQkw0x13HyykSznje2yg+HkO3HSOHb
	34lZ0DbcT3S3hk8g05NfHy1JF9e9yxE7DdOKXv5EkUfPPvMnU3xpndmaJyrpzhtl5YnY
	a5Mq0XdZ07/yaCM2weYXD1v0XHwSFw69ScotX18ZhLurs1vsfsYoG/tt8ilTlsiGQr/K
	n6LOJGX+tsSK9wZRkxjou3CPgTsxqmi4Fq85879WG6IOVNkmw8QlYabriCfi0M5Q1R5D
	QXbvxnlfTTcD4NRBu63WdWLHkH7r0SXmfhxnafxsg7EqZIgH1AMCN+ZATJt/0pExDxtt
	N26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wY//D2TOSIUxA/+3Tz/qnHcjRg6V0zzmBzdlX6DyMlw=;
	b=sWJoiXudav+8WxS4LGNXL5KLVFANrpLarzcl3ZTM3VW5TkOWQhdii8asdY8hv0ADc1
	Noi7wHOELr30iarQkenLNhKpFF2MjpRSRvd7XR9RYjASxFIrDyIho0BanAQ5Nw4ckiaW
	2Q9IspemSvdd/GLq0v9VkJd0Qb7a9U9HlHcfvXnQjsHlC1lQu5nvV1UriS75n/eKnMbE
	xtxFRK+zyHyT+BRvkfRb8wpO19x4ih2JEo7LmArZuFeRv8EdUNwBdhJpM5yP5ZqAnJXl
	TGmUDDdWvasxxB1XayMvWW2i/U87BMzPYgeEud+N71/ReanlmsY3LqAGB8ilrS+6sWSI
	RttA==
X-Gm-Message-State: APf1xPAISQ+j9u5UeBS5DeUgLnKu74MWzAHtSkyjPi33Rrns6UGxDaGe
	NGKHM2iw9sKR+XGYr2gpvwI=
X-Received: by 10.200.81.149 with SMTP id c21mr1954355qtn.302.1518108552675;
	Thu, 08 Feb 2018 08:49:12 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id z66sm240905qkc.9.2018.02.08.08.49.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 08:49:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  8 Feb 2018 13:48:02 -0300
Message-Id: <20180208164818.7961-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180208164818.7961-1-f4bug@amsat.org>
References: <20180208164818.7961-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-arm] [PATCH v11 14/30] hw/arm/exynos4210: access the 64-bit
 capareg with qdev_prop_set_uint64()
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
X-TUID: 12mvpwMYBSff

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

