Received: by 10.25.0.23 with SMTP id 23csp3114791lfa;
        Fri, 9 Jun 2017 08:53:00 -0700 (PDT)
X-Received: by 10.55.124.194 with SMTP id x185mr37495485qkc.215.1497023580154;
        Fri, 09 Jun 2017 08:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497023580; cv=none;
        d=google.com; s=arc-20160816;
        b=Rx5WNEvehzIil1+NScDSEp6mPPNnii2tlD5K4pbF3XQYbvH5Eux47ThvXRCw8vKzc5
         XeFQE/V6D2ywr3GRTU1h4vlhXoG0M5AoDwb7yKHlsw/ueljq8o8LBdPbQGHGSz19HMe0
         GwmLu0WK/QTU1pGrgi/TRaxGjVLWTMiGNuP39WEis2oOi70pz4l9akt8gzKpCx0k5W8X
         l2NpJJAnMppxxSFSFwB8hYRVEVIsK9/F8JPKt6HOqAYMyCyezNXJmZvEdQH4LLqVQige
         WNxzthhgqnGo7mlTW3LMbxaCMFBvm+or/MOBNHb5w5Q7H013hUO/dS6V/GHvU/PYVUEb
         +3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=ZN5qSJHti+M3PtFhVAzJXtvZOP6chJW5ySJDXRyX7r8=;
        b=fpZRfnEahDqr9YrbZB4SeNSt2ue9mnR5aJJHlgs9OsIYIaV5ZfuH5yLNGHa8yObSbf
         NmvlwxvjIHwBYI5N8nOE/c2u4JF88eoM927238qmyp6KJ0nXcE0WDGS43893ai1iCgkQ
         y6M4qRP53n/JUvQgvFShQe4/HL/MaNdUInECvZam5zDmLtV3bpymoOPk4DbShEHeFM5b
         SOb/IpPWL0MozcdLoefvmM2OUAykrVkqK6jMp5iJr7l2ZXof9LtEjPWXFJYEUFmAJOYv
         E8n+Kze54JxMe4cIgk5k1ULq7qh7tBLPtqFbQd1RfKe6EmVwE3I76E3kNT0nffcYXMsD
         0RfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x185si1419623qkb.136.2017.06.09.08.52.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Jun 2017 08:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dJMDZ-00033w-HS
	for alex.bennee@linaro.org; Fri, 09 Jun 2017 11:52:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dJMDV-00032R-3P
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 11:52:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dJMDT-0004rj-P2
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 11:52:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36132)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dJMDT-0004r6-Iu; Fri, 09 Jun 2017 11:52:51 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5386E80C0C;
	Fri,  9 Jun 2017 15:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5386E80C0C
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5386E80C0C
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22F5782D80;
	Fri,  9 Jun 2017 15:52:34 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri,  9 Jun 2017 17:52:29 +0200
Message-Id: <1497023553-18411-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 09 Jun 2017 15:52:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 0/4] vITS save/restore
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
	zhaoshenglong@huawei.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SSlbuRzPWecv

This series allows ITS save/restore and migration use cases.

ITS tables are flushed into guest RAM on VM stop while registers
are save on pre_save() callback. Tables and registers are restored
on ITS post_load().

Redistributor pending tables also are flushed on VM stop, independently
on ITS tables.

That work was tested on Cavium ThunderX using virsh save/restore and
virt-manager live migration.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v2.9.0-its_mig-v6

History:
v5 -> v6:
- RFC -> PATCH as the kernel associated series was pulled for 4.12
- remove linux header update patch file
- added "kvm-all: Pass an error object to kvm_device_access" to avoid
  aborting if table save fails with -EFAULT
- fix the migration_blocker message (s/vGICv3/vITS)
- use &s->ctlr directly when writing GITS_CTLR
- s->iidr reset in gicv3_its_common_reset

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
  kvm-all: Pass an error object to kvm_device_access
  hw/intc/arm_gicv3_its: Implement state save/restore
  hw/intc/arm_gicv3_kvm: Implement pending table save
  hw/intc/arm_gicv3_its: Allow save/restore

 hw/intc/arm_gic_kvm.c                  |   9 ++-
 hw/intc/arm_gicv3_common.c             |   1 +
 hw/intc/arm_gicv3_its_common.c         |  12 ++-
 hw/intc/arm_gicv3_its_kvm.c            | 131 +++++++++++++++++++++++++++++----
 hw/intc/arm_gicv3_kvm.c                |  48 ++++++++++--
 include/hw/intc/arm_gicv3_its_common.h |   8 ++
 include/migration/vmstate.h            |   2 +
 include/sysemu/kvm.h                   |  11 ++-
 kvm-all.c                              |  13 ++--
 9 files changed, 200 insertions(+), 35 deletions(-)

-- 
2.5.5

