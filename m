Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2860419wrd;
        Fri, 21 Sep 2018 01:29:19 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYrXKt1/Zq1I+VecNzacJFDLkSp7Ot/RnmE5jmxi02TVC5P7YUbK0rITk8ybefHH4LKGP4l
X-Received: by 2002:a0c:eb8d:: with SMTP id x13-v6mr30488142qvo.200.1537518559508;
        Fri, 21 Sep 2018 01:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537518559; cv=none;
        d=google.com; s=arc-20160816;
        b=ZzaCyaHpUmK8t1fbIfZlH7bxqr/M1jN9msuf3p44AbLTOHX8ZXtJ6h/FUrdfcZgdQj
         TgLZgq0rRMJZl548ompXHVVbsRi8AdzjQWFty7w2SaBkTEk4N78PIH9RdMGCFN2k3HCQ
         9Dv7x0+A2SpVNHzW8boDCDSqXHfO/W6lE5uVDFm51yaCE6pfZZ9yO0TGnbJtDXiibX1p
         nrJRHVbZ3cmQK1msJgCopO+TKpZijJkv8f2oSZM+zedBHH2rl5O4qFbAGCLwZ6NZQj5J
         mHc3dx9eI7KFG79/vBKQkEBGt0CP4i+N8Kj5BhgBVOKWUniQKMERLcjtJag/J4glaXll
         pgyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=DtU33FQmzNXXZI/D4onfuqyIMGjYwjAT41jCjLLdhzA=;
        b=FuTFo0U40153hNrjDWIuUHuCDrn6xxXusLRTpILb0+uDWNpBvEXXdIuBtdkrqYEdZM
         eKQoQqTNNihH0YH9JgwvmER+8WVb8r/TNNfuXJnbezUQqiHNikLTJijouOOC3gYGZDki
         /RqT1jL7TX44vPlsu3P/iKe/Mt/3mmi93GVPFQeua1XnZmlA+i2L/rjcW2SNq92gxBYp
         OIElV26glpYaAph2oZMXDpbAzShqTc/e2U/g0KZbQKxK/4EIx9OnyYEam+N1YsFY1jnq
         HMmyYsR5HafQNR1fXah4wale88JRIXW0byLt6SHiqAOYNC/vXKbLk2ZvGp57yv0NTrzT
         gc6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n53-v6si242944qtn.184.2018.09.21.01.29.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3GoQ-0005MD-Qw
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:29:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gfp-0004pu-UA
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:20:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Gfm-0004pz-T5
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:20:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40502)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Gfl-0004Vb-Nt; Fri, 21 Sep 2018 04:20:22 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9B753082B03;
	Fri, 21 Sep 2018 08:20:11 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 902E97D665;
	Fri, 21 Sep 2018 08:20:09 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:04 +0200
Message-Id: <20180921081819.9203-14-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 21 Sep 2018 08:20:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 13/28] hw/arm/smmuv3: Store s1ctrptr in
 translation config data
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
Cc: yi.l.liu@intel.com, cdall@kernel.org, mst@redhat.com,
	jean-philippe.brucker@arm.com, peterx@redhat.com,
	alex.williamson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: quNX+66Z8Gxz

For VFIO integration we will need to pass the
context descriptor table GPA to the host. So let's
decode and store it.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c              | 1 +
 include/hw/arm/smmu-common.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index b8c41916aa..afe1758830 100644
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

