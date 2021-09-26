Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3159437lfp;
        Sun, 26 Sep 2021 11:35:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuh/k3XBMrDKO/WkWcvBiKh/Vzu/GWbstDhZFalXwlPEJSK8cZJQhVa0KVDJtzN+QCLE11
X-Received: by 2002:a92:c546:: with SMTP id a6mr16941739ilj.173.1632681315241;
        Sun, 26 Sep 2021 11:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632681315; cv=none;
        d=google.com; s=arc-20160816;
        b=B15DnE/kdpO4d50dxa+malxihY2jVFs3OI0tr0dP0YMXx/gzoodavJRriavCfKXWNG
         ezzFz48xZc+UKr8Bv8Y8gHmR9J6wZVKdwdsJ6PSH/G1697pVA9jp8CdLdZSxNPopEdsu
         irWFmjZgoIwV7qODahe8d1OPqHvdcqBwcU3tGCBZ+V4t78qtngGGIwoBhAx+OdpAwkmZ
         GxBAsrT1FSDKpcUQmeWk0EY1gjAxL4idl58CliZDPn5PoPURmxnBt7rMP1rKITXBvFw5
         W6904ezHi8ruJxzLhNtEkxtXwbRCqjahOUZtNMeXaW68YuORdAac/5Nk82r2gVN/LwNf
         dQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=9OAFYCrI5+ArcbMdKXxW6jvIYMUAg7MBmVvuHLTFM+s=;
        b=p0F89nDXID4WqgCeTf0ZFMrd79shyavEWU3jkgdnpotpwEipLRy8QxfLw+FE6DKanV
         IR3HjQaRZgP0czYxlCbiP7amUauOOYHCPQ0VCYJkUo3uPRaZLsohQRuD3BP1blbdTkHV
         OHsdUKX6MVIbwARAT8BrlRRx8s9R+FcPodC2aUt2uzBahqdaj5AIrghRIlQNu8gEBGec
         DhFlp/Qh4YWPGVV9tR73895VQrhk0oyKO9Rra5IAuCC7eSuJo8TTXxNReKsddRo0I08P
         R4/HL1f8qfs4/J2gG7CKWaRb4Kbkb6jx2aBeld2weuIHwewPj8j1u1h5ntek/GYC3LkL
         Re8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@chromium.org header.s=google header.b=PCJaPBqi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=chromium.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f26si17003424iog.53.2021.09.26.11.35.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Sep 2021 11:35:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@chromium.org header.s=google header.b=PCJaPBqi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=chromium.org
Received: from localhost ([::1]:57396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUYza-0000qg-Ic
	for alex.bennee@linaro.org; Sun, 26 Sep 2021 14:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1mUYz4-0000pJ-Ac
 for qemu-arm@nongnu.org; Sun, 26 Sep 2021 14:34:43 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:36715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1mUYz2-0005Gn-EH
 for qemu-arm@nongnu.org; Sun, 26 Sep 2021 14:34:42 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so21310252otx.3
 for <qemu-arm@nongnu.org>; Sun, 26 Sep 2021 11:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9OAFYCrI5+ArcbMdKXxW6jvIYMUAg7MBmVvuHLTFM+s=;
 b=PCJaPBqi2E2k+uW/drj++dEy1WRxq+TakFxziq3ujUmYMPUE2Nm2elookQKxQY4voS
 Bg++xy/CEECh30xsJLPM0IpWYYcciQliygobCT4+sSCjJiV+3CIKgzVQTiva7nZ7GGBa
 6inw32bXCXWUTPF86SK8AfHQbw15WHkjXBV+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9OAFYCrI5+ArcbMdKXxW6jvIYMUAg7MBmVvuHLTFM+s=;
 b=jtHs9E1ijqxeSTmGBSCkSA4JyXu0DDOP71XmOFvD9rjeooyr1+Ux8XbiesCOUFJcMU
 wmfVQnvbd0bqWhiXHdWvUpZqDueAIwJXRjFsQu/9iWXG7NbztUl3Sus87BeXburgY+JI
 YHaquj+Zfcsfbt+JQ7e1bYu3g8jtNxbS8DDjPeg5nAbidPMHZWG4aBEXmLqSTMpAVgH6
 crbdovQVBseLpErKeQmdHeZq0Cf8fu30E8wh7ZpuQlGI5IG7c70ivZQxxIQ5HK8pDL5e
 E0jv63LZSwDFwQjNyAwTtcFVczNsBjN0P0dlyTs7AWKYVYtuamIAix+Pc1T6Dp7MVkFM
 WLaw==
X-Gm-Message-State: AOAM533skKjuJwI1KFgtloJXqDFZj8CjUwlLPHOfZ5s5KBcCD9/sBRRW
 lOHZtHmn4fRNBcKi0fLO81AXoQ==
X-Received: by 2002:a9d:58c9:: with SMTP id s9mr13770888oth.28.1632681276230; 
 Sun, 26 Sep 2021 11:34:36 -0700 (PDT)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id r1sm3295295ots.71.2021.09.26.11.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 11:34:35 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/virt: Allow additions to the generated device tree
Date: Sun, 26 Sep 2021 12:34:10 -0600
Message-Id: <20210926183410.256484-1-sjg@chromium.org>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=sjg@chromium.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Simon Glass <sjg@chromium.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KZAlJmC3eAPW

At present qemu creates a device tree automatically with the 'virt' generic
virtual platform. This is very convenient in most cases but there is not
much control over what is generated.

Add a way to provide a device tree binary file with additional properties
to add before booting. This provides flexibility for situations where
Linux needs some tweak to operate correctly. It also allows configuration
information to be passed to U-Boot, supporting verified boot, for example.

The term 'merge' is used here to avoid confusion with device tree overlays,
which are a particular type of format.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 docs/system/arm/virt.rst |  13 +++-
 hw/arm/virt.c            | 135 +++++++++++++++++++++++++++++++++++++++
 hw/core/machine.c        |  20 ++++++
 include/hw/boards.h      |   1 +
 qemu-options.hx          |   8 +++
 softmmu/vl.c             |   3 +
 util/qemu-config.c       |   5 ++
 7 files changed, 183 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 850787495b..3191e6eebf 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -146,8 +146,17 @@ Hardware configuration information for bare-metal programming
 The ``virt`` board automatically generates a device tree blob ("dtb")
 which it passes to the guest. This provides information about the
 addresses, interrupt lines and other configuration of the various devices
-in the system. Guest code can rely on and hard-code the following
-addresses:
+in the system.
+
+The optional ``-dtbi`` argument is used to specify a device tree blob to merge
+with this generated device tree, to add any properties required by the guest but
+not included by qemu. Properties are merged after the generated device tree is
+created, so take precedence over generated properties. This can be useful for
+overriding the ``stdout-path`` for Linux, for example, or to add configuration
+information needed by U-Boot. This is intended for simple nodes and properties
+and does not support use of phandles or device tree overlays.
+
+Guest code can rely on and hard-code the following addresses:
 
 - Flash memory starts at address 0x0000_0000
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1d59f0e59f..1d5c9a911a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -43,6 +43,7 @@
 #include "hw/vfio/vfio-calxeda-xgmac.h"
 #include "hw/vfio/vfio-amd-xgbe.h"
 #include "hw/display/ramfb.h"
+#include <libfdt.h>
 #include "net/net.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/numa.h"
@@ -292,6 +293,135 @@ static void create_fdt(VirtMachineState *vms)
     }
 }
 
+
+/*
+ * From U-Boot v2021.07 (under BSD-2-Clause license)
+ *
+ * This does not use the qemu_fdt interface because that requires node names.
+ * Here we are using offsets.
+ *
+ * overlay_apply_node - Merges a node into the base device tree
+ * @fdt: Base Device Tree blob
+ * @target: Node offset in the base device tree to apply the fragment to
+ * @fdto: Device tree overlay blob
+ * @node: Node offset in the overlay holding the changes to merge
+ *
+ * overlay_apply_node() merges a node into a target base device tree
+ * node pointed.
+ *
+ * This is part of the final step in the device tree overlay
+ * application process, when all the phandles have been adjusted and
+ * resolved and you just have to merge overlay into the base device
+ * tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_apply_node(void *fdt, int target, void *fdto, int node)
+{
+    int property;
+    int subnode;
+
+    fdt_for_each_property_offset(property, fdto, node) {
+        const char *name;
+        const void *prop;
+        int prop_len;
+        int ret;
+
+        prop = fdt_getprop_by_offset(fdto, property, &name, &prop_len);
+        if (prop_len == -FDT_ERR_NOTFOUND) {
+            return -FDT_ERR_INTERNAL;
+        }
+        if (prop_len < 0) {
+            return prop_len;
+        }
+
+        ret = fdt_setprop(fdt, target, name, prop, prop_len);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    fdt_for_each_subnode(subnode, fdto, node) {
+        const char *name = fdt_get_name(fdto, subnode, NULL);
+        int nnode;
+        int ret;
+
+        nnode = fdt_add_subnode(fdt, target, name);
+        if (nnode == -FDT_ERR_EXISTS) {
+            nnode = fdt_subnode_offset(fdt, target, name);
+            if (nnode == -FDT_ERR_NOTFOUND) {
+                return -FDT_ERR_INTERNAL;
+            }
+        }
+
+        if (nnode < 0) {
+            return nnode;
+        }
+
+        ret = overlay_apply_node(fdt, nnode, fdto, subnode);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
+/* Merge nodes and properties into fdt from fdto */
+static int merge_fdt(void *fdt, void *fdto)
+{
+    int err;
+
+    err = overlay_apply_node(fdt, 0, fdto, 0);
+    if (err) {
+        fprintf(stderr, "Device tree error %s\n", fdt_strerror(err));
+        return -1;
+    }
+
+    return 0;
+}
+
+/* Finish creating the device tree, merging in the -dtbi file if needed */
+static int complete_fdt(VirtMachineState *vms)
+{
+    MachineState *ms = MACHINE(vms);
+
+    if (ms->dtbi) {
+        char *filename;
+        void *fdt;
+        int size;
+        int ret;
+
+        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, ms->dtbi);
+        if (!filename) {
+            fprintf(stderr, "Couldn't open dtbi file %s\n", ms->dtbi);
+            goto fail;
+        }
+
+        fdt = load_device_tree(filename, &size);
+        if (!fdt) {
+            fprintf(stderr, "Couldn't open dtbi file %s\n", filename);
+            g_free(filename);
+            goto fail;
+        }
+
+        ret = merge_fdt(ms->fdt, fdt);
+        g_free(fdt);
+        if (ret) {
+            fprintf(stderr, "Failed to merge in dtbi file %s\n", filename);
+            g_free(filename);
+            goto fail;
+        }
+        g_free(filename);
+    }
+    return 0;
+
+fail:
+    return -1;
+}
+
 static void fdt_add_timer_nodes(const VirtMachineState *vms)
 {
     /* On real hardware these interrupts are level-triggered.
@@ -2102,6 +2232,11 @@ static void machvirt_init(MachineState *machine)
 
     create_platform_bus(vms);
 
+    if (complete_fdt(vms)) {
+        error_report("mach-virt: Failed to complete device tree");
+        exit(1);
+    }
+
     if (machine->nvdimms_state->is_enabled) {
         const struct AcpiGenericAddress arm_virt_nvdimm_acpi_dsmio = {
             .space_id = AML_AS_SYSTEM_MEMORY,
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 067f42b528..b47732fb24 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -306,6 +306,21 @@ static void machine_set_dtb(Object *obj, const char *value, Error **errp)
     ms->dtb = g_strdup(value);
 }
 
+static char *machine_get_dtbi(Object *obj, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    return g_strdup(ms->dtbi);
+}
+
+static void machine_set_dtbi(Object *obj, const char *value, Error **errp)
+{
+    MachineState *ms = MACHINE(obj);
+
+    g_free(ms->dtbi);
+    ms->dtbi = g_strdup(value);
+}
+
 static char *machine_get_dumpdtb(Object *obj, Error **errp)
 {
     MachineState *ms = MACHINE(obj);
@@ -891,6 +906,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, "dtb",
         "Linux kernel device tree file");
 
+    object_class_property_add_str(oc, "dtbi",
+        machine_get_dtbi, machine_set_dtbi);
+    object_class_property_set_description(oc, "dtbi",
+        "Linux kernel device tree file to merge with the generated device tree");
+
     object_class_property_add_str(oc, "dumpdtb",
         machine_get_dumpdtb, machine_set_dumpdtb);
     object_class_property_set_description(oc, "dumpdtb",
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 463a5514f9..1868c4e7b6 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -300,6 +300,7 @@ struct MachineState {
 
     void *fdt;
     char *dtb;
+    char *dtbi;  /* filename of device tree to merge with the generated one */
     char *dumpdtb;
     int phandle_start;
     char *dt_compatible;
diff --git a/qemu-options.hx b/qemu-options.hx
index 8f603cc7e6..73c0e6c998 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3621,6 +3621,14 @@ SRST
     kernel on boot.
 ERST
 
+DEF("dtbi", HAS_ARG, QEMU_OPTION_dtbi, \
+    "-dtbi   file    merge 'file' with generated device tree\n", QEMU_ARCH_ARM)
+SRST
+``-dtbi file``
+    Merge a device tree binary (dtb) file into the generated device tree and
+    pass the result to the kernel on boot.
+ERST
+
 DEFHEADING()
 
 DEFHEADING(Debug/Expert options:)
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 55ab70eb97..9f3ea6c510 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2921,6 +2921,9 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_dtb:
                 qdict_put_str(machine_opts_dict, "dtb", optarg);
                 break;
+            case QEMU_OPTION_dtbi:
+                qdict_put_str(machine_opts_dict, "dtbi", optarg);
+                break;
             case QEMU_OPTION_cdrom:
                 drive_add(IF_DEFAULT, 2, optarg, CDROM_OPTS);
                 break;
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 436ab63b16..359cfb6a9a 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -186,6 +186,11 @@ static QemuOptsList machine_opts = {
             .name = "dtb",
             .type = QEMU_OPT_STRING,
             .help = "Linux kernel device tree file",
+        },{
+            .name = "dtbi",
+            .type = QEMU_OPT_STRING,
+            .help = "Linux kernel device tree file to merge with the "
+                    "generated device tree",
         },{
             .name = "dumpdtb",
             .type = QEMU_OPT_STRING,
-- 
2.33.0.685.g46640cef36-goog

