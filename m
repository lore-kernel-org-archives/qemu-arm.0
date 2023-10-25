Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2541855ejb;
        Tue, 24 Oct 2023 23:59:13 -0700 (PDT)
X-Received: by 2002:a17:907:749:b0:9b9:325f:9be7 with SMTP id xc9-20020a170907074900b009b9325f9be7mr11437141ejb.42.1698217153173;
        Tue, 24 Oct 2023 23:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698217153; cv=none;
        d=google.com; s=arc-20160816;
        b=WoyEVq11IY7Q+j3a7I9GVmhMkVi4nUw1gKK5uAkD7SL8jeXhoutf1qcQ+ROFyxcsgb
         40u9yYQDkTLnKfST60D5zKAFNoGD4YHmhsEQ+MSR/+VCIsBuRvtr7BNjkfSvaEhwovny
         eNYDA/nHcCe42I22cU7oegu9Ac+Vl03dAofxLwyDtlUAs0vg9zq2l9tr4PLKycsz+wHG
         5iZvuKXbmBS4b69jyvI9oknqBVkO7Z0Ze+V7VwwoynOkf5S2uojiedQN9CUzyjPn4Uio
         ajrCtOP/2LxSDTJ4LtkAICWT2iVmF86gTtYrQ9u7xHUxev9e/1XPUa9uA7RMXhzmqAJa
         0cog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=YzPUlHkDa7ZGEtBjlxYdFOPbay5a/eaftzCExJs7XYo=;
        fh=6Xu9jKvjZ9YsdTi5CucDkHDgZWksQw+bWorqmfsKdLQ=;
        b=jSHA0xvBhfI2hfzzOlLiPFmLg2n174/Pq6xca62DvDuvDKeCFI6bFdVhcmZuNZiprM
         pnv38mj5CmWuzpdI2HC0gPxvI+1BTCIQNLYdNPXjQp/DVtE6aBLAHziNCZBKQuOLhCo4
         aAGL6ugRFj1RGv4t/CvOWQn2ssZKE16aCWtC/E4eNi9m8DXa/ezNm27uN7+67LtMC7UF
         yCFpL7JDJ1itAfTnfgxHz8n471j1UYUFU4cPeXswoY3DlMw7AXwVMeANmYIEfVjCIjVQ
         lQnX5BikFHCWfFfuGC9wdED4CEv5pGNpPn9XlKHpuM4FHKXK1Qg+wnIMQNtyVoPXCLbq
         j94A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hNFChghs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jz19-20020a17090775f300b009ae387f043csor3112402ejc.9.2023.10.24.23.59.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 24 Oct 2023 23:59:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hNFChghs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698217153; x=1698821953; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YzPUlHkDa7ZGEtBjlxYdFOPbay5a/eaftzCExJs7XYo=;
        b=hNFChghs+SJNAd7NVViAcKYIKn3kwNweBk4IW1vHQesStHNTE7xKEeTcYSJ7G1uqUT
         nwNwHz5aek+CsFM/40/W7/eVum4PbLHxLx2hoXmS/t8w3vH1bumqTmIz8MJ45fa9DV/H
         0XPwy+0oCdqvZlH5b78QZdDZLwa+Kqc/sqKKA4ot4ur8HEiYzwehGs5RZFwCl5tUTNZv
         +FHd8hF9Yd58E2Y/vpls5VHxBAKAmvnID2ZEeJVIcZKbQlj7qZo8XrxR4PLVUkHK8q9M
         YGbWdOHxKqMMDMkI7/4QLIEPEB8M9HPpZEjZx10DymlHJmtkB3KoIYVjNqWygKH/yWPb
         ADPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698217153; x=1698821953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzPUlHkDa7ZGEtBjlxYdFOPbay5a/eaftzCExJs7XYo=;
        b=KGi2ZJ43PFhUjRaKrNb9PDOojhvxS0GOYpWMG6C8GnX5Hbb/Alr3z+bzcS2Tv5Q8FW
         rYZfiLTaaROXTlSIvc1RmvTMrIGLaOz4xSvTPAoKfY1E93jQzEqCq8GlkIedYbqXGUZ3
         goyKKF1ufuS/BQa6sBRKsaHl6NmpHaOhSkFROcn68/+h6G+oYhKEJog1qG2HzYoOQLOA
         1NxffZqul0WxEtiQDAuMeA8ZbSyuWNQ/FgJZbm40BAOQuLqn+fQ/NUYP4C+zllKDgJv+
         JtdE8bWFV1NNGIUvYzTt8UJppeCGvnEJpFL9nRwn60mkFSoBvY0TZjyoqOo6PJaOMdVL
         FVSw==
X-Gm-Message-State: AOJu0Ywwaa3eMGWQOQayWhPv7ZtzPWqmVGrHNyvJwaae3pBhlT5gDhT7
	nQb/GseZmjMP2Yj8p7JJ5MUspDx0
X-Google-Smtp-Source: AGHT+IEsaALLE46GxFyW/81xdFZH7oNav6Px5ouGogxti4B4zZIeJcyaK0woSITg1kPflggkOpkLFw==
X-Received: by 2002:a17:906:fd8b:b0:9ae:54c3:c627 with SMTP id xa11-20020a170906fd8b00b009ae54c3c627mr10825841ejb.71.1698217152803;
        Tue, 24 Oct 2023 23:59:12 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr. [176.171.219.76])
        by smtp.gmail.com with ESMTPSA id g15-20020a170906348f00b009c387ff67bdsm9322263ejb.22.2023.10.24.23.59.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Oct 2023 23:59:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	qemu-arm@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/arm: Avoid using 'first_cpu' when first ARM CPU is reachable
Date: Wed, 25 Oct 2023 08:59:09 +0200
Message-ID: <20231025065909.57344-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: N4ApY4oEs0QR

Prefer using a well known local first CPU rather than a global one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/bananapi_m2u.c   | 2 +-
 hw/arm/exynos4_boards.c | 7 ++++---
 hw/arm/orangepi.c       | 2 +-
 hw/arm/realview.c       | 2 +-
 hw/arm/xilinx_zynq.c    | 2 +-
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c
index a7c7a9f96d..8f24b18d8c 100644
--- a/hw/arm/bananapi_m2u.c
+++ b/hw/arm/bananapi_m2u.c
@@ -128,7 +128,7 @@ static void bpim2u_init(MachineState *machine)
     bpim2u_binfo.loader_start = r40->memmap[AW_R40_DEV_SDRAM];
     bpim2u_binfo.ram_size = machine->ram_size;
     bpim2u_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
-    arm_load_kernel(ARM_CPU(first_cpu), machine, &bpim2u_binfo);
+    arm_load_kernel(&r40->cpus[0], machine, &bpim2u_binfo);
 }
 
 static void bpim2u_machine_init(MachineClass *mc)
diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index ef5bcbc212..b0e13eb4f0 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -134,9 +134,10 @@ exynos4_boards_init_common(MachineState *machine,
 
 static void nuri_init(MachineState *machine)
 {
-    exynos4_boards_init_common(machine, EXYNOS4_BOARD_NURI);
+    Exynos4BoardState *s = exynos4_boards_init_common(machine,
+                                                      EXYNOS4_BOARD_NURI);
 
-    arm_load_kernel(ARM_CPU(first_cpu), machine, &exynos4_board_binfo);
+    arm_load_kernel(s->soc.cpu[0], machine, &exynos4_board_binfo);
 }
 
 static void smdkc210_init(MachineState *machine)
@@ -146,7 +147,7 @@ static void smdkc210_init(MachineState *machine)
 
     lan9215_init(SMDK_LAN9118_BASE_ADDR,
             qemu_irq_invert(s->soc.irq_table[exynos4210_get_irq(37, 1)]));
-    arm_load_kernel(ARM_CPU(first_cpu), machine, &exynos4_board_binfo);
+    arm_load_kernel(s->soc.cpu[0], machine, &exynos4_board_binfo);
 }
 
 static void nuri_class_init(ObjectClass *oc, void *data)
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
index d0eca54cd9..f3784d45ca 100644
--- a/hw/arm/orangepi.c
+++ b/hw/arm/orangepi.c
@@ -106,7 +106,7 @@ static void orangepi_init(MachineState *machine)
     orangepi_binfo.loader_start = h3->memmap[AW_H3_DEV_SDRAM];
     orangepi_binfo.ram_size = machine->ram_size;
     orangepi_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
-    arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);
+    arm_load_kernel(&h3->cpus[0], machine, &orangepi_binfo);
 }
 
 static void orangepi_machine_init(MachineClass *mc)
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 8f89526596..132217b2ed 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -384,7 +384,7 @@ static void realview_init(MachineState *machine,
     realview_binfo.ram_size = ram_size;
     realview_binfo.board_id = realview_board_id[board_type];
     realview_binfo.loader_start = (board_type == BOARD_PB_A8 ? 0x70000000 : 0);
-    arm_load_kernel(ARM_CPU(first_cpu), machine, &realview_binfo);
+    arm_load_kernel(cpu, machine, &realview_binfo);
 }
 
 static void realview_eb_init(MachineState *machine)
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 8dc2ea83a9..dbb9793aa1 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -349,7 +349,7 @@ static void zynq_init(MachineState *machine)
     zynq_binfo.board_setup_addr = BOARD_SETUP_ADDR;
     zynq_binfo.write_board_setup = zynq_write_board_setup;
 
-    arm_load_kernel(ARM_CPU(first_cpu), machine, &zynq_binfo);
+    arm_load_kernel(cpu, machine, &zynq_binfo);
 }
 
 static void zynq_machine_class_init(ObjectClass *oc, void *data)
-- 
2.41.0
