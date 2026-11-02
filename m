Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD985606A32D
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 10:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLsLuHl8
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNozK-00068Z-JD; Mon, 02 Nov 2026 05:10:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNoy4-0005vu-By
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:08:52 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lorandmarton.dev@gmail.com>)
 id 1xNoy2-0004wq-J0
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:08:44 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so2278511f8f.1
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 02:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793614121; x=1794218921; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UU8HoqaxYwWUV6gd0mqcHfedU48+471QZqL+QlLFBRQ=;
 b=kLsLuHl88W7JFhnmecdLghIgWeInSg09wH+JQYI/sYp2gYrbmelqISq8J8aVeRmYo6
 3E0TEobdUVTeT2HDPeQv4VR7WA8L9vtMVsWDmKEJNXIHwg3iBwrHW+GfUyjlALjAuuHr
 gqP8Iqo0iLIJr6WXW/qT+0SyAfKNdrvcCaTu5kvmoCm6f3Aykmp/BXvSUwM8bWpdqiX+
 bj002Oqoee70wQjqYjNoODqrzlq5X2vSdJhtvn8E+wwDimP0GfaeymtbuO7NdSF7bab0
 0hoovDx96RKULFylaYGyQ7yw4gxfhCxshU+sBE9WG9+kiu+eVeQcTt053LUeKhp8ioex
 0ALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793614121; x=1794218921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UU8HoqaxYwWUV6gd0mqcHfedU48+471QZqL+QlLFBRQ=;
 b=SBctA/KBDpgQvEZhKHFOq+W1/T2mCyxzkIW6LUPjAX0F/357xFtBZVUS5ftziLPLbY
 s35dZC2bwye5ckGOsHM+5z83tlWqg7dpbB0u7AZ3NTJLPxDv8PG3LEHQIDGsco4tPsVV
 au8TbEGyjMD0QoKB6hqAUDmjqd5GpnkLrQOa+2kcZMYu+SWite9fSAqUEkblisaKvRX9
 a0j9bTpJUybyIpcaML0Xw4izuHeyi/iJkFXeQmHCELQ0W0NJtURM7prKH6Srdoe/DGx3
 qFKUa86TjKgujFm8wdISkNB0SU0wovVWHT+mdpCp9Y9BeCBppFWK4diFnePk+NkeP1Pe
 zLSg==
X-Forwarded-Encrypted: i=1;
 AKwUvBylNmPWCsYNi5Dl6nAS0BfDJc52c8vSVLj+PO88GWzeXo7xNukVjSL/Nphrvlv/BY0WB/mb7aBeiw==@nongnu.org
X-Gm-Message-State: APuU4Z8WEsvcJ80ly9gmYylxL0p+SpnR0bidkyhSz9PyKml/I+6UeS79
 +0DCX5jrmQbgDarCiG28jLPw9EOcxM3jjoqf5O2oigbBDlXp0qiHIhhK7GivjdEMiQs=
X-Gm-Gg: AYBFou1RFHmXjC6wmrAcC5KXvB1nbJ7g8PY4HKfj1M6r9xMOUTsxKkQo5iJ75NL/GAs
 xkhe5GS8ID8BVwbuL+zZI9JrIoy8yZqpZLh7RU7rbyY59BLtwH9efDI4Fyx8nh2DnwdPrv6ZEc/
 wVWwywoAm05X0QAgpoY0tuALkaqzYuB64ilCL8xJLxVlY7YkxxIQkP/j97lsQXrb9j+j84Nsrnw
 rQQIhNql4vHYqkBjsnLRs9VAriJa615He2p0hbn0uuyfU7pSqQFYIjWoirZQMVW8wNjCUpEcpGV
 CEBk8F1eRewGW3EVD19oQMIH702snmJAGPNVSLIZgb9phRSx3y7ybswMcXF2S5ehhvdy4kQm3tf
 ETpeFgLdAwpVx29fiLT4MyA7ygu2Lk/bzsPjMlAJA7Kg7eBydOj3XLYyEKNdivTPMFlYhq6qApR
 U9bBtfTQdJiXaL4wcCaAdJtWt03JH7tBzCDuMRgbRSlxpuUdtUX8S2grzomgzz+Xx/SgXCtCp1M
 hLXWhoUM0XknexzoUkfv7NbExh8qbSgQvJZqrz9HFzD03q7UOXParvb5L23qAGryscl5CYBYhLx
 MXLNAOnRu13BKQ4sKkgu8fPE6/JVW82/neanL6lRlDR6WzWZCXbjmwPs2cc/+JDRBEffo5J8lH+
 BjQ==
X-Received: by 2002:a05:6000:2603:b0:48e:6852:aea0 with SMTP id
 ffacd0b85a97d-48e6e526830mr20832788f8f.48.1793614120774; 
 Mon, 02 Nov 2026 02:08:40 -0800 (PST)
Received: from localhost.localdomain (email.telematik-zentrum.de.
 [87.138.218.176]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b77f06sm19166398f8f.21.2026.11.02.02.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 02:08:40 -0800 (PST)
From: Lorand Marton <lorandmarton.dev@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org,
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com,
 alistair@alistair23.me
Subject: [PATCH 0/5] hw: interrupt,
 reset and divider fixes for BCM2835 peripherals
Date: Mon,  2 Nov 2026 11:08:33 +0100
Message-ID: <cover.1793613972.bcm2835-fixes-v1.git.lorandmarton.dev@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=lorandmarton.dev@gmail.com; helo=mail-wr1-x435.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Four fixes for BCM2835 peripheral models that the raspi3b and raspi4b
machines use, each with a qtest that fails without the fix:

- bcm2835_i2c: writing 1 to DONE in S did not lower the interrupt.
- bcm2835_spi: a reset left the interrupt line raised.
- bcm2835_systmr: a reset left raised interrupts raised, and a compare
  set before the reset still fired after it.
- bcm2835_cprman: a PLL channel divider of 0 divided by 255, not 256.

Patch 1 adds the BCM283x qtests to the Raspberry Pi section of
MAINTAINERS: the three that exist have no entry, and patches 3 to 5
add three more.

The fixes are independent bug fixes and apply to master.

I found these bugs while running Raspberry Pi OS images on a model of
the Compute Module 4: https://github.com/LorandMarton/boardtwin. Its
QEMU changes are on the boardtwin-develop branch of
https://github.com/LorandMarton/qemu. I intend to send the board model
(raspicm4) after the 11.2 release.

Checked: each patch builds and passes its qtests; each new test fails
with only its fix reverted; the aarch64 qtests pass (35, 3 skipped:
the slow cdrom test and the two swtpm tests).

Lorand Marton (5):
  MAINTAINERS: list the BCM283x qtests under Raspberry Pi
  hw/i2c/bcm2835_i2c: update the interrupt when the status is cleared
  hw/ssi/bcm2835_spi: lower the interrupt on reset
  hw/timer/bcm2835_systmr: cancel the compares and lower the IRQs on
    reset
  hw/misc/bcm2835_cprman: a PLL channel divider of 0 divides by 256

 MAINTAINERS                       |  1 +
 hw/i2c/bcm2835_i2c.c              |  1 +
 hw/misc/bcm2835_cprman.c          |  6 ++--
 hw/ssi/bcm2835_spi.c              |  2 ++
 hw/timer/bcm2835_systmr.c         |  4 +++
 tests/qtest/bcm2835-cprman-test.c | 49 ++++++++++++++++++++++++++++
 tests/qtest/bcm2835-i2c-test.c    | 24 ++++++++++++++
 tests/qtest/bcm2835-spi-test.c    | 42 ++++++++++++++++++++++++
 tests/qtest/bcm2835-systmr-test.c | 54 +++++++++++++++++++++++++++++++
 tests/qtest/meson.build           |  4 ++-
 10 files changed, 183 insertions(+), 4 deletions(-)
 create mode 100644 tests/qtest/bcm2835-cprman-test.c
 create mode 100644 tests/qtest/bcm2835-spi-test.c
 create mode 100644 tests/qtest/bcm2835-systmr-test.c


base-commit: 56afd82bd4db9688f1c1c9d0e2ea163b8cde3283
-- 
2.56.0


