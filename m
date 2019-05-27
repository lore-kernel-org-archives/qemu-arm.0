Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6314394wrg;
        Mon, 27 May 2019 04:51:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrEvG75XsobLC2fTiSlP3Yp2ue3pYziK0Q8X2/ro2NJtkQfHSKsW4cHWKpsT6PCmeNZI4I
X-Received: by 2002:a05:620a:408:: with SMTP id 8mr77494549qkp.239.1558957882681;
        Mon, 27 May 2019 04:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558957882; cv=none;
        d=google.com; s=arc-20160816;
        b=jrVyR8yEkWQDiiz01m364iZm4Xh7OuZfU2hgDWz76mE9XEQU75ctKh9661C3H0+pPj
         1Ha2x0N7y+3sGTSjueuvWAqhAygbfU/qaxtE+Fw6xRtPuTD2yzhX4e+AESTfm9w7rTH9
         lE626RsfhfxP0e1gvu4b2ZVA+NCLuKlxIbbG9UuvKOj8f/U/Vtc9WcNuyoRGcRQzBpNZ
         hah985W9lC3gL/Ip8kCXE4BGk6G/j8onMmOb4EPKlH3ZjajTq8bLSxn3OFs5EA7jmwYV
         rTa5vyvFCXadj29JrBZtTVl+qfgbEIs2g/vvlFp6i2iKES3gXbOgiVjeGd8sd6ZvUmeD
         GmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=fb7woOEw/+XbzdXlrQ9X//u1FuwIHKFrLzlIw139THg=;
        b=yHNE4ab1ROVF5rSiWd/b8KbAcH+uE1O0L8xtAEdW+tE6s7Xb5NvcSUGIGxAakJ7yk+
         Ez1MrCGI5vDtc2MSfFzl45ZNqx4PqsolI8sWJL6pI0AemDyZuGafUr8kseTyLl97u9rP
         cZaB7iY1y336zbvQSeFfiGWEvDicimbmONSJvNYhC3hfnZ+JER6rle3ILCGdKdaLkn4o
         ozQi/8qCGKlOBHWj12mf+bjukXV/1G9m5qt64PbHn/N1+Ym4r8TZvj4cejkcYb33yAMx
         rRm+PJiySy0HFPffaUXDoE788lC56ZYc67Y2Pg6B8Ee5jXjneJUpTyl5QyTu22gjdGad
         z1TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v46si2666305qvj.25.2019.05.27.04.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 04:51:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44134 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVE9y-0000ZT-6J
	for alex.bennee@linaro.org; Mon, 27 May 2019 07:51:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE2h-0003oU-I2
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:43:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE2g-0003t7-O9
	for qemu-devel@nongnu.org; Mon, 27 May 2019 07:43:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37956)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE2e-0003rV-Jn; Mon, 27 May 2019 07:43:48 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D5ADA3092650;
	Mon, 27 May 2019 11:43:47 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E61045D962;
	Mon, 27 May 2019 11:43:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:48 +0200
Message-Id: <20190527114203.2762-13-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 27 May 2019 11:43:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 12/27] hw/arm/smmuv3: Store the PASID table
 GPA in the translation config
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WO0qHyXJM+Fl

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
index 1744874e72..96d4147533 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -351,6 +351,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *c=
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

