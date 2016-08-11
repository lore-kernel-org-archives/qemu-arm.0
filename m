Received: by 10.25.21.156 with SMTP id 28csp21949lfv;
        Thu, 11 Aug 2016 02:06:51 -0700 (PDT)
X-Received: by 10.55.154.131 with SMTP id c125mr10026169qke.33.1470906411022;
        Thu, 11 Aug 2016 02:06:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id a195si996655qkc.87.2016.08.11.02.06.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 02:06:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXlww-0006gL-Ez
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 05:06:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bXlwr-0006eS-R4
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 05:06:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bXlwq-0005BJ-Bg
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 05:06:45 -0400
Received: from mga14.intel.com ([192.55.52.115]:14837)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>)
	id 1bXlwk-0005AE-UI; Thu, 11 Aug 2016 05:06:39 -0400
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 11 Aug 2016 02:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,504,1464678000"; d="scan'208";a="1033693119"
Received: from unknown (HELO lvzheng-z530.sh.intel.com) ([10.239.159.146])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2016 02:06:36 -0700
From: Lv Zheng <lv.zheng@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
Date: Thu, 11 Aug 2016 17:06:29 +0800
Message-Id: <25399168767b1467307267f54c2bd813d177a1d9.1470905888.git.lv.zheng@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1470905888.git.lv.zheng@intel.com>
References: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
	<cover.1470905888.git.lv.zheng@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-arm] [PATCH v3 1/2] ACPI: Cleanup -acpitable option code
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
Cc: qemu-arm@nongnu.org, Lv Zheng <lv.zheng@intel.com>,
	Lv Zheng <zetalog@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GvJhLoo1xB82

In -acpitable options, at least/most one data/file sub-option is mandatory,
this patch cleans up the code to reflect this in a managed manner so that
the follow-up mandatory sub-options can be added to -acpitable.

Signed-off-by: Lv Zheng <lv.zheng@intel.com>
---
 hw/acpi/core.c   |   32 +++++++++++++++++++++++---------
 qapi-schema.json |   27 ++++++++-------------------
 qemu-options.hx  |    7 +++++--
 3 files changed, 36 insertions(+), 30 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index e890a5d..cd1f9e4 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -89,8 +89,6 @@ static int acpi_checksum(const uint8_t *data, int len)
  * It is valid to call this function with
  * (@blob == NULL && bloblen == 0 && !has_header).
  *
- * @hdrs->file and @hdrs->data are ignored.
- *
  * SIZE_MAX is considered "infinity" in this function.
  *
  * The number of tables that can be installed is not limited, but the 16-bit
@@ -229,7 +227,8 @@ static void acpi_table_install(const char unsigned *blob, size_t bloblen,
                                       ACPI_TABLE_PFX_SIZE, acpi_payload_size);
 }
 
-void acpi_table_add(const QemuOpts *opts, Error **errp)
+static void acpi_table_from_file(bool has_header, const char *file,
+                                 AcpiTableOptions *hdrs, Error **errp)
 {
     AcpiTableOptions *hdrs = NULL;
     Error *err = NULL;
@@ -249,12 +248,8 @@ void acpi_table_add(const QemuOpts *opts, Error **errp)
     if (err) {
         goto out;
     }
-    if (hdrs->has_file == hdrs->has_data) {
-        error_setg(&err, "'-acpitable' requires one of 'data' or 'file'");
-        goto out;
-    }
 
-    pathnames = g_strsplit(hdrs->has_file ? hdrs->file : hdrs->data, ":", 0);
+    pathnames = g_strsplit(file, ":", 0);
     if (pathnames == NULL || pathnames[0] == NULL) {
         error_setg(&err, "'-acpitable' requires at least one pathname");
         goto out;
@@ -291,7 +286,7 @@ void acpi_table_add(const QemuOpts *opts, Error **errp)
         close(fd);
     }
 
-    acpi_table_install(blob, bloblen, hdrs->has_file, hdrs, &err);
+    acpi_table_install(blob, bloblen, has_header, hdrs, &err);
 
 out:
     g_free(blob);
@@ -301,6 +296,25 @@ out:
     error_propagate(errp, err);
 }
 
+void acpi_table_add(const QemuOpts *opts, Error **errp)
+{
+    const char *val;
+
+    val = qemu_opt_get((QemuOpts *)opts, "file");
+    if (val) {
+        acpi_table_from_file(true, val, hdrs, errp);
+        return;
+    }
+
+    val = qemu_opt_get((QemuOpts *)opts, "data");
+    if (val) {
+        acpi_table_from_file(false, val, hdrs, errp);
+        return;
+    }
+
+    error_setg(errp, "'-acpitable' requires one of 'data' or 'file'");
+}
+
 static bool acpi_table_builtin = false;
 
 void acpi_table_add_builtin(const QemuOpts *opts, Error **errp)
diff --git a/qapi-schema.json b/qapi-schema.json
index 5658723..a5e219f 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -3597,17 +3597,18 @@
 ##
 # @AcpiTableOptions
 #
-# Specify an ACPI table on the command line to load.
+# Specify ACPI table options for the table loaded on the command line.
 #
-# At most one of @file and @data can be specified. The list of files specified
-# by any one of them is loaded and concatenated in order. If both are omitted,
-# @data is implied.
+# ACPI table can be loaded via 'file' and 'data' options. At most one of
+# 'file' and 'data' can be specified. The list of files specified by any one
+# of them is loaded and concatenated in order. If both # are omitted, 'data'
+# is implied.
 #
 # Other fields / optargs can be used to override fields of the generic ACPI
 # table header; refer to the ACPI specification 5.0, section 5.2.6 System
 # Description Table Header. If a header field is not overridden, then the
-# corresponding value from the concatenated blob is used (in case of @file), or
-# it is filled in with a hard-coded value (in case of @data).
+# corresponding value from the concatenated blob is used (in case of 'file'),
+# or it is filled in with a hard-coded value (in case of 'data').
 #
 # String fields are copied into the matching ACPI member from lowest address
 # upwards, and silently truncated / NUL-padded to length.
@@ -3628,16 +3629,6 @@
 # @asl_compiler_rev: #optional revision number of the utility that created the
 #                    table (4 bytes)
 #
-# @file: #optional colon (:) separated list of pathnames to load and
-#        concatenate as table data. The resultant binary blob is expected to
-#        have an ACPI table header. At least one file is required. This field
-#        excludes @data.
-#
-# @data: #optional colon (:) separated list of pathnames to load and
-#        concatenate as table data. The resultant binary blob must not have an
-#        ACPI table header. At least one file is required. This field excludes
-#        @file.
-#
 # Since 1.5
 ##
 { 'struct': 'AcpiTableOptions',
@@ -3648,9 +3639,7 @@
     '*oem_table_id':      'str',
     '*oem_rev':           'uint32',
     '*asl_compiler_id':   'str',
-    '*asl_compiler_rev':  'uint32',
-    '*file':              'str',
-    '*data':              'str' }}
+    '*asl_compiler_rev':  'uint32' }}
 
 ##
 # @CommandLineParameterType:
diff --git a/qemu-options.hx b/qemu-options.hx
index a71aaf8..5fe7f87 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1493,10 +1493,13 @@ Disable HPET support.
 ETEXI
 
 DEF("acpitable", HAS_ARG, QEMU_OPTION_acpitable,
-    "-acpitable [sig=str][,rev=n][,oem_id=str][,oem_table_id=str][,oem_rev=n][,asl_compiler_id=str][,asl_compiler_rev=n][,{data|file}=file1[:file2]...]\n"
+    "-acpitable {data|file}=file1[:file2]...\n"
+    "             [,sig=str][,rev=n]\n"
+    "             [,oem_id=str][,oem_table_id=str][,oem_rev=n]\n"
+    "             [,asl_compiler_id=str][,asl_compiler_rev=n]\n"
     "                ACPI table description\n", QEMU_ARCH_I386)
 STEXI
-@item -acpitable [sig=@var{str}][,rev=@var{n}][,oem_id=@var{str}][,oem_table_id=@var{str}][,oem_rev=@var{n}] [,asl_compiler_id=@var{str}][,asl_compiler_rev=@var{n}][,data=@var{file1}[:@var{file2}]...]
+@item -acpitable data=@var{file1}[:@var{file2}]...[,sig=@var{str}][,rev=@var{n}][,oem_id=@var{str}][,oem_table_id=@var{str}][,oem_rev=@var{n}] [,asl_compiler_id=@var{str}][,asl_compiler_rev=@var{n}]
 @findex -acpitable
 Add ACPI table with specified header fields and context from specified files.
 For file=, take whole ACPI table from the specified files, including all
-- 
1.7.10

