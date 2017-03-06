Received: by 10.25.0.147 with SMTP id 141csp1328753lfa;
        Mon, 6 Mar 2017 03:49:27 -0800 (PST)
X-Received: by 10.55.67.135 with SMTP id q129mr15697606qka.98.1488800967300;
        Mon, 06 Mar 2017 03:49:27 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t30si15279236qtt.48.2017.03.06.03.49.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Mar 2017 03:49:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43093 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ckr8m-0007jx-SE
	for alex.bennee@linaro.org; Mon, 06 Mar 2017 06:49:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ckr7r-0007hJ-QN
	for qemu-devel@nongnu.org; Mon, 06 Mar 2017 06:48:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ckr7r-0006EG-4B
	for qemu-devel@nongnu.org; Mon, 06 Mar 2017 06:48:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59028)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ckr7k-00067F-U2; Mon, 06 Mar 2017 06:48:21 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81E9261B84;
	Mon,  6 Mar 2017 11:48:20 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-100.ams2.redhat.com
	[10.36.116.100])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v26BmGgA027200; Mon, 6 Mar 2017 06:48:17 -0500
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Mon,  6 Mar 2017 12:48:11 +0100
Message-Id: <1488800894-22421-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 06 Mar 2017 11:48:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v2 0/3] vITS save/restore
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, vijay.kilari@gmail.com, quintela@redhat.com,
	dgilbert@redhat.com, peterx@redhat.com, Vijaya.Kumar@cavium.com,
	christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mnI80meg6tkV

This series allows ITS save/restore and migration use cases.
It relies on not upstreamed kernel series [1].

ITS tables are flushed into guest RAM on VM stop while registers
are save on pre_save() callback. Tables and registers are restored
on ITS post_load().

That work was tested on Cavium ThunderX using virsh save/restore and
virt-manager live migration.

Best Regards

Eric

Host Kernel dependencies:
- [1] [PATCH v3 00/19] vITS save/restore

History:

v1 -> v2:
- rebase on 2.9 soft release code
- handle case where migrate_add_blocker fails
- add comments along with ITS and GICv3 migration priorities

Eric Auger (3):
  linux-headers: Update for vITS save/restore
  hw/intc/arm_gicv3_its: Implement state save/restore
  hw/intc/arm_gicv3_its: Allow save/restore

 hw/intc/arm_gicv3_common.c                  |   1 +
 hw/intc/arm_gicv3_its_common.c              |  11 ++-
 hw/intc/arm_gicv3_its_kvm.c                 | 109 +++++++++++++++++++++++++---
 include/hw/intc/arm_gicv3_its_common.h      |   6 ++
 include/migration/vmstate.h                 |   2 +
 include/standard-headers/linux/virtio_pci.h |   2 +-
 linux-headers/asm-arm/kvm.h                 |   2 +
 linux-headers/asm-arm64/kvm.h               |   2 +
 linux-headers/linux/userfaultfd.h           |  16 ++--
 9 files changed, 132 insertions(+), 19 deletions(-)

-- 
2.5.5

