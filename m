Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B8CCA5FFC
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 01:03:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEG2c-0008Mu-Ql; Tue, 06 Oct 2026 21:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEFGC-0001Du-21
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 20:12:31 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEFF7-0000Tu-8J
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 20:10:57 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6acbdbc1725so4833680a12.3
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 17:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791331629; x=1791936429; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8K7Yq/KgL/Zin4VcTKhCZ6b8VSA0wVYhUmnTHSEofyE=;
 b=mL+p+OsDgypPR/I8zJdq31oc04YDMI47RKxRlzWk+4On4LSC2mS3UvAQUOn4ghxM5P
 wQMl1Lq4hLvTeYrNw1Jk7Ql8GHiRcR0RqH3FStDP/Qk/Tp6MnnuXN12o3XVbPtNkeuoH
 udvacmhEed5zCndvZ/WXlIp7Ipm6e9M86x/QGnhOm916jxSekWf1QWimwJ5ED4WAByGc
 lsVlBGHK+KGPl1lg7ZzJSvV7rtNE3WtEZbCKrOuPwQvTonNQeCZ+1ueWAuQfGmddUHsc
 vcPoVpLr+QRd0BQJWOXXVaNO7qlyqP+hLRmE3P764V+FKWiNIjNrFfmEfasFK3KwzYLo
 opZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791331629; x=1791936429;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8K7Yq/KgL/Zin4VcTKhCZ6b8VSA0wVYhUmnTHSEofyE=;
 b=oSGUEzHeVfvbQK8uAKsRtNJbQQdLwRAzmbLasNCrFAzLJpu6UMSAq6LFiMxpXB+Iv4
 qe9MTCbjjGn/D0T/N8u68t6bZ1am6a0YUbrJOyLm3f+BV3b9ziHBzZwXudS5EknWTwnS
 C2RqSyrvmEKv8goR8U4E8MWsudrCIdt5Ok1LmIZuMUOVF7YEzojBQukQ/y8VDsnPQdDL
 QyIXU8nZ0NPj5B4gQenpVPzEGy6x3KumaJhmKuCvmE111e/aWsQmuZwIC8i69Gd3VkL7
 HV2CSZoepReH3ipAuMeKZL8i/QsnLncg30Gu8w1N6Ea5vQK6W3fCqGK/APBAKBDhoe7X
 Df2g==
X-Forwarded-Encrypted: i=1;
 AKwUvBwnogKaOt8kN19NnYJawOrjxn/2AtxTAY+XE6wB5U+i99rZxQ63A/TGvTQBA2BdHSr33VYhenF0XQ==@nongnu.org
X-Gm-Message-State: AFq9FYKTmj6j1BB/U2GsrEEE7TX++HLqni66JFDPyhq7b5Y3ELb03kvT
 5ynQvQU4ms0a6syVuH4K7Gx7oxVnN3pbQ6qI/Ciz7SsnABCMXsVL9l4j+cnkuw==
X-Gm-Gg: AYBFou0k8z0HKLH+UzuHgnX+hObN8zKlaK3OEe9PkOowfLNk+jfh2LgWnM8LNeF2Ysq
 kVKlShgry/NteuEqctAqQKikRFogQG8SAM7XkSs4Dp+Yo+entwKMHqXoJ/7hyw2RoGpeu+ziyFB
 hIDr9MXOzNEOWOLWCS91rTeQpPcyzy+kO8OFjrH93C6rJhdfiGz2C7YXLGRq99jNivHVfo/ewWC
 8Ru3zu3nb0rN7X53T6PhNj6GMPFWOs6TU5F/jcrbpb81ZMbG9wE3nGOqgP7Jfn43Uo7FxFsRN1P
 +7WiEHmIbKGtLSnDNM0cciFo5n8XgKcCBcfZ3zESWfEHpv4/QbC3aWNQvQV7Unipprsy8UjPtfj
 1WBMYN/Vhiif4/s+kLRMIe9th8FjYC9gyqcs3cvfT+/UMRJSYTSS5WX3eFtkdBK6Vr9reLm3ORC
 MyjEd7RIRH2glYtXUzkae7Oocq4UBF1ysXi5rSQEvvY7AkM+7DfFQv9PvEfQNvLvDRzqywxWAk0
 R+wcHlR7YSHKJQgLrMcVJkpU4zFE68tWC4dVg==
X-Received: by 2002:a5d:5f50:0:b0:488:8111:6f56 with SMTP id
 ffacd0b85a97d-48c6d0f4c77mr1187617f8f.8.1791275721430; 
 Tue, 06 Oct 2026 01:35:21 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:21 -0700 (PDT)
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
Subject: [PATCH v4 01/31] hw/watchdog/wdt_imx2: Preserve own locked bits in WCR
Date: Tue,  6 Oct 2026 10:34:13 +0200
Message-ID: <20261006083445.30362-2-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Apparently there is a typo in the WCR locked bits handling: The locked
values for s->wcr must come from itself rather than from s->wicr, so fix
that. Without it, guests such as u-boot may experience inadvertent
reboots when configuring the WCR register.

Fixes: daca13d495a1 ("hw/watchdog: Implement full i.MX watchdog support")
cc: qemu-stable
Reviewed-by: Bin Meng <bin.meng@processmission.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


