Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C68D33980
	for <qemu-arm@archiver.kernel.org>; Fri,  5 Dec 2025 15:11:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRXSr-0003eL-Pf; Fri, 05 Dec 2025 10:11:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRXSp-0003cI-Vq
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 10:11:20 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRXSo-0001Ri-I9
 for qemu-arm@nongnu.org; Fri, 05 Dec 2025 10:11:19 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so30559375e9.3
 for <qemu-arm@nongnu.org>; Fri, 05 Dec 2025 07:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764947477; x=1765552277; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lnP94QzJYdcIFYVLamZVmYmkVOkYawK77F+QBWnmxK8=;
 b=y7nbS9u77uVWp3ekW62zmEIVqZWlCkm5CRkDl58pc6tz+PNrFRlgg/rKs2RBaMXlFy
 3MoiG61ng1w+H0PghmzP6oSBLCeNJAbKsEPtBNEzA00G5IZ6UEVYp1XnSf5MKzkqBDdX
 IIxqOn2ZTf6wlh+RLWdHZfWopdaht4kP4A0gEAETlulatnPX1HZDmajSHr1h8pt+T25i
 HgXIfVT960DATuDp7qfx2fuY3+cxYfxzja+6u1jSwviG/8JD0YvZJJT4Q2jbIhxRgGGQ
 EdJw/mpTKyE0D1LXLZ2Pp/xvabIWjkpgU/TQVlk4Auz4Lq89qqmB0DuZr6zGdM2lJwfN
 Jffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764947477; x=1765552277;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lnP94QzJYdcIFYVLamZVmYmkVOkYawK77F+QBWnmxK8=;
 b=QwAAnuGIzYTAnS6Ex9Lpq/f7K5PREVKUtwOQwdYtXB3Sb3W2tCspbqeIk9C1CdYnLH
 T/CuP7OsLhVfndRrCWV5x8azDVBa33vMZcipWj3/7B5y9gaiJZfwyNTScqjtAemcAml8
 Ir8ECTzQ12FQbqyesm/PIsgKVfnYLlRBxq+sYs4s5wLPbS0m6n68ZCupsNlk9twoPuZq
 wTELLO4m49Ydd/+UhcgvuDN0x6AUkg9dfMhxjvP17tfSwRYKKx4oOGKR+7UGz6fpCNgY
 mEjoRuYxl2Zn2Dn0+vkpSHd0FvUFKPs7Fyya4DxP8YxDSFHKe9Gu6ljb8WRWvJa1LLaY
 MVfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmIa2+ZP4YbHTAQbmfF1cFene5Y2wpew/om/Wtn0lH6/lQePvCaxshNgs/jiPYezn2YURs8+7PUg==@nongnu.org
X-Gm-Message-State: AOJu0YzioadLhQEDkd/YKIgnoa9wdIwBonS0cuYm9woki34BIxGBiuBa
 pe5qJY5GCG3gZvnP7usEQu5vHHm5l3SKBLMKWwrniO1y33lWwkL5T5M5KhNSbsye/QQ=
X-Gm-Gg: ASbGncvYx0iSYo2Hp0g5ZXieG+c7M5vk6nEi+OZPVhVSXIXnMWsfX3fTVeqhSoCvsUi
 iNZSrihKQLFiOOXLtgXT1IE6PsKwJweDq8rO6NvQIS/nC8Lf5dJd1HlusomkPq0OtFlg4/2OQAe
 Glb01bMLK/4xo1DmfcPwod6T2MjM3lqq1NlHG5lb7k/ZapOdExGqHBUAGLM095TTEeHTXF197Qv
 i2SGoyYp5ZCkxMxjJUISdTMLDiaLarFgsKF5xPEImQGXv7hg5b4xxVbqEciFQSsiIHIJPsc+FBd
 r/jOvvEUrZPQe7I0oVB0vf9XFQrv8BiqkHpbjbmxV5RojuHLvF9mQVYQgaiqGoWezKGPSy3OnyS
 GRH6iMa22rNxpRB0nwoRR2uUNM8ee6aHyaJzjetDxZxeiZnqwaJwyqDZZaUz599N+mTZE5r0Vju
 I7aCpV06uJhP8=
X-Google-Smtp-Source: AGHT+IHrxzncpq3CW/62XHFieacCMbuk0+0KP2h8agiE66SoYcxvX4ST1TBTglUXgS1ET+1INfImNg==
X-Received: by 2002:a05:600c:4507:b0:477:6374:6347 with SMTP id
 5b1f17b1804b1-4792f38659fmr63409225e9.22.1764947477022; 
 Fri, 05 Dec 2025 07:11:17 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792b0d5e55sm95237475e9.2.2025.12.05.07.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 07:11:16 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5B88A5F7F6;
 Fri, 05 Dec 2025 15:11:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 0/2] target/arm: fix for hvf regression in v10.2-rc1 (#3228)
Date: Fri,  5 Dec 2025 15:11:13 +0000
Message-ID: <20251205151115.2035930-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

Although bisecting indicated 93ac765076a (target/arm/hvf: Keep calling
hv_vcpu_run() in loop) was the culprit I noticed that using gdbstub
would get further in the run due to the enforced syncing from being
debugged.

As far as I can tell the kernel got confused by contradictory responses
from PSCI while booting up and then never recovered.

Please test.

Alex

Alex Bennée (2):
  Revert "target/arm: Re-use arm_is_psci_call() in HVF"
  target/arm: ensure PSCI register updates are flushed

 target/arm/hvf/hvf.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
2.47.3


