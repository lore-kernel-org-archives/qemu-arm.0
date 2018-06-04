Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp743586wrq;
        Mon, 4 Jun 2018 08:29:51 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJhDk+CyKF819dGQyPQEY1x6iKzabZKJtnCWAQgFiQV+4gXs9Vy1BY38UwNkpOcnwYbt+sd
X-Received: by 2002:a1c:b70b:: with SMTP id h11-v6mr9367594wmf.1.1528126190941;
        Mon, 04 Jun 2018 08:29:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528126190; cv=none;
        d=google.com; s=arc-20160816;
        b=uHxt93XApKJU69QMk6Ft9gEaNQRVN3X4od8FLfMErba3Hvro0K7OseYk01b6hIRMTz
         tpi4oOAi8NqHEUqHESFW8XeXCxco/N1tX82KXnG7tWSStx4PYzSN8Z3YUqXXmV0Cm1IA
         fIKKB5gqwVLlUSiFwKHvdqpwVHrzV8xz9U1h66AjKzUXWBS0yFa0omzWCgHYr3fwnSKd
         AEaq9ULWWu8e2Q7XsDhPFSSp5PK6bpADB6AK1deC/42y0uzAXbrbZz5ppUluxzlUQa1z
         Dhcfxl+D5psacNl20n0rhZp1B6YKGAcbV6bMkU7kHDWRNiAb3pO2s3Bcvf5jecphwXQg
         e28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=m73m1D3jF1u6/fPO7NJlqLCPaBmELMcfvEt2Dcf7X74=;
        b=ejjLAMkbFhe4Bsig5OLop0T9ZyVqhyUeWSUG9m0JPOkE9s6YBnIf3klcoQKUhN6b7i
         mAscSgP8H730FqmEG7MweHAkJjoVTw5Za0Fw6iiy9x1n0mvxK9P7dn4K64FUnHTcF9SI
         qpE+TnJ2SAKi3xLtcHV0sDc7Zo/yhohaNZP6mhS4GjUcCtgWpFuNzS+seIFMcDI8Wc0D
         fs3jKwKly1rFsMNIG6EJn6PNeUbvVnIEleZR4udD8RPSUiIQ2xvPj2Y6k/KC4elPDJPJ
         qhB0y50A1FkuIKT2oOZDHeOcFK6sGWC6c5tyQ4dKfXaWkPMvK570me89InQvV60ar8UK
         7pkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id v67-v6si317414wmv.148.2018.06.04.08.29.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jun 2018 08:29:50 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fPrQc-000756-DB; Mon, 04 Jun 2018 16:29:50 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 10/13] hw/misc/iotkit-secctl.c: Implement SECMPCINTSTATUS
Date: Mon,  4 Jun 2018 16:29:38 +0100
Message-Id: <20180604152941.20374-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180604152941.20374-1-peter.maydell@linaro.org>
References: <20180604152941.20374-1-peter.maydell@linaro.org>
X-TUID: Wf/upqKBE5bA

Implement the SECMPCINTSTATUS register. This is the only register
in the security controller that deals with Memory Protection
Controllers, and it simply provides a read-only view of the
interrupt lines from the various MPCs in the system.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/iotkit-secctl.h |  8 +++++++
 hw/misc/iotkit-secctl.c         | 38 +++++++++++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/include/hw/misc/iotkit-secctl.h b/include/hw/misc/iotkit-secctl.h
index faad0c91901..082c14c925e 100644
--- a/include/hw/misc/iotkit-secctl.h
+++ b/include/hw/misc/iotkit-secctl.h
@@ -39,6 +39,11 @@
  *  + named GPIO outputs ahb_ppcexp{0,1,2,3}_irq_enable
  *  + named GPIO outputs ahb_ppcexp{0,1,2,3}_irq_clear
  *  + named GPIO inputs ahb_ppcexp{0,1,2,3}_irq_status
+ * Controlling the MPC in the IoTKit:
+ *  + named GPIO input mpc_status
+ * Controlling each of the 16 expansion MPCs which a system using the IoTKit
+ * might provide:
+ *  + named GPIO inputs mpcexp_status[0..15]
  */
 
 #ifndef IOTKIT_SECCTL_H
@@ -55,6 +60,8 @@
 #define IOTS_NUM_APB_PPC 2
 #define IOTS_NUM_APB_EXP_PPC 4
 #define IOTS_NUM_AHB_EXP_PPC 4
+#define IOTS_NUM_EXP_MPC 16
+#define IOTS_NUM_MPC 1
 
 typedef struct IoTKitSecCtl IoTKitSecCtl;
 
@@ -94,6 +101,7 @@ struct IoTKitSecCtl {
     uint32_t secrespcfg;
     uint32_t nsccfg;
     uint32_t brginten;
+    uint32_t mpcintstatus;
 
     IoTKitSecCtlPPC apb[IOTS_NUM_APB_PPC];
     IoTKitSecCtlPPC apbexp[IOTS_NUM_APB_EXP_PPC];
diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
index ddd1584d341..de4fd8e36d2 100644
--- a/hw/misc/iotkit-secctl.c
+++ b/hw/misc/iotkit-secctl.c
@@ -139,6 +139,9 @@ static MemTxResult iotkit_secctl_s_read(void *opaque, hwaddr addr,
     case A_NSCCFG:
         r = s->nsccfg;
         break;
+    case A_SECMPCINTSTATUS:
+        r = s->mpcintstatus;
+        break;
     case A_SECPPCINTSTAT:
         r = s->secppcintstat;
         break;
@@ -186,7 +189,6 @@ static MemTxResult iotkit_secctl_s_read(void *opaque, hwaddr addr,
     case A_APBSPPPCEXP3:
         r = s->apbexp[offset_to_ppc_idx(offset)].sp;
         break;
-    case A_SECMPCINTSTATUS:
     case A_SECMSCINTSTAT:
     case A_SECMSCINTEN:
     case A_NSMSCEXP:
@@ -572,6 +574,20 @@ static void iotkit_secctl_reset(DeviceState *dev)
     foreach_ppc(s, iotkit_secctl_reset_ppc);
 }
 
+static void iotkit_secctl_mpc_status(void *opaque, int n, int level)
+{
+    IoTKitSecCtl *s = IOTKIT_SECCTL(opaque);
+
+    s->mpcintstatus = deposit32(s->mpcintstatus, 0, 1, !!level);
+}
+
+static void iotkit_secctl_mpcexp_status(void *opaque, int n, int level)
+{
+    IoTKitSecCtl *s = IOTKIT_SECCTL(opaque);
+
+    s->mpcintstatus = deposit32(s->mpcintstatus, n + 16, 1, !!level);
+}
+
 static void iotkit_secctl_ppc_irqstatus(void *opaque, int n, int level)
 {
     IoTKitSecCtlPPC *ppc = opaque;
@@ -640,6 +656,10 @@ static void iotkit_secctl_init(Object *obj)
     qdev_init_gpio_out_named(dev, &s->sec_resp_cfg, "sec_resp_cfg", 1);
     qdev_init_gpio_out_named(dev, &s->nsc_cfg_irq, "nsc_cfg", 1);
 
+    qdev_init_gpio_in_named(dev, iotkit_secctl_mpc_status, "mpc_status", 1);
+    qdev_init_gpio_in_named(dev, iotkit_secctl_mpcexp_status,
+                            "mpcexp_status", IOTS_NUM_EXP_MPC);
+
     memory_region_init_io(&s->s_regs, obj, &iotkit_secctl_s_ops,
                           s, "iotkit-secctl-s-regs", 0x1000);
     memory_region_init_io(&s->ns_regs, obj, &iotkit_secctl_ns_ops,
@@ -660,6 +680,16 @@ static const VMStateDescription iotkit_secctl_ppc_vmstate = {
     }
 };
 
+static const VMStateDescription iotkit_secctl_mpcintstatus_vmstate = {
+    .name = "iotkit-secctl-mpcintstatus",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(mpcintstatus, IoTKitSecCtl),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription iotkit_secctl_vmstate = {
     .name = "iotkit-secctl",
     .version_id = 1,
@@ -677,7 +707,11 @@ static const VMStateDescription iotkit_secctl_vmstate = {
         VMSTATE_STRUCT_ARRAY(ahbexp, IoTKitSecCtl, IOTS_NUM_AHB_EXP_PPC, 1,
                              iotkit_secctl_ppc_vmstate, IoTKitSecCtlPPC),
         VMSTATE_END_OF_LIST()
-    }
+    },
+    .subsections = (const VMStateDescription*[]) {
+        &iotkit_secctl_mpcintstatus_vmstate,
+        NULL
+    },
 };
 
 static void iotkit_secctl_class_init(ObjectClass *klass, void *data)
-- 
2.17.1
