Received: by 10.28.71.27 with SMTP id u27csp830921wma;
        Fri, 19 Jan 2018 06:53:35 -0800 (PST)
X-Google-Smtp-Source: ACJfBouJXZambT4grGBYL13lB4Fkt+45oWF9sXwwEvMb89mnSMwCzY2s9XHlVUS2uTdeFFlBdcLX
X-Received: by 10.13.193.133 with SMTP id c127mr9518999ywd.170.1516373615239;
        Fri, 19 Jan 2018 06:53:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516373615; cv=none;
        d=google.com; s=arc-20160816;
        b=hVBUDU/OYRv5VdJCRiRlcNUSIOX9E5Vq3xATyQrUSymziljHBcMqm3tIgLY3i/c7pD
         fA6GJ0NXJp8bb6Sz2Zwh37zBrB1a4Or96H57h+2mNIPM9/rwfcXjZ1WHfm+s3fTb5Emr
         RFtv3kcWl2oAL9VLamXtyKINqhrI14j6BMNJrU6cBcvu4Q7ZGBII74fTxxoU1Riw/TXE
         Nqs4qPSe1QBwgyGAlbOrVL5aXYig9iYkS40uA5VF0I0NHTaMlZ3SJQvYCQ5wNHb7Pxsb
         vBltPU9E4FD4qZBZ72MsZH69VYUlyTm1zBGSW77WR2ryfkjcCBuCG7SDnAD68COF2vnd
         GJDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=8fQMAfM9NGco9iwLVVEehMuySv5YMECq7KRYyNayZ3U=;
        b=Z+GbvTPZsGmCcH5XJaBNLY21pbIw7ZuZOSqmF3wNC2BHK5bhk7q6CNFVxkHwKOKx7K
         N4FH2kVydwC3/U4xGKwwd2o0eWRZ1mGaToVlNfz8a18TSHEVO5b6HRdGM3+Ic3SF30xi
         tRPM14fKHLjbTyzkmF7p0XtCVJyGpOnJJeoltbQ1ZBNijZGhLY8M/vZQRKGpsiWMJ/ut
         ZbSbKhP8SEtG5m/9v7IAo2/fd/nzegf7OnQ2fHbXaDVziYsR+MeF3bUAeqfaN4sK+aOe
         tmgssX7tJWztPmlFUr7NsQNDipWWU92p3qvJQxN00ytLDPkyJ9KSQxRRPqduwS9Xo5Mw
         K+eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h9si617003ybh.134.2018.01.19.06.53.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 06:53:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53669 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecY2w-00075w-MY
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 09:53:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecY14-0005aE-EO
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:51:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecY12-0007bA-Ab
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 09:51:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:29549)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecY12-0007Zr-4j; Fri, 19 Jan 2018 09:51:36 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2372ACDB;
	Fri, 19 Jan 2018 14:51:35 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3505B5C881;
	Fri, 19 Jan 2018 14:51:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:48:57 +0000
Message-Id: <1516373355-305-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 19 Jan 2018 14:51:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 04/22] update-linux-headers: Import
 virtio_iommu.h
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
X-TUID: o8Ff7daou7N0

Update the script to update the virtio_iommu.h header.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 scripts/update-linux-headers.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index 135a10d..e5af161 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -135,6 +135,9 @@ EOF
 cat <<EOF >$output/linux-headers/linux/virtio_config.h
 #include "standard-headers/linux/virtio_config.h"
 EOF
+cat <<EOF >$output/linux-headers/linux/virtio_iommu.h
+#include "standard-headers/linux/virtio_iommu.h"
+EOF
 cat <<EOF >$output/linux-headers/linux/virtio_ring.h
 #include "standard-headers/linux/virtio_ring.h"
 EOF
-- 
1.9.1

