Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978A2FEFB53
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Feb 2026 13:57:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvyLk-0006B6-GH; Fri, 27 Feb 2026 08:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvyLg-00069f-Hn
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 08:57:44 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvyLc-0007U4-OO
 for qemu-arm@nongnu.org; Fri, 27 Feb 2026 08:57:44 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48379a42f76so16009815e9.0
 for <qemu-arm@nongnu.org>; Fri, 27 Feb 2026 05:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772200658; x=1772805458; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a9KECWfOOF9H4e152rcyPrGP114oax4qvSfriKZp0L4=;
 b=ruPzxQnScV+FZHe2TTt0FQOHrqSp1MLAOXphWzIc/YVtPkgheGsDLzKQ/ml/JjbjmW
 2Z1E0Yg67urcOsn07CYmUXI7IQ7+jMRpxRw4pfu1YAAoofavkcOyLM0HDm2LqD+H3nbt
 F+Urvoy3cxF79P7T0yxNav+o+f1TkxmbhG+i7je8RsFzyrH5F8b26f3xxRTOpcrKUE9c
 OtQ/L5I9zssY6hrt3UBEyfgib/COuxGFwfVKhbDNMGzcPUTv0kw0nlj7IHWRvEeery5e
 Dy5R+5IGbmcuflDqaOsXloWtcdSDwSyelmtssCAR81t2uN4uzX5pEXzRPPxgKyBe9Jqt
 MPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772200658; x=1772805458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a9KECWfOOF9H4e152rcyPrGP114oax4qvSfriKZp0L4=;
 b=BQJLFKlTwx7eb2VyAQWTAi82PVvOs3NHrBa9vkq5mT36BGsMRQcGzTzYeIXlq5O3X5
 Y0FeK9GBeh1+XIIwFNXdrD2kB86GEZgx64Ou9SpTHkYEUW81Tv3tdTTbP+ZtA2iPqZWR
 MIiHTubB5UFHu9JR6yKN4Lf94KLjevrlZ1UyG718of06B4E30BvWR6c8PxSujQZ3cpHy
 98jRUQGStfaHL6lpeTXAlBAslc9hm3bMzTe96FLoJOuBANOqluss6FeqNyXOOpG7gybk
 LggKCNoBMOfHiLIISNb9mnEXXQTbq5i3qL9n6Bul+AHKLGahblOJDQnucClsZoUz7AwB
 3cTw==
X-Gm-Message-State: AOJu0YyZeTmfWEYVLf3r5OtkTsgGMiwbRKtgUNcPPYvHUmsOzrYnoxP9
 zTw9vS4m8nx0lNMT06bJruPwR2albNJ8TXxrnLmpvoRstsm5xUxOfgeR2Tbr0fKtgEq8tf+qtWv
 W8ks9
X-Gm-Gg: ATEYQzzcvEae3XDYhi5XKo3GFV2JieZBgPdECMaBWuk2+umYgoKU7Kt+qelg5cBaV5A
 dVmTtQL9yydjXAW8l59Su0En3QS0UILpi4YoLl4vS7CdoC5Tp31aRzv2jdp1IHQf5dm7gLXgqKb
 jTAgF5fX/Ym317ZN/hOJ+Z98GAKA4+9/r+tyOzDZIk4kxKnabEr0UjIV+i2F0yyu3sh9HYWywdg
 Tm1DJcAwPQJFa3ZqW9WLtX43qILX/LM8S/AeHbWlvm4nc8GtrLAzUxMjoFkSbmFU8GgvkEX8V92
 Oh+026PCWOHPR9muXT33Tl5s88KB6qbeqG7DocU1U8Dq9iTF/zq7uySacQuqRuuvXL5sqLv0oog
 AtZP3wXIlPXkAc4tWfqbHCRvHgNYoe/oxbkqLZAlcZlJrlaC/w9NPCVNEUZC926RiqsDV9dW/OT
 bHtSjAyyeRvY/S0ReRwzEoW9a4kBHdCZ2cTUG73lL0L+gmNyiiStZaekCzDSAa16VQ8GhgdNrBe
 WHE3m8i68va8xAwkpo/HqcorQFY7+c=
X-Received: by 2002:a05:600c:c16e:b0:482:e5d4:b7ca with SMTP id
 5b1f17b1804b1-483c9bbb8d3mr43182785e9.8.1772200657893; 
 Fri, 27 Feb 2026 05:57:37 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c75b327sm7655163f8f.20.2026.02.27.05.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 05:57:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/4] arm: Fix some memory leaks
Date: Fri, 27 Feb 2026 13:57:32 +0000
Message-ID: <20260227135736.2280161-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

This patchset fixes a couple of minor memory leaks I found by running
"make check" for the arm targets with the clang leak sanitizer enabled.

The first two patches are necessary because there are a few leaks
that are either not interesting to fix or which are not in our code,
and which otherwise clutter up the logs with failure messages.
We have a suppressions-file already, but it's in the scripts/oss-fuzz
subdirectory, so I move it out as it's more widely useful than that,
and add some more suppression lines to it.

Patches 3 and 4 are the actual leak fixes, which are straightforward.

This gets me what would be a clean run, except that there's something
wrong with the refcounting of qio channel objects in the chardev code,
which results in variously use-after-free, leak, or assertion failures
when running the vhost-user tests in qos-test. I'm still looking at
those, but in the meantime posting this series gives me something to
point at as part of the repro instructions for those errors.

thanks
-- PMM

Peter Maydell (4):
  scripts: Move lsan_suppressions.txt out of oss-fuzz subdir
  scripts/lsan_suppressions.txt: Add more leaks
  hw/arm/aspeed_gpio: Don't leak string in aspeed_gpio_init()
  tests/qtest/iommu-smmuv3-test: Free QPCIDevice

 .gitlab-ci.d/buildtest.yml             |  2 +-
 hw/gpio/aspeed_gpio.c                  |  2 +-
 scripts/lsan_suppressions.txt          | 31 ++++++++++++++++++++++++++
 scripts/oss-fuzz/lsan_suppressions.txt |  5 -----
 tests/qtest/iommu-smmuv3-test.c        |  1 +
 5 files changed, 34 insertions(+), 7 deletions(-)
 create mode 100644 scripts/lsan_suppressions.txt
 delete mode 100644 scripts/oss-fuzz/lsan_suppressions.txt

-- 
2.43.0


