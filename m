Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp988005wrv;
        Thu, 11 Jul 2019 10:41:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzy9mV2vUCNCyaHV243BSrZGIzZYqYOpKE1A9iep9Sl10zMB87iAqMrn/kAsfLD4c6x5w95
X-Received: by 2002:a05:6402:14d4:: with SMTP id f20mr4698591edx.125.1562866912573;
        Thu, 11 Jul 2019 10:41:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866912; cv=none;
        d=google.com; s=arc-20160816;
        b=EPNhDyLf1fC6eM18RkiwXwfBfcvWissiQLFZnY/EOLD1CqaQfOCHJxymrcaOUp0PFg
         Gsy0hwuBTe1/E1Z5e6MZ+7HsrFqr0K6HKTjTfQERfRYmQjO6XpNbZHEIIpXqhpn47CcI
         4tSTuVOAGfmeaBi+xPp6r3uOa58bwtMEi5K9HYcQZFKqrKaRQrlI58IK6fFZ64lUhUYh
         1JMN+XHnLyKG0JNgDVLRsl0MPeHkhLevIvJ+twJj5IiCSZsovczttk5pL0e7Dm1uG0qN
         xBt/t5pMTGc6ooiIAMLSh3WmeZbndTKlYYyw5y2oKcp+sMKVjKu8YSoJfc75aHSyp+16
         KXvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=0CS9PgU/q33K/S7ZF/v5gc9Sz9mPOGihajGEbFMe/w4=;
        b=hMdW/2xG/6MoO2ber8NPTIzPP9KGAJ0NqjI8kXD7OccoK8ZDuXIte6yzH5Im4unLDU
         nff9mizcs8rnHTeYMNcxHIR1KW6ewExubYunO7PWqIK6f5p6P+l6YCrY1R3NOZPtGYFD
         A3myCpX/vU5v/o9kvQsHRfmKOTFNocpklRu/acK21nYWUVfaeJ1tR27/Q+soxq5zmeU4
         +2NGwC7og9nGO7BT7ELzSaihI8Qg+qNq5AcIUFhk7wXpX1/xsE6h3tDPh+pUBnfQKyBD
         NhT0u+NTi0zEYo0zcxRavHYRmYLsekSXuykN+UuG0vDeXqtgwGNzcKDqazatsXyuovFJ
         O97g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si3950172edb.259.2019.07.11.10.41.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:41:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld4p-0006lM-1B
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38437)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld4R-0005XQ-Q1
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:41:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld4P-0004y5-9p
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:41:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38106)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld4L-0004lI-5p; Thu, 11 Jul 2019 13:41:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AD94930832E1;
 Thu, 11 Jul 2019 17:41:07 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA39B60A97;
 Thu, 11 Jul 2019 17:41:04 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:16 +0200
Message-Id: <20190711173933.31203-13-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 11 Jul 2019 17:41:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 12/29] iommu: Introduce generic header
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
X-TUID: r9UAtiDa9395

This header is meant to exposes data types used by
several IOMMU devices such as struct for SVA and
nested stage configuration.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/iommu/iommu.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 include/hw/iommu/iommu.h

diff --git a/include/hw/iommu/iommu.h b/include/hw/iommu/iommu.h
new file mode 100644
index 0000000000..9e60ece160
--- /dev/null
+++ b/include/hw/iommu/iommu.h
@@ -0,0 +1,25 @@
+/*
+ * common header for iommu devices
+ *
+ * Copyright Red Hat, Inc. 2019
+ *
+ * Authors:
+ *  Eric Auger <eric.auger@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef QEMU_HW_IOMMU_IOMMU_H
+#define QEMU_HW_IOMMU_IOMMU_H
+
+typedef struct IOMMUConfig {
+    union {
+#ifdef __linux__
+        struct iommu_pasid_table_config pasid_cfg;
+#endif
+          };
+} IOMMUConfig;
+
+
+#endif /* QEMU_HW_IOMMU_IOMMU_H */
--=20
2.20.1

