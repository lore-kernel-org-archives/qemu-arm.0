Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28390CCF2C9
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 09:17:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI0WT-0004Ns-VT; Sat, 17 Oct 2026 05:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinja.p.jankovic@gmail.com>)
 id 1xI0WJ-0004MN-VJ
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 05:16:05 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinja.p.jankovic@gmail.com>)
 id 1xI0WH-0001fP-Oe
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 05:16:03 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5bce4e278baso830276e87.0
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 02:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792228559; x=1792833359; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PtUbuTloeT9ul5nMXsXKZ7kxIu4l9dLwOXJxJ1CdXz4=;
 b=T0YL0APn01vmW5n1YD/R+uuoiU0N+OT5rO95qLdzIWQp3p4CO9L74HtjVKW5vrYcdZ
 spDaGMCqL0jcrLrGoZm4uZnwalpyIbvKIzG+MK4hIwLRpNnAdBM7EnVq1SXI38w68wk8
 nwDyNsuNuUDmmPz41VLgSwlCfMW0qRPSj3ptLHAuI2z9TXy8CA1sE+vIHVfq3wV0Uedj
 FDscmux/Aw8Ojx3QySQdCCoy9+s5QmW6PE2Lck64tcyX9DsuOcJt9qjbHpbJtm66NneL
 ohEIQwBUA+pOn1ms9Uri3xs2rIfQ3vDroa3EfWySLAbRzNUSZKW40soj59n6g8aYGvjt
 xZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792228559; x=1792833359;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:sender:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PtUbuTloeT9ul5nMXsXKZ7kxIu4l9dLwOXJxJ1CdXz4=;
 b=sDIs60ZS94XvnOYMnuc4m/WhPgFUgn8Sod/j+v3VGOSjv+uIsPJcW0hmjTPwT1bG6n
 hZGZ60mJSQ2begLnctfwlw1GaavIGBRPphygojrvtP4tAcN6qsDDJasuMTg57AgE+OgC
 WMJJ5ZFpQsTI6EjWZWsDCIYlpPczaGrQzX8SlJTH/vsWaPLu2UUmPURM8gSucxp+HfGf
 1e/adJr1QCaTYnSkEHOn8aqUAgHUGzhzaqtDGHL8Yec/2ynLSFU6ZD+4cwubA6kTwyo4
 gtxso6j49YN9De7fCP7c406OnYeKEydKogUoVq/2BUcA8T6znMMycgllC9fr3nP/v7gz
 udRg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz1unvk1ZrS8rutD3/8eDC8yExXHjZ6z8ImqzAAE2Jm2Xjf3uFGfYT6w+m2S2CHGIVpIEq8hgO5Xw==@nongnu.org
X-Gm-Message-State: AFq9FYKFlRZCRY+FjS+MtE6Wy1pKb7btbb2T7RjBdvYpRxOM5olMkH9p
 yT4tMa0uumtvrKYhPL5pJ925HeAlJYQS22X+OqjnD0rmwmfiOuSJBg8Z
X-Gm-Gg: AYBFou19moFrgS2QnDkUL/2uLxVWXnL6w8kkgzrN3+wOBWI9fcV2ph/eUDsq0sPcvUO
 2AgY0b8+afkvu4LCbHUtYav12foUXnffxfBFrT1Nz4rCU+jq+kG8S//lYTvAHHMV5fG0b+J284I
 wGXFe/2kX9X7uiqlNqLAzZEfOPyDZtaFd8XJ8VM5AENKfrOrsgMoWRqR4uH2HF8dypI1WcyrYXo
 gPoGw8yC/yDAPamTv04NqUMeIAmF0h2WJaEABzWcMtv9xWqZXjqDqgxqdjHrL06IlNne73+xdnL
 5GkCKSgUOBCVOogC5iKvN62CXGJbf3yv8eT5utxjI968Tdt6SQJvNhSKddvNZVyGBCvCAzBDL68
 k9yOoFd5eUEgoTatRZVtn4B0L+ncIYSHJuIshoFamd6qRmGaeXHtSo7v/q2WzuVKTqlyb/Dj1Xs
 CemkiNJEG7lTpgAYTnQB/CMnt9cjurhPKR/L7iM16STHiv5vW3P1cFlsEVRIuK9VkUQZettSRwL
 FULTBOPOzgsDxCYJ1hYzsvRRMGw4wSKbU2AFXSoG+f3mfmYQlvLGOejIlw=
X-Received: by 2002:a05:6512:3d17:b0:5be:41da:5c68 with SMTP id
 2adb3069b0e04-5be4793ec7amr1822990e87.39.1792228558613; 
 Sat, 17 Oct 2026 02:15:58 -0700 (PDT)
Received: from [192.168.31.141] (213-65-111-204-no600.tbcn.telia.com.
 [213.65.111.204]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5be4a633f54sm853132e87.60.2026.10.17.02.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Oct 2026 02:15:57 -0700 (PDT)
From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v2 0/2] fix: Allwinner GPIO interrupt handling
Date: Sat, 17 Oct 2026 11:15:31 +0200
Message-Id: <20261017-allwinner-gpio-eint-v2-0-82906f440378@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7Zi2sQquuIdhUctQJoGWtKRqC
 He3cgCX7yX//Q0SRaYE92qDSJkTB19AnSqwo/GOkPvCoIS6SiEaNNP0Yu8pols4ILFfUdayHtT
 F0K3XUJZLpIHfR/XRFR45rSF+jpMsf/Z/L0sUaLXuVaNrQ+LZutnwdLZhhm7f9y8FgQwxtgAAA
 A==
X-Change-ID: 20261009-allwinner-gpio-eint-1818f24ae7d5
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
X-Mailer: b4 0.14.3
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=strahinja.p.jankovic@gmail.com; helo=mail-lf1-x134.google.com
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

The original patches assumed that pin had to be configured as input in
order to be able to receive interrupt. However, after additional testing
with libgpiod and gpiomon, the pin is actually supposed to be configured
as EINT (0x06). In the following example with PH1

root@cubieboard-ng:~# gpioget -c 0 224
allwinner_gpio_read [PH:CFG0] -> 0x1061061
allwinner_gpio_write [PH:CFG0] <- 0x1061060
allwinner_gpio_read [PH:DAT] -> 0x49
"224"=active
root@cubieboard-ng:~# gpiomon -c 0 224
allwinner_gpio_read [PH:CFG0] -> 0x1061060
allwinner_gpio_write [PH:CFG0] <- 0x1061066
...

The CFG0 value on the lowest nibble changes from 0 to 6.

This patch set fixes that behavior to expect that pin is configured as
EINT in order to allow interrupt-related functionality.

Tests are also updated to reflect this change, and a new test for pins
configured as input is added.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
Changes in v2:
- Moved changes to the interrupt handling tests to the first commit, so
  tests still pass once the commit is applied.
- Kept new GPIO input test as a separate commit.
- Link to v1: https://lore.kernel.org/qemu-devel/20261009-allwinner-gpio-eint-v1-0-c55d2958ae0b@gmail.com

---
Strahinja Jankovic (2):
      hw/gpio: Add EINT CFG to Allwinner GPIO, fix interrupt handling
      tests/qtest: Add Allwinner GPIO input test

 hw/gpio/allwinner-gpio.c              | 19 +++++++++---
 include/hw/gpio/allwinner-gpio-regs.h |  5 +--
 tests/qtest/allwinner-gpio-test.c     | 57 ++++++++++++++++++++++++++---------
 3 files changed, 57 insertions(+), 24 deletions(-)
---
base-commit: a19f59a72d96056d9a8f48cf6c77f5787491e414
change-id: 20261009-allwinner-gpio-eint-1818f24ae7d5

Best regards,
-- 
Strahinja Jankovic <strahinja.p.jankovic@gmail.com>


