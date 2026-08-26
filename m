Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D114C61DBD
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 17:42:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzHdn-0008Pg-80; Wed, 26 Aug 2026 13:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHdk-0008OR-Hw
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:21 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHdi-0004jU-H9
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:20 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-84faf0fa17eso1311883b3a.2
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 10:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787766137; x=1788370937; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Knl3agZwHM4DlSg58E1Lmhm2HbRy2QdppL2P2wfWmEM=;
 b=eLG1j97sgdXDxGjX2gX+sg4P0gMjK6xna4P7U46t6NYEijBvqe8lrHACum0mR7Zm7P
 tgbt6Wz6OaacisJHPAE7B2sOtF1KzHFTMZr2h8xAGxKu7+HUHCF1x2pm+4N8ieHPhRpv
 0hoIVMCbAwtfJV3bBhC6ozESNoopO7cTKNPHSsF1lMoCr7AkpHJ7Fg6a1DNSMxhpRrqI
 SKdqrdZoNmGaE1o7xApry9NFvLhlyEmpyj1iiBWGZtgaNHUnV+sBSu+McGUOOzmBHPZJ
 MswadqrLiwfZLpzFt6TQt6w0pwbfkd5PtUktYcK29C1t8IhudXCBCWmQb8K1TV18kECc
 SLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787766137; x=1788370937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Knl3agZwHM4DlSg58E1Lmhm2HbRy2QdppL2P2wfWmEM=;
 b=l8T6r96AEC69Tb7S9++X0xvNJVxW8C92f9gWaBSnSprVX7/k7BffmT0IVuL8s4Y1BE
 /tWckQdfnSxnAYUWcAG4b35XrjHjj+MLGkItW0nCdNBinH9qVunz9VHZw9MyI4x2y5F5
 R4YL1f3deqesdL9n017tVpUQ9K1+3Up4xUAaZcEmvEIjdmBFpc2azsH6t4M2mz/xEmmE
 zfTwu7ShO0HKVo94BTvF0BUIYTZ2oXh1VMP28WszNdOnv73g7z4Jn0F5XRxww44HEkzG
 JnbQvS9d3Mhb7rpsU6sb6Ltm2VB7klhEDfjrG8NFqKHrwivv2WmLl+IzzQqKD9MROJ0X
 cerg==
X-Gm-Message-State: AFuF++lOVPv4XWboo8hUh8N3M8tMlrZjcQ5rsvPqw9iUOCBLMg1KtWy2
 lU9FNTDkgHMAdqgTi5qRXS/x7lIzkJvp4ZkZJDMLJHw1dULiVAtuxfjh4d6qeuB1avU=
X-Gm-Gg: AR+sD13hnQ98Lgw1ruNSqGe47NYvvnGzvg1O13bfZsiDgx9dvbJopwyd8Oc3vuRHYFk
 epVdYtmsdK5VzERgqcV6J6EiOXjFUbDg6Ydn7/cgn6QsoxHZKHbqilGLjrtONv55EqqezaJg08a
 qJa2fhBSrKsvj7P8cMg5g2Dw8YuK++fs1cIW/L2E2A5fQ+QbXiZ2sbJZM50Mbid5LzTQ+/tERRy
 qLypf4/EcVv7lZQ5j5OAvaTjDlF6/oTFPKsGv6T4fFY2oPUGndV65BCQLmx7Ob7GZmfTPNvH3f8
 hzeruIN3b8f7MjXMRCH6JWj+MjaY3eS0Itzurz/fPfwGE2x7b9uIjiAxn4bcu0Qeq0oPC5Zkb9l
 yaW3wGXg+nApDZE7SQZz0fTEAHL9MkAo2Zskqdgu1HMoWp0TxsqnKDzA+rHdtt8b7FkwYsyxKdi
 dpxNvln3WAr5zzH6o9UCIxQb7xlDwHqv9maFghX27t48vR55eLLtK9E46G7V68NuphQHWIKaaES
 K8xBeYHOEUsTam4VcSzGun32PcW
X-Received: by 2002:a05:6a00:4ac6:b0:845:e9e8:645c with SMTP id
 d2e1a72fcca58-85372ba1874mr17324628b3a.6.1787766136587; 
 Wed, 26 Aug 2026 10:42:16 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc1bec66020sm1260072a12.21.2026.08.26.10.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 10:42:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/25] target/arm: Implement FEAT_SME2p2 etc
Date: Wed, 26 Aug 2026 10:41:47 -0700
Message-ID: <20260826174213.614571-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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

Based-on: 20260825213000.221822-1-richard.henderson@linaro.org
("[PATCH v3 0/4] target/arm: Introduce cpu types max-v8 and max-v9")

Changes for v2:
  - Based on max-v9 split.
  - Minor patch review changes.

r~

Richard Henderson (25):
  target/arm: Split zdn in do_z2z_n1 and do_z2z_n1_fpst
  target/arm: Split zdn in do_z2z_nn and do_z2z_nn_fpst
  target/arm: Split decode of BFloat SME FMAX/FMIN
  target/arm: Implement FMUL (multiple/multiple and single vectors)
  target/arm: Enable FEAT_SVE2p2 and FEAT_SME2p2 for -cpu max
  target/arm: Remove DO_ZPZZ_FP from translate-sme.c
  target/arm: Remove DO_ZPZZ_FP_B16 from translate-sme.c
  target/arm: Remove DO_ZPZZ_AH_FP from translate-sme.c
  target/arm: Remove DO_ZPZZ_AH_FP_B16 from translate-sme.c
  target/arm: Split decode of BFloat SVE FADD, FSUB, FMUL, FMIN*, FMAX*
  target/arm: Implement SVE BFSCALE
  target/arm: Implement SME BFSCALE
  target/arm: Implement SME BFMUL
  target/arm: Enable FEAT_SVE_BFSCALE for -cpu max
  target/arm: Rename isar_feature_aa64_sve_pmull128
  target/arm: Rename isar_feature_aa64_sve_bitperm
  target/arm: Rename isar_feature_aa64_sve_sha3
  target/arm: Rename isar_feature_aa64_sve_sm4
  target/arm: Implement and enable FEAT_SSVE_BitPerm for -cpu max
  target/arm: Implement AESE (indexed)
  target/arm: Implement AESD (indexed)
  target/arm: Implement AESEMC
  target/arm: Implement AESDIMC
  target/arm: Implement PMULL, PMLAL
  target/arm: Enable FEAT_SVE_AES2 for -cpu max

 bsd-user/aarch64/target_arch_elf.h |   8 +-
 target/arm/cpu-features.h          |  33 +++-
 target/arm/tcg/helper-a64-defs.h   |   1 +
 target/arm/tcg/helper-defs.h       |   5 +
 target/arm/tcg/helper-sve-defs.h   |   5 +
 linux-user/aarch64/elfload.c       |  13 +-
 target/arm/tcg/cpu64.c             |  10 +-
 target/arm/tcg/crypto_helper.c     | 164 ++++++++++++++---
 target/arm/tcg/sve_helper.c        |   1 +
 target/arm/tcg/translate-sme.c     | 190 ++++++++++---------
 target/arm/tcg/translate-sve.c     | 282 +++++++++++++++++++++--------
 target/arm/tcg/vec_helper64.c      |  35 ++++
 docs/system/arm/emulation.rst      |   5 +
 target/arm/tcg/sme.decode          | 154 +++++++++++++---
 target/arm/tcg/sve.decode          |  70 ++++++-
 15 files changed, 732 insertions(+), 244 deletions(-)

-- 
2.53.0


