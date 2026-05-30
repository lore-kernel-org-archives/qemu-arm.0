Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A807CD6E4C
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:15:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSr7-0008QJ-Ta; Sat, 30 May 2026 19:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSr5-0008PS-6b
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:35 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSr2-0007M4-U2
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:34 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-36b8e1760ccso1735235a91.0
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182751; x=1780787551; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AyBp3EYY308YTIebHDB2PCJd9d4wtGq72cDq3rwyeGA=;
 b=FC7Qh5hwXcPOyBXScDCmF4uZKIXW6p9rUZrLiLucl2RxBdMBkibf71rBUMmokAqIPl
 7cVoosJRrFib38O7bUpa5gNAQHpK+zXAiOqgi+KK1c54wZOWpzQuMkb1kxD9ytADpTkK
 u/flC3PeIwxzKDKUMmMAUjiAIq7h2Fg2CAx72Ez1lILrJn5QNwNzj6oBniXbTSfn9+M3
 9UCm84LKuiVmM6cefHBQs2FLl9buCFSSnDs+teBGzVpf4JRLyWMYq68YI6ggEtF9g9Gq
 ZORW7XRqoKzOItFBiQtSjMXUx8gxL3KJeLAk4E54jYvQ/o8YmTGL/0xsbSUqPcGtwXEt
 P+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182751; x=1780787551;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AyBp3EYY308YTIebHDB2PCJd9d4wtGq72cDq3rwyeGA=;
 b=i3sIBSSLaPaZhWizGHdxxG1RAOaHU66OT4XWbhcegjGbugasWWU0GIy0a/QOQB8aDn
 r2S4qZBie21lOwVb3kTUumYh45eLqg5i+KmIY/pPFYjz9HHNqDrrmlY8iMwnJYJ7WbF/
 eHRpiS9O8p3E4plXXWrKTkRBlqY7gm78RR83FjAEV68rK3acm/tIc6qHxPURzg2hSa+9
 YvK6/CwXZnddX1ruNN6OHjrnUFJASnArTWfZxGpMVX8tZ1qn1LVD7Kl/Plt/AsdI9lAy
 VhDd2oeU+W218Fo2gjkQJ0OIoowhG3G2Q9pojrFfeeuhDnwreTNiFqZKfVmatnon4wcz
 L1ng==
X-Gm-Message-State: AOJu0YxvnlpjBUpAeZrfzrq53A5j9D/CCByLt4Tpz6MWZ6i0BtnOMHbn
 hQMw7tEGq9nSf2xbKnXeobDaBkitM/nVEEX9yBsKBAI3xySjFds5h/EqCRIlZFq3ge3ZqE/vlxJ
 B8ejcszM=
X-Gm-Gg: Acq92OFPVRhgIJsuSCZDyk+3alu75z/DqX4SOL2ziRUCyDpVPnbSb4fM/AwG/aGBC28
 /6dRHMpHKmM1xMcLMXf4FTElnCBEcyWwT+EMQPlv3oRPt0+1xOZ7nSGpTsIU9XLB3D2yD/QPnYB
 u03/30szwIrTLjpMYZ7jz0FQdZ3Ns4sNQM3dOtmddsF6b9lJAR+MyIlfaJrk4spPGu7hm7lycOa
 qHSFSofCKPt0Joe6giTAUlyzAox+R/1SoAWMCUDCp4jIPlF6Srk95mq9D1rE56S+tYAej2Fybcn
 1CEFc5mm6MctY4OgDf1VcmO4dZtuOOJVgtCz2zXjAoQALpurEfjMBcncWAYrYzWu1DHp8vQtEYw
 kGeLos/jf5ZTrmX1z114qpYZtw6e0lwxb3PBqzed4z8waVG/da0lIrIeShfRbjvpwI+o0k9ywsd
 xBGI8IMaD2WkxxYopHzuGZqzIcNlWBVDnEX0MVWKU=
X-Received: by 2002:a05:6a21:6494:b0:39c:787:f196 with SMTP id
 adf61e73a8af0-3b427eb0f80mr5634639637.16.1780182750910; 
 Sat, 30 May 2026 16:12:30 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:12:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 00/41] target/arm: Implement FEAT_FP8
Date: Sat, 30 May 2026 16:11:48 -0700
Message-ID: <20260530231229.400441-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Changes for v8:
  - 23 patches upstream
  - Rebase adjustments
  - Rewrite arm_init_fp_status per feedback

r~

Richard Henderson (41):
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
 target/arm/tcg/translate.h       |   1 +
 linux-user/aarch64/elfload.c     |  13 +
 target/arm/cpu.c                 |  20 +-
 target/arm/tcg/cpu64.c           |  16 +
 target/arm/tcg/fp8_helper.c      | 858 +++++++++++++++++++++++++++++++
 target/arm/tcg/sme_helper.c      |   2 +-
 target/arm/tcg/translate-a64.c   | 160 ++++++
 target/arm/tcg/translate-sme.c   |  71 ++-
 target/arm/tcg/translate-sve.c   | 233 +++++++++
 target/arm/tcg/vec_helper.c      |  66 +++
 docs/system/arm/emulation.rst    |  11 +
 target/arm/tcg/a64.decode        |  39 ++
 target/arm/tcg/meson.build       |   1 +
 target/arm/tcg/sme.decode        |  25 +-
 target/arm/tcg/sve.decode        |  48 +-
 21 files changed, 1696 insertions(+), 14 deletions(-)
 create mode 100644 target/arm/helper-fp8.h
 create mode 100644 target/arm/tcg/helper-fp8-defs.h
 create mode 100644 target/arm/tcg/fp8_helper.c

-- 
2.43.0


