Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8FFC982FA
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:51:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lrr-0006Ra-VS; Mon, 21 Sep 2026 17:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lro-0006Mx-9H
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:04 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrm-0000Iw-Fw
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:03 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e6598dd44so18302235e9.1
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027271; x=1790632071; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TSR3J357qCAnKna/ltpzsAD/Xo6H3LWF4T6WfRDdd9U=;
 b=HtxR7822GodVM0BiCK7PbAMg68Mq0sdA8SkVii/M1wkQf1e4v8jcyhVHwVnHZaf7AR
 YVkd5liJKIoqyY/x9wvXIPl1XBOs13ndRQWGPrnqFTZpJZVBLVgrk5Ui/9WKkXiuAx/A
 Q6/GsuCVfVFUk06Zple98N0VVHiT1bhEvfydDs+pmAG2oBwt/D2lX3GA70d7X3fi9+ww
 r0PFaWTELtfSUvkuqWPFsKCGNxMXKYkt310cf1p+DF8Zy/M9wbd9iv8shpvN8n1xYDjM
 PisFVNXuamO9BMvF70ocZtdRZHB5P5rakITp28TbH+LTZFfeBzconsmTUMxS9gphxapG
 QHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027271; x=1790632071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TSR3J357qCAnKna/ltpzsAD/Xo6H3LWF4T6WfRDdd9U=;
 b=UM8ESGwb4PKlneTgoNJgQYYuuyyka3G94X897Y78jhXORSI3AYxgxxi52QHtqHtnCy
 d9QU2rMbogrqCxdUb6abtIzGszbJ0CA7fB2AGt7wLcm4n0dByXJ5nhX2O17XUBb12q2F
 Cs7BWviAZKbAjkMi+NQWS8nlvtsWGtziS2Drg1xmSrvOt0eHbuKmULMFaoU8pVWwpaGq
 wEuQuf0G7SVSGXqKT4jDbwjyvcE6QN4skQj9YlVrQuyRTDqyGdmJ9xWxK5uR/5VkFjnI
 8c9pvIarfG7DwUkd+N4TP/2OxVqSCIAi6VaKYvbmFURs3P0RYz0KyUQbkgmpQkaje2o5
 L5Aw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxLs9PAs0O9ArfCo2de+G7VFo9UDq5cwm9hU6xhmtD9NDPZNZhrph8CPvfcdvW0mG8RdmnOiCPB+g==@nongnu.org
X-Gm-Message-State: AFuF++moyqMR72sCVyoiXgNVtu60rlnZBAFDxfKrPk4JzSkPJyE5kKpi
 tZPcXQ1st3vUBIxhyedEEresApaTXjotx1/VKSsy8mSlGddOHnYhwCJG
X-Gm-Gg: AYBFou2p/fTM4K0OkLubb1UnMxGwuq83pNdAoRpsq7v9/fC5EPRl/C1fH+4mHiY8N58
 TCRwxTsWlYxtkQlIGbrauBFbR9tFtA3n376RBhMNDDF3PwyE7uFm2+CyGG8MWh/OveXgDIY76lk
 7pLKTvS2GP0vXV8EaHMcL82F84YZ7zexNEgjS3lFBwGMDVGmCGRatZoLTZMePs7KHUBMpl7w/1t
 pQ8+YaYvCYtnqYfiig17Jmaqot5PagoV9whUY8PYo8xSzHMj3J7UEvRAt7u/Rs2uY15aX1foU6s
 0SQ0+IWhuG3+vYY7L1ujnZPrxYf/QhouKM2qMj2ukqEY52So6P6/MGe/5GpzliLuZHXj3G7s17G
 BBYwTEWVtnshDJpAupRKc0Kbag0/Y5KrTgPHlckASy+d0ZX2zlV0Cy5XsTqGg2SLtL7F+drg37+
 s5xHnNwxUgzY1l9THLLxM+G6cisLc/7dS80DQQSxcXiTgasvDLKKzS6SljoaBFioHV4s7hsi2c3
 F0NIBmTEZ4v01leqvTbZXB6+iHJh3JNCIuWw8e0ceWPx3LImQjd5nNZbysJ+AcfQ6VuIGAJ+mWL
 XMY=
X-Received: by 2002:a05:600c:358a:b0:49c:fa20:cc08 with SMTP id
 5b1f17b1804b1-49fc5741844mr187164415e9.31.1790027271071; 
 Mon, 21 Sep 2026 14:47:51 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:47:50 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 18/42] hw/arm/Kconfig: Select missing UNIMP in config
 FSL_IMX8MM
Date: Mon, 21 Sep 2026 23:46:46 +0200
Message-ID: <20260921214710.29422-19-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

TYPE_FSL_IMX8MM models the whole address space by representing
unimplemented devices with TYPE_UNIMPLEMENTED_DEVICE. This means that
UNIMP needs to be selected by config FSL_IMX8MM which is currently
missing. Fix that.

Fixes: 7bcd1f30bc83 ("hw/arm: Add the i.MX 8MM EVK(Evaluation Kit) board")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index eae06369b0..ad4b997abb 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -626,6 +626,7 @@ config FSL_IMX8MM
     select SDHCI
     select PCI_EXPRESS_DESIGNWARE
     select PCI_EXPRESS_FSL_IMX8M_PHY
+    select UNIMP
     select USB_DWC3
     select WDT_IMX2
 
-- 
2.55.0


