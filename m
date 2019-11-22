Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp727782lfc;
        Fri, 22 Nov 2019 10:38:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqzGCgyxYyw+h1mq3uV3pOpG1UqgKO+AWhhpF8OGOvsp3xO4ohFR1JwAPPrSsMSS9hVQnih/
X-Received: by 2002:a50:ed12:: with SMTP id j18mr2904154eds.172.1574447903130;
        Fri, 22 Nov 2019 10:38:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574447903; cv=none;
        d=google.com; s=arc-20160816;
        b=wnYU+gK/SB6+ZgIk+CnGlsHiHPsgMyvmtw27n0RsScYpUM/grcPJx10lxU2FwNJdzH
         CcYx8WtPcaZ9bny1d6jz870SiFInCSgsh3tBHrwF0vJ/pGLXP8T3ewZl2gz5xXbFo2Rd
         MvNMRWAX/IwG+dA6gHmTD9FrInkDaXj4ZnJ57H3IzJAjuLydZWgXJ/WX664v93X2OR6A
         qGEIZLqQq3mCas0OzKKDdIiabDg8v0FppYC8hW1xsKrnGyv0YXXE2rCTnsbIa8kcgSBl
         JKi4OqmCUUFSW5iwpzm3pE3jA5lDqe2FmrSD5fG/h3avDtCrqlg9G0S71rX4UruIkdm2
         jtGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=B76/q/QIgTbwaStE7V12zNd/AKuPjF8S7ms1RzIMaeM=;
        b=PEwc+4gjhFba411ChVMO1yBhgay0XgxErYv5zQADBxzd4NCJGpCDhw2gcDgAhdMA6b
         5dRhTSBCD6uKBP2bgP6FY21ubC+fcV4MdG1XN+i/3TDYFjBxyFzqNDHb5sy93YkHbvXS
         srECXNU/34gHLEXwaZTETvxrwUdQfiYzEsJ4cZ4/ZytpiUAfcqRxnFmdNBDbfmPYofXR
         d0JJinCdj/3hpGoZxJ22SEr81grqDycZYkszzVpYLz2GgddOx8fKitD3W6tOm1R6XMH1
         XfXAIFLWh2zd5i6IP+zUn1jYnyvENDCWe4n2eaKYafB7NFNNwNYcY0UbBQovLmePGnbe
         VMhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MCZQe0VP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19si1346809edt.451.2019.11.22.10.38.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2019 10:38:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MCZQe0VP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iYDoz-0008Nk-S1
	for alex.bennee@linaro.org; Fri, 22 Nov 2019 13:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40051)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iYDif-00014z-N9
 for qemu-arm@nongnu.org; Fri, 22 Nov 2019 13:31:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iYDie-0000Va-IQ
 for qemu-arm@nongnu.org; Fri, 22 Nov 2019 13:31:49 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58171
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iYDie-0000VO-E4
 for qemu-arm@nongnu.org; Fri, 22 Nov 2019 13:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574447508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B76/q/QIgTbwaStE7V12zNd/AKuPjF8S7ms1RzIMaeM=;
 b=MCZQe0VPv76ufCszZYkGiRAFJmxdF+daNnLLeCifnPssblKWNhEitmFUsR8NFtAmF32CYG
 2fHNOlTosCcbb8IuOjnnxUKDfJ6lglt2skbU8sZ8/WagxkO9dJe3w6Ws2wgbhTverQEqOO
 S4z2OvC3+erF4BXIqOja7bbO9OAwrFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-wxLWuDKoNRWCfV2kziUo7w-1; Fri, 22 Nov 2019 13:31:47 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F30C5107ACE3;
 Fri, 22 Nov 2019 18:31:44 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 047636E71C;
 Fri, 22 Nov 2019 18:31:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, jean-philippe.brucker@arm.com, bharatb.linux@gmail.com,
 yang.zhong@intel.com, dgilbert@redhat.com, quintela@redhat.com
Subject: [PATCH for-5.0 v11 14/20] virtio-iommu: Handle reserved regions in
 the translation process
Date: Fri, 22 Nov 2019 19:29:37 +0100
Message-Id: <20191122182943.4656-15-eric.auger@redhat.com>
In-Reply-To: <20191122182943.4656-1-eric.auger@redhat.com>
References: <20191122182943.4656-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wxLWuDKoNRWCfV2kziUo7w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kevin.tian@intel.com, peterx@redhat.com, tnowicki@marvell.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q5cvjV9Dom4N

When translating an address we need to check if it belongs to
a reserved virtual address range. If it does, there are 2 cases:

- it belongs to a RESERVED region: the guest should neither use
  this address in a MAP not instruct the end-point to DMA on
  them. We report an error

- It belongs to an MSI region: we bypass the translation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v10 -> v11:
- directly use the reserved_regions properties array

v9 -> v10:
- in case of MSI region, we immediatly return
---
 hw/virtio/virtio-iommu.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 1ce2218935..c5b202fab7 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -548,6 +548,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemory=
Region *mr, hwaddr addr,
     uint32_t sid, flags;
     bool bypass_allowed;
     bool found;
+    int i;
=20
     interval.low =3D addr;
     interval.high =3D addr + 1;
@@ -580,6 +581,22 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemor=
yRegion *mr, hwaddr addr,
         goto unlock;
     }
=20
+    for (i =3D 0; i < s->nb_reserved_regions; i++) {
+        if (interval.low >=3D s->reserved_regions[i].low &&
+            interval.low <=3D s->reserved_regions[i].high) {
+            switch (s->reserved_regions[i].type) {
+            case VIRTIO_IOMMU_RESV_MEM_T_MSI:
+                entry.perm =3D flag;
+                goto unlock;
+            case VIRTIO_IOMMU_RESV_MEM_T_RESERVED:
+            default:
+                virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
+                                          0, sid, addr);
+            goto unlock;
+           }
+        }
+    }
+
     if (!ep->domain) {
         if (!bypass_allowed) {
             qemu_log_mask(LOG_GUEST_ERROR,
--=20
2.20.1

