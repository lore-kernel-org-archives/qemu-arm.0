Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp10113616lff;
        Fri, 17 Jan 2020 09:47:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqyNQEThjmauKnWYTVMhuotzUIcjLkLCGk5/2mCppco4v/5KbfUbh1rDjb2e0raS/8AxRd6m
X-Received: by 2002:a37:65c8:: with SMTP id z191mr39446734qkb.176.1579283242644;
        Fri, 17 Jan 2020 09:47:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579283242; cv=none;
        d=google.com; s=arc-20160816;
        b=ne2NpH9rXJP5XExAtZGP4Av72UL517r84elJ2TMEYvNlbnkoxgY4la6QoMGvg1z0DK
         PJNPNGq+KkpzYl55dsArfcvXpYB1MQjFKN+dxA02KnnYjGcHZ0CzHFkBFsAiHvClYDuN
         tnMbO8Pe/73znIUjIiOE7DlSwH7ZIPXtvmUlJiV7yJfatRkK4VAZesAhZBwnzdsAm/G2
         IFtCZ1cp2EMZO+9d10FNUFVYFXnalDRyuG1D38dQU4/K56wQ71f8ofMweqWAbJPcE3yC
         UAPONjgMnDF97TbgcNABknD9J+yiJNpKgqlfxmrQDq7orWI5ZQ42xiSGf92+R7KkDKqc
         TCZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=tSFVtVQDucITJ3cbNzVb671dU1msriIiJbIbaI9ALuQ=;
        b=zTUrG2tVGIOCHFOCEqW5kJkwau3ELjZi1fYjGvgJXWt5FlLQzY3bC2N22Ud6NinGk9
         YJ6PPGddFR5TfHYOmUJLkfxiasAPzkpDLYQmw9zAe2XJOU6e1/KGq7kAqIdWjpDPEUs5
         OrTEnVK5r/eTHpq/R0GwVRxHt2LvKEO0nSr8H4D7KzRAjS3xBWxroCRtNFK8UN5uAuec
         7fLmEplJYCWgcRoLiK8YZYaokG8OjmSE+QynRBkm8b1PphXuNYOmv6z4spWFPW6GT7my
         HknxRcXQWfuRF3PvfXsU0x7R55r2UheZGEw9AAN+SSsGIPQAv01ilJozyXL2ukGl8CvP
         +Ovw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14si15633375qkk.301.2020.01.17.09.47.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 09:47:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isViL-0002I0-GS
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 12:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55746)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1isVi0-0002G2-8f
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 12:47:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1isVhx-0007ce-9m
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 12:46:59 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:46894 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1isVhw-0007Uh-UA; Fri, 17 Jan 2020 12:46:57 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7FA3720316FEC9BDA05E;
 Sat, 18 Jan 2020 01:46:46 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Sat, 18 Jan 2020 01:46:38 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v2 0/7] ARM virt: Add NVDIMM support
Date: Fri, 17 Jan 2020 17:45:15 +0000
Message-ID: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xPR1yXHeWKTN

This series adds NVDIMM support to arm/virt platform.
The series reuses some of the patches posted by Eric
in his earlier attempt here[1].

Patch #1 is a fix to the Guest reboot issue on NVDIMM
hot add case described here[2] and patch #2 is another
fix to the nvdimm aml issue discussed here[3].

I have done a basic sanity testing of NVDIMM deviecs
with Guest booting with both ACPI and DT. Further testing
is always welcome.

Please let me know your feedback.

Thanks,
Shameer

[1] https://patchwork.kernel.org/cover/10830777/
[2] https://patchwork.kernel.org/patch/11154757/
[3] https://patchwork.kernel.org/cover/11174959/

v1 --> v2
 -Reworked patch #1 and now fix is inside qemu_ram_resize().
 -Added patch #2 to fix the nvdim aml issue.
 -Dropped support to DT cold plug.
 -Updated test_acpi_virt_tcg_memhp() with pc-dimm and nvdimms(patch #7)

Kwangwoo Lee (2):
  nvdimm: Use configurable ACPI IO base and size
  hw/arm/virt: Add nvdimm hot-plug infrastructure

Shameer Kolothum (5):
  exec: Fix for qemu_ram_resize() callback
  hw/acpi/nvdimm: Fix for NVDIMM incorrect DSM output  buffer  length
  hw/arm/virt: Add nvdimm hotplug support
  tests: Update ACPI tables list for upcoming arm/virt test changes
  tests/bios-tables-test: Update arm/virt memhp test

 docs/specs/acpi_hw_reduced_hotplug.rst      |  1 +
 exec.c                                      | 36 +++++++----
 hw/acpi/generic_event_device.c              | 13 ++++
 hw/acpi/nvdimm.c                            | 68 +++++++++++++++++----
 hw/arm/Kconfig                              |  1 +
 hw/arm/virt-acpi-build.c                    |  6 ++
 hw/arm/virt.c                               | 35 +++++++++--
 hw/i386/acpi-build.c                        |  6 ++
 hw/i386/acpi-build.h                        |  3 +
 hw/i386/pc_piix.c                           |  2 +
 hw/i386/pc_q35.c                            |  2 +
 hw/mem/Kconfig                              |  2 +-
 include/exec/ram_addr.h                     |  5 +-
 include/hw/acpi/generic_event_device.h      |  1 +
 include/hw/arm/virt.h                       |  1 +
 include/hw/mem/nvdimm.h                     |  3 +
 tests/data/acpi/virt/NFIT.memhp             |  0
 tests/data/acpi/virt/SSDT.memhp             |  0
 tests/qtest/bios-tables-test-allowed-diff.h |  5 ++
 tests/qtest/bios-tables-test.c              |  9 ++-
 20 files changed, 163 insertions(+), 36 deletions(-)
 create mode 100644 tests/data/acpi/virt/NFIT.memhp
 create mode 100644 tests/data/acpi/virt/SSDT.memhp

-- 
2.17.1


