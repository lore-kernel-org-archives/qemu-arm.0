Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp365041wrx;
        Fri, 12 Apr 2019 03:09:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzsXvABbPJ38Cbws2rYt6QrNqfSNZKJlxy4uIAqhf6GVZgTp3vkrFzI65jEFgftPklEYhg2
X-Received: by 2002:a1c:f909:: with SMTP id x9mr10927430wmh.18.1555063778281;
        Fri, 12 Apr 2019 03:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555063778; cv=none;
        d=google.com; s=arc-20160816;
        b=jeww3WJ9Ztvny6JQO9M2XVQUpoDhXRC02pYIaCR3z9j2XAzU2Uuj9ZKk95EleGWfwk
         2T5w8KKT1XHHPFwHC9KRqhffY/uUkbiqgcWiivsPmXP8HpjeS4DfkGU8SHunLKzhpxxK
         fCW/a64hKaHn4/ykvp0lERRstx81dVYg+Qo37DFCBDY0ejJcriQpq3m7GMBgZWAynKcj
         3SMd6T+k0gTRJXR8D5YFF+o96YPis33461h5fLjQB3O5GIk8UcueUzpH4tTPbxNPqzbB
         E4WsgPynPfHuXrKWNurWINQynQ1McwlPskeg8wdvxGHZ9j35V/f0qH9s8R3QrECYK4Uu
         l0YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=0n/W8JC+d+76ETKSGyvplQlCiMuFcKsz/yKEzZHh3Tc=;
        b=ecMEygeCO+qZ6TkMxXnWxPBK25tOMU/4WO/OEmdpr15Uwe3VzEeU5gLtWIzSpVUap0
         Pk1/gGeTYxCmepM13cBNkbqqvHC/9KcNzGDviLZBxZNVGpRWQEMErjGe1k3Z+HvIKBsM
         QatOX2m5qMzabtscli0Ka67jfi2QbLqDi/aiQG8L/k7zveaLgnVZaRSBpQkheRjceEyc
         BSXyHbGYb21FY6M62dGHKkZXzF76wLM9iuClAtZqUqrz/YFRGLxVetMHB3ZER4JVCfuS
         m7PD4BROiLicLwv/DwZlenxbwYbedolXiebRyR6Of1CC5ZZNslJnDpdh7G1sSoPF6/cP
         LSDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si26724454wrv.1.2019.04.12.03.09.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:09:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEt7p-0005Vb-A0
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:09:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt3m-0001ZS-L9
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:05:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt3l-0004JM-0e
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:05:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32879)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hEt3k-0004H6-ME; Fri, 12 Apr 2019 06:05:24 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E242753EB;
	Fri, 12 Apr 2019 10:05:21 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-161.ams2.redhat.com [10.36.117.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8F0919C65;
	Fri, 12 Apr 2019 10:05:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 12 Apr 2019 12:03:39 +0200
Message-Id: <20190412100354.6409-13-eric.auger@redhat.com>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
References: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 12 Apr 2019 10:05:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 12/27] hw/arm/smmuv3: Store the PASID table GPA
 in the translation config
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
Cc: yi.l.liu@intel.com, mst@redhat.com, jean-philippe.brucker@arm.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VmBxd76whAiZ

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
index 2c7fbf4202..a1020b638c 100644
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

