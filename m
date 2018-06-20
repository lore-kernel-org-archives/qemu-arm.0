Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp761842wrq;
        Wed, 20 Jun 2018 06:20:39 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK09/hNVqCsQeNWL9lO/qMbwuVJY6MxSeJ4ZdfsrzBK/p/FJCf00tsBe1bID1CvQXI9kwVp
X-Received: by 2002:a1c:af95:: with SMTP id y143-v6mr1772925wme.28.1529500839279;
        Wed, 20 Jun 2018 06:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529500839; cv=none;
        d=google.com; s=arc-20160816;
        b=PWLZH9+AMern+HZTcwQk1fBfKSQLYo8wqI5Fr9q1OhKkoh0Rks3tWy4/yRH+HzPEWH
         XwH1LyaEM2nmNp5XMfjdsYEqbtL7U+FsPxrG81pr+mU3d3PNf2f3jMoTLJUsM6NuJJ39
         eAekg44/XFPq9pxzgTGl1744VjIkUARQ9wBoHmfjseKmq44Sl0B18Pe/KQyia/sij13y
         ab62uZ2vtO382X2lIXPNblm9TRoDdhrW1+ObHSi4w6a9jupduKiCU9JydLq/wsl3C2aV
         p8sqlke1jQO6B1DaAh5Kk5Ay2J6zWEdzwjl7KDMJ3xMbfzqdt207e3JlNMXtfcRAJUYC
         8jZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=m73m1D3jF1u6/fPO7NJlqLCPaBmELMcfvEt2Dcf7X74=;
        b=epHlapjcNtTxkRKqnhbG1vm1hl9VY480oNwXJ3MOFpDxnIi7tJxRxJwJxXJmRw4d9W
         lQOZCl5Jwu42trFZuHjFpn/goDObw0GFHVhzcK9oKcY0MZh22OGrNn7sGzQHfo9rzTmc
         1jD0yAbrzbvlgmPx6KJjAKGnQ+4yWyKNYUabtKErJE3Cr5eQjd/jQOlefHZdvPdp/mC2
         8rsz3a305PAMPd0AfLAq2GvKqprFfnocfkRghEvHzN4FOSXHgtVuHyCTIVy9I20I9REy
         xEs2L/g8Q5Nz1En9nLbMM3l8sUE38I08Y+bTTRtkdRWk/hbQmzJ4+NivcxpJ6UQydEbe
         H+hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 65-v6si2410604wmj.25.2018.06.20.06.20.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jun 2018 06:20:39 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fVd2M-0001ad-Mi; Wed, 20 Jun 2018 14:20:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 5/8] hw/misc/iotkit-secctl.c: Implement SECMPCINTSTATUS
Date: Wed, 20 Jun 2018 14:20:29 +0100
Message-Id: <20180620132032.28865-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180620132032.28865-1-peter.maydell@linaro.org>
References: <20180620132032.28865-1-peter.maydell@linaro.org>
X-TUID: HcdQSr4MlGPR

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
