Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AC1CA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:54:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENM2-0005k2-2x; Wed, 07 Oct 2026 04:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEK82-00042y-Ms
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 01:24:06 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEK7k-0006e7-QC
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 01:23:36 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6afa6bf3b45so2149638a12.3
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 22:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791350592; x=1791955392; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4YQL5m4zq+Pgk78JS657IhliqFYCX7VRgAFFPt0Enmk=;
 b=HFZA+yeJUMqrb1dNJCo5DEn3EO/PXKovjvF5B9ut5L/D7oYNxtP09lq6899ms5tVHk
 /x+DfT2y54CpVqWInf765kdcMgHl+Ik5uGpda4tf36CXl3BKyv74fnyYBI9DTRC+HRzQ
 3YbnWbGX/eMqRVvwBK2w4LKtaiPcj+GnPyWNs+S6RfNLv+IvMnGbMnWufKTN08IKecbK
 ymbvdkqPfDaX6M71TAPxNzivZk3vvCVTWymvQdIsaJdS3+TvI6OjoyYUMOuwZn3his3C
 CPb5Lw2zTuoXsRsLVoaZK+KjBK3pv05ObkGAQqlKL7PgvI+/LJMPjbIX4BDUKU8Uhr8J
 HGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791350592; x=1791955392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4YQL5m4zq+Pgk78JS657IhliqFYCX7VRgAFFPt0Enmk=;
 b=NTY3riaPp3G03tJF6yM65vd4i9V4l0jzkY07l+9W/y7c32W++ShITZNidt639gr8wj
 YCVuRXFMWPo0KQq6SlLN/n/MmsrcC8wDGjRgjVEcXsxjYpPYqpB1xZLXn8lHtIv9vchE
 1nBqd0YfuYiMz7EtuXR4jTXIZJTPAQ/26y5oE21FNkJazu7BBCpIN7hiTo8g3EXCYVl5
 ftjlOrNSEXwHIp3fLRM3e5ok59y7hfJ50liM9v9h+GGcnyppw/wIwh5cJJwECTLl7dxJ
 eOg+Ucn2eF2sT3m5+1xMB8ueP1QqeTJlO6EQnaaZH5pfVYKycv0/3tLBnjOg9H5zcVuM
 FuBw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwBfBOH63ujz93iJR65yPcQpMHgIP+zpMFWZxPR1Knvynk03ciUYx9+e2uTqoLS6VOA1ZBccud7Dg==@nongnu.org
X-Gm-Message-State: AFq9FYKfYtZfa9Ofe1rxQH6vWVM3rrCgqP8Q69tfborAWsjEFBTiZm9b
 GGTGozMHLOoq6EGFgxU1T9Xukr3tDVXu2YYJXW5UlapqJJup1mgQHAcQ2Z1A3A==
X-Gm-Gg: AYBFou0MiRJZqgmzqCEU2IxaXbnu6Bnpv/NSFqwoaP8Qp7aHuTZWCl+JDUlUL0bpAkc
 LyCrG2Ma/qhsa8bdoizvswhHjGxLSZH83MCVMOL9uezFVIthH7m5Gg+CBiSxLMyvXdFr+3bGUhZ
 gDI5yNWugLrx0x4qfqhqVmo9grLkFeZ3Dd7nT7/3EUE50JVqkQSqnFbQM0CpxE8tJfUHN/93m/L
 d1g+G17DPFTBwslq72Uh3jlYovUn1j6UZlttjtKRkp8iVxl99tpY68wBVSkGbmEImC1NTHHcAgm
 TZwfyHArcg3yCvYf7dZkjaIQh4SFP3pbg+MnFMfbTQfpJi/3qYtmy9LHQ0EWEdH074x4M2ipXnX
 J3waSRpq7XC+eaErpNHnKfSAohiBM0cUsL1AfpDN3UediThPEf5KpMxIraQfNOI40mowXZpVbdt
 NDo5BFTy7gEitNSbnB8eSxL8/HewSnGMz8BACeq34RGt1lAFV6MuaBCn6DeAeh+O52BRo0aXqIa
 pyB7eUUHtzYxwZ8S+eTMbQzupkGLF1I2r0kgQ==
X-Received: by 2002:a05:6000:4905:b0:487:13f:f612 with SMTP id
 ffacd0b85a97d-48c6d1c9658mr1018354f8f.37.1791275757010; 
 Tue, 06 Oct 2026 01:35:57 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:56 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 30/31] Kconfig: Remove config IMX
Date: Tue,  6 Oct 2026 10:34:42 +0200
Message-ID: <20261006083445.30362-31-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The previous changes removed all uses of config IMX. Remove the now
hollow config item.

Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig  | 7 -------
 hw/misc/Kconfig | 3 ---
 2 files changed, 10 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 543220be6b..642dd86217 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -481,7 +481,6 @@ config FSL_IMX25
     imply I2C_DEVICES
     select FSL_IMX25_CCM
     select GPIO_IMX
-    select IMX
     select IMX_AVIC
     select IMX_EPIT
     select IMX_FEC
@@ -501,7 +500,6 @@ config FSL_IMX31
     select FSL_IMX31_CCM
     select GPIO_IMX
     select SERIAL_MM
-    select IMX
     select IMX_AVIC
     select IMX_EPIT
     select IMX_GPT
@@ -519,7 +517,6 @@ config FSL_IMX6
     select FSL_IMX6_SRC
     select FSL_IMX7_SNVS
     select GPIO_IMX
-    select IMX
     select IMX_EPIT
     select IMX_FEC
     select IMX_GPT
@@ -603,7 +600,6 @@ config FSL_IMX7
     select FSL_IMX7_SRC
     select GPIO_IMX
     select PCI
-    select IMX
     select IMX_FEC
     select IMX_GPCV2
     select IMX_GPT
@@ -627,7 +623,6 @@ config FSL_IMX8MP
     select FSL_IMX8MP_ANALOG
     select FSL_IMX8MP_CCM
     select GPIO_IMX
-    select IMX
     select IMX_FEC
     select IMX_GPT
     select IMX_I2C
@@ -657,7 +652,6 @@ config FSL_IMX8MM
     select FSL_IMX8MP_ANALOG
     select FSL_IMX8MP_CCM
     select GPIO_IMX
-    select IMX
     select IMX_FEC
     select IMX_GPT
     select IMX_I2C
@@ -700,7 +694,6 @@ config FSL_IMX6UL
     select FSL_IMX6UL_CCM
     select FSL_IMX7_SNVS
     select GPIO_IMX
-    select IMX
     select IMX6UL_LCDIF
     select IMX_EPIT
     select IMX_FEC
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index ab238767b8..93666c4ac0 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -89,9 +89,6 @@ config IVSHMEM_FLAT_DEVICE
 config ECCMEMCTL
     bool
 
-config IMX
-    bool
-
 config IMX_CCM
     bool
 
-- 
2.56.0


