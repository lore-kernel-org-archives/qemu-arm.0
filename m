Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981EC606A323
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Nov 2026 11:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Qe+dOynG
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xSvAi-00029a-DP; Mon, 16 Nov 2026 06:46:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xSvAd-00028l-GX
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 06:46:47 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xSvAb-0002bg-Gu
 for qemu-arm@nongnu.org; Mon, 16 Nov 2026 06:46:47 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso37715345e9.1
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 03:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794829603; x=1795434403; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=OWDEm1TDlLJPZkbYtICoVOpb9/mEHmAgIkvbbARcZcE=;
 b=Qe+dOynG+gUMCuu5YaoAntmvMkSFY7YlYixsU8XPCgeJVrQDmndFxdAHIpv0tkSuCH
 bIe3VZ9F6ZQsPM4pPoehJy5TzOldZeZiM2DOnsEhFQivckXbaQVsq5JAVHL3OeoQWCIv
 84P4WiL3FZAC77J+b3STHzVAg3Y/KC0gkRkOGTuibpj3z0Wq+h4rlelbqnCL8ZBY6N5/
 dD1numRP0lSGcDBIU7Rk0GC9a9TwK1EhiqCTY4bytOQnVs2NL1sZVCVdxdgSFJfZ052C
 1fSOTF3zRzI3peYLWsrowYs4/XOgU9NlQAGiqa6aaX1B0AVlHjsib2OZvOMHO7R6ZgPa
 qTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794829603; x=1795434403;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OWDEm1TDlLJPZkbYtICoVOpb9/mEHmAgIkvbbARcZcE=;
 b=1SJ4S4ewFPYHfRTz1SnS0cdEQsqAZ5gZaGtue3QOiCkFSox3NHsz/s5g4juopWjHJ9
 k2uERubAkMOFQaN0XmluGCybXb32lT0fyv04qnF0DYFedvfFOIgT8F7HcsISK6kNQ5Hk
 bUvAc+akIcBSJ8DSVrgD1dYYgr0I+LekAZetzYoNH5FmAmcBgMthaAbnaWOurox85Y7w
 Qu5bq64CquEaTDdYFmZO6YCSQlr7vNjYJD8HXZaISyOJ/hdyTHnj5C9NC1juvQZkxO5x
 qpSVjM4aBF8Onv/yBNR5A+Xr94omR+Jjkxqyj4PXrat8imTiOS5jZD4TYA6T051PyxfM
 n3Zg==
X-Gm-Message-State: APuU4Z+2nBAZvsX36J+3fxCqQNWqtSE6nfX6f+S652/OTKHOqvGeF4Ec
 facRleyYKlo4C76a0suF08NfpxqXw8C0uDTBiiRNlPt+qfyF1W+bJj01D373/VomGzrItj0U5Sy
 oX0QKBXg=
X-Gm-Gg: AYBFou0qC/tR0Y291hLlrW9xXokgq5y04jFsdkLpjFFPR/CVVXeT+cRr4Pb6+TK6FaF
 Yt06lu6xZEhxZRWH5owb3ZV44Pzn4Qd+h66bWF1UUgwKuYkpMO2J5Tx5UdAOFocD22PTxSwCdC7
 oiwtNrKCTyXam7dey+OqbHzrgmUn87fdRNM7wQT5FuDEjgjqYXyUggsCQ5CVlqwo2gox3piv4xG
 5QCMZMFJC2ocd4xsaAkDjN8JdP/6hjtyYiw+WsG3X4ynroo+m7Z8t8iFLO3yCoRUqdwJsO6Y3Sr
 vDXTKRhd8vPXRaefUIZ6lYWzNuYkWO+n5li5IZeT5wZIlvhpkva0BnttYvsleriZqqbNXz3c25L
 qSwxexm+ssWapOoZxdJKiUFMFdxhEZAetrstHcjPJjWAs2csacVtQVWuC7HZ76V+8dHkEha/c71
 VpA7XOkzZN1IhbYxXH52h1ctE+Z8Al5LF6m0KAmHqBqiD+no+xhqrv0WZR+C5THDNZmmBuQ218k
 rf5a0iTPYjZfW+fjllvHpkTlHVKfeY9TzTPY3sOdpH/8qBd6c7CjcNMPNc8OD1AlqouStugGUn9
 Laoi67oU/2n9+imw6ZhDsq4HwpcV6Qcw5FxmQok/i3ytKkeixrD3eaH8qXsYn/uU9IKCCHEWV6V
 33CLkTzIzIJoSoT9WxigTN5Ep2ioShSTc/A==
X-Received: by 2002:a05:600c:4e45:b0:4bb:56bb:1196 with SMTP id
 5b1f17b1804b1-4bb56bb49f3mr207881485e9.23.1794829603391; 
 Mon, 16 Nov 2026 03:46:43 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb679b7e1asm277105995e9.6.2026.11.16.03.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 03:46:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [PATCH for-11.2] hw/watchdog/wdt_imx2: Fix migration when
 pretimeout-support not enabled
Date: Mon, 16 Nov 2026 11:46:41 +0000
Message-ID: <20261116114641.1799526-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The wdt_imx2 device has optional support for pretimeouts, which are
present on most i.MX SoCs but not on i.MX31.  If the QOM property
'pretimeout-support' is not set to true then we don't create the
ptimer associated with that feature.  However, the migration vmstate
unconditionally lists that ptimer, with the result that trying to
save the vmstate of an i.MX31-based machine like "kzm" will hit an
assertion.

Move the migration of 'itimer' into its own subsection which we only
send when pretimeout support is enabled.

This bug has existed in the code for a long time, but it was hidden
until commit d9abd0253be ("hw/watchdog/wdt_imx2: Remove redundant
attributes)" because a bug in the VMSTATE_PTIMER() macro together
with the fact that the vmstate_imx2_wdt version_id was 0 meant that
we weren't trying to migrate the device's ptimers at all, and so
we avoided the assertion (but didn't migrate correctly).

This is a migration compatibility break for this device, but it isn't
used in any versioned machine types, and we've already decided to
break compat on it this release cycle.

Fixes: daca13d495a11 ("hw/watchdog: Implement full i.MX watchdog support")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4876
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Based-on: 20261106163657.3825938-1-peter.maydell@linaro.org
("Fix 'version' arg of VMSTATE_PTIMER")
 -- the patch in that which sets minimum_version_id to 1 in
    the wdt_imx2 vmstate would otherwise be a conflict
---
 hw/watchdog/wdt_imx2.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
index abb8edfae25..b4196de7021 100644
--- a/hw/watchdog/wdt_imx2.c
+++ b/hw/watchdog/wdt_imx2.c
@@ -221,13 +221,31 @@ static const MemoryRegionOps imx2_wdt_ops = {
     },
 };
 
-static const VMStateDescription vmstate_imx2_wdt = {
-    .name = "imx2.wdt",
+static bool pretimeout_state_needed(void *opaque)
+{
+    /* The itimer is only present if pretimeout-support is enabled */
+    IMX2WdtState *s = opaque;
+
+    return s->pretimeout_support;
+}
+
+static const VMStateDescription vmstate_imx2_wdt_pretimeout = {
+    .name = "imx2.wdt/pretimeout",
     .version_id = 1,
     .minimum_version_id = 1,
+    .needed = pretimeout_state_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_PTIMER(itimer, IMX2WdtState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_imx2_wdt = {
+    .name = "imx2.wdt",
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (const VMStateField[]) {
         VMSTATE_PTIMER(timer, IMX2WdtState),
-        VMSTATE_PTIMER(itimer, IMX2WdtState),
         VMSTATE_BOOL(wicr_locked, IMX2WdtState),
         VMSTATE_BOOL(wcr_locked, IMX2WdtState),
         VMSTATE_UINT16(wcr, IMX2WdtState),
@@ -236,6 +254,10 @@ static const VMStateDescription vmstate_imx2_wdt = {
         VMSTATE_UINT16(wmcr, IMX2WdtState),
         VMSTATE_UINT16(wicr, IMX2WdtState),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription * const []) {
+        &vmstate_imx2_wdt_pretimeout,
+        NULL
     }
 };
 
-- 
2.43.0


