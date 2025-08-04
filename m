Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F2BC87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 14:58:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiwdQ-0001FL-6H; Mon, 04 Aug 2025 10:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKQ-0008Fo-IP
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 09:34:18 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uivKN-0008RK-5D
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 09:34:14 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-459d4d7c745so13235295e9.1
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754314448; x=1754919248; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=71w1yPowl9RTO7KXVQBpxY+KjMD4LfNAuPnGUS2NDmc=;
 b=QzGPIriIqe0tXAXXFnBE4lNL2OMBGoTOkqmwK6+a2xd4bsZV+rVbM1tp9ANFhtKBqd
 05LXmBB9HSJxHdTAI9mOO2h/f6KC4eESi+IodonNs4ns2SBAvOSsw7BNTsCxI7EOYFUM
 rk5p3RAAN6UKl9plNwlaL17xJnImg8S7oKlq5+QlQm7u3M0V1TzcLfeq7Idofy/UXoDg
 ybWJYAQ9kiaFTxA7H131Kh1tKJUedTUjuClZDNgmRO0DCWBgl3xCkE1bonPvtFd0ph9W
 PVKDjyO0KSFAObwGEM8A61q1Trc0tzL06yN3APs7xja2KIfKWpHiMHUBA9339+EfJcky
 9LAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754314448; x=1754919248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=71w1yPowl9RTO7KXVQBpxY+KjMD4LfNAuPnGUS2NDmc=;
 b=dz3bgoc/x4mz3yOlfqbOCqX290gG9tFN0N2KzH1oSBXtxGYrnk9pLKbl5mD+9WunuY
 6+uD5zs3M627Rl2CeXztobQKndpfS1fmI9GTVdMimgVchMLuB7bZfezDHyS8uKXHEVH3
 FgZxkoBxpzKJi8/anpGm08pRDLXPL7CC7d1GK8EbisdBBmWIF3WVKzI2duMaSkGgJlQf
 xZlkL05b5dvCoXbfnGEwa4EwjlF6N9qqtuNdt7sCs2zQg3/W8K0Vek1mD7QROMwYK+Ty
 Uu3UuWwmQZZN6MGtdjdMetn6bJKoDRVIEgpYWxteYXdobWss+AufOy36Z208xv2q9Br9
 M1Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ52s1nSzEIqkdBJMqCvE154khvL3M2226nEiVg7USE8ks0ps/xqI5sEMuKnZ4sBno5J+yB7UP6g==@nongnu.org
X-Gm-Message-State: AOJu0Yx0rcs8qMCSoSZonMKpEhaZfoYwzeCj3w1LBlTrkF+htKmibwWH
 ocLWAMg/bXfUMlsydZIQ0tSBC3wyYF+HAZuvEi4mVThtefozB2uy6JIhFGNsaYWYliw=
X-Gm-Gg: ASbGncuX9sSOwyuKmPitRMJJwHRKsptVNFNGD8UoIn72BOCOqPQXaHFPvXIRB3rY1pk
 OqW9Sq596dERgxlGvtcE+a+4Djzk6dMUOh/QqLmYTG+NdmqZGgY/rLUgnEjr7Idt3D52HgUK9AP
 K93jwnMaMhk77DOFzuw4BBiJooR4+JuleYym7y8LlQ2O2c7XeXRuTwh/Z2IWRAlLPsGMXXQaj+G
 lS3t7Z+aimsA02OXfxYh+ovI2v+alYh1oxWjFBM5TYBc13F7ogk2LbPSeXJYBEfNKdmHIkUVrUX
 MAJajXyos8vvpoP8CQFWckVw0FNbyJ3thmvJBFtp2hvCsdoZpKhm1OlrFpt9GVq1FRtXwwMiK3T
 2W10c3zwnDAB6SNrQxOD5tS0b3jBJwPQgl8inegp75Tyydls6C1WMIwiH7lw21XBaJAtDuuRI
X-Google-Smtp-Source: AGHT+IGbVe31gT//v4a6/azroTh7Glf6nat9vb1d57UA4WFAUaQNKmwJd3Tn0DGKUg0tri+n8dAMsg==
X-Received: by 2002:a05:600c:1e8c:b0:456:11cc:360d with SMTP id
 5b1f17b1804b1-458b69de114mr73176085e9.9.1754314448442; 
 Mon, 04 Aug 2025 06:34:08 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dfa64da0sm12464425e9.3.2025.08.04.06.34.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Aug 2025 06:34:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH-for-10.1 v2 00/11] hw/sd: Fix SD cards in SPI mode
Date: Mon,  4 Aug 2025 15:33:54 +0200
Message-ID: <20250804133406.17456-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Since v1:
- new patch factoring sd_response_size() out (Richard)

This series fix a pair of issues with SD cards used wired
via a SPI link / controller.

Such mode implementation was minimal. I was testing it with
the ARM Gumstix machines, but we remove them in the v9.2.0
release (commit a2ccff4d2bc ), so they bit-rotted.

Although the series looks big, I shrinked it a lot to have
the minimum amount of meaningful changes. Other changes
added during debugging will be shared later, as I believe
they will still be useful to debug other future issues.

The last patch add testing coverage, to avoid further bitrot.

Regards,

Phil.

Philippe Mathieu-Daudé (11):
  hw/sd/sdcard: Do not ignore errors in sd_cmd_to_sendingdata()
  hw/sd/sdcard: Factor sd_response_size() out
  hw/sd/sdbus: Provide buffer size to sdbus_do_command()
  hw/sd/sdcard: Fill SPI response bits in card code
  hw/sd/sdcard: Implement SPI R2 return value
  hw/sd/sdcard: Use complete SEND_OP_COND implementation in SPI mode
  hw/sd/sdcard: Allow using SWITCH_FUNCTION in more SPI states
  hw/sd/sdcard: Factor spi_cmd_SEND_CxD() out
  hw/sd/sdcard: Disable checking STBY mode in SPI SEND_CSD/CID
  hw/sd/sdcard: Remove SDState::mode field
  tests/functional: Test SD cards in SPI mode (using sifive_u machine)

 MAINTAINERS                               |   1 +
 include/hw/sd/sd.h                        |  23 ++-
 hw/sd/allwinner-sdhost.c                  |   7 +-
 hw/sd/bcm2835_sdhost.c                    |   7 +-
 hw/sd/core.c                              |   5 +-
 hw/sd/omap_mmc.c                          |   5 +-
 hw/sd/pl181.c                             |   6 +-
 hw/sd/sd.c                                | 198 ++++++++++++++++------
 hw/sd/sdhci.c                             |   6 +-
 hw/sd/ssi-sd.c                            | 100 ++---------
 hw/sd/trace-events                        |   4 +-
 tests/functional/meson.build              |   1 +
 tests/functional/test_riscv64_sifive_u.py |  51 ++++++
 13 files changed, 249 insertions(+), 165 deletions(-)
 create mode 100755 tests/functional/test_riscv64_sifive_u.py

-- 
2.49.0


