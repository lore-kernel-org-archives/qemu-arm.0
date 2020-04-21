Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5066979lfm;
        Tue, 21 Apr 2020 06:03:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypI99040XifjNiKjRUYMOd5S0WJG+WhmzuRgl6TNyONW/jXFwc28Ee/8y0nhlgCGEKeAY4O+
X-Received: by 2002:a05:6102:104b:: with SMTP id h11mr15542966vsq.182.1587474187791;
        Tue, 21 Apr 2020 06:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587474187; cv=none;
        d=google.com; s=arc-20160816;
        b=VsaRpYjS92EprpcfURL3iJrOb9aAbD3RpCAF6pW7EnKkpX6uFnRtD4BXpjwr0r2waW
         Ljr5FT2J75n/LbRH8bRF1SvLkEDAzXvEzVcRYP5hnXUqEMyebeka8UKtE0uBVEDXPOPp
         QRLuZn9MtWqwjQI/XQuPI0C0Jlh/gMMkAVE4BfwUwIHTlnOwqp0X3U3p8PdCAJ6lGHao
         0DRKh3PapXcL7VrDYMiTnUV5EBICzc8aBXwW+pm2e1u5AvMY8jtIsq7fJqrsgb/ElOjd
         8p8FxaqNeVVuWdejDZGoRAJUsix47rQaTmtvUm8ZywS8J+kOpvt+Qjmr7QI1wTfujXHo
         DkJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=74wObllBUssRRQtp2ljoE0UoMA7kSUgiGRnJRZfkF5o=;
        b=eXZqZ99USoUKkaLH1AXMdeoNWfSy76slSF44Lx/QsYN9WGnttCM7ebB6d55juMowIw
         D9NRCind6Z06QTf0RNam7B4Crv54Y//J7csbxyBApo1ekaDd6/YF18QQypVuUE1AhY0S
         8PN/XaO3JLzWW7bfWBfgB51hN6nwdkm1svCuEeYBPxAzZgqnHFY+nkogw/5r31R2r9aX
         jZ4e3p7cmZ9Jg8wrIPnrD6LRBUlGzDHyrA1e8vlZLmzf3wmiez7dx529QKkup7o5vQs9
         EXX2wPr60KJ6mse97JWVdbFvNpx78hWqVthpgaAFrngsoaAjoCBznvuZPhbUkZ01DBTo
         DYZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m44si1451117qtf.142.2020.04.21.06.03.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 06:03:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQsYN-0000gh-4U
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 09:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44602)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jQsXV-0007yG-7a
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:02:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jQsXU-00020N-7X
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:02:12 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3674 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jQsXT-0001i7-9k; Tue, 21 Apr 2020 09:02:11 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 26B1A5D3203E16C96B98;
 Tue, 21 Apr 2020 21:01:59 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.91.160) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Tue, 21 Apr 2020 21:01:51 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v4 0/7] ARM virt: Add NVDIMM support
Date: Tue, 21 Apr 2020 13:59:27 +0100
Message-ID: <20200421125934.14952-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.91.160]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=shameerali.kolothum.thodi@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 09:01:59
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Received-From: 45.249.212.190
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
 prime.zeng@hisilicon.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5tAAS21VYZyZ

This series adds NVDIMM support to arm/virt platform.
The series reuses some of the patches posted by Eric
in his earlier attempt here[1].

This series previously had few fixes to qemu in general
which were discovered while adding nvdimm support to arm/virt.
Those were sent out seperately[2] and are now part of Qemu.

Patch #1 is another fix to the nvdimm aml issue discussed
here[3].

I have done a basic sanity testing of NVDIMM devices
with Guest booting with ACPI. Further testing is always
welcome.

Please let me know your feedback.

Thanks,
Shameer

[1] https://patchwork.kernel.org/cover/10830777/
[2] https://patchwork.kernel.org/cover/11472501/
[3] https://patchwork.kernel.org/cover/11174959/#23020961

v3 --> v4
 -Removed patches #1 to #3 from v3 as they are now part of Qemu.
 -Addressed comments from Igor(#6) and Shannon(#4).
 -Added R-by from Igor(#1,#2,#3).

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

Kwangwoo Lee (2):
  nvdimm: Use configurable ACPI IO base and size
  hw/arm/virt: Add nvdimm hot-plug infrastructure

Shameer Kolothum (5):
  hw/acpi/nvdimm: Fix for NVDIMM incorrect DSM output buffer length
  hw/arm/virt: Add nvdimm hotplug support
  tests: Update ACPI tables list for upcoming arm/virt test changes
  bios-tables-test: test pc-dimm and nvdimm coldplug for arm/virt
  tests/acpi: add expected tables for bios-tables-test

 docs/specs/acpi_hw_reduced_hotplug.rst |   3 +-
 hw/acpi/generic_event_device.c         |  15 +++++-
 hw/acpi/nvdimm.c                       |  72 ++++++++++++++++++++-----
 hw/arm/Kconfig                         |   1 +
 hw/arm/virt-acpi-build.c               |   6 +++
 hw/arm/virt.c                          |  35 ++++++++++--
 hw/i386/acpi-build.c                   |   6 +++
 hw/i386/acpi-build.h                   |   3 ++
 hw/i386/pc_piix.c                      |   2 +
 hw/i386/pc_q35.c                       |   2 +
 hw/mem/Kconfig                         |   2 +-
 include/hw/acpi/generic_event_device.h |   1 +
 include/hw/arm/virt.h                  |   1 +
 include/hw/mem/nvdimm.h                |   3 ++
 tests/data/acpi/pc/SSDT.dimmpxm        | Bin 685 -> 734 bytes
 tests/data/acpi/q35/SSDT.dimmpxm       | Bin 685 -> 734 bytes
 tests/data/acpi/virt/DSDT.memhp        | Bin 6644 -> 6668 bytes
 tests/data/acpi/virt/NFIT.memhp        | Bin 0 -> 224 bytes
 tests/data/acpi/virt/SSDT.memhp        | Bin 0 -> 736 bytes
 tests/qtest/bios-tables-test.c         |   9 +++-
 20 files changed, 138 insertions(+), 23 deletions(-)
 create mode 100644 tests/data/acpi/virt/NFIT.memhp
 create mode 100644 tests/data/acpi/virt/SSDT.memhp

-- 
2.17.1


