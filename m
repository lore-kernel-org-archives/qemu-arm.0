Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp977891wrv;
        Thu, 11 Jul 2019 10:30:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyX9bal6taoQCrHsxOxmNSrkqOxo71eVqL9frPA9w21w/JTHx51X4ycQ5++sWgxYL151dn6
X-Received: by 2002:a50:b13b:: with SMTP id k56mr4934522edd.192.1562866246735;
        Thu, 11 Jul 2019 10:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866246; cv=none;
        d=google.com; s=arc-20160816;
        b=i8hnVAGADHV5h17R9HBDvyazZGz+LOPWuNXtlMp5pdb5SgBfFNFxE4cExkLrVtk/F4
         Ecw2cUzH96gx5VrABUzMujRXof4xiZDCR6prn8Cu2l9knZ1yLtp1fr2J1zadbq9DnXvz
         efxzePStvAnA2fnsgp9mUj6Fz+EJnKkb57e3u9+PToDAUsWsPI34kCQrVbfP6ur5DNry
         bCu2UD6x2ymTGdoUHkV2tV+t0DdY3R1BGa/I7BznYgfIbu3htv4J6BBDEyCy8gyRsxez
         b4RTPXJ3aWzMtCKLlyDSYInteDOA4IsZRz+utgRE5ajfsyLbvVjBB5fg7dyHtguUukqj
         fmXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=RqIvIseiTRoX1di59PxONSturiOBM06tK0fbvlZMleo=;
        b=NlOmpZG3JItjOFz137Gl8RGnaTYzDcn2G6lDqMvp6o0xqOXmqdpnCnLaTW7o5g0dC2
         KMTiqSBabcegEygkoDOxg2uvgxntMJ69ZahtWrWMLidNm2+U+eLB3eoUfyC4gmT8aaRV
         xdi1K5yqx2ZEkqKm399jsgWRvPnEGbsT5gPgX5+ma6PxQFDR1gbVZ99iPS6GEHTX1E1u
         aKoD5p7slmQBEc30jc71ke1vG7N6q2kZAe0DkjyPK+yxw+LjhiZBMh0ps/G+vDnzV6XZ
         yqKNghoKeezXUC1FZ4e250qQGWgXiSSR+A0qDidnM0N2jpB1Y1lK68D0w8RFdc4aanLO
         cXvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15si3591581ejz.273.2019.07.11.10.30.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:30:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlcu5-0000dA-78
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33995)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlctA-0005g5-7n
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:29:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlct9-00028k-4x
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:29:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43984)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlct7-00025Z-1A; Thu, 11 Jul 2019 13:29:45 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4155D3082133;
 Thu, 11 Jul 2019 17:29:44 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 183905C1B4;
 Thu, 11 Jul 2019 17:29:31 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:22 +0200
Message-Id: <20190711172845.31035-7-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 11 Jul 2019 17:29:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 06/29] update-linux-headers: Import iommu.h
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c5HzYK5jqSOm

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

