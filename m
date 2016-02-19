Received: by 10.25.208.211 with SMTP id h202csp1296197lfg;
        Fri, 19 Feb 2016 10:21:19 -0800 (PST)
X-Received: by 10.55.41.11 with SMTP id p11mr17478901qkh.86.1455906079504;
        Fri, 19 Feb 2016 10:21:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d2si15459675qkb.17.2016.02.19.10.21.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 10:21:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54460 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWpg6-0005bD-CX
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 13:21:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aWpfQ-0004Yo-6d
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 13:20:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aWpfO-0006W2-3X
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 13:20:36 -0500
Received: from relay-06.andrew.cmu.edu ([128.2.157.21]:47162
	helo=relay.andrew.cmu.edu) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>)
	id 1aWpfN-0006Un-UM; Fri, 19 Feb 2016 13:20:34 -0500
Received: from HEDWIG.ini.cmu.edu (HEDWIG.INI.CMU.EDU [128.2.16.51])
	by relay.andrew.cmu.edu (8.14.8/8.14.8) with ESMTP id u1JIKTk4008851;
	Fri, 19 Feb 2016 13:20:29 -0500
From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: qemu-devel@nongnu.org
Date: Fri, 19 Feb 2016 13:20:25 -0500
Message-Id: <1455906029-25565-2-git-send-email-somlo@cmu.edu>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
References: <1455906029-25565-1-git-send-email-somlo@cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.74 on 128.2.157.21
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by relay.andrew.cmu.edu id
	u1JIKTk4008851
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 128.2.157.21
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, leif.lindholm@linaro.org,
	luto@amacapital.net, qemu-arm@nongnu.org, kraxel@redhat.com,
	pbonzini@redhat.com, imammedo@redhat.com, lersek@redhat.com,
	rth@twiddle.net
Subject: [Qemu-arm] [PATCH v9 1/5] fw_cfg: expose control register size in
	fw_cfg.h
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
X-TUID: vkIHMzVh1Nlf

Expose the size of the control register (FW_CFG_CTL_SIZE) in fw_cfg.h.
Add comment to fw_cfg_io_realize() pointing out that since the
8-bit data register is always subsumed by the 16-bit control
register in the port I/O case, we use the control register width
as the *total* width of the (classic, non-DMA) port I/O region reserved
for the device.

Cc: Marc Mar=C3=AD <markmb@redhat.com>
Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Marc Mar=C3=AD <markmb@redhat.com>
---
 hw/nvram/fw_cfg.c         | 4 +++-
 include/hw/nvram/fw_cfg.h | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 79c5742..ef2a219 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -32,7 +32,6 @@
 #include "qemu/error-report.h"
 #include "qemu/config-file.h"
=20
-#define FW_CFG_CTL_SIZE 2
 #define FW_CFG_NAME "fw_cfg"
 #define FW_CFG_PATH "/machine/" FW_CFG_NAME
=20
@@ -882,6 +881,9 @@ static void fw_cfg_io_realize(DeviceState *dev, Error=
 **errp)
     FWCfgIoState *s =3D FW_CFG_IO(dev);
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
=20
+    /* when using port i/o, the 8-bit data register ALWAYS overlaps
+     * with half of the 16-bit control register. Hence, the total size
+     * of the i/o region used is FW_CFG_CTL_SIZE */
     memory_region_init_io(&s->comb_iomem, OBJECT(s), &fw_cfg_comb_mem_op=
s,
                           FW_CFG(s), "fwcfg", FW_CFG_CTL_SIZE);
     sysbus_add_io(sbd, s->iobase, &s->comb_iomem);
diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 664eaf6..2667ca9 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -46,6 +46,9 @@
=20
 #define FW_CFG_INVALID          0xffff
=20
+/* width in bytes of fw_cfg control register */
+#define FW_CFG_CTL_SIZE         0x02
+
 #define FW_CFG_MAX_FILE_PATH    56
=20
 #ifndef NO_QEMU_PROTOS
--=20
2.4.3

