Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp981334wrv;
        Thu, 11 Jul 2019 10:34:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqye9iMyiEPbMiFAgDk+X9pinz7RwQguL6Bhbb59FSyWt6oBXz3+S2km1+w1SX7uCop0ywO5
X-Received: by 2002:aa7:c554:: with SMTP id s20mr4659764edr.209.1562866470449;
        Thu, 11 Jul 2019 10:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866470; cv=none;
        d=google.com; s=arc-20160816;
        b=VoFFsnlsd4MCecxz3nj6Y7CQNKWN4Y05Jv5+6OLaV6LisiMLfGvLoaTq3+I3WadoOR
         84aqLiE9Y80Dj3Ke5cLsM15lv6YH3/V1itcGPuWsO8OQQmijAF9E6J64ZRsCg4qDfES/
         kigtckmaKcUUvbPqcBMjNJyUQ4wYsC2Jc4v8EJOzDywM3p1eWQ84waMdPJnCE5s/3LL+
         xCeYvAkPMNbF+Yd10463mCpGB7EfYRoOkfU6HuRL2ayRvZn9N00QGQVF8lpgStMuErw1
         h0c/JjAXomhtADSAEdPMle4M0el6lpuBSeOqK4NF4xCMvh88HnefShuijNAuKLXED0kA
         CeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=uKP0DkX0/urcV3t039mG7/YsrR5qsQhDraEB0XbrRCw=;
        b=S5SDaPOUlcwOjbMF1h4E90X3pGKGx7KXbVVns3WOFAUBLECl/cAwBI9BiEueVZCj2B
         7i2ocjDxsmbmbxrASDplQzoKCau2zMQGvUZy8KolruFAGDzLuLwCslppPim+l16Mkq7A
         r08oDR2+8hyqXjSC42U0Z22Sginn+zQWJGXgGkbk0MnLZoZwaaZCdI6iee12foc1e31X
         0XTDA1oc7RAldb+kiE0K75w8kDEdn9Lil6LBRO7K9QuEhcoDVKtL+9DV91Ada5sCdMZS
         yuWZN3YzyAJYzcZFDx1yy9HfF7CJid1+LUgHjQNL7wtn2KoAAfxOZKHCjN4kVfzjR3Fy
         lvMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si4057479eda.278.2019.07.11.10.34.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlcxh-00053i-2q
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:34:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35038)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlcvV-000633-3N
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:32:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlcvU-0004ZB-4I
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:32:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47184)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlcvT-0004XO-Uz; Thu, 11 Jul 2019 13:32:12 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 39C383086268;
 Thu, 11 Jul 2019 17:32:10 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17B4D5C1B4;
 Thu, 11 Jul 2019 17:32:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:40 +0200
Message-Id: <20190711172845.31035-25-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 11 Jul 2019 17:32:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 24/29] hw/arm/smmuv3: Store the PASID table GPA
 in the translation config
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
X-TUID: urc9di0CRwq6

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
index 9372b15b34..f7497de9e4 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -354,6 +354,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *c=
fg,
                       "SMMUv3 S1 stalling fault model not allowed yet\n"=
);
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

