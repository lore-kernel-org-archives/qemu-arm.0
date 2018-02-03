Received: by 10.28.71.27 with SMTP id u27csp349284wma;
        Sat, 3 Feb 2018 00:49:58 -0800 (PST)
X-Google-Smtp-Source: AH8x226/Bdd1iWGN3NU0Gkf3P6zV2oSWll0Fta7Bcp/AM20m0v5PvoFNvVs+LlMjtrFL82f2jWUk
X-Received: by 10.37.175.12 with SMTP id a12mr6281541ybh.443.1517647798071;
        Sat, 03 Feb 2018 00:49:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517647798; cv=none;
        d=google.com; s=arc-20160816;
        b=tW7giRzCmW24VdFUvPOo8abJx85moWb89Jq0yF0/OM5gbwriNpDVNMQr/zszNgP30k
         emH4c4TsUCqNDKDzvWcHJyix8g2/v0N/gDrOHTjd17hnG4+Z2Luj2ytH6zgmh2vCJbGO
         aQQiC7FriJwR+QYP9+62RFTPaseuZ81+JdetVjqDDNI/2Arsy7LmB0555MXHi68fqrsi
         edeSBOE2D9jYI53reOkBoKZ1SAguYpFgPzahzQevXCWPynWfPz+SLii7QctpzP3eHEmO
         yf4browOKzhNLHONoH6y/c/WUcyJo2bcCorc7n5acC9z6wI/NDfJsGS/AEmfDmKhgiBU
         ZeXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=ThdGao4nbGRx8YV4t3U3Z0xxRJnNrqOYaYT9CQRbPXw=;
        b=z0pXFtogtVOWXXPVchDHZHkPAScultxZVYAbMIsedQGBl9fnfKb0/qu6lfEE1ynqde
         2SoG4bUuLwMuQwGwXtJTIqYpTbfn6QQKgEyFlEuug71igEUEdOAosPa+O3EOIOw4q1s4
         yWn8V81zaDCib8nyJ6/wV5Ts5tT2lrUxPuHeGf8jsVF0+AJFOGRNgTUmMlAQi2IG2zXb
         YI+7mcVm7Fg+tjv32Sw+PHDeH4m3GsCrJJh5gw4EcJ2xciEMpJSUdAlij0Ejg5IUYBDN
         JCx5I35XXmvIXaZ1+rc0MrIDnAVufracvsU/qaUResj/u8ISHECBtDnLvIZ8OJVBgrtc
         U2Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z129si739837ybf.421.2018.02.03.00.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Feb 2018 00:49:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ehtWH-00076d-Ej
	for alex.bennee@linaro.org; Sat, 03 Feb 2018 03:49:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ehtPt-0001so-58
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 03:43:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ehtPq-0000Oa-2r
	for qemu-arm@nongnu.org; Sat, 03 Feb 2018 03:43:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40308)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1ehtPp-0000NC-Qe; Sat, 03 Feb 2018 03:43:18 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0FDB380462;
	Sat,  3 Feb 2018 08:43:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
	[10.36.116.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 847F97A002;
	Sat,  3 Feb 2018 08:43:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 53C7D1138648; Sat,  3 Feb 2018 09:43:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat,  3 Feb 2018 09:43:03 +0100
Message-Id: <20180203084315.20497-3-armbru@redhat.com>
In-Reply-To: <20180203084315.20497-1-armbru@redhat.com>
References: <20180203084315.20497-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sat, 03 Feb 2018 08:43:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v8 02/14] hw/arm: Replace fprintf(stderr,
 "*\n" with error_report()
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
Cc: qemu-arm@nongnu.org, eblake@redhat.com, f4bug@amsat.org,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6jTCk2k4nEQe

From: Alistair Francis <alistair.francis@xilinx.com>

Replace a large number of the fprintf(stderr, "*\n" calls with
error_report(). The functions were renamed with these commands and then
compiler issues where manually fixed.

find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|erro=
r_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_=
report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_repo=
rt("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report=
("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("=
\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1=
"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\=
2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2)=
;|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|=
Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig=
}' \
    {} +
find ./* -type f -exec sed -i \
    'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}'=
 \
    {} +

Some lines where then manually tweaked to pass checkpatch.

The 'qemu: ' prefix was manually removed from the hw/arm/boot.c file.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-arm@nongnu.org

Conversions that aren't followed by exit() dropped, because they might
be inappropriate.

Also trim trailing punctuation from error messages.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/arm/armv7m.c    |  2 +-
 hw/arm/boot.c      | 16 ++++++++--------
 hw/arm/gumstix.c   | 13 +++++++------
 hw/arm/mainstone.c |  7 ++++---
 hw/arm/musicpal.c  |  2 +-
 hw/arm/omap1.c     |  5 +++--
 hw/arm/omap2.c     |  3 ++-
 hw/arm/omap_sx1.c  |  2 +-
 hw/arm/pxa2xx.c    |  7 ++++---
 hw/arm/vexpress.c  |  8 ++++----
 hw/arm/z2.c        |  6 +++---
 11 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index bb2dfc942b..56770a7048 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -278,7 +278,7 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kern=
el_filename, int mem_size)
 #endif
=20
     if (!kernel_filename && !qtest_enabled()) {
-        fprintf(stderr, "Guest image must be specified (using -kernel)\n=
");
+        error_report("Guest image must be specified (using -kernel)");
         exit(1);
     }
=20
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index c2720c8046..bb244ec359 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -8,6 +8,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include <libfdt.h>
 #include "hw/hw.h"
@@ -690,7 +691,7 @@ static void load_image_to_fw_cfg(FWCfgState *fw_cfg, =
uint16_t size_key,
         gsize length;
=20
         if (!g_file_get_contents(image_name, &contents, &length, NULL)) =
{
-            fprintf(stderr, "failed to load \"%s\"\n", image_name);
+            error_report("failed to load \"%s\"", image_name);
             exit(1);
         }
         size =3D length;
@@ -956,8 +957,7 @@ static void arm_load_kernel_notify(Notifier *notifier=
, void *data)
         is_linux =3D 1;
     }
     if (kernel_size < 0) {
-        fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                info->kernel_filename);
+        error_report("could not load kernel '%s'", info->kernel_filename=
);
         exit(1);
     }
     info->entry =3D entry;
@@ -976,8 +976,8 @@ static void arm_load_kernel_notify(Notifier *notifier=
, void *data)
                                                   info->initrd_start);
             }
             if (initrd_size < 0) {
-                fprintf(stderr, "qemu: could not load initrd '%s'\n",
-                        info->initrd_filename);
+                error_report("could not load initrd '%s'",
+                             info->initrd_filename);
                 exit(1);
             }
         } else {
@@ -1021,9 +1021,9 @@ static void arm_load_kernel_notify(Notifier *notifi=
er, void *data)
         } else {
             fixupcontext[FIXUP_ARGPTR] =3D info->loader_start + KERNEL_A=
RGS_ADDR;
             if (info->ram_size >=3D (1ULL << 32)) {
-                fprintf(stderr, "qemu: RAM size must be less than 4GB to=
 boot"
-                        " Linux kernel using ATAGS (try passing a device=
 tree"
-                        " using -dtb)\n");
+                error_report("RAM size must be less than 4GB to boot"
+                             " Linux kernel using ATAGS (try passing a d=
evice tree"
+                             " using -dtb)");
                 exit(1);
             }
         }
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index bba9e9f57a..ea2a3c532d 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -35,6 +35,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
 #include "net/net.h"
@@ -62,8 +63,8 @@ static void connex_init(MachineState *machine)
=20
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
-        fprintf(stderr, "A flash image must be given with the "
-                "'pflash' parameter\n");
+        error_report("A flash image must be given with the "
+                     "'pflash' parameter");
         exit(1);
     }
=20
@@ -76,7 +77,7 @@ static void connex_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL=
,
                                sector_len, connex_rom / sector_len,
                                2, 0, 0, 0, 0, be)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("Error registering flash memory");
         exit(1);
     }
=20
@@ -99,8 +100,8 @@ static void verdex_init(MachineState *machine)
=20
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
-        fprintf(stderr, "A flash image must be given with the "
-                "'pflash' parameter\n");
+        error_report("A flash image must be given with the "
+                     "'pflash' parameter");
         exit(1);
     }
=20
@@ -113,7 +114,7 @@ static void verdex_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL=
,
                                sector_len, verdex_rom / sector_len,
                                2, 0, 0, 0, 0, be)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("Error registering flash memory");
         exit(1);
     }
=20
diff --git a/hw/arm/mainstone.c b/hw/arm/mainstone.c
index d07972a966..4215c025fc 100644
--- a/hw/arm/mainstone.c
+++ b/hw/arm/mainstone.c
@@ -12,6 +12,7 @@
  * GNU GPL, version 2 or (at your option) any later version.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "hw/arm/pxa.h"
@@ -143,8 +144,8 @@ static void mainstone_common_init(MemoryRegion *addre=
ss_space_mem,
             if (qtest_enabled()) {
                 break;
             }
-            fprintf(stderr, "Two flash images must be given with the "
-                    "'pflash' parameter\n");
+            error_report("Two flash images must be given with the "
+                         "'pflash' parameter");
             exit(1);
         }
=20
@@ -154,7 +155,7 @@ static void mainstone_common_init(MemoryRegion *addre=
ss_space_mem,
                                    blk_by_legacy_dinfo(dinfo),
                                    sector_len, MAINSTONE_FLASH / sector_=
len,
                                    4, 0, 0, 0, 0, be)) {
-            fprintf(stderr, "qemu: Error registering flash memory.\n");
+            error_report("Error registering flash memory");
             exit(1);
         }
     }
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index b648770882..06127a873d 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1626,7 +1626,7 @@ static void musicpal_init(MachineState *machine)
         flash_size =3D blk_getlength(blk);
         if (flash_size !=3D 8*1024*1024 && flash_size !=3D 16*1024*1024 =
&&
             flash_size !=3D 32*1024*1024) {
-            fprintf(stderr, "Invalid flash image size\n");
+            error_report("Invalid flash image size");
             exit(1);
         }
=20
diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 92e58f09c8..b3a23a83d1 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -18,6 +18,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -2313,7 +2314,7 @@ void omap_uwire_attach(struct omap_uwire_s *s,
                 uWireSlave *slave, int chipselect)
 {
     if (chipselect < 0 || chipselect > 3) {
-        fprintf(stderr, "%s: Bad chipselect %i\n", __func__, chipselect)=
;
+        error_report("%s: Bad chipselect %i", __func__, chipselect);
         exit(-1);
     }
=20
@@ -3987,7 +3988,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryReg=
ion *system_memory,
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D omap_mmc_init(0xfffb7800, system_memory,
diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
index b53878b8b9..647b119ba9 100644
--- a/hw/arm/omap2.c
+++ b/hw/arm/omap2.c
@@ -19,6 +19,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -2486,7 +2487,7 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRe=
gion *sysmem,
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D omap2_mmc_init(omap_l4tao(s->l4, 9),
diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 9a14270795..eccc19c77b 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -194,7 +194,7 @@ static void sx1_init(MachineState *machine, const int=
 version)
     }
=20
     if (!machine->kernel_filename && !fl_idx && !qtest_enabled()) {
-        fprintf(stderr, "Kernel or Flash image must be specified\n");
+        error_report("Kernel or Flash image must be specified");
         exit(1);
     }
=20
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index db860c238e..5805a2c858 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -8,6 +8,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -2062,7 +2063,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_spac=
e,
     s =3D g_new0(PXA2xxState, 1);
=20
     if (strncmp(cpu_type, "pxa27", 5)) {
-        fprintf(stderr, "Machine requires a PXA27x processor.\n");
+        error_report("Machine requires a PXA27x processor");
         exit(1);
     }
=20
@@ -2095,7 +2096,7 @@ PXA2xxState *pxa270_init(MemoryRegion *address_spac=
e,
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D pxa2xx_mmci_init(address_space, 0x41100000,
@@ -2220,7 +2221,7 @@ PXA2xxState *pxa255_init(MemoryRegion *address_spac=
e, unsigned int sdram_size)
=20
     dinfo =3D drive_get(IF_SD, 0, 0);
     if (!dinfo) {
-        fprintf(stderr, "qemu: missing SecureDigital device\n");
+        error_report("missing SecureDigital device");
         exit(1);
     }
     s->mmc =3D pxa2xx_mmci_init(address_space, 0x41100000,
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index efb5a29475..dc5928ae1a 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -266,7 +266,7 @@ static void a9_daughterboard_init(const VexpressMachi=
neState *vms,
=20
     if (ram_size > 0x40000000) {
         /* 1GB is the maximum the address space permits */
-        fprintf(stderr, "vexpress-a9: cannot model more than 1GB RAM\n")=
;
+        error_report("vexpress-a9: cannot model more than 1GB RAM");
         exit(1);
     }
=20
@@ -355,7 +355,7 @@ static void a15_daughterboard_init(const VexpressMach=
ineState *vms,
          */
         uint64_t rsz =3D ram_size;
         if (rsz > (30ULL * 1024 * 1024 * 1024)) {
-            fprintf(stderr, "vexpress-a15: cannot model more than 30GB R=
AM\n");
+            error_report("vexpress-a15: cannot model more than 30GB RAM"=
);
             exit(1);
         }
     }
@@ -640,7 +640,7 @@ static void vexpress_common_init(MachineState *machin=
e)
     pflash0 =3D ve_pflash_cfi01_register(map[VE_NORFLASH0], "vexpress.fl=
ash0",
                                        dinfo);
     if (!pflash0) {
-        fprintf(stderr, "vexpress: error registering flash 0.\n");
+        error_report("vexpress: error registering flash 0");
         exit(1);
     }
=20
@@ -655,7 +655,7 @@ static void vexpress_common_init(MachineState *machin=
e)
     dinfo =3D drive_get_next(IF_PFLASH);
     if (!ve_pflash_cfi01_register(map[VE_NORFLASH1], "vexpress.flash1",
                                   dinfo)) {
-        fprintf(stderr, "vexpress: error registering flash 1.\n");
+        error_report("vexpress: error registering flash 1");
         exit(1);
     }
=20
diff --git a/hw/arm/z2.c b/hw/arm/z2.c
index 60561c7b7c..2ce3dbde74 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -319,8 +319,8 @@ static void z2_init(MachineState *machine)
 #endif
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
-        fprintf(stderr, "Flash image must be given with the "
-                "'pflash' parameter\n");
+        error_report("Flash image must be given with the "
+                     "'pflash' parameter");
         exit(1);
     }
=20
@@ -329,7 +329,7 @@ static void z2_init(MachineState *machine)
                                dinfo ? blk_by_legacy_dinfo(dinfo) : NULL=
,
                                sector_len, Z2_FLASH_SIZE / sector_len,
                                4, 0, 0, 0, 0, be)) {
-        fprintf(stderr, "qemu: Error registering flash memory.\n");
+        error_report("Error registering flash memory");
         exit(1);
     }
=20
--=20
2.13.6

