Received: by 10.25.205.13 with SMTP id d13csp8536520lfg;
        Mon, 2 Jan 2017 12:02:20 -0800 (PST)
X-Received: by 10.55.215.85 with SMTP id m82mr67068638qki.114.1483387340656;
        Mon, 02 Jan 2017 12:02:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l51si41153680qtc.107.2017.01.02.12.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jan 2017 12:02:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58741 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cO8oD-0001eZ-U3
	for alex.bennee@linaro.org; Mon, 02 Jan 2017 15:02:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8ny-0001XK-Lu
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 15:02:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8nv-0003jz-Jw
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 15:02:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35816)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cO8nv-0003je-Ee; Mon, 02 Jan 2017 15:01:59 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E6B1C04B302;
	Mon,  2 Jan 2017 20:01:58 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v02K1tOc017390; Mon, 2 Jan 2017 15:01:56 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Mon,  2 Jan 2017 21:01:37 +0100
Message-Id: <20170102200153.28864-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 02 Jan 2017 20:01:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 00/16] Remove VirtGuestInfo
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	shannon.zhao@linaro.org, zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WDP3ql+hWaWe

v2:
 - all Igor's suggestions
 - added four mach-virt acpi cleanup patches
 - added the remaining two acpi patches needed to bring equivalence
   to Peter's DT changes

This series is based on Peter's qemu-arm gicv3-virt branch. It's
main goal (patches 07-13), which was suggested by Eduardo, is to
remove an unnecessary structure, VirtGuestInfo, which is a
maintenance burden, as it requires duplicating Virt machine state.
Additionally patches 05-06 do some mach-virt cleanups and patches
14-16 add the ACPI equivalents of the DT patches in Peter's
gicv3-virt branch. The first four patches are cleanups to mach-virt's
acpi code.

Patches available here
https://github.com/rhdrjones/qemu/commits/virt/remove-guest-info-v2

Andrew Jones (16):
  hw/arm/virt-acpi-build: add all missing cpu_to_le's
  hw/arm/virt-acpi-build: name GIC CPU Interface Structure appropriately
  hw/arm/virt-acpi-build: gtdt: improve flag naming
  hw/arm/virt-acpi-build: fadt: improve flag naming
  hw/arm/virt: parameter passing cleanups
  hw/arm/virt: use VirtMachineState.gic_version
  hw/arm/virt: eliminate struct VirtGuestInfoState
  hw/arm/virt: remove include/hw/arm/virt-acpi-build.h
  hw/arm/virt: move VirtMachineState/Class to virt.h
  hw/arm/virt: pass VirtMachineState instead of VirtGuestInfo
  hw/arm/virt-acpi-build: remove redundant members from VirtGuestInfo
  hw/arm/virt-acpi-build: don't save VirtGuestInfo on AcpiBuildState
  hw/arm/virt: remove VirtGuestInfo
  hw/arm/virt-acpi-build: Don't incorrectly claim architectural timer to
    be edge-triggered
  hw/arm/virt-acpi-build: use SMC if booting in EL2
  hw/arm/virt-acpi-build: madt: add vgic maint irq

 MAINTAINERS                      |   2 -
 hw/arm/virt-acpi-build.c         | 145 +++++++++++++++++++++------------------
 hw/arm/virt.c                    | 141 +++++++++++++------------------------
 include/hw/acpi/acpi-defs.h      |  33 +++------
 include/hw/arm/virt-acpi-build.h |  47 -------------
 include/hw/arm/virt.h            |  43 +++++++++++-
 6 files changed, 178 insertions(+), 233 deletions(-)
 delete mode 100644 include/hw/arm/virt-acpi-build.h

-- 
2.9.3

