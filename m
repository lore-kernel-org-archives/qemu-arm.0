Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp698882njc;
        Tue, 25 Jun 2024 08:09:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWQGvdpiu/h20UjhPifoIsBAaBY0CTXipuxw68jZGv8LKre8i/YffhAo+t3QNTZVUD5fVMoX8qW1E9ot5zvO3e2e6WZLBIm
X-Google-Smtp-Source: AGHT+IHxvW++5LLe5U8j83H8CcM/AXzGjpyNDWklESRq6/AhlZEP2TE8j1GRYi0WqvP60zZ3IQaC
X-Received: by 2002:a05:6214:daa:b0:6b5:42b7:121 with SMTP id 6a1803df08f44-6b542b733aamr111736406d6.43.1719328145167;
        Tue, 25 Jun 2024 08:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719328145; cv=none;
        d=google.com; s=arc-20160816;
        b=dTAHX+FaabPmHLxKHdmx9JumifR983g85FMNWlDrBxgsDjCBtDIIGYd4mZLZqYFPfu
         MFt88bTTwViA3WcBtRogUFiwjnb/Aeam34B9B+gfORCdcJ1kDU/URYKH3kP2uOjx8Nej
         XjE9k7f1ISjKrOxKD6sdorUjOEuZ0BKn9WArZebrCuNKDMmMlOF+/uB3ya0bKtLF4Z42
         qCVQXDDLmpraWSYpOgcmTSF2qs3VWx6cwOAI7pJCkJkCNF7wh1azwd5+/Be3QtZEHksP
         /r80kSwcMjrTO5IRMwHvVJAHQBYV2xv/pT/w/3vNFM7DHVXHVSubvpURqqPZVqp3+z9G
         oLvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Tc7U+e2ilwak/9xfWj7oyPDErxvIY43VBfjH3q/AIjw=;
        fh=W4ejh7P7NGxa7H5xtkgI9xmAbxniibiFKLoSdjGQqsc=;
        b=rCQ8OGjIZA1UZtq/8nCdvjukKsYDXegZfMZjsZSpvrSse0XLevAagkXDESGBW7HGZ9
         jYPbhg0pgxLOKNIrbvF+Y8BeZbT3Mvp7y5xUtBrJO+zEbVVx9JXzRPgtD7WzJrrquE0A
         7Ft0LC9KXAMB15mqIqucZwvcfOesIBnnsp0to7Xk2syFJoYwbzA1YDdINxcP1B4NnFYJ
         tER+wlkDdvFyQPKBmpocWn53PsDBNlELZwPIzDi3NuRy6BzX9JoY1RPNmzv7jaGooLIi
         rYPspI6g4Xi0mjwVNCdUwdSVIRrwp2V5n0/5reU8nQ9DXJh5XjPl2ukwxVgOYc/hbx+j
         9ToA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=IrqAem5H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51eecfe0esi105562536d6.388.2024.06.25.08.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 08:09:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=IrqAem5H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM7mx-0001Be-UU; Tue, 25 Jun 2024 11:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7mw-0001BH-QI
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:08:54 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7ms-0006Oh-DI
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:08:53 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-706683e5249so2489565b3a.2
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328129; x=1719932929; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tc7U+e2ilwak/9xfWj7oyPDErxvIY43VBfjH3q/AIjw=;
 b=IrqAem5H+sy31Smzpu6QATHxIoEFj5pjwDYEztc05NYBjrXtBF4+5F9kHzOZV7Iuhi
 S1K2eRtPqGuj0QeZdrmIN2MNzCbGqYvhTQQP9C93v+mGg4jNuLWCw73U7X/TkQ1mnpMQ
 SJRtKo7DGiWS4ok7rQyLPwah7XGkL70FmdbsDoiLY44U6cYY4XTQusoJ5T5BqGLV7bzH
 jy4ArSfEKvaLxuo1VoFhg5yNIMPs/GV/O6prG16rbVComs7h4Pzzaa+glBhsKNJwGfRl
 yaE7zzXRpJ3NNIdjusa3Y/nZIkg7eVY95fOqOeMqhSEKpKvSXudvK3AVZfLByPG9Qe5m
 jBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328129; x=1719932929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tc7U+e2ilwak/9xfWj7oyPDErxvIY43VBfjH3q/AIjw=;
 b=HDY5T8SrZONnRA4ecoqAI4DJ2WxVz3i9j92g1eBZAn/14W227PD17zhexLUzSXHfAk
 BsBOMpvX4z0NSR+TfyIj/HKDKd7d4DEDHtFyd/Wr0WzkncDl9DvepcaWsorVD8cKMMa5
 fgvD/4rYhyrtedQkQq1OLabVIDVEajY2/wz09gMlP2RnCRi/O0rnpY5DO9l7C6+wZ8pw
 7YJVl1a56MonB4IYKA140g2HCj1ejBGVgMdAQOTfEG+joqO7GgGh5FybOGkc8Zwk9vS+
 6z3lnQ6zabmgyHRUYDtGuWt3Yi/G6LC+yZP6XgpinmlfDFHUndLJZiiS+qCy4aWJc3Co
 rQ3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXekJzLJT29sSZQ++nwCYHVGQ4HiFAonW59hWCsA+PYAlbRmJpsMSic4zuOzPGN/V7kMctjms5s0slTUClZwjj1s6J3
X-Gm-Message-State: AOJu0YwamtwI3651DQbPSKJSkDjJt7UkafHcd36A4ERiMvlJyPg5/ntA
 ehJjbqjRaZJ2vZ27XddWpOXhjeziJSlAS9boui31upPOByq/ZCL25/a+f9gNXPk=
X-Received: by 2002:a05:6a20:a110:b0:1ba:e88c:c4f8 with SMTP id
 adf61e73a8af0-1bcf7e6ba31mr7985323637.12.1719328128473; 
 Tue, 25 Jun 2024 08:08:48 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70681722219sm4142636b3a.73.2024.06.25.08.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:08:47 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v4 00/16] Add support for RISC-V ACPI tests 
Date: Tue, 25 Jun 2024 20:38:23 +0530
Message-Id: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42a.google.com
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
X-TUID: YrD+c/iXUkQd

Currently, bios-table-test doesn't support RISC-V. This series enables
the framework changes required and basic testing. Things like NUMA
related test cases will be added later.

This needs refactoring/renaming of ARM64 and x86 bios table tests.
Importantly, the test cases now look for the expected AML files under
tests/data/acpi/${arch}/${machine} path instead of directly under
tests/data/acpi/${machine}. To keep test cases not to fail because of
this movement, they are updated to look for both paths first.

As part of this effort, it is found that uefi-test-tools is currently
broken to build. So, updated its Makefile as well to use python based
edk2 build script.

The changes are also available at branch
https://gitlab.com/vlsunil/qemu/-/tree/riscv_bios_table_test_v4

Changes since v3:
	1) Added the dependent patch [1] in the series also as recommended by Igor.
	2) Added latest tags.

Changes since v2:
	1) Used ${arch}/${machine} path instead of {machine}/${arch} as
	   per the feedback.
	2) Updated x86 AML files and test cases as well to use new path.
	3) Used data->cd for RISC-V test which internally uses -cdrom
	   option. This needs a fix in RISC-V virt machine [1]. So,
	   the patch [1] is a dependency for this series.
	3) Updated tags.

Changes since v1:
	1) Addressed feedback from Gerd and Alistair
	2) Rebased and added tags received

[1]: https://mail.gnu.org/archive/html/qemu-devel/2024-06/msg03683.html

Sunil V L (16):
  hw/riscv/virt.c: Make block devices default to virtio
  uefi-test-tools/UefiTestToolsPkg: Add RISC-V support
  uefi-test-tools: Add support for python based build script
  tests/data/uefi-boot-images: Add RISC-V ISO image
  qtest: bios-tables-test: Rename aarch64 tests with aarch64 in them
  tests/qtest/bios-tables-test.c: Add support for arch in path
  tests/qtest/bios-tables-test.c: Set "arch" for aarch64 tests
  tests/qtest/bios-tables-test.c: Set "arch" for x86 tests
  tests/data/acpi: Move x86 ACPI tables under x86/${machine} path
  tests/data/acpi/virt: Move ARM64 ACPI tables under aarch64/${machine}
    path
  meson.build: Add RISC-V to the edk2-target list
  pc-bios/meson.build: Add support for RISC-V in unpack_edk2_blobs
  tests/data/acpi/rebuild-expected-aml.sh: Add RISC-V
  tests/qtest/bios-tables-test: Add empty ACPI data files for RISC-V
  tests/qtest/bios-tables-test.c: Enable basic testing for RISC-V
  tests/qtest/bios-tables-test: Add expected ACPI data files for RISC-V

 hw/riscv/virt.c                               |   2 +
 meson.build                                   |   2 +-
 pc-bios/meson.build                           |   2 +
 tests/data/acpi/{ => aarch64}/virt/APIC       | Bin
 .../acpi/{ => aarch64}/virt/APIC.acpihmatvirt | Bin
 .../acpi/{ => aarch64}/virt/APIC.topology     | Bin
 tests/data/acpi/{ => aarch64}/virt/DBG2       | Bin
 tests/data/acpi/{ => aarch64}/virt/DSDT       | Bin
 .../acpi/{ => aarch64}/virt/DSDT.acpihmatvirt | Bin
 tests/data/acpi/{ => aarch64}/virt/DSDT.memhp | Bin
 tests/data/acpi/{ => aarch64}/virt/DSDT.pxb   | Bin
 .../acpi/{ => aarch64}/virt/DSDT.topology     | Bin
 tests/data/acpi/{ => aarch64}/virt/FACP       | Bin
 tests/data/acpi/{ => aarch64}/virt/GTDT       | Bin
 .../acpi/{ => aarch64}/virt/HMAT.acpihmatvirt | Bin
 tests/data/acpi/{ => aarch64}/virt/IORT       | Bin
 tests/data/acpi/{ => aarch64}/virt/MCFG       | Bin
 tests/data/acpi/{ => aarch64}/virt/NFIT.memhp | Bin
 tests/data/acpi/{ => aarch64}/virt/PPTT       | Bin
 .../acpi/{ => aarch64}/virt/PPTT.acpihmatvirt | Bin
 .../acpi/{ => aarch64}/virt/PPTT.topology     | Bin
 .../data/acpi/{pc => aarch64/virt}/SLIT.memhp | Bin
 tests/data/acpi/{ => aarch64}/virt/SPCR       | Bin
 .../acpi/{ => aarch64}/virt/SRAT.acpihmatvirt | Bin
 tests/data/acpi/{ => aarch64}/virt/SRAT.memhp | Bin
 .../data/acpi/{ => aarch64}/virt/SRAT.numamem | Bin
 tests/data/acpi/{ => aarch64}/virt/SSDT.memhp | Bin
 tests/data/acpi/{ => aarch64}/virt/VIOT       | Bin
 tests/data/acpi/rebuild-expected-aml.sh       |   5 +-
 tests/data/acpi/riscv64/virt/APIC             | Bin 0 -> 116 bytes
 .../{microvm/DSDT.pcie => riscv64/virt/DSDT}  | Bin 3023 -> 3518 bytes
 tests/data/acpi/riscv64/virt/FACP             | Bin 0 -> 276 bytes
 tests/data/acpi/riscv64/virt/MCFG             | Bin 0 -> 60 bytes
 tests/data/acpi/riscv64/virt/RHCT             | Bin 0 -> 314 bytes
 tests/data/acpi/riscv64/virt/SPCR             | Bin 0 -> 80 bytes
 tests/data/acpi/{ => x86}/microvm/APIC        | Bin
 .../data/acpi/{ => x86}/microvm/APIC.ioapic2  | Bin
 tests/data/acpi/{ => x86}/microvm/APIC.pcie   | Bin
 tests/data/acpi/{ => x86}/microvm/DSDT        | Bin
 .../data/acpi/{ => x86}/microvm/DSDT.ioapic2  | Bin
 tests/data/acpi/{ => x86}/microvm/DSDT.pcie   | Bin
 tests/data/acpi/{ => x86}/microvm/DSDT.rtc    | Bin
 tests/data/acpi/{ => x86}/microvm/DSDT.usb    | Bin
 tests/data/acpi/{ => x86}/microvm/ERST.pcie   | Bin
 tests/data/acpi/{ => x86}/microvm/FACP        | Bin
 tests/data/acpi/{ => x86}/pc/APIC             | Bin
 tests/data/acpi/{ => x86}/pc/APIC.acpihmat    | Bin
 tests/data/acpi/{ => x86}/pc/APIC.cphp        | Bin
 tests/data/acpi/{ => x86}/pc/APIC.dimmpxm     | Bin
 tests/data/acpi/{ => x86}/pc/DSDT             | Bin
 tests/data/acpi/{ => x86}/pc/DSDT.acpierst    | Bin
 tests/data/acpi/{ => x86}/pc/DSDT.acpihmat    | Bin
 tests/data/acpi/{ => x86}/pc/DSDT.bridge      | Bin
 tests/data/acpi/{ => x86}/pc/DSDT.cphp        | Bin
 tests/data/acpi/{ => x86}/pc/DSDT.dimmpxm     | Bin
 tests/data/acpi/{ => x86}/pc/DSDT.hpbridge    | Bin
 tests/data/acpi/{ => x86}/pc/DSDT.hpbrroot    | Bin
 tests/data/acpi/{ => x86}/pc/DSDT.ipmikcs     | Bin
 tests/data/acpi/{ => x86}/pc/DSDT.memhp       | Bin
 tests/data/acpi/{ => x86}/pc/DSDT.nohpet      | Bin
 tests/data/acpi/{ => x86}/pc/DSDT.numamem     | Bin
 tests/data/acpi/{ => x86}/pc/DSDT.roothp      | Bin
 tests/data/acpi/{ => x86}/pc/ERST.acpierst    | Bin
 tests/data/acpi/{ => x86}/pc/FACP             | Bin
 tests/data/acpi/{ => x86}/pc/FACP.nosmm       | Bin
 tests/data/acpi/{ => x86}/pc/FACS             | Bin
 tests/data/acpi/{ => x86}/pc/HMAT.acpihmat    | Bin
 tests/data/acpi/{ => x86}/pc/HPET             | Bin
 tests/data/acpi/{ => x86}/pc/NFIT.dimmpxm     | Bin
 tests/data/acpi/{ => x86}/pc/SLIT.cphp        | Bin
 tests/data/acpi/{q35 => x86/pc}/SLIT.memhp    | Bin
 tests/data/acpi/{ => x86}/pc/SRAT.acpihmat    | Bin
 tests/data/acpi/{ => x86}/pc/SRAT.cphp        | Bin
 tests/data/acpi/{ => x86}/pc/SRAT.dimmpxm     | Bin
 tests/data/acpi/{ => x86}/pc/SRAT.memhp       | Bin
 tests/data/acpi/{ => x86}/pc/SRAT.numamem     | Bin
 tests/data/acpi/{ => x86}/pc/SSDT.dimmpxm     | Bin
 tests/data/acpi/{ => x86}/pc/WAET             | Bin
 tests/data/acpi/{ => x86}/q35/APIC            | Bin
 tests/data/acpi/{ => x86}/q35/APIC.acpihmat   | Bin
 .../{ => x86}/q35/APIC.acpihmat-noinitiator   | Bin
 tests/data/acpi/{ => x86}/q35/APIC.core-count | Bin
 .../data/acpi/{ => x86}/q35/APIC.core-count2  | Bin
 tests/data/acpi/{ => x86}/q35/APIC.cphp       | Bin
 tests/data/acpi/{ => x86}/q35/APIC.dimmpxm    | Bin
 .../data/acpi/{ => x86}/q35/APIC.thread-count | Bin
 .../acpi/{ => x86}/q35/APIC.thread-count2     | Bin
 .../data/acpi/{ => x86}/q35/APIC.type4-count  | Bin
 tests/data/acpi/{ => x86}/q35/APIC.xapic      | Bin
 tests/data/acpi/{ => x86}/q35/CEDT.cxl        | Bin
 tests/data/acpi/{ => x86}/q35/DMAR.dmar       | Bin
 tests/data/acpi/{ => x86}/q35/DSDT            | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.acpierst   | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.acpihmat   | Bin
 .../{ => x86}/q35/DSDT.acpihmat-noinitiator   | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.applesmc   | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.bridge     | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.core-count | Bin
 .../data/acpi/{ => x86}/q35/DSDT.core-count2  | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.cphp       | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.cxl        | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.dimmpxm    | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.ipmibt     | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.ipmismbus  | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.ivrs       | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.memhp      | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.mmio64     | Bin
 .../data/acpi/{ => x86}/q35/DSDT.multi-bridge | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.noacpihp   | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.nohpet     | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.numamem    | Bin
 .../data/acpi/{ => x86}/q35/DSDT.pvpanic-isa  | Bin
 .../data/acpi/{ => x86}/q35/DSDT.thread-count | Bin
 .../acpi/{ => x86}/q35/DSDT.thread-count2     | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.tis.tpm12  | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.tis.tpm2   | Bin
 .../data/acpi/{ => x86}/q35/DSDT.type4-count  | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.viot       | Bin
 tests/data/acpi/{ => x86}/q35/DSDT.xapic      | Bin
 tests/data/acpi/{ => x86}/q35/ERST.acpierst   | Bin
 tests/data/acpi/{ => x86}/q35/FACP            | Bin
 tests/data/acpi/{ => x86}/q35/FACP.core-count | Bin
 .../data/acpi/{ => x86}/q35/FACP.core-count2  | Bin
 tests/data/acpi/{ => x86}/q35/FACP.nosmm      | Bin
 tests/data/acpi/{ => x86}/q35/FACP.slic       | Bin
 .../data/acpi/{ => x86}/q35/FACP.thread-count | Bin
 .../acpi/{ => x86}/q35/FACP.thread-count2     | Bin
 .../data/acpi/{ => x86}/q35/FACP.type4-count  | Bin
 tests/data/acpi/{ => x86}/q35/FACP.xapic      | Bin
 tests/data/acpi/{ => x86}/q35/FACS            | Bin
 tests/data/acpi/{ => x86}/q35/HMAT.acpihmat   | Bin
 .../{ => x86}/q35/HMAT.acpihmat-noinitiator   | Bin
 tests/data/acpi/{ => x86}/q35/HPET            | Bin
 tests/data/acpi/{ => x86}/q35/IVRS.ivrs       | Bin
 tests/data/acpi/{ => x86}/q35/MCFG            | Bin
 tests/data/acpi/{ => x86}/q35/NFIT.dimmpxm    | Bin
 tests/data/acpi/{ => x86}/q35/SLIC.slic       | Bin
 tests/data/acpi/{ => x86}/q35/SLIT.cphp       | Bin
 tests/data/acpi/{virt => x86/q35}/SLIT.memhp  | Bin
 tests/data/acpi/{ => x86}/q35/SRAT.acpihmat   | Bin
 .../{ => x86}/q35/SRAT.acpihmat-noinitiator   | Bin
 tests/data/acpi/{ => x86}/q35/SRAT.cphp       | Bin
 tests/data/acpi/{ => x86}/q35/SRAT.dimmpxm    | Bin
 tests/data/acpi/{ => x86}/q35/SRAT.memhp      | Bin
 tests/data/acpi/{ => x86}/q35/SRAT.mmio64     | Bin
 tests/data/acpi/{ => x86}/q35/SRAT.numamem    | Bin
 tests/data/acpi/{ => x86}/q35/SRAT.xapic      | Bin
 tests/data/acpi/{ => x86}/q35/SSDT.dimmpxm    | Bin
 tests/data/acpi/{ => x86}/q35/TCPA.tis.tpm12  | Bin
 tests/data/acpi/{ => x86}/q35/TPM2.tis.tpm2   | Bin
 tests/data/acpi/{ => x86}/q35/VIOT.viot       | Bin
 tests/data/acpi/{ => x86}/q35/WAET            | Bin
 .../bios-tables-test.riscv64.iso.qcow2        | Bin 0 -> 16896 bytes
 tests/qtest/bios-tables-test.c                | 169 ++++++++++++++----
 tests/qtest/meson.build                       |   3 +
 tests/uefi-test-tools/Makefile                |  19 +-
 .../UefiTestToolsPkg/UefiTestToolsPkg.dsc     |   6 +-
 tests/uefi-test-tools/uefi-test-build.config  |  52 ++++++
 158 files changed, 212 insertions(+), 48 deletions(-)
 rename tests/data/acpi/{ => aarch64}/virt/APIC (100%)
 rename tests/data/acpi/{ => aarch64}/virt/APIC.acpihmatvirt (100%)
 rename tests/data/acpi/{ => aarch64}/virt/APIC.topology (100%)
 rename tests/data/acpi/{ => aarch64}/virt/DBG2 (100%)
 rename tests/data/acpi/{ => aarch64}/virt/DSDT (100%)
 rename tests/data/acpi/{ => aarch64}/virt/DSDT.acpihmatvirt (100%)
 rename tests/data/acpi/{ => aarch64}/virt/DSDT.memhp (100%)
 rename tests/data/acpi/{ => aarch64}/virt/DSDT.pxb (100%)
 rename tests/data/acpi/{ => aarch64}/virt/DSDT.topology (100%)
 rename tests/data/acpi/{ => aarch64}/virt/FACP (100%)
 rename tests/data/acpi/{ => aarch64}/virt/GTDT (100%)
 rename tests/data/acpi/{ => aarch64}/virt/HMAT.acpihmatvirt (100%)
 rename tests/data/acpi/{ => aarch64}/virt/IORT (100%)
 rename tests/data/acpi/{ => aarch64}/virt/MCFG (100%)
 rename tests/data/acpi/{ => aarch64}/virt/NFIT.memhp (100%)
 rename tests/data/acpi/{ => aarch64}/virt/PPTT (100%)
 rename tests/data/acpi/{ => aarch64}/virt/PPTT.acpihmatvirt (100%)
 rename tests/data/acpi/{ => aarch64}/virt/PPTT.topology (100%)
 rename tests/data/acpi/{pc => aarch64/virt}/SLIT.memhp (100%)
 rename tests/data/acpi/{ => aarch64}/virt/SPCR (100%)
 rename tests/data/acpi/{ => aarch64}/virt/SRAT.acpihmatvirt (100%)
 rename tests/data/acpi/{ => aarch64}/virt/SRAT.memhp (100%)
 rename tests/data/acpi/{ => aarch64}/virt/SRAT.numamem (100%)
 rename tests/data/acpi/{ => aarch64}/virt/SSDT.memhp (100%)
 rename tests/data/acpi/{ => aarch64}/virt/VIOT (100%)
 create mode 100644 tests/data/acpi/riscv64/virt/APIC
 copy tests/data/acpi/{microvm/DSDT.pcie => riscv64/virt/DSDT} (62%)
 create mode 100644 tests/data/acpi/riscv64/virt/FACP
 create mode 100644 tests/data/acpi/riscv64/virt/MCFG
 create mode 100644 tests/data/acpi/riscv64/virt/RHCT
 create mode 100644 tests/data/acpi/riscv64/virt/SPCR
 rename tests/data/acpi/{ => x86}/microvm/APIC (100%)
 rename tests/data/acpi/{ => x86}/microvm/APIC.ioapic2 (100%)
 rename tests/data/acpi/{ => x86}/microvm/APIC.pcie (100%)
 rename tests/data/acpi/{ => x86}/microvm/DSDT (100%)
 rename tests/data/acpi/{ => x86}/microvm/DSDT.ioapic2 (100%)
 rename tests/data/acpi/{ => x86}/microvm/DSDT.pcie (100%)
 rename tests/data/acpi/{ => x86}/microvm/DSDT.rtc (100%)
 rename tests/data/acpi/{ => x86}/microvm/DSDT.usb (100%)
 rename tests/data/acpi/{ => x86}/microvm/ERST.pcie (100%)
 rename tests/data/acpi/{ => x86}/microvm/FACP (100%)
 rename tests/data/acpi/{ => x86}/pc/APIC (100%)
 rename tests/data/acpi/{ => x86}/pc/APIC.acpihmat (100%)
 rename tests/data/acpi/{ => x86}/pc/APIC.cphp (100%)
 rename tests/data/acpi/{ => x86}/pc/APIC.dimmpxm (100%)
 rename tests/data/acpi/{ => x86}/pc/DSDT (100%)
 rename tests/data/acpi/{ => x86}/pc/DSDT.acpierst (100%)
 rename tests/data/acpi/{ => x86}/pc/DSDT.acpihmat (100%)
 rename tests/data/acpi/{ => x86}/pc/DSDT.bridge (100%)
 rename tests/data/acpi/{ => x86}/pc/DSDT.cphp (100%)
 rename tests/data/acpi/{ => x86}/pc/DSDT.dimmpxm (100%)
 rename tests/data/acpi/{ => x86}/pc/DSDT.hpbridge (100%)
 rename tests/data/acpi/{ => x86}/pc/DSDT.hpbrroot (100%)
 rename tests/data/acpi/{ => x86}/pc/DSDT.ipmikcs (100%)
 rename tests/data/acpi/{ => x86}/pc/DSDT.memhp (100%)
 rename tests/data/acpi/{ => x86}/pc/DSDT.nohpet (100%)
 rename tests/data/acpi/{ => x86}/pc/DSDT.numamem (100%)
 rename tests/data/acpi/{ => x86}/pc/DSDT.roothp (100%)
 rename tests/data/acpi/{ => x86}/pc/ERST.acpierst (100%)
 rename tests/data/acpi/{ => x86}/pc/FACP (100%)
 rename tests/data/acpi/{ => x86}/pc/FACP.nosmm (100%)
 rename tests/data/acpi/{ => x86}/pc/FACS (100%)
 rename tests/data/acpi/{ => x86}/pc/HMAT.acpihmat (100%)
 rename tests/data/acpi/{ => x86}/pc/HPET (100%)
 rename tests/data/acpi/{ => x86}/pc/NFIT.dimmpxm (100%)
 rename tests/data/acpi/{ => x86}/pc/SLIT.cphp (100%)
 rename tests/data/acpi/{q35 => x86/pc}/SLIT.memhp (100%)
 rename tests/data/acpi/{ => x86}/pc/SRAT.acpihmat (100%)
 rename tests/data/acpi/{ => x86}/pc/SRAT.cphp (100%)
 rename tests/data/acpi/{ => x86}/pc/SRAT.dimmpxm (100%)
 rename tests/data/acpi/{ => x86}/pc/SRAT.memhp (100%)
 rename tests/data/acpi/{ => x86}/pc/SRAT.numamem (100%)
 rename tests/data/acpi/{ => x86}/pc/SSDT.dimmpxm (100%)
 rename tests/data/acpi/{ => x86}/pc/WAET (100%)
 rename tests/data/acpi/{ => x86}/q35/APIC (100%)
 rename tests/data/acpi/{ => x86}/q35/APIC.acpihmat (100%)
 rename tests/data/acpi/{ => x86}/q35/APIC.acpihmat-noinitiator (100%)
 rename tests/data/acpi/{ => x86}/q35/APIC.core-count (100%)
 rename tests/data/acpi/{ => x86}/q35/APIC.core-count2 (100%)
 rename tests/data/acpi/{ => x86}/q35/APIC.cphp (100%)
 rename tests/data/acpi/{ => x86}/q35/APIC.dimmpxm (100%)
 rename tests/data/acpi/{ => x86}/q35/APIC.thread-count (100%)
 rename tests/data/acpi/{ => x86}/q35/APIC.thread-count2 (100%)
 rename tests/data/acpi/{ => x86}/q35/APIC.type4-count (100%)
 rename tests/data/acpi/{ => x86}/q35/APIC.xapic (100%)
 rename tests/data/acpi/{ => x86}/q35/CEDT.cxl (100%)
 rename tests/data/acpi/{ => x86}/q35/DMAR.dmar (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.acpierst (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.acpihmat (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.acpihmat-noinitiator (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.applesmc (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.bridge (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.core-count (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.core-count2 (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.cphp (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.cxl (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.dimmpxm (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.ipmibt (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.ipmismbus (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.ivrs (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.memhp (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.mmio64 (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.multi-bridge (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.noacpihp (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.nohpet (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.numamem (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.pvpanic-isa (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.thread-count (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.thread-count2 (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.tis.tpm12 (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.tis.tpm2 (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.type4-count (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.viot (100%)
 rename tests/data/acpi/{ => x86}/q35/DSDT.xapic (100%)
 rename tests/data/acpi/{ => x86}/q35/ERST.acpierst (100%)
 rename tests/data/acpi/{ => x86}/q35/FACP (100%)
 rename tests/data/acpi/{ => x86}/q35/FACP.core-count (100%)
 rename tests/data/acpi/{ => x86}/q35/FACP.core-count2 (100%)
 rename tests/data/acpi/{ => x86}/q35/FACP.nosmm (100%)
 rename tests/data/acpi/{ => x86}/q35/FACP.slic (100%)
 rename tests/data/acpi/{ => x86}/q35/FACP.thread-count (100%)
 rename tests/data/acpi/{ => x86}/q35/FACP.thread-count2 (100%)
 rename tests/data/acpi/{ => x86}/q35/FACP.type4-count (100%)
 rename tests/data/acpi/{ => x86}/q35/FACP.xapic (100%)
 rename tests/data/acpi/{ => x86}/q35/FACS (100%)
 rename tests/data/acpi/{ => x86}/q35/HMAT.acpihmat (100%)
 rename tests/data/acpi/{ => x86}/q35/HMAT.acpihmat-noinitiator (100%)
 rename tests/data/acpi/{ => x86}/q35/HPET (100%)
 rename tests/data/acpi/{ => x86}/q35/IVRS.ivrs (100%)
 rename tests/data/acpi/{ => x86}/q35/MCFG (100%)
 rename tests/data/acpi/{ => x86}/q35/NFIT.dimmpxm (100%)
 rename tests/data/acpi/{ => x86}/q35/SLIC.slic (100%)
 rename tests/data/acpi/{ => x86}/q35/SLIT.cphp (100%)
 rename tests/data/acpi/{virt => x86/q35}/SLIT.memhp (100%)
 rename tests/data/acpi/{ => x86}/q35/SRAT.acpihmat (100%)
 rename tests/data/acpi/{ => x86}/q35/SRAT.acpihmat-noinitiator (100%)
 rename tests/data/acpi/{ => x86}/q35/SRAT.cphp (100%)
 rename tests/data/acpi/{ => x86}/q35/SRAT.dimmpxm (100%)
 rename tests/data/acpi/{ => x86}/q35/SRAT.memhp (100%)
 rename tests/data/acpi/{ => x86}/q35/SRAT.mmio64 (100%)
 rename tests/data/acpi/{ => x86}/q35/SRAT.numamem (100%)
 rename tests/data/acpi/{ => x86}/q35/SRAT.xapic (100%)
 rename tests/data/acpi/{ => x86}/q35/SSDT.dimmpxm (100%)
 rename tests/data/acpi/{ => x86}/q35/TCPA.tis.tpm12 (100%)
 rename tests/data/acpi/{ => x86}/q35/TPM2.tis.tpm2 (100%)
 rename tests/data/acpi/{ => x86}/q35/VIOT.viot (100%)
 rename tests/data/acpi/{ => x86}/q35/WAET (100%)
 create mode 100644 tests/data/uefi-boot-images/bios-tables-test.riscv64.iso.qcow2
 create mode 100644 tests/uefi-test-tools/uefi-test-build.config

-- 
2.40.1

