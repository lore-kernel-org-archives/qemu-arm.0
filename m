Received: by 10.223.159.82 with SMTP id f18csp839174wrg;
        Thu, 23 Nov 2017 06:59:15 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZYFKZNEM2OzExZGl3s2E/hn+8x/BBljLhkrama6I8nqHPEdimPWDyxHOzuvIRGjtfcLL0P
X-Received: by 10.129.116.6 with SMTP id p6mr16036651ywc.136.1511449155050;
        Thu, 23 Nov 2017 06:59:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511449155; cv=none;
        d=google.com; s=arc-20160816;
        b=OoAcOhi5MzIldutOhVUUnxg8VM4v//ncrIDG4DFFywFZTNpVqEvnDojWa8lez7cq1U
         Gw5sY9oy4GcGTP0DS+/1Q1VDLeo7z8R7hNIKoEAfCj1ntvWBnCFdacYlFsoXOVH6vpf/
         21IbPmfApg0AkoZknF/UijkZTqXCxHUQ8fnd5k2qRwqdE/RrqbPpqPLZufW0pS1i28ce
         MEjPNwQGNiimCMJgbQ6vCFyrb/qt2/IgAnLlVzyQrXVzi8R/pNCbvvUHIBHuihsUbMSy
         1d8Vi61Da/T2lNGs8OzMU0MZhojLaMC1z7olEod3nlAbXnofyxxXi0N6U93OEy/rAYkJ
         6kwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=3Kn6xdst83dgSo3faqbNB6p/REdP+nNOktTzxBaYSZA=;
        b=l4HHLoF7ccxQVXTFckvmYnZkaloAC5TgGEkC80VHmYHvk8Drs0HWUM3ILSJHF6VynB
         DGaVNKIIR4+TLYt4exzYfBZRrT8mbPivAKs9mAOfLv6ZHpG3kppmfYotCjZXSPg9a0K3
         bw9L2zNtod00kwS+YDj0G+Sgyhml3ORflRu64yYB79k+NwzcTmDsGcMEafve/3PrQXVv
         V308ak0vskRI80jyK/F83AFa37zOtqOaItNKr4AvDygvPAKxJ9bEBBrmlAutcJ/rBcIO
         rehl2TJOznEo1+N0DovUQ6MTWgE8Mh5xs9BFtsuZgwFTKALA0f2B3FCbaE74F5nK0+Ql
         i4Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u13si4327432ywl.444.2017.11.23.06.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Nov 2017 06:59:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHsyA-0003i7-E1
	for alex.bennee@linaro.org; Thu, 23 Nov 2017 09:59:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eHsvc-0001ro-T8
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 09:56:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eHsvc-0007X0-5F
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 09:56:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54408)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eHsvb-0007W0-VZ; Thu, 23 Nov 2017 09:56:36 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13689A0B22;
	Thu, 23 Nov 2017 14:56:35 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-138.ams2.redhat.com
	[10.36.117.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 632C25D6A5;
	Thu, 23 Nov 2017 14:56:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Thu, 23 Nov 2017 15:56:12 +0100
Message-Id: <1511448975-28326-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
References: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 23 Nov 2017 14:56:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 1/4] hw/intc/arm_gicv3_its: Don't call post_load
 on reset
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
	dgilbert@redhat.com, wu.wubin@huawei.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PIYNPVdlWINb

From the very beginning, post_load() was called from common
reset. This is not standard and obliged to discriminate the
reset case from the restore case using the iidr value.

Let's get rid of that call.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/arm_gicv3_its_common.c | 2 --
 hw/intc/arm_gicv3_its_kvm.c    | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index f2cce59..2bd2f0f 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -131,8 +131,6 @@ static void gicv3_its_common_reset(DeviceState *dev)
     s->creadr = 0;
     s->iidr = 0;
     memset(&s->baser, 0, sizeof(s->baser));
-
-    gicv3_its_post_load(s, 0);
 }
 
 static void gicv3_its_common_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 6fb45df..b1b322b 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -155,10 +155,6 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
 {
     int i;
 
-    if (!s->iidr) {
-        return;
-    }
-
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
                       GITS_IIDR, &s->iidr, true, &error_abort);
 
-- 
2.5.5

