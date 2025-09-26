Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA38CAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 00:12:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1w4B-0002Is-Dt; Thu, 25 Sep 2025 20:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1w48-0002Gs-HS
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:12:02 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v1w3t-0005E2-SE
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 20:11:59 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-279e2554b6fso13298905ad.2
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 17:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758845496; x=1759450296; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Qu2WawuNif6cwXABrQIIkgvEB/+OsY6QuECYBRRDHsI=;
 b=t3pL7xhvVMiFEkSNxCx10f4W2SwYxcLqwAaR6UUFR2nZwsy8KI7lnDN+ZqBM8Lyucn
 PzX+nK814NVEekTZ5XkrAz5fqL0GI5gL0hQcA5gglR3NKWbzKsLxBZjf1dK3Op67CV4Z
 jJ6katwEnbYCtW/wbY5FmtdcFlfMWGsoxTImMqqv23aVGDO6a+0lJMEvZT71WjMytOwd
 9oG2Jy1Vs9646kWxfccLNHJM/5ZF+eeim751Caw9Te9BGlFl345xROBTIW9ZF2k74cDO
 xd8k42wAJ7tkZEyfMFcSk0/ghOVatbeW2yesVi6oY0iK8aJ+/hQ4NxgHS69WhX2ATuYg
 SsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758845496; x=1759450296;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qu2WawuNif6cwXABrQIIkgvEB/+OsY6QuECYBRRDHsI=;
 b=cL7W8wSetwZCEqrIyVUaRyiIhLLjq3kiL2QTCgXt+cKEhkZcA3L8g24tAZHw8p3fSG
 Dx226B0MfvJzT4R/q5ENi7LONFvZpoZEXNxg45Q9O1aeUIiDc6xqeNiqs3C5PJlFlHdq
 /rCjavm941thEofihIhsExYbi/1OOCIH3GzPXsgm63n1kivGWwtCy+zLNARzWOCax+zq
 1oEAHHbiO1IqLDdtXBnGZh3l6oohGg9jqPY1hvAvGxIqZAT1MUbGtM3Q0285Hjjh39PW
 Y2A046iiPv0USnGKyF+yYQztOve1AM+9SUFaZ3Sgzclg2lUgZyRn1vM/CWrkVqb5Y1uZ
 Yrjg==
X-Gm-Message-State: AOJu0YynY8r0iDlm5twioxwsZZ89cv1TBaf1Ndw/DJ1Nz/s09KNc61rN
 ggwu9BrZ/sqMc+MOWIkf0BRY4z9b4brwUBT7ftQcZ7s3Xy2Fu8NSRq4cXU5Ytfj4l9g=
X-Gm-Gg: ASbGncvaYIbcutmObLwVJrxCgcZKv26BB/XSH7OXy7jBdnt0oBmgHoWoqK4b1GdkdKi
 EIT2ydMSbC1ehgDasgZLy8tvGwGJ2Yuj3YlN+vGZu5yJ36WXSh9BP5iGFSoL6pUGb1MqeJilPvW
 VT9mOikGi8fiJWb4xGPecZZpYFDN98yxOmaQ5A9ewL41Nk9VJWwYEwb9fiNsQiQm2b56tAk6VCg
 3iU6tcXGphrj5bk5m+6gHmbz/0m9prGgAy9UCcb57t+cS1q5cbCrhMcUjQsvanjXmog6k7Mm0I/
 dSHCqhe+rCH3kwjIxCZpaKHMduqfJ++GjFSZZ2Y6OfP4B3PaANzwiQbm2knWQnON8Dmhzw6k9Kr
 Qcb0tRkmz74zQ+Bf0gQE7J+uMfVw+
X-Google-Smtp-Source: AGHT+IFj9ZJbFTtBMtZ7xTa+VEKyNEYLEK8bztJqTsWfxwlkmY3+yCkQRa4ivUlYNJN7ikvx34rmOw==
X-Received: by 2002:a17:903:3c26:b0:24c:e9b8:c07 with SMTP id
 d9443c01a7336-27ed4ac323bmr65721225ad.43.1758845495881; 
 Thu, 25 Sep 2025 17:11:35 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6ac37efsm35829425ad.137.2025.09.25.17.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 17:11:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/10] target/arm: Implement FEAT_RME_GPC2
Date: Thu, 25 Sep 2025 17:11:24 -0700
Message-ID: <20250926001134.295547-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Note that patch 4 will conflict with patch 5 of the FEAT_GCS patch
set, and I'm inclined to think this cleanup might go first.

This is otherwise a reasonably simple extension.


r~


Richard Henderson (10):
  target/arm: Add isar feature test for FEAT_RME_GPC2
  target/arm: Add GPCCR fields from ARM revision L.b
  target/arm: Enable FEAT_RME_GPC2 bits in gpccr_write
  target/arm: Add cur_space to S1Translate
  target/arm: GPT_Secure is reserved without FEAT_SEL2
  target/arm: Implement GPT_NonSecureOnly
  target/arm: Implement SPAD, NSPAD, RLPAD
  target/arm: Fix GPT fault type for address outside PPS
  target/arm: Implement APPSAA
  target/arm: Enable FEAT_RME_GPC2 for -cpu max with x-rme

 target/arm/cpu-features.h     |  5 ++
 target/arm/cpu.h              |  6 +++
 target/arm/helper.c           |  5 ++
 target/arm/ptw.c              | 95 +++++++++++++++++++++++------------
 target/arm/tcg/cpu64.c        |  3 +-
 docs/system/arm/emulation.rst |  1 +
 6 files changed, 83 insertions(+), 32 deletions(-)

-- 
2.43.0


