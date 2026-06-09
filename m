Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB14CD8CB2
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:23:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX23C-00042v-OA; Tue, 09 Jun 2026 15:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21C-0003CS-B1
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:21:58 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX20t-0003yq-DB
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:21:35 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2bf3781ca51so55256125ad.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781032871; x=1781637671; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yTMSYWpfUMipEhrLcwHEDVCvznmKW22u2UG4z7J9j4M=;
 b=ImdQoBppH8gwVMdMcNGbigopTBlAn5FaclQlHX/Tg/0PnVMNXbmC0atAoZm3F1UGXc
 lzAQ1XNvYIt4gC/Z7+iztRum/3BtJ8XRSc0U9PzEZlkcxBVIC+sD49nziAkynNiCFqdY
 ZC5OW7M3UGxsXl2ZrI9n6WcpOi+tsdICfKVawqXKaJ9hvuFxsd8N2XhyAO1pQeW0vZtp
 Rdi4u4rZbxTgB37PEmjxiHX8DcUU/Ubc8Iw7iEnZEmNU7VkjEXwBqNNLp2ep/ZXxF7fe
 Oo02sgQwULzAPfWlrHdfAgc85v9MgKLdQIZZj3qyiASvhgKp8AzS2PtfwfUIwrzOhdyc
 CoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781032871; x=1781637671;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yTMSYWpfUMipEhrLcwHEDVCvznmKW22u2UG4z7J9j4M=;
 b=juk1diPjw7M/UUFcytULKWlrXGQw4ZZPBjATFCqEuTOJaq4HpJdSWO0fDyebnC4FMp
 DVT6TW4RoMuK53AeO3/TTuOaRBCmxLzw/Xt2n6Je9h9V1IHwdWDBouKxEtt0c+Im/t61
 MSMUnJ4ZyrEmn2KN1egdC36mgadipuAbXyFExD8AplrDKoEtGqD0TNi4wdt19hniX3TL
 4PujNzIgw3Za89/c2d68yP4NTOQtR+EWSHDd1z5hI6uaELBPKHjtrr/T0bHf06OvkDkf
 cAZw569nCIKKp0gAcoPcc5FMJdim8yrBOgauh6zJlKHICDCtxVMaZ19S1ZYsSOE+7nng
 XfAQ==
X-Gm-Message-State: AOJu0Yxa9ODBoXpz1LcrwL0DGHqMDJhcXBp3V8/DuCDnVZ7Utb/UqyWK
 LlcXGWttrqiQ+qchYXqMF1puHp90Nx8/h2vFuZUmmABdvtEgebA+xck8/4THAizuXJY=
X-Gm-Gg: Acq92OEbQU8Xy6uVtc+QAs2Tldcy4gPZkPS51rHQEi3de3NqKXmFpMXSUfauGjq0bks
 AgzRsFSa/ElswZo38SYecQwfbbhCag8pdTzclVpRYY1ns/yYN09BkJ6lQspkrxb/TvYc6nairU3
 4XO0kipcEmKqmBf8fnwsGmLq0Su/lrU3+WZgskCQEXkJxkY8vzjkL84N8ybHCsoyh/ldqwfzBwS
 gb3VzhqDzEGpQhDCXiv8RPoICSNnHm7RceUrKySP2uSh6VWT3QE2UCukYvZlSb7shBRxw/iz5jS
 MXe7ryDMFAGy//DO82IrHfhQjrycRlkUx/4E7M9ubG7GNfuYIYwxivbn0Qq1RRFCZxVd6CC4NHM
 ATj9MExFPpyDpy4KbReE0rYkTkxDgfuQzBV/Bi/gkZWLFZt2cWqEX//Z2AwoxCfi2KwXqeUyq0U
 Gs56kRON85Xv7qPJtczg1pSIKh3oUC2yBRXLEMPOQ=
X-Received: by 2002:a17:902:e74e:b0:2c0:b35d:ed49 with SMTP id
 d9443c01a7336-2c1e7b35822mr254824515ad.2.1781032871163; 
 Tue, 09 Jun 2026 12:21:11 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f88473sm240806095ad.25.2026.06.09.12.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:21:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v10 00/45] target/arm: Implement FEAT_FP8
Date: Tue,  9 Jun 2026 12:20:24 -0700
Message-ID: <20260609192110.752384-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Changes for v10:
  - bfdotadd_ebf and f16_dotadd fixes
  - streaming fixes
  - comment fixes
  - All patches reviewed.

r~

Richard Henderson (45):
  target/arm: Use FloatParts64 in bfdotadd_ebf
  target/arm: Drop oddstatus from is_ebf and bfdotadd_ebf
  target/arm: Use FloatParts64 in f16_dotadd
  target/arm: Generalize TRANS_FEAT_STREAMING_SME2
  target/arm: Introduce arm_init_fp_status
  target/arm: Set e4m3_nan_is_snan
  target/arm: Implement BF1CVTL, BF1CVTL2, BF2CVTL, BF2CVTL2 for AdvSIMD
  target/arm: Implement BF1CVT, BF1CVTLT, BF2CVT, BF2CVTLT for SVE
  target/arm: Rename SME BFCVT patterns to BFCVT_hs
  target/arm: Implement BF1CVT, BF1CVTL, BF2CVT, BF2CVTL for SME
  target/arm: Implement F1CVTL, F1CVTL2, F2CVTL, F2CVTL2 for AdvSIMD
  target/arm: Implement F1CVT, F1CVTLT, F2CVT, F2CVTLT for SVE
  target/arm: Implement F1CVT, F1CVTL, F2CVT, F2CVTL for SME
  target/arm: Implement BFCVTN for SVE
  target/arm: Implement FCVTN (16- to 8-bit fp) for AdvSIMD
  target/arm: Implement FCVTN, FCVTN2 (32- to 8-bit fp) for AdvSIMD
  target/arm: Implement FCVTN (16- to 8-bit fp) for SVE
  target/arm: Implement FCVTNB, FCVTNT for SVE
  target/arm: Implement FCVT (FP16 to FP8) for SME
  target/arm: Implement FCVT, FCVTN (FP32 to FP8) for SME
  target/arm: Implement LUTI2, LUTI4 for AdvSIMD
  target/arm: Implement LUTI2, LUTI4 for SVE
  target/arm: Enable FEAT_LUT for -cpu max
  target/arm: Enable FEAT_FP8 for -cpu max
  target/arm: Update ID_AA64SMFR0_EL1 fields to ARM M.b
  target/arm: Implement MOVT (vector to table)
  target/arm: Implement LUTI4 (four registers, 8-bit)
  target/arm: Enable FEAT_SME_LUTv2 for -cpu max
  target/arm: Implement FMLALB, FMLALT for AdvSIMD
  target/arm: Implement FMLALB, FMLALT (FP8 to FP16) for SVE
  target/arm: Implement FMLALL{BB,BT,TB,TT} for AdvSIMD
  target/arm: Implement FMLALL{BB,BT,TB,TT} for SVE
  target/arm: Enable FEAT_FP8FMA, FEAT_SSVE_FP8FMA for -cpu max
  target/arm: Implement FDOT (FP8 to FP32) for AdvSIMD
  target/arm: Implement FDOT (FP8 to FP32) for SVE
  target/arm: Enable FEAT_FP8DOT4, FEAT_SSVE_FP8DOT4 for -cpu max
  target/arm: Implement FDOT (FP8 to FP16) for AdvSIMD
  target/arm: Implement FDOT (FP8 to FP16) for SVE
  target/arm: Enable FEAT_FP8DOT2, FEAT_SSVE_FP8DOT2 for -cpu max
  target/arm: Implement FMMLA (FP8 to FP32) for AdvSIMD
  target/arm: Implement FMMLA (FP8 to FP32) for SVE
  target/arm: Enable FEAT_F8F32MM for -cpu max
  target/arm: Implement FMMLA (FP8 to FP16) for AdvSIMD
  target/arm: Implement FMMLA (FP8 to FP16) for SVE
  target/arm: Enable FEAT_F8F16MM for -cpu max

 target/arm/cpu-features.h        |  83 +++
 target/arm/helper-fp8.h          |  14 +
 target/arm/tcg/helper-defs.h     |   6 +
 target/arm/tcg/helper-fp8-defs.h |  40 ++
 target/arm/tcg/helper-sme-defs.h |   2 +-
 target/arm/tcg/translate-a64.h   |   1 +
 target/arm/tcg/translate.h       |   7 +-
 target/arm/tcg/vec_internal.h    |  12 +-
 linux-user/aarch64/elfload.c     |  13 +
 target/arm/cpu.c                 |  20 +-
 target/arm/tcg/cpu64.c           |  16 +
 target/arm/tcg/fp8_helper.c      | 859 +++++++++++++++++++++++++++++++
 target/arm/tcg/sme_helper.c      | 105 ++--
 target/arm/tcg/translate-a64.c   | 160 ++++++
 target/arm/tcg/translate-sme.c   |  71 ++-
 target/arm/tcg/translate-sve.c   | 245 ++++++++-
 target/arm/tcg/vec_helper.c      | 194 ++++---
 docs/system/arm/emulation.rst    |  11 +
 target/arm/tcg/a64.decode        |  39 ++
 target/arm/tcg/meson.build       |   1 +
 target/arm/tcg/sme.decode        |  25 +-
 target/arm/tcg/sve.decode        |  48 +-
 22 files changed, 1815 insertions(+), 157 deletions(-)
 create mode 100644 target/arm/helper-fp8.h
 create mode 100644 target/arm/tcg/helper-fp8-defs.h
 create mode 100644 target/arm/tcg/fp8_helper.c

-- 
2.43.0


