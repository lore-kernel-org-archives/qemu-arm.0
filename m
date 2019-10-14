Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4511714wrm;
        Mon, 14 Oct 2019 07:33:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz2hYCldbE2Yp2Q9FwdpHoVjGBQjfwOjuPwRmBnq50VCeLUCRMmxtHQA6G9EiEqYZymzCB9
X-Received: by 2002:a05:620a:1645:: with SMTP id c5mr30238548qko.473.1571063616482;
        Mon, 14 Oct 2019 07:33:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571063616; cv=none;
        d=google.com; s=arc-20160816;
        b=kHWeO7macFjrpVuw9RTEVuqlbHhhUJ8pifZ0n+aUtYysFh2rW3L8LGLEFn3DvnW71p
         1sJm7oImV0Qoykh2eGyx6HjolyqJjEpCVeQfFJh5qX6NIeI602ZRKqrhs2bdLAXF9BrF
         Rzrrrw2cCiKcIpofmyfM6EP5HwSc01rvqf2EkkG3yUh+kQYgEV/eUj/oaQ6c+K2gXqgq
         tpk+LdTMpQ2CUUaeIrf0gCBOgPken/KtHxrQRNuXX6UYuEODmyr13iJIBQhN/5QGCvIG
         Se0SjpmT1kfOaLG2NLBGa82JTxrArMr5xJvn/KgBeKl/qfBzFIS4ET0D+UDejvlSxKy8
         6wZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=YB/y/AnEIECts+D9Cu0g2ctZqM84JfE52/VS3nMqvBQ=;
        b=jWCPdV9n1t84w6izfSAdd/2UT/horjUYiFX+iNVkMZac00/J+ExU0CZd75xupQjAL2
         /KCINmayL8rVbRg3wOe3K5FCC6hodpJm5jMwqYq+5Akw/wpaeNKz09XAxermPHEsh64k
         7n/Q4zcyFQA0OiqohoABnL8NrV2nNRXhR0YR/0k4rdeWQy3tWiRzUbZqxjhfn2DxtKHS
         f79SGIaUY4Z5f0hgnT4sk/AwHUGAxQ3+LLZOPXZY1qxnRRlTRwXgolj7d6jOU3J/c8FY
         cE37SSEnIA7oprxkcc/aPmJGzawKzQ7g0L0IuiH+vwLweDvFkFNhGqi1xLuo/kVXvnPt
         fl4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 203si9840402qkd.337.2019.10.14.07.33.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 07:33:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK1Pj-0006LH-CS
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 10:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49131)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iK1JN-00010o-7X
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 10:27:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iK1JM-000191-5J
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 10:27:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39382)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iK1JC-00015l-Ci; Mon, 14 Oct 2019 10:26:50 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CB60176521;
 Mon, 14 Oct 2019 14:26:48 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48B6261379;
 Mon, 14 Oct 2019 14:26:00 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 07/20] hw/i386/intel_iommu: Remove unused includes
Date: Mon, 14 Oct 2019 16:22:33 +0200
Message-Id: <20191014142246.4538-8-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 14 Oct 2019 14:26:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Helge Deller <deller@gmx.de>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BvXiWN6kqWtz

intel_iommu.h does not use any of these includes, remove them.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/i386/intel_iommu.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/hw/i386/intel_iommu.h b/include/hw/i386/intel_iommu.=
h
index 66b931e526..a1c4afcda5 100644
--- a/include/hw/i386/intel_iommu.h
+++ b/include/hw/i386/intel_iommu.h
@@ -22,11 +22,7 @@
 #ifndef INTEL_IOMMU_H
 #define INTEL_IOMMU_H
=20
-#include "sysemu/dma.h"
 #include "hw/i386/x86-iommu.h"
-#include "hw/i386/ioapic.h"
-#include "hw/pci/msi.h"
-#include "hw/sysbus.h"
 #include "qemu/iova-tree.h"
=20
 #define TYPE_INTEL_IOMMU_DEVICE "intel-iommu"
--=20
2.21.0

