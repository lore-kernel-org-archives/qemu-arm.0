Received: by 10.25.0.23 with SMTP id 23csp2160102lfa;
        Wed, 7 Jun 2017 09:03:57 -0700 (PDT)
X-Received: by 10.200.40.46 with SMTP id 43mr38227805qtq.132.1496851437438;
        Wed, 07 Jun 2017 09:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496851437; cv=none;
        d=google.com; s=arc-20160816;
        b=eGCYZ+JexXvQY/D6BQdNMtwzfjH3iGR9kpAntSd45ZNtVtPry3p8YCgpczMcQ9Rbf/
         u5at1QyEjc0Luo9CGsmvXL63KvyB9GiSNfZZPHUjoqQYkaWLK6l240Ys3sFyz/fu7x+p
         EHJaSI2Jbb/5DS+ekkyOwTwEkKWSZmshcGFBBo/YcwcpKFnp+/HFAQw8I39uld4hj2Wh
         yJGwurRXw8eifytLgyrR6qYyfRNGFuROonUE62XuANNkjhOWd1vZAgFTKJBrhGqEsQtv
         L4a3Y29noIxbdRRZ/O+5HVfaVddG0P8Iivx1yIJKpzUk5ygkVX7eBjqIWV1yKZhzyyLo
         pJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=axdCXrBxmXHF1T2k3vwP64bvzCg/UGbluF9AvauquHw=;
        b=oLzUVNv/JWqKOX5tlopOzA5tD7utEM5GXO8TBlNp+ac7QR+PHnm4Ly1HHbjzQ3FoqU
         FY5/p/vRBYhUpuydUNQSR+LFM8FAX/wbXzAxyjiqJTlr6AzKWt6odIQX/9wj5NzJMgLg
         qRQUjIuDpS1ZqRh1DQwDM3gA0VROxDQYJ+l0pGqCU0VIwjZy+eoNQUIg4o7zlGqwJUq1
         XeLPHkeL0wRA3USK1q8hdB60n5AHZRGIP4W9la5qcqmvtE2Jw8LwKPG/pTNpZzaZFqKd
         fgv9fChlDzXor/INJLjhBlSOsyKfuBZS44uHKDeZ1f0Ax/4x/M1dFtD8sndggaglu1vT
         j1NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v6si816473qti.54.2017.06.07.09.03.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Jun 2017 09:03:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIdR4-00087c-Tv
	for alex.bennee@linaro.org; Wed, 07 Jun 2017 12:03:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIdP0-0005rD-5o
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 12:01:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIdOz-0007yF-6O
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 12:01:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54410)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dIdOz-0007yA-15; Wed, 07 Jun 2017 12:01:45 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CF133D974;
	Wed,  7 Jun 2017 16:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8CF133D974
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8CF133D974
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1FF0189A9;
	Wed,  7 Jun 2017 16:01:39 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Wed,  7 Jun 2017 18:01:20 +0200
Message-Id: <1496851287-9428-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 07 Jun 2017 16:01:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 1/8] update-linux-headers: import virtio_iommu.h
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
Cc: kevin.tian@intel.com, bharat.bhushan@nxp.com, marc.zyngier@arm.com,
	tn@semihalf.com, will.deacon@arm.com, drjones@redhat.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6E0aoi6Cegq6

Update the script to update the virtio_iommu.h header.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 scripts/update-linux-headers.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index 2f906c4..03f6712 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -134,6 +134,9 @@ EOF
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
2.5.5

