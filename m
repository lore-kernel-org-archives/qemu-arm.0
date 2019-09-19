Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp922021wrp;
        Thu, 19 Sep 2019 05:21:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy2m8CgWIU2A86rIRY46m230mwZpsZAlk6A6xxRWhOy0WUJIDdcdBxCu0HRPnVH4vgtUJpK
X-Received: by 2002:a50:b6aa:: with SMTP id d39mr15371633ede.16.1568895666178;
        Thu, 19 Sep 2019 05:21:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568895666; cv=none;
        d=google.com; s=arc-20160816;
        b=EDiuTCN9kF8t7wnG2waJPuclzhXZ2A/UfLqIBYHkaWUDvPUZ/PbOAZOxW0bwC1P/xt
         1PiHcECDLMabzpb6Q405pgHLw2gGUkhkhDseO7C6zxq2ERplndUyRpaNfgKi70fDx8Wo
         v9FsEE27CACl0ZyduW5nA7kNZGegz+van2b+ZkG26waUDPTamJ/y3HAYd7wa36KodO1P
         Bnccxdk0g+g+TMLlbBjJm5c7WPe/BkNhrSaQaZ8G9JpEbgisL+STXjqIoMogzOQde81l
         u9NZT9IMEaNRITnL6T+PztEhlFw5jHLnMZ5uVFY91qlSw5hW3DLSTaeA3b2cqdWGuC7E
         A81g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=1FmU6jkkeCfOKR4wYokieSQnAYYfOJ/Q+B4jLLcuoUw=;
        b=AAk4M8J8p8Bv/7kWu2aCeH3oVIqO69bqSXadkhdmhKaKJ4uakxjR6GX2T0LP1155vM
         iufGc1yvDKJXXkQxyi/Ldbpl5bqlEOpprgvIeV3aNI+7lN0kDDUannbOYQLkrU0dYAoo
         hURo3gnrD89w5D+ry9RgHwYb4kJVgKt8nMxI8nr0u+8w5B9+WAKX5YP3OiqiMIIKzj4Z
         TDMGcZ9BBGBULcA6J2jKxsMkuuD45VXwNpExnmbbuzeOlnCcP4YyVsn8ojAIeMXGOoWv
         23QGG9QGRtWDQa/I081SYQ7eyfPziDYiEWBx3oV6g9BEoEfuzao/+Xraf+vf213yWpEI
         LHlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1si5186488eda.406.2019.09.19.05.21.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 05:21:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAvQm-0006tw-FI
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 08:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37735)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iAvPF-0005Oq-I7
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 08:19:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iAvPA-0004Gx-RH
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 08:19:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40044)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iAvP8-0004AA-75; Thu, 19 Sep 2019 08:19:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 84371A3D3A8;
 Thu, 19 Sep 2019 12:19:21 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-220.ams2.redhat.com [10.36.117.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4785E60BF1;
 Thu, 19 Sep 2019 12:19:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Thu, 19 Sep 2019 14:18:44 +0200
Message-Id: <20190919121845.29520-5-eric.auger@redhat.com>
In-Reply-To: <20190919121845.29520-1-eric.auger@redhat.com>
References: <20190919121845.29520-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 19 Sep 2019 12:19:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 4/5] vhost: assert on
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
X-TUID: 1g4FjbgkQvBM

memory_region_register_iommu_notifier now returns an error
in case of failure. Assert in such a case.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- assert(!ret)
---
 hw/virtio/vhost.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 34accdf615..975cb4c28c 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -672,7 +672,7 @@ static void vhost_iommu_region_add(MemoryListener *li=
stener,
                                          iommu_listener);
     struct vhost_iommu *iommu;
     Int128 end;
-    int iommu_idx;
+    int iommu_idx, ret;
     IOMMUMemoryRegion *iommu_mr;
=20
     if (!memory_region_is_iommu(section->mr)) {
@@ -696,7 +696,8 @@ static void vhost_iommu_region_add(MemoryListener *li=
stener,
     iommu->iommu_offset =3D section->offset_within_address_space -
                           section->offset_within_region;
     iommu->hdev =3D dev;
-    memory_region_register_iommu_notifier(section->mr, &iommu->n);
+    ret =3D memory_region_register_iommu_notifier(section->mr, &iommu->n=
);
+    assert(!ret);
     QLIST_INSERT_HEAD(&dev->iommu_list, iommu, iommu_next);
     /* TODO: can replay help performance here? */
 }
--=20
2.20.1

