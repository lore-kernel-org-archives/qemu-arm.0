Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65306C83F1B
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 17:01:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZuau-0007KW-Nw; Thu, 10 Jul 2025 12:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZuL3-0003M2-1H
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:41:37 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZuL0-000181-G2
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:41:36 -0400
Received: by mail-pf1-x443.google.com with SMTP id
 d2e1a72fcca58-73c17c770a7so1630766b3a.2
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752165692; x=1752770492; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l9GrNvpLdGNT/O+Q0jz3mfoYwa7XC1RI8pd4LeYd6qw=;
 b=tPDmED5475P7cAtPRasGui2Gh71U3AbOVfs66AJVxLj7jL9QveiL3PrtNGwlgcMqQA
 syMREy/k1CPOpOZO8CaQ289L4u1Dze+bLqZtee4Mdci0NDFsRz4E71ryhJikHNV0QQ8A
 Lg7ANCn/RfjFoyaLfOYjNc9L1O2kQGZWcbdtfLQD+qkxA6vf1oPEuo0qEgtVjre2y6MJ
 fuzcXVqmkzyKGebFNjorfgBTdi4RaAKD0eh+1QRY2gCqfsV9M5a9l1YQhvKOp3HVsWt4
 oc3r7hPVKpx5U7Kc0ln2B0BZH2FucWYY7YWuGbfLIyfK75WpGBhyb1gFM43Vr5ArwOzU
 Zxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752165692; x=1752770492;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l9GrNvpLdGNT/O+Q0jz3mfoYwa7XC1RI8pd4LeYd6qw=;
 b=mhaXtB0/lDpCYOuWDJrwCp/q4LCSSLQaQlJDTG/ZHq9HFzzc73pOM9a3w2TDQzQyzU
 2OkhV7wNyjB+DG1bgVHMuZo9nVTrOq+3+TXkl5tD91BvX5qUZDDgeE+CC6hiEBuhscnR
 O/O++miLNdvHCU1XWC8fxFegbcChgLf+g1qGpO7aoTb5NegngUeC3jXkvMwO5+gFwecL
 zJJ9IPgCXmSb2u14oNe0dmmYtDq9w1JeqCoBORcjaBPH4ty+ymKws6k2buaBMapC7m2Y
 RbQM4mW6x6YQ8lfLcaPMfC70N+DGJnvwcM+lPfaWpGQC//RN120K5KFKUWADRiDVIgjN
 2e2A==
X-Gm-Message-State: AOJu0YzeCYqJzX8ZIt7PDS3VZFejJzM6rSEXM/+ENafoe2WZbwKlgH+D
 ms3/nIN4aGxVzVUVTfi4duh8+ZYj2YSlmfFCKxH4BpE7KvvMVw92VULUmIxkihF7USjGGTdKuhk
 I2cRMlEK1ig==
X-Gm-Gg: ASbGncsubY+97eVyZf12Iq7OKkop9N9mVpwQ8pU8UyslxBLA0n6bxmydtt7/vkQbGJU
 fDZxL4wZWWfr8mrbe63zD9lMhO/V5guKYCSBzttt1hxUat9ONflipkiMLyyOCqpgc1oqz7ZVqVe
 jlq4xfAXLqAg6cuxCFzVcdOzw7mP3sA2OzHtMHtaoxGLDknsoBvCchuzI8FmY9W/JzDQb0dp6iR
 5saEh+kBe76Bk7R0zzrsnd2WqFo+mkcRYmfR1fnM2urMsO7BTZ2982jjWGY+f2wnPri6UwtGc50
 QemMSRoiQG+hPoOT9mEViPMoJJZEVMg3wWZ6poZgjSIGxXSAHkefdPVfHDMOYve8nRa0CiMV3ps
 Rejh64s9eDUx4+0W2BwtTLg==
X-Google-Smtp-Source: AGHT+IFFuSKD9T/sjhxr/dVqH2R8RH5i/cees/zXa09JdJyXHA0iM3hL1bzgZxIlHsto9LlczhIrNA==
X-Received: by 2002:a05:6a00:3e1c:b0:73f:f816:dd78 with SMTP id
 d2e1a72fcca58-74eb8fc3720mr4611823b3a.15.1752165692610; 
 Thu, 10 Jul 2025 09:41:32 -0700 (PDT)
Received: from gromero0.. (189-47-46-41.dsl.telesp.net.br. [189.47.46.41])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f5c7f7sm2919119b3a.142.2025.07.10.09.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:41:32 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH-for-10.1 v5 0/6] target/arm: Add FEAT_MEC to max cpu
Date: Thu, 10 Jul 2025 16:38:53 +0000
Message-Id: <20250710163858.1094780-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x443.google.com
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

Since v4:

- Moved MECID_WIDTH from cpu.h to internal.h
- Fixed stray ';'s in access and write functions
- Use of GET_IDREG/FIELD_DP64/SET_IDREG for setting feature in ID regs
- Sorted correctly isar_feature_aa64_* AA64MMFR3 tests
- Simplified/unified accessfn for cache instructions
- Fixed how cache instruction-related registers are registered in the cpu

v1: https://mail.gnu.org/archive/html/qemu-devel/2025-06/msg04598.html 
v2: https://mail.gnu.org/archive/html/qemu-devel/2025-07/msg01799.html
v3: https://mail.gnu.org/archive/html/qemu-devel/2025-07/msg02338.html
v4: https://mail.gnu.org/archive/html/qemu-devel/2025-07/msg02488.html


This series adds support for all FEAT_MEC registers and cache instructions to
the Arm64 max CPU.

It includes the FEAT_MEC registers and cache maintenance instructions, but does
not modify the translation regimes to support the MECIDs, so no encryption is
supported yet. However, software stacks that rely on FEAT_MEC should work
properly at this point.

I'm currently exploring possibilities to support FEAT_MEC encryption (or
obfuscation, for testing purposes) in QEMU for the various translation regimes
on arm64, hence the encryption part of FEAT_MEC will be contributed later and is
not targeted for QEMU 10.1.


Cheers,
Gustavo

Gustavo Romero (6):
  target/arm: Add the MECEn SCR_EL3 bit
  target/arm: Add FEAT_MEC registers
  target/arm: Add FEAT_SCTLR2
  target/arm: Add FEAT_TCR2
  target/arm: Implement FEAT_MEC cache instructions
  target/arm: Advertise FEAT_MEC in cpu max

 docs/system/arm/emulation.rst |   5 +
 target/arm/cpu-features.h     |  15 +++
 target/arm/cpu.h              |  27 ++++
 target/arm/helper.c           | 232 ++++++++++++++++++++++++++++++++++
 target/arm/internals.h        |  23 ++++
 target/arm/tcg/cpu64.c        |   7 +-
 6 files changed, 308 insertions(+), 1 deletion(-)

-- 
2.34.1


