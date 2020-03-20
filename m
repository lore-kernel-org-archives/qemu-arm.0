Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1135205lfe;
        Fri, 20 Mar 2020 10:08:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsRxulfhvDt8T6UijvbV+mlRnNyuwgAEbEQitKA971GZPA+fYdYo8qUxn5z0Bm1wK6LEruR
X-Received: by 2002:a37:6411:: with SMTP id y17mr9273333qkb.437.1584724085011;
        Fri, 20 Mar 2020 10:08:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584724085; cv=none;
        d=google.com; s=arc-20160816;
        b=u8bLkbtyjUXTkqmC6ZKf5/GrRUtx58prNkflflxTZ6ZcDwc58heQ+BCN/qtq0B/Jf9
         BsAc9e6woZZbfWnpAPh3JHPUuOqi3L2vk8CdNFK9aUAkfjMi491kDmN236LODQZ4qK9y
         Ojd/Zk/uVKRcwbARslr8LE3ig7ZMAi2+5QO7v/mBBKI14bo8tTGfqupuHZacAFt894Dj
         APChP4XoaUGrMGraecxxy9cz6F69rNLvwdyyJARzJZuTVdU/yQPAxYOra3fovdywNhLV
         5+jA6qsRhEh24Znn2d61CIuKFUlwgpPuLaUS/9TDRBMV0YAJ5uzGW6RpNcaDYb+THheP
         GRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YmFSnib+FjkPCrscOHoOF5A+tu0auycxAFNS4zSjJWQ=;
        b=rL7fTMygFrezuK1HnASi0i1fxe9Yhv4Q/ScoJZUL0cqVjbu4/2jEP/kbUmaZVYoabR
         iEd725ztw0jVSB4ewGTIS31o+jiSL/uOMvI8M21hzl+Ju11k28m47kgJnC3NJ7z1rVsP
         BkuBheK7zRMoq+cxaZGxk4lnTXFp0Zgrat6KHrUX3bHyFAqGmb6w7TX+4HVF9ljpYKdM
         vjUQHYkkHweXsQN2DPlK7atJo7cbPZH0tX+zxqpLdsdzhClRGkXIte0jJUh/Uug1vbVI
         J/IbNqeapBBR8qU/R0KIkMl1k/O6EysV20LriyTgZvuMz1DZWvu6csFU7GpfTLicXby6
         9U1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HoDZCmb9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21si3854287qkl.339.2020.03.20.10.08.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 10:08:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HoDZCmb9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFL7s-0000jp-6u
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 13:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jFL3I-0000ga-EX
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:03:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jFL3H-00008B-85
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:03:20 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:22321)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jFL3H-00007Z-4Q
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584723798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YmFSnib+FjkPCrscOHoOF5A+tu0auycxAFNS4zSjJWQ=;
 b=HoDZCmb9rVXP3Bg/IFwpAGPxlO+gR9v8wFHouhwIYm3athgPspV23swtXPQ4Vi9e0n3dDO
 C/EZTSlzx7lSjIiWUk4BfzTAmWr44bDj9P4b5adH2OPoCze3QOOnpkOBF6DB3sKORquc/O
 YfONidNMuYndagwXMqB1Y8YrA7IF+yw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-Kb6Prs8LOLGzbUhZ81gFpg-1; Fri, 20 Mar 2020 13:03:12 -0400
X-MC-Unique: Kb6Prs8LOLGzbUhZ81gFpg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CD1B107ACCA;
 Fri, 20 Mar 2020 17:03:10 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9EA716D22;
 Fri, 20 Mar 2020 17:02:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v6 19/24] hw/arm/smmuv3: Store the PASID table GPA in the
 translation config
Date: Fri, 20 Mar 2020 17:58:35 +0100
Message-Id: <20200320165840.30057-20-eric.auger@redhat.com>
In-Reply-To: <20200320165840.30057-1-eric.auger@redhat.com>
References: <20200320165840.30057-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
X-TUID: +6AcDwtNREvr

For VFIO integration we will need to pass the Context Descriptor (CD)
table GPA to the host. The CD table is also referred to as the PASID
table. Its GPA corresponds to the s1ctrptr field of the Stream Table
Entry. So let's decode and store it in the configuration structure.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c              | 1 +
 include/hw/arm/smmu-common.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 9bea5f65ae..1424e08c31 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -352,6 +352,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg=
,
                       "SMMUv3 S1 stalling fault model not allowed yet\n");
         goto bad_ste;
     }
+    cfg->s1ctxptr =3D STE_CTXPTR(ste);
     return 0;
=20
 bad_ste:
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 1f37844e5c..353668f4ea 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -68,6 +68,7 @@ typedef struct SMMUTransCfg {
     uint8_t tbi;               /* Top Byte Ignore */
     uint16_t asid;
     SMMUTransTableInfo tt[2];
+    dma_addr_t s1ctxptr;
     uint32_t iotlb_hits;       /* counts IOTLB hits for this asid */
     uint32_t iotlb_misses;     /* counts IOTLB misses for this asid */
 } SMMUTransCfg;
--=20
2.20.1

