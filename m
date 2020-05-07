Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2022202lfb;
        Thu, 7 May 2020 07:34:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypK00baltTrAsbcRi7jPavzBpStgpaxLyjRlJrq9jKfEf4B+qdfjBem/pZYBwjOqUmdSGeSj
X-Received: by 2002:ac8:41d2:: with SMTP id o18mr14190937qtm.162.1588862082193;
        Thu, 07 May 2020 07:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588862082; cv=none;
        d=google.com; s=arc-20160816;
        b=L0HhK0hP7s9AgK4VSLIVFhTmXDd2WRQM+Lp+5b+DI7itgLSL5nfsoNiwBa3LDiO79E
         hIugjobFSo1ZzOBkDY9mXJSUmsrw5/byVsrBDdYnYZ42t0a8KSBJL7ajBdD6Ur0pnVJ0
         ofOCOhOEW7SeMpqAdcxA1bBKbXG59PDoemzoFxdYrLPy0mUQz4LOBc5ANIVsRWMHZxNg
         LbDQR9Z8qtuX0lG8uyYJwEE25Ybo6l2kTuW5opK0YMvYv4tu9IgYOt0AcdpJe+uuQtrV
         Ih6Ft8XreLVxCX/sRQUM4V7OiY87Y9rA6ru8q9I6t3sF0CYetsYJxk8AUqEHoLnu37QP
         fdug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FUET/bj9kjzL2ED308AFWfCvyNSYMQMWoOia+iP6atY=;
        b=BHz7CV51n2Yd7bGOwQnCbGQ0Q7FShz7/HrmKdmuvixqmdk9DL4oHyeUx/IwvjXaxn4
         U21CM1HhjeO+zifo7OiKua4dgMI8yhnw+N6t1xStbVfiW1BPPZB2JBxSYTp0yvKe9tYq
         +IrKgs1sFor0MylWk9jp11I/0qIphAxoI2dLwol+QI5A4ExBLsz4g2/vfos0Zp7+KJ6Q
         c4TpIxLNKi7ITiiPvBiAw1yQbS3rhdj7lThCO45OvsSDt2mRNarVOw1yjO5HucgkzNvI
         bYMMq7DpF8SKXvy93T3v5OgLgnb1U1hHPfVRJNJjEg+jy4ht1P/woJ1UG06LL6w2z3Je
         olAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="L/CiJ3W9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id x35si3027599qtd.236.2020.05.07.07.34.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 07:34:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="L/CiJ3W9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWhbl-0003j3-IA
	for alex.bennee@linaro.org; Thu, 07 May 2020 10:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWhZc-0000CW-5n
 for qemu-arm@nongnu.org; Thu, 07 May 2020 10:32:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31596
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWhZb-0006LG-Bn
 for qemu-arm@nongnu.org; Thu, 07 May 2020 10:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588861946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUET/bj9kjzL2ED308AFWfCvyNSYMQMWoOia+iP6atY=;
 b=L/CiJ3W9dp7QNYMlvigahMgZWDwddnZe5nliP8MVU4yUv+p7PHlGzPMsDyppCpKeuvfD2D
 IYuZvc2+ylaq2JUSWDrcRwZMgl+GirlbqMIw1ih933uT4hNU7PP34kxiobK+kOpVfnQ/no
 Lw5UJOpqWe/49wpVTB+1aIXunwbr5Sw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-R6MiLMWQO1eE_sbSEfeB_A-1; Thu, 07 May 2020 10:32:24 -0400
X-MC-Unique: R6MiLMWQO1eE_sbSEfeB_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE3DC1083E84;
 Thu,  7 May 2020 14:32:22 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A25357055D;
 Thu,  7 May 2020 14:32:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 bbhushan2@marvell.com, peterx@redhat.com, armbru@redhat.com
Subject: [PATCH 3/5] virtio-iommu: Handle reserved regions in the translation
 process
Date: Thu,  7 May 2020 16:31:59 +0200
Message-Id: <20200507143201.31080-4-eric.auger@redhat.com>
In-Reply-To: <20200507143201.31080-1-eric.auger@redhat.com>
References: <20200507143201.31080-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 03:56:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-TUID: fm5Oys7FnDwU

When translating an address we need to check if it belongs to
a reserved virtual address range. If it does, there are 2 cases:

- it belongs to a RESERVED region: the guest should neither use
  this address in a MAP not instruct the end-point to DMA on
  them. We report an error

- It belongs to an MSI region: we bypass the translation.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v11 -> v12:
- s/Interval/ReservedRegion
- break instead of goto unlock as peter suggested
- added VIRTIO_IOMMU_FAULT_F_ADDRESS flag (jean)

v10 -> v11:
- directly use the reserved_regions properties array

v9 -> v10:
- in case of MSI region, we immediatly return
---
 hw/virtio/virtio-iommu.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 95059eff70..d35fc9522b 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -607,6 +607,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemory=
Region *mr, hwaddr addr,
     uint32_t sid, flags;
     bool bypass_allowed;
     bool found;
+    int i;
=20
     interval.low =3D addr;
     interval.high =3D addr + 1;
@@ -640,6 +641,24 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemor=
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
+                break;
+            case VIRTIO_IOMMU_RESV_MEM_T_RESERVED:
+            default:
+                virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
+                                          VIRTIO_IOMMU_FAULT_F_ADDRESS,
+                                          sid, addr);
+                break;
+            }
+            goto unlock;
+        }
+    }
+
     if (!ep->domain) {
         if (!bypass_allowed) {
             error_report_once("%s %02x:%02x.%01x not attached to any domai=
n",
--=20
2.20.1

