Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2171106ejy;
        Mon, 3 Jul 2023 03:07:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEzSL7aRIRQwCD8BBOjEr6A3SspYYlrvFpyGcdAYLxQKlF9Fb0tWBztiEzUzZL7NOmUMK8y
X-Received: by 2002:a05:620a:4256:b0:767:596f:a9e2 with SMTP id w22-20020a05620a425600b00767596fa9e2mr6002239qko.15.1688378824640;
        Mon, 03 Jul 2023 03:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688378824; cv=none;
        d=google.com; s=arc-20160816;
        b=qDSLrRgwuWXdgO7K6ED7v8dPnC2PdzHQBDNQAsurCwh0jW1O7pJ4ZL6rJfpLSbQPn/
         fO0ic2zK93ek9e1ckhKhBZgWtdu2iOCS5tYOgDohLzlJCouO8dzavznRC9B3Lul1F6mN
         dlm+yhfeoSoh/axCsqkPuX0M2hSuJJTPtm88ckt2/hAMpH5m++zD2VkrWRfsVuNmiCNf
         gk3vGuiA2Yli2T56MWTlbpfG3WWzqFt7qQQZhmxRBlHbK71xr3ZHu0bjzFOuYphgXRYD
         yNYdA7fbnHbabIPcBBAuVzsL30B9DQsHBYilYv3L2QwhyM1oXfBEQgVWfCBkYuhfevzT
         9bRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Rls68f00SWeRuza9ZKAO8yZ/AGYqIMDybNYbvKECu1g=;
        fh=DiqGMcF5+wJ0/Fe6a4a0YfMDHaiC5n3qovds/BNTPmI=;
        b=DgfQQNtAC4SOiVUX1dHByZWht+INNf5ZjG+hYqiF02GMaQXgZCHP62+K2LZHQqnfXO
         8WewPnYhXXUNk9Fhe32Bs4Ov+9j1mGus2O2WfpawcF+dqac9atlN01qQx1Ey8mb8Kr91
         FYXO5+nmZXtajEAL/Jm1HlZn1ObY8fFfdtH1p/uiJk4UXJKtDrZsmWriyfUfgcdpH+O2
         jWqdcZPLdMH3blSsRWTNC/vpVU7l524HwJgYcaeqN/bHZz6zbmzLPrMG+84sY7+Sy6zt
         L1aTzsIAxqHBZDUp9zoFiFILJJNAp6HVA6qK0YQUQIV7efdgdr445CbPzuz3tZUHI80j
         thZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nkSjumVi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id os26-20020a05620a811a00b0076771ef7e6csi447683qkn.368.2023.07.03.03.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:07:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nkSjumVi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGRI-0002dU-0q; Mon, 03 Jul 2023 06:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGR9-0002aG-B9
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:05:45 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGR3-0005gS-6m
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:05:38 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f8735ac3e3so6573086e87.2
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378722; x=1690970722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rls68f00SWeRuza9ZKAO8yZ/AGYqIMDybNYbvKECu1g=;
 b=nkSjumVicdzC27SRTZEB3AtImBAFO1+BYfXFCvS7pGcGEC8X1k/gavfjnZ6VUerCVZ
 KMTg6dIQmO4N4g7h6dk1cM+chaveZ3QSNd9zSwiG4eIZkK/7MsC746zzgpoKzLJBFiJS
 laxOApUcsVimSi7t3fdVhdCM+uRhJYVu6Xu1WfHx2rNTlZPxWET61t8cd8T4Mc7vaEzq
 eRTtx28RPyBkuqRrgj3GfaOkxNpIQTNycYKNQOkfS5gUO0V0qyF5FQ3iSxhfunbjehCx
 n9fbkTUT4y/trTEcmCaZNw0N+kAMIkv/S7V2QyaTRDIXu/NTdMcefOliXF1YOHfaChtC
 B+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378722; x=1690970722;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rls68f00SWeRuza9ZKAO8yZ/AGYqIMDybNYbvKECu1g=;
 b=JMt+Kx/ZXNMoCTh9ITr/SRTNc9VGVP+jUayJIcKPK9pTGOSH3s6jqT7r7rl/IVQJdT
 JU1umzFZX6YShCNoLxfxu3IG+Yx1fI3sxf+DOGHVlxZjNHjI611BDR7TvZuFj7bC1yqg
 ye/9jEximPMpAEwNre3j2Y/475aZHfGY/56kYUXB3evMlKU9DjwJKLWnhuyimmzTBeyX
 psD02JsUycEuJbI+Q5kG7kKwXLH/firvZfMnOGsuEhrQ5su0maBGfA3prZIG1uiFhSSn
 odTb0zEjuSD3HrVkFMSRWaKEgwI8/vjFudNgZjXpOTSMqZH+4EEtqNDxaMjwq+loPs0s
 lvtQ==
X-Gm-Message-State: ABy/qLZfhoqGWuFGI+bM3toIAAkk61HAgCt8gRmuzXxH+8OfpgCapqXu
 2jmVu9p5yJBGcINGb2rmFZy0zA==
X-Received: by 2002:a05:6512:3b9c:b0:4f8:5960:49a9 with SMTP id
 g28-20020a0565123b9c00b004f8596049a9mr8221404lfv.23.1688378722546; 
 Mon, 03 Jul 2023 03:05:22 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 00/37] crypto: Provide aes-round.h and host accel
Date: Mon,  3 Jul 2023 12:04:43 +0200
Message-Id: <20230703100520.68224-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AjVWw4cJdJil

Inspired by Ard Biesheuvel's RFC patches for accelerating AES
under emulation, provide a set of primitives that maps between
the guest and host fragments.

Changes for v4:
  * Fix typo in AESState (Max Chou)
  * Define AES_SH/ISH as macros (Ard Biesheuvel)
  * Group patches by subsystem.

Patches lacking review:
  12-host-include-i386-Implement-aes-round.h.patch
  13-host-include-aarch64-Implement-aes-round.h.patch
  21-target-i386-Use-aesdec_IMC.patch
  22-target-i386-Use-aesenc_SB_SR_MC_AK.patch
  23-target-i386-Use-aesdec_ISB_ISR_IMC_AK.patch
  25-target-arm-Use-aesenc_SB_SR_AK.patch
  26-target-arm-Use-aesdec_ISB_ISR_AK.patch
  27-target-arm-Use-aesenc_MC.patch
  28-target-arm-Use-aesdec_IMC.patch
  29-target-riscv-Use-aesenc_SB_SR_AK.patch
  30-target-riscv-Use-aesdec_ISB_ISR_AK.patch
  31-target-riscv-Use-aesdec_IMC.patch
  32-target-riscv-Use-aesenc_SB_SR_MC_AK.patch
  33-target-riscv-Use-aesdec_ISB_ISR_IMC_AK.patch

Daniel(s), I could push the set that has been reviewed
(crypto/, DPB; target/ppc/, DHB) through tcg-next if you like,
just to reduce the outstanding set.  Perhaps smaller patch sets
would help getting the other targets reviewed...


r~


Richard Henderson (37):
  util: Add cpuinfo-ppc.c
  tests/multiarch: Add test-aes
  target/arm: Move aesmc and aesimc tables to crypto/aes.c
  crypto/aes: Add AES_SH, AES_ISH macros
  crypto: Add aesenc_SB_SR_AK
  crypto: Add aesdec_ISB_ISR_AK
  crypto: Add aesenc_MC
  crypto: Add aesdec_IMC
  crypto: Add aesenc_SB_SR_MC_AK
  crypto: Add aesdec_ISB_ISR_IMC_AK
  crypto: Add aesdec_ISB_ISR_AK_IMC
  host/include/i386: Implement aes-round.h
  host/include/aarch64: Implement aes-round.h
  host/include/ppc: Implement aes-round.h
  target/ppc: Use aesenc_SB_SR_AK
  target/ppc: Use aesdec_ISB_ISR_AK
  target/ppc: Use aesenc_SB_SR_MC_AK
  target/ppc: Use aesdec_ISB_ISR_AK_IMC
  target/i386: Use aesenc_SB_SR_AK
  target/i386: Use aesdec_ISB_ISR_AK
  target/i386: Use aesdec_IMC
  target/i386: Use aesenc_SB_SR_MC_AK
  target/i386: Use aesdec_ISB_ISR_IMC_AK
  target/arm: Demultiplex AESE and AESMC
  target/arm: Use aesenc_SB_SR_AK
  target/arm: Use aesdec_ISB_ISR_AK
  target/arm: Use aesenc_MC
  target/arm: Use aesdec_IMC
  target/riscv: Use aesenc_SB_SR_AK
  target/riscv: Use aesdec_ISB_ISR_AK
  target/riscv: Use aesdec_IMC
  target/riscv: Use aesenc_SB_SR_MC_AK
  target/riscv: Use aesdec_ISB_ISR_IMC_AK
  crypto: Remove AES_shifts, AES_ishifts
  crypto: Implement aesdec_IMC with AES_imc_rot
  crypto: Remove AES_imc
  crypto: Unexport AES_*_rot, AES_TeN, AES_TdN

 MAINTAINERS                                  |   1 +
 meson.build                                  |   9 +
 host/include/aarch64/host/cpuinfo.h          |   1 +
 host/include/aarch64/host/crypto/aes-round.h | 205 +++++
 host/include/generic/host/crypto/aes-round.h |  33 +
 host/include/i386/host/cpuinfo.h             |   1 +
 host/include/i386/host/crypto/aes-round.h    | 152 ++++
 host/include/ppc/host/cpuinfo.h              |  30 +
 host/include/ppc/host/crypto/aes-round.h     | 182 +++++
 host/include/ppc64/host/cpuinfo.h            |   1 +
 host/include/ppc64/host/crypto/aes-round.h   |   1 +
 host/include/x86_64/host/crypto/aes-round.h  |   1 +
 include/crypto/aes-round.h                   | 164 ++++
 include/crypto/aes.h                         |  30 -
 target/arm/helper.h                          |   2 +
 target/i386/ops_sse.h                        |  60 +-
 tcg/ppc/tcg-target.h                         |  16 +-
 target/arm/tcg/sve.decode                    |   4 +-
 crypto/aes.c                                 | 780 ++++++++++++-------
 target/arm/tcg/crypto_helper.c               | 249 ++----
 target/arm/tcg/translate-a64.c               |  13 +-
 target/arm/tcg/translate-neon.c              |   4 +-
 target/arm/tcg/translate-sve.c               |   8 +-
 target/ppc/int_helper.c                      |  50 +-
 target/riscv/crypto_helper.c                 | 138 +---
 tests/tcg/aarch64/test-aes.c                 |  58 ++
 tests/tcg/i386/test-aes.c                    |  68 ++
 tests/tcg/ppc64/test-aes.c                   | 116 +++
 tests/tcg/riscv64/test-aes.c                 |  76 ++
 util/cpuinfo-aarch64.c                       |   2 +
 util/cpuinfo-i386.c                          |   3 +
 util/cpuinfo-ppc.c                           |  64 ++
 tcg/ppc/tcg-target.c.inc                     |  44 +-
 tests/tcg/multiarch/test-aes-main.c.inc      | 183 +++++
 tests/tcg/aarch64/Makefile.target            |   4 +
 tests/tcg/i386/Makefile.target               |   4 +
 tests/tcg/ppc64/Makefile.target              |   1 +
 tests/tcg/riscv64/Makefile.target            |  13 +
 util/meson.build                             |   2 +
 39 files changed, 2049 insertions(+), 724 deletions(-)
 create mode 100644 host/include/aarch64/host/crypto/aes-round.h
 create mode 100644 host/include/generic/host/crypto/aes-round.h
 create mode 100644 host/include/i386/host/crypto/aes-round.h
 create mode 100644 host/include/ppc/host/cpuinfo.h
 create mode 100644 host/include/ppc/host/crypto/aes-round.h
 create mode 100644 host/include/ppc64/host/cpuinfo.h
 create mode 100644 host/include/ppc64/host/crypto/aes-round.h
 create mode 100644 host/include/x86_64/host/crypto/aes-round.h
 create mode 100644 include/crypto/aes-round.h
 create mode 100644 tests/tcg/aarch64/test-aes.c
 create mode 100644 tests/tcg/i386/test-aes.c
 create mode 100644 tests/tcg/ppc64/test-aes.c
 create mode 100644 tests/tcg/riscv64/test-aes.c
 create mode 100644 util/cpuinfo-ppc.c
 create mode 100644 tests/tcg/multiarch/test-aes-main.c.inc

-- 
2.34.1

