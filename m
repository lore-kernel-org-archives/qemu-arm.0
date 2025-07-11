Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32BBC83F1A
	for <qemu-arm@archiver.kernel.org>; Fri, 11 Jul 2025 14:10:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uaERY-0007Ob-Bn; Fri, 11 Jul 2025 10:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uaEQq-00063i-8L
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 10:08:57 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uaEQn-0005tQ-Ah
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 10:08:56 -0400
Received: by mail-pf1-x443.google.com with SMTP id
 d2e1a72fcca58-74b52bf417cso1517956b3a.0
 for <qemu-arm@nongnu.org>; Fri, 11 Jul 2025 07:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752242931; x=1752847731; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QMUZhfwdRbauaa93S3SRTFEhVzXlgQZWXSfc5DTvMmg=;
 b=uWiUqQV0njoG5MYINxAvoClzIBhFANtNDkQhzoMOVAMDlTc//loXyK9UFzg1zEk4j1
 oIQWfLOoBtXqbps0GmvuKj4tw1/TtBjzIRcxo6b46DuVz+k4T71IxyVNMEPnUu1iTCNc
 gzozY9OsdIbXzGUnx/t0Z6KA/E5M/wBsoD5lPVwFzzLIGkAP1Bpb2CJvEtNWBNttXs5I
 Uin0Fejy+JjjGvjwZ3cZvvOajazvT7jPTXXHZkUKG1Gud0ughC9Ui0VjXBoGvlwXHaP1
 3UpvfaA6IVhn+oVZtIerrITAk4iSA3Nzhsqzg0KiRlqMBdjffCWL17/zeNWlyJj+YWlJ
 g68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752242931; x=1752847731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QMUZhfwdRbauaa93S3SRTFEhVzXlgQZWXSfc5DTvMmg=;
 b=aZzjsfpAwAGLOKUs6LJfJvWFFJxdnFju/fJKzTWsxLuMYB3r33mXGFWx2nZxvJgWWE
 brYw9zxVDaY5vjVMxq/TMW6xkGV517g6Vz61r0EvqN4US4gyoecGrXmeSnJj3qGelpty
 u0yREjSYEEwiUX3eB5cKZKfSB1Vn6XeoR8NzEMn6PgX077B88wJGm/YgHPn2HzuoOqs9
 4CQ2NXt6CWm39XUQdxP2zj24niaCCLOsXAfQ07JKPOUn9I/3bkiwzsqNLMYzQOw86V7F
 jH5pEsB+r/65jINZ3yxgu0wgStksbpr/YdIye9+xQ/fJp7nTehdtHH3DV2BFtK0UJYbG
 Ei0Q==
X-Gm-Message-State: AOJu0Yywwcecr2gXnvHRd2o1hUQp+L5vghE0yE2Xa+8cLIbVYRShNMQy
 MAtnpGtICMviWhOpkxUqxTQuyKctpwLQHiYOFTqdIWPO6hlatkrqZINZ3LRyuD+IfNQpIlv4N/m
 CXlVuLsZHlQ==
X-Gm-Gg: ASbGnctMhZhMlsdrKQIU168JnxN1O0qfmAHiS7o46BmE82ZGkGBUA0zoap2vmRUKMz5
 1cgn2CZpuRwGuTOSLvIr4B8KkD7GnPQFZNSBcOgYZzEOy/uXt1/BZkrrzR+ug091IzErWhtUedi
 UjE54e0iGHudLQruzKj20ZrESDkflwLow7McF+ZZi9Dt+yMHBEk21igIplLQVbgytS0evbEuj2a
 1v9b4Li7PiBxD3jvg3EoXzhT8OYN0BBxCUKQAiGffarjx2eaJHG+deZ04B7UmyMRx3ZJcw9GRSi
 c+nWTVy9M0BZh63hul/GiQGsgoM8gdZ4WxzpFY/tztfE4CCW0tucrxzisEs2yXebm1AIPm6DOvn
 6QRs2cZHd2c+M+AsA6+AUmdMiQKKcbr6YEdXExRLGS6hKIkvLce51G6zowQ==
X-Google-Smtp-Source: AGHT+IHZ137PLyHh7NqdG3sMmdhVAm+MWYlcrvh+sYlSncmd2oURWpCvrkBplRLc+PLRn6mkXSbSrA==
X-Received: by 2002:a05:6a20:12d6:b0:220:33e9:15da with SMTP id
 adf61e73a8af0-2311e04b261mr6087823637.2.1752242931015; 
 Fri, 11 Jul 2025 07:08:51 -0700 (PDT)
Received: from gromero0.. (189-47-46-41.dsl.telesp.net.br. [189.47.46.41])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9dd5d3esm5702280b3a.4.2025.07.11.07.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 07:08:50 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH-for-10.1 v7 0/6] target/arm: Add FEAT_MEC to max cpu
Date: Fri, 11 Jul 2025 14:08:22 +0000
Message-Id: <20250711140828.1714666-1-gustavo.romero@linaro.org>
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

Since v5:

- Fixed missing checks for ARM_FEATURE_EL3 in sctlr2_el2_access and
  tcr2_el2_access functions

Since v6:
 
- Added missing feature checks in aliases[] that made 'make check' fail in v6 (pmm)
- Set feature bits in SCR_EL3 in arm_emulate_firmware_reset for Linux (pmm)
- Rebased on pmm's target-arm.next

v1: https://mail.gnu.org/archive/html/qemu-devel/2025-06/msg04598.html 
v2: https://mail.gnu.org/archive/html/qemu-devel/2025-07/msg01799.html
v3: https://mail.gnu.org/archive/html/qemu-devel/2025-07/msg02338.html
v4: https://mail.gnu.org/archive/html/qemu-devel/2025-07/msg02488.html
v5: https://mail.gnu.org/archive/html/qemu-devel/2025-07/msg02689.html
v6: https://mail.gnu.org/archive/html/qemu-devel/2025-07/msg02731.html


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
 target/arm/cpu.c              |   9 ++
 target/arm/cpu.h              |  27 ++++
 target/arm/helper.c           | 236 ++++++++++++++++++++++++++++++++++
 target/arm/internals.h        |  23 ++++
 target/arm/tcg/cpu64.c        |   7 +-
 7 files changed, 321 insertions(+), 1 deletion(-)

-- 
2.34.1


