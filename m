Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp6321007wrg;
        Mon, 27 May 2019 05:00:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzdEzkCv+MXkaRGhgL4zAejp78rMBJ5xrsuPWQ5cCs4G7pquKL+E36dYC2AiGIdwCpUf/Wx
X-Received: by 2002:aed:2665:: with SMTP id z92mr62184930qtc.368.1558958412774;
        Mon, 27 May 2019 05:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558958412; cv=none;
        d=google.com; s=arc-20160816;
        b=mn3SfC6gRZt4LVqCltIoAFx+hyPOmasCxiiXbo450Kt8DXolK6ilBcapXupxeYVh3w
         n9fFMPsqHtti9EkwDJQWvVIisfbX7hQcLRm/5VXrNfgttWyU5Sbok6tjFY92pbeFnjjv
         EhTpHpbpRwizg1eSARAfKAD8RrUES6GNiYMWGJqgpDV6qJmzmN5CXtOD9P2SUtnwMisX
         YrV6BR0Tju6HYrdUkt1N5KMc2K+16wQvyDxs4dYW0J+ILiMFl2FViqfBCVQaZWCVQC66
         /iN5MBuuYwETkzw8QXBzh6hwqSnWztcDcA/uqhsT/bQ0BiIsZJ4OAbaP4hyvW8Nr83kw
         htLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=pKyjk6U+XirEWnHw/zF84Rz5MyPWQiLsfRIMN8uXU20=;
        b=w39vPgu/bhx75my89aZD+fJFZ+vxR2r7vc8DWKRMmVH4DNj++iqzdGd2sPfHQRm2cE
         0NLbaymUPG2u7bnui2Z8i3y5CQG8OtUI852XTRLsHlzYKXThZJENl67UdADMce9cfkAc
         C4bXdWot2gt1k4765Hcciib5OeE3gn5bVVdQzFirsW4QhFkfquQsoFWZE+/AxTVkWS4m
         HEZpWYXyJqInAGgLTV0k81V75R9ifMZNRpNuttDUbFyjXrZzfbfq1ITMbMxNs7e+XHlL
         wGZWi59jnsXM58V3pDHxzQFC64Y2fa3VLCYJZCFZmYHu7eDklw/XMbFXVkwHBwU+MSHr
         l+LA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x130si423045qka.261.2019.05.27.05.00.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 May 2019 05:00:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44269 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hVEIW-0008UK-8d
	for alex.bennee@linaro.org; Mon, 27 May 2019 08:00:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE3J-0004MV-MT
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:44:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hVE3I-0004Si-Oc
	for qemu-arm@nongnu.org; Mon, 27 May 2019 07:44:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57114)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hVE3I-0004RC-I1; Mon, 27 May 2019 07:44:28 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEE8B81DE8;
	Mon, 27 May 2019 11:44:27 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDCF05D962;
	Mon, 27 May 2019 11:44:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Mon, 27 May 2019 13:41:54 +0200
Message-Id: <20190527114203.2762-19-eric.auger@redhat.com>
In-Reply-To: <20190527114203.2762-1-eric.auger@redhat.com>
References: <20190527114203.2762-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 27 May 2019 11:44:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 18/27] hw/vfio/common: Introduce
 hostwin_from_range helper
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
	jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NnYaWOAB2pjY

Let's introduce a hostwin_from_range() helper that returns the
hostwin encapsulating an IOVA range or NULL if non is found.

This improves the readibility of callers and removes the usage
of hostwin_found.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 7df8b92563..5c4b444f24 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -511,6 +511,19 @@ static VFIOGuestIOMMU *vfio_alloc_guest_iommu(VFIOCo=
ntainer *container,
     return giommu;
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
@@ -520,7 +533,6 @@ static void vfio_listener_region_add(MemoryListener *=
listener,
     void *vaddr;
     int ret;
     VFIOHostDMAWindow *hostwin;
-    bool hostwin_found;
=20
     if (vfio_listener_skipped_section(section)) {
         trace_vfio_listener_region_add_skip(
@@ -597,15 +609,8 @@ static void vfio_listener_region_add(MemoryListener =
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
@@ -776,16 +781,10 @@ static void vfio_listener_region_del(MemoryListener=
 *listener,
=20
     if (memory_region_is_ram_device(section->mr)) {
         hwaddr pgmask;
-        VFIOHostDMAWindow *hostwin;
-        bool hostwin_found =3D false;
+        VFIOHostDMAWindow *hostwin =3D
+            hostwin_from_range(container, iova, end);
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

