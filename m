Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EED606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 22:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QKMUS9mK
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLSkR-0008U2-SJ; Mon, 26 Oct 2026 18:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLSFp-0001Jw-8l
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 17:29:17 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xLSFn-00076g-II
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 17:29:16 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-91b834592afso44552636d6.0
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 14:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793050154; x=1793654954; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=umrR5N6op3TzUxoaxinr6ylUSq+sThPpBf14p8okNYA=;
 b=QKMUS9mKh/yIMG40VOJtO4+WcLFT/uZrvhOBudC9OFdADsQx7+r6nkqAb/Zuaa5Kb7
 eGs9Ai2YzQ2/B0hfuncunnU7bl6dLhe2qxKff5h6ZHqSYLMen2f9u7mLp6dsr5UnETGB
 FxwLbsMcuqI0OAgXaNF1wxSn4ZHB54nxlyzJTd/7rZDG23HTO6kiVaOf8HnUdgwbj171
 I70yk/+wXKxXrEpUZtWw8pkEA4tSsSD9gVKRbrpBLQAvl/4RUH1liA2rrHAS1j79JuEa
 bIhJoav+YDwQhJ41ByWKodgULlzzvdhRvM8cJK+7hfA251JFchYeovva6tOGe5VfYP+k
 1lYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793050154; x=1793654954;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=umrR5N6op3TzUxoaxinr6ylUSq+sThPpBf14p8okNYA=;
 b=nrO1CX12Z85Zw7HZ4PgfxAP+ji/IhKHmI76bwsdS6fRzKXKkjlEYFrUP701JMK9veU
 NErH08q6wdoC+KBqiwC2wNVe14T/Ux75C0qZGnGZma079odrRRppR/jOfTrwdIu0a2rv
 LEdjQkpdrjj93r5JyEiVNXYefJpZfV9UTmFIY08lS68NBOLIbCZfpCUt3sRlfjJiZ/t0
 E0avVUJeMQ7UJRyfNoSru8A12EfAakkIpH8o5qhZP2a/bRvwW3+Gcl6c6FEGal4sOXBN
 7lt8xVe1z45YgxeqbqgLNJ3fMtKG3Mx1i7jyL3yW7l8pluTZi/8OrS6sRRtMpv5xCmoL
 RQ9Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwgclKr+/Zh1tBCQKW1QvgZrIlVpM3gdLSyzhtM+0Y+DaGuv0c7c8TCRmFFDKOrFHz0kJbya24AQA==@nongnu.org
X-Gm-Message-State: AFq9FYKnWS/rAQQ35+liWleKbdbIq2Ji3wwHLxeLw0DLu4bMUWU0/bhd
 u2SPrz+57ZGOecM5mBGwH1vWqBtqb5lAIQNpVduK9ifyWJiZhvdsHfHlq+Ew+zoJm2Y=
X-Gm-Gg: AYBFou0HoXgYDlxUx98TXH2qtPQXkDUGWOrc4uUKyY6Xk875lLph3TZZ38cUQQD7y+5
 a9qXwsn97s2H2w97iIdhWiQNBhA/WoHZgG3UBfM5E/tN93XhfzNDhRXd5YeJbe8oSUbg/cCe5mh
 BYvmV4EXUJFKjh5yOvgAHDhV4qyRviIM5LOwCa70qCCujjf/Si2pJkJT5IQRif5wGjn5G+/hdHu
 be7WypOsK+fmw+sgd7UI6EaudCWeQ1SxBKu9ztKQqGplHo0gmNlkkwJmxJO72QOS5hkBHs9fgfK
 BHDZg4jWQ1eLRhUMJz+6VIDADdrjgkx9jHbVKE2Y4ErHwtWJ8pndVDwukky0sp69yg4XdYNZt9h
 Jp9iI6Clbq7iWEfFp5HQkSZnqQZFFnZA02VOjPqL84XDTZihEvBvlfYwFPttx8DOBRrozA9zB1E
 2G+d0/Skhxw8ab0Pyc+L3kALQSQxvQ2zwIEaWPkEuWXxSR1kCBKIrt7+HfhwSaSnx9CUlLFkYFX
 9drd3bSU0ne2MYRikIWWRiNSvJgy0BhcF0Z8yBweNUApb3Viunmc6wkmcIGYwXKr/K22D05uUcW
 MTtSmg4HxIcXwpV378WYf5liDCfyazjsYBv5
X-Received: by 2002:a05:6214:300c:b0:917:8c86:6608 with SMTP id
 6a1803df08f44-91c48e85ddemr148146836d6.42.1793050154081; 
 Mon, 26 Oct 2026 14:29:14 -0700 (PDT)
Received: from [127.0.1.1] (95-24-99-141.broadband.corbina.ru. [95.24.99.141])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47c6f3bcsm85206376d6.29.2026.10.26.14.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 14:29:13 -0700 (PDT)
From: Timur Maksimov <gessingate@gmail.com>
Subject: [PATCH 0/6] hw/i2c/aspeed: fix non-packet transfer modes
Date: Tue, 27 Oct 2026 00:28:36 +0300
Message-Id: <20261027-aspeed-i2c-nonpkt-fix-v1-0-076cdde514f8@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bsGWDOsr0cFsqyUw0Ygg/HvSc
 QZmXkgchRMM1QuRb0ly+gJNXYHbrd8YZSkMpKhrFGm0KTAvKOTQnz4cF67yoOlno2nWzrQWShs
 iF/1/xynnDyjeKAZnAAAA
X-Change-ID: 20261025-aspeed-i2c-nonpkt-fix-89b852b5c84a
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Timur Maksimov <gessingate@gmail.com>, 
 "Timur Maksimov gessingate"@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793050151; l=1174;
 i=gessingate@gmail.com; s=20261022; h=from:subject:message-id;
 bh=vQB/m+mwXlfMF6EIdAnPWApC6H43j3gKu4LTgJOq4Qw=;
 b=3vDDVoKFL5ykQBmc1PRHJZENnz18rce9kpPkFwODsOFLONbwBkeSD86SS7zyVMHkU1fEclTJi
 lAn5x8wzk6tCGWcVfSUsBp9zSTJw0SrMfQRgZC5AMPr5o2q61qYot58
X-Developer-Key: i=gessingate@gmail.com; a=ed25519;
 pk=xF4NKIzSbKMdte17nQ66S/q9m/A2gu6GiEWc8ZnyJmo=
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=gessingate@gmail.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Oct 2026 18:00:52 -0400
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some Aspeed I2C modes are broken,
probably because no available driver currently uses them.
This patch fixes them, so byte, buffer, and DMA transfer modes
work correctly for both register modes.
Tests are provided to prevent possible regressions.

Signed-off-by: Timur Maksimov <gessingate@gmail.com>
---
Timur Maksimov (6):
      hw/i2c: add dummy device
      hw/i2c/aspeed: fix CMD register reading
      hw/i2c/aspeed: fix buffer transfer in a non-packet mode
      hw/i2c/aspeed: fix DMA transfer in non-packet mode
      hw/i2c/aspeed: fix BUSY status reading in new register mode
      tests/qtest: Add cases for 32-bit Aspeed I2C controllers

 hw/i2c/Kconfig                |   5 +
 hw/i2c/aspeed_i2c.c           |  23 +-
 hw/i2c/i2c-dummy-device.c     | 168 +++++++++
 hw/i2c/meson.build            |   3 +-
 tests/qtest/aspeed_i2c-test.c | 836 ++++++++++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build       |   2 +
 6 files changed, 1029 insertions(+), 8 deletions(-)
---
base-commit: d73149283205645625bfa9fe029cfb68e4c4a9ae
change-id: 20261025-aspeed-i2c-nonpkt-fix-89b852b5c84a

-- 
Timur Maksimov <gessingate@gmail.com>


