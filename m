Received: by 10.28.71.27 with SMTP id u27csp861693wma;
        Fri, 19 Jan 2018 07:19:22 -0800 (PST)
X-Google-Smtp-Source: ACJfBotTqbokDxEkYbo9VO2pkc9IiGq//WMnB+uquB4MiIi8oYmpT4ipLX0IWOF2wXEeG6Xhs0IM
X-Received: by 10.13.199.65 with SMTP id j62mr2106865ywd.370.1516375162686;
        Fri, 19 Jan 2018 07:19:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516375162; cv=none;
        d=google.com; s=arc-20160816;
        b=EDjg7E/jc6N2GJCqFhDqJ7Zc9b2PFHaJQaUFeSWnk8FRV79mOcQNEGKWpJ+iYGrFxo
         d1aWD5+u4P6vQT+BLtTuZdSrLUBl0ZkdLiPo1A2mj1yjrjia9zgfAPNkbO8iLVKy7rX1
         4POk7L3i8r2w4yF4JCv8lDlgYsCgI7dwfnP6iXBVcGwuB9R2gG/Vj/5RwWYKZ3oB+qs9
         zWEVCe0ndQ1qs4LYc1ehGvZdL7V1vtuYyGc9KqvV3xysUN8eaopPpVsdP/wRgBWqdBz5
         Kz9Mr5QL3RqzctJLHaslKYqIMK6sKVSz0ESypZwxz+2JsJ/2Fh7YRw9oNblQZKLyFys7
         JnFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=4+oWtO3SMx0nTnxi5Kp3hmaFI5B9a9mipDYwWyQLU6M=;
        b=d6hKwjPtHskmoPx7CkQ1kB0DhaP2EpB9pRNAwHyYX1gMDKxItK492C5CZRYwyTqO4z
         cGFMOUEMuNcbtFNlhexfXt3bXoA4u69PLtK2/DnDeHqCJc8TLl8+VTNYq0mWZsWw1iBY
         gFhHag44xSfbvpm1CwYyKu7tOxFFuvAl1DqKSk1uFZ2ms+kvKsK5FlBe/tZ2m1dSVTxe
         RD0uWFO1q424Au28R40vnfyhGuy5SnYoS4jNdyFGUbD+ghgTWdeICjOxTtIGcD15FfIz
         YM+fPlbSEiiRQt6L5lEoMC/C+R0D9hLyKY0Lu5VDGsd1tyIxFG0iR1JmKuuhcsZQyjsG
         fOiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p185si2272731ywf.257.2018.01.19.07.19.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:19:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYRu-0004XU-63
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:19:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYFw-0001tx-Qk
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:07:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYFv-0004iy-V7
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:07:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56542)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecYFv-0004gY-QL; Fri, 19 Jan 2018 10:06:59 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E698DFD06;
	Fri, 19 Jan 2018 15:06:58 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D06A45C1B7;
	Fri, 19 Jan 2018 15:06:25 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:49:12 +0000
Message-Id: <1516373355-305-20-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 19 Jan 2018 15:06:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 19/22] memory.h: Add set_page_size_mask
 IOMMUMemoryRegion callback
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7l0e/XPkurGL

This callback allows to inform the IOMMU memory region about
restrictions on the supported page sizes.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index a4cabdf..c0916d7 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -204,6 +204,10 @@ typedef struct IOMMUMemoryRegionClass {
                                IOMMUAccessFlags flag);
     /* Returns minimum supported page size */
     uint64_t (*get_min_page_size)(IOMMUMemoryRegion *iommu);
+
+    /* Limits the supported page sizes to @pgsizes */
+    void (*set_page_size_mask)(IOMMUMemoryRegion *iommu, uint64_t pgsizes);
+
     /* Called when IOMMU Notifier flag changed */
     void (*notify_flag_changed)(IOMMUMemoryRegion *iommu,
                                 IOMMUNotifierFlag old_flags,
-- 
1.9.1

