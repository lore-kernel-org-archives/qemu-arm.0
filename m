Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp632251wrd;
        Sat, 1 Sep 2018 07:43:01 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZYKHzJoT0zM5UEt+Mj2vcYZ4AkxseEhAdvAU9y9ZVxHohSMlAmzpgTDBLKNKISEg2zi10q
X-Received: by 2002:a37:d992:: with SMTP id q18-v6mr19199180qkl.101.1535812981303;
        Sat, 01 Sep 2018 07:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535812981; cv=none;
        d=google.com; s=arc-20160816;
        b=eLHzpfzXr2/PEMGix6NUJh6zE1nfX96u+EM4DNB/6feAAPQqJjtsA50iBC6mc5lpnh
         jptXdfsoE3aG4nlPKnMBkJ+6xDoUyvZD7i7l3u/WKT0Go9rWiNPexhNEsH4S10uf7zEC
         Wav1IYgaW4L2QaXfBRfeqM8IWahqiTT4TwCMk0SlGmLb7tbTWSL27lQMUSceQskbT7NR
         6B7V14xXd9pyXsMuNOrf9LpuIALqnneIDYa1WiSbbIl9JlEJWxyLludJUK7wvFLMIQKG
         1OG8gtqu8eZhQ9BbqfZk9mrFe+3P5yDl/Ep0eWsLMjhk9gfeTlhZcXWtrhYpIwTiM1Pw
         GLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=9THBJTmKde1h3eWLXBr7ccWsWxWeigYQoyzzXYkWk84=;
        b=vCo+cqZaL3qs8ptima1oYvM8jgG2s9GX6u2bVtlibhA1pNL0eWFsmdxBYwnbte/WG7
         ixJ+fa6Ek3b5IMLzhPo4KcGjkzWHJEfJc4IoFnI0qrrbpt1eIqVFLVPONmiyVwlchLhL
         vVmJS4HFDtE4r41pcLaxm111ZiovzjB3U2Q8PzLFjA+3kcioiSG4XKE84+QSau6b5CWz
         vTp/wgoKYJcJBfMyzlxMbXPV2i+hWemISOYrS3AGhNyvLW81xiXgDILsQEqXadTryKPv
         5JoZaUUKLuGkd/tkgVZu3YzhlLCHyXvlobKuTFDaIwyVqVU2XUd998BGe7gdKfEt7vmB
         TI4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r2-v6si2778777qtr.185.2018.09.01.07.43.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 07:43:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw776-00004q-PE
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 10:43:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6qX-0005sK-4k
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:25:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6oH-0005KX-BC
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:23:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54246 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fw6oD-0005GD-6z; Sat, 01 Sep 2018 10:23:29 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B32FE402347E;
	Sat,  1 Sep 2018 14:23:28 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D473B2166B41;
	Sat,  1 Sep 2018 14:23:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  1 Sep 2018 16:22:53 +0200
Message-Id: <20180901142312.11662-2-eric.auger@redhat.com>
In-Reply-To: <20180901142312.11662-1-eric.auger@redhat.com>
References: <20180901142312.11662-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Sat, 01 Sep 2018 14:23:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Sat, 01 Sep 2018 14:23:28 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC 01/20] hw/arm/smmu-common: Fix the name of the
 iommu memory regions
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
X-TUID: I877x8Xlrd0S

At the point smmu_find_add_as() gets called, the bus number might
not be computed. Let's change the name of IOMMU memory region and
just use the devfn and an incrementing index.

The name only is used for debug.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmu-common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 55c75d65d2..3f55cfd193 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -311,6 +311,7 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
     SMMUState *s = opaque;
     SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_pcibus_by_busptr, bus);
     SMMUDevice *sdev;
+    static uint index;
 
     if (!sbus) {
         sbus = g_malloc0(sizeof(SMMUPciBus) +
@@ -321,9 +322,8 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
 
     sdev = sbus->pbdev[devfn];
     if (!sdev) {
-        char *name = g_strdup_printf("%s-%d-%d",
-                                     s->mrtypename,
-                                     pci_bus_num(bus), devfn);
+        char *name = g_strdup_printf("%s-%d-%d", s->mrtypename, devfn, index++);
+
         sdev = sbus->pbdev[devfn] = g_new0(SMMUDevice, 1);
 
         sdev->smmu = s;
-- 
2.17.1

