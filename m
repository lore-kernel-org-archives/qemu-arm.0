Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BF8CCA470
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Oct 2025 00:11:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5Yom-0000Ee-By; Sun, 05 Oct 2025 20:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v5YoY-0000Bd-T5
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 20:10:55 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v5YoW-0004Dr-KX
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 20:10:54 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-77f605f22easo3612657b3a.2
 for <qemu-arm@nongnu.org>; Sun, 05 Oct 2025 17:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759709448; x=1760314248; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OuS7+ZKbuBk4SP5WM6xYOzaowjiA7XoTY6cu4+HNTpc=;
 b=JwYtd9PTusXMXW1ekWHIw7W2diwdtMUQiJj/nfiijq7QekpabSCQmBRSf73TcdjUcV
 XZMcwESRIT141iBWehSyG+JK4rafqQTHU8Q0oPMrEzy7P3ZMLACDa0i2XzlTs7pt44Hs
 SoLTEMcOcL+VLoE6Lvtx3qjM44aGG5qUdHrlLoXf2vj3oPz4i7ddUwl2bOW/DWojBdGf
 m1vDHFnNdHfT3IWlYiwNzR83HDaeKVf+dwNagntg02NMtoda7g6VkI+K0lGsPzJKJH+d
 gYc/xg8jV74PidHjYqlCcTMAFXtqXnMxR4RXE/lgoFhE3VTkeIYMqP+SjV3svDv1masR
 AChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759709448; x=1760314248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OuS7+ZKbuBk4SP5WM6xYOzaowjiA7XoTY6cu4+HNTpc=;
 b=fi9AQg3glv73rvKOHGIOkJ5L1tgTm9lk96ZgEysnzfVycB1H/53c0AVxJcd4Qvk+Cb
 rA4CVv8tvCyJbCoyuc0iZMg9AZYi41SPohbaOnbzpiiNFNA3kGOTyopfDmUIBgxCLL5O
 Pi4jskvQxWjuxb+f1bDRqtqc2nVG/VlT7JwV/YfW8Xx+RY0qQwElb60FCNbyFF49rywB
 xYwLmorI3rVanlzAuE//08GIpgo9dGaq1CluvOP/wftUXebATlAq9M9mv1B7ZD7NNcus
 UHSbYQaNJbdo/bswXkxld6kSceMEN8jvHkKoLh3rvjLzQEQFPtUNsKZ7+1YiePr0Wk+y
 dcHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ/uTAJOMRe5vgoAY8czG1Z8NtpI3D6e+ppkNcVyN/7xDeqeIhgZx6c1ZIpnDLonAN1Rbm5dA4yQ==@nongnu.org
X-Gm-Message-State: AOJu0YyEJj6LLQSicYkdSfc9PXG2jp8aYlHy6iZYo0+hVVI6k55+gIHu
 w03bw0zzZVzr7EWebnZwoLp/qNLUPTqr0bD96J2iox/3NTAAiMkRug7fRRdQnR92v/k=
X-Gm-Gg: ASbGncueB5gvEmC3skijIQA0tLTFIh3HCwS8puXmy2bNePnEak7jJf1OicOUmnyy74y
 sQ9mxM78TIhQYOVBqGvOxPY2nDI1Bh0U972LHYu6EmqN59Ae1V/O43IQPZ1R/33AWMLU/i7oVt6
 ljwTNxEDC4vYVjLh6H3/2ynWYfU3849IBOJVcAImYF3yqJtm55A/4XHfqtytHD/e1gyhZ9SAoqJ
 ZSI3pHMo4tqZfSMibWHYB/XfBryYuGRHjMBwS8frcI78wyJhyO6Bwr17G1BtjtYQNMz+jkp2H8l
 G1JBIw1CTomGYUtwzI9SrxVlLf6csTk8F4+M8pIJfvBOSqYioMjjrljyiudcs+eGKSwZO6NFtu9
 Qbt1PZ1bdnypQJb/ErCQcMaMitJhwBhhcH8ACc8qxMyL2X5T12gz/qW9M
X-Google-Smtp-Source: AGHT+IEyarihjdgmKFJ/vIIUmuIRZG6MmBWTkimtj9qZdB8dyUT9TO5e/3FZ6Cm0kQC0P2NTkteafw==
X-Received: by 2002:a05:6300:6145:b0:32b:7334:edcd with SMTP id
 adf61e73a8af0-32b7334ee86mr10626906637.60.1759709447989; 
 Sun, 05 Oct 2025 17:10:47 -0700 (PDT)
Received: from gromero0.. ([186.215.59.111]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-339c4a48584sm8804881a91.23.2025.10.05.17.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 17:10:47 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH v10 0/3] target/arm: Add FEAT_MEC to max cpu
Date: Mon,  6 Oct 2025 00:10:15 +0000
Message-Id: <20251006001018.219756-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x42c.google.com
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

This series adds support for all FEAT_MEC registers and cache
instructions to the Arm64 max CPU.

It includes the FEAT_MEC registers and cache maintenance instructions,
but does not modify the translation regimes to support the MECIDs, so no
encryption is supported yet. However, software stacks that rely on
FEAT_MEC should work properly at this point.


Cheers,
Gustavo

v10:
- Addressed comment from pm215 that registers with opc1 == 4 or 5 must
  actually not trap when nested virtualization is turned on. This
  resulted in one additional patch in the series:
  "Add a cpreg flag to indicate no trap in NV".

All previous versions of this series can be found in:

https://patchew.org/QEMU/20250727074202.83141-1-richard.henderson@linaro.org/

Please note that the patches related to FEAT_SCTRL2 and FEAT_TCR2, which
are prerequisites for this series, have already been merged into master.


Gustavo Romero (3):
  target/arm: Add a cpreg flag to indicate no trap in NV
  target/arm: Implement FEAT_MEC registers
  target/arm: Enable FEAT_MEC in -cpu max

 docs/system/arm/emulation.rst |   3 +
 target/arm/cpregs.h           |  11 +++-
 target/arm/cpu-features.h     |   5 ++
 target/arm/cpu.c              |   3 +
 target/arm/cpu.h              |  10 ++++
 target/arm/helper.c           | 109 ++++++++++++++++++++++++++++++++++
 target/arm/internals.h        |   3 +
 target/arm/tcg/cpu64.c        |   1 +
 8 files changed, 142 insertions(+), 3 deletions(-)

-- 
2.34.1


