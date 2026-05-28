Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B541FCD4F54
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 15:35:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSclA-0002Ga-Cc; Thu, 28 May 2026 11:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wScl9-0002Fw-5h
 for qemu-arm@nongnu.org; Thu, 28 May 2026 11:34:59 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wScl7-0007W4-CG
 for qemu-arm@nongnu.org; Thu, 28 May 2026 11:34:58 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-49050ff7cbdso54388095e9.2
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 08:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779982495; x=1780587295; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vrp3eKnBy+B2K+P0IWU9ZtNVlySGJBybDn0Cv7Tdxrg=;
 b=x/EFeZ1vXE8FptbsViQ/iGvrWEl9xh+wSVqOmI4nZxkQKrSj/1xOosKStYIT3KE/uH
 XvD6WmlH/Yq0MJj0gftoCfWWZwZghs2DVjybu68lGGtWoOv/JAAUu5YkwRpHM+1bs9vR
 gSrvl/wlKIHDHrY53Xy9ImKvFFfjqSqddzzcdg0DizrOpLDJRy+qQdNOW2PtRrITaKqS
 4bFPZGRBX77ulxA+IcbkKkJaZcv9Mq63vLnvtIVCBMUyc9LwpUkVh3R6TGU55hTM37i1
 l79DcYFgKXD6KNAyWvuWVFTWH49g8tZ3WaQjXvAjCe4fIckCjrZyZclrnksp1ws8WgAw
 3jeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779982495; x=1780587295;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vrp3eKnBy+B2K+P0IWU9ZtNVlySGJBybDn0Cv7Tdxrg=;
 b=XXZYDgnygkwFetbb3funLyBg5pOjIoOC9+lrDd2UbQT+m/+VRgoQWqUP36ft2o2gaW
 +H5gFT0FW5EpAVrQeqSZIEMhqPADIAE2eptfZHdPx8nF11+ev8sa03qQvuv0JfzNoUOq
 uyPjB6muR+MzpqJrYJXdIMJ3o5P8VYuNMSQquwJdzKZ2K1PP+d3TSwiVhRzlp8OL7kUo
 Qhrt5EHCYaA0H3DKSATwu6RAvTFT9qvlvWNU906+eNav9hGBVegpXWipWeEvqnhT5896
 nfE8FxM8tnkaGKbGheVrGAAjdIWRl6wXIL4z+kVwKGwaoVkGOV0nR3weVncktHAHf6lK
 DEuQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8vpyIo8ijYI2h635LT3iICyuAU9fzcj7SpKLMjZL53mFNcpQVKk9TQQwIR/OlQQZEzfwImf/lpxA==@nongnu.org
X-Gm-Message-State: AOJu0Yw2MJcAwlGUgaPqcN/bpgJk4g4XDMkBz7+UjAwVSVCNJr+CXc3S
 XpcX/zhvUXLKl4VymsBdiZmPKHFtRAaE01X2sAkr2qUMxN3GL56mrermnUAKyfyafLo=
X-Gm-Gg: Acq92OG9tN5pWfMAlnhnR5ClA99CJO2kQMxEgrdfWu1Kk8KFrxPAZZatx9QfL9UK/GI
 sjnU2JK6l9OO7QRo9hoYtu3vEK/1Hy9i3BXRhfzqvgMQWSyrkTVI/jlE/iW9BpvuZ5v+Vgxq95M
 PgbeRBbR6y2QTaQmUDVjZzOdIm4AzVja4ZnJJqglTvdWz6xsUO++rLKoYtbKVKBVzJHx6WpF075
 Fr3Dc0BEXdjTF4kbQ0FQw7sIDiE+D2BGyVNunM9whN+aayviPlGhfF4+B+C2LFAsEQIs3Ew58dx
 OQQCtC6kWmVVADdr+/bd1frwy+YCW11ppFO918EFA32PTztzbqm8/QTO5v25uib4co4+PsghEhY
 9gg91REBIMZshyK32pq31RbCmVqzWwblRS7j/4qeP4Vmvc1pYPP+Btf5TNFcchCaYDQeZ55V+Hn
 8LCRKqYMQciUZahekyyW1N8U5Wc1m/VHT5bnY1Wg==
X-Received: by 2002:a05:600c:4f53:b0:490:7136:ad05 with SMTP id
 5b1f17b1804b1-4907136ae08mr219106955e9.31.1779982495070; 
 Thu, 28 May 2026 08:34:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:f5a7:372a:ab8b:3c01])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909298d41bsm46514785e9.11.2026.05.28.08.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 08:34:54 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH 0/5] target/arm: Add aarch64 GPC3 bypass windows
Date: Thu, 28 May 2026 16:34:35 +0100
Message-Id: <20260528-jmac-gpc3b-v1-0-d34c46c5069f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAItgGGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyML3azcxGTd9IJk4yRdQwvzNMsU8+Q0g5QUJaCGgqLUtMwKsGHRsbW
 1AFgCkvhcAAAA
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x32d.google.com
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

Adds the GPC bypass windows defined in D9.2 of the Arm ARM. D9.8 (the 
APAS instruction) is not implemented yet.

A large part of this is testing. To test GPC effectively, we need to
check that memory accesses are causing exceptions, or not causing exceptions
as appropriate. For some tests, boot.S is altered to record certain
exceptions and continue executing the test. An alternative would be
to use gdbstub to break on locations inside the vector table and continue,
but this requires significant coordination between the C test binary and
Python test driver, so has been avoided for now.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
Jim MacArthur (5):
      target/arm/cpu-features.h: x-rme now means GPC3
      target/arm: Setup new registers for GPC3
      target/arm/ptw.c: Add Granule Bypass Windows
      tests/tcg/aarch64/system: Alternative boot object for exception logging
      tests/tcg/aarch64/system/gpc-test.c: Basic test for granule protection check

 target/arm/cpu-features.h                 |   5 +
 target/arm/cpu.h                          |   7 ++
 target/arm/helper.c                       |  19 ++++
 target/arm/ptw.c                          |  50 ++++++++++
 target/arm/tcg/cpu64.c                    |   4 +-
 tests/tcg/aarch64/Makefile.softmmu-target |  22 +++-
 tests/tcg/aarch64/system/boot.S           |  62 ++++++++++++
 tests/tcg/aarch64/system/boot.h           |  14 +++
 tests/tcg/aarch64/system/gpc-test.c       | 160 ++++++++++++++++++++++++++++++
 9 files changed, 336 insertions(+), 7 deletions(-)
---
base-commit: 2db91528542672cf0db78b3f2cc0e22b36302b38
change-id: 20260528-jmac-gpc3b-187f9d7cf0dd

Best regards,
-- 
Jim MacArthur <jim.macarthur@linaro.org>


