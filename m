Received: by 10.25.21.96 with SMTP id l93csp1781245lfi;
        Tue, 28 Jun 2016 11:25:33 -0700 (PDT)
X-Received: by 10.37.205.194 with SMTP id d185mr1566857ybf.40.1467138333605;
        Tue, 28 Jun 2016 11:25:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e137si6514743ybh.142.2016.06.28.11.25.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 11:25:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHxhU-00070Q-Vw
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 14:25:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHxhQ-0006y9-QD
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:25:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHxhN-0002RX-Ee
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:25:28 -0400
Received: from 3.mo3.mail-out.ovh.net ([46.105.44.175]:44527)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bHxhN-0002RP-3T
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:25:25 -0400
Received: from player772.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 474EEFF8E6F
	for <qemu-arm@nongnu.org>; Tue, 28 Jun 2016 20:25:20 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id C5BBE4C006E;
	Tue, 28 Jun 2016 20:25:10 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 28 Jun 2016 20:24:25 +0200
Message-Id: <1467138270-32481-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467138270-32481-1-git-send-email-clg@kaod.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13911619251063786257
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudefgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.44.175
Subject: [Qemu-arm] [PATCH v5 4/9] m25p80: change cur_addr to 32 bit integer
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
X-TUID: LLxygqC9r+UZ

From: Paolo Bonzini <pbonzini@redhat.com>

The maximum amount of storage that can be addressed by the m25p80 command
set is 4 GiB.  However, cur_addr is currently a 64-bit integer.  To avoid
further problems related to sign extension of signed 32-bit integer
expressions, change cur_addr to a 32 bit integer.  Preserve migration
format by adding a dummy 4-byte field in place of the (big-endian)
high four bytes in the formerly 64-bit cur_addr field.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 4836b4eb9666..80e60c23e009 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -390,7 +390,7 @@ typedef struct Flash {
     uint32_t pos;
     uint8_t needed_bytes;
     uint8_t cmd_in_progress;
-    uint64_t cur_addr;
+    uint32_t cur_addr;
     uint32_t nonvolatile_cfg;
     /* Configuration register for Macronix */
     uint32_t volatile_cfg;
@@ -536,9 +536,9 @@ static inline void flash_sync_dirty(Flash *s, int64_t=
 newpage)
 }
=20
 static inline
-void flash_write8(Flash *s, uint64_t addr, uint8_t data)
+void flash_write8(Flash *s, uint32_t addr, uint8_t data)
 {
-    int64_t page =3D addr / s->pi->page_size;
+    uint32_t page =3D addr / s->pi->page_size;
     uint8_t prev =3D s->storage[s->cur_addr];
=20
     if (!s->write_enable) {
@@ -546,7 +546,7 @@ void flash_write8(Flash *s, uint64_t addr, uint8_t da=
ta)
     }
=20
     if ((prev ^ data) & data) {
-        DB_PRINT_L(1, "programming zero to one! addr=3D%" PRIx64 "  %" P=
RIx8
+        DB_PRINT_L(1, "programming zero to one! addr=3D%" PRIx32 "  %" P=
RIx8
                    " -> %" PRIx8 "\n", addr, prev, data);
     }
=20
@@ -1095,7 +1095,7 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint=
32_t tx)
     switch (s->state) {
=20
     case STATE_PAGE_PROGRAM:
-        DB_PRINT_L(1, "page program cur_addr=3D%#" PRIx64 " data=3D%" PR=
Ix8 "\n",
+        DB_PRINT_L(1, "page program cur_addr=3D%#" PRIx32 " data=3D%" PR=
Ix8 "\n",
                    s->cur_addr, (uint8_t)tx);
         flash_write8(s, s->cur_addr, (uint8_t)tx);
         s->cur_addr =3D (s->cur_addr + 1) & (s->size - 1);
@@ -1103,7 +1103,7 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint=
32_t tx)
=20
     case STATE_READ:
         r =3D s->storage[s->cur_addr];
-        DB_PRINT_L(1, "READ 0x%" PRIx64 "=3D%" PRIx8 "\n", s->cur_addr,
+        DB_PRINT_L(1, "READ 0x%" PRIx32 "=3D%" PRIx8 "\n", s->cur_addr,
                    (uint8_t)r);
         s->cur_addr =3D (s->cur_addr + 1) & (s->size - 1);
         break;
@@ -1202,7 +1202,8 @@ static const VMStateDescription vmstate_m25p80 =3D =
{
         VMSTATE_UINT32(pos, Flash),
         VMSTATE_UINT8(needed_bytes, Flash),
         VMSTATE_UINT8(cmd_in_progress, Flash),
-        VMSTATE_UINT64(cur_addr, Flash),
+        VMSTATE_UNUSED(4),
+        VMSTATE_UINT32(cur_addr, Flash),
         VMSTATE_BOOL(write_enable, Flash),
         VMSTATE_BOOL_V(reset_enable, Flash, 2),
         VMSTATE_UINT8_V(ear, Flash, 2),
--=20
2.1.4

