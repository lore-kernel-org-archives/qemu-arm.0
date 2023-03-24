Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1495780ejb;
        Fri, 24 Mar 2023 16:11:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set/mv7Rin/1bbXXf6aZadIRMFqyM+9QihyR9NGB34skNSFQtkk2Uz2sjnqV9OFEenEmJoAgJ
X-Received: by 2002:ac8:5dcb:0:b0:3e4:6329:448a with SMTP id e11-20020ac85dcb000000b003e46329448amr7769294qtx.65.1679699494496;
        Fri, 24 Mar 2023 16:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679699494; cv=none;
        d=google.com; s=arc-20160816;
        b=myoDgfvIyIXIiKK++D/34jSeAa/5WVYYd9gzta0MwKp6ZqtvxKGg7RTGgrczDNwnU1
         XC5kbX4jHcEKehrOt69y5YnswkP5HWi2SVxHlBTmLpXKPtTtbCVIjI9KzbGoO6NKcnQe
         NM0sa0kjN1A1/u//0czGyJqW1tdE1VicUobJODK7Z+8NKdTrVo+j9pEYUgsBZqKCJ8uf
         FSZ0DJbDmwgmrOscwIKVXN3jeQBbrJKdLPw8OJwwb5hOikfaBj3wLZ3wYneJ0rgmDgiC
         JprohVceTXPpCaWKzLk+LijD7UmG0e5NrbDw7ZR599fMgFJQiaHARibgNWJY021CjI0Q
         5huw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=c7vfaFT4Oek7HuFVtedcNGRSplu1piUpBKnOxQHG9tg=;
        b=SPbgyvPV0RfD/X6XxUaJrQoF03YTlm2z7dYhvnC73U33MkGW0jN8yKV+Zm/aHMP/KF
         JlilGWPgSnkR4DNCGnvohMSLaP6oM6vRpqTJH51WjrrgOULH+9ahTnOcGBlLTukw1p0r
         OmLnWXQLzs0/VqAkTWKeuLL1w+w+EI9PUa96au8jzt/UxsB9JIXE2r0Um3D7UZIUdGmI
         dl78jUHFlIX+34yXgTAEnnHtCK8vcTcYeFBinkUPfpVWVEcmxJs/4+2NZmo9t/uxT6mA
         D2ERFEV0lYeB97SvG1M3PQch8vKY7jUMIb/mg0+1Ebxx6JeePdFd95CHYzGL9BrfqMXl
         uPdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=rn0ERyM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8-20020ac85c88000000b003e4dcb4015esi113108qta.749.2023.03.24.16.11.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Mar 2023 16:11:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=rn0ERyM5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pfqY3-0002dB-55; Fri, 24 Mar 2023 19:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vS0eZAgKCLgusfYmrqfemmejc.amkocks-Ypklmlels.mpe@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXl-0002T6-HW
 for qemu-arm@nongnu.org; Fri, 24 Mar 2023 19:09:58 -0400
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vS0eZAgKCLgusfYmrqfemmejc.amkocks-Ypklmlels.mpe@flex--wuhaotsh.bounces.google.com>)
 id 1pfqXh-00084v-4F
 for qemu-arm@nongnu.org; Fri, 24 Mar 2023 19:09:56 -0400
Received: by mail-pl1-x649.google.com with SMTP id
 l1-20020a170903244100b001a0468b4afcso1955085pls.12
 for <qemu-arm@nongnu.org>; Fri, 24 Mar 2023 16:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679699389;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=c7vfaFT4Oek7HuFVtedcNGRSplu1piUpBKnOxQHG9tg=;
 b=rn0ERyM5nNKsTUF2oqwD2DLd5e4feuF5RZzaH3N5oJRVIPXemP5V5oStdIgmXOCcJp
 VTFu4aeSchnu0xlDg0Ta2uyHFv95TiePa3pn9m/6c5xIg63vbprCYIaiLUE7hCsvpcMd
 Xf2EhWeX1OIE4N6Xdpun+BHVUkscWt1CxbyoeQNPTw7935fxxNuvhA6uXv+DBJ4PGaGM
 oB1h1WN8nEhNxwYLgsSLEga1Km7Erw3/raDndMocKfyjliuCforN+91NuXk7SSuydkUZ
 bBdOtA+4NIbJW2Hg0Lyshsupt8pkasoqiQGAUSgNGYT1FfgRHYLh+jnlZvGZVYDaSgM5
 cnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679699389;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c7vfaFT4Oek7HuFVtedcNGRSplu1piUpBKnOxQHG9tg=;
 b=loYNs8D/wVXUvtMjcibZDOZRbsXOofKJ/bqGCkWYQQkj6BUC2lVhwom6Su1mi8qiAu
 wGr4BcgMNvQCxrWmGVlZ4IjaEY5EZX3o8Rw5llSi6CFXLXzaPWk3l7XjiRbN2Lvlx0JW
 Gqdg37SRleOULnlIC9g8oSMiCeDbbIjQWti+nIEhi8IsKjcxujBGSplEXzmk40twjH+y
 9DVMplG3uMQW18XnuQoeybw72mNLVt0YqQ6IvVEwAXpqKV7LC5EILcZkDMNOVQQMZPUn
 KuSAOcz3GNpqVAxkTpujAgPodadm1y+sGUt5xKeSUO8ZYcydkc+I9a0oDxmUOPru41b/
 HL6A==
X-Gm-Message-State: AAQBX9d+LoDGXmGLc+jkRtORrxjIX9mHsR7p8TOy4RdG0Qa+O9GSQ2KE
 mR0EGVEEcqUiUtu1T3I/ygPk8oemi7ycdg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:1781:b0:593:fcfb:208b with SMTP
 id s1-20020a056a00178100b00593fcfb208bmr2437285pfg.3.1679699389209; Fri, 24
 Mar 2023 16:09:49 -0700 (PDT)
Date: Fri, 24 Mar 2023 16:09:03 -0700
In-Reply-To: <20230324230904.3710289-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20230324230904.3710289-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230324230904.3710289-7-wuhaotsh@google.com>
Subject: [PATCH v2 6/7] hw/ipmi: Add an IPMI external host device
From: Hao Wu <wuhaotsh@google.com>
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, titusr@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3vS0eZAgKCLgusfYmrqfemmejc.amkocks-Ypklmlels.mpe@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: p+o0U9Vw7ld9

The IPMI external host device works for Baseband Management Controller
(BMC) emulations. It works as a representation of a host class that
connects to a given BMC.  It can connect to a real host hardware or a
emulated or simulated host device. In particular it can connect to a
host QEMU instance with device ipmi-bmc-extern.

For more details of IPMI host device in BMC emulation, see
docs/specs/ipmi.rst.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 configs/devices/arm-softmmu/default.mak |   2 +
 hw/ipmi/Kconfig                         |   4 +
 hw/ipmi/ipmi_extern.c                   |  18 ++-
 hw/ipmi/ipmi_host_extern.c              | 170 ++++++++++++++++++++++++
 hw/ipmi/meson.build                     |   1 +
 include/hw/ipmi/ipmi.h                  |   4 +
 6 files changed, 197 insertions(+), 2 deletions(-)
 create mode 100644 hw/ipmi/ipmi_host_extern.c

diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 1b49a7830c..76e902bc4b 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -25,6 +25,8 @@ CONFIG_GUMSTIX=y
 CONFIG_SPITZ=y
 CONFIG_TOSA=y
 CONFIG_Z2=y
+CONFIG_IPMI=y
+CONFIG_IPMI_HOST=y
 CONFIG_NPCM7XX=y
 CONFIG_COLLIE=y
 CONFIG_ASPEED_SOC=y
diff --git a/hw/ipmi/Kconfig b/hw/ipmi/Kconfig
index 9befd4f422..d767948b79 100644
--- a/hw/ipmi/Kconfig
+++ b/hw/ipmi/Kconfig
@@ -11,6 +11,10 @@ config IPMI_EXTERN
     default y
     depends on IPMI
 
+config IPMI_HOST
+    bool
+    depends on IPMI
+
 config ISA_IPMI_KCS
     bool
     depends on ISA_BUS
diff --git a/hw/ipmi/ipmi_extern.c b/hw/ipmi/ipmi_extern.c
index 185d20c337..b9466a4d58 100644
--- a/hw/ipmi/ipmi_extern.c
+++ b/hw/ipmi/ipmi_extern.c
@@ -145,11 +145,25 @@ void ipmi_extern_handle_command(IPMIExtern *ibe,
     if (err) {
         IPMIInterfaceClass *k = IPMI_INTERFACE_GET_CLASS(s);
         unsigned char rsp[3];
+
         rsp[0] = cmd[0] | 0x04;
         rsp[1] = cmd[1];
         rsp[2] = err;
-        ibe->waiting_rsp = false;
-        k->handle_msg(s, msg_id, rsp, 3);
+
+        if (ibe->bmc_side) {
+            /* For BMC Side, send out an error message. */
+            addchar(ibe, msg_id);
+            for (i = 0; i < 3; ++i) {
+                addchar(ibe, rsp[i]);
+            }
+            csum = ipmb_checksum(&msg_id, 1, 0);
+            addchar(ibe, -ipmb_checksum(rsp, 3, csum));
+            continue_send(ibe);
+        } else {
+            /* For Core side, handle an error message. */
+            ibe->waiting_rsp = false;
+            k->handle_msg(s, msg_id, rsp, 3);
+        }
         goto out;
     }
 
diff --git a/hw/ipmi/ipmi_host_extern.c b/hw/ipmi/ipmi_host_extern.c
new file mode 100644
index 0000000000..c70f968eef
--- /dev/null
+++ b/hw/ipmi/ipmi_host_extern.c
@@ -0,0 +1,170 @@
+/*
+ * IPMI Host external connection
+ *
+ * Copyright 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+/*
+ * This is designed to connect to a host QEMU VM that runs ipmi_bmc_extern.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qemu/module.h"
+#include "qapi/error.h"
+#include "chardev/char-fe.h"
+#include "hw/ipmi/ipmi.h"
+#include "hw/ipmi/ipmi_extern.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "migration/vmstate.h"
+#include "qom/object.h"
+
+#define TYPE_IPMI_HOST_EXTERN "ipmi-host-extern"
+OBJECT_DECLARE_SIMPLE_TYPE(IPMIHostExtern, IPMI_HOST_EXTERN)
+
+typedef struct IPMIHostExtern {
+    IPMICore parent;
+
+    IPMIExtern conn;
+
+    IPMIInterface *responder;
+
+    uint8_t capability;
+} IPMIHostExtern;
+
+/*
+ * Handle a command (typically IPMI response) from IPMI interface
+ * and send it out to the external host.
+ */
+static void ipmi_host_extern_handle_command(IPMICore *h, uint8_t *cmd,
+        unsigned cmd_len, unsigned max_cmd_len, uint8_t msg_id)
+{
+    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(h);
+
+    ipmi_extern_handle_command(&ihe->conn, cmd, cmd_len, max_cmd_len, msg_id);
+}
+
+/* This function handles a control command from the host. */
+static void ipmi_host_extern_handle_hw_op(IPMICore *ic, uint8_t cmd,
+                                          uint8_t operand)
+{
+    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(ic);
+
+    switch (cmd) {
+    case VM_CMD_VERSION:
+        /* The host informs us the protocol version. */
+        if (unlikely(operand != VM_PROTOCOL_VERSION)) {
+            ipmi_debug("Host protocol version %u is different from our version"
+                    " %u\n", operand, VM_PROTOCOL_VERSION);
+        }
+        break;
+
+    case VM_CMD_RESET:
+        /* The host tells us a reset has happened. */
+        break;
+
+    case VM_CMD_CAPABILITIES:
+        /* The host tells us its capability. */
+        ihe->capability = operand;
+        break;
+
+    default:
+        /* The host shouldn't send us this command. Just ignore if they do. */
+        ipmi_debug("Host cmd type %02x is invalid.\n", cmd);
+        break;
+    }
+}
+
+static void ipmi_host_extern_realize(DeviceState *dev, Error **errp)
+{
+    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(dev);
+    IPMIInterfaceClientClass *rk;
+
+    if (ihe->responder == NULL) {
+        error_setg(errp, "IPMI host extern requires responder attribute");
+        return;
+    }
+    rk = IPMI_INTERFACE_CLIENT_GET_CLASS(ihe->responder);
+    rk->set_ipmi_handler(ihe->responder, IPMI_CORE(ihe));
+    ihe->conn.core->intf = ihe->responder;
+
+    if (!qdev_realize(DEVICE(&ihe->conn), NULL, errp)) {
+        return;
+    }
+}
+
+static int ipmi_host_extern_post_migrate(void *opaque, int version_id)
+{
+    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(opaque);
+
+    return ipmi_extern_post_migrate(&ihe->conn, version_id);
+}
+
+static const VMStateDescription vmstate_ipmi_host_extern = {
+    .name = TYPE_IPMI_HOST_EXTERN,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .post_load = ipmi_host_extern_post_migrate,
+    .fields      = (VMStateField[]) {
+        VMSTATE_UINT8(capability, IPMIHostExtern),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void ipmi_host_extern_init(Object *obj)
+{
+    IPMICore *ic = IPMI_CORE(obj);
+    IPMIHostExtern *ihe = IPMI_HOST_EXTERN(obj);
+
+    object_initialize_child(obj, "extern", &ihe->conn,
+                            TYPE_IPMI_EXTERN);
+    ihe->conn.core = ic;
+    ihe->conn.bmc_side = true;
+    vmstate_register(NULL, 0, &vmstate_ipmi_host_extern, ihe);
+}
+
+static Property ipmi_host_extern_properties[] = {
+    DEFINE_PROP_CHR("chardev", IPMIHostExtern, conn.chr),
+    DEFINE_PROP_LINK("responder", IPMIHostExtern, responder,
+                     TYPE_IPMI_INTERFACE, IPMIInterface *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ipmi_host_extern_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    IPMICoreClass *ck = IPMI_CORE_CLASS(oc);
+
+    device_class_set_props(dc, ipmi_host_extern_properties);
+
+    ck->handle_command = ipmi_host_extern_handle_command;
+    ck->handle_hw_op = ipmi_host_extern_handle_hw_op;
+    dc->hotpluggable = false;
+    dc->realize = ipmi_host_extern_realize;
+}
+
+static const TypeInfo ipmi_host_extern_type = {
+    .name          = TYPE_IPMI_HOST_EXTERN,
+    .parent        = TYPE_IPMI_CORE,
+    .instance_size = sizeof(IPMIHostExtern),
+    .instance_init = ipmi_host_extern_init,
+    .class_init    = ipmi_host_extern_class_init,
+};
+
+static void ipmi_host_extern_register_types(void)
+{
+    type_register_static(&ipmi_host_extern_type);
+}
+
+type_init(ipmi_host_extern_register_types)
diff --git a/hw/ipmi/meson.build b/hw/ipmi/meson.build
index edd0bf9af9..b1dd4710dc 100644
--- a/hw/ipmi/meson.build
+++ b/hw/ipmi/meson.build
@@ -7,5 +7,6 @@ ipmi_ss.add(when: 'CONFIG_PCI_IPMI_KCS', if_true: files('pci_ipmi_kcs.c'))
 ipmi_ss.add(when: 'CONFIG_ISA_IPMI_BT', if_true: files('isa_ipmi_bt.c'))
 ipmi_ss.add(when: 'CONFIG_PCI_IPMI_BT', if_true: files('pci_ipmi_bt.c'))
 ipmi_ss.add(when: 'CONFIG_IPMI_SSIF', if_true: files('smbus_ipmi.c'))
+ipmi_ss.add(when: 'CONFIG_IPMI_HOST', if_true: files('ipmi_host_extern.c'))
 
 softmmu_ss.add_all(when: 'CONFIG_IPMI', if_true: ipmi_ss)
diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
index 5ead2467f5..487d57f3ed 100644
--- a/include/hw/ipmi/ipmi.h
+++ b/include/hw/ipmi/ipmi.h
@@ -197,8 +197,12 @@ OBJECT_DECLARE_TYPE(IPMIInterfaceClient, IPMIInterfaceClientClass,
 typedef struct IPMIInterfaceClientClass IPMIInterfaceClientClass;
 typedef struct IPMIInterfaceClient IPMIInterfaceClient;
 
+struct IPMICore;
 struct IPMIInterfaceClientClass {
     IPMIInterfaceClass parent;
+
+    /* Set the IPMI handler. */
+    void (*set_ipmi_handler)(struct IPMIInterface *s, struct IPMICore *ic);
 };
 
 /*
-- 
2.40.0.348.gf938b09366-goog

