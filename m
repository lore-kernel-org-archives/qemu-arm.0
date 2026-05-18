Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54100CD4F4A
	for <qemu-arm@archiver.kernel.org>; Mon, 18 May 2026 07:38:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOsV9-00011A-2k; Mon, 18 May 2026 03:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wOsUS-0000gS-8a
 for qemu-arm@nongnu.org; Mon, 18 May 2026 03:34:19 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wOsUQ-0000U1-Du
 for qemu-arm@nongnu.org; Mon, 18 May 2026 03:34:15 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-453903ee4adso1584530f8f.3
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 00:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779089653; x=1779694453; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqGYmMNk2IzjfU6V7SHdR87lmOLyVnNSlOzoPXx3nik=;
 b=jKZR1Fyp/beVJW/igphVA64uw1bbghqRCpzGVFC1ib//CT7kS6ZbDOVvxeciEU54oq
 /3xcpxHFa30DkCTteizU5ztS+my7x/ZVNFZ3J7uCwvOu7k1O/Sy2eRssGdPWAVGK0Ci9
 YPYRhySAauNiDo6VjCE3vnaXphWAPyguCgMnzsYDnwA+/6VFDIhTjZ2yZ9AhnXdd6u0O
 8EMIJWmGH4u03FpMFgrmIejqh/tUXzWkcmzNbSawArjbByMbec6xLWNGKLBQuTlzL8UQ
 cHJpXyX4reffQXPb+t/Wie/yCNefIvD4jDSL/kXomeQnU7fOnmtSrvMhOEcICX35IKEi
 10sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779089653; x=1779694453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RqGYmMNk2IzjfU6V7SHdR87lmOLyVnNSlOzoPXx3nik=;
 b=EoOF/Kz5YL9liv8cShSQQlR88DIufirRJB1rVqF6RofOCWHLhyQvvDS5tjYG5hBJJD
 KiODHJByzMFZ6+jOqIwTAjIg3ODSB+ZWFkw74uKoHDlGf3LeD025otJw1zthdH34SNFm
 MZMAG9EKgGylh9/LL+vHUXsoinHoC7ipfVgx34qBlw8FHfgA9QaXGQlIQ9SHf4JMNbTh
 mbreeoYg0SKFMlJSZ7g13ZQm9Wbm2dCL2VI2OnkZcfKdPLsc6cgH+FcW/Cad+mbvnnnp
 oqB2K/IlIAFS4vk/Q2hZz0/+SxuasQk11jlZgr0Jv6kxgtpJZ2gTWaFbqnQ/9yd0sVb7
 fzsQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/D9ObBwY3QqSgFg8+jdR98dUKhgvykReOXiH6U+6jjis0H0ZWR3pJKYFRXhv5Cbh6GOK/DP1ft6w==@nongnu.org
X-Gm-Message-State: AOJu0YyUm1IXIMN22SN2s84dhaGbP7KDSbIWumA03ABoAuOYo4ImTvCx
 AsrBSkw+7IRPdWIzmyPLqCD4BX7ITKdTwAk2LdzQ60g6CMwgrytAALarA8kJ+07j
X-Gm-Gg: Acq92OHHJE2oRJ3XVwkX5co/R02Z0a8wG3MkcAfMy6SnKkGzQbgJvbkXpM8YTd9UIQ2
 Glvtbd0YrP8/bHSMX+JSkzyeNelxaOPsWyqReRdbQayCyCUTRvQQ2XYawXy/UglBCYF6aK1hVg3
 Loyrz1yyMBKH6XUc7YDXktmeSwRIOneedHGYnUluKPoNAVUeJysBSud26DraEgr6T1TjDNKHCiJ
 7d2WoaB34H4+xl/iy1UPRAzS6KBnkQxAFSG4moxGuC5GyKhQuwLFr6Cky39oTIeoEPdE+Z1Lf/F
 kfl30sdM2IPonUOQRcA3n1I/nqsYg0BrsCwGUW1XJr0wg7Pp/VBgwxWJYC+0Xo/1WW7OuWyeAj0
 LPfLoWQ2O0g5Mdn09oS7Y/M3g2wmX8xClzavnPsNvhf/RkxoCXId9NYdXgC/YM0E5nsPC/v+Vuw
 SnOKTyqQ+4MVfDPQbKo5R8ez50t0y3BpBlgHJe9tkn5Lvf+g==
X-Received: by 2002:a05:6000:40df:b0:456:f186:7af8 with SMTP id
 ffacd0b85a97d-45e5c35e4c5mr21451286f8f.4.1779089652738; 
 Mon, 18 May 2026 00:34:12 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com
 ([2001:9e8:dc08:b284:85e6:f7f4:1a4a:4dfe])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9ec3b18fsm32590222f8f.11.2026.05.18.00.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 00:34:12 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Yannick Vossen <Y.Vossen@beckhoff.com>, qemu-arm@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Corvin Koehne <C.Koehne@beckhoff.com>, qemu-block@nongnu.org
Subject: [PATCH v7 09/16] hw/block/m25p80: Add HAS_SR_TB flag for is25lp016d
Date: Mon, 18 May 2026 09:33:54 +0200
Message-ID: <20260518073401.11279-10-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518073401.11279-1-corvin.koehne@gmail.com>
References: <20260518073401.11279-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=corvin.koehne@gmail.com; helo=mail-wr1-x429.google.com
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

From: YannickV <Y.Vossen@beckhoff.com>

The is25lp016d has 4 Block Write Protect Bits. BP3 specifies
whether the upper or lower range should be protected. Therefore,
we add the HAS_SR_TB flag to the is25lp016d flags.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/block/m25p80.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index b8a2543c0b..4a4cda6602 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -217,7 +217,8 @@ static const FlashPartInfo known_devices[] = {
     /* ISSI */
     { INFO("is25lq040b",  0x9d4013,      0,  64 << 10,   8, ER_4K) },
     { INFO("is25lp080d",  0x9d6014,      0,  64 << 10,  16, ER_4K) },
-    { INFO("is25lp016d",  0x9d6015,      0,  64 << 10,  32, ER_4K) },
+    { INFO("is25lp016d",  0x9d6015,      0,  64 << 10,  32,
+           ER_4K | HAS_SR_TB) },
     { INFO("is25lp032",   0x9d6016,      0,  64 << 10,  64, ER_4K) },
     { INFO("is25lp064",   0x9d6017,      0,  64 << 10, 128, ER_4K) },
     { INFO("is25lp128",   0x9d6018,      0,  64 << 10, 256, ER_4K) },
-- 
2.47.3


