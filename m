Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp921723wrp;
        Thu, 19 Sep 2019 05:20:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwkQs2X1mR8/oW8/92wNlvi9Kz8K3/3v82DbYS/OsGEiQJPXp3HhpIZl8Fnloc61TQGkPN+
X-Received: by 2002:a17:906:1542:: with SMTP id c2mr13541118ejd.120.1568895646703;
        Thu, 19 Sep 2019 05:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568895646; cv=none;
        d=google.com; s=arc-20160816;
        b=VUSndOGKON7xoUKhx6xpkgKTFxaUc5sxh2LoHzrjh8l4Kga4DWc8SK/PK1kFh3ZlcJ
         1l0P5LrRQdBHUuv0weEAemj1C6LAJC7fSBZPaBwfR4HFNhl3h/VI6+RZbmj2CsiGYQF8
         LtL/tkfWoXcafTNUvUEozeqsVtz4dyLkpSI2/EsodIuDARleOMndHcn+f3L9aZD6GquD
         1Fggx00eNB+yUxfO6XFnS9AwmbPH+EC6BiWYHNWSvla6WlCGY35dDkzqsA+8dcomFHTj
         oOQJAb+ZreOs3O8uhuemvPUrYJI/zBdp9FSS4pamfzEyMr07C8fh2a7uBTuyeMaLJY2x
         uGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=17+6090PQIPDr6ZvOhE7jTG5x63df14ldFloFN3eCvQ=;
        b=tHa22NL1uKmBX/OyPVjhIOqTUedmVI7UlQRb9Ug9Z7w8avlXvKefJ7i7nw0X8nUte3
         8C2Gv+A2iMjLUhH8w+UBnS+Y7K+Rhkk8OVpzEFN2fowa5+IkJLRe2FQ86kz0BwRh6l5d
         Y1koNBQvdW8xKlrbw9kbiDYCrc+IA+yPTbCd0QAEwaDDNrcqVDOMUMV6ah3mbbj9Dtzb
         zDCH/mMqD8JO4wMmB0A5jKI0NhSFh6fBf2xLGDeCXqIeE0GoApW1QTPT9PCrieC8D5HF
         DR2YzupviZFxG5O+FF8Jlp8amgz/vtlkuxRugQMDA+kxZzPerz+Dwhbqe1rd5vXo4vej
         9zPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b27si909990ede.233.2019.09.19.05.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 05:20:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAvQT-0006Ua-7F
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 08:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37651)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iAvOu-00057m-13
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 08:19:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iAvOs-0003sy-RN
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 08:19:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49484)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iAvOs-0003s8-JU; Thu, 19 Sep 2019 08:19:06 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BF48581DF7;
 Thu, 19 Sep 2019 12:19:05 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-220.ams2.redhat.com [10.36.117.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 953C560BF1;
 Thu, 19 Sep 2019 12:19:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Thu, 19 Sep 2019 14:18:42 +0200
Message-Id: <20190919121845.29520-3-eric.auger@redhat.com>
In-Reply-To: <20190919121845.29520-1-eric.auger@redhat.com>
References: <20190919121845.29520-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 19 Sep 2019 12:19:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 2/5] vfio/common: Handle
 memory_region_register_iommu_notifier() failure
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
Cc: mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K5dsl056auWT

Now memory_region_register_iommu_notifier() is allowed to fail,
let's handle the returned value in vfio_listener_region_add().

This will allow to remove the error handling (exit) in the
IOMMUs that implement a notify_flag_changed() that sometimes
cannot accept the MAP flag.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3e03c495d8..d57d72cfb9 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -630,9 +630,13 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
                             section->offset_within_region,
                             int128_get64(llend),
                             iommu_idx);
-        QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
=20
-        memory_region_register_iommu_notifier(section->mr, &giommu->n);
+        ret =3D memory_region_register_iommu_notifier(section->mr, &giom=
mu->n);
+        if (ret) {
+            g_free(giommu);
+            goto fail;
+        }
+        QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
         memory_region_iommu_replay(giommu->iommu, &giommu->n);
=20
         return;
--=20
2.20.1

