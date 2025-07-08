Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3290C83F09
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:59:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFDq-0004pH-3n; Tue, 08 Jul 2025 16:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZDqi-0006zN-Rz
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:19:32 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZDqX-00085v-1U
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:19:21 -0400
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-4a8244e897fso62161451cf.1
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752002351; x=1752607151; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Iog2nVQpBw7PFq7mrKKwTZuIXqsUwu2tqK359EKUuhE=;
 b=qtbzeG9kVRQxwuJZDRjCX++aCsiCdhTF2H+h4R1mhAhNUTAyANfJ5K12PSjxE5FXA1
 q8dwt2SJufhZkC/zqf1HfF/sbjRcJWKVXICGO2CT4E8r3/776ikRKhPmOD78rLfL6mYt
 k3GTaG66cPMUVvQEbfTx4Y24o4OmwGXYdAtaG9fmsaQaqS6Ez+ubIUcH4Q+KGp042NAP
 76QK9q72vQInemWKS+HnK9ZagSI9RQblGrFDqLj+rpK9Aerh2qKbSItVpLTdP5c2/J0Y
 fEy9XGYcUpSy98ucW/ViDsq9mKbkDdIsWnn+5Mfcqc8C7RwAKO+NkUkk59nCtgZfRYwg
 X6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752002351; x=1752607151;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Iog2nVQpBw7PFq7mrKKwTZuIXqsUwu2tqK359EKUuhE=;
 b=Fbe2Y7OJG/jAb505mvY2qBkQifX0Ql8i+aWDDTcFlHam8P1UmRut/eQ3wPvp/NeQde
 fNwZER/5JW9bI2cDXsdLr0bVmT6FIkcpNPTvEq1qRVLKnM8TSQl0o86yZOPoVmcOSfqr
 cACw/bUCPDmZXnoWkuDwyjxcJhQZgMl3IQQoR4+625HPd4HFZFr0Xc4RV7lunLqB+qzH
 OA4/Mm7E9jTQmUYjgC6tQ7Cl9/nih1qm0zKGj9PptyU2TlCH+KRFaOuTGrFHkZJTya9l
 dlhNkOZwNt/qbxBuVd6qxHGsQbLATF/4VrShLnzak4a8Ob589OoZ7Z4Lqj34mwPGLuaW
 GUAA==
X-Gm-Message-State: AOJu0YxzcjoXiX5dfb1Aw5v66DhcCW6+94yVRACnEN+aoRfsoLUbWSRr
 e7+tB8SIgrS+uzV+Z1VefFr/lzqsOUW/epOyYRQDmFiqJVfQwG2Swy8aGhw+/awnCeAWlaFcqnE
 01pRd8fY=
X-Gm-Gg: ASbGncsztih9TslDmEcBiyAtPtLdj3QWYSKLJAsMDDHjkqhIo4HMMEbqi8FYZbpp9YQ
 ywWUqnbJ99g8OOHZkZme2FZk6+XLJjHWlDbZUx5ZFLtJ6PlfmgIB97UqQixfaFO6+F/B63sWB8N
 mjSR7TpQbVn/Bu+6vmKV9lYuygtEBFhwFXkVpFlb5hY1/jBBJd8QOK5aRu5iYEGDT020w+ou0lm
 MISpFoHPBA6ckbbe2/nZ9zG1rWApSHX+kide4GCI08P/WtKkuKIPS/2i+2V4UJTPCN7oWAGRXJy
 0uReS4+eIb9B98MgGfFXFkqr4yhCA/mY2t33ib8JM952zrdZlQ+2OEcZL5amSwZdsvI=
X-Google-Smtp-Source: AGHT+IHxpoD0LXr571Bfzf1m0/g2v7YaYXcdnr48tz/6VTLQcTkF6K3IaDGn4TrvMd1516NrrzpJqQ==
X-Received: by 2002:a05:6214:4009:b0:702:b28b:d4c2 with SMTP id
 6a1803df08f44-7047d970358mr65298616d6.17.1752002351291; 
 Tue, 08 Jul 2025 12:19:11 -0700 (PDT)
Received: from gromero0.. ([189.110.24.38]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-702d638846asm56289096d6.22.2025.07.08.12.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 12:19:10 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [RFC PATCH-for-10.1 v3 0/5] target/arm: Add FEAT_MEC to max cpu
Date: Tue,  8 Jul 2025 19:16:59 +0000
Message-Id: <20250708191704.1068604-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=gustavo.romero@linaro.org; helo=mail-qt1-x834.google.com
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

This series adds support for all FEAT_MEC registers to the arm64 max CPU.

It includes the FEAT_MEC registers but does not modify the translation regimes
to support the MECIDs. It also does not implement the two cache management yet.

I'm currently exploring possibilities to support FEAT_MEC encryption (or
obfuscation, for testing purposes) in QEMU for the various translation regimes
used on arm64.


Cheers,
Gustavo

Gustavo Romero (5):
  target/arm: Add the MECEn SCR_EL3 bit
  target/arm: Add FEAT_MEC registers
  target/arm: Add FEAT_SCTLR2
  target/arm: Add FEAT_TCR2
  target/arm: Advertise FEAT_MEC in cpu max

 docs/system/arm/emulation.rst |   3 +
 target/arm/cpu-features.h     |  15 +++
 target/arm/cpu.h              |  29 +++++
 target/arm/helper.c           | 208 ++++++++++++++++++++++++++++++++++
 target/arm/internals.h        |  20 ++++
 target/arm/tcg/cpu64.c        |   3 +
 6 files changed, 278 insertions(+)

-- 
2.34.1


