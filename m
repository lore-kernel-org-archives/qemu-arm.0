Received: by 2002:a05:7022:4391:b0:7c:9548:a19d with SMTP id bo17csp996448dlb;
        Thu, 23 May 2024 23:14:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKHTo0npS7fDN7iw6S5yqnXmEW1NWnPEcucnBv+AC0/ps4BUGnCjoz7TQJK8vl6GRdaUHX2yQC+QhQGMbIeX4rXucDCA7H
X-Google-Smtp-Source: AGHT+IFypqeePD3ElwTKh8qzJ/7hOcmfYx7TZFJm2NskOnZQMzvSA2Ps3J36bi1l8yuWn68dJ6vJ
X-Received: by 2002:a0c:f209:0:b0:6ab:9228:634 with SMTP id 6a1803df08f44-6abcd13bab6mr11584126d6.60.1716531284500;
        Thu, 23 May 2024 23:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716531284; cv=none;
        d=google.com; s=arc-20160816;
        b=Smle+Y9NCSRz86HRMboMl1EE99hxwQEPi3fCYI356bKeD651QoZd9rTifqU5gQbrO6
         VJuiLZNVewyUFGKOvZT9orRSmWMb8pkcsfnZb+CKKrXsjt1TKckGYGiS/qC7La64tSOi
         1BYFUzqlBxKxC8pOtwPICwfvHnnZ0X+4yDyRlbETw+/M0fIK1UnRU6n9e9Rjz2TQdxND
         9Qaizv0zZ2FMHxjU0M13HSNSVaIEv9IYg3/Z5K1NVj8n7D6O6fpatCGRz5oD+NqQW3Lh
         emHbp7zLEa+++sJf6v4IBBTfWseVmv5LD1vWhlfu1/+zrW7kTDGyncIiIZY6dLwJXvy7
         fTAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=NjkOvgDbjVLbH8iHglbx6OMXoUkh/TvoCmLRRr9I1og=;
        fh=HZ4+4mLsdIqni2rHUp2eYhwOI3YeRWxM6vTwNRBWlHw=;
        b=Ekq33rQEHk69ftM19LrcixGtKAaT16S5BXzAZrrRwB4hQvembXICtdDjGGQwiURK5O
         vFyB953tAFPBNpq7Iyd3kscthAGrs1PPLtg+pN6e3Xn1ScIHpomQlwyELeDg30geCWXN
         8hwibRdSVZBP7LJjz1wVX2w7be/YKQOQCCKtkQ1bvmt8CMkp2TF0G3GerB0VX2ujmghR
         +WGW/y4Ilzyjw8Xj8SDGHkMxCVsi0UG3uH3LQUmkBATkFQ5z3EtBOIZNi1ANkKgvilQB
         iLItxGWo4gaEcxzrla6mIqgdLi6aW+vKJryrNqp7jTG7ZkfL/QskJSrZfsH2AoRIkMTY
         xmOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=dieI3tel;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac070f0a8asi9454026d6.230.2024.05.23.23.14.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 23:14:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=dieI3tel;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAOCF-0001tc-Uo; Fri, 24 May 2024 02:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAOCD-0001rl-4R
 for qemu-arm@nongnu.org; Fri, 24 May 2024 02:14:29 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sAOC8-00012i-IP
 for qemu-arm@nongnu.org; Fri, 24 May 2024 02:14:28 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6f1016f41e2so3367941a34.1
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 23:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716531262; x=1717136062; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NjkOvgDbjVLbH8iHglbx6OMXoUkh/TvoCmLRRr9I1og=;
 b=dieI3telKxSrzLwkPATeSv/WsN/mEbtT7CrzkYH6Y3UlYIQRg9a5OYG2ke/UHYFHWR
 w50HHmfce84hROoh2DbvaHj8jciVhYMMwH8OMH5wOlQWZHqYOzbj7+RqW26Kx6oVBjQq
 t7n/1ARwMoaJadCROnsFkDa+MKon5J8vORGuEiMHIylkUStYIE07ksamfMvxyatQFydO
 7D2Rit1905QhP7X4ASLr0TxEL8IhHmhXxXCt6VmV2Hvf9KtcHsRv9NgPq47+H016e9pR
 +jAiOIx5s7/GkuQlaJJ3IoscKQZ0rTQ9hMWDHGGlt0uTWv0KYmYmoEeyCuxnWJzPMn08
 kgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716531262; x=1717136062;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NjkOvgDbjVLbH8iHglbx6OMXoUkh/TvoCmLRRr9I1og=;
 b=AknQORTQMAybNv2VW/Jmlxo0MLfmjw7P18xLgnI2shfr8M4p2+PmKYj21FqZokO+Xb
 EItyIgQbG1FmSbWY3uWMQKT2HCUBEAOAk0fLJa2BiOypbz9gJj1wrp80sCrpOP/jz9WY
 sMNjedSzNsVlqd+kgagtmZ+F9NkBYMgZkc168Ig5hNuT/vb9pmNVXJtK63W4plHnBP2y
 xSJLg2BK0AQef47j0sdZ2Oe6kDXsYEdxlIQf3A7XSEZnajYDzJH3wGGFAlRvLNCh9ixx
 AYGdop3YdZP+VUtSwVHlbSsH+eFyVQbscPHbLAHoRJW36+JUViZetkfj//h5y0YQM49c
 YIFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvJRQTCR+XcmUVF+DwNdM0P+h5PBv8RUxFPAK5B9/BHy6ui5J8NApsc1DO8ikT4zOdy751hKUP3GnbJyeFJwCpoGTl
X-Gm-Message-State: AOJu0Yyw10lnxbS+TwIv3IaT0GQEU+2kbTNoOnlYGCBaH6WjD+/G8WUM
 XJikLZa485Rde89YVuS/tRuz8lVAKxdc+4ifbNIWc0HFoma1MVPU8syruCuZ0HM=
X-Received: by 2002:a05:6871:725:b0:245:41f0:ce13 with SMTP id
 586e51a60fabf-24ca11de76amr1505731fac.9.1716531261848; 
 Thu, 23 May 2024 23:14:21 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.31])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fcbea487sm516106b3a.107.2024.05.23.23.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 23:14:21 -0700 (PDT)
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
 Alistair Francis <alistair23@gmail.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Haibo1 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2 00/12] Add support for RISC-V ACPI tests
Date: Fri, 24 May 2024 11:43:59 +0530
Message-Id: <20240524061411.341599-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: /UIXs9KU6S2b

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

The changes are also available at branch
https://gitlab.com/vlsunil/qemu/-/tree/riscv_bios_table_test_v2

Changes since v1:
	1) Addressed feedback from Gerd and Alistair
	2) Rebased and added tags received

Sunil V L (12):
  uefi-test-tools/UefiTestToolsPkg: Add RISC-V support
  uefi-test-tools: Add support for python based build script
  tests/data/uefi-boot-images: Add RISC-V ISO image
  qtest: bios-tables-test: Rename aarch64 tests with aarch64 in them
  tests/qtest/bios-tables-test.c: Add support for arch in path
  tests/data/acpi/virt: Move ACPI tables under aarch64
  meson.build: Add RISC-V to the edk2-target list
  pc-bios/meson.build: Add support for RISC-V in unpack_edk2_blobs
  tests/data/acpi/rebuild-expected-aml.sh: Add RISC-V
  tests/qtest/bios-tables-test: Add empty ACPI data files for RISC-V
  tests/qtest/bios-tables-test.c: Enable basic testing for RISC-V
  tests/qtest/bios-tables-test: Add expected ACPI data files for RISC-V

 meson.build                                   |   2 +-
 pc-bios/meson.build                           |   2 +
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
 tests/data/acpi/virt/riscv64/DSDT             | Bin 0 -> 3518 bytes
 tests/data/acpi/virt/riscv64/FACP             | Bin 0 -> 276 bytes
 tests/data/acpi/virt/riscv64/MCFG             | Bin 0 -> 60 bytes
 tests/data/acpi/virt/riscv64/RHCT             | Bin 0 -> 314 bytes
 tests/data/acpi/virt/riscv64/SPCR             | Bin 0 -> 80 bytes
 .../bios-tables-test.riscv64.iso.qcow2        | Bin 0 -> 16896 bytes
 tests/qtest/bios-tables-test.c                |  93 ++++++++++++++----
 tests/qtest/meson.build                       |   3 +
 tests/uefi-test-tools/Makefile                |  19 ++--
 .../UefiTestToolsPkg/UefiTestToolsPkg.dsc     |   6 +-
 tests/uefi-test-tools/uefi-test-build.config  |  52 ++++++++++
 40 files changed, 147 insertions(+), 35 deletions(-)
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
 create mode 100644 tests/data/acpi/virt/riscv64/APIC
 create mode 100644 tests/data/acpi/virt/riscv64/DSDT
 create mode 100644 tests/data/acpi/virt/riscv64/FACP
 create mode 100644 tests/data/acpi/virt/riscv64/MCFG
 create mode 100644 tests/data/acpi/virt/riscv64/RHCT
 create mode 100644 tests/data/acpi/virt/riscv64/SPCR
 create mode 100644 tests/data/uefi-boot-images/bios-tables-test.riscv64.iso.qcow2
 create mode 100644 tests/uefi-test-tools/uefi-test-build.config

-- 
2.40.1

