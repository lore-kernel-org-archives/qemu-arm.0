Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1130451lfe;
        Fri, 20 Mar 2020 10:03:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu0hcgW+fKNWx7daQEeyWdgfthEr80680PcPTV68IvJWK7FYnvca5zVAcxpNs8eFnLEEhnO
X-Received: by 2002:ae9:d886:: with SMTP id u128mr8267784qkf.240.1584723838897;
        Fri, 20 Mar 2020 10:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584723838; cv=none;
        d=google.com; s=arc-20160816;
        b=HYbPMXiM7bVOq7rx6uqCLlt7VV4m0uEiaKSTDIDxc+pHyCKxqRMTs4ODqEh7dPCyPg
         aRs0XK2KXmgBNQG1iR1EOu6tGaOTtz0V3l+hTtg/c+pTI10NkrEAu+Dbtc6H5HccUhO8
         wrmJ9hmZ3B2XX2Me1sbuoVdh+m+osWWoZ40B/37LqpCONkEBtqkkGiv1M7sQWQk/ASrZ
         i4lX0d4WCbBnzQxnLS853npVCh6BW2vAfWL2D3yVvA/OhqqIZ8WO9x/o1H9zm0oo4XC3
         YS/9UodhUrNYnJfKz6b8uHOggYKzrWT1/cRRp+zaPptk2yhXrncqVOTMAtBWb6zzegiX
         F6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nXtzXlFbaPFXfG384F8tfefUNvNBuBevl6Fv5zyuq1Y=;
        b=ilEZPiAZIR6YW6ndU0pHQpr73yY+q1EfYcHD/IXwAemH1aG1p9ziglnqD8EL3EDElj
         aRHrSRXe71Dk5LqKL+yUijvN+acZyDaptxtVzl4cQ0VLI9XPobTOgCnGRPfRWs3j8Pu7
         VmcARBrETF0Sfc8yR7pU3s3w+BDROlilx3JVCVPzKjaTdCf93JOB1EwdSQgLAbPq9yBn
         qI+Hyq9FCdDieLRGKTSBw2wYP5u0Zq6mGSQNAzVne3IfEqIML10uDs2V1bfgyn/gSw15
         GFH+gzbJ1t803hIce3V8ih0sC4N44Hsd5890udeiYhd+nsgqeBK9t2sDs002paRqaZz2
         VfUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bZSKx5vy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si3588466qtw.272.2020.03.20.10.03.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 10:03:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bZSKx5vy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFL3u-0001M4-5t
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 13:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54326)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jFL0Z-0004if-4t
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:00:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jFL0Y-000581-1Z
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:00:31 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:56314)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jFL0X-00056Y-SA
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584723629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXtzXlFbaPFXfG384F8tfefUNvNBuBevl6Fv5zyuq1Y=;
 b=bZSKx5vyUdnN89U4wncGRv4T4ImDzFQiWpKJVdloPRVFEfE3EKr1cMftbahZxgzKb8KJOs
 EhfZLykIcH9IN+BzwQkaJkEQWu0JKsBrLiHO+9bzUyRP9KeR4mZpNYLvj+49vhMUOw8DUd
 dZcrw2ghPK3LnL/eOfNnzc6N8j6EbFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-ez1_SjPKNGW3nqASzyE1lg-1; Fri, 20 Mar 2020 13:00:27 -0400
X-MC-Unique: ez1_SjPKNGW3nqASzyE1lg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE79210CE780;
 Fri, 20 Mar 2020 17:00:25 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2A2A19757;
 Fri, 20 Mar 2020 17:00:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v6 07/24] iommu: Introduce generic header
Date: Fri, 20 Mar 2020 17:58:23 +0100
Message-Id: <20200320165840.30057-8-eric.auger@redhat.com>
In-Reply-To: <20200320165840.30057-1-eric.auger@redhat.com>
References: <20200320165840.30057-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, zhangfei.gao@linaro.org,
 bbhushan2@marvell.com, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZBGGhuoMJLqB

This header is meant to exposes data types used by
several IOMMU devices such as struct for SVA and
nested stage configuration.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/iommu/iommu.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 include/hw/iommu/iommu.h

diff --git a/include/hw/iommu/iommu.h b/include/hw/iommu/iommu.h
new file mode 100644
index 0000000000..12092bda7b
--- /dev/null
+++ b/include/hw/iommu/iommu.h
@@ -0,0 +1,28 @@
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
+#ifdef __linux__
+#include <linux/iommu.h>
+#endif
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

