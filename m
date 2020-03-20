Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1132140lfe;
        Fri, 20 Mar 2020 10:05:23 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vugvCUyiZlt7UEuP1UmmhcOh4encs4t1bTjE7jVt3LuG4l7xDqzrxyNVvkqVAXVrjojDT35
X-Received: by 2002:a37:4ec1:: with SMTP id c184mr8949925qkb.0.1584723923773;
        Fri, 20 Mar 2020 10:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584723923; cv=none;
        d=google.com; s=arc-20160816;
        b=CCu6KVu11tX7j2hFXmGNMhSzzagRWZ3xoD1fUdkDflVuVhbt8kqwt0JZPll7IQ+eLJ
         BeU4975MYjglec3Wf5CoxOkZZmItLnvaJ2EYbaMz8kEhJTwfflH07DZ2Mwc8naKqBiyP
         ugPmpYEIJdGfvV8n9QocvXX2NXo/DAUTGgmACrrw75V/Qmo1QKfCzOl+vULw9Pi/zCqr
         WJRUMXPtc5oqhKb3K1VC7UFYJ/LH3VAfcQqPK13Vlvwb09QYjVbruQSkK0JhHXYiNPKv
         wKG3dvbVffkjfXM0qJM2a9kJgLpPCOEKR0PxqD0v6oECnGVY7xCh3bahfkScblnXQPv8
         wpTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=t4JEo38OsoTleYSz1Ap6y5BLad8jF4RnSdlo4s9LBd0=;
        b=rfMpsb64F01PXFqsOhiIkAmcF4bHQOaAPwULAHjDYaih3vXVMqeNWheXdQKBMyI323
         tw2ToGTH00f132aSCVm23ugkgS4P3N5W4l7tR1oY95hhX7k216LiBg3K3X8CtVz/iguo
         NhOQ8yVaxRDJ7SEPUX+ZooZwPU7sR2wslx8R2HCqXNwFCe8TTaOmtIUIMreoNJugmBD4
         IQTbSpKNDGJc86WuqzT0/L0ReZshNqsCvOBBLEbrmuZ7ePkm/DTA2YbxSIVfKpSMqxJX
         JshHJZmaK4DPS59zO7KvZw2mkL4OBYCD049QgRoRPR/Td0rp40nzUlZ4TGkD9X2M5GHE
         21TA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Kz2yasyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si4073935qta.101.2020.03.20.10.05.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 10:05:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Kz2yasyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFL5H-0003YP-23
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 13:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54611)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jFL15-0005Se-Vq
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:01:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jFL14-0005ZR-Pm
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:01:03 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:39565)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jFL14-0005Xe-M6
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584723661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t4JEo38OsoTleYSz1Ap6y5BLad8jF4RnSdlo4s9LBd0=;
 b=Kz2yasyqnQexrcFk5mKjNl2G1D4/Ifgx/0rBoFEf3JLOCjZhgXCQGxCt8zv4TF9rYvCnPl
 pS83KAnmCaz8ppz3UwSj61B/eJOwCXBjKyvp++7Of2qyb1Y0JOhygObW9H/7x9A2CWWUiz
 q/fZH7weYeVfHsytaQtp1VnNuTWhbY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-6KUtMsyxMlyVBsuuqZFzig-1; Fri, 20 Mar 2020 13:00:59 -0400
X-MC-Unique: 6KUtMsyxMlyVBsuuqZFzig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EF5D108E446;
 Fri, 20 Mar 2020 17:00:57 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0EEB19757;
 Fri, 20 Mar 2020 17:00:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v6 10/24] vfio: Introduce hostwin_from_range helper
Date: Fri, 20 Mar 2020 17:58:26 +0100
Message-Id: <20200320165840.30057-11-eric.auger@redhat.com>
In-Reply-To: <20200320165840.30057-1-eric.auger@redhat.com>
References: <20200320165840.30057-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, zhangfei.gao@linaro.org,
 bbhushan2@marvell.com, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +8agjqVJFlvW

Let's introduce a hostwin_from_range() helper that returns the
hostwin encapsulating an IOVA range or NULL if none is found.

This improves the readibility of callers and removes the usage
of hostwin_found.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ac417b5dbd..f20b37fbee 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -499,6 +499,19 @@ out:
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
@@ -508,7 +521,6 @@ static void vfio_listener_region_add(MemoryListener *li=
stener,
     void *vaddr;
     int ret;
     VFIOHostDMAWindow *hostwin;
-    bool hostwin_found;
     Error *err =3D NULL;
=20
     if (vfio_listener_skipped_section(section)) {
@@ -593,15 +605,8 @@ static void vfio_listener_region_add(MemoryListener *l=
istener,
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
         error_setg(&err, "Container %p can't map guest IOVA region"
                    " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, e=
nd);
         goto fail;
@@ -774,16 +779,9 @@ static void vfio_listener_region_del(MemoryListener *l=
istener,
=20
     if (memory_region_is_ram_device(section->mr)) {
         hwaddr pgmask;
-        VFIOHostDMAWindow *hostwin;
-        bool hostwin_found =3D false;
+        VFIOHostDMAWindow *hostwin =3D hostwin_from_range(container, iova,=
 end);
=20
-        QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
-            if (hostwin->min_iova <=3D iova && end <=3D hostwin->max_iova)=
 {
-                hostwin_found =3D true;
-                break;
-            }
-        }
-        assert(hostwin_found); /* or region_add() would have failed */
+        assert(hostwin); /* or region_add() would have failed */
=20
         pgmask =3D (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
         try_unmap =3D !((iova & pgmask) || (int128_get64(llsize) & pgmask)=
);
--=20
2.20.1

