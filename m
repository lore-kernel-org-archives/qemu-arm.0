Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DF2CA5FE6
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:36:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLKV-00077y-TK; Sun, 04 Oct 2026 08:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLKO-0006u0-Qh
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:28:29 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLKI-0007FC-UR
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:28:26 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so9686885e9.2
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116900; x=1791721700; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=LgGp0v9oTRznvsuoY+AnWTbK2P8vfLWEbU2auUJcq5I=;
 b=FOfvPSEHhbvl6NU6CRlHHJzKinBXnWRB8dft9x0g7A/OSADwtV8FvcOV0E5zYF+grP
 d2qcN8ugB0sb/aD3wdCjCtv+UleiK1d2HbtRfywO0XVY2gBS7bqCGVM66Ejo7myCeSsm
 MW/G1wXkkbpWpOB4DLypAVHI0u+Gae36sQkpLW2qGlmCF5PQC4pEE877N8Tui9SxPNKL
 FX5i7/rM22efuvvtYBN8VOjgBvm8qm3jmfk4RTGO1aIBxyZfRiXtULuph4n1Zy7RugOz
 /lAK1rHsmb0E/cOm9/iCe0lGEB3Qu5G6V7WIg4czXrOalh5ogXOuYq6QxYkr49Te4EEr
 GsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116900; x=1791721700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=LgGp0v9oTRznvsuoY+AnWTbK2P8vfLWEbU2auUJcq5I=;
 b=pY9TT4ppvWCpPMDJtcFZgDvSsGQuAvm87scwvpco7CrnDV4kRLcZ7fTXnZjUPrT4U2
 6IL732Q1/UCeppGAjMRN/ZDhraLM7FyEvH4TQxWKS85XFa0nKP6v/+CI/64Ka9uxqqZQ
 GhvGdkJLc4y/BTJ00A7i7KCJs2M2KqNVhq7tR+6dNI1isLD7G41/dcgsTZa9SQ0bfPNJ
 yOTfBH71zAg6ZmSp4Va14hIaSHf74O7T3fQjTGVdG4B2WZmqOP67H812v1evigsoEpV3
 D5u4JtUSX3daSr0MA/fUWr53iBbKFIUA8HXo1vR+Z2691WVvi74G0vxbClAfrJe+UbGN
 QxtQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByJquDA2X2aASORwZuhhV3Nt7K7Bl/v8J2BNh8ieJ3I2UHnyEDqhEKb9Nx9FddC+f59NH4Xq1TVFA==@nongnu.org
X-Gm-Message-State: AFuF++kNTQIMOCgZw8bOM8oTiKUUcZUyiecacq2CMAIEGooDel2ip+3Z
 VEbQDOcKGtLaypblMI0RPormCrIoDv9HtEqZjeA8bLoUy5O+EMT5lId2
X-Gm-Gg: AYBFou2Ojz1Je7/tN5+jQDIMXdHWFiymgF6HSzly8Wj8afM4Jczl9kjsxlnNi6RsT45
 ogHNNVm0za5q3tTcewNnGDSjv3z69P5u9OPQ/TCUhs7/o25AtgxC90su2HJlbmtwVsqVvhpZeh2
 NF/fwLcYawyxJL84JnfnnY0YNCafwVEO1DofhN9kbScn6LaquiRJsNmiekeZHb6zVWZiRL0+lZw
 t3AAFN7WJVPDj0NHeUvU/Dq5WXPNqmVLQ6xCtqyA7n3LPkCqRj3A9Wpl8v7STGeWYD2jYCoJlIq
 RZ/3G80W61jGgg1mEltaHB2O6dNxh0zzk4oOLB9EpXa3QxhBgYU/4ZVdgFYwAUP3Q3cMZ9FlXp0
 QpXzHCXHFjRby4eU2UMEVyJKfLmoqJGT4F5ZTyoutOhuDbxT4ZgPFBbWK7hshlbsX9cHddB5jQ/
 Z+IQnA91EW8SEsnrMfeGHq8g8pteo8/i8FhmQDJKwSBTPbXfzP/7q9CTovwbnn8Z80/Fy8akCvH
 OG92XRm2UIHw+jkUsnLw0Eiun0t9QflO97DDg==
X-Received: by 2002:a05:600c:3103:b0:4a0:1feb:de6a with SMTP id
 5b1f17b1804b1-4a1680fd804mr68101415e9.30.1791116900174; 
 Sun, 04 Oct 2026 05:28:20 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:28:19 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 29/30] Kconfig: Remove config IMX
Date: Sun,  4 Oct 2026 14:26:45 +0200
Message-ID: <20261004122647.3913-30-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004122647.3913-1-shentey@gmail.com>
References: <20261004122647.3913-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x332.google.com
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


