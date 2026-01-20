Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77523CA5FB8
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 18:04:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viG5N-0007AK-Hb; Tue, 20 Jan 2026 13:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viG4v-0006b9-IT
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 13:03:52 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viG4t-0000T5-Uy
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 13:03:45 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-430f57cd471so3012185f8f.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 10:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768932222; x=1769537022; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCPqRpQUUqzqFmpPhdz1jQmtLeDG3BlVkhJSsKOlHuY=;
 b=UbOU/51hS0AOV++3d6AIMK6JVnfRAwVUZf0KTeI5o81yHnvBIxHPYrhZuXdf3hGUaD
 n62Yj19EHtXvAfKt3coMto3Dehu8VftE6ggd+itI2BUy0k6JURWVlF3tWKAnt3LxSVY0
 67aIJ2LUIuKT7tYHdR6hQgPbCcj4LrQO/yHX4dV5Koq6T0ApuX4yHSu8Fot2J1aBAfNH
 BaVE20E8FtLetOvVU3aD6kMw4zFC+AHCfNIzTUiRO3Fx/pPWfqQ8QsR+7kuCCwP1Di65
 SDJz+J9XtIxGzoSpKonka1sOB6m3dCSKoHaRPsobQMD1gxuheHKiMCm9W5KpLQvswC0b
 Cx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768932222; x=1769537022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jCPqRpQUUqzqFmpPhdz1jQmtLeDG3BlVkhJSsKOlHuY=;
 b=kvd1smmz76DF/i9x6PDyBxVrAHvx6/KK8J22ZvBHYPCUzI+A+TBmN84+XswkoSfJ2Y
 vJBbC6NGjWockP7kZK8YL53kwfGt/Ffpdq+YQ/fTvmk7zgl/jn2vSvWv+0l6VD2MUt8M
 Mzs6a6FvHrIZL+aCIVqCJI9Izjmis/+9WZtYjy9QyUxb/XSPxrJBk33Khik9MpLNqp8F
 V/qgp+1Sv67uDG3hwMNTXVybSXqFG2DVot+w+FNg//z0v4PZTylH+auXbgp+LMMEANW2
 CSQ+fXavTwWso5YM5RrCQYYTQX7HBxE/XQu+DfDbqt56qHnzQSHrmNbWXPwvlzvNgZZG
 rbDw==
X-Gm-Message-State: AOJu0YyHKMA2KauMWHQ8t+5E2OBhTUULNNfAnDAMkHhYV4cjnAhjVHAj
 198EhBOKyWaMiFxM8tf6WjMQNTegwWif3j5PtfWpIvD9wI8pPPnQejBIOtRK8L4sBTZVxc9qVkZ
 fHUvitVI=
X-Gm-Gg: AZuq6aIs/GKfVL/9uAdDTu57FDRT0NpOIDFVPMZWC1b91hKoNXCjgYbEO/sS2oz68CS
 jG/aDM2ypQDR5yEJR9IyljPvGm9cGgjrBtC56m/khi/gGOpJWeHnObL4DkQvDLeieyBEs3yhcJU
 O4ei+qM+24/bFOIHYUpGP5CtvL7UqRdEgXzthnf1IhSkAXXq9Y/iRc2Xi239w+EvzcKzeb0EfQe
 Pddf0uc98lw8GNaUVVV4fUXcnwTs1Mt6IQNQ+IMky7tYTbLLjKaOLNOEl5IlCfOv7CmcN8hgT5t
 4EWT8/MLDUmR1vh6QjOkAjjuHumrgrjwflftwMCpeY/YttVMDeUQ2ZLg7Yews9mXDrHKUJ2kE++
 LOBeDr+W21Y1/mTtt4nwRzfgl7zYwhQD6UyAm6fJAgRCocyoPWHlMeFTgRDIp6dYBZZRFUCfSqN
 J2dzepUc/Tdv+HgusvC6GDTBe7MuhhQXXlMXvVAxHki24+cOYrgYcV
X-Received: by 2002:a05:6000:2281:b0:431:16d:63d7 with SMTP id
 ffacd0b85a97d-4356a05d461mr21542141f8f.47.1768932222095; 
 Tue, 20 Jan 2026 10:03:42 -0800 (PST)
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk.
 [81.2.115.146]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996cf58sm31310889f8f.22.2026.01.20.10.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 10:03:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [RFC PATCH 1/4] hw/arm/virt: Clean up MSI controller selection logic
Date: Tue, 20 Jan 2026 18:03:36 +0000
Message-ID: <20260120180339.1416328-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120180339.1416328-1-peter.maydell@linaro.org>
References: <20260120180339.1416328-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The virt board might have multiple different ways to handle MSI
interrupts: via an ITS, via the GICv2M device, or not at all.  The
logic to select which of these we use is confusing because it is
controlled by a mix of versioned-board compatibility flags, board
option flags, and open-coded logic inside the create_gic() and
create_its() functions.

Currently we set VirtMachineState::msi_controller as the very last
part of this, inside create_its() or create_gicv2m().  This field is
then used only in the hotplug pre-plug callback function.

As a first step in making this clearer to understand, move the logic
into a single finalize_msi_controller() function, which sets
VirtMachineState::msi_controller.  The actual machine creation code
can then look only at that field.  (This is a parallel to what we do
with the GIC, where finalize_gic_version() sets the
VirtMachineState::gic_version field.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4badc1a734..b55297455f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -738,13 +738,6 @@ static void create_its(VirtMachineState *vms)
     DeviceState *dev;
 
     assert(vms->its);
-    if (!kvm_irqchip_in_kernel() && !vms->tcg_its) {
-        /*
-         * Do nothing if ITS is neither supported by the host nor emulated by
-         * the machine.
-         */
-        return;
-    }
 
     dev = qdev_new(its_class_name());
 
@@ -754,7 +747,6 @@ static void create_its(VirtMachineState *vms)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_GIC_ITS].base);
 
     fdt_add_its_gic_node(vms);
-    vms->msi_controller = VIRT_MSI_CTRL_ITS;
 }
 
 static void create_v2m(VirtMachineState *vms)
@@ -775,7 +767,6 @@ static void create_v2m(VirtMachineState *vms)
     }
 
     fdt_add_v2m_gic_node(vms);
-    vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
 }
 
 /*
@@ -957,10 +948,15 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 
     fdt_add_gic_node(vms);
 
-    if (vms->gic_version != VIRT_GIC_VERSION_2 && vms->its) {
+    switch (vms->msi_controller) {
+    case VIRT_MSI_CTRL_NONE:
+        break;
+    case VIRT_MSI_CTRL_ITS:
         create_its(vms);
-    } else if (vms->gic_version == VIRT_GIC_VERSION_2) {
+        break;
+    case VIRT_MSI_CTRL_GICV2M:
         create_v2m(vms);
+        break;
     }
 }
 
@@ -2079,6 +2075,24 @@ static VirtGICType finalize_gic_version_do(const char *accel_name,
     return gic_version;
 }
 
+static void finalize_msi_controller(VirtMachineState *vms)
+{
+    /*
+     * Determine the final msi_controller according to
+     * the relevant user settings and compat data. Called
+     * after finalizing the GIC version.
+     */
+    if (vms->gic_version != VIRT_GIC_VERSION_2 && vms->its) {
+        if (!kvm_irqchip_in_kernel() && !vms->tcg_its) {
+            vms->msi_controller = VIRT_MSI_CTRL_NONE;
+        } else {
+            vms->msi_controller = VIRT_MSI_CTRL_ITS;
+        }
+    } else if (vms->gic_version == VIRT_GIC_VERSION_2) {
+        vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
+    }
+}
+
 /*
  * finalize_gic_version - Determines the final gic_version
  * according to the gic-version property
@@ -2251,6 +2265,8 @@ static void machvirt_init(MachineState *machine)
      * KVM is not available yet
      */
     finalize_gic_version(vms);
+    /* MSI controller type depends on GIC version */
+    finalize_msi_controller(vms);
 
     if (vms->secure) {
         /*
-- 
2.47.3


