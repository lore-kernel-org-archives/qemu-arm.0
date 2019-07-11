Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp986947wrv;
        Thu, 11 Jul 2019 10:40:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyJU2v/n3YkTA1R0Z5i6S0QEpnH1tz9C0Mz6iBiJK69jiGEhwqD8i1l/k8rVTU8bOeZcSez
X-Received: by 2002:a50:d65e:: with SMTP id c30mr4819221edj.38.1562866845188;
        Thu, 11 Jul 2019 10:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866845; cv=none;
        d=google.com; s=arc-20160816;
        b=pcB/TzYvhH/ECS4hm5HEusp3j2Z5kTp9f4dizDOJ4nXsDSBIp1oDlqV8aLIf9nbpqH
         Ie153rV8bP8xZO7EYxhcZEGisoprd3tlulu/6UCQwKxoFs8zQGWS97Mi3MHAp3xHkf/2
         lmGrCuBgFSe5AWDuZoU2MHKUR29DyjkrtBd8IJ1ByYdj6R3WFtEG06bRSCmoCJPF7LJ2
         DYgFkEowvpTAkenSKqEBPTmPoaLY8fQnUk8bBWXclEDMzopU78L+f+50g6rDx3K4vkZo
         KqoFL71HMDlDXUjwaBw444/9Aozsj9FT1apfA4FiCMnzbko0IQ1e8BZJi/1PkbgldCnl
         ISiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=RqIvIseiTRoX1di59PxONSturiOBM06tK0fbvlZMleo=;
        b=uTFb9BLTiwJ9woltRM/nJmcYR8e7qlykUqQm7YlR6d1VUKufzJkVJUkEl8Cfs2akWu
         cO12xoR/uYhMdR2amkZ2WDy1x/UnKN440F8DEBmDtX5vGMt3jJkziieRSX2vAtgGTHHF
         7MOxnVwPYI6VWwCm9Ch8mB8ZuGddTxW81P8bl1jrYyvs1YUJxNsN+9h8Y5aC+hs1u/gT
         dnp4QroB1KSXVFiFzUho0T72zZ+O0WmG7ZdG9W4OSDOX0bniHh+GnN557GkGpj8LP8Ui
         uSFuICMEJmFtMV4k4RJ4z20Jo3V9+/79P2pyxdsMghcwMvsJ1dKOiDoKlZBC0TVyRjdH
         xpeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oc23si3519314ejb.369.2019.07.11.10.40.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld3j-0002Ad-N9
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38039)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld3Y-0001ce-Ko
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:40:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld3V-0004FE-K8
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:40:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40116)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld3V-0004CK-Eh; Thu, 11 Jul 2019 13:40:29 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A17033001822;
 Thu, 11 Jul 2019 17:40:26 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 986296092E;
 Thu, 11 Jul 2019 17:40:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:10 +0200
Message-Id: <20190711173933.31203-7-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 11 Jul 2019 17:40:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 06/29] update-linux-headers: Import iommu.h
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qHYVff4yDIlw

Update the script to import the new iommu.h uapi header.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 scripts/update-linux-headers.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-heade=
rs.sh
index f76d77363b..dfdfdfddcf 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -141,7 +141,7 @@ done
=20
 rm -rf "$output/linux-headers/linux"
 mkdir -p "$output/linux-headers/linux"
-for header in kvm.h vfio.h vfio_ccw.h vhost.h \
+for header in kvm.h vfio.h vfio_ccw.h vhost.h iommu.h \
               psci.h psp-sev.h userfaultfd.h mman.h; do
     cp "$tmpdir/include/linux/$header" "$output/linux-headers/linux"
 done
--=20
2.20.1

