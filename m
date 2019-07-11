Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp989019wrv;
        Thu, 11 Jul 2019 10:43:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxtbq1o4iCa2x8Ywjj1SSfxqdlLC7T5HzKouehWM056yF+wzD1eBhED5KvvIpUPYXaADK8A
X-Received: by 2002:aa7:c515:: with SMTP id o21mr4873184edq.2.1562866982544;
        Thu, 11 Jul 2019 10:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866982; cv=none;
        d=google.com; s=arc-20160816;
        b=nsuMlf0ATo4GOTzs8cPEtr2dEFlKmC2nMwuVsr6oo7xJp05n+8y/mvl9BIle8fgtHN
         H73hrgOZ2ZH2niKuMZEYf1NaAh/In4EvcV4YMMdWDQHhWiiOAcHXzulA0DZdbvzTmBNV
         ldBy1Xd36tu0x6b5PWAkejxsZ5hJvscI0zV1vN3sABZQJvZqoRJYx5IrmVRcVvaBspOO
         gs43h0SqH0QEn+i2CX2c13nNzgP5YWcUJ1+uFgM8New7uDob7+afRtJsqRc1mV872yRV
         cOWt/zu3Ks40nzBfkSjlmgYe34k0ZHPPHW86aziDVonBWPXU/CgW4RUmY400bIdb4Nk5
         NHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=mkkz2AIY/RkelFHl7nhE9cIEf4MkkglfZFYX3ISggjQ=;
        b=sHXQlNA3tYXC58oV0YhZTzWDVCp/uaAvRZTZDv+aSLKmcpOHkw6N9VV2VO6E4ffXPq
         bGFFok1VOB51S4lHPR23lb/2yHjEWOkfMpST82A/OI+WlXY63JJVKHH0bcRmjIEbkwbG
         4WkNqmZPP3KEV0q4KRcVZPUwm5borMJie5Nzw0+LNbqSqOEBm+b7Z+ym1MnUsh22rHmo
         /hOxIcZIgRmBV82LBt+bRQO1W40CYhE/paQlnMWiz1WjUnq3tpei/SlAXMhf9N/BdjiI
         FnVWOLufE0Vnhhfl/+zHpFoGfh0lsukFnVIv105r5ZF2te6KhJsCAYQ8t9SbKcn6NoTN
         el1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19si3236148ejt.48.2019.07.11.10.43.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:43:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld5w-000345-17
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38477)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld4T-0005fM-Eb
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:41:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld4P-0004y9-9s
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:41:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48878)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld4L-0004d6-3d; Thu, 11 Jul 2019 13:41:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 70E4E8665F;
 Thu, 11 Jul 2019 17:40:51 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 773F860A97;
 Thu, 11 Jul 2019 17:40:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:14 +0200
Message-Id: <20190711173933.31203-11-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Thu, 11 Jul 2019 17:40:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 10/29] memory: Introduce IOMMU Memory Region
 inject_faults API
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dybds2w2qyu6

This new API allows to inject @count iommu_faults into
the IOMMU memory region.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 25 +++++++++++++++++++++++++
 memory.c              | 10 ++++++++++
 2 files changed, 35 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 593ef947c6..d0de192887 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -54,6 +54,8 @@ struct MemoryRegionMmio {
     CPUWriteMemoryFunc *write[3];
 };
=20
+struct iommu_fault;
+
 typedef struct IOMMUTLBEntry IOMMUTLBEntry;
=20
 /* See address_space_translate: bit 0 is read, bit 1 is write.  */
@@ -342,6 +344,19 @@ typedef struct IOMMUMemoryRegionClass {
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
@@ -1123,6 +1138,16 @@ int memory_region_iommu_attrs_to_index(IOMMUMemory=
Region *iommu_mr,
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
index 90967b579d..d81525fe11 100644
--- a/memory.c
+++ b/memory.c
@@ -2000,6 +2000,16 @@ int memory_region_iommu_num_indexes(IOMMUMemoryReg=
ion *iommu_mr)
     return imrc->num_indexes(iommu_mr);
 }
=20
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
+
 void memory_region_set_log(MemoryRegion *mr, bool log, unsigned client)
 {
     uint8_t mask =3D 1 << client;
--=20
2.20.1

