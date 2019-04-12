Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp381522wrx;
        Fri, 12 Apr 2019 03:26:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxGHPMfKC+D8EZhpPvQPCoXCsmNWsqWetzC4rZsjNeY7Dx1S74/1yDJgxHimXNjvTI+a0zy
X-Received: by 2002:adf:c60e:: with SMTP id n14mr35980929wrg.127.1555064787374;
        Fri, 12 Apr 2019 03:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555064787; cv=none;
        d=google.com; s=arc-20160816;
        b=lJSE+ifD9axLFodtmJd92j5GVse7rsCVZang6ZJ3NiYILkWhVVFigsvK4q26ovWn0/
         V5P8/CneN/QZSEWcf4y0EgO8OdecCJqgXZ2UEDLlN1ePouYu/ahATmS6PFvlRSxuHO3u
         Mm2q0UVSsB/+jmS1VZo26pYsjc0kXjj70tb90Q9h4amBfL7tk5+qkhZF/NTHYFPassV5
         2AWtU9dlypBfZnljY5FWEKpI9tANPGQAFossSGOKRKdVSpWsGu6QI5MU6OWZYpLrdLYj
         eMrzSTiaFUha+JKxYvcC6FeHa2YnNeXrWL2Sw8sQUFfc5cwwu8fbMCenfSASLa+bhfFh
         fQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=GuJgb0OGNc4SX7VGijUtOimFqmeyfPzOS6elRFYt9gM=;
        b=HQgqiT6tfTMRfoRso7RHNAXkR0xCHRBOWyQkdN9ljseRUl+h42h6wkJY5kLnyI0NGW
         AIe2rrErLJc0x2PojWZ9KM2QCxbRN2TX0ITl44dRbst6TEnjWtk98CFz7XXlZajnMMrd
         aWR1BAczxJ9ZxOFB8WffUPSunwn1fD/bJ9LSZeZsUDqyMITcdkv43wnVkJ8CNrfWMr9l
         Kw9q4a5Nk/p3ldXZtvfnlU+vWlcXj19Zvf6w4Bh1kZAal0jcHJKu+ISiIt4szE3Lm9Lb
         XnN9rYQR2nmZcfTMt28JoqMF9MIgjCyOx3n4B8EMoh33utAEL88e9dIP3/ag9ikvbJ9R
         bYqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7si26838273wrj.343.2019.04.12.03.26.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:26:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEtO6-0004en-G5
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:26:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt53-0003IQ-Ph
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:06:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt52-0005PF-RK
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 06:06:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43526)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hEt52-0005OJ-JR; Fri, 12 Apr 2019 06:06:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1489C062ED6;
	Fri, 12 Apr 2019 10:06:43 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-161.ams2.redhat.com [10.36.117.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A72119C65;
	Fri, 12 Apr 2019 10:06:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 12 Apr 2019 12:03:50 +0200
Message-Id: <20190412100354.6409-24-eric.auger@redhat.com>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
References: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 12 Apr 2019 10:06:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 23/27] memory: Introduce IOMMU Memory Region
 inject_faults API
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
X-TUID: KapKGlv82wAs

This new API allows to inject @count iommu_faults into
the IOMMU memory region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 26 ++++++++++++++++++++++++++
 memory.c              | 12 ++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index aedebc8471..6262de1684 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -400,6 +400,20 @@ typedef struct IOMMUMemoryRegionClass {
      * @iommu: the IOMMUMemoryRegion
      */
     int (*num_indexes)(IOMMUMemoryRegion *iommu);
+
+#ifdef CONFIG_LINUX
+    /* Inject @count faults into the IOMMU memory region
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
+#endif
 } IOMMUMemoryRegionClass;
=20
 typedef struct CoalescedMemoryRange CoalescedMemoryRange;
@@ -1216,6 +1230,18 @@ int memory_region_iommu_attrs_to_index(IOMMUMemory=
Region *iommu_mr,
  */
 int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr);
=20
+#ifdef CONFIG_LINUX
+/**
+ * memory_region_inject_faults : inject @count faults stored in @buf
+ *
+ * @iommu_mr: the IOMMU memory region
+ * @count: number of faults to be injected
+ * @buf: buffer containing the faults
+ */
+int memory_region_inject_faults(IOMMUMemoryRegion *iommu_mr, int count,
+                                struct iommu_fault *buf);
+#endif
+
 /**
  * memory_region_name: get a memory region's name
  *
diff --git a/memory.c b/memory.c
index 8cd3c65872..2eac24cb80 100644
--- a/memory.c
+++ b/memory.c
@@ -2037,6 +2037,18 @@ int memory_region_iommu_num_indexes(IOMMUMemoryReg=
ion *iommu_mr)
     return imrc->num_indexes(iommu_mr);
 }
=20
+#ifdef CONFIG_LINUX
+int memory_region_inject_faults(IOMMUMemoryRegion *iommu_mr, int count,
+                                struct iommu_fault *buf)
+{
+    IOMMUMemoryRegionClass *imrc =3D IOMMU_MEMORY_REGION_GET_CLASS(iommu=
_mr);
+    if (!imrc->inject_faults) {
+        return -ENOENT;
+    }
+    return imrc->inject_faults(iommu_mr, count, buf);
+}
+#endif
+
 void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
 {
     uint8_t mask =3D 1 << client;
--=20
2.20.1

