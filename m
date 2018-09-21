Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2878532wrd;
        Fri, 21 Sep 2018 01:51:43 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbUIdkzZhqV+yM4x3BM5GjC21ZswyJosdLUL0BSTNKUSWaLVNo7UR0N0d6L/wA/kaNube1o
X-Received: by 2002:ac8:38e6:: with SMTP id g35-v6mr31769520qtc.55.1537519903484;
        Fri, 21 Sep 2018 01:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537519903; cv=none;
        d=google.com; s=arc-20160816;
        b=UvJh/RAbMFwY+ZARVyD0bAfjtBJvFhCkcdvKNBoFBrLYLexnf11DgFWQLxtR5nBw5r
         Q/Pdm+QpXm9qe517xUDNmwj5TNHrzJOeB6cZVKRuJtj0tyh5TkGLpdus3MYk1tY+42Dj
         hr9/cfBKAmHhd5lIgkA8DsviQDT7hC/gNEHSBckWwV3RNK51zWHxki7Hs9zLBT8hQydn
         m0YQjOkdjrNYLn+YEiInC7Xnwj+pzAQgBFvclhQlHZ6n3kuMYGX0dEu+8OY5Q+OCO6Ns
         zLGpctVJPWz/kzpERIb0OXBsUJoLajOBjS2y4szEvm7tQfhMrDVfZEdCO4buGoFZmMIj
         NrNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=xTA1MHvns2edsUFYAPAD1iCWJ0i0qdK15MMtni8ulRE=;
        b=e+B1YZ1bbvhEHG92NO8kk09fNWnVM7U/De939RYS2w4hvX4FFj5tBfmej00Mbn8QBt
         SyozLQ/thY773VJNwcabjOdeVEMaqwD3WEVwO3snXUtsUj5am9mrYj85DcC6PmisK/s5
         eeiDWoEDzpUCPHHtRN1gOuX8WD1YZhwS8boMhDooM14naoYlnVp3YJfdYZyx/9a6APSH
         NVoO4KGBHUu5Iug9OfyJdNAs3rI5vdH1SQ0RkOJ3LjOV21hsQZGIcmpUkN2RZEYt8N+N
         ShFpPeTzprSS9MNDIdFIVduoEW2vDESEuSbPe5QgMGZS9LxHhwShM8RQc1LLsNPq+Pq3
         I2uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c42-v6si23896qve.19.2018.09.21.01.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 01:51:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3HA7-0001ba-0a
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 04:51:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Ggw-0005pF-Me
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:21:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3Ggv-0007Wj-TQ
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 04:21:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50838)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3Ggv-0007VP-N1; Fri, 21 Sep 2018 04:21:33 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0411F3002A92;
	Fri, 21 Sep 2018 08:21:33 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF1947D665;
	Fri, 21 Sep 2018 08:21:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 10:18:15 +0200
Message-Id: <20180921081819.9203-25-eric.auger@redhat.com>
In-Reply-To: <20180921081819.9203-1-eric.auger@redhat.com>
References: <20180921081819.9203-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 21 Sep 2018 08:21:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 24/28] memory: Introduce IOMMU_NOTIFIER_INIT_CFG
 IOMMU Config Notifier
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
X-TUID: 8dwmZhAkrFon

This patch adds a new IOMMU config notifier. It aims at
configuring the fault reporting from host to guest.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

I acknowledge I am not a big fan of having a vfio uapi struct
referenced in IOMMUConfig. However this config really sets
something at VFIO layer. Also I may rename IOMMU_NOTIFIER_INIT_CFG
into IOMMU_NOTIFIER_FAULT_CONFIG. Globally it is also questionnable
at this stage if such a notifier really is requested. I devised that
to allow the SMMU to pass a fifo size to the kernel. This size can
be aligned to the size as seen/set by the guest. However for
unrecoverable errors we may consider that having an arbitrary size
determined by vfio/common.c can be sufficient?
---
 include/exec/memory.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 93150e1450..f54c39b248 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -28,6 +28,7 @@
 #include "hw/qdev-core.h"
 #ifdef CONFIG_LINUX
 #include <linux/iommu.h>
+#include <linux/vfio.h>
 #endif
 
 #define RAM_ADDR_INVALID (~(ram_addr_t)0)
@@ -82,6 +83,7 @@ typedef struct IOMMUConfig {
     union {
 #ifdef __linux__
         struct iommu_pasid_table_config pasid_cfg;
+        struct vfio_iommu_type1_guest_fault_config fault_cfg;
 #endif
           };
 } IOMMUConfig;
@@ -98,10 +100,13 @@ typedef enum {
     IOMMU_NOTIFIER_MAP = 0x2,
     /* Notify stage 1 config changes */
     IOMMU_NOTIFIER_PASID_CFG = 0x4,
+    /* Notify IOMMU initial setup */
+    IOMMU_NOTIFIER_INIT_CFG = 0x8,
 } IOMMUNotifierFlag;
 
 #define IOMMU_NOTIFIER_IOTLB_ALL (IOMMU_NOTIFIER_MAP | IOMMU_NOTIFIER_UNMAP)
-#define IOMMU_NOTIFIER_CONFIG_ALL (IOMMU_NOTIFIER_PASID_CFG)
+#define IOMMU_NOTIFIER_CONFIG_ALL (IOMMU_NOTIFIER_PASID_CFG | \
+                                   IOMMU_NOTIFIER_INIT_CFG)
 
 struct IOMMUNotifier;
 struct IOMMUConfig;
-- 
2.17.1

