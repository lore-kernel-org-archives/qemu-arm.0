Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp5007960njc;
        Fri, 8 Nov 2024 07:44:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUEi8wF/5kOVSaXxTe49H3YXhJ/D7SJx4HBE4Qjma+iBAaVOWRzI37dr1jIZ2ECKuOUmg9ZphGMjJzTEA==@linaro.org
X-Google-Smtp-Source: AGHT+IGE9KyB/mj77VExS++MxT4gA+UjLq1vL1zm6ufN2F+hVf/iU9ybWHjP+u55lQc/v7+Tsi9I
X-Received: by 2002:ac8:5904:0:b0:460:b5ac:c263 with SMTP id d75a77b69052e-463094258f5mr43982881cf.53.1731080650912;
        Fri, 08 Nov 2024 07:44:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731080650; cv=none;
        d=google.com; s=arc-20240605;
        b=B4cYtsxGkuC0sOGYL43weePvlFsYAgpTZDOqs5E4MZjapCt3V2VtTjAvsayzmCA8lU
         FvNniy/K7SmAdrlDaUv03989DPmih/gEgYvzEoY5RZ0Con8zc43/Rs81IDN9bn37+n4V
         g7f7e42QY8pF729oDRq6AzVDwD+gs/BxmsltCH3uriNNgV7YAcLM+2QCX2Ef6tDzWqAr
         SC3FgQvfKgyYbNlUug+MBOCeGJxDjrls5q2njIy19BOe8IyzhxCKJYvswmBOAedG1Ucx
         bki/a5dZ0lLaqkWl1uVy+QrHhjXku/z7yhxhs5eVplW9OGJxeNBlNAOxF+cmN3d68bgd
         2JWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=OGYYu9uDLFU2RYpWoNuF1bsweDbG4J7PO3OV7GstpRk=;
        fh=0a7p1wsxUT1B5yi1P5VpHgCY5gWEZsIIH7YRjrfsGGw=;
        b=C+Qz5FGRmTJwuAZSdSk6X8v7hZRR/1RURv4YDOTTMyYkxvbArkChQsOUpORrzOVUf2
         lzr8Punlhx6qILmBVLBqbbHEdUgAJQjCJfXwPwxByuwcP5/19mMMIdwWYhfNKjso7q25
         9c9vjbfmUf8azovaspX7rtFuciXwAYT8XA9dyEmAXR7pPVN/rUMr48CykPzjp1tn9UlC
         AWvx5Ss7f5qxq4oT3xrxSF0OXBrJAEm5qw178P6J14VUYd9g/fnPas6o3h+EKZ3q/4fV
         T9tQlWqDbsbL5J5/a6CKg6R+xl8K+3N2f/l6H+0U8yk+kTdIMOaUz15Kb6IE1zKTjvN2
         +k3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCOsmtL+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff6c3f1esi43955891cf.714.2024.11.08.07.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 07:44:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pCOsmtL+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9R92-0002jv-Dq; Fri, 08 Nov 2024 10:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9R8u-0002f6-Ts
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:43:26 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9R8r-0005MS-WB
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:43:24 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d3ecad390so1998716f8f.1
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 07:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731080600; x=1731685400; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OGYYu9uDLFU2RYpWoNuF1bsweDbG4J7PO3OV7GstpRk=;
 b=pCOsmtL+3JT6YiiGrRaQuqjRP/lgpYpWHnDMN1i3K2/p+M1mseYn3j01IeseoYLJJb
 OWhij6TLI4zPLcivqv4SAlFWnLyqO45XOfagpwWzLOkPmOexCAPRxgx/9FSDRIe+kChk
 2fKP3HQTWmdiptCAZBLBo57UTb4FLtopPlvXajtaOUsKRhU7tXbc5WxoU0D7rv2RQph0
 7J0MG1WAzdrHQJxpHkhMNKfAhQ6X6+45Gk9kgFERNLJ98nXyBVsMJSGijU6UXpQj5Nq0
 ZTme9ZTGJNfvFQ5vCSxuh+kBw2+NBMMoy9zQE+VtzxViaRQSpzElhmZyzdTQnXf6SBG+
 2anQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731080600; x=1731685400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OGYYu9uDLFU2RYpWoNuF1bsweDbG4J7PO3OV7GstpRk=;
 b=mMVfTUWO6L4ifuL0j5qvdHCR2GzL+udCjINMd3jMdewkJRgrbNjIVQW7ikjE3ZJutr
 873jl1uaTug+s4a99W7puYRnL/Lh4VZumSqUIyadce7ymqIuXbJZCWCrsN/yS9ZNRlGW
 K3nxrkP1EXLq+Qk9u1fqDFoLcnF4wmnC9DhjLx3lp0u6tY3byBMzaowBzcRLzTRqEd4W
 mHIGjRVE063I0JPLZbdrZCigGCTzO2vT+r4GDEzSJ8IxuoaObMy28IREiD56EdGArFoO
 q3UeiH7eiH0ag57/U32QQ7KO2O76XO2e4l9U7Se6hM8HA8GsEVEOZlg84RyIwvC2yiua
 HeRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrYiK0OloiZKyOv1KjMAAoxG7W2qr6D+rviTIfhPQn6YPSfxwUz+yzUHWJcfPg5zurmdkRxav6zg==@nongnu.org
X-Gm-Message-State: AOJu0YxM2qEVSF0X0Yam/QMgPG/Vjr7UsGe2VU35T0c5oLyNrkoWbNz7
 x7IQFZPRtfk2eGnG4nHY3IGj3C4T6CkZ5fpw++yn8/dUkk4mikFX54X6Q15rEbY=
X-Received: by 2002:a05:6000:1548:b0:37e:c4e3:f14b with SMTP id
 ffacd0b85a97d-381f1c83bf0mr2695037f8f.23.1731080600315; 
 Fri, 08 Nov 2024 07:43:20 -0800 (PST)
Received: from localhost.localdomain ([154.14.63.34])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9ea7c3sm5381722f8f.80.2024.11.08.07.43.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Nov 2024 07:43:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 00/17] hw/microblaze: Allow running cross-endian vCPUs
Date: Fri,  8 Nov 2024 15:43:00 +0000
Message-ID: <20241108154317.12129-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: F4V8P/BsoBPo

Missing review: 4 (new) & 10

Since v2:
- Addressed Richard's review comments

Since v1:
- Make device endianness configurable (Edgar)
- Convert more Xilinx devices
- Avoid preprocessor #if (Richard)
- Add R-b tags

Make machines endianness-agnostic, allowing to run a big-endian vCPU
on the little-endian 'qemu-system-microblazeel' binary, and a little
endian one on the big-endian 'qemu-system-microblaze' binary.

Tests added, following combinations covered:
- little-endian vCPU using little-endian binary (in-tree)
- little-endian vCPU using big-endian binary (new)
- big-endian vCPU using little-endian binary (new)
- big-endian vCPU using big-endian binary (in-tree)

To make a target endian-agnostic we need to remove the MO_TE uses.
In order to do that, we propagate the MemOp from earlier in the
call stack, or we extract it from the vCPU env (on MicroBlaze the
CPU endianness is exposed by the 'ENDI' bit).

Next step: Look at unifying binaries.

Please review,

Phil.

Philippe Mathieu-Daudé (17):
  hw/microblaze: Restrict MemoryRegionOps are implemented as 32-bit
  hw/microblaze: Propagate CPU endianness to microblaze_load_kernel()
  hw/intc/xilinx_intc: Make device endianness configurable
  RFC hw/net/xilinx_ethlite: Simplify by having configurable endianness
  RFC hw/timer/xilinx_timer: Allow down to 8-bit memory access
  hw/timer/xilinx_timer: Make device endianness configurable
  hw/char/xilinx_uartlite: Make device endianness configurable
  hw/ssi/xilinx_spi: Make device endianness configurable
  hw/ssi/xilinx_spips: Make device endianness configurable
  hw/arm/xlnx-zynqmp: Use &error_abort for programming errors
  target/microblaze: Explode MO_TExx -> MO_TE | MO_xx
  target/microblaze: Set MO_TE once in do_load() / do_store()
  target/microblaze: Introduce mo_endian() helper
  target/microblaze: Consider endianness while translating code
  hw/microblaze: Support various endianness for s3adsp1800 machines
  tests/functional: Explicit endianness of microblaze assets
  tests/functional: Add microblaze cross-endianness tests

 hw/microblaze/boot.h                          |  4 +-
 include/hw/ssi/xilinx_spips.h                 |  1 +
 target/microblaze/cpu.h                       |  7 +++
 hw/arm/xilinx_zynq.c                          |  1 +
 hw/arm/xlnx-zynqmp.c                          | 40 +++++--------
 hw/char/xilinx_uartlite.c                     | 31 ++++++----
 hw/intc/xilinx_intc.c                         | 50 ++++++++++++----
 hw/microblaze/boot.c                          |  8 +--
 hw/microblaze/petalogix_ml605_mmu.c           |  4 +-
 hw/microblaze/petalogix_s3adsp1800_mmu.c      | 58 ++++++++++++++++---
 hw/microblaze/xlnx-zynqmp-pmu.c               |  2 +-
 hw/net/xilinx_ethlite.c                       | 42 +++++++++-----
 hw/ppc/virtex_ml507.c                         |  1 +
 hw/ssi/xilinx_spi.c                           | 24 +++++---
 hw/ssi/xilinx_spips.c                         | 36 +++++++-----
 hw/timer/xilinx_timer.c                       | 33 +++++++----
 target/microblaze/translate.c                 | 49 ++++++++++------
 .../functional/test_microblaze_s3adsp1800.py  | 27 ++++++++-
 .../test_microblazeel_s3adsp1800.py           | 25 +++++++-
 19 files changed, 309 insertions(+), 134 deletions(-)

-- 
2.45.2

