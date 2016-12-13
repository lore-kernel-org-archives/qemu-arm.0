Received: by 10.25.205.13 with SMTP id d13csp2425829lfg;
        Tue, 13 Dec 2016 13:45:42 -0800 (PST)
X-Received: by 10.237.53.253 with SMTP id d58mr85674612qte.29.1481665542036;
        Tue, 13 Dec 2016 13:45:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o18si28634937qke.325.2016.12.13.13.45.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 13:45:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44194 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGutH-0002LH-6l
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 16:45:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGut7-0002Jp-TV
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 16:45:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGut6-0007Sa-QU
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 16:45:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41720)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cGut6-0007SO-KC; Tue, 13 Dec 2016 16:45:28 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7191B16F8D4;
	Tue, 13 Dec 2016 21:45:27 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBDLjOQM014685; Tue, 13 Dec 2016 16:45:25 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Tue, 13 Dec 2016 22:45:11 +0100
Message-Id: <20161213214522.25548-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 13 Dec 2016 21:45:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 00/11] Remove VirtGuestInfo
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
Cc: peter.maydell@linaro.org, imammedo@redhat.com, mst@redhat.com,
	ehabkost@redhat.com, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WldWGf3sMZcv

This series is based on Peter's qemu-arm gicv3-virt branch. It's
main goal (patches 04-10), which was suggested by Eduardo, is to
remove an unnecessary structure, VirtGuestInfo, which is a
maintenance burden, as it requires duplicating Virt machine state.
Additionally patches 01-03 do some mach-virt cleanups and patch 11
adds the ACPI equivalent to one of the DT patches in Peter's
gicv3-virt branch.

The last patch isn't really tested as the guest kernel versions I
used seem to ignore the GTDT irqflags and either just choose edge,
4.5-based kernel, or level, 4.9-based kernel.

Patches available here
https://github.com/rhdrjones/qemu/commits/virt/remove-guest-info


Andrew Jones (11):
  hw/arm/virt: parameter passing cleanups
  hw/arm/virt: use VirtMachineState.gic_version
  hw/arm/virt: use VirtMachineState.smp_cpus
  hw/arm/virt: eliminate struct VirtGuestInfoState
  hw/arm/virt: remove include/hw/arm/virt-acpi-build.h
  hw/arm/virt: move VirtMachineState/Class to virt.h
  hw/arm/virt: pass VirtMachineState instead of VirtGuestInfo
  hw/arm/virt-acpi-build: remove redundant members from VirtGuestInfo
  hw/arm/virt-acpi-build: don't save VirtGuestInfo on AcpiBuildState
  hw/arm/virt: remove VirtGuestInfo
  hw/arm/virt-acpi-build: Don't incorrectly claim architectural timer to
    be edge-triggered

 MAINTAINERS                      |   2 -
 hw/arm/virt-acpi-build.c         | 103 +++++++++++++-------------
 hw/arm/virt.c                    | 152 ++++++++++++++-------------------------
 include/hw/arm/virt-acpi-build.h |  47 ------------
 include/hw/arm/virt.h            |  45 +++++++++++-
 5 files changed, 151 insertions(+), 198 deletions(-)
 delete mode 100644 include/hw/arm/virt-acpi-build.h

-- 
2.9.3

