Received: by 10.25.0.23 with SMTP id 23csp1977328lfa;
        Wed, 7 Jun 2017 01:36:34 -0700 (PDT)
X-Received: by 10.237.53.205 with SMTP id d13mr34780275qte.46.1496824594016;
        Wed, 07 Jun 2017 01:36:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496824594; cv=none;
        d=google.com; s=arc-20160816;
        b=JFT3njQGhCKBHQ5ukYle5JiVF3FtTq3VGDIUj50CnYFSFuw51oirNf0eIzU3mHX1uz
         xSwMv6PM/uImwg0U5MZJDLJGwZhWTPLf/pOy5IkgdotRCAjxFOomtLlH5Cc4lauhatB9
         PPfILrR7JEWitgSysRBQyT1BqkbcbUIj0AUn9Nv7QvEl4M/ZR4BQJxrTkhYHApW+Mfpb
         ul0SmU/rr9nCg7R/fi47pBrcx+PXvmn2TxMHKZg6yNRm2rwSxP5ovjZTM0Z5aX6RMan3
         OnTdUKkPgNt187LKGGcmvOcTAKLgaZUqHRcoyUzwvHTMecI6MRFenr4u84o9OzlVIl2V
         RLPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=axdCXrBxmXHF1T2k3vwP64bvzCg/UGbluF9AvauquHw=;
        b=z2y6hYhAf8604R38Sz9nBvuwpXPgcfWqroLWqHPmW4ZF6qzos7OGSAAqH0WvHdogPU
         7+OwoNrHaq5A/vC13JnK3EKhj6ObFD64PjQZBDEq/iey//qseJmrs1uq9hXZVG/x17q7
         jI5g9waoN7pp4xEgA9yojkS+E07UneU5FId0JMR9Nzf65WROm23BkXFs8jogWp0oWpeL
         XBWgGbxAHoNbMsogLOA/XR04bI1kcX7mu03qoojiqf0eZFazGfrieKpVplaBMeCyQlmt
         IIQx86/Hr3JaH7Ayz5dNvDwZ+NIELyHkvGzK4YEtYA8cZ3+mFPHg+ARtDOj9Xe7y1H/U
         pM6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c37si1251543qta.209.2017.06.07.01.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Jun 2017 01:36:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41969 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIWS7-0003Ez-D9
	for alex.bennee@linaro.org; Wed, 07 Jun 2017 04:36:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIWRy-0003BP-7O
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 04:36:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIWRx-0000uC-Fy
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 04:36:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37232)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dIWRx-0000u0-A0; Wed, 07 Jun 2017 04:36:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BD6A83F46;
	Wed,  7 Jun 2017 08:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1BD6A83F46
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1BD6A83F46
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8EC2562926;
	Wed,  7 Jun 2017 08:36:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Wed,  7 Jun 2017 10:35:49 +0200
Message-Id: <1496824556-1883-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
References: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 07 Jun 2017 08:36:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 1/8] update-linux-headers: import virtio_iommu.h
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
X-TUID: 6jS8l+gw5mVm

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

