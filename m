Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC184CCD1A2
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 22:21:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAyEu-0004tr-Ln; Mon, 20 Oct 2025 18:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyEt-0004tR-1E
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:20:27 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAyEr-0007TZ-5U
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 18:20:26 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47495477241so1774795e9.3
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 15:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760998823; x=1761603623; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8808EUNcwke3TPhY+Qw/CQoqBF5kKU0jpneGQtl261k=;
 b=VFeoaxiGtz+EFhdf0CtkK3k96MBZ8jNcP1GGtJeIsKDjLz4A/7SXvimQH5MvDFsilR
 yMTEbtlfmbsec0hibHZ5781J+IZW0uxN1vwYZdzNt8aHJrJRaHnb0yx6HrRH2HTEFbkW
 ynR14bZEIRb5zU/QhpDno0SdHQ/BcuSpfAA1gVouiuDK8JIMDPkXNThcOmHg+n3wOL/s
 FIqytOU5KbhfThskMqPV4ZQvIZL/Fmy7c5sfnqSewKShDKrE768oAANN9cB7wdrY3Xl4
 AZDKnSBydNY1vRtnNAU+f7UbE8lw3GLftzEwSBgd/4FTaw8B2n3FePGfBFAqqLGMIGsM
 C0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760998823; x=1761603623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8808EUNcwke3TPhY+Qw/CQoqBF5kKU0jpneGQtl261k=;
 b=qHHM5bDHXm+0onnxkZJhpgnxN3uDMBrMs2j6CFfQ6VeNucAHPLGWNKBufRUNkysr5R
 hXnnE7n30prfT2zks74nyoLu6KCuoErcxGgDu+uGxT0SjjxhaLdGbM6U1Ozdn+pEa3kh
 krjyxngw8tpfDE+c5yd6ca4HvBxNPApO25ywPXYLtAfkb1sElEa3iXsogO/CgzzchEot
 U5BdR0RS/BgaYz7Cohqa7Dsg0eGHp/PZ43idddHjqyYPSavTTMg1u18SwN1iHJ2BRwMX
 UegrSBkxrF6V0pzMCwCdGypimBP7g378y0eKqvXxTci8YDAm9u9MrQvohhEm6kK0m+Ks
 wgeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXht7DsJelW38xb1ZKJvkIQKxWMY3vRRLNnDWStLHZvkBmteMH6a23r5O+rVQgge8N1aH29ySuPRw==@nongnu.org
X-Gm-Message-State: AOJu0Yx+4GNuKdYQS6QdR3C86ZaeK5J6UBDKvDb+OJsaRK7pEdx2YHzU
 2rgOqJ8atWI+sopG0ZoR/CxzpaPL/TYNLyJa1pNpiaTuduLHJH4jfteebG6ppqGiHGM=
X-Gm-Gg: ASbGnctb7wc4B6PvjTXdTShjAouTFkD7XUrkRJSDscfLv2AA27+8l9CvT9k+IxF/JzS
 muNcSCP4Vje1IWwfBJbEhpyLLqMsPWG8GbQhmf8CVeT0vmS+Nt9xo0j8GoF3BSCGDXV4KKYrSMu
 l3JnOIlbuliSpgnY0qEhugAH4NkIkhWZUxooXv1TWVF8jqhqPVHgmDlFpWu+2+yFDKtHr0ij9n+
 P7eC5erHVyLditfKsleZkGiDArDRh+xj2UDJ0HQwbX9abLIIquTTghfnVh/uHk5LhBB6hQSpG2R
 0hT5xvAxLZ5HPpqXcqZspi1L6xoxGUo0THjq70NzydxrpOX7nAjw/7Q4tTx7GkLQ6b/tSCYW2GT
 c71T87mYemJw3YLwm3/UtvzW80EqEUVbtFM7WnQNdPd2VaFOr/nn1RIdPEgopdZbTKIOQVACOF+
 oGOaSvMdTga/ukI4/7fDXY0V4V+Y0WkCOv1WS8vOdSBhMwh7GgKWtTR9/BjSx29mBtwB9gs4U=
X-Google-Smtp-Source: AGHT+IES2T8m0f8ghyEV4xRpbbyRCuMU/+ixyjUD/tTpsKc6pOeHIflwLfTm5Zg6+gIWreLNBXxCxg==
X-Received: by 2002:a05:600c:4748:b0:471:12c2:201b with SMTP id
 5b1f17b1804b1-4711791c503mr95830615e9.27.1760998823429; 
 Mon, 20 Oct 2025 15:20:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-474949dd479sm5098315e9.0.2025.10.20.15.20.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 15:20:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, Luc Michel <luc.michel@amd.com>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 27/30] hw/arm/virt-acpi-build: Build only once
Date: Tue, 21 Oct 2025 00:20:07 +0200
Message-ID: <20251020222010.68708-3-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020220941.65269-1-philmd@linaro.org>
References: <20251020220941.65269-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Previous commits removed the target-specificities,
we can now move virt-acpi-build.c to arm_common_ss[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index fbd5e8da79c..4dfc7813191 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -1,7 +1,7 @@
 arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
-arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
+arm_common_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
 arm_common_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
 arm_common_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 arm_common_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
-- 
2.51.0


