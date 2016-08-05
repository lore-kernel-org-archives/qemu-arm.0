Received: by 10.25.21.156 with SMTP id 28csp1732583lfv;
        Fri, 5 Aug 2016 03:28:16 -0700 (PDT)
X-Received: by 10.200.34.53 with SMTP id o50mr11766449qto.130.1470392896345;
        Fri, 05 Aug 2016 03:28:16 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f1si11126454qtf.151.2016.08.05.03.28.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Aug 2016 03:28:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bVcMK-0007ql-Sx
	for alex.bennee@linaro.org; Fri, 05 Aug 2016 06:28:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bVcEV-0007mm-0i
	for qemu-devel@nongnu.org; Fri, 05 Aug 2016 06:20:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bVcER-0007P5-Ox
	for qemu-devel@nongnu.org; Fri, 05 Aug 2016 06:20:02 -0400
Received: from mga02.intel.com ([134.134.136.20]:13748)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>)
	id 1bVcER-0007OG-EY; Fri, 05 Aug 2016 06:19:59 -0400
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2016 03:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,473,1464678000"; d="scan'208";a="1020171122"
Received: from lvzheng-z530.sh.intel.com ([10.239.159.130])
	by fmsmga001.fm.intel.com with ESMTP; 05 Aug 2016 03:19:56 -0700
From: Lv Zheng <lv.zheng@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>
Date: Fri,  5 Aug 2016 18:19:39 +0800
Message-Id: <24044757332cd427e378053739e6f49980e0ac5d.1470392366.git.lv.zheng@intel.com>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-devel] [PATCH] debugcon: Add -debugport option to allow
 changing debug console port number
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
Cc: qemu-arm@nongnu.org, Lv Zheng <lv.zheng@intel.com>,
	Lv Zheng <zetalog@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iTjdwYcIKNXQ

Changing debugcon port to 0x402 allows the seabios AML table pre-defined
DBUG() control method to be able to dump the AML debugging information to
the re-directed debugging console.

If the debug port number is configurable, users can further specify a
proper IO port number for it to make external BIOS's debugging
facility functioning.

Signed-off-by: Lv Zheng <lv.zheng@intel.com>
---
 hw/char/debugcon.c      |    4 ++++
 hw/i386/acpi-build.c    |    3 ++-
 include/sysemu/sysemu.h |    1 +
 qemu-options.hx         |    9 +++++++++
 vl.c                    |   15 +++++++++++++++
 5 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/char/debugcon.c b/hw/char/debugcon.c
index e7f025e..f966a09 100644
--- a/hw/char/debugcon.c
+++ b/hw/char/debugcon.c
@@ -105,6 +105,10 @@ static void debugcon_isa_realizefn(DeviceState *dev, Error **errp)
         error_propagate(errp, err);
         return;
     }
+    if (debug_port != 0xe9) {
+        qdev_prop_set_uint32(dev, "iobase", debug_port);
+        qdev_prop_set_uint32(dev, "readback", debug_port);
+    }
     memory_region_init_io(&s->io, OBJECT(dev), &debugcon_ops, s,
                           TYPE_ISA_DEBUGCON_DEVICE, 1);
     memory_region_add_subregion(isa_address_space_io(d),
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a26a4bb..14c6224 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1442,7 +1442,8 @@ static void build_dbg_aml(Aml *table)
     Aml *idx = aml_local(2);
 
     aml_append(scope,
-       aml_operation_region("DBG", AML_SYSTEM_IO, aml_int(0x0402), 0x01));
+       aml_operation_region("DBG", AML_SYSTEM_IO,
+                            aml_int(debug_port), 0x01));
     field = aml_field("DBG", AML_BYTE_ACC, AML_NOLOCK, AML_PRESERVE);
     aml_append(field, aml_named_field("DBGB", 8));
     aml_append(scope, field);
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index ee7c760..9e0a30b 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -167,6 +167,7 @@ extern uint8_t qemu_extra_params_fw[2];
 extern QEMUClockType rtc_clock;
 extern const char *mem_path;
 extern int mem_prealloc;
+extern uint32_t debug_port;
 
 #define MAX_NODES 128
 #define NUMA_NODE_UNASSIGNED MAX_NODES
diff --git a/qemu-options.hx b/qemu-options.hx
index a71aaf8..05aedce 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3123,6 +3123,15 @@ The default device is @code{vc} in graphical mode and @code{stdio} in
 non graphical mode.
 ETEXI
 
+DEF("debugport", HAS_ARG, QEMU_OPTION_debugport, \
+    "-debugport n     Specify debug IO port number\n",
+    QEMU_ARCH_ALL)
+STEXI
+@item -debugport @var{n}
+@findex -debugport
+Specify the debug IO port number, default is 0xe9.
+ETEXI
+
 DEF("pidfile", HAS_ARG, QEMU_OPTION_pidfile, \
     "-pidfile file   write PID to 'file'\n", QEMU_ARCH_ALL)
 STEXI
diff --git a/vl.c b/vl.c
index e7c2c62..710e14d 100644
--- a/vl.c
+++ b/vl.c
@@ -178,6 +178,7 @@ bool boot_strict;
 uint8_t *boot_splash_filedata;
 size_t boot_splash_filedata_size;
 uint8_t qemu_extra_params_fw[2];
+uint32_t debug_port = 0xe9;
 
 int icount_align_option;
 
@@ -2584,6 +2585,17 @@ static int debugcon_parse(const char *devname)
     return 0;
 }
 
+static void debugcon_parse_port(const char *arg)
+{
+    uint32_t port;
+
+    port = strtoul(arg, NULL, 0);
+    if (port) {
+        printf("Re-assign debug console to port 0x%08x.\n", port);
+        debug_port = port;
+    }
+}
+
 static gint machine_class_cmp(gconstpointer a, gconstpointer b)
 {
     const MachineClass *mc1 = a, *mc2 = b;
@@ -3580,6 +3592,9 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_debugcon:
                 add_device_config(DEV_DEBUGCON, optarg);
                 break;
+            case QEMU_OPTION_debugport:
+                debugcon_parse_port(optarg);
+                break;
             case QEMU_OPTION_loadvm:
                 loadvm = optarg;
                 break;
-- 
1.7.10

