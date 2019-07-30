Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4628241wrv;
        Tue, 30 Jul 2019 10:26:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqywveCCocaNwUJ/SxmCK79ds5MigReRbIcOy/orHtpsxCt7q+RH+ywXoLmNHr0i83Cvv7jP
X-Received: by 2002:ab0:7035:: with SMTP id u21mr16551565ual.26.1564507582188;
        Tue, 30 Jul 2019 10:26:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564507582; cv=none;
        d=google.com; s=arc-20160816;
        b=zfqliTlCaKQooRDbqEWY7T5fa8JW2nthzBA2OTC7oph9AloO1J8k5MqxjkRaqY9EZH
         6Z5+oLkzpXVn5evCxrVpRtLayHhs8a9Js8v5/GxhLlJzNOqMy1+JzM/wBJP8frxPcGXK
         8MAnUWfJ4QDxz0waK3L/JFVvsH4ZGr6YZjaVDnQdmqwlJyLfZFZ7CNZxkabhdayg/3oD
         bSOgdGH5FerqdTIoKg2SOptCJ2H4Du8ZpdNK3IjvzedNqc1M7QUqNfX55ryAchanigKq
         wb/O84OMiWm13Mzqcdc6A0/IeE4uD7YCsXq83T3CD2DWP5bYAgf+wrHkF3Gl7yGQLe67
         aCMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=dCC/6O+poR0ZHe11Ci/EjrHfe8yZZ2wfW60JXrpSYoI=;
        b=mSLyDB6wSL6c7XNez5iaEQ1+1YVPzTkLnRbD7n+vXpGaq6ZtfrW7HM5a78DOouPZ57
         Y9kkKnJ+JG0LdsCWZnfV57Z00UZGUnSDncJkITRnmQU19fXT2UYwFksS0CYKDLPNJ4PS
         kWdnI6sjtuLlvcfaZGft+zpgJSx33yUHP1BmTqzaRzknY59Oh8C1CQ6OSE6bJbd4lp1v
         ivn32JOMJLuQMSNRXEpdkr2oOiKP8RIGmU8JEcwC8kyyRJCOiXZQfYHQ3kKX9dBWvuuR
         ViIg+IWm1WDieT7lQgxZyflVDb9Nk0vjR1Q7HITi5Dlxyxgw14WYSMkb0c0g/5cIdD7c
         bBrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y24si23774715uap.90.2019.07.30.10.26.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 10:26:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsVtF-0007r6-ME
	for alex.bennee@linaro.org; Tue, 30 Jul 2019 13:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32965)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hsVqg-0002qA-56
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 13:23:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hsVqf-0001QV-43
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 13:23:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40838)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hsVqc-0001O5-VP; Tue, 30 Jul 2019 13:23:39 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 427D03091761;
 Tue, 30 Jul 2019 17:23:38 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E0C060BE5;
 Tue, 30 Jul 2019 17:23:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 alex.williamson@redhat.com, jean-philippe@linaro.org, kevin.tian@intel.com
Date: Tue, 30 Jul 2019 19:21:35 +0200
Message-Id: <20190730172137.23114-14-eric.auger@redhat.com>
In-Reply-To: <20190730172137.23114-1-eric.auger@redhat.com>
References: <20190730172137.23114-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Tue, 30 Jul 2019 17:23:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.2 v10 13/15] virtio_iommu: Handle
 reserved regions in translation process
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
Cc: tn@semihalf.com, bharat.bhushan@nxp.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8AovR9bGbpUi

When translating an address we need to check if it belongs to
a reserved virtual address range. If it does, there are 2 cases:

- it belongs to a RESERVED region: the guest should neither use
  this address in a MAP not instruct the end-point to DMA on
  them. We report an error

- It belongs to an MSI region: we bypass the translation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v9 -> v10:
- in case of MSI region, we immediatly return
---
 hw/virtio/virtio-iommu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 8e54a17227..20d92b7ab0 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -711,6 +711,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemo=
ryRegion *mr, hwaddr addr,
     viommu_interval interval;
     bool bypass_allowed;
     bool read_fault, write_fault;
+    struct virtio_iommu_probe_resv_mem *reg;
=20
     interval.low =3D addr;
     interval.high =3D addr + 1;
@@ -743,6 +744,21 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMem=
oryRegion *mr, hwaddr addr,
         goto unlock;
     }
=20
+    reg =3D g_tree_lookup(ep->reserved_regions, (gpointer)(&interval));
+    if (reg) {
+        switch (reg->subtype) {
+        case VIRTIO_IOMMU_RESV_MEM_T_MSI:
+            entry.perm =3D flag;
+            return entry;
+        case VIRTIO_IOMMU_RESV_MEM_T_RESERVED:
+        default:
+            virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
+                                      0, sid, addr);
+            break;
+        }
+        goto unlock;
+    }
+
     if (!ep->domain) {
         if (!bypass_allowed) {
             qemu_log_mask(LOG_GUEST_ERROR,
--=20
2.20.1

