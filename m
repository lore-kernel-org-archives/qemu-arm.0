Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE753CA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 06:56:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xELZN-0004sN-EN; Wed, 07 Oct 2026 02:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEGMW-0002np-L7
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:22:36 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEGMH-0005yq-0d
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:22:18 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5ba41e38a79so1093915e87.3
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 18:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791336037; x=1791940837; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RMh0wnw3agFF2IsElQcMdXFWf485YmO8ORQx8WUZoWU=;
 b=I0P/qGMj8wyHmnBS65VKFra9+Q0mY3xU4/p1kLBnIT9JP1s7WUkZfFrPMMKAKNfIy6
 7/Di88YoDQD7Gv2KMV157bb1laxgWt+79TSrgPL5nfpAc8e85DCYOalUgQCA1xJM/4aT
 04J6JVYQyjWchWDYTe6EbGw9gHk9ekTc1RsJAgxnsAXOP0+Id+tddXhfRPeNZVeYN2nG
 mbrELI4xKDJFq8csoodRFM9AbNdCUQE6LFYwiT5k6vU3lcylhuIGHRNctVrW8/0EaPy1
 9vi5Ds91g01IuIFsgpdt9Ov14Ju6KeIIC1kHfBakcZaNi2PgCUCyHk4B+pOTqWHf/CaM
 1XKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791336037; x=1791940837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RMh0wnw3agFF2IsElQcMdXFWf485YmO8ORQx8WUZoWU=;
 b=qLXbAk4F8pBgR+1auk1s6HxnmL4gLt+eKegvlm3VjkgREC13STGqCIOFbZf+NRIWbd
 6demwIRjG/7lxoo8OHP9qnvvYh0OEUoh7kUuyNtrasfW3tOdnPBLR55BmrlotWwY5GHZ
 YSY2XQWV7JfB310tSERyrLXpz7JbXivzfngNW+HlcuwFawD783djmKx6nT9rDKGhvH4a
 VRlF3YfvEWczJBk1wYzA+nCfcYvuTOsNeuUrHVmUPXhxvCKZT/lydeilZw55A/7UmSI5
 vrSwE00YFSekcft2uWKP3Zs0bHvY4nap7+OvZJ2qwjMkIPnWGC1/Y9IbvBPaE9TXSEB+
 ke0Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBzjXqBGD3whcwGETKOFPoCcZZ9ZfFejAwPDhWIXNFWaYHtx0hPOj/WiTMLFFX9c+gFL16uD6EjL4g==@nongnu.org
X-Gm-Message-State: AFq9FYLOPlzDUC3fIUvUrF7xZhf5vgQIu/WStfNpGFfxy00Vxgi8Pj34
 rQj9eyMgTh6FtZxmddSrF1KGNnW4paGq//wXeGx7NeqJgQ3VyRNsHJHnSWMgTg==
X-Gm-Gg: AYBFou21Cab5JGA0OlKRy2vqefUjUUMTDQcHDZGy2eiI9H6lLmQPC7VAD7j1tqYQIwe
 4S8tPEgROgttcmEr1TLzeLTeetnohE5V/1rRIxxJ5SoeHY2zAqv04eVXJbyYDf7Mex6hGeYsEUA
 68FxNnpTIfqlSRHB5y8JoQ1Yn0WBUK02LEcTYabPASH3SEsn8hK6caE3+l1jGDaaj7wraS+ZomU
 4ZPLe7L2cVHba6LzNltWrThkfN8FjORBz43S6KT3w/Q9v3bkrxpuC63YM0G/qbbVXN8OBk3zek4
 wQwBLk9O14MmFotipvWy3OWFjyD/puCwFPgWmulezH0YQdIUpPkstUrmnsxWjEaNowDEvt2dgTM
 hDywwDhUHGeRlwRgOCUjjhcfXRADIGfrwkfsUv3bYAtYQbnsoFdxzRiY3pLvrMriW6bNmHHjB44
 YwfvkMFlLR6d/SQ2bTnVTpFMEm72EUtRoF6kO4CXmnXB/4V6Bng2eLgme3yXQE1gFPudLIi8LS/
 KO4/u4KIDigfC+HvzKs3EsyU8m8nWu1VIFmpA==
X-Received: by 2002:a05:600c:c16f:b0:4a1:65d2:7912 with SMTP id
 5b1f17b1804b1-4a17b527aebmr11741325e9.8.1791275740674; 
 Tue, 06 Oct 2026 01:35:40 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:39 -0700 (PDT)
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
Subject: [PATCH v4 17/31] hw/misc/Kconfig: Remove redundant USB_EHCI_SYSBUS
 from config IMX
Date: Tue,  6 Oct 2026 10:34:29 +0200
Message-ID: <20261006083445.30362-18-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=shentey@gmail.com; helo=mail-lf1-x12a.google.com
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

Since commit 464ce71a963b "Kconfig: Extract CONFIG_USB_CHIPIDEA from
CONFIG_IMX" all relevant i.MX SoC models select USB_CHIPIDEA such
that selecting USB_EHCI_SYSBUS became redundant in CONFIG_IMX. Remove
it.

Fixes: 464ce71a963b ("Kconfig: Extract CONFIG_USB_CHIPIDEA from CONFIG_IMX")
Reviewed-by: Bin Meng <bin.meng@processmission.com>
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


