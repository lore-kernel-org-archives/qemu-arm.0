Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB7DCA6002
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 09:14:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENEN-0006H5-EZ; Wed, 07 Oct 2026 04:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEIt6-00005N-U1
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 00:04:28 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEIt4-0004ds-PA
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 00:04:16 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c2afa22e1dcso184904866b.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 21:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791345852; x=1791950652; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pWczp/OkfHNMKp8cpsFTwKDih/BeJgnENvn2ywZv19Y=;
 b=iXBHf9G5zeC4LNhe1exyqx75kwB3k2BCqWZ1l59/HLWbs6RxQR69+POk+rbzsQWeeV
 yM1G0HCRnaI0pPnSyZOgaYNWLcv2ITnRRavZ57G6t/AqIv9bA2GLL3FPnxH+hwLaOS4r
 72nMeM9t1sTYgkqXZJmmZ2gmH65OsXlKMR1qz7HWzn+59SyymY/P1gsdzfMQTKjJbAb8
 BpYRgM3cdGXKqhdrh7MBVfOraHCa3qvej/KuPmohXjukKCb7dMbUeh7AkGRbx/h/j/rT
 22wC5HXYUBoGsb9CwkbF7TM9hPI2VSsAtSVkQceCxiV8axsGcu2luCMQK1bAeo9QKA22
 0dOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791345852; x=1791950652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=pWczp/OkfHNMKp8cpsFTwKDih/BeJgnENvn2ywZv19Y=;
 b=hO4/v8BuDRxEVrnPNCU2+OXSzdMOl/7on/KcdcWsT71lQSMrUzh4T9GmSMvDM5pzQX
 AAyRFYlL2529vezcMA8aDVGCYJpj2hqE97WS3VUopYt1n7RQ7BkDDCkAm5UwKvJSn6DR
 16yDlronOj93OxlYYdrB8RJchH8SZhGrytzhimB7O8NUrud2bNND21HiAc+JLjR28VHh
 svPGK7EDpb2+Rp5V0qcrvL1WCgKKgaioC+YLsP/Bv1of6fZDrZSONNtmbB2qHSS7CjlT
 xmlNeHKb/b9qGue3wOyp6nc47v17ai+nWyBMxPgtfiiCR4fN0v49WoCLo3uarf4QuwQH
 a81A==
X-Forwarded-Encrypted: i=1;
 AKwUvBzLlCAgAYzONxRRoB1MUVi9o9k14Fd0iTkKO/la4enhj1MWqfabiUHmE5hrdqlGwCItsixiK/vr/g==@nongnu.org
X-Gm-Message-State: AFq9FYKysl3CthM6vejvYGGtcMkIBie9kdnhH5NUGgDM/VATOprLbJLz
 oRj9tgwwtyOlrPwUBAU/hcUGY67a0x4xxBVJCLX5/KWbXvKD69C25HCK3XnCrQ==
X-Gm-Gg: AYBFou3RfcVVGSf6UwHNEvbwwzOX0rVx20wLR+Qd1BsLjZTrohgfZmWsJGZjYYrc8gN
 +V2hoL4VWOr5N8JySAd0godKQhIngQcUp0L+S3WbNNkh2BskZfvvbjuK6krBaBQqILFUGqg6HVm
 u5OyfCZCBTETvUWeqBQNHe6Ps+ejBFNCPUep0Kdnqj2xzGGxoz9A5EBGZO/ZfuCi8ObowTj0s4G
 CwOyLzevWCxWAFa7GIpM6HNCMamyOcm+9qaTB/J3xa4qecd3McZ8mxop/9E15rB47MPT3NHnG6D
 QgS+IF44uaeUL7H3bjZxLLxi/AYdQ+jWH6yDro32m2tI5jlVf0hh+fFK6pwNx3mcQ1mXRlp13vX
 fi8qe+J6q7yRWvz9I48SoFADSaCXzPkIdPmjz0vzQlO+amPlwIAtxiDn/JhLNweXknf2cMpBWK8
 nn4b1uQfrkeobp4bC4tTH4Z8j49iaf0wGH+01a06pM4LZe9IWkwpVFbvr8vYPmFZQmUIhtDOGM+
 5tTRD5hy4OXYEVmbAsYHYN6r9XV7nLpyOwOfg==
X-Received: by 2002:a05:600c:6986:b0:4a1:6811:8d with SMTP id
 5b1f17b1804b1-4a17b526bd6mr10659365e9.11.1791275722516; 
 Tue, 06 Oct 2026 01:35:22 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:22 -0700 (PDT)
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
Subject: [PATCH v4 02/31] hw/watchdog/wdt_imx2: Fix handling of write one once
 WCR bits
Date: Tue,  6 Oct 2026 10:34:14 +0200
Message-ID: <20261006083445.30362-3-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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

In locked state, the WDE and WDT bits of the WCR register are one and
need to be preserved when written. At the moment, the logic is reversed
such that all but the locked bits are preserved in locked state. Fix
that.

Fixes: daca13d495a1 ("hw/watchdog: Implement full i.MX watchdog support")
cc: qemu-stable
Reported-by: Bin Meng <bin.meng@processmission.com>
Reviewed-by: Bin Meng <bin.meng@processmission.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/watchdog/wdt_imx2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
index 3283990bbf..d897ff6e52 100644
--- a/hw/watchdog/wdt_imx2.c
+++ b/hw/watchdog/wdt_imx2.c
@@ -161,13 +161,13 @@ static void imx2_wdt_write(void *opaque, hwaddr addr,
         s->wcr_locked = true;
         if (s->wcr_wde_locked) {
             value &= ~IMX2_WDT_WCR_WDE;
-            value |= (s->wcr & ~IMX2_WDT_WCR_WDE);
+            value |= (s->wcr & IMX2_WDT_WCR_WDE);
         } else if (value & IMX2_WDT_WCR_WDE) {
             s->wcr_wde_locked = true;
         }
         if (s->wcr_wdt_locked) {
             value &= ~IMX2_WDT_WCR_WDT;
-            value |= (s->wcr & ~IMX2_WDT_WCR_WDT);
+            value |= (s->wcr & IMX2_WDT_WCR_WDT);
         } else if (value & IMX2_WDT_WCR_WDT) {
             s->wcr_wdt_locked = true;
         }
-- 
2.56.0


