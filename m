Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1138033lfe;
        Fri, 20 Mar 2020 10:10:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vskVrIdQCnwdfw7kcur0LU34LctPIR3txoaIARBZXvEmb/Ju/c0nOdppdAyyvWqBhU2umYL
X-Received: by 2002:a37:4d56:: with SMTP id a83mr9495421qkb.40.1584724238132;
        Fri, 20 Mar 2020 10:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584724238; cv=none;
        d=google.com; s=arc-20160816;
        b=f8QlTAmMCANOiKYBkS7vliXeVP9SGqmS3L69VqSxCunJTmsUetyAGR0Q8hBg4nMw18
         xqiBI5iP3ZOwitefp2jAOs9nPvoCx9EZot7cFt7DtibdaNL5M+bi6l+gGyJD1Q9eoi8w
         63GJYfWZZzXYbqTEv+kJsk6CVVtewJttwymtz1ol4zhd3L3YhaibMIhgYTNnR9Ft1wqq
         RjwyajUpkQgCHXlNC58kfQEKtvsvtnZyefluYcRP8rKBpvgKM6EQt2YBne9F1hrc/Kk6
         AiIDmM+SbIdUTSjsXu8c7iv3I5cd8TbxhrK7oZwyHYJ7/UpeRna76exl9sHWfPdCrktF
         2c5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=psjz1JkEPDzbgw40zVxga+1pFGlV/HqwjFnEQXSpxHQ=;
        b=nuHMyuKcCYPbB670WqjSc6EsfEtvpXYI0RUbb259u3AL4kSSFSG4aJZb82soDCJ0Bv
         Taw8MDWges1DSX1IhZX1vw8osibD/kAe6SYGrACr9/d8PBkvPoPylpzRSCHzwOLWOUSg
         Qq5L7T1rhq65WTt1MHSEj9pODW1YaogtHSuFhcxZbhhGk2wH1I6omi/hZ1zKc7bNPt9S
         bdjTtzpzdHhkfh6+gQ8Od8ZTDrwK9dd7WnoK+D6OBEnXql/DvXfsu9hBUnlNUdMvk6kv
         BOfKxVAH2rlhaW4ertwGZegWtlUSdEA7t9VWqSU9dEaFH90TydRVtXqYbW5XOZgy+w6e
         OQjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DEuMWubp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3si3895805qtj.141.2020.03.20.10.10.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 10:10:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DEuMWubp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFLAL-00040n-Io
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 13:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55809)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jFL3v-0001jp-Oh
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:04:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jFL3u-0000xy-PA
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:03:59 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:56077)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jFL3u-0000x8-KW
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584723838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=psjz1JkEPDzbgw40zVxga+1pFGlV/HqwjFnEQXSpxHQ=;
 b=DEuMWubpEVIIMDz3ZrftdeJz2aAJG4c9wFCWxpg1b0SOtFND/07sW45lhTVSwyVO4qmeQu
 gMZFQw/90pexrqLYUhiqvlcMeJUsunSOnyDNuKZC1yjyMs5HOK+R63vfr4SsdFVo8eroF9
 U4956TPhxh4/yDnh7pF1J6vxTUp+skg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-v2rx7beiPNGatQrQDJvcJg-1; Fri, 20 Mar 2020 13:03:57 -0400
X-MC-Unique: v2rx7beiPNGatQrQDJvcJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AB90DB60;
 Fri, 20 Mar 2020 17:03:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 954F319757;
 Fri, 20 Mar 2020 17:03:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v6 24/24] hw/arm/smmuv3: Allow MAP notifiers
Date: Fri, 20 Mar 2020 17:58:40 +0100
Message-Id: <20200320165840.30057-25-eric.auger@redhat.com>
In-Reply-To: <20200320165840.30057-1-eric.auger@redhat.com>
References: <20200320165840.30057-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, zhangfei.gao@linaro.org,
 bbhushan2@marvell.com, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 08XvqM3FW5Sa

We now have all bricks to support nested paging. This
uses MAP notifiers to map the MSIs. So let's allow MAP
notifiers to be registered.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 6db3d2f218..dc716d7d59 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1537,14 +1537,6 @@ static int smmuv3_notify_flag_changed(IOMMUMemoryReg=
ion *iommu,
     SMMUv3State *s3 =3D sdev->smmu;
     SMMUState *s =3D &(s3->smmu_state);
=20
-    if (new & IOMMU_NOTIFIER_MAP) {
-        error_setg(errp,
-                   "device %02x.%02x.%x requires iommu MAP notifier which =
is "
-                   "not currently supported", pci_bus_num(sdev->bus),
-                   PCI_SLOT(sdev->devfn), PCI_FUNC(sdev->devfn));
-        return -EINVAL;
-    }
-
     if (old =3D=3D IOMMU_NOTIFIER_NONE) {
         trace_smmuv3_notify_flag_add(iommu->parent_obj.name);
         QLIST_INSERT_HEAD(&s->devices_with_notifiers, sdev, next);
--=20
2.20.1

