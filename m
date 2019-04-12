Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp370843wrx;
        Fri, 12 Apr 2019 03:14:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+v0p3O/sstIzJ4hG9ILmiMaw9ww9PdtqMHiltQZ3azGaJmkjWpdcHNJFnPuOtnwE/8u1+
X-Received: by 2002:adf:ce8c:: with SMTP id r12mr15975771wrn.60.1555064095442;
        Fri, 12 Apr 2019 03:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555064095; cv=none;
        d=google.com; s=arc-20160816;
        b=nIkF4vsZvqenalUWxdDTmrtvHwBBdw36eKwsBfYSqvTGtpqFII4g5tLExf1sot2T2Z
         43hFlRmrTIFw4Itq2fxdgMG7KNgwxqVHpOCm+60oTm+fZ4s7Pca8D3MSaTHhlrQWSp8i
         JobRqREEIgms4dQfmMtgUdmS9wWEfZdZEv6GDmlj2ATjFe1vghQYJR8duB/9TYYHZFr6
         QZ8GI1qJozSktBxq+qwO4jFxCcbnwS4F3O8gt4itjeQ5JN54N1b1a5URAWw0se4tk2Ze
         XB35HbzgK4fYcZmsGK3iQdoP6Bja/3xmsFjoe14GfDPDDlMk86AEif3Za4FgaVN44QYF
         Ed6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=v8myKEBzxg9ih4dH8FzEC+XxVvS65ML3JjoKdVtkAac=;
        b=05dpr4rsc/8seOmtPc2GIpVR7+saV6fH2WbKpJNcfZII4ITpRbNtZQUz7XQMCHvOqx
         BZQNaTXGCEera4pUNXKtLi8wC8mcVfSih+fpcQSdmZavq0X1zEJeoyP1o/GHhQLNDvfl
         JZuZSYZRulyvMQR2sp914bMl3sKW0nlcFUZ+k1zlXUF0BedxVJ/LvKOmIFWzJJCWu3Rp
         wg/50o5dtui0yweIHaDCqSeNvmI+UttJbukyyl0BlfJxzHerB+vQqv0IbyaM7O0nDpHe
         pFIZTQC0vR3T3CLV4TTAzRuaFdWNXo2p4VFkXBDFt6aTbBeh+7eVBkAEVmuk9HCZE2B9
         ntEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1si27662421wrj.252.2019.04.12.03.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 03:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:33663 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEtCw-0001xf-CB
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 06:14:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt4T-0002P2-QH
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 06:06:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1hEt4S-0004si-PW
	for qemu-devel@nongnu.org; Fri, 12 Apr 2019 06:06:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42224)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1hEt4N-0004mP-LD; Fri, 12 Apr 2019 06:06:05 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4665AC057F47;
	Fri, 12 Apr 2019 10:06:01 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-161.ams2.redhat.com [10.36.117.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC02819C65;
	Fri, 12 Apr 2019 10:05:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 12 Apr 2019 12:03:45 +0200
Message-Id: <20190412100354.6409-19-eric.auger@redhat.com>
In-Reply-To: <20190412100354.6409-1-eric.auger@redhat.com>
References: <20190412100354.6409-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 12 Apr 2019 10:06:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v3 18/27] hw/vfio/common: Introduce
 hostwin_from_range helper
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yi.l.liu@intel.com, mst@redhat.com, jean-philippe.brucker@arm.com,
	peterx@redhat.com, alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Jnw8Zfb0dRz

Let's introduce a hostwin_from_range() helper that returns the
hostwin encapsulating an IOVA range or NULL if non is found.

This improves the readibility of callers and removes the usage
of hostwin_found.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index cf876d5264..785d9c191c 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -494,6 +494,19 @@ static VFIOGuestIOMMU *vfio_alloc_guest_iommu(VFIOCo=
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
@@ -503,7 +516,6 @@ static void vfio_listener_region_add(MemoryListener *=
listener,
     void *vaddr;
     int ret;
     VFIOHostDMAWindow *hostwin;
-    bool hostwin_found;
=20
     if (vfio_listener_skipped_section(section)) {
         trace_vfio_listener_region_add_skip(
@@ -580,15 +592,8 @@ static void vfio_listener_region_add(MemoryListener =
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
@@ -759,16 +764,10 @@ static void vfio_listener_region_del(MemoryListener=
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

