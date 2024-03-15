Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp986832eju;
        Fri, 15 Mar 2024 06:06:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWdjb05LRoqTldE9XJoI15cPV4cjgBTsZNibC8ygXJpbVSwJoyPBPYNryCOMG8ZS7MXZq25rZQS//h4CawNjYBYPGBhw6X
X-Google-Smtp-Source: AGHT+IGGtS2eULv3/lLJ8tUCr9hcZR0AB7tzC5qRNQu5XW3/lRpn5e8kO215Qn3q0Q4tD7Xz0V0f
X-Received: by 2002:a05:622a:5488:b0:430:92b4:288a with SMTP id ep8-20020a05622a548800b0043092b4288amr13177496qtb.20.1710507996290;
        Fri, 15 Mar 2024 06:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710507996; cv=none;
        d=google.com; s=arc-20160816;
        b=KQqCfhRxlT1gzeNo+LDSh8JNIc/qVFaZTB8CALsJ/JBCB5VR854yNu+LePqr/vpFUA
         utLKa1nxcKzbkVChXYKiwfq+obdgEnYdEweNfPdQWsNYUn5bhTKhF6BrCt1ze+aG09tb
         0t4cdh1HEiYYsnpZ1au3B7Ixi+45qMqcRzN9xNC4cyv4qZ1tWTec/8CHoaFaG/jnEa4u
         q3am+py80FxvGzL2msT3J/8U1/YfsicYCGzjJp61OX7QkMAKxCsucxgYvMQa26vPx5p5
         nz5g+9c+fEvEcRfiZinhL9wLNSqk8lEctuAn5FVZByAoht56huULGpY71QgBbVbE/gv/
         qSCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=hb20WeTYhA/SsGlP/0Ei7qOMHbpVXkux2bFbQE0hMyc=;
        fh=K2GizcvTAIP58oIt+kxH7S986lE8DL7GpZ777iV4e+4=;
        b=CBTmOTvnEU+sAkqa7VlYmevqf9UAlQmzA+cf9cdOU721a5JW2pcrh9CKOKHENvcxYx
         QE2yPzo3Z2Wv+qHIebrhkhtm7XKobcsNjC8b+gv5kkzmMaNuPyrLqrdL1beqpJi2QyU6
         JQV8Kfjp58reqon/DvspKZg2AomPq7QTUBPj8qsaWxi+z5/2D7UAZZXrpPc8T+STna38
         AQzHCpkWX95AHoUayhEJBd6ds3gbxwm5/nmxcHb/gBHAT4/j+yhX/tXdLjQx87c45vfi
         sdyTNNmfxdJcfRkIOi2CTAKgVeg3nTRjubSZ8dLyVp1CBTyK2AyMEDX9wh8LjWWZoLWz
         eJ0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=AcQOebZ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12-20020a05612208cc00b004c92f4aec2bsi548437vkg.126.2024.03.15.06.06.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Mar 2024 06:06:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=AcQOebZ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rl7Fu-0002kP-4V; Fri, 15 Mar 2024 09:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7Fp-0002iJ-KX
 for qemu-arm@nongnu.org; Fri, 15 Mar 2024 09:05:48 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7Fc-0006EN-WF
 for qemu-arm@nongnu.org; Fri, 15 Mar 2024 09:05:45 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1def89f0cfdso2086915ad.0
 for <qemu-arm@nongnu.org>; Fri, 15 Mar 2024 06:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710507928; x=1711112728; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hb20WeTYhA/SsGlP/0Ei7qOMHbpVXkux2bFbQE0hMyc=;
 b=AcQOebZ9QZMBKMR3MIwQ+BmYk3as6qvdzxK4fboZ5lty8VebM0MwI0elxECsXysNrA
 IiALPXqYvEfZW6HsvlS1+w5AbPiRxccEW0ir54KYd4C8xbK/CWnpLIoeHTfb7nwO2B6/
 2w+OVkYjksZh8BbJf/7F1a2SLcpUds7zhsV1Rwmyb42On/l/8QQK+3tKovrWwpigJSZq
 DuVewdpxJLk2FFSXvZFfj80N8LqmMENIPzwMF4ogW/AdYvMkKLcDJ8embHupkF1RcXLc
 mYR05Mp6oNFoT7EdEJxxlL0QUvCYpYdzxp7BppDL5FPtazt5QaIBwrH4CJmGhZf3y9DM
 EFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710507928; x=1711112728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hb20WeTYhA/SsGlP/0Ei7qOMHbpVXkux2bFbQE0hMyc=;
 b=Phwoq1LUsuYKJBLQ1TeF7YsYjzdIjTzZZMNEyMYe5frrdaZrQElo5blpmsjfcyC+9P
 AsrDQX2xCxpD70ZUOiGIabNGLgvIgn+aEPDXQXWAMKWh4g8hF8AY0LhYtyWZvA9i1eBG
 chaJPFU72ZRFKTsi9QkYuV/HhQQz0lYsl3/toEUg89SMigsGcsdluOUyoO37ocQYeAkp
 OVutcpFW3EdhrYZ0gjbcXM2ysY1YNvh171z1mGk5pngvIriwyFK5u4r35cfwQEx4E7VP
 uYONz5LbwGOpwVevDzwL9fGUFRnmAl/GlrExKVUaQ99almuYo/pI8l8osKBF0nXFOIjg
 WHJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjqtIeY6jBwv1agKCNUqaZbI3rlpbWEMOqbmg+HnTCVaYoIAhVn9sk361MrATvE/WbpitpUmVWQyoGj3DrZs31x0vx
X-Gm-Message-State: AOJu0Yx1SfnfYPzZbBhpK5RHVxjIJHpJdnh5TSzHqnOjCZFMp9ET19x/
 hFDBI2o3nMTtQU0WOA9SoCCIStzYIjM+iLbxJbs04h4H2T61GPX1K0cayBfVozE=
X-Received: by 2002:a17:902:f612:b0:1dd:c938:8f8e with SMTP id
 n18-20020a170902f61200b001ddc9388f8emr7791631plg.10.1710507927761; 
 Fri, 15 Mar 2024 06:05:27 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.184.12])
 by smtp.gmail.com with ESMTPSA id
 lh12-20020a170903290c00b001defd3e64d6sm182474plb.22.2024.03.15.06.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 06:05:27 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Haibo1 Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 00/12] Add support for RISC-V ACPI tests
Date: Fri, 15 Mar 2024 18:35:07 +0530
Message-Id: <20240315130519.2378765-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: ixObFnMxNvgk

Currently, bios-table-test doesn't support RISC-V. This series enables
the framework changes required and basic testing. Things like NUMA
related test cases will be added later.

This needs refactoring/renaming of ARM64 bios table tests. Importantly,
the test cases now look for the expected AML files under
tests/data/acpi/virt/aarch64 path instead of directly under
tests/data/acpi/virt. To keep test cases not to fail because of this
movement, they are updated to look for both paths first.

As part of this effort, it is found that uefi-test-tools is currently
broken to build. So, updated its Makefile as well to use python based
edk2 build script.

The series depends on Gerd's below series.
https://lists.gnu.org/archive/html/qemu-devel/2024-03/msg03855.html

The changes are also available at branch
https://gitlab.com/vlsunil/qemu/-/tree/riscv_bios_table_test_v1

This branch which is on top of Gerd's series completed CI tests.
https://gitlab.com/vlsunil/qemu/-/pipelines/1214784985


Sunil V L (12):
  roms/edk2-build.py: Add --module support
  uefi-test-tools/UefiTestToolsPkg: Add RISC-V support
  uefi-test-tools: Add support for python based build script
  tests/data/uefi-boot-images: Add RISC-V ISO image
  qtest: bios-tables-test: Rename aarch64 tests with aarch64 in them
  tests/qtest/bios-tables-test.c: Add support for arch in path
  tests/data/acpi/virt: Move ACPI tables under aarch64
  meson.build: Add RISC-V to the edk2-target list
  pc-bios/meson.build: Add support for RISC-V in unpack_edk2_blobs
  tests/data/acpi/rebuild-expected-aml.sh: Add RISC-V
  tests/data/acpi/virt/riscv64: Add expected ACPI tables for RISC-V
  tests/qtest/bios-tables-test.c: Enable basic testing for RISC-V

 meson.build                                   |   2 +-
 pc-bios/meson.build                           |   2 +
 roms/edk2-build.py                            |   3 +
 tests/data/acpi/rebuild-expected-aml.sh       |   5 +-
 tests/data/acpi/virt/{ => aarch64}/APIC       | Bin
 .../acpi/virt/{ => aarch64}/APIC.acpihmatvirt | Bin
 .../acpi/virt/{ => aarch64}/APIC.topology     | Bin
 tests/data/acpi/virt/{ => aarch64}/DBG2       | Bin
 tests/data/acpi/virt/{ => aarch64}/DSDT       | Bin
 .../acpi/virt/{ => aarch64}/DSDT.acpihmatvirt | Bin
 tests/data/acpi/virt/{ => aarch64}/DSDT.memhp | Bin
 tests/data/acpi/virt/{ => aarch64}/DSDT.pxb   | Bin
 .../acpi/virt/{ => aarch64}/DSDT.topology     | Bin
 tests/data/acpi/virt/{ => aarch64}/FACP       | Bin
 tests/data/acpi/virt/{ => aarch64}/GTDT       | Bin
 .../acpi/virt/{ => aarch64}/HMAT.acpihmatvirt | Bin
 tests/data/acpi/virt/{ => aarch64}/IORT       | Bin
 tests/data/acpi/virt/{ => aarch64}/MCFG       | Bin
 tests/data/acpi/virt/{ => aarch64}/NFIT.memhp | Bin
 tests/data/acpi/virt/{ => aarch64}/PPTT       | Bin
 .../acpi/virt/{ => aarch64}/PPTT.acpihmatvirt | Bin
 .../acpi/virt/{ => aarch64}/PPTT.topology     | Bin
 tests/data/acpi/virt/{ => aarch64}/SLIT.memhp | Bin
 tests/data/acpi/virt/{ => aarch64}/SPCR       | Bin
 .../acpi/virt/{ => aarch64}/SRAT.acpihmatvirt | Bin
 tests/data/acpi/virt/{ => aarch64}/SRAT.memhp | Bin
 .../data/acpi/virt/{ => aarch64}/SRAT.numamem | Bin
 tests/data/acpi/virt/{ => aarch64}/SSDT.memhp | Bin
 tests/data/acpi/virt/{ => aarch64}/VIOT       | Bin
 tests/data/acpi/virt/riscv64/APIC             | Bin 0 -> 116 bytes
 tests/data/acpi/virt/riscv64/BGRT             | Bin 0 -> 56 bytes
 tests/data/acpi/virt/riscv64/DSDT             | Bin 0 -> 3518 bytes
 tests/data/acpi/virt/riscv64/FACP             | Bin 0 -> 276 bytes
 tests/data/acpi/virt/riscv64/MCFG             | Bin 0 -> 60 bytes
 tests/data/acpi/virt/riscv64/RHCT             | Bin 0 -> 314 bytes
 tests/data/acpi/virt/riscv64/RSDP             | Bin 0 -> 36 bytes
 tests/data/acpi/virt/riscv64/SPCR             | Bin 0 -> 80 bytes
 tests/data/acpi/virt/riscv64/XSDT             | Bin 0 -> 84 bytes
 .../bios-tables-test.riscv64.iso.qcow2        | Bin 0 -> 16896 bytes
 tests/qtest/bios-tables-test.c                |  95 ++++++++++++++----
 tests/qtest/meson.build                       |   3 +
 tests/uefi-test-tools/Makefile                |  18 ++--
 .../UefiTestToolsPkg/UefiTestToolsPkg.dsc     |   6 +-
 tests/uefi-test-tools/uefi-test-build.config  |  57 +++++++++++
 44 files changed, 156 insertions(+), 35 deletions(-)
 rename tests/data/acpi/virt/{ => aarch64}/APIC (100%)
 rename tests/data/acpi/virt/{ => aarch64}/APIC.acpihmatvirt (100%)
 rename tests/data/acpi/virt/{ => aarch64}/APIC.topology (100%)
 rename tests/data/acpi/virt/{ => aarch64}/DBG2 (100%)
 rename tests/data/acpi/virt/{ => aarch64}/DSDT (100%)
 rename tests/data/acpi/virt/{ => aarch64}/DSDT.acpihmatvirt (100%)
 rename tests/data/acpi/virt/{ => aarch64}/DSDT.memhp (100%)
 rename tests/data/acpi/virt/{ => aarch64}/DSDT.pxb (100%)
 rename tests/data/acpi/virt/{ => aarch64}/DSDT.topology (100%)
 rename tests/data/acpi/virt/{ => aarch64}/FACP (100%)
 rename tests/data/acpi/virt/{ => aarch64}/GTDT (100%)
 rename tests/data/acpi/virt/{ => aarch64}/HMAT.acpihmatvirt (100%)
 rename tests/data/acpi/virt/{ => aarch64}/IORT (100%)
 rename tests/data/acpi/virt/{ => aarch64}/MCFG (100%)
 rename tests/data/acpi/virt/{ => aarch64}/NFIT.memhp (100%)
 rename tests/data/acpi/virt/{ => aarch64}/PPTT (100%)
 rename tests/data/acpi/virt/{ => aarch64}/PPTT.acpihmatvirt (100%)
 rename tests/data/acpi/virt/{ => aarch64}/PPTT.topology (100%)
 rename tests/data/acpi/virt/{ => aarch64}/SLIT.memhp (100%)
 rename tests/data/acpi/virt/{ => aarch64}/SPCR (100%)
 rename tests/data/acpi/virt/{ => aarch64}/SRAT.acpihmatvirt (100%)
 rename tests/data/acpi/virt/{ => aarch64}/SRAT.memhp (100%)
 rename tests/data/acpi/virt/{ => aarch64}/SRAT.numamem (100%)
 rename tests/data/acpi/virt/{ => aarch64}/SSDT.memhp (100%)
 rename tests/data/acpi/virt/{ => aarch64}/VIOT (100%)
 create mode 100755 tests/data/acpi/virt/riscv64/APIC
 create mode 100755 tests/data/acpi/virt/riscv64/BGRT
 create mode 100755 tests/data/acpi/virt/riscv64/DSDT
 create mode 100755 tests/data/acpi/virt/riscv64/FACP
 create mode 100755 tests/data/acpi/virt/riscv64/MCFG
 create mode 100755 tests/data/acpi/virt/riscv64/RHCT
 create mode 100755 tests/data/acpi/virt/riscv64/RSDP
 create mode 100755 tests/data/acpi/virt/riscv64/SPCR
 create mode 100755 tests/data/acpi/virt/riscv64/XSDT
 create mode 100644 tests/data/uefi-boot-images/bios-tables-test.riscv64.iso.qcow2
 create mode 100644 tests/uefi-test-tools/uefi-test-build.config

-- 
2.40.1

