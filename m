Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp989236wrv;
        Thu, 11 Jul 2019 10:43:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxvthLg4KX+TWuQSn913PBGA+rtxkrdmMxkwCMYLp2n83OENodURdUq8q+zS3+WdcsBVQtP
X-Received: by 2002:a17:906:b209:: with SMTP id p9mr4335618ejz.270.1562866996770;
        Thu, 11 Jul 2019 10:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866996; cv=none;
        d=google.com; s=arc-20160816;
        b=hEQ8Gz2ALKrODoJ1o54g2GWVBV72hgcGGtJcrlpr8MRB0GuksztcEsLHi7PjgWI8qs
         Vmd5RuwY9KB8tyUWNnyMRyfXvM65+EBcL39rAma5H37Z5duST7yJBINoTw4gBl1LXn54
         lXYShy0lTkoWZMTjSEY343omQl3u3X5Q+TyRhWA21ypnIpTmDBBlWpPK8xRRW1l3Q/Dc
         VeUpyY2LVtMRS5oaR/F3dLg/gZNDXcF+QcJ7F7OmfPruDo8HZYfFq8gmuejJqU4vFlIs
         rxLSvf0lDI3v2HVDHeYaiXdGTAaqxMpQDOtL8Oo/Pb4NDOXCtGteuLlzoS1Vb0t8cQqU
         74WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=kQfhD0h34pugPQYn0YCPd/wO/yEX1fiC7NOhq6vlmSk=;
        b=WFXNSiI4174ta1FFz1cs82E7X1nGCGv561p92unCeXTdJlK4/n0Qqu7vUnEIH2wBij
         +0v8jfMEyN3NJGaSuuReMwOB6Euo83C10LDKLMbgtdkz0F9l7/z/+9++MC/Om9iXbOJJ
         elZqBHk0fbmEX12okH+uCZgRIMZiWeqCm8prvomuOdZM11VxFCbzb8HpewOHzCEvcCDs
         HrfOBNrQI0G1sktQU/r+xgPND6NjvshapgkKcLdAhJZVD3uEE9o6PlSdF1++oRLHP6rE
         ddgQk2LkcxL3KzV/hWi/agcQDpNcGlee9V7d3wqor1r/zbTD+8Qy1+xOPkw1Rv49qO5p
         sDnA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l23si3501224ejr.318.2019.07.11.10.43.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld6B-0004eK-2z
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38581)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld4Z-00065Z-BI
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:41:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld4X-00058F-RH
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:41:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38588)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld4W-00054R-5h; Thu, 11 Jul 2019 13:41:33 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 83E0A81F19;
 Thu, 11 Jul 2019 17:41:30 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F5F46092E;
 Thu, 11 Jul 2019 17:41:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:19 +0200
Message-Id: <20190711173933.31203-16-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 11 Jul 2019 17:41:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 15/29] vfio: Introduce hostwin_from_range helper
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
X-TUID: XR6/F8uOej0r

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

