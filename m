Received: by 10.25.208.211 with SMTP id h202csp712704lfg;
        Thu, 18 Feb 2016 08:56:29 -0800 (PST)
X-Received: by 10.140.85.19 with SMTP id m19mr9984356qgd.106.1455814589574;
        Thu, 18 Feb 2016 08:56:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i109si53777342qgf.26.2016.02.18.08.56.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 08:56:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWRsT-0001Q8-4X
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 11:56:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aWRsP-0001MJ-QK
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 11:56:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aWRsM-0001VM-Ia
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 11:56:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39216)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aWRsM-0001UY-5d; Thu, 18 Feb 2016 11:56:22 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 9FCE7C0005D6;
	Thu, 18 Feb 2016 16:56:21 +0000 (UTC)
Received: from apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com [10.16.184.127])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1IGuK47000760; Thu, 18 Feb 2016 11:56:21 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 18 Feb 2016 11:56:20 -0500
Message-Id: <1455814580-17699-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: [Qemu-arm] [PATCH 1/1] ARM: PL061: Checking register r/w accesses
	to reserved area
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 75LHA4Ucg035

pl061.c emulates two GPIO devices, ARM PL061 and TI Stellaris, which
share the same read/write functions (pl061_read and pl061_write).
However PL061 and Stellaris have different GPIO register definitions
and pl061_read()/pl061_write() doesn't check it. This patch enforces
checking on offset, preventing R/W into the reserved memory area.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/gpio/pl061.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index e5a696e..013bd03 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -61,6 +61,7 @@ typedef struct PL061State {
     qemu_irq irq;
     qemu_irq out[8];
     const unsigned char *id;
+    uint32_t rsvd_start; /* reserved area: [rsvd_start, 0xfcc] */
 } PL061State;
 
 static const VMStateDescription vmstate_pl061 = {
@@ -154,12 +155,15 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
 {
     PL061State *s = (PL061State *)opaque;
 
-    if (offset >= 0xfd0 && offset < 0x1000) {
-        return s->id[(offset - 0xfd0) >> 2];
-    }
     if (offset < 0x400) {
         return s->data & (offset >> 2);
     }
+    if (offset >= s->rsvd_start && offset <= 0xfcc) {
+        goto err_out;
+    }
+    if (offset >= 0xfd0 && offset < 0x1000) {
+        return s->id[(offset - 0xfd0) >> 2];
+    }
     switch (offset) {
     case 0x400: /* Direction */
         return s->dir;
@@ -200,10 +204,12 @@ static uint64_t pl061_read(void *opaque, hwaddr offset,
     case 0x528: /* Analog mode select */
         return s->amsel;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "pl061_read: Bad offset %x\n", (int)offset);
-        return 0;
+        break;
     }
+err_out:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "pl061_read: Bad offset %x\n", (int)offset);
+    return 0;
 }
 
 static void pl061_write(void *opaque, hwaddr offset,
@@ -218,6 +224,9 @@ static void pl061_write(void *opaque, hwaddr offset,
         pl061_update(s);
         return;
     }
+    if (offset >= s->rsvd_start) {
+        goto err_out;
+    }
     switch (offset) {
     case 0x400: /* Direction */
         s->dir = value & 0xff;
@@ -276,10 +285,13 @@ static void pl061_write(void *opaque, hwaddr offset,
         s->amsel = value & 0xff;
         break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "pl061_write: Bad offset %x\n", (int)offset);
+        goto err_out;
     }
     pl061_update(s);
+    return;
+err_out:
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "pl061_write: Bad offset %x\n", (int)offset);
 }
 
 static void pl061_reset(PL061State *s)
@@ -327,6 +339,7 @@ static void pl061_luminary_init(Object *obj)
     PL061State *s = PL061(obj);
 
     s->id = pl061_id_luminary;
+    s->rsvd_start = 0x52c;
 }
 
 static void pl061_init(Object *obj)
@@ -334,6 +347,7 @@ static void pl061_init(Object *obj)
     PL061State *s = PL061(obj);
 
     s->id = pl061_id;
+    s->rsvd_start = 0x424;
 }
 
 static void pl061_class_init(ObjectClass *klass, void *data)
-- 
1.8.3.1

