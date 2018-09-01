Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp622446wrd;
        Sat, 1 Sep 2018 07:29:42 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZs/4nhCmuLWvJbTwFpRnXEkx+NtvTqsxixObbYMv1UWVauWJE9bpTjAhHVj+JOxzxO3Fkz
X-Received: by 2002:ac8:2ece:: with SMTP id i14-v6mr19421859qta.124.1535812182543;
        Sat, 01 Sep 2018 07:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535812182; cv=none;
        d=google.com; s=arc-20160816;
        b=km1lfKZwv6O7ICdFFD/Ciuiui8eIHgf5nJLna6T+ZQjp2lKQOb7Bw1+A/PF8QT2CTf
         3EE61vJXdJGxZHrCTSc6ifGzlxPxnif2hlXR3grQs1m0njin2A+/ig4eSUasB6UefAad
         PZI2tB6tGvbw+Gfcw8elBCwRvs/9k8xEK/xjPTGRwUMiyHcM/zUxBiTCdruqjnkxRV13
         aFa85QEU3rOEop9rWGMSdhKZlyAIqVlNWJTnYBmiNuIfwnJyBoudaGrXXfdHLfFmRbpQ
         AfxqErf3ovSGMHvHHcaGfns5qB3XfrGARiENovvwpSOyuxMWcOEo4VvtrOm/dsiq4Ezw
         GwPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=6t0IhAu/brDOL9JuRsfO5FBsQbSczjGPye0Yj3TGBg8=;
        b=tnkpCLrgm+RGu+avuG3a4kUcFlmY9A5QFiLIgpEN1jEjQThVmvr7EQzojQaGbarsqG
         LqMzO9VyL/Nokgxu8XTiSSu+DNlv9A0u7k4PRRCD9HIH8yFDa3cjZfV7D7NzIaIfbWJS
         Pb2ue4gzA1hUFfXcULklUlD7Ls2GAc2HLrNQidu4CB7dItdNF/ibueBkoysmDRU9acZM
         oW1MLVi7DOQKZMNljr1qspyHqNefHc+Uz/gpzsbRo4fDXlynw+5MNla4tyyHELT2kmil
         z/cq0kRrLSROAibiOqYjdunZ4KTDHfjMosYLIrF/W7sV1cks9/DqB4TZ8hxeJAfWB9X8
         cbng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y14-v6si1796320qvp.136.2018.09.01.07.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Sep 2018 07:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fw6uD-0001Ax-Tp
	for alex.bennee@linaro.org; Sat, 01 Sep 2018 10:29:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6qM-0006PL-SE
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:25:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fw6oq-0005mK-38
	for qemu-devel@nongnu.org; Sat, 01 Sep 2018 10:24:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53272 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fw6om-0005jX-Mv; Sat, 01 Sep 2018 10:24:04 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5412E5BCD7;
	Sat,  1 Sep 2018 14:24:04 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-157.ams2.redhat.com [10.36.116.157])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 794672166B41;
	Sat,  1 Sep 2018 14:24:02 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sat,  1 Sep 2018 16:23:03 +0200
Message-Id: <20180901142312.11662-12-eric.auger@redhat.com>
In-Reply-To: <20180901142312.11662-1-eric.auger@redhat.com>
References: <20180901142312.11662-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Sat, 01 Sep 2018 14:24:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Sat, 01 Sep 2018 14:24:04 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [RFC 11/20] hw/arm/smmuv3: Store s1ctrptr in
 translation config data
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TKc+ObBmapv/

For VFIO integration we will need to pass the
context descriptor table GPA to the host. So let's
decode and store it.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c              | 1 +
 include/hw/arm/smmu-common.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index c4bd368355..5f787bf455 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -351,6 +351,7 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
                       "SMMUv3 S1 stalling fault model not allowed yet\n");
         goto bad_ste;
     }
+    cfg->s1ctxptr = STE_CTXPTR(ste);
     return 0;
 
 bad_ste:
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index b07cadd0ef..52073a23b4 100644
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
-- 
2.17.1

