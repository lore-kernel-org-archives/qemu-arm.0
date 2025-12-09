Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E48ED3B7EA
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Dec 2025 09:25:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vStxz-0006lo-E5; Tue, 09 Dec 2025 04:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vStxx-0006jq-J7
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 04:25:05 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vStxu-0002HG-Rx
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 04:25:05 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so38784245e9.1
 for <qemu-arm@nongnu.org>; Tue, 09 Dec 2025 01:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765272301; x=1765877101; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9THmgE9FxGdmnfvfnPpWimZ+vaexgQkKA5pzaXkAXJY=;
 b=QWqo+iPPhSOVN3HsX845ObOOSA6xgBgjmNJ8rgwTclbvzN1laUk+kFP5PwqhesvRZy
 ZyIdt0KoJnHzi59JljHCrP7x+dTCKeODuDlgwQU03nZ3Z50x7JPxFFmtvFDCG580E8p5
 kAbUB+/lHh02gtqvmRW86qb3AkswUw7SmmFJhlmW1SOyQHm4rNZL2FuZvW9DGGiIj4Fw
 Zq+C2cT4dqCW3cEPhNFJHUh6N9dMC2OEKwU//y2w4k6fYqjK7/4avFEEewVaREr7ykvH
 sewlTnYHyZK+bW+Vs3Fz6WW6iH1r4h3RnTFbptPKaIP5SU+aP6lsp3dxszVR/t6ONlsK
 nygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765272301; x=1765877101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9THmgE9FxGdmnfvfnPpWimZ+vaexgQkKA5pzaXkAXJY=;
 b=Banvmva6WJSrQmdEyy3pxMMz4Vxqk41EP+Tnmxj2Eoo9eU6lXijG4yH03hc4mPXgj0
 XQ9EmxU0guQGi0Jx09O/VKTB+yxiQ9RhBDv3QW04sVfT8XBgSfFxCUwWJahW0pYBsxu6
 HiomaQZrNr4hzoHiPJs7RkatVuWUwyPK4R9IKhOYq4rnLldqIGkc41WDSiViFTmono4L
 q2JEwDN2G0Fu/ibQUHnmr4K55cPN2GlRRYF8mREiZDRMVEGrHkchrIokLDRfCsbz7Yiz
 Bx4k/zUu0/UBHNBkaGtz7uZ2jcDTH+VpDEkry5d9jdo073DpaaUD9/BQsKsiDYS+wREk
 RO2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv3ISNaaBBEEExXzpLTYLE4fNrWEhEdY2QqnItxZqY0pbRqPI+YAm+nsqjUJuDmTsVxSXpiPdYRw==@nongnu.org
X-Gm-Message-State: AOJu0YzbQ3PBsJqZTISf1bxEb/poGT0WK3zdtIafNb1yHu+CcN/L1WA0
 ALNtjVziVlTJoxHArvlW+DFlfwshaJMCctmxoFMLDgg37zZBfCdJgpr4IRcQsVtP8jI=
X-Gm-Gg: ASbGncvFrgAx1uXZch16bWOATjUrMCtPXTP/I8AH9dhiVcQoxCG39R56e3DtTDGng/R
 USgn3uopeWxU/lBEEc0DtGY3gVNheGxT1ar6d4ozf51+vIZbSjDDBAGbIQiCg5BlOVp8XWnnSbI
 +buvFanrkmejC9Nc2xwUv14zS9ERn1e7qN9napcaSZJvSUN2laIwFnOgnI3/wA+Nk9AWXl+moci
 pv8jZHiuVP3hEAKj1AX29h9pQAz6pD3EyFs2duk/uv50XIWaZl7wyjIQVWm9QQnfN3pQ/sLmkTF
 UN1gT1wZi5oiDOrFDOemM4itU7VPi9cQScO7Slus4QGJQpRcEn415Es2WWUbbLTc6/QLbG2lr1j
 kPbZMuYGIPvolC+iNL57nnpxvHobKBDQWy/dLly9A099py60wXiQhpBXGMUPxV5uFGFYLmeCjnx
 RNTsHhsJwp15M=
X-Google-Smtp-Source: AGHT+IGkP6Kh0IPnG57RNCUqHZKRmf2oJs0Weh1mxZc33haa0YGFD5V9FDIBMBtGqHJ1U7n3J/te6Q==
X-Received: by 2002:a05:600c:870b:b0:479:1348:c63e with SMTP id
 5b1f17b1804b1-47a7fa3344emr8579115e9.9.1765272300969; 
 Tue, 09 Dec 2025 01:25:00 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7d6eb1f1sm29352845e9.2.2025.12.09.01.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 01:25:00 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7A5A65F818;
 Tue, 09 Dec 2025 09:24:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/4] Final (for real this time) patches for arm - pre-PR
Date: Tue,  9 Dec 2025 09:24:55 +0000
Message-ID: <20251209092459.1058313-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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

These are all bug fixes for Arm including a recent regression to the
Arm HVF code. Last chance to object as I will roll the PR later today
once Richard is online.

Alex.

Alex Bennée (4):
  Revert "target/arm: Re-use arm_is_psci_call() in HVF"
  target/arm: ensure PSCI register updates are flushed
  target/arm: make HV_EXIT_REASON_CANCELED leave hvf_arch_vcpu_exec
  target/arm: handle unaligned PC during tlb probe

 target/arm/hvf/hvf.c        | 11 ++++++++---
 target/arm/tcg/tlb_helper.c | 21 ++++++++++++++++-----
 2 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.47.3


