Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp741546wrd;
        Mon, 20 Aug 2018 07:19:06 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPz1vJeqMpAsFshuEdbOec0D4kTBWiIiTClMsKVWB3i610ROeyd9OkH/zyDU1pVWjQXQig8K
X-Received: by 2002:ac8:35c8:: with SMTP id l8-v6mr46265744qtb.409.1534774746528;
        Mon, 20 Aug 2018 07:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534774746; cv=none;
        d=google.com; s=arc-20160816;
        b=PGMgUmKTxFnrtMtarOJTK1Qn0LZsWDS/CAf5Nx63Z5ZvxI0cl0a4STmGOG97UFCVO1
         qoMecMK0jaIc3CBY/1WtoXlYAclGYWo700A0ZQU4g3DawnlvjiLyvSF9PGVYdgnCktkB
         Ocf2DQ3KEPPALVZ0zjY7ANtcjKa6dQkIi6IcI3lTNgkziIog+dNg031k+guuYk3/QFG8
         5TiLwWB2WTwsinhw+EblNmYI7GRFfclOZGyECKUS+cEzA2p+UruFTthp5B535AoRrkGR
         zuegeUuPQASKP7w5zVXRGiDtb0Eh99aOcJFGK9CXXLNjPR9obMdF/1wYFe/F4KqVt/w/
         PLeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=C6hkcg0fXwkGprEkD1I5g3Tj7NxRh+HRO43IkxBikFo=;
        b=SzctqrKVrpNW1Dr60th7q769ZPTDnw8EGb1Dhp2S2DnehFqbS5ELz0sH7FoIB1x3Sa
         R89ofqJuxnsvUWicF/RXEY+8GIYAA9ucyOrji3xl3RJ93sQQqsOqrWEEk33rJtdJ0LnA
         9+Rcp0d8vSiUJhXGFohP1/wieWtzQTyGLQ6VFGf61fNz2rIdhl7VhaKzXFI1huAZ6ios
         tjDvsekss4MzizP9zDPOQZHKOSUqpVGww3qkJ0l5IXtG9/EwKtKb6gXqk1AxFLdVEz5o
         ry8kR2EErOnj8Wy51B+7kUS8iuZo19j4soSUPeheRSvgqgHstvYNzoY3cKPfpb1igG1e
         DA5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v188-v6si2483291qkb.323.2018.08.20.07.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:19:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47338 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frl1N-0001LF-VI
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:19:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frku8-0003Xv-1L
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frku7-0007IR-1j
	for qemu-arm@nongnu.org; Mon, 20 Aug 2018 10:11:36 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44638)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frku6-0007GM-OY; Mon, 20 Aug 2018 10:11:34 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frku4-0003Qy-Me; Mon, 20 Aug 2018 15:11:32 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:11:06 +0100
Message-Id: <20180820141116.9118-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 12/22] hw/misc/iotkit-secctl: Wire up registers
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m7QGlA3C5HAy

The IoTKit does not have any Master Security Contollers itself,
but it does provide registers in the secure privilege control
block which allow control of MSCs in the external system.
Add support for these registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.18.0

