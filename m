Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1871812wru;
        Thu, 9 Aug 2018 06:02:01 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxD31usWtf+FVQ5zH6RBrp2+1nC1SyUjPijDWXpNizlj/sdwdNa9SU8m+ksqfaU+rr3Ftqv
X-Received: by 2002:aed:3f1d:: with SMTP id p29-v6mr1813207qtf.320.1533819721239;
        Thu, 09 Aug 2018 06:02:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533819721; cv=none;
        d=google.com; s=arc-20160816;
        b=C3IBR7ppxA/KhRWHF2NBUGPeIGP4I/aaFMgCOMTluO7tipAvykX3vBco0yJilYL1bX
         S/guwo7VZzIvQiBwWOMdXDIlFLare363EglUf2NU6I0DFJ69+XOtNjyVYBjYlceK0o0q
         kK8A6XwiyLvscB2YiPM9rJ108LeWXpWhA+PeGfrAXKKH2wsxJehnHQEGkUA+/hespAJr
         JuTPzMezYjXBlUlx8KCPeT5mbJsaNRRVlu7khvIWTcit/hNOC8UKOutTcq/i/84pawXu
         VTYzpqxh6V1nS8kg+VHpwac0JUasBupI3e0c7eun51XLn90i+zbjI8gI+vWYfzDUows6
         Zo2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=H5cK4IuX3xuLw1G2kJuND+rjJ/WhcaxP1LLhn+sM9MU=;
        b=oTD+qvGWlhTVZk8+oAykeImwFuRuOXXqZjLIGYtRxZHQqWWXqr0UpIM8WVsLkRLzq2
         gYhNObXhjd9fu9DE/fvEW6o0N0iD8TYONoAf+FnmDZkeWL/BhcZGVE4+vTEm2hYAObJU
         qBYMZkVBxBToEwUavfHG8jNihcXkbMeiD6FGAaY2BY95Gei5uWVlF1UZkz0sm2tDxPoY
         YNdJao132yvuXxvsiN24vfL/6RP1OJZ+j0n8OX8OPBufKjZE61pCUwleeDnkZmoUFUg8
         9pHrr07PvM8pyj0d+Bm3xGf6Y2hkxKkMoH+EMaFcxw1PlcSSFMMbBMNp8DZwh8Zhj7JO
         5SIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21-v6si3671293qtp.70.2018.08.09.06.02.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 06:02:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnkZk-0005zE-MG
	for alex.bennee@linaro.org; Thu, 09 Aug 2018 09:02:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZL-0005vL-Es
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fnkZF-0003Hb-AI
	for qemu-arm@nongnu.org; Thu, 09 Aug 2018 09:01:35 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44194)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fnkZF-00038J-1Y; Thu, 09 Aug 2018 09:01:29 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fnkZC-0003IK-GG; Thu, 09 Aug 2018 14:01:26 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  9 Aug 2018 14:01:07 +0100
Message-Id: <20180809130115.28951-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180809130115.28951-1-peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 08/16] hw/misc/iotkit-secctl: Wire up registers
 for controlling MSCs
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EDCmchhR7VHN

The IoTKit does not have any Master Security Contollers itself,
but it does provide registers in the secure privilege control
block which allow control of MSCs in the external system.
Add support for these registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/iotkit-secctl.h | 14 +++++++
 hw/misc/iotkit-secctl.c         | 73 +++++++++++++++++++++++++++++----
 2 files changed, 79 insertions(+), 8 deletions(-)

diff --git a/include/hw/misc/iotkit-secctl.h b/include/hw/misc/iotkit-secctl.h
index 082c14c925e..1a193b306f1 100644
--- a/include/hw/misc/iotkit-secctl.h
+++ b/include/hw/misc/iotkit-secctl.h
@@ -19,6 +19,7 @@
  *  + named GPIO output "sec_resp_cfg" indicating whether blocked accesses
  *    should RAZ/WI or bus error
  *  + named GPIO output "nsc_cfg" whose value tracks the NSCCFG register value
+ *  + named GPIO output "msc_irq" for the combined IRQ line from the MSCs
  * Controlling the 2 APB PPCs in the IoTKit:
  *  + named GPIO outputs apb_ppc0_nonsec[0..2] and apb_ppc1_nonsec
  *  + named GPIO outputs apb_ppc0_ap[0..2] and apb_ppc1_ap
@@ -44,6 +45,11 @@
  * Controlling each of the 16 expansion MPCs which a system using the IoTKit
  * might provide:
  *  + named GPIO inputs mpcexp_status[0..15]
+ * Controlling each of the 16 expansion MSCs which a system using the IoTKit
+ * might provide:
+ *  + named GPIO inputs mscexp_status[0..15]
+ *  + named GPIO outputs mscexp_clear[0..15]
+ *  + named GPIO outputs mscexp_ns[0..15]
  */
 
 #ifndef IOTKIT_SECCTL_H
@@ -62,6 +68,7 @@
 #define IOTS_NUM_AHB_EXP_PPC 4
 #define IOTS_NUM_EXP_MPC 16
 #define IOTS_NUM_MPC 1
+#define IOTS_NUM_EXP_MSC 16
 
 typedef struct IoTKitSecCtl IoTKitSecCtl;
 
@@ -103,6 +110,13 @@ struct IoTKitSecCtl {
     uint32_t brginten;
     uint32_t mpcintstatus;
 
+    uint32_t secmscintstat;
+    uint32_t secmscinten;
+    uint32_t nsmscexp;
+    qemu_irq mscexp_clear[IOTS_NUM_EXP_MSC];
+    qemu_irq mscexp_ns[IOTS_NUM_EXP_MSC];
+    qemu_irq msc_irq;
+
     IoTKitSecCtlPPC apb[IOTS_NUM_APB_PPC];
     IoTKitSecCtlPPC apbexp[IOTS_NUM_APB_EXP_PPC];
     IoTKitSecCtlPPC ahbexp[IOTS_NUM_APB_EXP_PPC];
diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
index de4fd8e36d2..2222b3e147d 100644
--- a/hw/misc/iotkit-secctl.c
+++ b/hw/misc/iotkit-secctl.c
@@ -190,12 +190,13 @@ static MemTxResult iotkit_secctl_s_read(void *opaque, hwaddr addr,
         r = s->apbexp[offset_to_ppc_idx(offset)].sp;
         break;
     case A_SECMSCINTSTAT:
+        r = s->secmscintstat;
+        break;
     case A_SECMSCINTEN:
+        r = s->secmscinten;
+        break;
     case A_NSMSCEXP:
-        qemu_log_mask(LOG_UNIMP,
-                      "IoTKit SecCtl S block read: "
-                      "unimplemented offset 0x%x\n", offset);
-        r = 0;
+        r = s->nsmscexp;
         break;
     case A_PID4:
     case A_PID5:
@@ -291,6 +292,23 @@ static void iotkit_secctl_ppc_update_irq_enable(IoTKitSecCtlPPC *ppc)
     qemu_set_irq(ppc->irq_enable, extract32(value, ppc->irq_bit_offset, 1));
 }
 
+static void iotkit_secctl_update_mscexp_irqs(qemu_irq *msc_irqs, uint32_t value)
+{
+    int i;
+
+    for (i = 0; i < IOTS_NUM_EXP_MSC; i++) {
+        qemu_set_irq(msc_irqs[i], extract32(value, i + 16, 1));
+    }
+}
+
+static void iotkit_secctl_update_msc_irq(IoTKitSecCtl *s)
+{
+    /* Update the combined MSC IRQ, based on S_MSCEXP_STATUS and S_MSCEXP_EN */
+    bool level = s->secmscintstat & s->secmscinten;
+
+    qemu_set_irq(s->msc_irq, level);
+}
+
 static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
                                          uint64_t value,
                                          unsigned size, MemTxAttrs attrs)
@@ -370,10 +388,15 @@ static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
         iotkit_secctl_ppc_sp_write(ppc, value);
         break;
     case A_SECMSCINTCLR:
+        iotkit_secctl_update_mscexp_irqs(s->mscexp_clear, value);
+        break;
     case A_SECMSCINTEN:
-        qemu_log_mask(LOG_UNIMP,
-                      "IoTKit SecCtl S block write: "
-                      "unimplemented offset 0x%x\n", offset);
+        s->secmscinten = value;
+        iotkit_secctl_update_msc_irq(s);
+        break;
+    case A_NSMSCEXP:
+        s->nsmscexp = value;
+        iotkit_secctl_update_mscexp_irqs(s->mscexp_ns, value);
         break;
     case A_SECMPCINTSTATUS:
     case A_SECPPCINTSTAT:
@@ -381,7 +404,6 @@ static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
     case A_BRGINTSTAT:
     case A_AHBNSPPC0:
     case A_AHBSPPPC0:
-    case A_NSMSCEXP:
     case A_PID4:
     case A_PID5:
     case A_PID6:
@@ -588,6 +610,14 @@ static void iotkit_secctl_mpcexp_status(void *opaque, int n, int level)
     s->mpcintstatus = deposit32(s->mpcintstatus, n + 16, 1, !!level);
 }
 
+static void iotkit_secctl_mscexp_status(void *opaque, int n, int level)
+{
+    IoTKitSecCtl *s = IOTKIT_SECCTL(opaque);
+
+    s->secmscintstat = deposit32(s->secmscintstat, n + 16, 1, !!level);
+    iotkit_secctl_update_msc_irq(s);
+}
+
 static void iotkit_secctl_ppc_irqstatus(void *opaque, int n, int level)
 {
     IoTKitSecCtlPPC *ppc = opaque;
@@ -660,6 +690,14 @@ static void iotkit_secctl_init(Object *obj)
     qdev_init_gpio_in_named(dev, iotkit_secctl_mpcexp_status,
                             "mpcexp_status", IOTS_NUM_EXP_MPC);
 
+    qdev_init_gpio_in_named(dev, iotkit_secctl_mscexp_status,
+                            "mscexp_status", IOTS_NUM_EXP_MSC);
+    qdev_init_gpio_out_named(dev, s->mscexp_clear, "mscexp_clear",
+                             IOTS_NUM_EXP_MSC);
+    qdev_init_gpio_out_named(dev, s->mscexp_ns, "mscexp_ns",
+                             IOTS_NUM_EXP_MSC);
+    qdev_init_gpio_out_named(dev, &s->msc_irq, "msc_irq", 1);
+
     memory_region_init_io(&s->s_regs, obj, &iotkit_secctl_s_ops,
                           s, "iotkit-secctl-s-regs", 0x1000);
     memory_region_init_io(&s->ns_regs, obj, &iotkit_secctl_ns_ops,
@@ -690,6 +728,24 @@ static const VMStateDescription iotkit_secctl_mpcintstatus_vmstate = {
     }
 };
 
+static bool needed_always(void *opaque)
+{
+    return true;
+}
+
+static const VMStateDescription iotkit_secctl_msc_vmstate = {
+    .name = "iotkit-secctl/msc",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = needed_always,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(secmscintstat, IoTKitSecCtl),
+        VMSTATE_UINT32(secmscinten, IoTKitSecCtl),
+        VMSTATE_UINT32(nsmscexp, IoTKitSecCtl),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription iotkit_secctl_vmstate = {
     .name = "iotkit-secctl",
     .version_id = 1,
@@ -710,6 +766,7 @@ static const VMStateDescription iotkit_secctl_vmstate = {
     },
     .subsections = (const VMStateDescription*[]) {
         &iotkit_secctl_mpcintstatus_vmstate,
+        &iotkit_secctl_msc_vmstate,
         NULL
     },
 };
-- 
2.17.1

