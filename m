Received: by 10.28.71.27 with SMTP id u27csp4241191wma;
        Tue, 6 Feb 2018 12:35:00 -0800 (PST)
X-Google-Smtp-Source: AH8x224Ke0iylH8hcQMMabE7rD8i3piBONF0+0pk1vUPixMqA/9yzyFESRbM3xPCZOvEg/eDXMdP
X-Received: by 10.37.202.145 with SMTP id a139mr2372307ybg.19.1517949300563;
        Tue, 06 Feb 2018 12:35:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517949300; cv=none;
        d=google.com; s=arc-20160816;
        b=xXypwgDLcf9MWKi4CcgpdER4f127oWAFxqgoxItx+RBn+1nU5HI4C44/a1WuxayrHX
         CXezWeh1FW6iB3vU8WG7lkfCBgwDGpbuxhkI6FXG2INQNuKHiabu0M7aLSJsBd6kxTEQ
         s6SE9mj8iUnHhwf8tZQMvzyy6oEedYHDOwo3wCpQIJN9iEIsmF+a7/kzOt4QKZGdCSmf
         wSTpFrLoCwJOsY53FGH5RAdIzjGWk6MwmJDcndElgIXjz24gRmnlZXhnBGhJoZs022/6
         Rdk1OnDdhh4+uLiMHJEfKx9EgIf5gBgYr2LmS0AzZiw67/WaZHRiZL7QXhbuNv1m/RbD
         z4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=vSezeOqHfRGZW6SMCYSsuMoTYrtlzU8NEtIoHq6kuYY=;
        b=mdrK3wftRSiYlHpZhfGMaBTsgONULp6Nu2k5LQB3wUKAW/e8IWVneCzicL9x4Ul0Bi
         l6/9qdC+JvV0x7GXWeu5hH2sRF2fRNVDBxwWLncQ37FvEgvc9cI5A9WFo7iJLY2nJNQO
         eCu7mq7/DEyFsG+2brzSMjEAXM3KX68bV0IQnmucTZziUJk0Mg/dc6G2nVndCK/3w19I
         hoY5b6VCkDiSljU0vHyDKJunQsiCmb1oDvFNmPMPdmT3ypG8l5NgieIg0q5SvYDI6KVw
         hFk1Z3Ah55kMuGfm3M0xjaSFJW/+lGte3UFXSoZKqUuIiIA6Uos+6Cs0PJwj6ix41vnI
         O6Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y187si1916624ywc.512.2018.02.06.12.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 12:35:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ej9xD-0004am-T6
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 15:34:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ej9Gg-0003DO-OO
	for qemu-devel@nongnu.org; Tue, 06 Feb 2018 14:51:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ej9Ge-00042r-91
	for qemu-devel@nongnu.org; Tue, 06 Feb 2018 14:51:02 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35238 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1ej9GW-0003ri-IB; Tue, 06 Feb 2018 14:50:52 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 578358182D04;
	Tue,  6 Feb 2018 19:50:49 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
	[10.36.116.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E54522166BB6;
	Tue,  6 Feb 2018 19:50:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C14AC113864A; Tue,  6 Feb 2018 20:50:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Feb 2018 20:50:33 +0100
Message-Id: <20180206195044.8347-4-armbru@redhat.com>
In-Reply-To: <20180206195044.8347-1-armbru@redhat.com>
References: <20180206195044.8347-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 06 Feb 2018 19:50:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 06 Feb 2018 19:50:49 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'armbru@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PULL 03/14] hw/arm: Replace fprintf(stderr,
 "*\n" with error_report()
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
Cc: qemu-arm@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zNpGgjspTdAh

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
Message-Id: <20180203084315.20497-3-armbru@redhat.com>
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
index 4172caf5db..38d7322a19 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1627,7 +1627,7 @@ static void musicpal_init(MachineState *machine)
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
index 300e933c82..730a5392e9 100644
--- a/hw/arm/z2.c
+++ b/hw/arm/z2.c
@@ -320,8 +320,8 @@ static void z2_init(MachineState *machine)
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
@@ -330,7 +330,7 @@ static void z2_init(MachineState *machine)
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

