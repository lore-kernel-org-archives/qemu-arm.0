Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6308653wrg;
        Mon, 27 May 2019 04:44:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/8JxkGJBpy8QTaHQo4qLKpwt4BZMJ+X2ESuSjHz7vk8WzZW6uZOj+eGz/8RJoJVJvdjS7
X-Received: by 2002:aed:31a3:: with SMTP id 32mr94481424qth.322.1558957460671;
        Mon, 27 May 2019 04:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558957460; cv=none;
        d=google.com; s=arc-20160816;
        b=WMRTWeSU9sDUeLc//qhX07BGXBjy81c+f/AL/7pj3fbqmmvpk49x7lVEAV0zs1pQSh
         TYD02NVNfAfJGEWvHvkZv1r/hYnScSSV8Lm2A7CCHEutwHsPwIAeSpzSS4WZW+1QKVrz
         yVROIp+rnAEfPozSAIJ5H1OXE3ZG4cwSElnpYEGydPIEdzoBeOKgx7Jenv2BSHd+D1l5
         WilgDBtb3cb/Vj7+jBxjqyY5BjVAteCBpl1y6Uj08ijOkhUVGTRC0TZdKCR0FsjTLgZ/
         GK85iYOYsAmNfDQXvB2CCUl5TbR0KF3doNNtAX3Q1cGvhBAwMtf85G7FKUf73g3hTFeR
         WXrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Uo7NLQMrZ4i5endDZqKJVlbq1yKjDx21lzbnEo7Oe/Q=;
        b=sMO8pqWUQ3t2KGpvJ+eBTXGcgcqYum45Gr2ASFS0nMaXDJzS/zHiMWFKwJ9e5yhjf+
         zPWPw/EzO4ddYs3vLRVTFIgyAV85wFc+dSc+DAjXx+Hi0HDqXm73Gj2KJp1z4aSMG+03
         3QqEla/6SFIzE4Uhi6u4M4cQa6sO/DSEghYTGfVEMwugAOq2OTgpAwK+7BV9023oWJzh
         DZCGimto/li4CPurQE/qCOwv7xGenWcpiqUKWiPq1AVcmOCRHOOV8mahzX78tBbuNDhB
         3WOxeh2htAQyib7QxKKmcdY27bTc4eTx9jsskjDQ0QzWMdvsIDDsflS7SyBZUd3EzmtJ
         tvcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w23si5283289qtw.113.2019.05.27.04.44.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 04:44:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVE3A-0003RB-50
	for alex.bennee@linaro.org; Mon, 27 May 2019 07:44:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37840)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE23-0003ET-8R
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE22-0003SC-DV
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:43:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49566)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE1z-0003PF-59; Mon, 27 May 2019 07:43:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 673235D5E6;
	Mon, 27 May 2019 11:43:06 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 172145D962;
	Mon, 27 May 2019 11:42:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:41 +0200
Message-Id: <20190527114203.2762-6-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 27 May 2019 11:43:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 05/27] memory: add IOMMU_ATTR_VFIO_NESTED
 IOMMU memory region attribute
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +tGwceyg6fWV

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
index 9144a47f57..352a00169f 100644
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

