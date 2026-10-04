Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030CECA5FF0
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:29:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLJf-0006Q9-Cb; Sun, 04 Oct 2026 08:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJa-0006NL-Bi
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:38 -0400
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJX-00075N-7Q
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:38 -0400
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-4887840c529so244188f8f.1
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116854; x=1791721654; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+K+rCpfMJFNVG3mUSTsCEEVuDUjKTak8WjFMBdYORMo=;
 b=Kny80EXHQjlqfw+tUO6wKdRv119xiSQXKCwzq70wzth+Zi0LoTrCFOemsN1Jx42n/J
 p9hjJlTOlzxCj7AzVMv5soAqID5PCbO+S7ZCBsGfWD1Gja4EP1DPyzZpNB097SjUrEsw
 w896gNsmTgR6GzYLQqRVWHBXhCgvmcw/q2wln7SAsL1cSwisUpG/V7QokEhPRkTk97PA
 G8jei4kNPNGrN81JepNQ5Je7F1g903qtTAtH0a7+M+RQBwODq2Um0htp+SVleU7STuVz
 RDZAlS5qd3pCjxklg7gM9ZrskPMZX4QEJvSH3YVgD68WqTVeq/ZeQCJehF43SiICBKRx
 ITOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116854; x=1791721654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+K+rCpfMJFNVG3mUSTsCEEVuDUjKTak8WjFMBdYORMo=;
 b=tF7VrZk/IK/oFzEfStQc14HbjeqsIKbbI73Dtl3zpI0g/wwwm24xFlFh+l8nZDNnBL
 ETU1jMJ/i4B1XKyS/2wGXW8vE8ZgbhgHzFbw4f2WAmQPu2BNwQoNwGtm7T5OwSpRkYxG
 IaLrkyDVWylsX5zJedTpGqcmyvudOugyXjviUoVOVmNCRiFgCxrWHnGpEpSaFueLH3OG
 0ADhDRy2K0TgixO2B8Ya3fS1Pn+O574R69B0IwvAvL60+vh6vwSC2T4n0tkYYH9571yU
 PcVaWO0CMvYnsiyGb9x/azznDUvBzHMdN7LksVJguWMsL9/EHuCsHjEyw4Gg3NycoRNa
 hvzg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwXX62Ip014xCmlvyQtX+PUNnI6W+5sFadAFChbcT2nbQB4Coq2oz2NgYKQTnVJOlDqXlZDKFpV/w==@nongnu.org
X-Gm-Message-State: AFuF++lHzP7zGgvYv4Z3XUpYJ4QDzoUUKdHpguTKCzdlhewU8kvlcwq0
 XY8+MTscAYMoPwrgMDgHiv+b1fRc2TxgtUmOGYCfQosMh6jWjnjbq/Le
X-Gm-Gg: AYBFou2899gdjQxHFmzmuV/nuXRkVxch53VI8W8NnbsEHd3VdyNCTE2hGkGpcEDpY/j
 PMAdkSfVfidc9HqerI7sbEBrYIGJHBfOe8jp1nNd/M7RN158ASSa0h2tNMPkOrhg8JFOOxQNd+i
 u/M7ugJkOn9eRauI2qn3XPgCQcxtNO1jhBd8MFVBGJoqgqW0cfCKP8nV8KjyOt8Eg/wCjOK1G5w
 WAi/1KYk/0ETgF91lIp1fbmlTlCHKKPtb8Mg2MbGYzhZZ1Apm7Npwl/iiBiHF6Ev8poe1h/Nfmq
 JPCTzKeL0IU0+ezscu/rQvO1/FllJRDSztHHvLfFjLCR10RYORfptvZxtMJ/6l1+jP3VxC4fvDc
 zVOUfiHgVLW2NRQ/8ibM0xY0b7c9rRRksU5d8QXYgi0KMMXQl3IxARlocE4ecQw8Y1zlIJid+g3
 RD4QQirsenPqamdR0I+BiiSe25DhXtArWqT5VHZo6EsE15U4lppGjqSSpoufXHyZlM+lGYXLpdY
 Dp0mov5ISvhW5PgFsGnQU3bzXcMMrPdhijiJg==
X-Received: by 2002:a05:600c:8b77:b0:49e:6581:7baf with SMTP id
 5b1f17b1804b1-4a0274bcb2amr64311345e9.2.1791116853656; 
 Sun, 04 Oct 2026 05:27:33 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:27:33 -0700 (PDT)
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
Subject: [PATCH v2 01/30] hw/watchdog/wdt_imx2: Fix handling of write-once WCR
 bits
Date: Sun,  4 Oct 2026 14:26:17 +0200
Message-ID: <20261004122647.3913-2-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004122647.3913-1-shentey@gmail.com>
References: <20261004122647.3913-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::f;
 envelope-from=shentey@gmail.com; helo=mail-wr2-x0f.google.com
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

Guests such as u-boot may experience inadvertant reboots when configuring
the WCR register. Apparently there is a typo in the WCR locked bits
handling: The locked values for s->wcr must come from itself rather than
from s->wicr, so fix that.

Fixes: daca13d495a1 ("hw/watchdog: Implement full i.MX watchdog support")
cc: qemu-stable
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/watchdog/wdt_imx2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
index c83d4107c1..3283990bbf 100644
--- a/hw/watchdog/wdt_imx2.c
+++ b/hw/watchdog/wdt_imx2.c
@@ -156,18 +156,18 @@ static void imx2_wdt_write(void *opaque, hwaddr addr,
     case IMX2_WDT_WCR:
         if (s->wcr_locked) {
             value &= ~IMX2_WDT_WCR_LOCK_MASK;
-            value |= (s->wicr & IMX2_WDT_WCR_LOCK_MASK);
+            value |= (s->wcr & IMX2_WDT_WCR_LOCK_MASK);
         }
         s->wcr_locked = true;
         if (s->wcr_wde_locked) {
             value &= ~IMX2_WDT_WCR_WDE;
-            value |= (s->wicr & ~IMX2_WDT_WCR_WDE);
+            value |= (s->wcr & ~IMX2_WDT_WCR_WDE);
         } else if (value & IMX2_WDT_WCR_WDE) {
             s->wcr_wde_locked = true;
         }
         if (s->wcr_wdt_locked) {
             value &= ~IMX2_WDT_WCR_WDT;
-            value |= (s->wicr & ~IMX2_WDT_WCR_WDT);
+            value |= (s->wcr & ~IMX2_WDT_WCR_WDT);
         } else if (value & IMX2_WDT_WCR_WDT) {
             s->wcr_wdt_locked = true;
         }
-- 
2.56.0


