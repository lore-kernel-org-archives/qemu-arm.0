Received: by 10.28.71.27 with SMTP id u27csp207166wma;
        Mon, 12 Feb 2018 11:02:27 -0800 (PST)
X-Google-Smtp-Source: AH8x226mazXafslYq+RFvf6ndx1S/EOkryzigy7m1UOgBwo508gzSDNXIv0QyhaxoC/U9MwxtE5M
X-Received: by 10.13.201.65 with SMTP id l62mr8383103ywd.331.1518462147776;
        Mon, 12 Feb 2018 11:02:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518462147; cv=none;
        d=google.com; s=arc-20160816;
        b=eaC6SFA5bZQi1m4x8GNIDYJ/G4BMyC81oWG6pYmCVPymArhKnOCMQW8ALiSxUKFxXT
         Js/Gil9qN14EJ96CLpyO1mMsFPbF0vXWWgbUc4EZEFclm3dykZHdefTAuYtIcm3gDfrN
         bzVmsC/EddBlHFphcwAwMdqjLMTOBMF7jpIdc+MRdqbQKNY32ZavtZIlHPRiq1IybeQr
         3XtmmGJd1Dh1bXeJXtjBmVqcqZOD2si6tDiEQEtgUAJYZQ8wiEzOuOzclJOjAQ9j1OVo
         KMeKC52xrVHPYJ1JoW629/+vThtA5vZQwc8kL20SvApiOI4EBOEaLadtJjOq9HAA57DH
         5Gdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=8fQMAfM9NGco9iwLVVEehMuySv5YMECq7KRYyNayZ3U=;
        b=GhniD2NHmZ21xW/+OXm9rpNVtbZ5RvnyQAm6LNHFivPz7zVspVe8d5+yOLt+zOmp2B
         Nm/MmyUd5K9Jvw0ozGmL87jSY146u1DeXkyN+V1o2TXFkpyHKRcDjGFO8SuekMSfeVFb
         R5AHh+P8PJT6sZc9qQG0bXxbBj4theme9m5gVp239rLuaDMUEZW3nrUxzYj/vncqvcGU
         Zi9GsDHBLIiL4QEe9PHcSRXlYGSZ8nwlV/oWNcATS5d+9etsDS04tbvzHRRGXIGYKtDi
         U4RsXNW6qxr9dIplvOUzl3xeReaS8ThTRyMOZ/4ewdMyx0LEmUU5VPq2n6iDOXo98dD+
         sb0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e207si189384yba.369.2018.02.12.11.02.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 11:02:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elJMx-0002XK-68
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 14:02:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJJr-0008Vh-C7
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 13:59:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1elJJq-0002ua-Mx
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 13:59:15 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34188 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1elJJo-0002oY-Hl; Mon, 12 Feb 2018 13:59:12 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFC0E8182D2F;
	Mon, 12 Feb 2018 18:59:11 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDA7B1006ED7;
	Mon, 12 Feb 2018 18:59:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Mon, 12 Feb 2018 18:58:06 +0000
Message-Id: <1518461904-5305-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
References: <1518461904-5305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 12 Feb 2018 18:59:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 12 Feb 2018 18:59:12 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC v6 04/22] update-linux-headers: Import
 virtio_iommu.h
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
X-TUID: rtiqF3SZvzFg

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

