Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B18ACA5FE6
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:34:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLJe-0006Pe-Pa; Sun, 04 Oct 2026 08:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJb-0006Nw-AW
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:40 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJZ-00075U-GC
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:39 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48441a2ba1bso499181f8f.1
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116855; x=1791721655; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L4B5bnHQFyEPgJBdx5DSPHdDW8vW0JVFidXChRaS+LI=;
 b=gjP5wPliWdUpmq1etc7S6fpSgpqwyneu8Af5KFdzTzA1wHOwO4UDdJOvoUZqfuTIXO
 ZzLtkrJ81eEHGVJSOrL0Cvy6V8j86SCaZN5hBCWTDUWZsX1TJ0ldtVhj8wU+kFA0QS4B
 HV8ecILBO+PJ/mOdNyRm6qJEdruYRuH4caq308vlgYBOwcWqhs0ndxS6BhlsHsvG400v
 ZuxnTbBfqLuFipn0sTJnr4nreasEXF1/wfx3haxmS5ydW5K5o/B5UcqGfcNwAD61L6es
 kcooGisEr6o4VPnsKXAHOqUrEHpuiEo3ZI861Jofhgg0j8u6E4099gFZDIcgy94xpg5u
 ja8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116855; x=1791721655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=L4B5bnHQFyEPgJBdx5DSPHdDW8vW0JVFidXChRaS+LI=;
 b=SVeZZA/2Yqg/iiszMHpCmlYwo9azvCYr9iccuXBLI/bFah+1pr+r1rpjW1F4sqVCbl
 76EVIYGuhrI4aaH3BX+AGLfZbLZtTYUp1Zw4BimeXJWh/Pfj6pcjnXNpPv8aXpHlPFBS
 VHWv2uk0xmjImUhAPgjIt0x6rMoQgZC236XggluoZMUND8y0N9AsB0wYc1E2zhCsrgXa
 VFbmfzgkkwwKEjYsbqeMktickmxwor1KRvIX3xzJkljaux/SzRswTG4Xo+lWU6C0N2YZ
 XYnhruaXqoOQH+7tHkNMUlijvxw0mEp4iILwWyNTjEtkL2TKy1z30Vc1BBLYPhUN/dbX
 UJnQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzVooFehmopFVdTmqAnfoE/kWZ+izNuIKUR9QJ+sFMfNo7T4tAmQIDOblmMUZ44jDvBbeIptgEa1w==@nongnu.org
X-Gm-Message-State: AFuF++kLILkVwHFGCcJGcXGETP42WH0jsL6E78zyg9X0ac9RscMPRkpD
 dqIHTJpy5aErsT7a/vW58v+jbv5Ya39ZwZpWL/rgkURLsQnM4TbY3jYO
X-Gm-Gg: AYBFou2f2nSECYqb38inA9zN5WehEXQ8UHKymMdzbQ7eHtOMnJd8cWa0FJkV+NMdah8
 Ow+fMLyQYWTd5jvSt2DAalJOkvg3qmDWLtaxnHHnP5OZMYcQw1kIIagswuoRlBP6OYmlwO+DfUI
 Mqpr/Nt1OejqzUVnl0AdZUPuSMB+BtF/V1C7WO3ftSr3Tslm69LVQorqshJeDYgewoyL4DtZz1N
 W/Ia/NlfdWE/bBFZrOH05CY1jF3x1HMTyWEUyfgskYj0CEyJtXZfl0C8EcZX03e6DIVpai29CMQ
 HkzxX0CjpY2N+cFJg+tXk4KcSX3fzWeBxEG3dyN2BNWEGvQYtrq/2iT4ueOuk8MbQ1UCSbtf6vU
 UJI7wFIEGlA+rs7DNkmj9gT7rAJKA8VZUILenY7tup0zpi7aueWpY7bNPVRaMpZe5AraFhYcgn8
 93OMAa/ibn47uewLRWLWaKYJEXtKrdznlM8yB0NBqqjlfae47YjZFls35NiNJLd7A6/JBZCdqOb
 YsYL35gElyTffh777aABreBOJRV+8S1ljKxcjdxaTjrlEYS
X-Received: by 2002:a05:600c:3556:b0:49f:dc71:e609 with SMTP id
 5b1f17b1804b1-4a1680f7447mr80228945e9.20.1791116854774; 
 Sun, 04 Oct 2026 05:27:34 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.27.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:27:34 -0700 (PDT)
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
Subject: [PATCH v2 02/30] hw/watchdog/wdt_imx2: Clear WDT lock on reset
Date: Sun,  4 Oct 2026 14:26:18 +0200
Message-ID: <20261004122647.3913-3-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004122647.3913-1-shentey@gmail.com>
References: <20261004122647.3913-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x430.google.com
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

The WDT bit gets reset and becomes writeable after power on reset which
imx2_wdt_reset() represents. While the WDT bit in the WCR register
already gets reset, its locked attribute wasn't. Fix this inconsistency
by adding the missing unlock of its locked attribute.

Fixes: daca13d495a1 ("hw/watchdog: Implement full i.MX watchdog support")
cc: qemu-stable
Reported-by: Peter Maydell <peter.maydell@linaro.org>
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
index 3283990bbf..dc7751bd5a 100644
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


