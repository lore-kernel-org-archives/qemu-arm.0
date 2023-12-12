Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1024230ejo;
        Tue, 12 Dec 2023 08:29:41 -0800 (PST)
X-Received: by 2002:a05:600c:4296:b0:40b:5e21:c597 with SMTP id v22-20020a05600c429600b0040b5e21c597mr2177297wmc.101.1702398581260;
        Tue, 12 Dec 2023 08:29:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398581; cv=none;
        d=google.com; s=arc-20160816;
        b=b3oWPxlytVaobeF5V6YsCK9BMD36OGCzsfP0nVtihf1RFtleGPLIemo1JXcnocJHH6
         hnuMhk7qc0sKC0lFhoZeWiOrDiXdpbbPdiLzn6tpEzbOsDndyocMA3Fioz4kj8if4rUV
         PDYsv6zJiMf6kUIXpSK2nIGrjPgjFpns7wILH0zdNaRX1NCKTYmWc2F96AR5JKLoFbxm
         TVS9CPIv5UPW7jDa2kHrpyGmGhP+R8CtckIsNDnyN7r2ymqgAvoRC1tad6d8S4Znn3is
         NSGvVRlqNqwQw5/fiZg7l1Vd3CVXxRI/48ujtZzaS/X7AtsxiogDSqvhc0A2h8/SuLpc
         aNXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=mn32UhI3GcAekEbpxlWbpPxY01K3QFuN0m3na/SgxOo=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=bb7cwdp1U40VPTmZuxhg63KD88JWjXULnPoomvvqw6tEbR66gA+HKXUQ/kCusIi7rr
         BOq0uU/DCcscbP3z2N3SOe+AjeEclIdbCrfv2+6xR6hk3W1nh8DlxJ7TourC4/4vmb5e
         PAVcUJjiccsX9IsHTukj2fgzd8N2QHjqI+Vf6E7hcc8Sbk63KHSFdl2nLZKn57Sk4MjN
         hGrO8bZkuQeOPmtPyMZHcYypNFyK09IwbOP+/uUH3HXN9MnqR498RXS9D2aT3t8I5C7C
         5nXiyauK8XQgf5cyCstD7nnTrWjFGx+3ccRBgFt/xmRxcfaTq50HVurntPn+Ftc/kcPn
         LhZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z97iQpk3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t21-20020a1709066bd500b00a1631f4cfc5sor2042370ejs.19.2023.12.12.08.29.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:29:41 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z97iQpk3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398581; x=1703003381; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mn32UhI3GcAekEbpxlWbpPxY01K3QFuN0m3na/SgxOo=;
        b=Z97iQpk3xhL7wDP/9q/qx1n1QCZwg1mr8AuEgbNIZ3qW00GbqteiNMnIi/q1HwhUl4
         Jr7A+U8E8BH+60Uq/74DKlHqERdjprBlU6tgBXx8x7ja542aiE6rvt1fmhNOZHuVeDW+
         GgNIsWN0uYXvlaET+A/kPx5bjuVuh7Ia7xB+cgt3I7l0S7/+nQvKyb1hm2p6ilalfcS/
         2POWAcaVg9aHzwlUBZUQ9FOQ6wDA1i3FeqxWyQXAkm11O/Iwv+AdKMpoBud93irerGxZ
         9Bp/eD8+XyWExmBTodzCj5ThBYE4bkeTu1P86QiFip7qz9UcnPQrBx/7Qp86okuy9kb3
         R4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398581; x=1703003381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mn32UhI3GcAekEbpxlWbpPxY01K3QFuN0m3na/SgxOo=;
        b=jfbFepKiTgCf5YiQtWzcdX0VLtwEd/0MK5VNIKoBn1vRK2WljZUBr7pI4uQi1goQsb
         dLNyenwKKctiE4eLed3a4Hn2dS2rXgIb2mgBufHyxmfsD2DPOBKryFpiQtAHfJBnQIYZ
         ZTGTt+It/JkG+D/orFS0wnRjycwdwSqg5suPfpzXH+a3uLlotJHXWoF2qpTbuwUzgrHt
         GfkXkZ55Ib7Ehw3hxIV8Xn4S49hsvI479+jfQN8ZylcY2xF1+JMb5wjwBFsRsBe35F2X
         k0IrTXh8wK5I5LLOCaUGH92lj4DQffAjiNfbpa4rtetKz41VSmj5nsTNP5pl4SYRs3/A
         OJKw==
X-Gm-Message-State: AOJu0Yx6RWqXeCAp7C1F0anoqCqeB7i4/7275Oqn5GPo5x+vN1RK9tXP
	TGGQr4++b/tWN9NSJwinaBkAsV02A5bKi4d9smpf2g==
X-Google-Smtp-Source: AGHT+IHRk+gIjuiFARCTFPKGQm2celLuQGbNlhDK052m2YGVn9t5AwNYdwsDUm5L6tEhCWSqFvk6lw==
X-Received: by 2002:a17:907:9411:b0:a1d:9697:73a2 with SMTP id dk17-20020a170907941100b00a1d969773a2mr2865365ejc.93.1702398580756;
        Tue, 12 Dec 2023 08:29:40 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id ul5-20020a170907ca8500b00a1f7b445f5dsm5241984ejc.124.2023.12.12.08.29.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:29:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/33] hw/cpu/arm: Remove one use of qemu_get_cpu() in A7/A15 MPCore priv
Date: Tue, 12 Dec 2023 17:29:00 +0100
Message-ID: <20231212162935.42910-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Jd6yRcWiipoz

Hi,

When a MPCore cluster is used, the Cortex-A cores belong the the
cluster container, not to the board/soc layer. This series move
the creation of vCPUs to the MPCore private container.

Doing so we consolidate the QOM model, moving common code in a
central place (abstract MPCore parent).

This eventually allow removing one qemu_get_cpu() use, which we
want to remove in heterogeneous machines (machines using MPCore
are candidate for heterogeneous emulation).

Maybe these hw/cpu/arm/ files belong to hw/arm/...

Regards,

Phil.

Philippe Mathieu-Daudé (33):
  hw/arm/boot: Propagate vCPU to arm_load_dtb()
  hw/arm/fsl-imx6: Add a local 'gic' variable
  hw/arm/fsl-imx6ul: Add a local 'gic' variable
  hw/arm/fsl-imx7: Add a local 'gic' variable
  hw/cpu: Remove dead Kconfig
  hw/cpu/arm: Rename 'busdev' -> 'gicsbd' in a15mp_priv_realize()
  hw/cpu/arm: Alias 'num-cpu' property on TYPE_REALVIEW_MPCORE
  hw/cpu/arm: Declare CPU QOM types using DEFINE_TYPES() macro
  hw/cpu/arm: Merge {a9mpcore.h, a15mpcore.h} as cortex_mpcore.h
  hw/cpu/arm: Introduce abstract CORTEX_MPCORE_PRIV QOM type
  hw/cpu/arm: Have A9MPCORE/A15MPCORE inheritate common
    CORTEX_MPCORE_PRIV
  hw/cpu/arm: Create MPCore container in QOM parent
  hw/cpu/arm: Handle 'num_cores' property once in MPCore parent
  hw/cpu/arm: Handle 'has_el2/3' properties once in MPCore parent
  hw/cpu/arm: Handle 'gic-irq' property once in MPCore parent
  hw/cpu/arm: Handle GIC once in MPCore parent
  hw/cpu/arm: Document more properties of CORTEX_MPCORE_PRIV QOM type
  hw/cpu/arm: Replace A15MPPrivState by CortexMPPrivState
  hw/cpu/arm: Introduce TYPE_A7MPCORE_PRIV for Cortex-A7 MPCore
  hw/cpu/arm: Consolidate check on max GIC spi supported
  hw/cpu/arm: Create CPUs once in MPCore parent
  hw/arm/aspeed_ast2600: Let the A7MPcore create/wire the CPU cores
  hw/arm/exynos4210: Let the A9MPcore create/wire the CPU cores
  hw/arm/fsl-imx6: Let the A9MPcore create/wire the CPU cores
  hw/arm/fsl-imx6ul: Let the A7MPcore create/wire the CPU cores
  hw/arm/fsl-imx7: Let the A7MPcore create/wire the CPU cores
  hw/arm/highbank: Let the A9/A15MPcore create/wire the CPU cores
  hw/arm/vexpress: Let the A9/A15MPcore create/wire the CPU cores
  hw/arm/xilinx_zynq: Let the A9MPcore create/wire the CPU cores
  hw/arm/npcm7xx: Let the A9MPcore create/wire the CPU cores
  hw/cpu/a9mpcore: Remove legacy code
  hw/cpu/arm: Remove 'num-cpu' property alias
  hw/cpu/arm: Remove use of qemu_get_cpu() in A7/A15 realize()

 MAINTAINERS                    |   3 +-
 include/hw/arm/aspeed_soc.h    |   5 +-
 include/hw/arm/boot.h          |   4 +-
 include/hw/arm/exynos4210.h    |   6 +-
 include/hw/arm/fsl-imx6.h      |   6 +-
 include/hw/arm/fsl-imx6ul.h    |   8 +-
 include/hw/arm/fsl-imx7.h      |   8 +-
 include/hw/arm/npcm7xx.h       |   3 +-
 include/hw/cpu/a15mpcore.h     |  44 -------
 include/hw/cpu/a9mpcore.h      |  39 -------
 include/hw/cpu/cortex_mpcore.h | 135 ++++++++++++++++++++++
 hw/arm/aspeed_ast2600.c        |  61 ++++------
 hw/arm/boot.c                  |  11 +-
 hw/arm/exynos4210.c            |  60 ++++------
 hw/arm/exynos4_boards.c        |   6 +-
 hw/arm/fsl-imx6.c              |  84 ++++----------
 hw/arm/fsl-imx6ul.c            |  65 ++++-------
 hw/arm/fsl-imx7.c              | 103 +++++------------
 hw/arm/highbank.c              |  56 ++-------
 hw/arm/mcimx6ul-evk.c          |   3 +-
 hw/arm/mcimx7d-sabre.c         |   3 +-
 hw/arm/npcm7xx.c               |  48 ++------
 hw/arm/realview.c              |   4 +-
 hw/arm/sabrelite.c             |   4 +-
 hw/arm/vexpress.c              |  60 +++-------
 hw/arm/virt.c                  |   2 +-
 hw/arm/xilinx_zynq.c           |  30 ++---
 hw/cpu/a15mpcore.c             | 179 +++++++++++++----------------
 hw/cpu/a9mpcore.c              | 138 +++++++++-------------
 hw/cpu/arm11mpcore.c           |  23 ++--
 hw/cpu/cortex_mpcore.c         | 202 +++++++++++++++++++++++++++++++++
 hw/cpu/realview_mpcore.c       |  30 ++---
 hw/arm/Kconfig                 |   8 +-
 hw/cpu/Kconfig                 |   8 --
 hw/cpu/meson.build             |   1 +
 35 files changed, 689 insertions(+), 761 deletions(-)
 delete mode 100644 include/hw/cpu/a15mpcore.h
 delete mode 100644 include/hw/cpu/a9mpcore.h
 create mode 100644 include/hw/cpu/cortex_mpcore.h
 create mode 100644 hw/cpu/cortex_mpcore.c
 delete mode 100644 hw/cpu/Kconfig

-- 
2.41.0
