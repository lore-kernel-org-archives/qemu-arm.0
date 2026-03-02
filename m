Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730E6C624C6
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 09:23:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vwzU0-0001Dp-9y; Mon, 02 Mar 2026 04:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzTz-0001DX-DM
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:31 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vwzTx-0007ey-PS
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 04:22:31 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso36244555e9.3
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 01:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772443347; x=1773048147; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=53lxDTWJOUnDlMe6xwIvYf4YhH9NI07Oyq4gFjVKK8U=;
 b=tNPm7D5b+oGbdT0Fj/01FxRh9l/+AcGzmFbh6M83L1SiZymfJ5wrQT//FsRrzsv22r
 0WxAnM648jdQtIDpHFH7mHvUvKt8fBtk+hzHDi9PHIfW2Sm4AR9Wtl61eX4l6oBy5voH
 q3soVhm+ysG7f2AnPq7jl7R0lrwAdRpYyG53LBr2WnsLT8AF7Kje4tavyXSGzCKOFb0L
 pAKkS9z4TI9eekqjlzVM+PGnpRhsVXxxKSATDj1UQU6J0NnLZzyfDRYuMsTzJbg66tSL
 GM5S7wi5OzjgaPXOSsAmr80Vu96Q7EnjDP9NW5OqQOePsPjXr7hNE068ypZSIUy7UGU4
 gVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772443347; x=1773048147;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=53lxDTWJOUnDlMe6xwIvYf4YhH9NI07Oyq4gFjVKK8U=;
 b=I5TrhBJfbtc4WO8fS5wuqqnJUmCfa3n+qBZMEd07Edw2l+MerorhfS+mc1gRVb8AzJ
 Y2mWqyAjZT+GAsy/392Yljepiu96DmWKOKTiIL7RxeYEnlQh3gPng8CogRu2LLx7JF7Y
 vEpLbM0+wFbw77hhom9BP5ISiEz/zlDdD15zLUq1W9J5GSu3yGFM2jxLjHy1lrxJ5CWd
 9u9ZkJ83qJqlDR/X9eE9tf/uLJodkwz/MR7dkqri/6Q9ZxGjkA9qY36uzmCeEAPI9DEo
 QD7P20nKRpJaPLf2Yvdw/sM9WMNcUyKAidrQht4nSP7RMekd3qo9WoQ65VN2ZAVlqhki
 oH3g==
X-Gm-Message-State: AOJu0YzmuDMvZKzG2YabEzbfFpCTUsoL+Eg4Dozo0ltXLsaQOQjXl29c
 0D8Z7HDwxoKo45zUjSV6OWQa4rFH6jB5lHAe2QlXZZLHk/kxBboyhKqASHNca1wUVRNX+Hr6wEG
 oWApg
X-Gm-Gg: ATEYQzzJOlvMUGMiiuOFetTrkCYuT3ML00eZy4uxXjsCKnogBNfbMfIO4OjCE1o1LVw
 mFrlK8P3cqCxCS3RRmWRvV2tJ4PwrQgx42xfFnXV0YgHzB0y/rkPvSKn3L9G13vEeAgk5QpQEeC
 YNEEVq60gZ3k6LwyNswsaTXppnnHwKFPHL3S+XSt3VxIJZIpXxFVf5oIu3xnhMwj2BmzYtrK1r4
 +F8WrmVSKD7p3UbQEBqsPdjfvg8nYexY1ZVYRFjli8RRcj52TQeECjbx8l2tDcG28ZFHBdkOlA1
 nXGBmHcn3A/nxqjO1yNIrRT9/vvF5aT9aCjJKa0vDPpcv81uOriB1G5rtMXPIwYBoZyluc9JoOS
 5a501h/4uPV6Swc7BrnEsZiDDSwjDDo2X6ntm0drcWtLhc+PIf1J4PqnerZOkUal2Y67BWSRjDX
 WVuAFqFLC0xmse5TM2BEVGIoah78szsiTLFz35UwvoMyo9XxxVDxQ2b+ZVQgBlfIaftFeVdEFQt
 klpO+u4rb3Es/P54T/RxvxxmFmyYw4=
X-Received: by 2002:a05:600c:4f07:b0:477:63a4:88fe with SMTP id
 5b1f17b1804b1-483c9bb1c13mr237083165e9.2.1772443347125; 
 Mon, 02 Mar 2026 01:22:27 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb9d9c6sm129435305e9.14.2026.03.02.01.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 01:22:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Yodel Eldar <yodel.eldar@yodel.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 0/9] arm (and others): fix some memory leaks
Date: Mon,  2 Mar 2026 09:22:16 +0000
Message-ID: <20260302092225.4088227-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

This patchset fixes a couple of minor memory leaks I found by running
"make check" for the arm targets with the clang leak sanitizer enabled.
Version 2 also includes some patches by Fabiano from last year that
fell through the cracks; I've rebased them and included them here.

Changes in v2:
 * patch 1 now just moves the file to keep 'git log --follow' happy
 * patch 1 fixes the filename in tests/docker/test-fuzz
 * patch 2 has the SPDX/doc comment that were in patch 1 before
 * patch 2 drops the walk_path suppression as one of Fabiano's
   patches fixes this leak properly
 * patches 5-9 are from Fabiano; most were reviewed last year

Patches still needing review: just patch 1.

thanks
-- PMM

Fabiano Rosas (5):
  chardev: Fix QIOChannel refcount
  chardev: Don't attempt to unregister yank function more than once
  chardev: Consolidate yank registration
  tests/qtest/test-x86-cpuid-compat: Free allocated memory
  tests/qtest/qos-test: Plug a couple of leaks

Peter Maydell (4):
  scripts: Move lsan_suppressions.txt out of oss-fuzz subdir
  scripts/lsan_suppressions.txt: Add more leaks
  hw/arm/aspeed_gpio: Don't leak string in aspeed_gpio_init()
  tests/qtest/iommu-smmuv3-test: Free QPCIDevice

 .gitlab-ci.d/buildtest.yml             |  2 +-
 chardev/char-io.c                      |  5 ++++
 chardev/char-socket.c                  | 34 ++++++------------------
 hw/gpio/aspeed_gpio.c                  |  2 +-
 scripts/lsan_suppressions.txt          | 26 +++++++++++++++++++
 scripts/oss-fuzz/lsan_suppressions.txt |  5 ----
 tests/docker/test-fuzz                 |  2 +-
 tests/qtest/iommu-smmuv3-test.c        |  1 +
 tests/qtest/qos-test.c                 | 36 +++++++++++++++++++-------
 tests/qtest/test-x86-cpuid-compat.c    |  4 +++
 10 files changed, 73 insertions(+), 44 deletions(-)
 create mode 100644 scripts/lsan_suppressions.txt
 delete mode 100644 scripts/oss-fuzz/lsan_suppressions.txt

-- 
2.43.0


