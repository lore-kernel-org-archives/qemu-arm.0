Received: by 10.28.71.27 with SMTP id u27csp1372345wma;
        Tue, 20 Feb 2018 10:04:17 -0800 (PST)
X-Google-Smtp-Source: AH8x225wUIMi+gDolFHEskPzSbWdGVSTn7vdSngZ6n6CVVNuUdxSgLS7tCPrS7UawLPEDZDJNdn0
X-Received: by 2002:a25:30a:: with SMTP id 10-v6mr460403ybd.272.1519149857433;
        Tue, 20 Feb 2018 10:04:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519149857; cv=none;
        d=google.com; s=arc-20160816;
        b=FHns6gFY54xBTOWMmSz8qBYzGjUvj4VMam+jYdOAJnFAjofgSiW3XjbbQtCPEBPuO8
         MCTOEpP+8iD8JNYyl97hXkkb2uTqkZgXeiFBK718HuAlUG1syviI+oHpX9RZGwuKyUVI
         59UAgZ5Jeix++KFGDC/yM4JP58w0n5ph5qmMROeq27tPynwGSttcnsmUNK700e44bYRJ
         Z+QaD38eI53qZXnZFY5HKHSMNNdHV9u2BYxcM8LsLYxOg4HKRkotuX0/GK9zJHwWwMd6
         aih0wa/qhuDbex+ciwiCxNNT99/uvJ56eHMxB45RouEHkp4yxuytUmOPRkLjEnEVKyZV
         Us8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=8/MzZX+q1MvGa4f4M8r++hoqe69lfv+0MbRseW6vRsA=;
        b=F+Tje8JAOf2Oh9Y+TzPoyBmtnrm6wHruPlpBDIwBc23EOdyaZyqiCy+wyGaQk6yaFB
         aPUcmSs/TXlPb9MQrqHJpM4dH+kzL9EBm7T+eBpNLijQ0rhKlTQSlnREV7e/kgOJGbod
         y1AYuUBHT84biAL7hSJKNTUSMB07Pl/Z8X13uPJCllaCMS4T4bp/Z1QSpvYfwpUwXPc8
         2bcI+nTkO6l+qH69Ng1MFC3TFOhZwRAZO4NuQDW+ASJiI4ABYz/AhnXH0K9l3OHeAGO3
         kXkABt4rrSd7KJx5G5Yc7JsIl06Sx5HZ1Ouj8ozIk4SbVIgkyEpRyirusvG+GfUw3jHz
         YFYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h184si425389ybc.116.2018.02.20.10.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:04:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCH2-00005q-R9
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:04:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53708)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGT-00089F-HK
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGS-0001cd-AI
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:41 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46560)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eoCGS-0001br-2L; Tue, 20 Feb 2018 13:03:40 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eoCGQ-0008UC-VB; Tue, 20 Feb 2018 18:03:38 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Feb 2018 18:03:23 +0000
Message-Id: <20180220180325.29818-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180220180325.29818-1-peter.maydell@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 17/19] hw/misc/iotkit-secctl: Add remaining
 simple registers
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
X-TUID: ccCEqkZvoRKX

Add remaining easy registers to iotkit-secctl:
 * NSCCFG just routes its two bits out to external GPIO lines
 * BRGINSTAT/BRGINTCLR/BRGINTEN can be dummies, because QEMU's
   bus fabric can never report errors

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/iotkit-secctl.h |  4 ++++
 hw/misc/iotkit-secctl.c         | 32 ++++++++++++++++++++++++++------
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/include/hw/misc/iotkit-secctl.h b/include/hw/misc/iotkit-secctl.h
index ea3d62967f..faad0c9190 100644
--- a/include/hw/misc/iotkit-secctl.h
+++ b/include/hw/misc/iotkit-secctl.h
@@ -18,6 +18,7 @@
  *  + sysbus MMIO region 1 is the "non-secure privilege control block" registers
  *  + named GPIO output "sec_resp_cfg" indicating whether blocked accesses
  *    should RAZ/WI or bus error
+ *  + named GPIO output "nsc_cfg" whose value tracks the NSCCFG register value
  * Controlling the 2 APB PPCs in the IoTKit:
  *  + named GPIO outputs apb_ppc0_nonsec[0..2] and apb_ppc1_nonsec
  *  + named GPIO outputs apb_ppc0_ap[0..2] and apb_ppc1_ap
@@ -83,6 +84,7 @@ struct IoTKitSecCtl {
 
     /*< public >*/
     qemu_irq sec_resp_cfg;
+    qemu_irq nsc_cfg_irq;
 
     MemoryRegion s_regs;
     MemoryRegion ns_regs;
@@ -90,6 +92,8 @@ struct IoTKitSecCtl {
     uint32_t secppcintstat;
     uint32_t secppcinten;
     uint32_t secrespcfg;
+    uint32_t nsccfg;
+    uint32_t brginten;
 
     IoTKitSecCtlPPC apb[IOTS_NUM_APB_PPC];
     IoTKitSecCtlPPC apbexp[IOTS_NUM_APB_EXP_PPC];
diff --git a/hw/misc/iotkit-secctl.c b/hw/misc/iotkit-secctl.c
index 7e1ca184ab..2cefa0ec15 100644
--- a/hw/misc/iotkit-secctl.c
+++ b/hw/misc/iotkit-secctl.c
@@ -136,12 +136,24 @@ static MemTxResult iotkit_secctl_s_read(void *opaque, hwaddr addr,
     case A_SECRESPCFG:
         r = s->secrespcfg;
         break;
+    case A_NSCCFG:
+        r = s->nsccfg;
+        break;
     case A_SECPPCINTSTAT:
         r = s->secppcintstat;
         break;
     case A_SECPPCINTEN:
         r = s->secppcinten;
         break;
+    case A_BRGINTSTAT:
+        /* QEMU's bus fabric can never report errors as it doesn't buffer
+         * writes, so we never report bridge interrupts.
+         */
+        r = 0;
+        break;
+    case A_BRGINTEN:
+        r = s->brginten;
+        break;
     case A_AHBNSPPCEXP0:
     case A_AHBNSPPCEXP1:
     case A_AHBNSPPCEXP2:
@@ -174,12 +186,9 @@ static MemTxResult iotkit_secctl_s_read(void *opaque, hwaddr addr,
     case A_APBSPPPCEXP3:
         r = s->apbexp[offset_to_ppc_idx(offset)].sp;
         break;
-    case A_NSCCFG:
     case A_SECMPCINTSTATUS:
     case A_SECMSCINTSTAT:
     case A_SECMSCINTEN:
-    case A_BRGINTSTAT:
-    case A_BRGINTEN:
     case A_NSMSCEXP:
         qemu_log_mask(LOG_UNIMP,
                       "IoTKit SecCtl S block read: "
@@ -299,6 +308,10 @@ static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
     }
 
     switch (offset) {
+    case A_NSCCFG:
+        s->nsccfg = value & 3;
+        qemu_set_irq(s->nsc_cfg_irq, s->nsccfg);
+        break;
     case A_SECRESPCFG:
         value &= 1;
         s->secrespcfg = value;
@@ -312,6 +325,11 @@ static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
         s->secppcinten = value & 0x00f000f3;
         foreach_ppc(s, iotkit_secctl_ppc_update_irq_enable);
         break;
+    case A_BRGINTCLR:
+        break;
+    case A_BRGINTEN:
+        s->brginten = value & 0xffff;
+        break;
     case A_AHBNSPPCEXP0:
     case A_AHBNSPPCEXP1:
     case A_AHBNSPPCEXP2:
@@ -350,11 +368,8 @@ static MemTxResult iotkit_secctl_s_write(void *opaque, hwaddr addr,
         ppc = &s->apbexp[offset_to_ppc_idx(offset)];
         iotkit_secctl_ppc_sp_write(ppc, value);
         break;
-    case A_NSCCFG:
     case A_SECMSCINTCLR:
     case A_SECMSCINTEN:
-    case A_BRGINTCLR:
-    case A_BRGINTEN:
         qemu_log_mask(LOG_UNIMP,
                       "IoTKit SecCtl S block write: "
                       "unimplemented offset 0x%x\n", offset);
@@ -553,6 +568,8 @@ static void iotkit_secctl_reset(DeviceState *dev)
     s->secppcintstat = 0;
     s->secppcinten = 0;
     s->secrespcfg = 0;
+    s->nsccfg = 0;
+    s->brginten = 0;
 
     foreach_ppc(s, iotkit_secctl_reset_ppc);
 }
@@ -623,6 +640,7 @@ static void iotkit_secctl_init(Object *obj)
     }
 
     qdev_init_gpio_out_named(dev, &s->sec_resp_cfg, "sec_resp_cfg", 1);
+    qdev_init_gpio_out_named(dev, &s->nsc_cfg_irq, "nsc_cfg", 1);
 
     memory_region_init_io(&s->s_regs, obj, &iotkit_secctl_s_ops,
                           s, "iotkit-secctl-s-regs", 0x1000);
@@ -652,6 +670,8 @@ static const VMStateDescription iotkit_secctl_vmstate = {
         VMSTATE_UINT32(secppcintstat, IoTKitSecCtl),
         VMSTATE_UINT32(secppcinten, IoTKitSecCtl),
         VMSTATE_UINT32(secrespcfg, IoTKitSecCtl),
+        VMSTATE_UINT32(nsccfg, IoTKitSecCtl),
+        VMSTATE_UINT32(brginten, IoTKitSecCtl),
         VMSTATE_STRUCT_ARRAY(apb, IoTKitSecCtl, IOTS_NUM_APB_PPC, 1,
                              iotkit_secctl_ppc_vmstate, IoTKitSecCtlPPC),
         VMSTATE_STRUCT_ARRAY(apbexp, IoTKitSecCtl, IOTS_NUM_APB_EXP_PPC, 1,
-- 
2.16.1

