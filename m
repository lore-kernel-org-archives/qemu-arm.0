Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2884014wrd;
        Fri, 21 Sep 2018 01:58:28 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbNXi8d/dz5LYGTUf+QLNAgrQUOpSYM0DGLWAyGNLt21Ra+Aywh1xV+F4I0KLGLDgZZOJ2c
X-Received: by 2002:a37:ef01:: with SMTP id j1-v6mr30378349qkk.228.1537520308913;
        Fri, 21 Sep 2018 01:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537520308; cv=none;
        d=google.com; s=arc-20160816;
        b=vIj3iDVRu1GlHx0vtke1AALquzHzTl/2mNqBJ4HuOHI0630HDF9dsXNfYbjPgICxOB
         eE3DmxsDJ2THXPP/fP74CZMzk5W6kaerhI/WfokdrxyX7ifhGcpYWNdkAQax4tD+Mm1B
         ibudTaQSQTvQEC77TZqXpm2khwERGFwDrqbLp0SnUWWCKx/VYloOM3kBXhuZah+t/h0M
         fOOw6fmuy+0EJmwE3dGAu7xYYII9mxlQClFjcE2ScRrAQ05KJpdYzsGC4Nyb1E+0LQKK
         jeezuQEIbBtSL+qRroUARFlX2EPHRKwY9nDoRWWJR/tFfe+FcKHzxitjHokvr67EWiFD
         rW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=NGut1RtorYq563mR8vmp00GRq/HlV6LAL+DNrr6gP+Q=;
        b=Si3P8eFlzKALxvFOvpLDHOhCHAH4jOYZdM7qq6tb1TMeX5vO4+7ItJoXuWp+J6VETn
         OQKGk6eTk+w+A4CuYYdVKeTqLiPGusZmi7k0Gq0Yxqcu1vOy32KfMQyUJxvuh59SrBLX
         Aybk7df84AVJV9036KA808lHsQfxt9pP28Za17rHu8kwAlqWw/nQY3TraNZ3mvYGp2DA
         VFimRlveSlIBoHAwVEnDBM9IM0QH6igVFfydiUCqli0/sMLNpvRmxZv5e/oGaEhADbDM
         1hN77VLusHfn580omORd5oT7xRS+2Ga6M/OVh79WUzqhzNuJeCPv0JBr27lRwFg7Spks
         +zvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q28-v6si2030343qta.261.2018.09.21.01.58.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:58:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3HGd-0007Vr-NI
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:58:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GhI-00069F-SQ
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 04:21:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3GhI-0000HK-52
	for qemu-devel@nongnu.org; Fri, 21 Sep 2018 04:21:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38456)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3GhG-000061-6T; Fri, 21 Sep 2018 04:21:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A38880F88;
	Fri, 21 Sep 2018 08:21:53 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14A567D904;
	Fri, 21 Sep 2018 08:21:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:18 +0200
Message-Id: <20180921081819.9203-28-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 21 Sep 2018 08:21:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v2 27/28] hw/arm/smmuv3: Init fault handling
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i+ksdBMOyPXZ

We configure the kernel fault event fifo when the guest
sizes the event queue.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

At the moment we arbitrarily cap the fifo size to 2^5 events
---
 hw/arm/smmuv3.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index c6dec63f07..ae27cfdfa0 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1066,6 +1066,25 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
     return 0;
 }
 
+static int smmuv3_init_fault_queues(SMMUv3State *s)
+{
+    SMMUState *base = &s->smmu_state;
+    SMMUNotifierNode *node;
+    IOMMUConfig config;
+    /* TODO: today we cap the shift to 5 to avoid the kfifo to become too big*/
+    int qs = MIN(5, s->eventq.log2size);
+
+    config.fault_cfg.qs = qs;
+
+    QLIST_FOREACH(node, &base->notifiers_list, next) {
+        IOMMUMemoryRegion *iommu_mr = &node->sdev->iommu;
+
+        memory_region_config_notify_iommu(iommu_mr, 0, IOMMU_NOTIFIER_INIT_CFG,
+                                          &config);
+    }
+    return 0;
+}
+
 static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
                                uint64_t data, MemTxAttrs attrs)
 {
@@ -1089,6 +1108,7 @@ static MemTxResult smmu_writell(SMMUv3State *s, hwaddr offset,
         if (s->eventq.log2size > SMMU_EVENTQS) {
             s->eventq.log2size = SMMU_EVENTQS;
         }
+        smmuv3_init_fault_queues(s);
         return MEMTX_OK;
     case A_EVENTQ_IRQ_CFG0:
         s->eventq_irq_cfg0 = data;
-- 
2.17.1

