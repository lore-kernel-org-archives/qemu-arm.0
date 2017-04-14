Received: by 10.25.0.144 with SMTP id 138csp264354lfa;
        Fri, 14 Apr 2017 05:46:57 -0700 (PDT)
X-Received: by 10.200.1.203 with SMTP id b11mr7167921qtg.33.1492174017171;
        Fri, 14 Apr 2017 05:46:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k188si1711292qkd.87.2017.04.14.05.46.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Apr 2017 05:46:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53169 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cz0cq-0001pZ-Hu
	for alex.bennee@linaro.org; Fri, 14 Apr 2017 08:46:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cz0ch-0001oy-Rk
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 08:46:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cz0ce-00025N-OU
	for qemu-arm@nongnu.org; Fri, 14 Apr 2017 08:46:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46424)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cz0ce-000258-Ib; Fri, 14 Apr 2017 08:46:44 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5392D80490;
	Fri, 14 Apr 2017 12:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5392D80490
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5392D80490
Received: from localhost.localdomain.com (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C010F18AC5;
	Fri, 14 Apr 2017 12:46:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 14 Apr 2017 14:46:31 +0200
Message-Id: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 14 Apr 2017 12:46:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 0/4] vITS save/restore
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
	dgilbert@redhat.com, Vijaya.Kumar@cavium.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wqwht4j1KWr1

This series allows ITS save/restore and migration use cases.
It relies on not upstreamed kernel series [1].

ITS tables are flushed into guest RAM on VM stop while registers
are save on pre_save() callback. Tables and registers are restored
on ITS post_load().

Redistributor pending tables also are flushed on VM stop, independently
on ITS tables.

That work was tested on Cavium ThunderX using virsh save/restore and
virt-manager live migration.

Best Regards

Eric

Host Kernel dependencies:
- [1] [PATCH v5 00/22] vITS save/restore

History:
v4 -> v5:
- adapt to the new user API
- new patch "hw/intc/arm_gicv3_kvm: Implement pending table save"
  as the pending table save now is handled on GICV3 side.

v3 -> v4:
- oversight in v3, missed a last minute correction related to
  reg useless declaration in kvm_arm_its_pre_save

v2 -> v3:
- GITS_IIDR is now saved and restored to check ABI revision.
- get/put functions renamed into pre_save/post_load
- unmigratable = false removed
- changed the migration blocker message
- remove the extract64 round s->ctlr
- reword some comments

v1 -> v2:
- rebase on 2.9 soft release code
- handle case where migrate_add_blocker fails
- add comments along with ITS and GICv3 migration priorities


Eric Auger (4):
  linux-headers: Update for vITS save/restore
  hw/intc/arm_gicv3_its: Implement state save/restore
  hw/intc/arm_gicv3_kvm: Implement pending table save
  hw/intc/arm_gicv3_its: Allow save/restore

 hw/intc/arm_gicv3_common.c             |   1 +
 hw/intc/arm_gicv3_its_common.c         |  11 ++-
 hw/intc/arm_gicv3_its_kvm.c            | 120 +++++++++++++++++++++++++++++----
 hw/intc/arm_gicv3_kvm.c                |  25 +++++++
 include/hw/intc/arm_gicv3_its_common.h |   8 +++
 include/migration/vmstate.h            |   2 +
 linux-headers/asm-arm/kvm.h            |   6 +-
 linux-headers/asm-arm64/kvm.h          |   6 +-
 8 files changed, 164 insertions(+), 15 deletions(-)

-- 
2.5.5

