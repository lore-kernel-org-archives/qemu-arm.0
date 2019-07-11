Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp980818wrv;
        Thu, 11 Jul 2019 10:34:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8pl3GC0ss90FKLj38Br0HhlBa6SNQJff663BCGTx6WgatNlra3VVOoFASzXYQVqFtBhd8
X-Received: by 2002:a17:906:1594:: with SMTP id k20mr4306892ejd.49.1562866440182;
        Thu, 11 Jul 2019 10:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866440; cv=none;
        d=google.com; s=arc-20160816;
        b=ge4jFvIxgspcP7jSUDrpcEOr6xmDBCyEZ0e5M6ENFKv1AUuEpGJaFi22x5C1KhKGv4
         pi8m7uyidJjcZVMnAn5tmS9biVQ3LKwaURo8zjdwlpWfra8HnYxt8pNPL1sufXaqUuK+
         YBgo+Plex0GVCx6dV4CWrki9Qp7G9G3LKY+NWXCcEO8aLhOoKRZZTgw3TmH0nJjiapXa
         9qObNzf9wwS9Z0KKf2+ZSrZokKsmCnqPQDJaJRbA2NREqV/3vcutTG8i1+0en1EXsAX+
         D8DwmnaZdElvlZXIURGNSwkEXnzFx90IiqAIJwttEBokl4or/PlrirK+XDzRfuyQQoB3
         78Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=wBPzzBn9TdLnefRIHR4ofUqDXXgleC0fbJl17ncnuNk=;
        b=PEAcGtF0ZMr4Qhf0TkTYlr+ZFPFmlUCfar+JlAM0FwGo75iCycB4DKG8pdyFie8sgX
         Oc2SZxl2EaocfbeQjlGpeG6aGyh0SlQ8jk9c30Hl4xeJvjs59ZH8iMp9yi84kqUUs2jG
         /jILoOVRbfrgszXjHcitVIVmGrvz8me0FTP/XRloaJyC2cjkzHMthOVP0AxPJ+RE2Q79
         t1ixMRIHlg7SovDEo8gTef/ihnw5n9XutgZYGA70QjZOugaTiOe9B/Tztzry1eOCoaKF
         btbJEdaCLESv5VJik3a1FSKnhO1kVidpmW7BvreqGpDpaiPncJMhsdKErRKBFjJPwWZ9
         pkGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x58si4004887eda.238.2019.07.11.10.34.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:34:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlcxB-00035r-Qi
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34994)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlcvM-0005Zr-UT
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:32:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlcvK-0004Nu-Mj
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:32:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34276)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlcvK-0004Le-FT; Thu, 11 Jul 2019 13:32:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B3FAC307D857;
 Thu, 11 Jul 2019 17:32:00 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E9BF5C1B4;
 Thu, 11 Jul 2019 17:31:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:39 +0200
Message-Id: <20190711172845.31035-24-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 11 Jul 2019 17:32:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 23/29] hw/arm/smmuv3: Advertise MSI_TRANSLATE
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
X-TUID: SDEkRbNGsVOJ

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

