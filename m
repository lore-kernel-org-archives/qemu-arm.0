Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp979644wrv;
        Thu, 11 Jul 2019 10:32:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDjrzxpQKs8FoAVTMU2jTvv/j/YP00OU72c6wk0/MSiHYtYhgWt/TUYGne9B3mnT+2u7yn
X-Received: by 2002:a17:906:9385:: with SMTP id l5mr4288196ejx.8.1562866361421;
        Thu, 11 Jul 2019 10:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866361; cv=none;
        d=google.com; s=arc-20160816;
        b=zafpN3kP2jCJ0qjN0+TkoRppnLc4iQHqrUSstc6Gso5bkFheflNZG7/qhz9gu2U/tG
         3erLaG0GiZ/W+j3+PNIoGJRgQ54XeFFFnNVsO1z4c9B1V+aBquDVjqnSupEVYgdCeN6P
         6AcWRo7moRIf8MZkFItMUjanTr94sCvqjnUaA1ryp7QaHQUSYKVFi/R1aez7MF/nKB3y
         vyLwT3wjL1Z76yPohVRpcRdvPeXHaqrrOu8qXqSVg+BoQXJDwPpVZq5W1jJkL4lW3veJ
         /Lp2IN0hdH4MIVBXakcX6BZ8UZGBv+DwbwZLyB7wOPS7dPHcWjzjmMz/JRuBDvJcD446
         +RrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=0CS9PgU/q33K/S7ZF/v5gc9Sz9mPOGihajGEbFMe/w4=;
        b=JostaK44VzWzGETtNPoH8e50Saj2vU1ZXuMQQBSykWp/yybXbRof2zqly0SDlxdVYz
         3kuAY5DciuYGQFvzRHynl211pTgCPfFT4pnYT+duC/Et/6YiieYDr+TocPGk2VcHdTci
         EeEEDfneSeEwaTnhzBw5eYXETUTU6bkfmEhTCkg3+kvOLimOB4+Q/SHys/GLt9L9Wa84
         8MUIVyD9GYHN3ysD0ko173+CtZiQJYsv+02ghEmDqg30urzgxhN4ckFzdNFhydHIpGIm
         qMkbwhBqCYwMBQe3SA5INhrjPtacwR11C8xVcpOhAfd6PSx59EXhFb6Fdf14bl1nKJfy
         NLVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3si3345514eju.389.2019.07.11.10.32.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:32:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlcvv-000752-T8
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34388)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlcu8-0001DO-Lz
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:30:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlcu7-00035o-JY
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:30:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59834)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlcu1-0002ww-Sl; Thu, 11 Jul 2019 13:30:42 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B48C0308339A;
 Thu, 11 Jul 2019 17:30:38 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 549CD5C1B4;
 Thu, 11 Jul 2019 17:30:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:28 +0200
Message-Id: <20190711172845.31035-13-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 11 Jul 2019 17:30:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 12/29] iommu: Introduce generic header
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
X-TUID: okL9nG5UwWIV

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

