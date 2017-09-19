Received: by 10.223.172.38 with SMTP id v35csp4646682wrc;
        Tue, 19 Sep 2017 00:56:14 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD9QPCp5MjGAFknl5XX5qcvDmewkA1s70wNHx3HhoIDlCQxD5J6XY/T+Ob9X6yatmKNbAKN
X-Received: by 10.200.8.225 with SMTP id y30mr733490qth.233.1505807774504;
        Tue, 19 Sep 2017 00:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505807774; cv=none;
        d=google.com; s=arc-20160816;
        b=n1PQdelWNN+88jktPDEa+aH2dvVK0F8akcUbeabozq3GZRpe3XfopJLaFjRofhu/2C
         4cneO0Q5NpY4O6Z8MZRCwBu1/2umjDozh0V0RBCY2y6xcldhwtzwE+4zhMIrGPcztyWC
         Ay+zKF3uK2Bor+PLqjpjpNo6RrsSQ95bp5tbDBb3/Ywp5QwVaiP7VXO4Wrkl3heOAkJ/
         WWiuNumWQ8dtYgb92i69p1F6DT7cEUS9DYHhfnTPiwENerWh+MOTIvLvS5YAYuUqG2/8
         nkRkqSDas6nr3xYhm1oruAxEIwjtwNyTpoZw/tES059p+E7bObpgi/twJ66Vvw+Zyl2U
         3oVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=Uiu9kBwJxPedc1YOC8E4Y9cof48e6ixf0/ehN8OWaY0=;
        b=kz+ZwkGAYl/dHWYCYTUjlUh4Y8Xq14oKq+FMNUk+5WJrlhyNXstk0vT0LadrFoDyNZ
         pTKal1nBcbcaQJlAACZOtnEDSAxtM67mLUF59yRecBnW6D3+0Vyq7QDHBv+Fh2+Ju7p3
         Sh19CiDZP5hDy34ICRcdoMT0AhjXC6oW9JX20QJ5hrBVYnmeviqIYr1WbTfHnRWRchii
         uEuSIBh3VJELaHwNR77Dn8pp2ymawfE+GhqMGxL0UmPdneBR4eSxkmafrAJrz0w7zpBJ
         0ftpKeX7M2Z5L+DfNZo6wtuR7RVwJYrXiHWC/qQ2zpUTN5lk6rxIKYDLmPAqVfu2KNi8
         BjfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j10si9018236qtf.453.2017.09.19.00.56.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 00:56:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40632 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duDO8-00061S-59
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 03:56:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDHw-00019B-20
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 03:49:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDHv-0001ZV-5M
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 03:49:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51422)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1duDHp-0001WC-0S; Tue, 19 Sep 2017 03:49:41 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E442E4FD;
	Tue, 19 Sep 2017 07:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E442E4FD
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 17C3C61342;
	Tue, 19 Sep 2017 07:49:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue, 19 Sep 2017 09:46:43 +0200
Message-Id: <1505807208-9063-12-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 19 Sep 2017 07:49:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 11/16] hw/arm/virt: Add 2.11 machine type
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
Cc: wei@redhat.com, kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K9/V/4tN4SoA

The new machine type allows virtio-iommu instantiation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/arm/virt.c         | 23 +++++++++++++++++++++--
 include/hw/arm/virt.h |  1 +
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cfd834d..9737a5f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1648,7 +1648,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_2_10_instance_init(Object *obj)
+static void virt_2_11_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
@@ -1708,10 +1708,29 @@ static void virt_2_10_instance_init(Object *obj)
     vms->irqmap = a15irqmap;
 }
 
+static void virt_machine_2_11_options(MachineClass *mc)
+{
+}
+DEFINE_VIRT_MACHINE_AS_LATEST(2, 11)
+
+#define VIRT_COMPAT_2_10 \
+    HW_COMPAT_2_10
+
+static void virt_2_10_instance_init(Object *obj)
+{
+    virt_2_11_instance_init(obj);
+}
+
 static void virt_machine_2_10_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
+    virt_machine_2_11_options(mc);
+    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_10);
+
+    vmc->no_iommu = true;
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 10)
+DEFINE_VIRT_MACHINE(2, 10)
 
 #define VIRT_COMPAT_2_9 \
     HW_COMPAT_2_9
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 33b0ff3..ff27551 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -84,6 +84,7 @@ typedef struct {
     bool disallow_affinity_adjustment;
     bool no_its;
     bool no_pmu;
+    bool no_iommu;
     bool claim_edge_triggered_timers;
 } VirtMachineClass;
 
-- 
2.5.5

