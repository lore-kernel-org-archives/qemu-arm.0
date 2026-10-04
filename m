Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B12CA5FEC
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:29:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLJy-0006cU-3g; Sun, 04 Oct 2026 08:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJw-0006b7-6W
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:28:00 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJu-0007Aw-Kv
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a16629a040so12910775e9.1
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116877; x=1791721677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=p1vfDzd/FHQXQGH1Fm3PawIonhWP06q0FukTEX89uy8=;
 b=a5cu2pjV95QoFDo8M0nlD2vt6CT51FP3dWzGEBWeOUgXTbZF3N/hetT3duPHl+wzJR
 7YO2lH87TTYifeaTXGcoT/GEEoIY853IezWb0ToJFgWlhm6nZDEDSFVpqcGhfV+mvZH2
 3r3fcN/7F2UdKSb/JRVNxvq+IJT6Ahr7EQipiN+4W1p3RryPeTFzwmXcMd0mhD3rd6e8
 9bhMejHj/JSg8ajtAzS7XXkkB69VNfaZNhTaZX6C4ku/wfDF0WuUe4p6D2GCJj3uNxYf
 Cko8o87LKGuzQL+IxbkOXBBdYV0Sb5YQdvJ9EF/mVMmEYo45/pNRYbiQ0irb7zBCQlQP
 cHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116877; x=1791721677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=p1vfDzd/FHQXQGH1Fm3PawIonhWP06q0FukTEX89uy8=;
 b=LCwNcPsW2Z6WgEhijDt+CN0TOENMfBQIK8YzuZY8dqpUrVnG0xO601W04+3H0tsWNI
 xpPsAor68iI7zckPGmDksBk+pRBACA72T98CVvBuSgCnYm19OBMeYZx55IPR9Jq1hJqe
 LvgXbAWctx5Bu2j2tTo5d6VBwt5vY5GphZQCsg3K/IJzjJbmjKOiiIslj1N2T46GlFVH
 EJA5qCUrTGTudpkGYBsDZifv1HGVv1mZSNa8fEE9XBRY1rHLqN/EJC31/qStedDqED7K
 BQg4v+xwBzsTqDvEaPdwQ4/+j4czStj41dc5dCM0N+g0AEAXhu7Uvw0oPMua8KFCX1gq
 DBdg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwI+iunpyG+o8F6smnjNG6w0EvKQdifMkrDBJCPuefsWl4SjlvlIdWE1aglB3osWiaahuoCEQJosA==@nongnu.org
X-Gm-Message-State: AFuF++n2TjwVIvjDtM72Q+VDTa02cK4CN3pK6ejmUAv7wCUfQsLXFnsX
 HKH3zXd9/rnOJASySZ7Yi0Xfp38je5nOgwCX03BU8aqOEaADiv2y5LRw
X-Gm-Gg: AYBFou01uPzqxHnJn8bNO8kfCduJPC7qiDbzVE+MoTBo022YQ7qlZThX2Y1nXs6Ec4r
 AHuWkmXyXtq+uT14qJgaZrFFxr6sFxZq7TpNYvebwduxn9OSG8mWQdS/otD/nDExQOWmrGFVh73
 7US/6af47iDHskR4lhdjNSL/3FmGHsYuF0acLsrvZ2w0P2Kz4ph3pIbUxyZXjNJ4go8Toxsxwy+
 nyfiGz/uFwBORTEIhgvbWUmq+iX7KPdD2nEOxKJB3A5e2t0ZIESe868tW/6r3VNmM6rFA6epwcu
 Ln3hLoYtfCluudJiqcXMRhoC8nijRPXILC30PwUPgih+zx+j40Evw1u3ohpZI673PW5+Ecxv5JN
 Syn1cJawDJpu2zxvZxYZYccC0aLg/rmFkTNkp6KCMGSd+/hyhbfHl/nJo4Ei9MO64vbMLTbUU+H
 10EFtRsvQS71mcfhj7j/b4woCPZmmlVjL6iEBv7CWcJQQ8BXqLXWz2nhWpYh1HP6JCnBfmeF4cm
 AimW3QGOffMwJDjP/LYuP5yCX3tx/sC1Ylqgw==
X-Received: by 2002:a05:600c:4f4b:b0:4a1:6dca:51e3 with SMTP id
 5b1f17b1804b1-4a16dca51eamr45142185e9.3.1791116877187; 
 Sun, 04 Oct 2026 05:27:57 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:27:56 -0700 (PDT)
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
Subject: [PATCH v2 16/30] hw/misc/Kconfig: Remove redundant USB_EHCI_SYSBUS
 from config IMX
Date: Sun,  4 Oct 2026 14:26:32 +0200
Message-ID: <20261004122647.3913-17-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004122647.3913-1-shentey@gmail.com>
References: <20261004122647.3913-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since commit 464ce71a963b "Kconfig: Extract CONFIG_USB_CHIPIDEA from
CONFIG_IMX" all relevant i.MX SoC models select USB_CHIPIDEA such
that selecting USB_EHCI_SYSBUS became redundant in CONFIG_IMX. Remove
it.

Fixes: 464ce71a963b ("Kconfig: Extract CONFIG_USB_CHIPIDEA from CONFIG_IMX")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/misc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 46e3c03cc8..d1711433ef 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -93,7 +93,6 @@ config IMX
     bool
     select PTIMER
     select SSI
-    select USB_EHCI_SYSBUS
 
 config FSL_IMX8MP_ANALOG
     bool
-- 
2.56.0


