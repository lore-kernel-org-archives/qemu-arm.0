Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCA8C83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 17:08:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubMeW-00020R-MI; Mon, 14 Jul 2025 13:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ubLZr-00032Q-38
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 11:58:54 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ubLZm-0007mz-Ub
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 11:58:49 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-748d982e97cso3850079b3a.1
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752508723; x=1753113523; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KMNWfHsHfT7JS3J16C37mYApwqHr9KmhSe3YnGv0CSQ=;
 b=Ocwab8skVGMKSzObzKQ0wd1BeRAL5VaperGSCAL0zSRcVAn5v/uzN1cNm47aB+V8Dt
 m05Jr3JcLoYgPoAi8j6ZbmwlklfKSJlpd6xUi9CmdYqsfX1xh9E6bUgFKt8+M5VjSmW0
 p1f2T08lRs/Je8GJxpgiKBRYJQH9vmcAKENy5ZKa81bZUwoxB7/OhgHjccjqnorhXPgX
 YOsDSYzrM/z1BY6MoQH11dJkZNqffpgvp01dPqiXat9i25+QKbq5hNz+I7UiNAxXAs4F
 qqpV9WVekLO6u5f7jdGf2vmDnrboRPkiUD/crRTUTOlyiW4vRvNWOENkseYnHIhsWVMP
 mIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752508723; x=1753113523;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KMNWfHsHfT7JS3J16C37mYApwqHr9KmhSe3YnGv0CSQ=;
 b=ClC4iMo7afg3oe0DMTjHN4mM/sS4PfbHXw4ni+kPcV9abVySOeRK38/OWQ2jr3ZCE4
 Djm+/gIEoxj7FVmD6NzBBhESWlMpKEx9NU/6L7yVTiMgs9jbOwVueXElmaXYZxDTv0QO
 AtRqO1+atTZC5oDxvRyeJFFcfmzBe8te7BKe9ZoY13oujer2Amv9Ez5b5u8JpkCOHu0J
 urq9d7gXbvurHo/QJvKArlS6jWpbTN1XdC1qi3cLwX/hul9w7RS2vts7I2Cdkbk3d03m
 tgb5WRx0vhZbow5Ag9ZIkO02kBSC2LoLfvvzVC3q7zfqzMjTYTROVG7/SPBHNHOsZWcN
 FPIw==
X-Gm-Message-State: AOJu0YxFc65Y0g/HcAtFKu4rPXPVkOzzQ+eydUvkt9e87p+Z0trl8tYj
 GUKA5SqbUT8+hTBT7JTJ/FM1UKBRMfl4hiOU5+Wgu6iqrGVud5MbRXXqrTb775fnFR4=
X-Gm-Gg: ASbGncta/8GHCq7LEs27WpWqbJJ1FANmhlMKjtqwUh1/t6EBXZU9JjmtbIDiczZBp6O
 61kldxyYq093495DIw2d7vww5D8lojD/dlu+OnmloSFlVyRk2rP672S1EevrdIVhxz9PZhnkV+X
 pCcOY8Qji1CCijdCiPwXCuv8nInUlMfwRNjW6bKCZh6yZEBUcZ1DXWBmHHY93N5Br07t9iP0L0k
 cW/EKioKUQH21ceiDz9AaHCP3DynpIXNjkVpxGjDrNlkIh/+YZCDJAuZMRzC1UhBL+Z4rCIEHPD
 n8ea65W1P4sbBF2wNXEHdwqXbpSzPiyfFgSSZokf14YrwyJ6ySzfAB+FVvz1PZSUw5IO0hgeDhJ
 WXMSMbd6KZ+Wg1zsmwdXtdgCj7HvlKqGVOzfZo+ia0L4YFOBYZUkj
X-Google-Smtp-Source: AGHT+IFSH1B6XZQUO5yPzIBTQBwyD1679zlSjgnP21Ho9Y82x99QSTIJRSc7gpHTGfpWT+syEXDz1w==
X-Received: by 2002:a05:6a00:6b93:20b0:749:bb6:3a8e with SMTP id
 d2e1a72fcca58-74ee04ae709mr14196753b3a.1.1752508722466; 
 Mon, 14 Jul 2025 08:58:42 -0700 (PDT)
Received: from stoup.. ([172.56.179.167]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f8f24dsm10265805b3a.156.2025.07.14.08.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 08:58:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org, pierrick.bouvier@linaro.org
Subject: [PATCH v8 0/4] target/arm: Add FEAT_MEC to max cpu
Date: Mon, 14 Jul 2025 09:58:31 -0600
Message-ID: <20250714155836.1514748-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Changes for v8:
  - Re-order SCTLR2 and TCR2 so that they are independent of MEC.
  - Enable the SCTLR2 and TCR2 enable bits.
  - Squash 3 smaller MEC patches together.

This still fails the RME tests, because we still need TF-A rebuilt
with ENABLE_FEAT_SCTLR2 and ENABLE_FEAT_TCR2.  Pierrick, since you
have just done such a build, could you re-test with this series?


r~


Gustavo Romero (4):
  target/arm: Implement FEAT_SCTLR2 and enable with -cpu max
  target/arm: Implement FEAT_TCR2 and enable with -cpu max
  target/arm: Implement FEAT_MEC registers
  target/arm: Enable FEAT_MEC in -cpu max

 target/arm/cpu-features.h     |  15 ++
 target/arm/cpu.h              |  27 ++++
 target/arm/internals.h        |  23 +++
 target/arm/cpu.c              |   9 ++
 target/arm/helper.c           | 259 +++++++++++++++++++++++++++++++++-
 target/arm/tcg/cpu64.c        |   7 +-
 docs/system/arm/emulation.rst |   5 +
 7 files changed, 339 insertions(+), 6 deletions(-)

-- 
2.43.0


