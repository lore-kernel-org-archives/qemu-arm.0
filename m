Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4581DC982ED
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:48:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lrr-0006RX-TL; Mon, 21 Sep 2026 17:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrp-0006PC-9J
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:05 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrn-0000JG-HC
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:04 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e620fa473so20876805e9.1
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027272; x=1790632072; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=TXc2HrPiuM/Mhg6YntPOK+OUKZjiWmJhTHUqS5qMUVo=;
 b=nX1Upg8tjl9rSdofdPNVNVpc/xCaxbVE1SScNOKCd5Q8y7IBDyEmucucZPiS0bMG11
 OR71EFDmaWb01tO3nDD3nBQEefuDt7gev7219Lfy6/O4dZnZfJ+2GtjhHgEY7FwsNHDw
 GgJkxPUue1meyXm5oEi2XggjbmyMJGaO8ChB4Y3+IyJOPYmKwjAXrW3kfKbo/FkDczuy
 HggMx/U2ip5pbw9ehSwpnzq35v86+cE+Kf+WRoA/YEit2NQX+rprNRdpbdw+6dvkvCQG
 00VKtNz/8f0IQ2kn439lUeJqqR7GeA5WLPf/IhH6zGUz5vi5y8cdzaktacHtSQiWmIHY
 nE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027272; x=1790632072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TXc2HrPiuM/Mhg6YntPOK+OUKZjiWmJhTHUqS5qMUVo=;
 b=qHwCDQl/TqVP+Ttm+A+8ryNWKmlj3fQQsHrP0qg75S916BneG6Dd6wT2iutFZiR/pp
 c2dfNeYg1DDyQ9hIZq375YVlaybwvHupqG3yKuc4a9r5RmwqL2cOQOU2DzPGMxqBV0DD
 W1+kpNLxVAEPsvciWyy4OhMX3vbHJuHtoS5LFZaaG+iEQcDFzN3uOnwYuVty2MAy060X
 lYNC/NGC9u5vng5nTQgX60PKoBa0RfN51QCNP+HtTEpXiKf2tFHVerVeFjSnW7WGee9R
 9P18zoavbGm0XAuwC57e1ukzDdDVpAD4hsVy1S62KSoPJST00rjRSBiyplvRzplanH4f
 WWlQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxaPFHxeHADjNiXTitEv0Dwp2MHn/05MyLkPElfKUFIrXxyeF5ZERL+55uMDvQ+NX3/iol3TIsmvA==@nongnu.org
X-Gm-Message-State: AFuF++n8HZJcROVJF25sFrUO79AhJiMGEiGW/h/vK4V3lT5vc6l2h3u5
 /kQsxfuyVp3KiMV09MDVdyAjCi6YiNMjs+RpgHfpGuNjUpUfa7JlWHCU
X-Gm-Gg: AYBFou3iFrlGj10BELO9kuM/Ro4cRS4oRkmjWm2gWYZ5PzN8SOoxSGlMd0jgbWv4xOW
 wsdEYcmj3YXhwfG162j/nL9IHNF7QKtkmUaIF8/iwKX5d2WcXZ9PJ4FMbxORaE0e9wtYSMBrvCA
 5YTbjjRzZlksZCHb5WEr0Y9NwG397qgzHZQ1PQPgNkN8afIxiUrXj4/9q3NA3AcZGpM4Ab7pL4C
 9IauePJ3tT4d0wJmijZbszvr5tfi+kaIeFt4gEHix4Qk/NyYm+qhG7ycHuxGNbMkrlJcDcU/hLJ
 kJl5ZcfFWmCjz8VzMmGHa1zH6wXsVDBTtXVqd8iVdQe6OE1XtcZ0fwNBQisvwyLlxaaNxMsllN9
 /kKjuh6lqxRGfdUaiZKAaE7sciH3syYf5XMsths46PB+hLKUbZOMqr6gUpO0TnyKLZcEx+JTON+
 Pju62mIBOKSlD0rxidatNHIWy+iWq6t2Zk6r1bDGWclWCbJu0HbwJjMf/Uqq54uFAYj7XPSo3RR
 BGJolJmNSYwir3pM2cZ38oKSNYgDLgxBBvkq0JpTnaDc183SshEZe6GHgSuhgp0kYogcPkJiFd9
 0YzrnZDyPl75OQ==
X-Received: by 2002:a05:600c:1daa:b0:49c:fc6c:bdfc with SMTP id
 5b1f17b1804b1-49fc574643bmr155295515e9.19.1790027272176; 
 Mon, 21 Sep 2026 14:47:52 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:47:51 -0700 (PDT)
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
Subject: [PATCH 19/42] hw/misc/Kconfig: Remove redundant USB_EHCI_SYSBUS from
 config IMX
Date: Mon, 21 Sep 2026 23:46:47 +0200
Message-ID: <20260921214710.29422-20-shentey@gmail.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
2.55.0


