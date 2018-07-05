Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1300395wrq;
        Thu, 5 Jul 2018 00:27:22 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd3VKn2sOQ5d4Y3NWVdBw0v9ioVGh4QHwjgjXmtQC/6wWLpaGZdRkm5lF4vZVbvWjfa3i2o
X-Received: by 2002:a37:a507:: with SMTP id o7-v6mr3993780qke.338.1530775642063;
        Thu, 05 Jul 2018 00:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530775642; cv=none;
        d=google.com; s=arc-20160816;
        b=xtZWIcAnVGIoraCR94QRl//rXVD2sEuQBcjzpTw6CkpjtC5RmHOkskYQSftl4ILOYu
         TForVaQ4j5SCQdMkzgUh/REdb9mJdzOii+LCq9kTF/RiUcYAqxiA9WX/Okji/1tmmwl/
         9Phw5SLSbArYDeT6LCCdeFp0/ZzEf0mJ4cMhqMYwgi6fr/wLHwGTGy8TFteIdtAzAi97
         474GIfeBAmRSIV0BHWLMNU9B9awVAEjGMwITCQIXE14GglJ1mLjC86wSkCBJsCYarDpH
         32QxHAvdWBhqqgIkeyRm8g98ioGDGZy2UM3fCZPes8lWVXmVHj50H19kNU+XULySxmzk
         Qo2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=27YxWnYbX6LC0ZL3fgK1R/80Bhl8VMNdDMrAvmutRAo=;
        b=RSu0ON87wmAiwYNBdQ7rgYkEetun2gVKlBAi+/6AVD633H4PZ5eLYUjZll8wfRF6gr
         5o4Ikl3TWNfY1+HngMNOgaoIlLlNyMBNb8miHwvxo+3Nvlx8qPRHRG3EUCeYl+/0IRXq
         J9LdVyWYmYt9wrczKgTCREGWaej0a2y1mtomlarg53JZdgUnrdeLt8DmcT+/++p/fmPx
         RnDf4baCHAaksQFgp3CyXaUyc6F2dHSBRNi1I4KJvcxTu98OVBSy4MdrgIiNWVK3leoM
         ndBViHO8uapoYGhCwvS3kO9Uzpr7xlhKMs+2kEDYfnoo413KO3R8asDaPIKY4auud8Mr
         IlZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w26-v6si5468801qva.98.2018.07.05.00.27.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Jul 2018 00:27:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fayfh-00071R-Jf
	for alex.bennee@linaro.org; Thu, 05 Jul 2018 03:27:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fayfa-00071I-RX
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 03:27:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fayfX-00039U-IJ
	for qemu-arm@nongnu.org; Thu, 05 Jul 2018 03:27:14 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55264 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fayfX-00035V-EH; Thu, 05 Jul 2018 03:27:11 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DEE5A401CB89;
	Thu,  5 Jul 2018 07:27:10 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-118.ams2.redhat.com
	[10.36.116.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 754F1111DD02;
	Thu,  5 Jul 2018 07:27:07 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu,  5 Jul 2018 09:27:03 +0200
Message-Id: <1530775623-32399-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 05 Jul 2018 07:27:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 05 Jul 2018 07:27:10 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH for 3.0] hw/arm/smmu-common: Fix devfn
 computation in smmu_iommu_mr
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ufMs3/vGLQfO

smmu_iommu_mr() aims at returning the IOMMUMemoryRegion corresponding
to a given sid. The function extracts both the PCIe bus number and
the devfn to return this data. Current computation of devfn is wrong
as it only returns the PCIe function instead of slot | function.

Fixes 32cfd7f39e08 ("hw/arm/smmuv3: Cache/invalidate config data")

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c         | 2 +-
 include/hw/arm/smmu-common.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 3098915..55c75d6 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -351,7 +351,7 @@ IOMMUMemoryRegion *smmu_iommu_mr(SMMUState *s, uint32_t sid)
     bus_n = PCI_BUS_NUM(sid);
     smmu_bus = smmu_find_smmu_pcibus(s, bus_n);
     if (smmu_bus) {
-        devfn = sid & 0x7;
+        devfn = SMMU_PCI_DEVFN(sid);
         smmu = smmu_bus->pbdev[devfn];
         if (smmu) {
             return &smmu->iommu;
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 50e2912..b07cadd 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -24,6 +24,7 @@
 
 #define SMMU_PCI_BUS_MAX      256
 #define SMMU_PCI_DEVFN_MAX    256
+#define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
 
 #define SMMU_MAX_VA_BITS      48
 
-- 
2.5.5

