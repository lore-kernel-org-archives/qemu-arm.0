Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2857925wrd;
        Fri, 21 Sep 2018 01:26:17 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbwzGbqjF+hR6V8n7Fm9VVluFFxxSXMvOZuerhwmqEttLe28d7lVxITxensx03qCfI+nvUr
X-Received: by 2002:a0c:e4ce:: with SMTP id g14-v6mr30626131qvm.17.1537518377800;
        Fri, 21 Sep 2018 01:26:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518377; cv=none;
        d=google.com; s=arc-20160816;
        b=ZgkcWZZcd2LzitawMr3Si92oBdLCwVUpTShtghVRn7Wns/pCpzKY573ki6+bl4qVW+
         IdKoYC1NE46CmXe8xLLCXoSIdd017sxXeGHe7t7kcjGHjx0kUEjnh3eK1FJcpjo6gZQ7
         4ThFA2TU+mA3zGOC35yx2lWMamwN1oK9WncFScZ8bWrbsTAwUT3Y5XD5oxFTnHUXqcty
         coaA5w3Fm2xmdjyih8fixX6lf7n0zKACyiNEOHh7ELbLb1xmJFk1/b7xgNeHXlFvbai/
         GG29cVzCZ1zgq19VxP5gamc2kRQbQqWI8KcDGcZnPY3SC3k0sMFB1flZiU4v5GFxFZWl
         421g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=apusJeRMseFhgiQy6zCI1JSIBCSJFEuswi08VOMRSTQ=;
        b=gMOLD8CxjZmwLhFoe5gROwwA9oIwVB9/Znim4oX+IltvSJLOOBzDrKH6OY0LuCL3Ex
         G/kBlHWvgAa04g91qgiEGP76Y96fGUNIiJr70IeFRNkubGn/qIQ+1foXxs0PGgUbIljX
         5eOqp3+reMApyizxlqd9CB/4pTdjMPKHR6g/NlUf5gXSyjqeJ2KQcbeYAOHx/uL3z812
         NIKF07pDSSX6rkyXEDUyzxdF9ubGg7lAbg+R5Wv1PYTaTx9C2qOOnJ2UOZi2rNuYE2Kc
         OWcrVRHKyJoxweKLudWEzFc1bG+pnECoJxKiam3zY2L3XvrB8z9P1D5s3EzIY7JoMfcj
         5yPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g10-v6si1739778qtp.305.2018.09.21.01.26.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:26:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54393 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3GlV-0001yc-90
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:26:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gej-0003rg-EF
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:19:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Geg-0002Ri-8w
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:19:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53568)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Gee-00029P-7c; Fri, 21 Sep 2018 04:19:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B83519CF61;
	Fri, 21 Sep 2018 08:19:09 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F4127DFC0;
	Fri, 21 Sep 2018 08:18:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:17:54 +0200
Message-Id: <20180921081819.9203-4-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 21 Sep 2018 08:19:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 03/28] update-linux-headers: Import iommu.h
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2QxRDU0w4czZ

Update the script to import the new iommu.h uapi header.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 scripts/update-linux-headers.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index 0a964fe240..3f11e49758 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -125,7 +125,7 @@ done
 
 rm -rf "$output/linux-headers/linux"
 mkdir -p "$output/linux-headers/linux"
-for header in kvm.h vfio.h vfio_ccw.h vhost.h \
+for header in kvm.h vfio.h iommu.h vfio_ccw.h vhost.h \
               psci.h psp-sev.h userfaultfd.h; do
     cp "$tmpdir/include/linux/$header" "$output/linux-headers/linux"
 done
-- 
2.17.1

