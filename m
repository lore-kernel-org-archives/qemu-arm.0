Received: by 10.223.172.38 with SMTP id v35csp4648910wrc;
        Tue, 19 Sep 2017 00:59:20 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDv2fI//Fq3mwIZ2yKE8OEHh1do6qKyqjpsRwEHVGQQNZ/Syzv2VMB9vyZqJsTdNplhM/4T
X-Received: by 10.200.38.110 with SMTP id v43mr757978qtv.296.1505807960761;
        Tue, 19 Sep 2017 00:59:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505807960; cv=none;
        d=google.com; s=arc-20160816;
        b=SQhHHx/8cEF0oYzYB++aViU9k2ljyxxdTbXpTz/4uthH/G8sbROKOSWG+LaQ58KR49
         3YHEsBso+glU7w7XPpGmSxShP6ndymJodhxdqcwRiKKbQlC6BBIWHHXFwixwGuX+al0J
         PZhdGuZCNLMF4Uusp2WPwL4NQ4Zu8H7cBAkaWMsUrhtdBHsvSqM+Z9Ozcj2bTzhCaC0k
         /F5aeNPrBcY/L5CxUcRmNkJnegp5uSAjyqtfjTWwfV5qkFEWVXAjEPcnvt+VOGEdAogP
         ZZmuxDbE7FRbeuTL5cdKcsUTjq/LflwzsMP97iJqPaDy6xaW4Llsq0s8DgaK2fuESbEY
         C4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=ymFnU+kivnws++w147gajuX51W3GLQfy8ud3dchvynU=;
        b=G1Y9+9NV8r7ps+DQugYLrLPx39GGnoasaMM3vMIRqWoK/9bnTKq5EGzKwzxhUJPUBe
         ySf6QTdxMH0LNLNXzz10BK20sFtLIs0S/kT3qjmqSJ11IQTOA9WRSENrxhOE7TiI7Qkr
         quofLjpgF4xOZ+/8orLNtjPS+btDYunkbY7DXCYosQ1zY30zV3FPXHafep9B57IPiegb
         R45JjY8MR0+jQQxd5UVCITvGhGQIybl539l0g1yO6Y59mgcg35CmqrGmTF1D7ewfWHBX
         3ueMNgL6c6xOE1uVG8lLq90t9yiA/ZZrNzyWY/hEfCKY6RU+Ld2APp4oFmLXdLQShg8Y
         UlEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d3si2815133qta.198.2017.09.19.00.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 00:59:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duDR8-0000By-Ej
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 03:59:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDIM-0001a0-Si
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 03:50:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1duDII-0001nu-Bd
	for qemu-devel@nongnu.org; Tue, 19 Sep 2017 03:50:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44350)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1duDI8-0001fx-Me; Tue, 19 Sep 2017 03:50:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9312651158;
	Tue, 19 Sep 2017 07:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9312651158
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-197.ams2.redhat.com
	[10.36.116.197])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7177461342;
	Tue, 19 Sep 2017 07:49:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue, 19 Sep 2017 09:46:45 +0200
Message-Id: <1505807208-9063-14-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 19 Sep 2017 07:49:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 13/16] memory.h: Add set_page_size_mask
 IOMMUMemoryRegion callback
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
X-TUID: TFuVccaASbR/

This callback allows to inform the IOMMU memory region about
restrictions on the supported page sizes.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 1dcd312..0c91dca 100644
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
2.5.5

