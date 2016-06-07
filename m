Received: by 10.25.27.66 with SMTP id b63csp2007264lfb;
        Tue, 7 Jun 2016 06:25:49 -0700 (PDT)
X-Received: by 10.55.70.66 with SMTP id t63mr21474756qka.173.1465305948953;
        Tue, 07 Jun 2016 06:25:48 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y91si14036661qgy.35.2016.06.07.06.25.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 06:25:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49721 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAH0u-00073I-DG
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 09:25:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1bAGaW-00083y-Uq
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 08:58:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1bAGaV-0003Kq-Sp
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 08:58:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37695)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1bAGaS-0003JA-3F; Tue, 07 Jun 2016 08:58:28 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 897DD63171;
	Tue,  7 Jun 2016 12:58:27 +0000 (UTC)
Received: from redhat.com (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u57CwMgS018108; Tue, 7 Jun 2016 08:58:23 -0400
Date: Tue, 7 Jun 2016 15:58:22 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20160607155822-mutt-send-email-mst@redhat.com>
References: <1465304171-10874-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1465304171-10874-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 07 Jun 2016 12:58:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 25/25] virtio: move bi-endian target support
 to a single location
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@suse.de>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <gkurz@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I61FOwL4Kox0

From: Greg Kurz <gkurz@linux.vnet.ibm.com>

Paolo's recent cpu.h cleanups broke legacy virtio for ppc64 LE guests (an=
d
arm BE guests as well, even if I have not verified that). Especially, com=
mit
"33c11879fd42 qemu-common: push cpu.h inclusion out of qemu-common.h" has
the side-effect of silently hiding the TARGET_IS_BIENDIAN macro from the
virtio memory accessors, and thus fully disabling support of endian chang=
ing
targets.

To be sure this cannot happen again, let's gather all the bi-endian bits
where they belong in include/hw/virtio/virtio-access.h.

The changes in hw/virtio/vhost.c are safe because vhost_needs_vring_endia=
n()
is not called on a hot path and non bi-endian targets will return false
anyway.

While here, also rename TARGET_IS_BIENDIAN to be more precise: it is only=
 for
legacy virtio and bi-endian guests.

Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: C=E9dric Le Goater <clg@kaod.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/hw/virtio/virtio-access.h | 6 +++++-
 target-arm/cpu.h                  | 2 --
 target-ppc/cpu.h                  | 2 --
 hw/virtio/vhost.c                 | 4 ----
 4 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio=
-access.h
index 8dc84f5..4b28038 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -17,9 +17,13 @@
 #include "hw/virtio/virtio.h"
 #include "exec/address-spaces.h"
=20
+#if defined(TARGET_PPC64) || defined(TARGET_ARM)
+#define LEGACY_VIRTIO_IS_BIENDIAN 1
+#endif
+
 static inline bool virtio_access_is_big_endian(VirtIODevice *vdev)
 {
-#if defined(TARGET_IS_BIENDIAN)
+#if defined(LEGACY_VIRTIO_IS_BIENDIAN)
     return virtio_is_big_endian(vdev);
 #elif defined(TARGET_WORDS_BIGENDIAN)
     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 401955f..17d8051 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -29,8 +29,6 @@
 #  define TARGET_LONG_BITS 32
 #endif
=20
-#define TARGET_IS_BIENDIAN 1
-
 #define CPUArchState struct CPUARMState
=20
 #include "qemu-common.h"
diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
index 98a24a5..db7ee0c 100644
--- a/target-ppc/cpu.h
+++ b/target-ppc/cpu.h
@@ -28,8 +28,6 @@
 #define TARGET_LONG_BITS 64
 #define TARGET_PAGE_BITS 12
=20
-#define TARGET_IS_BIENDIAN 1
-
 /* Note that the official physical address space bits is 62-M where M
    is implementation dependent.  I've not looked up M for the set of
    cpus we emulate at the system level.  */
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 4400718..81cc5b0 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -767,15 +767,11 @@ static inline bool vhost_needs_vring_endian(VirtIOD=
evice *vdev)
     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
         return false;
     }
-#ifdef TARGET_IS_BIENDIAN
 #ifdef HOST_WORDS_BIGENDIAN
     return vdev->device_endian =3D=3D VIRTIO_DEVICE_ENDIAN_LITTLE;
 #else
     return vdev->device_endian =3D=3D VIRTIO_DEVICE_ENDIAN_BIG;
 #endif
-#else
-    return false;
-#endif
 }
=20
 static int vhost_virtqueue_set_vring_endian_legacy(struct vhost_dev *dev=
,
--=20
MST

