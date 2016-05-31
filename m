Received: by 10.25.27.66 with SMTP id b63csp1909314lfb;
        Tue, 31 May 2016 01:11:26 -0700 (PDT)
X-Received: by 10.55.197.82 with SMTP id p79mr21468825qki.138.1464682285539;
        Tue, 31 May 2016 01:11:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3si30293888qkh.211.2016.05.31.01.11.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 May 2016 01:11:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35101 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b7elo-0008Jw-Uc
	for alex.bennee@linaro.org; Tue, 31 May 2016 04:11:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b7ekZ-0007Sv-Sc
	for qemu-arm@nongnu.org; Tue, 31 May 2016 04:10:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b7ekU-0000hM-Lo
	for qemu-arm@nongnu.org; Tue, 31 May 2016 04:10:06 -0400
Received: from e06smtp07.uk.ibm.com ([195.75.94.103]:55620)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1b7ekU-0000gZ-A8
	for qemu-arm@nongnu.org; Tue, 31 May 2016 04:10:02 -0400
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Tue, 31 May 2016 09:10:00 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
	by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 31 May 2016 09:09:56 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-arm@nongnu.org;qemu-devel@nongnu.org;qemu-ppc@nongnu.org
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 760162190067; 
	Tue, 31 May 2016 09:09:29 +0100 (BST)
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com
	[9.149.37.212])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u4V89uw89896244; Tue, 31 May 2016 08:09:56 GMT
Received: from d06av01.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u4V89t1n006510; Tue, 31 May 2016 02:09:55 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u4V89tPm006501; Tue, 31 May 2016 02:09:55 -0600
Received: from bahia.huguette.org (icon-9-164-136-85.megacenter.de.ibm.com
	[9.164.136.85])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id AD2DC220109;
	Tue, 31 May 2016 10:09:54 +0200 (CEST)
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@suse.de>, 
	David Gibson <david@gibson.dropbear.id.au>
Date: Tue, 31 May 2016 10:09:54 +0200
Message-ID: <146468219419.25446.8053365248306938869.stgit@bahia.huguette.org>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16053108-0029-0000-0000-00001F0714C0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.103
Subject: [Qemu-arm] [PATCH] virtio: move bi-endian target support to a
 single location
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cNITftBhjehL

Paolo's recent cpu.h cleanups broke legacy virtio for ppc64 LE guests (and
arm BE guests as well, even if I have not verified that). Especially, commit
"33c11879fd42 qemu-common: push cpu.h inclusion out of qemu-common.h" has
the side-effect of silently hiding the TARGET_IS_BIENDIAN macro from the
virtio memory accessors, and thus fully disabling support of endian changing
targets.

To be sure this cannot happen again, let's gather all the bi-endian bits
where they belong in include/hw/virtio/virtio-access.h.

The changes in hw/virtio/vhost.c are safe because vhost_needs_vring_endian()
is not called on a hot path and non bi-endian targets will return false
anyway.

While here, also rename TARGET_IS_BIENDIAN to be more precise: it is only for
legacy virtio and bi-endian guests.

Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
---
 hw/virtio/vhost.c                 |    4 ----
 include/hw/virtio/virtio-access.h |    6 +++++-
 target-arm/cpu.h                  |    2 --
 target-ppc/cpu.h                  |    2 --
 4 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 440071815408..81cc5b0ae35c 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -767,15 +767,11 @@ static inline bool vhost_needs_vring_endian(VirtIODevice *vdev)
     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
         return false;
     }
-#ifdef TARGET_IS_BIENDIAN
 #ifdef HOST_WORDS_BIGENDIAN
     return vdev->device_endian == VIRTIO_DEVICE_ENDIAN_LITTLE;
 #else
     return vdev->device_endian == VIRTIO_DEVICE_ENDIAN_BIG;
 #endif
-#else
-    return false;
-#endif
 }
 
 static int vhost_virtqueue_set_vring_endian_legacy(struct vhost_dev *dev,
diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index 8dc84f520316..4b2803814642 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -17,9 +17,13 @@
 #include "hw/virtio/virtio.h"
 #include "exec/address-spaces.h"
 
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
index c741b53ad45f..60971e16f7a4 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -29,8 +29,6 @@
 #  define TARGET_LONG_BITS 32
 #endif
 
-#define TARGET_IS_BIENDIAN 1
-
 #define CPUArchState struct CPUARMState
 
 #include "qemu-common.h"
diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
index cd33539d1ce9..556d66c39d11 100644
--- a/target-ppc/cpu.h
+++ b/target-ppc/cpu.h
@@ -28,8 +28,6 @@
 #define TARGET_LONG_BITS 64
 #define TARGET_PAGE_BITS 12
 
-#define TARGET_IS_BIENDIAN 1
-
 /* Note that the official physical address space bits is 62-M where M
    is implementation dependent.  I've not looked up M for the set of
    cpus we emulate at the system level.  */

