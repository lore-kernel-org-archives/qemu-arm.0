Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4108042njb;
        Wed, 11 Dec 2024 06:46:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWLTO1GGRufoF7pAZR1kx7759n1KqVVAqv3yVWqLaD/GhQiVe4m/jfLuGXeifCWxeDOWHAQzjeSYFF5Ag==@linaro.org
X-Google-Smtp-Source: AGHT+IFpci/8cWuXlIe8DwsKCjtC2freszVbRA4t68tMDIaRBD4f9oxvKyb1Mn8RMSJNEfeRdVwr
X-Received: by 2002:a05:6122:17a3:b0:518:a1a6:4642 with SMTP id 71dfb90a1353d-518b43d0e60mr137725e0c.9.1733928380788;
        Wed, 11 Dec 2024 06:46:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733928380; cv=none;
        d=google.com; s=arc-20240605;
        b=L17nN2A1uutKIJYu3mNYZkLAB/WH9/7jNYStUtT2f/sAHHXYmOj6NdMhx8PJAEqQ+q
         iRJZEd0Jnfym5CE0WD9NfmzeiTSrkmKoMfbh2NqUzLr4CTOkmNOd8vF/Eb+mQsSd6OjZ
         xTmeK+INFjTZk9dy0596SlkO0CFsZk980MYmkYHfMrPdWGGVMVbHclN8JVufDwD2kXE4
         2cExLNr1iECC5EbVhT3r6/p1u38B6D41Zi6eA+CYG796YZcNZcuovEU0k5KB+18cDhHb
         6QM92hW6YN9cgOxdyEySIoe5+9d5KUwkGVihqCTs5zLWz3J1DJQWFpmh1pphi8KunsHp
         y4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=LTk+DUe6S9u82GPZ18L5jgV8pNO1K/18JGElVt303Ak=;
        fh=IXwJM6opV3cvetIuapTDNEs70+H769CSd5/z5IdgYRw=;
        b=GkMkzl0sR1q0Ci0iWoFhAYMjnz/dGrYoZev/uZ7ihHc1A/K+2cPk9CivjlppI5khjK
         I8uMOiJi7KXUrxoZnYCNxanfQdV5dBVGfE3sCk05RpcSpJ4tAPBRY0/g3kuO+e4uuEfN
         KQLkdWkAOoGJH2bANLRvp6/6KYV27+P00duRkeKZdffLJvFNHRP4rvWiz2EzHdKVDLd+
         7oxpXFf2lmv3PBy798WTWELDVCIUNLjVpdTILWIoprL7QBdHEv9ZclfpvwJvj/u/CUFU
         rQD1RDA+Y4JHBHOWPnbN8sU5XB75ceUduvx8DSZjvi864ukIYEjQ5F1phNM7JZBafHjy
         K2vA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PC8ApLYS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5161637e24asi2346350e0c.234.2024.12.11.06.46.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 06:46:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PC8ApLYS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tLNxI-0006rP-9Q; Wed, 11 Dec 2024 09:44:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLNxG-0006qD-63
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 09:44:46 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLNxE-0003qN-K3
 for qemu-devel@nongnu.org; Wed, 11 Dec 2024 09:44:45 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385df53e559so4636555f8f.3
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2024 06:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733928282; x=1734533082; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=LTk+DUe6S9u82GPZ18L5jgV8pNO1K/18JGElVt303Ak=;
 b=PC8ApLYSTroI9LelCSgLdqxuRmNYjs9fgmW1mz64WDhesPY4FnUvoVj7U95V6lx1EO
 /N/OQ81j6KfYfqzqFb3TXPkfMFArbTFJ+ONB8VRaEdzHA/rPvJ2hH5liCThPydGlyjlK
 pE+ysPqEUZiJtKnUQQLelBHlAZrYAdt6FEr22iHnKNTK8mNxvu2SqjPOakqf4+UqWjVc
 r6rg2D7KtNBKU34VDEOFHdpobpZs4MwcK4yQw6eleiF3TGNC2Pmze/DZsK5Oz433PPzy
 Tro+pyAIDrAwZx4SEUcY65+khU69DLoGWsO5L3pqE7ntQ89RyH/At/6SoD6zEsOXzAwi
 CKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733928282; x=1734533082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LTk+DUe6S9u82GPZ18L5jgV8pNO1K/18JGElVt303Ak=;
 b=ccLOPnOV80czyvnmKx4iUHcaA3rDm7+KjXDoxhhCiYo7WzlbM/TVWmmzTwZv91V4lR
 QQp8VyPPe/815TANFlWZIazaHV9QpEoPWYWXCMzkrxmvRZCU3cyBHle0jc0vod5+Nwub
 08CS4O0tsTdU+FRiI9c+kM22b7FWDerGb7raWM+gDHJTfQV7JNUHd6AXcK2lrKptouL+
 +g4PRwRrZth2etgq7RDz5h0X9KqPqJM66cKc5O0atp0punyqDA4xewGDYz+vTHA5A6Ua
 Gukmy2kcuXPFC4xVb80DxQE+vnW4r8Yy0EyIvIGdSzd/+L50WX6pnPJx9YuDc1fhypcb
 fzSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWscTrf5MEJQogkWst6X85W41i0rEwO2dWmFXn9W1Y0N0A+MWfglX8bZB15dlqk5n2Bp7AxSKxIzINE@nongnu.org
X-Gm-Message-State: AOJu0YzU0h2TXyPc3J8BbA6/xS0CHfhdSBSNENHDLYPVV0+tYsJfquCG
 H0eZxuWRVRwI8hLhw3TIUz/vX1M9a04QEOkDkjh3K42w5K6X/PQ+DEUQfpu4cVI=
X-Gm-Gg: ASbGncsGuoIM2d7ZcxZ0JbIwk1dDOr79my50cdEh/nLbDGv5IkmxptpQQofkcFa9HkP
 pnqEeEPeaTSLvIO1TK5NfAfGzTmJQ5VFPeGc9vb3RT3wDSyU35yGToDMVoURkeP2XZGPnnB/24O
 e0p1i1CMYzYnHZTyT6BXJVgaEu/+cgSpw+YKwjTUHVS87Rsvx5/52MQ3frZEN/apEPc54dGc1Is
 K2W54aVWYK2F6lMCnPHW2RJJJ+nCjKkAJD1NsEcZ8953R17wedobGuPmvq5
X-Received: by 2002:a05:6000:2803:b0:385:e5d8:2bea with SMTP id
 ffacd0b85a97d-3864ce98660mr1805901f8f.20.1733928282472; 
 Wed, 11 Dec 2024 06:44:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361e54ef20sm19477685e9.5.2024.12.11.06.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 06:44:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] target/arm: Implement FEAT_XS
Date: Wed, 11 Dec 2024 14:44:34 +0000
Message-Id: <20241211144440.2700268-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LfKlD+NxcJCN

Based-on: 20241210160452.2427965-1-peter.maydell@linaro.org
("target/arm: Pull TLBI insns out to their own source file")

The FEAT_XS feature was introduced in ARMv8.7: it adds a new memory
attribute XS which indicates that a memory access could take longer
than usual to complete, and also adds instruction variants for TLBI
maintenance and DSB.

For QEMU, we don't have any concept of "really slow memory regions",
so we don't need to implement the XS attribute to do anything
special. So we only need to implement the new TLBI, DSB, etc as doing
the same as the non-XS versions.

This is a respin of Manos' v1 patchseries. In particular:
 * patch 1 adds support for the fine-grained-trap handling for
   the new TLBI NXS insns
 * patches 2 and 3 implement the actual TLB insns in a different
   way to v1: we add a new ARM_CP_ADD_TLBI_NXS cpreg type flag
   which we can mark the existing TLBI insns with; the core
   cpregs machinery will then autogenerate the TLBI NXS cpreg
   when FEAT_XS is present. The aim is to avoid having a lot
   of mostly-duplicate cpreg structs and arrays.
 * patches 4, 5, 6 have only minor changes from v1 to address
   issues raised in code review

thanks
-- PMM

Manos Pitsidianakis (3):
  target/arm: Add decodetree entry for DSB nXS variant
  target/arm: Enable FEAT_XS for the max cpu
  tests/tcg/aarch64: add system test for FEAT_XS

Peter Maydell (3):
  target/arm: Implement fine-grained-trap handling for FEAT_XS
  target/arm: Add ARM_CP_ADD_TLBI_NXS type flag for NXS insns
  target/arm: Add ARM_CP_ADD_TLBI_NXS type flag to TLBI insns

 docs/system/arm/emulation.rst      |   1 +
 target/arm/cpregs.h                |  80 +++++++-----
 target/arm/cpu-features.h          |   5 +
 target/arm/tcg/a64.decode          |   3 +
 target/arm/helper.c                |  30 ++++-
 target/arm/tcg/cpu64.c             |   1 +
 target/arm/tcg/op_helper.c         |  11 +-
 target/arm/tcg/tlb-insns.c         | 202 ++++++++++++++++++-----------
 target/arm/tcg/translate-a64.c     |   9 ++
 tests/tcg/aarch64/system/feat-xs.c |  27 ++++
 10 files changed, 259 insertions(+), 110 deletions(-)
 create mode 100644 tests/tcg/aarch64/system/feat-xs.c

-- 
2.34.1

