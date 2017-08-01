Received: by 10.25.44.15 with SMTP id s15csp4666965lfs;
        Tue, 1 Aug 2017 02:34:30 -0700 (PDT)
X-Received: by 10.200.52.100 with SMTP id v33mr27181830qtb.67.1501580070317;
        Tue, 01 Aug 2017 02:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501580070; cv=none;
        d=google.com; s=arc-20160816;
        b=onI1ganHR9/qBRgnsDDpsfA386bZeIYXfM+wwjKD6hRXECanP6c1xPyOUgd3o8bLUL
         ZF+ZnHnIwcVZ/VYLRCnxqOaMA1jBM5KUTY+mgjNSwd0BgHRNRq42ub05w+oaP/hS2cex
         X+r6Y7FU+2pKILoj4VdP9xQninQmBgCO69ebfvncosly9Yk4jKfR3+LmFdTDISukRHFx
         StU503QTTARxzjeJjDEJSpPCxO8sSeQbTFqsYxTT1yGsCJvco24BE0Pl4hgyFbgflieM
         LaxQ+gg2aFsL22H8SXh0nL8BhU1YIYeRImyCeReKKsPwdc/mvK8Tw+GPZPbrhIoV+M4r
         PXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=axdCXrBxmXHF1T2k3vwP64bvzCg/UGbluF9AvauquHw=;
        b=q2rjxLo5E7XCWhawG1Kps9TODjTB0lhJ4ppHPD3yeAvdFyphrcXX/EgXE6/YYyoTQH
         btgSZNkiE4n/MfFq8oQ1G07rAnFR51ulN/pUPWU7Wmsfa+GyvR2eVSwYvs2N4eKMQbM3
         L3IOv4uh96gVyQFyn4807zDE86axGkYd08T3Acvk+sPvB6wCIlbDT1S7+rNeQJ4XOdG+
         loeC9AcnZcuFJdnZdWHDcUC5fG6GZXaydjVWzoX6RmHuIazlUqHEQuKvL6/sSibaxTkr
         mkPLeo7Ve4rTUIyP74xgw6fk2+h5G+Hyi6lcBaCYIBI9ITOSTGMvT8/cHy3Rhbt36Bn2
         1Xug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 16si25689380qtm.509.2017.08.01.02.34.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Aug 2017 02:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcTZL-0007H1-Oo
	for alex.bennee@linaro.org; Tue, 01 Aug 2017 05:34:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dcTZH-0007Fy-MD
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 05:34:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dcTZG-0001By-R0
	for qemu-arm@nongnu.org; Tue, 01 Aug 2017 05:34:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46272)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dcTZG-0001BF-LX; Tue, 01 Aug 2017 05:34:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7FDFDC04B071;
	Tue,  1 Aug 2017 09:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7FDFDC04B071
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-181.ams2.redhat.com
	[10.36.116.181])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CF1826017B;
	Tue,  1 Aug 2017 09:34:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Tue,  1 Aug 2017 11:33:07 +0200
Message-Id: <1501579994-3320-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
References: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 01 Aug 2017 09:34:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 1/8] update-linux-headers: import virtio_iommu.h
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
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zQxTh/BgJecF

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

