Received: by 10.25.21.156 with SMTP id 28csp829199lfv;
        Wed, 3 Aug 2016 09:25:15 -0700 (PDT)
X-Received: by 10.55.19.23 with SMTP id d23mr832071qkh.230.1470241515759;
        Wed, 03 Aug 2016 09:25:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v19si2620453qka.149.2016.08.03.09.25.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Aug 2016 09:25:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUyyo-0005Xq-Ta
	for alex.bennee@linaro.org; Wed, 03 Aug 2016 12:25:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bUywt-0004CI-B1
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 12:23:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1bUywo-0006iq-EI
	for qemu-devel@nongnu.org; Wed, 03 Aug 2016 12:23:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60562)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1bUywf-0006fX-UB; Wed, 03 Aug 2016 12:23:02 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F59B4E320;
	Wed,  3 Aug 2016 16:22:56 +0000 (UTC)
Received: from t530wlan.home.berrange.com.com (vpn1-7-219.ams2.redhat.com
	[10.36.7.219])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u73GMoai009808; Wed, 3 Aug 2016 12:22:53 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Aug 2016 17:22:36 +0100
Message-Id: <1470241360-3574-2-git-send-email-berrange@redhat.com>
In-Reply-To: <1470241360-3574-1-git-send-email-berrange@redhat.com>
References: <1470241360-3574-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 03 Aug 2016 16:22:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/5] virtio-console: set frontend open
 permanently for console devs
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
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Amit Shah <amit.shah@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gc8T9T3i+KG/

The virtio-console.c file handles both serial consoles
and interactive consoles, since they're backed by the
same device model.

Since serial devices are expected to be reliable and
need to notify the guest when the backend is opened
or closed, the virtio-console.c file wires up support
for chardev events. This affects both serial consoles
and interactive consoles, using a network connection
based chardev backend such as 'socket', but not when
using a PTY based backend or plain 'file' backends.

When the host side is not connected the handle_output()
method in virtio-serial-bus.c will drop any data sent
by the guest, before it even reaches the virtio-console.c
code. This means that if the chardev has a logfile
configured, the data will never get logged.

Consider for example, configuring a x86_64 guest with a
plain UART serial port

  -chardev socket,id=charserial1,host=127.0.0.1,port=9001,server,nowait,logfile=console1.log,logappend=on
  -device isa-serial,chardev=charserial1,id=serial1

vs a s390 guest which has to use the virtio-console port

  -chardev socket,id=charconsole1,host=127.0.0.1,port=9000,server,nowait,logfile=console2.log,logappend=on
  -device virtconsole,chardev=charconsole1,id=console1

The isa-serial one gets data written to the log regardless
of whether a client is connected, while the virtioconsole
one only gets data written to the log when a client is
connected.

There is no need for virtio-serial-bus.c to aggressively
drop the data for console devices, as the chardev code is
prefectly capable of discarding the data itself.

So this patch changes virtconsole devices so that they
are always marked as having the host side open. This
ensures that the guest OS will always send any data it
has (Linux virtio-console hvc driver actually ignores
the host open state and sends data regardless, but we
should not rely on that), and also prevents the
virtio-serial-bus code prematurely discarding data.

The behaviour of virtserialport devices is *not* changed,
only virtconsole, because for the former, it is important
that the guest OSknow exactly when the host side is opened
/ closed so it can do any protocol re-negotiation that may
be required.

Fixes bug: https://bugs.launchpad.net/qemu/+bug/1599214

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 hw/char/virtio-console.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
index 2e36481..4f0e03d 100644
--- a/hw/char/virtio-console.c
+++ b/hw/char/virtio-console.c
@@ -85,8 +85,9 @@ static void set_guest_connected(VirtIOSerialPort *port, int guest_connected)
 {
     VirtConsole *vcon = VIRTIO_CONSOLE(port);
     DeviceState *dev = DEVICE(port);
+    VirtIOSerialPortClass *k = VIRTIO_SERIAL_PORT_GET_CLASS(port);
 
-    if (vcon->chr) {
+    if (vcon->chr && !k->is_console) {
         qemu_chr_fe_set_open(vcon->chr, guest_connected);
     }
 
@@ -156,9 +157,25 @@ static void virtconsole_realize(DeviceState *dev, Error **errp)
     }
 
     if (vcon->chr) {
-        vcon->chr->explicit_fe_open = 1;
-        qemu_chr_add_handlers(vcon->chr, chr_can_read, chr_read, chr_event,
-                              vcon);
+        /*
+         * For consoles we don't block guest data transfer just
+         * because nothing is connected - we'll just let it go
+         * whetherever the chardev wants - /dev/null probably.
+         *
+         * For serial ports we need 100% reliable data transfer
+         * so we use the opened/closed signals from chardev to
+         * trigger open/close of the device
+         */
+        if (k->is_console) {
+            vcon->chr->explicit_fe_open = 0;
+            qemu_chr_add_handlers(vcon->chr, chr_can_read, chr_read,
+                                  NULL, vcon);
+            virtio_serial_open(port);
+        } else {
+            vcon->chr->explicit_fe_open = 1;
+            qemu_chr_add_handlers(vcon->chr, chr_can_read, chr_read,
+                                  chr_event, vcon);
+        }
     }
 }
 
-- 
2.7.4

