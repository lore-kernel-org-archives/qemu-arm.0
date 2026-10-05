Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DD3CA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:18:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfmJ-0002Gk-DW; Mon, 05 Oct 2026 06:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfm8-0002EH-N5
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:30 -0400
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfm5-0000uU-3l
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:27 -0400
Received: by mail-wr2-x0e.google.com with SMTP id
 ffacd0b85a97d-48afd5b1678so885772f8f.2
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195503; x=1791800303; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fM7at0yHqHEVoYkayjVwz2Cz63FNCL0ZKzg1XE7m+cY=;
 b=TuH4QUwNgyHNjWSeSXb6b/4dPHhxfqZoGlGxbd2Psyeo1fH7fAAlncXoq8LW1jjscU
 qStBgdz++RGyXQbHjunw/K8WbgQBeJGe6gSLEZz7fE2srws9JN1usp3DR0fYY6+pDNEw
 Ff0QTvUl69DLZfkO3szzxvIXm20bDol9mTu9vlRoTnHLs4ye6EqdmjUA3uXkNO2jXS+t
 m/zrwgD7nOSrydNu0gD+gDmIQDXabRd5qqGBTZtpfadp2fW1mhamkc10Z3KbDP8sjLoN
 0KjHO35ZENWK44fmGWnQf7tWU3c8N0FUex5cxKCnmxrbQoLY1T33NqDCPF0FOczIt4R8
 sEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195503; x=1791800303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fM7at0yHqHEVoYkayjVwz2Cz63FNCL0ZKzg1XE7m+cY=;
 b=pM4bgWT9+H0LnYJtaIJTF5z7Od6gI7o6DEfnFX3AghXcXMUAdkn/pm2nPWiUpn/2Py
 65vviPbd548geEx+vvoa1vLJu8udTiVsx75g8byC2kUc+ZDnJApjWpogfAH5Bie41JZh
 sQq9XHbKHb+Ne7CjRcp/X/ITouOHUBQ43dHw5VQtGFC4X67qH66mPL0xsGC+Cbzny1iR
 cDKy5DcloV+QF5YPek9LlkjnPbWvLeTcWzqOHLxQoJAAa0Ig+98WTQdSQbuoTuhrsNIM
 WMOd2qzQe/8Dw0PulvKkk9uyn/FaUOkzSEaGF4cg980YTWSeZ0DO+cmh0SDUhoE9khRK
 9zpw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwEZLbV/Nq5rx2srJKtdUJ5d8KODPEQrBEmu1tt7DvlM1bH6LUvrw95hXVdHBAzL9pqg4O6NYpOzA==@nongnu.org
X-Gm-Message-State: AFq9FYJoI1jYPjwlYOyudc77gPJreyDY5l0I0y4btImU9wlURhc7Iqx2
 4nTD9Mqaz2xnD8lF3L4WIxtnCi7dLlFZ2XOIXmnc9b82ih7UgpxTipqC4F7kfg==
X-Gm-Gg: AYBFou1PGz6QUrKDwg/RfcL0N5eu5PuMRI5aXmGoHaDEamnIX4PlvNvFG9noJbHKAis
 vDwVtjYSsOggX4ENREDK98P6b8b3JXXw0st/q/r35yt+FFI17whvXgD89pC4Q9cREiJKYeVCinc
 xkymS4p4zQNCb/iNanFm+OFRcb3KkU8IselSANCJxM2dz9qQ1k+qex+p+gO6S23vCKvg0vcBYBm
 Pt8n7vJn+Jbj/ppdqXphhGECDB0PWjcMUYHLVJalCbHg8kAr++iZc+jWIIyBSDMPIeicntmTy9T
 PTltiellGoA5lHQ4XEFkMevCLMa6klNetAOA13RJFcWszEikAgYG0QzjgT9wYu5cR7XdDoRzAzy
 D+s1u+XkfoRlKH0sSGyh2aNH02jREWxxIOy7fqYq4VfElyS/CiU9TygoA5haB+rnA3Xcfj3u41v
 fB2BN49DxQ1POKKymvFhPwN6kMvJFtcWWwuszMwOAkOeXtX/hclb0BHphxiJq2kc6U5wMzKPUHq
 E8Y1vvrDlfaswZuoEk8Nob+O9zfHbxs7EgmXNM=
X-Received: by 2002:a5d:470c:0:b0:487:27f6:a4e3 with SMTP id
 ffacd0b85a97d-48b1275cc02mr13466009f8f.51.1791195503372; 
 Mon, 05 Oct 2026 03:18:23 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:18:22 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 03/31] hw/watchdog/wdt_imx2: Clear WDT lock on reset
Date: Mon,  5 Oct 2026 12:17:30 +0200
Message-ID: <20261005101800.10821-4-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::e;
 envelope-from=shentey@gmail.com; helo=mail-wr2-x0e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The WDT bit gets reset and becomes writeable after power on reset which
imx2_wdt_reset() represents. While the WDT bit in the WCR register
already gets reset, its locked attribute wasn't. Fix this inconsistency
by adding the missing unlock of its locked attribute.

Fixes: daca13d495a1 ("hw/watchdog: Implement full i.MX watchdog support")
cc: qemu-stable
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/watchdog/wdt_imx2.h | 2 +-
 hw/watchdog/wdt_imx2.c         | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/watchdog/wdt_imx2.h b/include/hw/watchdog/wdt_imx2.h
index ad36b8820d..fc01fc46e7 100644
--- a/include/hw/watchdog/wdt_imx2.h
+++ b/include/hw/watchdog/wdt_imx2.h
@@ -85,7 +85,7 @@ struct IMX2WdtState {
 
     bool wcr_locked;            /* affects WDZST, WDBG, and WDW */
     bool wcr_wde_locked;        /* affects WDE */
-    bool wcr_wdt_locked;        /* affects WDT (never cleared) */
+    bool wcr_wdt_locked;        /* affects WDT, cleared on POR */
 };
 
 #endif /* WDT_IMX2_H */
diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
index d897ff6e52..a15f452d48 100644
--- a/hw/watchdog/wdt_imx2.c
+++ b/hw/watchdog/wdt_imx2.c
@@ -60,6 +60,7 @@ static void imx2_wdt_reset(DeviceState *dev)
     s->wicr_locked = false;
     s->wcr_locked = false;
     s->wcr_wde_locked = false;
+    s->wcr_wdt_locked = false;
 
     s->wcr = IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS;
     s->wsr = 0;
-- 
2.56.0


