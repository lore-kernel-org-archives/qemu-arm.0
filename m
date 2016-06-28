Received: by 10.25.21.96 with SMTP id l93csp1781127lfi;
        Tue, 28 Jun 2016 11:25:11 -0700 (PDT)
X-Received: by 10.37.73.134 with SMTP id w128mr1565177yba.79.1467138311446;
        Tue, 28 Jun 2016 11:25:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si6501617yba.265.2016.06.28.11.25.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 11:25:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHxh8-0006Uz-Pv
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 14:25:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHxh4-0006RD-FW
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHxh0-0002GS-3T
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:25:05 -0400
Received: from 13.mo3.mail-out.ovh.net ([188.165.33.202]:55442)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bHxgz-0002GJ-PT
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:25:02 -0400
Received: from player772.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 3B9F1FF8E6C
	for <qemu-arm@nongnu.org>; Tue, 28 Jun 2016 20:25:01 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id B93A74C006E;
	Tue, 28 Jun 2016 20:24:51 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 28 Jun 2016 20:24:23 +0200
Message-Id: <1467138270-32481-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467138270-32481-1-git-send-email-clg@kaod.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13906271226577062673
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudefgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.33.202
Subject: [Qemu-arm] [PATCH v5 2/9] m25p80: do not put iovec on the stack
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
	armbru@redhat.com, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SGS2t2oUKwkQ

From: Paolo Bonzini <pbonzini@redhat.com>

When doing a read-modify-write cycle, QEMU uses the iovec after returning
from blk_aio_pwritev.  m25p80 puts the iovec on the stack of blk_aio_pwri=
tev's
caller, which causes trouble in this case.  This has been a problem
since commit 243e6f6 ("m25p80: Switch to byte-based block access",
2016-05-12) started doing writes at a smaller granularity than 512 bytes.
In principle however it could have broken before when using -drive
if=3Dmtd,cache=3Dnone on a disk with 4K native sectors.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 3cdcfce07ba9..8e4c11573521 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -447,6 +447,11 @@ static inline Manufacturer get_man(Flash *s)
=20
 static void blk_sync_complete(void *opaque, int ret)
 {
+    QEMUIOVector *iov =3D opaque;
+
+    qemu_iovec_destroy(iov);
+    g_free(iov);
+
     /* do nothing. Masters do not directly interact with the backing sto=
re,
      * only the working copy so no mutexing required.
      */
@@ -454,31 +459,31 @@ static void blk_sync_complete(void *opaque, int ret=
)
=20
 static void flash_sync_page(Flash *s, int page)
 {
-    QEMUIOVector iov;
+    QEMUIOVector *iov =3D g_new(QEMUIOVector, 1);
=20
     if (!s->blk || blk_is_read_only(s->blk)) {
         return;
     }
=20
-    qemu_iovec_init(&iov, 1);
-    qemu_iovec_add(&iov, s->storage + page * s->pi->page_size,
+    qemu_iovec_init(iov, 1);
+    qemu_iovec_add(iov, s->storage + page * s->pi->page_size,
                    s->pi->page_size);
-    blk_aio_pwritev(s->blk, page * s->pi->page_size, &iov, 0,
-                    blk_sync_complete, NULL);
+    blk_aio_pwritev(s->blk, page * s->pi->page_size, iov, 0,
+                    blk_sync_complete, iov);
 }
=20
 static inline void flash_sync_area(Flash *s, int64_t off, int64_t len)
 {
-    QEMUIOVector iov;
+    QEMUIOVector *iov =3D g_new(QEMUIOVector, 1);
=20
     if (!s->blk || blk_is_read_only(s->blk)) {
         return;
     }
=20
     assert(!(len % BDRV_SECTOR_SIZE));
-    qemu_iovec_init(&iov, 1);
-    qemu_iovec_add(&iov, s->storage + off, len);
-    blk_aio_pwritev(s->blk, off, &iov, 0, blk_sync_complete, NULL);
+    qemu_iovec_init(iov, 1);
+    qemu_iovec_add(iov, s->storage + off, len);
+    blk_aio_pwritev(s->blk, off, iov, 0, blk_sync_complete, iov);
 }
=20
 static void flash_erase(Flash *s, int offset, FlashCMD cmd)
--=20
2.1.4

