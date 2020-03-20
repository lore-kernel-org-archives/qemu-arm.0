Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1129825lfe;
        Fri, 20 Mar 2020 10:03:30 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv46pmyiT7pJ70kHxhuxumWRw0fEQ3IMxpMKx2FCGLW0bH7wz2sfLqQqJiHrF9eaD4p7BIL
X-Received: by 2002:ac8:348f:: with SMTP id w15mr9504678qtb.219.1584723809917;
        Fri, 20 Mar 2020 10:03:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584723809; cv=none;
        d=google.com; s=arc-20160816;
        b=j9NucgjypNp7E6gBzWmiBOuSiHraksdx73EH/m4qWNL74eIl/c37R/wdDZhGzt5Qf1
         Bld86CcUCbsXuopRIk22agn28gHIOmt3kaxfTNN3g11AMbwWyg0hwW3GOMqHC/REK9fp
         CxuCVFzjwYcP3LEizmeZkineLi/mJqUrTICZ3g+QpYaNN82aBlTIV0iEx4d6sy9yUcyp
         A6Je5S94jLec1g/V50jBhvVy6EScAzd8F8hTNdlNjdfpiXy3b6jO+WTh7Ix/84F5zf0c
         CoHNw5cOsFKFMh2rdl/ZdIb6Fd0Of6w36rB2nzf+7UashmgP57HWEQ0e2rrx7noJVoaw
         z/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ggBCH4KbYoRRY5++PE97RwvQs2b7za6HcsagnGf9BLc=;
        b=cC27Ei0k1V9Q9e4qHOhez6QTWfqcvgkoNyIEbC0CAnju9FxeqztmEzL0KReM3hMpp6
         vneEmT9HEP6le21DB5/TcTwuO5XfFYbJJtrpYNAYxyZqM14vozPACA6jQ3ob1p9Vwgh/
         KBiNQaVhKTk77lwE817PKV6q9YpAbVvHU9DrKEiS9VMc+Ap2XWoGxMv0fQp0s7GYRyGL
         5H0If7/bR8L0GZBhv4WlZSVn0MWVzT/O10ZfFZfFMIGDRNsyBWEaAqwP2TWY5ajovYrF
         ZhkDn2Jp9U755P7n0omiyjxaEEVA5QgWz8uCb3ztd9oZBoIrzuhRrwAStnVYXoni8B2H
         x/RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EhIXRR5e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si1680446qvb.47.2020.03.20.10.03.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 10:03:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EhIXRR5e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFL3R-0008KJ-5g
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 13:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jFL0C-000444-Ma
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 13:00:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jFL0B-0004iS-CS
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 13:00:08 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:28736)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jFL0B-0004i5-92
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 13:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584723607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ggBCH4KbYoRRY5++PE97RwvQs2b7za6HcsagnGf9BLc=;
 b=EhIXRR5e1B8XWQjl1O6ldCt//gb8b2O4w6T5c2rCejr8yF2HzkzftCGw3TUJE054T0o6zs
 s0BVheDdjTcQfaDq0jF1iKQ7A3AZyaB6piQrAy94IZP7GANfhWKJpNYvrL4uXX8lSMETWr
 MSShRYrqIusmrRlmtIRTT1CFq6S7AiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-PXv0Bjr5MW2rX4EcPnsXfQ-1; Fri, 20 Mar 2020 13:00:03 -0400
X-MC-Unique: PXv0Bjr5MW2rX4EcPnsXfQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4D3F108E441;
 Fri, 20 Mar 2020 17:00:00 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9131B16D22;
 Fri, 20 Mar 2020 16:59:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v6 05/24] memory: Introduce IOMMU Memory Region inject_faults API
Date: Fri, 20 Mar 2020 17:58:21 +0100
Message-Id: <20200320165840.30057-6-eric.auger@redhat.com>
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, zhangfei.gao@linaro.org,
 bbhushan2@marvell.com, will@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9AyCWW7apeT/

This new API allows to inject @count iommu_faults into
the IOMMU memory region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 25 +++++++++++++++++++++++++
 memory.c              | 10 ++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index f2c773163f..141a5dc197 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -57,6 +57,8 @@ struct MemoryRegionMmio {
     CPUWriteMemoryFunc *write[3];
 };
=20
+struct iommu_fault;
+
 typedef struct IOMMUTLBEntry IOMMUTLBEntry;
=20
 /* See address_space_translate: bit 0 is read, bit 1 is write.  */
@@ -357,6 +359,19 @@ typedef struct IOMMUMemoryRegionClass {
      * @iommu: the IOMMUMemoryRegion
      */
     int (*num_indexes)(IOMMUMemoryRegion *iommu);
+
+    /*
+     * Inject @count faults into the IOMMU memory region
+     *
+     * Optional method: if this method is not provided, then
+     * memory_region_injection_faults() will return -ENOENT
+     *
+     * @iommu: the IOMMU memory region to inject the faults in
+     * @count: number of faults to inject
+     * @buf: fault buffer
+     */
+    int (*inject_faults)(IOMMUMemoryRegion *iommu, int count,
+                         struct iommu_fault *buf);
 } IOMMUMemoryRegionClass;
=20
 typedef struct CoalescedMemoryRange CoalescedMemoryRange;
@@ -1365,6 +1380,16 @@ int memory_region_iommu_attrs_to_index(IOMMUMemoryRe=
gion *iommu_mr,
  */
 int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr);
=20
+/**
+ * memory_region_inject_faults : inject @count faults stored in @buf
+ *
+ * @iommu_mr: the IOMMU memory region
+ * @count: number of faults to be injected
+ * @buf: buffer containing the faults
+ */
+int memory_region_inject_faults(IOMMUMemoryRegion *iommu_mr, int count,
+                                struct iommu_fault *buf);
+
 /**
  * memory_region_name: get a memory region's name
  *
diff --git a/memory.c b/memory.c
index 09be40edd2..9cdd77e0de 100644
--- a/memory.c
+++ b/memory.c
@@ -2001,6 +2001,16 @@ int memory_region_iommu_num_indexes(IOMMUMemoryRegio=
n *iommu_mr)
     return imrc->num_indexes(iommu_mr);
 }
=20
+int memory_region_inject_faults(IOMMUMemoryRegion *iommu_mr, int count,
+                                struct iommu_fault *buf)
+{
+    IOMMUMemoryRegionClass *imrc =3D IOMMU_MEMORY_REGION_GET_CLASS(iommu_m=
r);
+    if (!imrc->inject_faults) {
+        return -ENOENT;
+    }
+    return imrc->inject_faults(iommu_mr, count, buf);
+}
+
 void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
 {
     uint8_t mask =3D 1 << client;
--=20
2.20.1

