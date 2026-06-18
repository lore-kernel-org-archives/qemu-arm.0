Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AEECD98ED
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 04:07:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa42L-0000tS-Vg; Thu, 18 Jun 2026 00:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa42G-0000qg-3r
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:07:25 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa42E-00044S-J6
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:07:23 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-37ce68a54f8so131867a91.0
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 21:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781755640; x=1782360440; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4Q2VUV0l7hwzaun46dVIEJHwiUnFL2anc4WfanKbEJk=;
 b=Ius4oUuIUq5FMOYwQADSTogukLpuwM2c7PDEGoVQGDKGYGXKY8PcP62QeSqdDEHKmX
 6So5s7d16YKAQdgHeIU1sPEK8HnpmB58CILPerIvlj18+31jcWy5eP1m1+8hZXsxGSn5
 4WKHjMHbUPFaytX0N09F1LE9fKEdM0yl9upuZXVjD7Cf2/HL69ZsFnwZXl0FvLWZSlJz
 gxl3hynX02As3eQ9UcFTLtBQoavoO17r5ef6/DB2zzznfhjKmCNWCugJ8Hgpyhfcl85L
 CmFSKxryl/7GEJsGgL8aFAgiSsfg+DPF4yCmWfaSrG17LctKkMM3em+V0gIBIojTfJsU
 kIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781755640; x=1782360440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Q2VUV0l7hwzaun46dVIEJHwiUnFL2anc4WfanKbEJk=;
 b=E5gDeXV5N5jqz/ghoC7y1hwFMeLa7WKqCndxZMbZv+VDGCQ/dz5BTZfSK2IltZTGTx
 pgHnUCtQ5TFyryKRPMSN/DUmaFGTcVhtZzetSThh87ZEHqlKlQxL5+rYnROx7zo9pGVg
 w0l6rCSa4FTaAkJoBBoe7gx0YxDjzR9Ye2AwsENgsMX/NVzo0yEri1qgVtOCCNRqFWLv
 pbq6LxsTDIW71DlT98kAOGXvA5vAcpCXAaA7I39X81ZNdpZf58FeeE/4B+YZRiHZ7kGn
 WdO88V+pjeriAt6i0NvJdpXNQxTAPgOS+72uN7JZyzglQvEkU2tGQABM+eF8+RDCGyQl
 Hpqw==
X-Gm-Message-State: AOJu0YzzX8aKNEct/RD0QxNRmYuuM90fcPXHbcukrfRuQyr5zQF1xpeh
 jPRbeEFxIh18rgIANq0LDNFUQuif81Yl3IOaaIv+sRaeSOMeXojuXPzEdIPEI7gE7AY5FaMS7X6
 uECv4
X-Gm-Gg: AfdE7ckQCgyrAPINVCIVjlmPikyZip7GFQbSxlCjreUUrCTyD9e6Ba+OSp2xb7YPMfS
 xqf9SJngwRupcLE3sIRfFdkb6hjHP4N9Dz1JeaD4Z8qziAlR3ibR8GeEYjAQzVDrBJu4EOZowkV
 gVBqXlj7afBGw9rX2oY7E4Qur8uxWabhSnerGCvg/Z/MPqJ+7wriKYM+SGRJTFM2iz6QaRT3FZx
 glN+VNWu9m8kv8HFn+m6g1IeHx3dEcUeUpeJtMohXEQDS0/HVk4K61Pz07kuVSaI7C/DlZWxA0R
 6RRP0MuFACSWTpH5M4iyswwzBHLIC2CWroh8tuXz3ul1ljBAA5h4PdAKKhR+/M6kAp0Jolccis/
 qkkrgZbrZf3a4K0pNaGtUDjvia94baok39v5pNeSf56K1A2dHCaEwgup9dq+cwHhL/iYXx3g5sZ
 /4a9uoT2fuIhGfq2j9jefEwRAwGsFpuny2KZKvA1oymLPnObSGCA==
X-Received: by 2002:a17:90b:3c52:b0:36b:9835:cf96 with SMTP id
 98e67ed59e1d1-37c9da78e74mr6111230a91.2.1781755640124; 
 Wed, 17 Jun 2026 21:07:20 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37c5222e042sm8830476a91.16.2026.06.17.21.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 21:07:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 0/8] target/arm: Implement FEAT_SVE2p2
Date: Wed, 17 Jun 2026 21:07:10 -0700
Message-ID: <20260618040718.572950-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

Changes for v2:
  - 18 patches merged
  - Enablement of the feature for -cpu max is deferred until
    FEAT_SME2p2 is complete as well.
  - Dropped sve2p2 helper prefixes.
  - Renamed sve2_aes to sve_aes; there are more isar functions
    that want renaming, but this one touches the same lines as
    FEAT_SSVE_AES.
  - Other minor tweaks to helpers per review.
  - Unrelated bug fix for FEAT_FPMR.


r~


Richard Henderson (8):
  target/arm: Enable SCTLR_EL1.EnFPM for user-only
  target/arm: Implement EXPAND
  target/arm: Generalize sve_compact_[sd]
  target/arm: Implement COMPACT for byte/halfword
  target/arm: Implement FIRSTP, LASTP
  target/arm: Rename isar_feature_aa64_sve_aes
  target/arm: Implement FEAT_SSVE_AES
  target/arm: Use expand_pred_N for helper_sve_not_zpz_N

 bsd-user/aarch64/target_arch_elf.h |   2 +-
 target/arm/cpu-features.h          |   7 +-
 target/arm/tcg/helper-sve-defs.h   |  10 ++
 linux-user/aarch64/elfload.c       |   3 +-
 target/arm/cpu.c                   |   4 +
 target/arm/tcg/cpu64.c             |   1 +
 target/arm/tcg/sve_helper.c        | 150 ++++++++++++++++++++++-------
 target/arm/tcg/translate-sve.c     | 105 +++++++++++++++++---
 docs/system/arm/emulation.rst      |   1 +
 target/arm/tcg/sve.decode          |   6 +-
 10 files changed, 237 insertions(+), 52 deletions(-)

-- 
2.43.0


