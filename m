Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54233CDB47C
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 01:52:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcZGB-0004om-4D; Wed, 24 Jun 2026 21:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZG8-0004nP-Pu
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:05 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcZG6-0008QY-Ff
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 21:52:03 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2c7f1db3ad2so3448855ad.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 18:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782352320; x=1782957120; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yMcw1k1S+xo5e7vFUSDsLh+Ut7vpYHDTd2ELVDievHM=;
 b=T+ebLppU41xrkbZcVsfwlgzxF1XrhogVFsZrozuHPuwEau9k2P3ipEJ6WusWdx/FIL
 qbz+IjkftzXXzOuJZUUauGpvcQXBRQazo/XbbMv6ysU9PqR8Lk8lJgj/dcoxqyICXa0C
 n1+Ldf7Zd1ADNJnLXeOAKC+/rjxyPD5+0jJ2whGfMBcMY8rv5+OFAw8zj8dLj31UOco/
 MOX2TmFbH9P3hnZ8MwF9cKy5JWGEz6fHh1bairteQUXa86u+KfC1rvsr2hQO4s25lHN5
 odJuaFwrQVe/zZbXx9NewYEpL7QVIg42WCFi2ceGdinvIcD+fO1uxhhMsg/eFIXuDJcJ
 IFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782352320; x=1782957120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yMcw1k1S+xo5e7vFUSDsLh+Ut7vpYHDTd2ELVDievHM=;
 b=Rgn/5+z8psnB83NpJ3QoPu1z3wKTizzOOktoLyKUyhEha0jUUJYrMe64zSzSjHnU8B
 BFoGdJYi5JNRJKCoFdVg5a5XTpRgbPsbnY9tbP/kVBYI0+aCHGVxaLiGOLfvr8cEfZ7W
 McGgp/WQ88itwwTmpIS/t/mdHFZsrvJ13kRS5cW//f9fAzNNkmPLV3v83kRd2XzMusi5
 bg06JiKa2aPCRDZ5Slils6TTBTc7AfZLoly6Pg5Stn/qVfpg2JdxL0M6iPMA4h/1WxCy
 XPbREC0zNPvqZbD/iN8W3f1Rb8ENYtPO34EWieVZH9TJ1db7gE82s/saMSN2MDJZ1ICa
 /GPw==
X-Gm-Message-State: AOJu0YwG2ua/dF2j+4qlwMP9Vl8bY9XtHpgxIh5ITKORjDDYs5HQxaYg
 5cAgZItWPPizF2Um9BnJjwXWUsvdylMqbytQQ+0MRUeJQjS3X9j6ESkabir7GTWbW72Y8F6nuU9
 lusc1
X-Gm-Gg: AfdE7ckaH7bG8lXb1oZ0ZK2emV5m/95N0eNr7cHhDyN0KYUhF8W6GNXygVuxdcWiuBv
 rId2B8CnjhhOXLhUAlNUqOCaOK4hCuxw6NMm8UUtQWABj2yQQCIda26s95n7qaE5PHCR/fZYQgh
 wL116jllbYpRfBgYi//TqDNYPMmNf3CBPB2aS00RbL3V+9ITV9ZFX0oWj2MShpHfJh7+B2owOX8
 z7qeJLKB6ZyrlA98jVuo/2ylM93D9PLBCA3H6KjHZ25cLk9Bu2rQV2cbGLDBzaMwPPQuRBW1O/W
 GtBRAut/hFsrOj1gZNEluAv8urtS0EOVmxuC2NTqssH2j655x641CpZ+r5XXYKz7hHTVkFjgmzo
 IYHyuYyaLRutIqMx8NLEZ79bbwShgWyKK1CSPQXVSdhjMswc4bqge/uOP0yJXyn7AuJyxenGLoy
 YNo4Bifi3CjtcljgxamLKEfpV2T1rcOD1XsJh+8j1eF7vI2bjXwg==
X-Received: by 2002:a17:903:380b:b0:2c0:b6c7:227e with SMTP id
 d9443c01a7336-2c7fc7097e5mr6229705ad.5.1782352320358; 
 Wed, 24 Jun 2026 18:52:00 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f5ac8908sm9060635ad.8.2026.06.24.18.51.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 18:51:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/10] target/arm: Implement FEAT_SME_F8F16
Date: Wed, 24 Jun 2026 18:51:48 -0700
Message-ID: <20260625015159.719300-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Another minor feature working toward SME2.2.

r~

Richard Henderson (10):
  target/arm: Enable FADD/FSUB (half-precision) with FEAT_SME_F8F16
  target/arm: Rename SME FMLAL/FMLSL patterns
  target/arm: Implement FMLAL (multiple, multiple and single, FP8 to
    FP16)
  target/arm: Implement FMLAL (multiple and indexed, FP8 to FP16)
  target/arm: Implement FDOT (multiple, multiple and single, FP8 to
    FP16)
  target/arm: Implement DOT (multiple and indexed, FP8 to FP16)
  target/arm: Implement FMOPA (widening, 2-way, FP8 to FP16)
  target/arm: Rename FVDOT pattern
  target/arm: Implement FVDOT (FP8 to FP16)
  target/arm: Enable FEAT_SME_F8F16 for -cpu max

 target/arm/cpu-features.h        | 11 +++++
 target/arm/tcg/helper-fp8-defs.h |  2 +
 linux-user/aarch64/elfload.c     |  1 +
 target/arm/tcg/cpu64.c           |  1 +
 target/arm/tcg/fp8_helper.c      | 58 +++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c   | 72 +++++++++++++++++++++++---------
 docs/system/arm/emulation.rst    |  1 +
 target/arm/tcg/sme.decode        | 66 +++++++++++++++++++++--------
 8 files changed, 176 insertions(+), 36 deletions(-)

-- 
2.43.0


