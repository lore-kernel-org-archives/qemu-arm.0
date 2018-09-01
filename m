Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp626114wrd;
        Sat, 1 Sep 2018 07:34:10 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYfJ2TzCBdhHG7H68sTsk8BZKikh/CBtTIXudz7dy3qqBbne3wU9qHf4kCc6wtZf3LsdspU
X-Received: by 2002:ac8:2e2b:: with SMTP id r40-v6mr20080940qta.12.1535812450724;
        Sat, 01 Sep 2018 07:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535812450; cv=none;
        d=google.com; s=arc-20160816;
        b=II0LMJ1TopPN3T0//g/nlnN/tg3lLmQk+EtiXNdbDvMg2NMdBE1eDk+srgMD1KqlDc
         6aIYQjW/QgYR2x5thuLcNPoUAVYTcyC+ydjOB7n28ptvDxMJUutjnddFC7JBbU2uU7Zr
         y9q01xRmDJTQRuNSGRhLXLKaxWC12S73LatqmLUPCfSYJtiQ8dnK8JVGG+5FmSlbTZka
         0oB/RRRl3Z4NYIfe/tCurS+hcrwu78O8XoKYQtrIdKeU3LYUafuq4oUToBP0ugQaqnCA
         s9vzv+4LceHTPuYELRwYOZdrSHivqM0z8e0/eHIC6jpw7Y+PRQKnFz/QPVndrc/qKHA5
         ljWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=lltKUp0zgR5fZum3Vc1aj8HN/rM4woG1MvtK71VIOBc=;
        b=xq0w3kL0I4IF5NUA7PUGeyQ/AeetXdjMmW1yAEEKkkaJW9kOk4ErbXCIsmkquVhPqC
         XdZEZrQWsVX9PXnsohYCEZIej0Iyei64KIyMGKJW/ZsZwVSrcHT+F/BMVGH5qM22TeCg
         GyuuIaMDeU9IXlszmytiIsU0OV2yV9/RyT4GN5cFgNU1nTFBpjhvniGHxYzRRegqoF53
         rn04Oljd9eHh9LVOdMTmlaE7B2cfeEHzhuqNxQY6E81jiRXyahQCru4pUQYggUalZ+f0
         XRZYnDsrMVEMatO/3tVKEUw/wOUi/AnPRRn19hmBbgwIkdTU5mmGLjl4JUSGKZvItPHw
         pxzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z14-v6si5147368qti.5.2018.09.01.07.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 07:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw6yY-0007sv-5o
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 10:34:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6qS-0005sK-4p
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:25:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6oK-0005NO-GX
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:23:37 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42804 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fw6oJ-0005MC-H5; Sat, 01 Sep 2018 10:23:35 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E2EC4021715;
	Sat,  1 Sep 2018 14:23:35 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2EC762166B41;
	Sat,  1 Sep 2018 14:23:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  1 Sep 2018 16:22:56 +0200
Message-Id: <20180901142312.11662-5-eric.auger@redhat.com>
In-Reply-To: <20180901142312.11662-1-eric.auger@redhat.com>
References: <20180901142312.11662-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Sat, 01 Sep 2018 14:23:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Sat, 01 Sep 2018 14:23:35 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC 04/20] memory: add IOMMU_ATTR_VFIO_NESTED IOMMU
 memory region attribute
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
X-TUID: YrQs383Ulowt

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
index eb4f2fb249..b6e59c139c 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -209,7 +209,8 @@ struct MemoryRegionOps {
 };
 
 enum IOMMUMemoryRegionAttr {
-    IOMMU_ATTR_SPAPR_TCE_FD
+    IOMMU_ATTR_SPAPR_TCE_FD,
+    IOMMU_ATTR_VFIO_NESTED,
 };
 
 /**
-- 
2.17.1

