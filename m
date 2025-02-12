Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp963450njb;
        Wed, 12 Feb 2025 04:38:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVyWdiH9DsjV87ZUDdna3sB+PidSX2fgU2XJBbAmfDY1ZqLcEXg/DbHoEmJBqxqsGfLxmHC5bwEPljjlw==@linaro.org
X-Google-Smtp-Source: AGHT+IFiTdcxZv7h45wDWZkeGDNNVJjAgaUMUcJ2DOZ30HiPWUVRjDGDvVdkRSlpdVVdv0+AldSS
X-Received: by 2002:a05:6214:d0d:b0:6d8:aa14:f5b8 with SMTP id 6a1803df08f44-6e46edb5303mr42263236d6.40.1739363889843;
        Wed, 12 Feb 2025 04:38:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739363889; cv=none;
        d=google.com; s=arc-20240605;
        b=Y/KGxIPtlHh0bcZjG1e6r4C5nM8EEHeZbbCj4Hrd2pTuMy9WXqB+v9Qy/Kxv6nbOOD
         qdVGmnoyiEJNj5qPq3f5HzlKXojEMUxG/llhV4EC03gjuydUk5DCZo2fx3ah767q2M0p
         3ekAlplp8HQocNdX95FY0LWfZMCXT0RyWHXBysfV9RwZj1qqnvw3rNIJtQog17jvYBUU
         X7x9CXp/9kuCAY3pDtmygztOexuXiA5XmzoJTmfuoupBoi5ufT7Dn7ah5AYvzu094oFI
         lVK8PquZ5Zjd1yb/GrgF6krzqM88IGQC8ZXNvfpHMB4FzGzjI/ywUmREPwPJuA0JkWnF
         Z1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=leFbxDuw1M+6UQ+DVIc5aS33qKInR/m/tUBQajPUeGI=;
        fh=jK5cRCDdi8xlqnMmqhNRELJYCqLv7XiidvaP7Y9JiCI=;
        b=Mr7JE1708TJFcp9cur9MCUfP86pM8J2jnPVyWEGrS8BLlqpS350m6AMxkasGxbACZm
         aEgBCEbfXG8Gxsni9oI+Adc/vs3ybTpZ269SCqJ2nv2k6/JJ5xpkLE9ktFZOHs0F+P17
         tDx2JEj4UswAX0nvie/UJ12JH1/Oqosuyx34X7+xJnSfHtUQKQXM6/Nj+HS3Y4RYt+2I
         23TpB9UOaYf3Ndenub46MAaFNAsPsqfBTkcgFKcoKhVsLxowFqqvBN0mN2fae6s8Wk+4
         8dQJbUZzxSHpLMzbKNFRofVdlfu9kt3bUypp6ju7sEkeYl31vfmlb2jfp1sQlVxstU6V
         DgWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bjF4z4oI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e49b5a9871si13411226d6.195.2025.02.12.04.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 04:38:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bjF4z4oI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiBza-0003SR-41; Wed, 12 Feb 2025 07:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBzF-0003NE-Kl
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:37:06 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBzD-0000MP-Gr
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:37:05 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-38dcae0d6dcso3057066f8f.1
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 04:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739363822; x=1739968622; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=leFbxDuw1M+6UQ+DVIc5aS33qKInR/m/tUBQajPUeGI=;
 b=bjF4z4oIw1QwSYwoM1PVwgmCGeoxlet/GGNLjCuFnSVspRRxzzuuQlvAc3QW4Fjmzb
 o1t1/0XZYFKjepdmDj+lig7imqcwN9w/pUfEOnl+sDS5cTQN+oJh3JpNuViRj/8hjyiZ
 /XVhjkVVFvnvsjvr+hC9FKNMqhDrlXmJKDoXMS3xOxhBPme7N2b8IHKTTlc+QIBhnExd
 +pfMGCT69UB/7+ruFwsmSD7T98EDR0I2xFDNipMi/lIYRc4oJiVB8yHfxTCZ5LbocIs4
 CVLAvLnMfa7dRYKrbnOvxeKv6EhEN33qhjly+cQ5tUN4RMGBUQAYKCR9mwZgAXCmgxsl
 31+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739363822; x=1739968622;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=leFbxDuw1M+6UQ+DVIc5aS33qKInR/m/tUBQajPUeGI=;
 b=rilLbt7c+d6tezMvdwFD/H0rpHz5v4vuSaj/RuXK0m08jgQcsqOopuPas7MJCl9KO4
 tsIK4mev90Eg0hB87CR9Oa9o+f+srimkXxBovWbRBqcIRRU0OpAw9uTEFsu1h2GRJmOg
 oRFycL6d5O72jTEsJnsmqPsX3ij1+x7/aeG2ASew7ytG4uwvN7qDoC/UyKg6cvUrcfDd
 aPTAzhUPNaAeenZRQxgfl05A9+0Jqoowb8KyjcWeDIvyPPnwARk6HS4bDV7BrVPSmdVG
 8xb8EwkuKw5UCMD1Bgbw6PUTY8rL0DVczU3EKZIewEwkLycL9oKqU25BxdmeNTI0WJKh
 dGTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPuGiTZJYYvZ+kFmnDmhsWQ1HJ/uTvWT6zbXK5exFxJwR//d/PLmOf5ckjH5MUF8peHOUVSaHkuw==@nongnu.org
X-Gm-Message-State: AOJu0YxmIt0RnI0Jo0hyI0jf2/xwscmzu8frh2wtM5OTFfJIg5EnNuxO
 YDVP3Pl3PvMpSeEXx877Ee3fFKykc01559drv4VuGeXvcwGW3dcJpm02AIJof0g=
X-Gm-Gg: ASbGncuyH9+K0emO4gPYaN7bFSgwLDiN49Jv3BtO2Ea/vCmaPYyn1lyBO1acnlGls9D
 0won/j2yTWrSoJg7us3+v+Y5Ai9YAS03GgE30S7KhaCh+WiWRkFwgawK4ppoiueFimuP734v80s
 K7y3O1iN8G5xpN7BBOzQ7m/nWqs/cJ/pBRQO7xIofMvb2ANzQVEoyaB+3b4zEa66OxIQa4vgmYi
 x0ArailKW9rjmIyylqmM29Hkus0eWtrQ2DNX3y1+M14JoTFm0713d+k0BMw2lb/dsLKBpNSsXGV
 iJzkBUa2n8/t7x5Fdghcm1RYBDZbm+BlqFdCG+eX1Up55fkzWHc/midL9dVTTQ1V1Q==
X-Received: by 2002:a5d:59ab:0:b0:38c:5d42:1516 with SMTP id
 ffacd0b85a97d-38dea2e9023mr2453934f8f.34.1739363821782; 
 Wed, 12 Feb 2025 04:37:01 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd02e2a90sm13344942f8f.98.2025.02.12.04.37.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 12 Feb 2025 04:37:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v7 00/10] hw/microblaze: Allow running cross-endian vCPUs
Date: Wed, 12 Feb 2025 13:36:49 +0100
Message-ID: <20250212123659.52764-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: M/aEYwN6DG1B

Since v6:
- Simplify MemoryRegionOps indexing (Thomas)

Since v5:
- Introduce QAPI EndianMode
- Update RISCV machine while rebasing
- Fixed INTC use on PPC (Thomas)
- Dropped patch adding more machines (Daniel)

Since v4 & v3:
- Addressed Thomas review comments

Since v2:
- Addressed Richard's review comments

Since v1:
- Make device endianness configurable (Edgar)
- Convert more Xilinx devices
- Avoid preprocessor #if (Richard)
- Add R-b tags

Philippe Mathieu-Daudé (10):
  hw/qdev-properties-system: Introduce EndianMode QAPI enum
  hw/intc/xilinx_intc: Make device endianness configurable
  hw/net/xilinx_ethlite: Make device endianness configurable
  hw/timer/xilinx_timer: Make device endianness configurable
  hw/char/xilinx_uartlite: Make device endianness configurable
  hw/ssi/xilinx_spi: Make device endianness configurable
  tests/functional: Explicit endianness of microblaze assets
  tests/functional: Allow microblaze tests to take a machine name
    argument
  tests/functional: Remove sleep() kludges from microblaze tests
  tests/functional: Have microblaze tests inherit common parent class

 qapi/common.json                              | 16 +++++
 include/hw/qdev-properties-system.h           |  7 +++
 hw/char/xilinx_uartlite.c                     | 34 +++++++----
 hw/core/qdev-properties-system.c              | 11 ++++
 hw/intc/xilinx_intc.c                         | 59 ++++++++++++++-----
 hw/microblaze/petalogix_ml605_mmu.c           |  3 +
 hw/microblaze/petalogix_s3adsp1800_mmu.c      |  6 ++
 hw/net/xilinx_ethlite.c                       | 29 +++++++--
 hw/ppc/virtex_ml507.c                         |  2 +
 hw/riscv/microblaze-v-generic.c               |  5 ++
 hw/ssi/xilinx_spi.c                           | 32 +++++++---
 hw/timer/xilinx_timer.c                       | 43 ++++++++++----
 .../functional/test_microblaze_s3adsp1800.py  | 34 +++++++++--
 .../test_microblazeel_s3adsp1800.py           | 32 ++--------
 14 files changed, 229 insertions(+), 84 deletions(-)

-- 
2.47.1

