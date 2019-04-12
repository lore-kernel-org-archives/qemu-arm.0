Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp366006wrx;
        Fri, 12 Apr 2019 03:10:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwgN0E7wkveIlYSh03ca8UmSRIfTfd44N+YAmB1m0KhAFEOO3wfYur5CIC0Di1OC2NlaXVS
X-Received: by 2002:a05:6000:12c7:: with SMTP id l7mr35385031wrx.4.1555063831414;
        Fri, 12 Apr 2019 03:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555063831; cv=none;
        d=google.com; s=arc-20160816;
        b=nxweKRAID0rSkaVzmtdPxqla5TWTLjZDf/faD3/rTZ2/rwsK+GhOivAMi6JteTp0j6
         m3Zd+xgZBtEzbK+m9Kq426GzsEs2BY9Y9O0GwMMMXkd7W1e0Yrl8x3Z/H2aNZFZuswOI
         9hrGKPF/WpSYB/owtSM6c32chdb0cqkWqBtE4Fmm/uYVZd2g5q+172VSY42wO3XSbcsT
         +hZCcQayqVTbWjj0+xNDuXAWunZbPxwuezhRpC0sjp5/fvHC3GfLE/rAGSjWsGaTFJiv
         OGEL1wJyMAXotly2el3aqq38/1V+b0mvLn/SpORBolmr6sn26S/iHrHacFbneJm2wmmX
         YL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qN+Ycmt1rsq/odJCtv5igGP+lLtNhwR2Vmuy1ip4B8k=;
        b=LaFoy7UQqnvmm6WVdH5dVQbeRaTVqhl9FW0z5h7Lowwecbkx7FB9EzYfKiGLJBYnnh
         Wn/5OGzyZ1HL3IwhCIX+xBWWlwn2/DI2+Rd7wetb8G+bm1olsTD1gSbLgSveAMZDv8kw
         tRg6ra3ITqND17xgMQ7W9ZRhXskqijbyn/6oAn+XC+gJ+HikweLgCeXFp4rrbsOIV6vd
         G4wtY/N/plLXENEJSCFiDFzmhBNY4etj7hold9AEJqszOU/iwvg+5JDo7cpURFWaJ6LL
         F7rrcKicihCDpjWo9mMi0TQuIySAUkBOJYf040A6DJ/+z04B0pFeK4EDarv246t6yvZ7
         K+gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12si27395921wrv.161.2019.04.12.03.10.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:10:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33615 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEt8g-0006Mu-Cf
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:10:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt39-0000xT-BX
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:04:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt37-0003ho-FQ
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:04:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53136)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hEt36-0003gV-SR; Fri, 12 Apr 2019 06:04:45 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A47BB306BB6E;
	Fri, 12 Apr 2019 10:04:42 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-161.ams2.redhat.com [10.36.117.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A82519C65;
	Fri, 12 Apr 2019 10:04:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 12 Apr 2019 12:03:32 +0200
Message-Id: <20190412100354.6409-6-eric.auger@redhat.com>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
References: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 12 Apr 2019 10:04:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 05/27] memory: add IOMMU_ATTR_VFIO_NESTED IOMMU
 memory region attribute
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
Cc: yi.l.liu@intel.com, mst@redhat.com, jean-philippe.brucker@arm.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JjO7/ZfDskDr

We introduce a new IOMMU Memory Region attribute, IOMMU_ATTR_VFIO_NESTED
which tells whether the virtual IOMMU requires physical nested
stages for VFIO integration. Intel virtual IOMMU supports Caching
Mode and does not require 2 stages at physical level. However virtual
ARM SMMU does not implement such caching mode and requires to use
physical stage 1 for VFIO integration.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 1625913f84..e4ee1d8b9b 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -204,7 +204,8 @@ struct MemoryRegionOps {
 };
=20
 enum IOMMUMemoryRegionAttr {
-    IOMMU_ATTR_SPAPR_TCE_FD
+    IOMMU_ATTR_SPAPR_TCE_FD,
+    IOMMU_ATTR_VFIO_NESTED,
 };
=20
 /**
--=20
2.20.1

