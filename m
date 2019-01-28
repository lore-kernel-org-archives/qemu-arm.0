Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3146070wrt;
        Mon, 28 Jan 2019 03:07:09 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7XFNMUI0lzA5Z6rhjlypYxaz3TOJX95HLn3e9wixRvjpaO0OlcJXcAXHj8N9gx/nFcEIvn
X-Received: by 2002:a1c:2686:: with SMTP id m128mr15834880wmm.52.1548673629512;
        Mon, 28 Jan 2019 03:07:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548673629; cv=none;
        d=google.com; s=arc-20160816;
        b=jgIJq+Fifh5UUsw2rQicXE9/l+lEgEoiXiFAxCGV5rqixq3IrwNUfVE6wpF/x0Xree
         5WXEK2gGL0L7se7ZjtddiM8/4OksOr66/pFtKNwftAbm8FWart19SJ/Y24B9PPy6bFvT
         gIj7GQiaAqP3K/TqTKdw7QTCbnuVQlaJ/FGTM4ZUxxDUAQhdZGlCAMqbSX2Tab+sjpPO
         cQTiEFS7Ty3EIIs/UXExEFUPewHUlhFbkQ3HRBZrR1JqrVaZRyTn5PsPGFO1TQrBTLOr
         UBogw7kZWJt4NtSbofDTqumYIeRSOxPCx65bMKtao5xkyJDSoa5jfG1dVZk78pCifVzR
         V2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=qZMAyxjVvonXXoiaYy3uQDbaLGPHr3hBmLrgjm6ByJs=;
        b=wO9kUzWMlmSXmfGtkqeVM9Lpo4AGVY4xUtYtRzuwe+5/G1kzrIfUvD71EVXP+ziIzg
         Pjo09m4/chmlM5uyZBQxI+uigc2JUymGP7kAvSNA9F+LudMNQcI0lOtaeh1fdijengJb
         QVwREM2/lhxcyquig5OQh+zCHcTVBZamQnggxz6J94vMK/I8e2IT0sKZW08zC1kBKlP6
         Cu1NVX38IE5wH9zDG/uen1muaZ0x8/TCY49H0rpHIhAGDbZ7kzLzwqZknqvGtccIPio3
         GMYPOa+kJb3tDOXyI56RSIe3q8qn7+krZMLzTZjBML6n4c+WZDl6szGKrjGpblCs0e98
         pnrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9si3378474wmg.196.2019.01.28.03.07.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 03:07:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57919 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1go4ku-0003fa-G2
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 06:07:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1go4kh-0003dl-CK
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:06:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1go4kg-00043Y-9h
	for qemu-arm@nongnu.org; Mon, 28 Jan 2019 06:06:55 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2237 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1go4kf-00042l-UK; Mon, 28 Jan 2019 06:06:54 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id AAB8B905E925BDFD9B86;
	Mon, 28 Jan 2019 19:06:48 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.408.0; Mon, 28 Jan 2019 19:06:40 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <eric.auger@redhat.com>, <shannon.zhaosl@gmail.com>,
	<peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 28 Jan 2019 11:05:42 +0000
Message-ID: <20190128110545.20644-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [RFC PATCH 0/4] ARM virt: ACPI memory hotplug support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: linuxarm@huawei.com, xuwei5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GtGdup7Yvy0+

This series is an attempt to provide hotplug support to both
pc-dimm and nvdimm device memory on ARM virt platform. This is
based on Eric's recent works to support PCDIMM/NVDIMM device memory[1].
The kernel support for arm64 memory hot add was added only
recently by Robin[2] and hence the guest kernel should be => 5.0-rc1.

This makes use of PL061 GPIO controller to sent related ACPI events
to the Guest. The only reference I could find with respect to the GPIO
pins usage is here[3] which says, "use PIN 3 for system_powerdown,
reserving PIN 0, 1, 2 for PCI hotplug, CPU hotplug and memory hotplug".
Hence Pin 2 is used for PCDIMM and pin 4 for NVDIMM.

This is sanity tested on a HiSilicon ARM64 platform and appreciate
any further testing.

This series can be applied on top of Eric's branch here[4]

Test:
------
Please use a Guest kernel image >5.0-rc1 with all the mem/nvdimm
hotplug related CONFIGs enabled.

./qemu-system-aarch64 \
-machine virt,gic-version=3,nvdimm \
-m 1G,maxmem=4G,slots=4 \
-cpu host \
-kernel Image \
-initrd rootfs-iperf.cpio \
-bios QEMU_EFI.fd \
-numa node,nodeid=0 \
-net none \
-nographic -enable-kvm \
-append "console=ttyAMA0 acpi=force earlycon=pl011,0x9000000"

Enter Qemu monitor,
Add pc-dimm:
object_add memory-backend-ram,id=mem1,size=1G
device_add pc-dimm,id=dimm1,memdev=mem1

Add nvdimm:
object_add memory-backend-ram,id=mem2,size=1G
device_add nvdimm,id=dimm2,memdev=mem2

Known Issue:

It is observed that hot adding nvdimm will results in guest reboot
failure. EDK2 fails to build the ACPI tables on reboot. Please find
below EDK2 log on Guest reboot after nvdimm hot-add,

ProcessCmdAddChecksum: invalid checksum range in "etc/acpi/tables"
OnRootBridgesConnected: InstallAcpiTables: Protocol Error

The root cause seems to be EDK2 ACPI table checksum failure
as NFIT table is getting updated on hot-add. This needs further
investigation.

Thanks,
Shameer

[1]https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg05740.html
[2]https://patchwork.kernel.org/patch/10724455/
[3]https://lists.gnu.org/archive/html/qemu-arm/2015-12/msg00095.html
[4]https://github.com/eauger/qemu/tree/v3.1.0-dimm-v5

Shameer Kolothum (4):
  hw:acpi: Make ACPI IO address space configurable
  hw/arm/virt: Add GPIO based pcdimm hotplug ACPI event support
  hw/arm/virt: Enable pc-dimm hotplug support
  hw/arm/virt: Add nvdimm hotplug support

 default-configs/arm-softmmu.mak  |   1 +
 hw/acpi/memory_hotplug.c         |  13 +++--
 hw/arm/virt-acpi-build.c         |  45 +++++++++++++++--
 hw/arm/virt.c                    | 105 ++++++++++++++++++++++++++++++++++++---
 hw/i386/acpi-build.c             |   3 +-
 include/hw/acpi/memory_hotplug.h |   6 ++-
 include/hw/arm/virt.h            |  15 ++++++
 7 files changed, 168 insertions(+), 20 deletions(-)

-- 
2.7.4


