Received: by 10.25.21.96 with SMTP id l93csp1781207lfi;
        Tue, 28 Jun 2016 11:25:24 -0700 (PDT)
X-Received: by 10.129.166.195 with SMTP id d186mr1645006ywh.308.1467138324369;
        Tue, 28 Jun 2016 11:25:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l79si6527628ybf.29.2016.06.28.11.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 11:25:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHxhL-0006oE-OR
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 14:25:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHxhG-0006iD-Pa
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:25:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHxhC-0002NC-Fl
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:25:17 -0400
Received: from 17.mo3.mail-out.ovh.net ([87.98.178.58]:45001)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bHxhC-0002N2-8D
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 14:25:14 -0400
Received: from player772.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 57984FF8E6F
	for <qemu-arm@nongnu.org>; Tue, 28 Jun 2016 20:25:10 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id 4626E4C006D;
	Tue, 28 Jun 2016 20:25:01 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 28 Jun 2016 20:24:24 +0200
Message-Id: <1467138270-32481-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467138270-32481-1-git-send-email-clg@kaod.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13908804500880067345
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudefgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.178.58
Subject: [Qemu-arm] [PATCH v5 3/9] m25p80: avoid out of bounds accesses
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
X-TUID: xjrWrPUDcIip

From: Paolo Bonzini <pbonzini@redhat.com>

s->cur_addr can be made to point outside s->storage, either by
writing a value >=3D 128 to s->ear (because s->ear * MAX_3BYTES_SIZE
is a signed integer and sign-extends into the 64-bit cur_addr),
or just by writing an address beyond the size of the flash being
emulated.  Avoid the sign extension to make the code cleaner, and
on top of that mask s->cur_addr to s->size.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 8e4c11573521..4836b4eb9666 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -587,18 +587,16 @@ static inline int get_addr_length(Flash *s)
=20
 static void complete_collecting_data(Flash *s)
 {
-    int i;
-
-    s->cur_addr =3D 0;
+    int i, n;
=20
-    for (i =3D 0; i < get_addr_length(s); ++i) {
+    n =3D get_addr_length(s);
+    s->cur_addr =3D (n =3D=3D 3 ? s->ear : 0);
+    for (i =3D 0; i < n; ++i) {
         s->cur_addr <<=3D 8;
         s->cur_addr |=3D s->data[i];
     }
=20
-    if (get_addr_length(s) =3D=3D 3) {
-        s->cur_addr +=3D s->ear * MAX_3BYTES_SIZE;
-    }
+    s->cur_addr &=3D s->size - 1;
=20
     s->state =3D STATE_IDLE;
=20
@@ -1100,14 +1098,14 @@ static uint32_t m25p80_transfer8(SSISlave *ss, ui=
nt32_t tx)
         DB_PRINT_L(1, "page program cur_addr=3D%#" PRIx64 " data=3D%" PR=
Ix8 "\n",
                    s->cur_addr, (uint8_t)tx);
         flash_write8(s, s->cur_addr, (uint8_t)tx);
-        s->cur_addr++;
+        s->cur_addr =3D (s->cur_addr + 1) & (s->size - 1);
         break;
=20
     case STATE_READ:
         r =3D s->storage[s->cur_addr];
         DB_PRINT_L(1, "READ 0x%" PRIx64 "=3D%" PRIx8 "\n", s->cur_addr,
                    (uint8_t)r);
-        s->cur_addr =3D (s->cur_addr + 1) % s->size;
+        s->cur_addr =3D (s->cur_addr + 1) & (s->size - 1);
         break;
=20
     case STATE_COLLECTING_DATA:
--=20
2.1.4

