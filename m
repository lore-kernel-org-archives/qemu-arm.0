Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp625666wrd;
        Sat, 1 Sep 2018 07:33:34 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYJp6dLbCScC4f3M+rBxPU/fsSX4Qw93Bf9az4LaqiCedWQobZ4UBweJwc05gfSKVXVs7zV
X-Received: by 2002:aed:356a:: with SMTP id b39-v6mr20081538qte.278.1535812413987;
        Sat, 01 Sep 2018 07:33:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535812413; cv=none;
        d=google.com; s=arc-20160816;
        b=iQ2BtXMFfif+poECeL3DatturFM3SXyOty9fOIyA4CsuABFJmiZGQdAsxkRgl5L34Q
         ZcTrguJyiS2YjbofJO3jy99q3d9Es7cU93yyW155DRpOvYmYcgDKSkKaBqRJrELI1r1V
         uUDGa8eDHCMDo2z3akJ5CILBQnX2WPkYz0EkklasbkAC9K5UHTLAeWuSRBqKKm9u30Fz
         4xWUDQDitrqDr9Zwp/OU6gN1m5HiPzpnHoa6iYhENHH6x4JIXF668/TXbaGzpE2oXaa7
         IAhVf2WBPiIUQBIzKM/UYJnFEVNxKggd5QH4FKQT0te8LnVobO+7sjSyQ+BE7yEjzWrG
         /jeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=apusJeRMseFhgiQy6zCI1JSIBCSJFEuswi08VOMRSTQ=;
        b=L1morzo2+4pVxAzaZCcK5EcLWilUsvljl216rjC3fN9TcWdW17nGl/BKW8LVT8r5xF
         sJyoBAysrTsLqyDuJJUdkPWIuL2taJelNYh3aNH5J8dzxmw7pVtqVAriorGDhlIBr7MZ
         6+2so9lSK1qdD3zT6ysPOm6U6OMes2jwdrM+pgcujFPgYULKDj9/5iIqcux4vm2uS6yy
         Nu88QC7TGgqe9E9xftRPdtY//Cs5yR4LUAVabM27cpn2D/CP7FtZZNAx3kxGh+0ZJAmM
         UU2QPRO+15nRULRZDk2BqUqS29pMhS4q9fgdpoHXVCJ2h+qW71Ix9IkiaPK4WE2euF2E
         AsRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c125-v6si3117862qka.295.2018.09.01.07.33.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 07:33:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw6xx-0007in-Dm
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 10:33:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6qX-0006BB-EK
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 10:25:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6oF-0005Ic-Bf
	for qemu-arm@nongnu.org; Sat, 01 Sep 2018 10:23:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54258 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fw6oF-0005IP-7E; Sat, 01 Sep 2018 10:23:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CEC37402383E;
	Sat,  1 Sep 2018 14:23:30 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F032F2166B41;
	Sat,  1 Sep 2018 14:23:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  1 Sep 2018 16:22:54 +0200
Message-Id: <20180901142312.11662-3-eric.auger@redhat.com>
In-Reply-To: <20180901142312.11662-1-eric.auger@redhat.com>
References: <20180901142312.11662-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Sat, 01 Sep 2018 14:23:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Sat, 01 Sep 2018 14:23:30 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 02/20] update-linux-headers: Import iommu.h
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
X-TUID: p7DpQ80yQDO0

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

