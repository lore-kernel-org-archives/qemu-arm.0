Received: by 10.25.77.65 with SMTP id a62csp111759lfb;
        Thu, 26 Jan 2017 01:20:19 -0800 (PST)
X-Received: by 10.200.55.173 with SMTP id d42mr1478960qtc.168.1485422419179;
        Thu, 26 Jan 2017 01:20:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n46si693303qtf.182.2017.01.26.01.20.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jan 2017 01:20:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cWgE4-0004ET-Hz
	for alex.bennee@linaro.org; Thu, 26 Jan 2017 04:20:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cWgDz-0004EB-F6
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 04:20:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cWgDw-0003m1-Aw
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 04:20:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56908)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cWgDw-0003kL-5S; Thu, 26 Jan 2017 04:20:08 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 393ABC049D59;
	Thu, 26 Jan 2017 09:20:08 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-36.ams2.redhat.com
	[10.36.116.36])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0Q9K4vW003187; Thu, 26 Jan 2017 04:20:05 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, shannon.zhao@linaro.org
Date: Thu, 26 Jan 2017 10:19:37 +0100
Message-Id: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 26 Jan 2017 09:20:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 0/4] vITS save/restore
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
Cc: drjones@redhat.com, vijay.kilari@gmail.com, quintela@redhat.com,
	dgilbert@redhat.com, peterx@redhat.com, Vijaya.Kumar@cavium.com,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +pReVDrxrx/f

This series allows ITS save/restore and migration use cases.
It relies on not upstreamed kernel series ([1] & [2]) and
QEMU not upstreamed series [3].

ITS tables are flushed into guest RAM on VM stop while registers
are save on pre_save() callback. Tables and registers are restored
on ITS post_load().

The code is based on Vijaya's "GICv3 live migration support"
series [3], based on v2.8.0-rc4.

The series also uses one patch from Peter Xu that aims at allowing
the explicit ordering of save/restore handlers [4], now upstreamed.

That work was tested on Cavium ThunderX using virsh save/restore and
virt-manager live migration.

Best Regards

Eric

Host Kernel dependencies:
- [1] [RFC 00/13] vITS save/restore
  (https://www.spinics.net/lists/arm-kernel/msg553854.html)
- [2] [PATCH v10 0/8] arm/arm64: vgic: Implement API for vGICv3 live
  migration
  http://www.spinics.net/lists/arm-kernel/msg546383.html

QEMU dependencies:
- [3] [PATCH v6 0/2] GICv3 live migration support
- [4] migration: allow to prioritize save state entries

This QEMU series can be found at:
https://github.com/eauger/qemu/tree/mig-gicv3-v6-its-rfc

Eric Auger (4):
  linux-headers: Partial update for vITS save/restore
  hw/intc/arm_gicv3_kvm: Rename KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS
  hw/intc/arm_gicv3_its: Implement state save/restore
  hw/intc/arm_gicv3_its: Allow save/restore

 hw/intc/arm_gicv3_common.c             |  1 +
 hw/intc/arm_gicv3_its_common.c         | 11 +++-
 hw/intc/arm_gicv3_its_kvm.c            | 94 +++++++++++++++++++++++++++++++++-
 hw/intc/arm_gicv3_kvm.c                |  2 +-
 include/hw/intc/arm_gicv3_its_common.h |  6 +++
 include/migration/vmstate.h            |  2 +
 linux-headers/asm-arm/kvm.h            | 25 ++++++---
 linux-headers/asm-arm64/kvm.h          | 14 +++--
 8 files changed, 140 insertions(+), 15 deletions(-)

-- 
2.5.5

