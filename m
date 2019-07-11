Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp990309wrv;
        Thu, 11 Jul 2019 10:44:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzcZ5YH/GB4LnjrbojccPhf4cv7WGkX9SUqQmJJOA+/5tTg3jO0M/ti34+GyLERRWFcJUGT
X-Received: by 2002:a17:907:217c:: with SMTP id rl28mr4328054ejb.131.1562867059655;
        Thu, 11 Jul 2019 10:44:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562867059; cv=none;
        d=google.com; s=arc-20160816;
        b=rdMoSqDAvsReXXLHxEueas1f3XaITtiwDglU/B6y0NwQSPMcMP8iBuRKBBN6iVpEJ+
         riQpbKSfY2nvGagjnthInNd3sRR/+hKYfEurOXHJCVyUbN992D1O6D5AVjOFTGJiHNBn
         bGOLp8iTMQYRntLS9HrALyfjy28wnwNhKELAjg/3fWRI69YQ0uF6j2OFrIju8VzGfHQo
         7s+ueucnWCnRI1FQz/T8s3JLtr4sTSdjqjQNe81J/PODVd4p69fVlCbBI3y1sQ8MDeZM
         eGA3lnMrhFT3TOXln1euB7yxJt/Woez6K+krurZJowwcYBDEc+MddEwQ3y45hfVyO1p8
         Nt+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=wBPzzBn9TdLnefRIHR4ofUqDXXgleC0fbJl17ncnuNk=;
        b=gXc2U0nMsDyKcNclPiga+FZ0Cg5YCg4E/QO8SKzBCiO/RJ3pzfWsNkt/u7+8O4ZlHj
         e8/U17wJkj035oUCX/RGco7Og1/RTWnhfSkaW+/VUExY5JObzPuFa63TDUqiJSmLArHl
         tU6fNK5jYZwzZVto7EFFUe+l4voT9xLyrhDUAviGpFDLMWfNyyPdQp3XzEdCZZwfbrO4
         q3uuFEe/YS95VULP87opq5Ze3SmBOoC6zIx2lKE6VrGiu47eyHOjfyIygZegLyeY0REX
         ro5JrBO3WQxgaedGyahufIK7NbAXdRsdC/MDAWwu/sUxhna3ZTOwMVe610Z6241/JtJT
         oO2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si3923778edq.280.2019.07.11.10.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:44:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld7A-0000r3-UZ
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39102)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld5Y-0002Dt-U6
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:42:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld5X-0006F2-IB
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:42:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42376)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld5X-00062Z-Ca; Thu, 11 Jul 2019 13:42:35 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C11E0C049598;
 Thu, 11 Jul 2019 17:42:17 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D27060600;
 Thu, 11 Jul 2019 17:42:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:27 +0200
Message-Id: <20190711173933.31203-24-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 11 Jul 2019 17:42:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 23/29] hw/arm/smmuv3: Advertise MSI_TRANSLATE
 attribute
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
X-TUID: 3rwCZNnrQ/v/

The SMMUv3 has the peculiarity to translate MSI
transactionss. let's advertise the corresponding
attribute.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/arm/smmuv3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 517755aed5..9372b15b34 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1499,6 +1499,9 @@ static int smmuv3_get_attr(IOMMUMemoryRegion *iommu=
,
     if (attr =3D=3D IOMMU_ATTR_VFIO_NESTED) {
         *(bool *) data =3D true;
         return 0;
+    } else if (attr =3D=3D IOMMU_ATTR_MSI_TRANSLATE) {
+        *(bool *) data =3D true;
+        return 0;
     }
     return -EINVAL;
 }
--=20
2.20.1

