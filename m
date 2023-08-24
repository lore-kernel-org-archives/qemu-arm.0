Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp741301ejc;
        Thu, 24 Aug 2023 07:30:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO8gDkQREv3GVfOZFOGFeKa6voXT+az8o+gMDOy/xbCSNVT4qDoraqfAiTNwPnCjqnk8yp
X-Received: by 2002:a67:fb88:0:b0:44e:9d4f:1ffb with SMTP id n8-20020a67fb88000000b0044e9d4f1ffbmr1181366vsr.11.1692887446703;
        Thu, 24 Aug 2023 07:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692887446; cv=none;
        d=google.com; s=arc-20160816;
        b=HJkkI8sTutE0MAWoMb7xW450IAT2xC2jJN8g2nf6y9fBENemXF04voia68da7IhTom
         ueEDkxrTzVWV9Ui/O5W12h+jwgFSXUTHGoWJFkr+R0waCGKEe9AuKM/I/nDJKCPAMRtv
         hajHs0kXZtzaHjd0dbnsI/VbaIn6y1wsNrKM6qSDPgVvD+Ck1HrHBFDIfjjBjxa2MUt+
         /EJsT2BgumXcL7Ra7EvHRa1wzkU64FqveZr1qqg7dFwKY3ZaVwRkX47WJOK7f7Gf4kBf
         XpyUobGGDHs1XKjaigb+BAkrKOyPAYE5ykOyOcbzU9jNL43wk5IUWKEeHNiptShT5e2q
         F9/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=MF29GBhTNvUUmI0gukMZgybyAxbxiWyFk7P/UUSYLco=;
        fh=FstQSHJ5xalY0qvCfwQnzF4rG/Wi+NaC2f1qQ65wDU0=;
        b=gEHYe0sMfvD2PR2QqEk+Zlmw8z+wjL/lyIQSEWnb9eJVIlsY6ssCSIBHMdjg6OKCsv
         xIZ8mv9o/JRtSax5xkeofYSU0Wxq6aiojpiuanjoKPuvG9AjEh0BBVEfbybPceCPT0cU
         dRwDrc40I0fSXlgOdkdaUGh4WHxxnVxdvPBLLSnX9DKrsOv6JfbOXBNtgP4ulH7fhU4d
         n6If4AO6yGUrhqLX9zqZ8Ca9l5due3EMtnKti3+NaV7isyrrOk3d9C21bZfwVt8x/GIj
         9beSMh3YeyX8WOvFhRNGeCTpfgj5CgwVjJewq/dVPdxXNJg9Kw6E7ootoaG+NIMy8mNP
         yV7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=DMupJUrb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r23-20020a0cb297000000b0063d35244ef5si8442418qve.334.2023.08.24.07.30.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 07:30:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=DMupJUrb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZBLb-0007pq-GT; Thu, 24 Aug 2023 10:30:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBLZ-0007o7-MA
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:30:05 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBLX-0008OP-12
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:30:05 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1bf5c314a57so32221565ad.1
 for <qemu-arm@nongnu.org>; Thu, 24 Aug 2023 07:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692887401; x=1693492201;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MF29GBhTNvUUmI0gukMZgybyAxbxiWyFk7P/UUSYLco=;
 b=DMupJUrb1jLs+2bSPPXRxtOOLQTa8uU/E/JQMqTqmdXkHY8RHoMwoizqWsiVePod58
 4rrMGdk1pkFOXc5zt1f1Xb47rpMZ00EVJhB1iYXxPHSD1xyPO5zIBAkewmALtibo0B/v
 84PvcFCTx/WSyKFFf3l/h5gBoMEJsJYWUwJFwp1N+XbjUpNItEnMP2o8MDPuz34GFQJu
 R0blRo5iTYiLxy4uVPWVOQRr7lxwqWhC2fmYS2gDesv7eTobvfqLpF0YqgvkU36bsbqm
 ElA4essiBRaa+LcFAibldSsf7mfQG+JX2gsYjlJgrKoGAYTcQTktqexi0XWW6hdy6hcc
 cu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887401; x=1693492201;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MF29GBhTNvUUmI0gukMZgybyAxbxiWyFk7P/UUSYLco=;
 b=XCnvv0JlGDXVXH9jnoMj21+huG+waavLaDudRvaOM0So+fkrpiY/WDJb+2jKROtim4
 5ZRT01KqVUY+1SZ7oJuzDJHS8IJbzmYe1+zGoP+hgy0bLgLTvqjjpAZVl/UA2qb6+l5V
 k1Fjkp6M+QTqN5ej6ApbJJaN8FuhOeCluyJM5Vo/d42nZ5vgBM5Lj6SfOQeazhEwWAub
 6BsPMMZRpYaEciwKhCTf2Ugx0KuaE4Ag/6+9XeYjKem276zoACygo3+ApxVEd9Dfcikx
 tov/n4fxMsxA6622egmbcLeW/hV/CssL5DmXDHlqBQpyXJWUbZioxdh8ur552zEt6LkD
 K9/A==
X-Gm-Message-State: AOJu0Yz5XalGDRskwsDEwPUW/9ryUn/jryXkbo5Ua8gOxrERHzAgv2hr
 9s1nYkPiyAfsiXBYJbzi4I5KJHfnMOLkEGOQ3ck=
X-Received: by 2002:a17:90a:e285:b0:268:c7fc:b771 with SMTP id
 d5-20020a17090ae28500b00268c7fcb771mr11911928pjz.14.1692887400796; 
 Thu, 24 Aug 2023 07:30:00 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.191.205])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a17090a2bc600b00262fc3d911esm1666864pje.28.2023.08.24.07.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 07:29:58 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2 00/12] RISC-V: ACPI: Enable AIA, PLIC and update RHCT
Date: Thu, 24 Aug 2023 19:59:30 +0530
Message-Id: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62a.google.com
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
X-TUID: c9Gf0r71jMTT

This series primarily enables external interrupt controllers (AIA and PLIC)
in ACPI tables for RISC-V virt platform. It also updates RHCT with CMO and
MMU related information.

Below ECRs for these changes are approved by ASWG and will be
available in next ACPI spec release.

1) MADT (AIA) - https://drive.google.com/file/d/1oMGPyOD58JaPgMl1pKasT-VKsIKia7zR/view?usp=sharing
2) RHCT - https://drive.google.com/file/d/1sKbOa8m1UZw1JkquZYe3F1zQBN1xXsaf/view?usp=sharing

First two patches in this series are to migrate a couple of functions from
ARM architecture to common code so that RISC-V doesn't need to duplicate
the same.

The patch set is based on Alistair's riscv-to-apply.next branch.

These changes are also available in  riscv_acpi_b2_v2 branch at:
https://github.com/vlsunil/qemu/

Changes since v1:
	1) As per Igor's suggestion, migrated fw_cfg and virtio creation
	   functions to device specific file instead of generic aml-build.c.
	   Since ACPI is optional, new files are created and enabled for
	   build only when CONFIG_ACPI is enabled.

	2) As per Igor's suggestion, properties are added to the GPEX PCI
	   host to indicate MMIO ranges. The platform fw can initialize
	   these to appropriate values and the DSDT generator can fetch
	   the information from the host bus itself. This makes the code
	   generic instead of machine specific.

	3) Added PLIC patch from Haibo.

	4) Rebased to latest riscv-to-apply.next and added RB tags as
	   appropriate.


Sunil V L (12):
  hw/arm/virt-acpi-build.c: Migrate fw_cfg creation to common location
  hw/arm/virt-acpi-build.c: Migrate virtio creation to common location
  hw/riscv: virt: Make few IMSIC macros and functions public
  hw/riscv/virt-acpi-build.c: Add AIA support in RINTC
  hw/riscv/virt-acpi-build.c: Add IMSIC in the MADT
  hw/riscv/virt-acpi-build.c: Add APLIC in the MADT
  hw/riscv/virt-acpi-build.c: Add CMO information in RHCT
  hw/riscv/virt-acpi-build.c: Add MMU node in RHCT
  hw/pci-host/gpex: Define properties for MMIO ranges
  hw/riscv/virt: Update GPEX MMIO related properties
  hw/riscv/virt-acpi-build.c: Add IO controllers and devices
  hw/riscv/virt-acpi-build.c: Add PLIC in MADT

 hw/arm/virt-acpi-build.c        |  48 +----
 hw/nvram/fw_cfg-acpi.c          |  17 ++
 hw/nvram/meson.build            |   1 +
 hw/pci-host/gpex-acpi.c         |  13 ++
 hw/pci-host/gpex.c              |  12 ++
 hw/riscv/Kconfig                |   1 +
 hw/riscv/virt-acpi-build.c      | 342 +++++++++++++++++++++++++++++---
 hw/riscv/virt.c                 |  72 +++----
 hw/virtio/meson.build           |   1 +
 hw/virtio/virtio-acpi.c         |  28 +++
 include/hw/nvram/fw_cfg_acpi.h  |   9 +
 include/hw/pci-host/gpex.h      |  28 ++-
 include/hw/riscv/virt.h         |  26 +++
 include/hw/virtio/virtio-acpi.h |  11 +
 14 files changed, 492 insertions(+), 117 deletions(-)
 create mode 100644 hw/nvram/fw_cfg-acpi.c
 create mode 100644 hw/virtio/virtio-acpi.c
 create mode 100644 include/hw/nvram/fw_cfg_acpi.h
 create mode 100644 include/hw/virtio/virtio-acpi.h

-- 
2.39.2

