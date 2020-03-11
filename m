Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1025799lfc;
        Wed, 11 Mar 2020 10:24:02 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuv2EOJURdgM7xLzOJvD0nZuDKYosz1Bbp1BwEaE/ifGdfVHiNXDLoeh2QAXB6E70X+mHzM
X-Received: by 2002:a0c:c1cd:: with SMTP id v13mr3661121qvh.77.1583947441893;
        Wed, 11 Mar 2020 10:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583947441; cv=none;
        d=google.com; s=arc-20160816;
        b=U+kGWOv49ga3FBdi+v7dHnnSVu7BQ6G1ZJ9gUWjml826EqSTcIJSO+rkcBQ7bgWtNt
         fVHJoMuMb177ww/9QYlSjVAyA8DEAXcqazONGOcGMHk2X8KBIgXDdXCMC0tG6zIzcSh0
         4wsZiOpEXpJYC7Gh5kVVpSjaWFLskQZ2ZKPSr+332jgCQu29gngvOjh/08URFNo9rmL7
         AkvkPnYJyJF7OwJ+DqfyXHT/u+RL5uv2wxl8g0zfeK3TOEZ2fvl1PH00G9W36CEsXe+T
         fOAbb5lCuVZYkpeDNNSafukT2qOagk2zMjU/uREqsQMyBllbGREf3MZ+46g/tCxOChMW
         oFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=LI6xK06ok8Mn4/+DfWa1Tt6lh4lNrkZRQUDSTs9MsIU=;
        b=YK7v5RpxB2+AMpgTCzzi/oLLBfwPGDn1F9aO/7DEi7us7f5BCV8KlixXeD8KnxH8BT
         DpZOkfrAyPGJIeys4vGkTzbu4ndoJ21zNsRx4+5ne8guwgN/B2aYbeDpj9sL2+PZihUt
         ZOH1/iGCOY94NYd/DHZrVSEWb6ZBFBx9aoC0uLSW9m0v2svID4waEW9TvMjIpyz+JkR8
         L23HqsPkQZugX1/nSOqDCxnFfCbI1rArD1fxUxo/GDUTlkbxit+De10lgK0NIRBQPQH1
         G9UUVWn+MhM4UJutjb/cnP5H3y6bg9HdEPX8f8Qgzi+dGC6vpKQe+UIPDDAXWGn/j3uN
         EooA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si1263893qka.180.2020.03.11.10.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 10:24:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jC55N-0002Nj-2K
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 13:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57976)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC54z-0001oq-Et
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 13:23:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC54y-0003aI-0z
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 13:23:37 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:35152 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC54x-0003RL-KI; Wed, 11 Mar 2020 13:23:35 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 85C7376D7FBABC6B84C4;
 Thu, 12 Mar 2020 01:23:24 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Mar 2020 01:23:14 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v3 00/10] ARM virt: Add NVDIMM support
Date: Wed, 11 Mar 2020 17:20:04 +0000
Message-ID: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, david@redhat.com,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Il++k2ievLpu

This series adds NVDIMM support to arm/virt platform.
The series reuses some of the patches posted by Eric
in his earlier attempt here[1].

This also include few fixes to qemu in general which were
discovered while adding nvdimm support to arm/virt.

Patch #2 addresses the issue[2] that, during migration, the 
source and destination might end up with an inconsistency
in acpi table memory region sizes.

Patch #3 is to fix the qemu_ram_resize() callback issue[2].

Patch #4 is another fix to the nvdimm aml issue discussed
here[3].

I have done a basic sanity testing of NVDIMM devices
with Guest booting with ACPI. Further testing is always
welcome.

Please let me know your feedback.

Thanks,
Shameer

[1] https://patchwork.kernel.org/cover/10830777/
[2] https://patchwork.kernel.org/patch/11339591/
[3] https://patchwork.kernel.org/cover/11174959/

v2 --> v3
 - Added patch #1 and # 2 to fix the inconsistency in acpi
   table memory region sizes during migration. Thanks to
   David H.
 - The fix for qemu_ram_resize() callback was modified to
   the one in patch #3. Again thanks to David H.
 - Addressed comments from MST and Eric on tests added.
 - Addressed comments from Igor/MST on Integer size in patch #4
 - Added Eric's R-by to patch #7.

v1 --> v2
 -Reworked patch #1 and now fix is inside qemu_ram_resize().
 -Added patch #2 to fix the nvdim aml issue.
 -Dropped support to DT cold plug.
 -Updated test_acpi_virt_tcg_memhp() with pc-dimm and nvdimms(patch #7)

David Hildenbrand (1):
  exec: Fix for qemu_ram_resize() callback

Kwangwoo Lee (2):
  nvdimm: Use configurable ACPI IO base and size
  hw/arm/virt: Add nvdimm hot-plug infrastructure

Shameer Kolothum (7):
  acpi: Use macro for table-loader file name
  fw_cfg: Migrate ACPI table mr sizes separately
  hw/acpi/nvdimm: Fix for NVDIMM incorrect DSM output buffer length
  hw/arm/virt: Add nvdimm hotplug support
  tests: Update ACPI tables list for upcoming arm/virt test changes
  tests/bios-tables-test: Update arm/virt memhp test
  tests/acpi: add expected tables for bios-tables-test

 docs/specs/acpi_hw_reduced_hotplug.rst |   1 +
 exec.c                                 |  14 +++-
 hw/acpi/generic_event_device.c         |  15 ++++-
 hw/acpi/nvdimm.c                       |  72 +++++++++++++++++----
 hw/arm/Kconfig                         |   1 +
 hw/arm/virt-acpi-build.c               |   8 ++-
 hw/arm/virt.c                          |  35 ++++++++--
 hw/core/machine.c                      |   1 +
 hw/i386/acpi-build.c                   |   8 ++-
 hw/i386/acpi-build.h                   |   3 +
 hw/i386/pc_piix.c                      |   2 +
 hw/i386/pc_q35.c                       |   2 +
 hw/mem/Kconfig                         |   2 +-
 hw/nvram/fw_cfg.c                      |  86 ++++++++++++++++++++++++-
 include/hw/acpi/aml-build.h            |   1 +
 include/hw/acpi/generic_event_device.h |   1 +
 include/hw/arm/virt.h                  |   1 +
 include/hw/mem/nvdimm.h                |   3 +
 include/hw/nvram/fw_cfg.h              |   6 ++
 tests/data/acpi/pc/SSDT.dimmpxm        | Bin 685 -> 734 bytes
 tests/data/acpi/q35/SSDT.dimmpxm       | Bin 685 -> 734 bytes
 tests/data/acpi/virt/DSDT.memhp        | Bin 6644 -> 6668 bytes
 tests/data/acpi/virt/NFIT.memhp        | Bin 0 -> 224 bytes
 tests/data/acpi/virt/SSDT.memhp        | Bin 0 -> 736 bytes
 tests/qtest/bios-tables-test.c         |   9 ++-
 25 files changed, 244 insertions(+), 27 deletions(-)
 create mode 100644 tests/data/acpi/virt/NFIT.memhp
 create mode 100644 tests/data/acpi/virt/SSDT.memhp

-- 
2.17.1


