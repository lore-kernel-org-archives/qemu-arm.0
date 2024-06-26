Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp922157njc;
        Wed, 26 Jun 2024 04:27:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4MvnhmF8nJj/ocukdbD5IriPa4R2msAtNlZ5qCOwSsFyB1u/9dkLGQ42VNB5wwsbXc975qpylrKkLs92cZEzGDfkbCfZu
X-Google-Smtp-Source: AGHT+IEZ/Aq3SXJv15EwGrWtfEgYMFqx8d3yUjB/3FIQIwEkDNHiXtf0KD7wlZW2N/NTaKqDxJGu
X-Received: by 2002:a05:620a:2a09:b0:79c:d2fc:8b29 with SMTP id af79cd13be357-79cd2fc8ee7mr142692385a.2.1719401225491;
        Wed, 26 Jun 2024 04:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719401225; cv=none;
        d=google.com; s=arc-20160816;
        b=pmd/MsguK1fqXcmRsO8YkY0bzKPUizjXUlQfUqUVyP1MGJWLH61uXDz7pwJCj1f5gl
         hbVaUXeJFjHAQJgV9xIaiarTnHj3VWG4ler6n6wQ9HDtKnvI17F948AEHHZ6SOM9D+RN
         fLSximZQfECophT+ZCsz5I9rstBzhpEbyGu2uGog3sn+lq2FdMbLxzm6EG2ueTLwGDVD
         A9v7JmubfK9UM4BhGvxq5KJ+gQ5YbHIY61tTFgxOhlZgvfgCFop9xJTRLzxGeCS+Scay
         P8//XeonKEoMl/fXbhclkmwbm60dQhDKoOXxI2B2YzzSDrianH6+IOggMMvGzZ07Bsmb
         DXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:content-transfer-encoding
         :mime-version:message-id:date:subject:from:dkim-signature;
        bh=NWLH4ozYjb/RV95f5MT0yvQSKB4+2QLhaUMYHm8xf+c=;
        fh=c2VRnSpESGsGjPrM5rLS4cVnVaUf5QloU0sTPhH1r5o=;
        b=OcOVVtP/uS8g8hrVnpKgrPd95Nt7U8pfevaGy46URwasxCa0Akq6ax6dMcd6qiBHzF
         EHjM/E1N5hPzgBlJEV054Qxs6U3rrrjaMrOdyIhDnv0d/37J8EjMnWYUNUby8sPoq1ty
         cRun1UJwwTQYumu6JMBBQ18rB8LGKVlUJ52UJPJyG+w3ysC0Ziiyugik+Ru3j2xuqQYb
         0fitCtmrwtj3uyNLyXjPY+4HnXF4yG8fYiw0+DmHr+JyWhLhxBxCuT8c03PRPesESOT5
         JZwS/ozalGE/4xefBA+6pta9SQbznpfnndA1OtXcy/KYP6WxVCVbi7Z8reozplCaZjBA
         9Fkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=M4WciZWj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79c0c0deda7si268590785a.541.2024.06.26.04.27.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 04:27:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=M4WciZWj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMQnb-00020M-LW; Wed, 26 Jun 2024 07:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1sMQnY-0001yI-I6
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 07:26:48 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1sMQnW-0001m1-QU
 for qemu-arm@nongnu.org; Wed, 26 Jun 2024 07:26:48 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1f9c6e59d34so54321445ad.2
 for <qemu-arm@nongnu.org>; Wed, 26 Jun 2024 04:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1719401205; x=1720006005;
 darn=nongnu.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NWLH4ozYjb/RV95f5MT0yvQSKB4+2QLhaUMYHm8xf+c=;
 b=M4WciZWjL5pa/S99wHm4fgMh4FxljdTpwg2E+6Gwe5xzZJ7QMJoG9rMLZcgIsL2AK9
 cQ4l/XhjmbW9jFpJDr0yrPNobgB/LRWkQStjE9xVs2bjTrIP2NERocY9u5O3d/cb6ITm
 hrb77NqLy2c2PglT7Dt2YHTHynV9E54bbTdEUd11KI7tsCmiMFb7h/ctML6o8FKmLMt+
 hTefoKOTKMOXQuU57JhLPtinjuiEC6V5a7MBxqDPamWk3fjW3CPGPMf7tFgHashYWppd
 M7eceM5Iq9sAepa+g1qC+DLGL9jEwqwSznWsOm4SsW5iVQ7wYK94c7zbn+VaV1HYOAxy
 Jt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719401205; x=1720006005;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NWLH4ozYjb/RV95f5MT0yvQSKB4+2QLhaUMYHm8xf+c=;
 b=D+O9HLL8+ZXkk8RgyU4tnYiv2T9QhlY65Ci4LKJaRayQNPK5A7mH3nQLeLPAgmQ/Rg
 a1xgEMUlMOsJQn+zWhu2Z0Dyi2NbLsj3BhSM5ODsD7mK0ro6hXPFcwIDoJSO1YnVYCZM
 JJMsIN7jIfiDS6TrC9JymSWwGWx1Y3fAn6ZDeBj8ZXitX40cyJpu0rYY1XZMRM0ric7p
 zXr3qr5kg51R7ULj6RE/h8sgaK2SsYOwxt0tDIUU1t5EtG7/y2nBk2H/SqBI2Ps4hlhN
 ajZhqGDWLBPjyJocZi2dm0FUGW/qCR0QP7lI8c7bjUsEr5HKJ3gV+eO26nQB+aLaWl9M
 aZuw==
X-Gm-Message-State: AOJu0YwL3oBKaQvnjUEzx7cwkMVfS5oW8DLznZF740xaDkT7pr929m3k
 KTNvtD5AUquvFrRDbXSptd95hExPrZrwZkz7QyPJbuafmmNTBgQHov97fiSlxdw=
X-Received: by 2002:a17:902:d50b:b0:1f9:e7b4:5def with SMTP id
 d9443c01a7336-1fa1d3e0157mr125544385ad.3.1719401205521; 
 Wed, 26 Jun 2024 04:26:45 -0700 (PDT)
Received: from localhost ([157.82.204.135])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-1f9eb2f03desm97863365ad.1.2024.06.26.04.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 04:26:45 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 0/6] tests/tcg/aarch64: Fix inline assemblies for clang
Date: Wed, 26 Jun 2024 20:26:21 +0900
Message-Id: <20240626-tcg-v1-0-0bad656307d8@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN36e2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyMT3ZLkdN2kNAtDQ7NUC4PEtEQloMqCotS0zAqwKdGxtbUAEDVDAlU
 AAAA=
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aDrrlLxV/c7S

Unlike GCC, clang checks if the operands in assembly matches with the
type in C. It also does not support "x" constraint for AArch64 and
complains about them.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Akihiko Odaki (6):
      tests/tcg/arm: Fix fcvt result messages
      tests/tcg/aarch64: Fix test architecture specification
      tests/tcg/aarch64: Explicitly specify register width
      tests/tcg/aarch64: Fix irg operand type
      tests/tcg/aarch64: Do not use x constraint
      tests/tcg/arm: Manually bit-cast half-precision numbers

 tests/tcg/aarch64/bti-1.c         |   6 +-
 tests/tcg/aarch64/bti-3.c         |   6 +-
 tests/tcg/aarch64/mte-1.c         |   2 +-
 tests/tcg/aarch64/sme-smopa-2.c   |   2 +-
 tests/tcg/arm/fcvt.c              |  20 +-
 tests/tcg/aarch64/Makefile.target |  12 +-
 tests/tcg/aarch64/fcvt.ref        | 604 +++++++++++++++++++-------------------
 7 files changed, 331 insertions(+), 321 deletions(-)
---
base-commit: 74abb45dac6979e7ff76172b7f0a24e869405184
change-id: 20240624-tcg-bf8116e80afa

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>

