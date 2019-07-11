Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp980049wrv;
        Thu, 11 Jul 2019 10:33:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwgCk46o6j9cJrjYmKwhfiyO38gjZLqZ4sU0DqhmCux/So/cqOsgbbj1eZmWshOlcd11Kbe
X-Received: by 2002:a17:906:43c9:: with SMTP id j9mr4211735ejn.248.1562866387278;
        Thu, 11 Jul 2019 10:33:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866387; cv=none;
        d=google.com; s=arc-20160816;
        b=Hn84c1FrXqVx5w8jQ3rKqPzLE4eieCAMC+HgbCaVBHiSq4wmzb2ho7pBwNWqj2tFEF
         z8rF9RQU2djJ5Bm2FGmZ0+2EtQtVM8P/T5IglvHTx+355iFbcoeLZ8NeMCTTaxo9KHx0
         frZOnD4uutSW4Vn3SUwdyF0DVhmT0Agz3daChaioBaCJbgGH1bRrHDFo7HY+fzWbphWP
         ntC3iPJtBRLP+3Ln8cyOXVOD+2AfDGFEgegcwXiybn5Vq9VV5PPXPDWml6ViKS+41QV/
         kF8QeKdE5pFOXQvtTTmfu/8xKBt9Zwh0BTy1GaMHiwf9Cgb9R5TAMn+vG7kDfHVAk412
         eZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=kQfhD0h34pugPQYn0YCPd/wO/yEX1fiC7NOhq6vlmSk=;
        b=osJ+aJCRRQGplAFOzAA1NWeaSVKQaV39QjqEO/9H5In2FKo1sTAJ7vBLdxXdVhvfs7
         l8k0cBd0LvvXeF6F/9LAhH4kzRyZraZsJjobIFVpZFO2yqzHuxyXB+eARoUH7DEHy0jV
         oz98kGP1RAxnVh5/ESnK5uhdM+wlM0ar06JsQ9FWMKl6X7aIPy+UtkUQphvHA3qUJGRR
         YjhujmJMV7z2Y3np1CK3UznT23zyPj9Sex+E2ciTCMk/rb5omauf84YmRPXnN0ILuH1d
         vjuJrx8hXufyb5BvytLnhQDiWkI+oY5eIDG4ewaKslc5ollftPR+qP/rtyvTsLO79ROF
         LwjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rn17si3365516ejb.247.2019.07.11.10.33.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:33:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlcwK-0000GP-L1
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34456)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlcuO-0001ua-HS
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:31:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlcuM-0003HG-Km
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:31:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:9467)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlcuM-0003GB-D9; Thu, 11 Jul 2019 13:31:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D79944E90E;
 Thu, 11 Jul 2019 17:31:00 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE1655C1B4;
 Thu, 11 Jul 2019 17:30:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:31 +0200
Message-Id: <20190711172845.31035-16-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 11 Jul 2019 17:31:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 15/29] vfio: Introduce hostwin_from_range helper
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TdIDljetH4Qq

Let's introduce a hostwin_from_range() helper that returns the
hostwin encapsulating an IOVA range or NULL if non is found.

This improves the readibility of callers and removes the usage
of hostwin_found.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 46a1a089a4..81d29ce908 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -497,6 +497,19 @@ out:
     rcu_read_unlock();
 }
=20
+static VFIOHostDMAWindow *
+hostwin_from_range(VFIOContainer *container, hwaddr iova, hwaddr end)
+{
+    VFIOHostDMAWindow *hostwin;
+
+    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
+        if (hostwin->min_iova <=3D iova && end <=3D hostwin->max_iova) {
+            return hostwin;
+        }
+    }
+    return NULL;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -506,7 +519,6 @@ static void vfio_listener_region_add(MemoryListener *=
listener,
     void *vaddr;
     int ret;
     VFIOHostDMAWindow *hostwin;
-    bool hostwin_found;
=20
     if (vfio_listener_skipped_section(section)) {
         trace_vfio_listener_region_add_skip(
@@ -583,15 +595,8 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
 #endif
     }
=20
-    hostwin_found =3D false;
-    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
-        if (hostwin->min_iova <=3D iova && end <=3D hostwin->max_iova) {
-            hostwin_found =3D true;
-            break;
-        }
-    }
-
-    if (!hostwin_found) {
+    hostwin =3D hostwin_from_range(container, iova, end);
+    if (!hostwin) {
         error_report("vfio: IOMMU container %p can't map guest IOVA regi=
on"
                      " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx,
                      container, iova, end);
@@ -763,16 +768,9 @@ static void vfio_listener_region_del(MemoryListener =
*listener,
=20
     if (memory_region_is_ram_device(section->mr)) {
         hwaddr pgmask;
-        VFIOHostDMAWindow *hostwin;
-        bool hostwin_found =3D false;
+        VFIOHostDMAWindow *hostwin =3D hostwin_from_range(container, iov=
a, end);
=20
-        QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
-            if (hostwin->min_iova <=3D iova && end <=3D hostwin->max_iov=
a) {
-                hostwin_found =3D true;
-                break;
-            }
-        }
-        assert(hostwin_found); /* or region_add() would have failed */
+        assert(hostwin); /* or region_add() would have failed */
=20
         pgmask =3D (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
         try_unmap =3D !((iova & pgmask) || (int128_get64(llsize) & pgmas=
k));
--=20
2.20.1

