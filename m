Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3459486ejb;
        Mon, 19 Dec 2022 05:02:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6cE6w+2pys7p7qtfi9yH0ncfx//ESz5T7/vGStttmtuN7qbgj8x2AjSns7cHfJfxrP9KGZ
X-Received: by 2002:a05:6870:4510:b0:148:3341:5249 with SMTP id e16-20020a056870451000b0014833415249mr15014638oao.22.1671454948515;
        Mon, 19 Dec 2022 05:02:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671454948; cv=none;
        d=google.com; s=arc-20160816;
        b=vMD83mqMNsmIfRBkV2Z7U9AAljl8U0ProeYH+PRCKGft5pSA079ojsP70DfUr5x65j
         YlKtBNVLOEqjXapRPrl/0ya60RMVgXtV3aa4CJFYCdv9EUtcjGp9GVITVzxvTSwqwOON
         kkE/hdd4UV9ctR1bCdMdho7W1BpKn68wksSrT5mXB/2iXmtoTWsZ6AVwx2dvg9ESXfqy
         lwEYyJOx3Vrp+4iDi3/NXO97vHs74SdrqCHjpVJL95I+X3PE88HzlgCTve0778mdokwL
         3pvbSyiTjCpu0ZG+hZHxDP95gkvouq0Al6d7CL38XyNjrIIF9ZsHcn94aBhDe4itGlOF
         bbBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Xw+ckm/z8iJE0gLdoGtXCV/KPvsOLIutcQtOkVGM3AI=;
        b=tPrncgf0XyTqEwWFBRHMpk0Oq/SluBn3vsdY5VIGq2Iza/EEob6wPZzBAVNSRKZRt+
         u2rhiu36aYPtvkxf5iEepX7gjaXHpqfIKV2gavOEZdO2kj4o0x4AoVHXmrPNz+DxU24g
         25HbQ7Z2SVuaGYodLKutbdUqdzvURs57t53Yf3I24gAPtlSoL+TmKELHOmDW350ZDREw
         0w9DGL4+Jbhd2DrmYPXnapH335A+9ZLk8aXAAW3iTaFLjPh2WnXCvdMuXjwWNL5GDwqT
         NdPxQHy2nE/CUVMrQORzfotQf047nmKpA75mV53hJeifT+JCKvAwbqC8iV3SJA8GM16c
         zT0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KEqh1on4;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id fb15-20020a05622a480f00b003a97c56d020si2818013qtb.364.2022.12.19.05.02.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 05:02:28 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KEqh1on4;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671454948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xw+ckm/z8iJE0gLdoGtXCV/KPvsOLIutcQtOkVGM3AI=;
	b=KEqh1on4pcp0jLoyK9C0THlgm334upuxZMy0J8Vi/m4ayL0KxRlsg+isZpLk5y20rOSUWl
	mjyt0EajS7QFJyEdlU85/6sTq7P40BkcRNw05wTWW4yNMLw+3F23qqtN5flSw14sQU01Ly
	PqTrRS1SvYAGwiq2B2cLpbCLDmmx0vY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-_H72VPWrOC2TXqiPzts5tA-1; Mon, 19 Dec 2022 08:02:24 -0500
X-MC-Unique: _H72VPWrOC2TXqiPzts5tA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D95C2806078;
	Mon, 19 Dec 2022 13:02:10 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C551E14171BA;
	Mon, 19 Dec 2022 13:02:09 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	Laurent Vivier <lvivier@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	virtio-fs@redhat.com,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	John Snow <jsnow@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 5/6] tests: add G_GNUC_PRINTF for various functions
Date: Mon, 19 Dec 2022 08:02:04 -0500
Message-Id: <20221219130205.687815-6-berrange@redhat.com>
In-Reply-To: <20221219130205.687815-1-berrange@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: Gg57thV8J0/g

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/ahci-test.c           |  3 +++
 tests/qtest/arm-cpu-features.c    |  1 +
 tests/qtest/erst-test.c           |  2 +-
 tests/qtest/ide-test.c            |  3 ++-
 tests/qtest/ivshmem-test.c        |  4 ++--
 tests/qtest/libqmp.c              |  2 +-
 tests/qtest/libqos/libqos-pc.h    |  6 ++++--
 tests/qtest/libqos/libqos-spapr.h |  6 ++++--
 tests/qtest/libqos/libqos.h       |  6 ++++--
 tests/qtest/libqos/virtio-9p.c    |  1 +
 tests/qtest/migration-helpers.h   |  1 +
 tests/qtest/rtas-test.c           |  2 +-
 tests/qtest/usb-hcd-uhci-test.c   |  4 ++--
 tests/unit/test-qmp-cmds.c        | 13 +++++++++----
 14 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index 66652fed04..1967cd5898 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -154,6 +154,7 @@ static void ahci_migrate(AHCIQState *from, AHCIQState *to, const char *uri)
 /**
  * Start a Q35 machine and bookmark a handle to the AHCI device.
  */
+G_GNUC_PRINTF(1, 0)
 static AHCIQState *ahci_vboot(const char *cli, va_list ap)
 {
     AHCIQState *s;
@@ -171,6 +172,7 @@ static AHCIQState *ahci_vboot(const char *cli, va_list ap)
 /**
  * Start a Q35 machine and bookmark a handle to the AHCI device.
  */
+G_GNUC_PRINTF(1, 2)
 static AHCIQState *ahci_boot(const char *cli, ...)
 {
     AHCIQState *s;
@@ -209,6 +211,7 @@ static void ahci_shutdown(AHCIQState *ahci)
  * Boot and fully enable the HBA device.
  * @see ahci_boot, ahci_pci_enable and ahci_hba_enable.
  */
+G_GNUC_PRINTF(1, 2)
 static AHCIQState *ahci_boot_and_enable(const char *cli, ...)
 {
     AHCIQState *ahci;
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 5a14527386..8691802950 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -32,6 +32,7 @@ static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
                           QUERY_TAIL, cpu_type);
 }
 
+G_GNUC_PRINTF(3, 4)
 static QDict *do_query(QTestState *qts, const char *cpu_type,
                        const char *fmt, ...)
 {
diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
index 974e8bcfe5..c45bee7f05 100644
--- a/tests/qtest/erst-test.c
+++ b/tests/qtest/erst-test.c
@@ -98,7 +98,7 @@ static void setup_vm_cmd(ERSTState *s, const char *cmd)
     const char *arch = qtest_get_arch();
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
-        s->qs = qtest_pc_boot(cmd);
+        s->qs = qtest_pc_boot("%s", cmd);
     } else {
         g_printerr("erst-test tests are only available on x86\n");
         exit(EXIT_FAILURE);
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index dbe1563b23..dcb050bf9b 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -125,6 +125,7 @@ static QGuestAllocator guest_malloc;
 static char *tmp_path[2];
 static char *debug_path;
 
+G_GNUC_PRINTF(1, 2)
 static QTestState *ide_test_start(const char *cmdline_fmt, ...)
 {
     QTestState *qts;
@@ -788,7 +789,7 @@ static void test_flush_nodev(void)
     QPCIDevice *dev;
     QPCIBar bmdma_bar, ide_bar;
 
-    qts = ide_test_start("");
+    qts = ide_test_start("%s", "");
 
     dev = get_pci_device(qts, &bmdma_bar, &ide_bar);
 
diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index cd550c8935..9bf8e78df6 100644
--- a/tests/qtest/ivshmem-test.c
+++ b/tests/qtest/ivshmem-test.c
@@ -109,9 +109,9 @@ static void setup_vm_cmd(IVState *s, const char *cmd, bool msix)
     const char *arch = qtest_get_arch();
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
-        s->qs = qtest_pc_boot(cmd);
+        s->qs = qtest_pc_boot("%s", cmd);
     } else if (strcmp(arch, "ppc64") == 0) {
-        s->qs = qtest_spapr_boot(cmd);
+        s->qs = qtest_spapr_boot("%s", cmd);
     } else {
         g_printerr("ivshmem-test tests are only available on x86 or ppc64\n");
         exit(EXIT_FAILURE);
diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
index 2b08382e5d..a89cab03c3 100644
--- a/tests/qtest/libqmp.c
+++ b/tests/qtest/libqmp.c
@@ -134,7 +134,7 @@ static void socket_send_fds(int socket_fd, int *fds, size_t fds_num,
  * in the case that they choose to discard all replies up until
  * a particular EVENT is received.
  */
-static void
+static G_GNUC_PRINTF(4, 0) void
 _qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
                   const char *fmt, va_list ap)
 {
diff --git a/tests/qtest/libqos/libqos-pc.h b/tests/qtest/libqos/libqos-pc.h
index 1a9923ead4..a2e4209a49 100644
--- a/tests/qtest/libqos/libqos-pc.h
+++ b/tests/qtest/libqos/libqos-pc.h
@@ -3,8 +3,10 @@
 
 #include "libqos.h"
 
-QOSState *qtest_pc_vboot(const char *cmdline_fmt, va_list ap);
-QOSState *qtest_pc_boot(const char *cmdline_fmt, ...);
+QOSState *qtest_pc_vboot(const char *cmdline_fmt, va_list ap)
+    G_GNUC_PRINTF(1, 0);
+QOSState *qtest_pc_boot(const char *cmdline_fmt, ...)
+    G_GNUC_PRINTF(1, 2);
 void qtest_pc_shutdown(QOSState *qs);
 
 #endif
diff --git a/tests/qtest/libqos/libqos-spapr.h b/tests/qtest/libqos/libqos-spapr.h
index c61338917a..e4483c14f8 100644
--- a/tests/qtest/libqos/libqos-spapr.h
+++ b/tests/qtest/libqos/libqos-spapr.h
@@ -3,8 +3,10 @@
 
 #include "libqos.h"
 
-QOSState *qtest_spapr_vboot(const char *cmdline_fmt, va_list ap);
-QOSState *qtest_spapr_boot(const char *cmdline_fmt, ...);
+QOSState *qtest_spapr_vboot(const char *cmdline_fmt, va_list ap)
+    G_GNUC_PRINTF(1, 0);
+QOSState *qtest_spapr_boot(const char *cmdline_fmt, ...)
+    G_GNUC_PRINTF(1, 2);
 void qtest_spapr_shutdown(QOSState *qs);
 
 /* List of capabilities needed to silence warnings with TCG */
diff --git a/tests/qtest/libqos/libqos.h b/tests/qtest/libqos/libqos.h
index 9b4dd509f0..12d05b2365 100644
--- a/tests/qtest/libqos/libqos.h
+++ b/tests/qtest/libqos/libqos.h
@@ -21,8 +21,10 @@ struct QOSState {
     QOSOps *ops;
 };
 
-QOSState *qtest_vboot(QOSOps *ops, const char *cmdline_fmt, va_list ap);
-QOSState *qtest_boot(QOSOps *ops, const char *cmdline_fmt, ...);
+QOSState *qtest_vboot(QOSOps *ops, const char *cmdline_fmt, va_list ap)
+    G_GNUC_PRINTF(2, 0);
+QOSState *qtest_boot(QOSOps *ops, const char *cmdline_fmt, ...)
+    G_GNUC_PRINTF(2, 3);
 void qtest_common_shutdown(QOSState *qs);
 void qtest_shutdown(QOSState *qs);
 bool have_qemu_img(void);
diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index 7f21028256..186fcc1141 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -211,6 +211,7 @@ static void *virtio_9p_pci_create(void *pci_bus, QGuestAllocator *t_alloc,
  *                      variable arguments of this function to this
  *                      replacement string
  */
+G_GNUC_PRINTF(3, 4)
 static void regex_replace(GString *haystack, const char *pattern,
                           const char *replace_fmt, ...)
 {
diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
index db0684de48..a188b62787 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -25,6 +25,7 @@ QDict *wait_command_fd(QTestState *who, int fd, const char *command, ...);
 G_GNUC_PRINTF(2, 3)
 QDict *wait_command(QTestState *who, const char *command, ...);
 
+G_GNUC_PRINTF(2, 3)
 QDict *qmp_command(QTestState *who, const char *command, ...);
 
 G_GNUC_PRINTF(3, 4)
diff --git a/tests/qtest/rtas-test.c b/tests/qtest/rtas-test.c
index 50df60e5b2..1ba42b37d2 100644
--- a/tests/qtest/rtas-test.c
+++ b/tests/qtest/rtas-test.c
@@ -13,7 +13,7 @@ static void run_test_rtas_get_time_of_day(const char *machine)
     uint64_t ret;
     time_t t1, t2;
 
-    qs = qtest_spapr_boot(machine);
+    qs = qtest_spapr_boot("%s", machine);
 
     t1 = time(NULL);
     ret = qrtas_get_time_of_day(qs->qts, &qs->alloc, &tm, &ns);
diff --git a/tests/qtest/usb-hcd-uhci-test.c b/tests/qtest/usb-hcd-uhci-test.c
index 7a117b64d9..f264d2bf73 100644
--- a/tests/qtest/usb-hcd-uhci-test.c
+++ b/tests/qtest/usb-hcd-uhci-test.c
@@ -72,9 +72,9 @@ int main(int argc, char **argv)
     qtest_add_func("/uhci/pci/hotplug/usb-storage", test_usb_storage_hotplug);
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
-        qs = qtest_pc_boot(cmd);
+        qs = qtest_pc_boot("%s", cmd);
     } else if (strcmp(arch, "ppc64") == 0) {
-        qs = qtest_spapr_boot(cmd);
+        qs = qtest_spapr_boot("%s", cmd);
     } else {
         g_printerr("usb-hcd-uhci-test tests are only "
                    "available on x86 or ppc64\n");
diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index 2373cd64cb..6d52b4e5d8 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -138,6 +138,7 @@ void qmp___org_qemu_x_command(__org_qemu_x_EnumList *a,
 }
 
 
+G_GNUC_PRINTF(2, 3)
 static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
 {
     va_list ap;
@@ -160,6 +161,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
     return ret;
 }
 
+G_GNUC_PRINTF(3, 4)
 static void do_qmp_dispatch_error(bool allow_oob, ErrorClass cls,
                                   const char *template, ...)
 {
@@ -269,7 +271,7 @@ static void test_dispatch_cmd_io(void)
 
 static void test_dispatch_cmd_deprecated(void)
 {
-    const char *cmd = "{ 'execute': 'test-command-features1' }";
+    #define cmd "{ 'execute': 'test-command-features1' }"
     QDict *ret;
 
     memset(&compat_policy, 0, sizeof(compat_policy));
@@ -287,12 +289,13 @@ static void test_dispatch_cmd_deprecated(void)
 
     compat_policy.deprecated_input = COMPAT_POLICY_INPUT_REJECT;
     do_qmp_dispatch_error(false, ERROR_CLASS_COMMAND_NOT_FOUND, cmd);
+    #undef cmd
 }
 
 static void test_dispatch_cmd_arg_deprecated(void)
 {
-    const char *cmd = "{ 'execute': 'test-features0',"
-        " 'arguments': { 'fs1': { 'foo': 42 } } }";
+    #define cmd "{ 'execute': 'test-features0'," \
+        " 'arguments': { 'fs1': { 'foo': 42 } } }"
     QDict *ret;
 
     memset(&compat_policy, 0, sizeof(compat_policy));
@@ -310,11 +313,12 @@ static void test_dispatch_cmd_arg_deprecated(void)
 
     compat_policy.deprecated_input = COMPAT_POLICY_INPUT_REJECT;
     do_qmp_dispatch_error(false, ERROR_CLASS_GENERIC_ERROR, cmd);
+    #undef cmd
 }
 
 static void test_dispatch_cmd_ret_deprecated(void)
 {
-    const char *cmd = "{ 'execute': 'test-features0' }";
+    #define cmd "{ 'execute': 'test-features0' }"
     QDict *ret;
 
     memset(&compat_policy, 0, sizeof(compat_policy));
@@ -334,6 +338,7 @@ static void test_dispatch_cmd_ret_deprecated(void)
     ret = qobject_to(QDict, do_qmp_dispatch(false, cmd));
     assert(ret && qdict_size(ret) == 0);
     qobject_unref(ret);
+    #undef cmd
 }
 
 /* test generated dealloc functions for generated types */
-- 
2.38.1
