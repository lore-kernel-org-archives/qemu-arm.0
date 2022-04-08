Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp404557lfq;
        Fri, 8 Apr 2022 07:48:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSG6k3U+FTUZtJ9b6jDhfoNoSiYnXJ79Wl2gTTammlAYyf/Ax9KVkQ2fQzniGq95Lbi5de
X-Received: by 2002:a25:bb82:0:b0:63d:88fe:6e41 with SMTP id y2-20020a25bb82000000b0063d88fe6e41mr15147214ybg.292.1649429286250;
        Fri, 08 Apr 2022 07:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649429286; cv=none;
        d=google.com; s=arc-20160816;
        b=1FOazDUS+wi1gDD6ht8bquckfSwrDGGJuE1cYsgV7n8apiajIZo5wi6EVnZMWFCOCA
         kcxRJn90taWkdk6Wsn5bBnnv7CVH8ezMPfT/dJ5IhmN1hsm01QcOTh5TpvkX2ZMr4dxv
         XpFR2qz8FadC99OuXr4uiyfGJ3kDJoyaDlHjE2yU3+I6BpzO6AP2OXwC532BxROxQzxX
         GSQL1fum6m2D3PpH5iCjgnEUFuGLxack6QWHz/16sbOvx5xqEORFSuzVhaSRhEvHDo3S
         Z7a3SJpHwDy+X1J1RKUOnG41VRhzozS2kBh50urnWcZdLTEOKt+ztM1xCde9jWzAhsKw
         PtSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5zSoEvcrQQwqi7GYc6f0O7/9jPr6MDaUmhyGqTfq6Ic=;
        b=MEEn3HromTjjuJBIoydhyx2PRIQ8ZYW459SaRVBgx10uu6DytXxulVmh1OiXhkWrp5
         3VLJFoNCkjG+Z9o7fhGklTAIAPSyhJl6uvZ9GNAMRJdOaQeA8Dc/nBZqJCiu8l2GyLK/
         9uTxv1Vs2bW/gh1+kufoUaTSdAiKC+1ByfKD5PaUgAvcXrQFqiEtm3NEw/OLsLxEDMS9
         SppOohc0QF4anzRaUQKvqDVzFCd6HgNUaMvGeEii1ItW6oMgq3pADKxd5YQdklEkTBCz
         4kZuU0o1taHolX22PKgBud2EyKudWEQSfLUNXfqo6RBipf3jKrAJrFs1X2Cu2qc9L23E
         +Whg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pj1cJYTG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s35-20020a252d63000000b00633994043besi650134ybe.40.2022.04.08.07.48.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:48:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pj1cJYTG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpu9-0004GC-Ms
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPd-0007VE-GA
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:33 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPb-0002Uk-5W
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:33 -0400
Received: by mail-wr1-x42c.google.com with SMTP id w21so13101631wra.2
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5zSoEvcrQQwqi7GYc6f0O7/9jPr6MDaUmhyGqTfq6Ic=;
 b=Pj1cJYTGUqBPF9V9k4dRX5TXxL4jk/EWBFUOzO/Ky8ZaJaBj08DP0v2Oy2MdJNm6ho
 4cRCbvbIHV3oSp9CbFzDKBvi1UU9Xzp75ESDyhtMFBZFUoNdiVQ9hnNcUtiy/xxr6XXH
 oSZFrmz+LljeItSeDTY0lrrC/PZ/Ne/2WU6/5aTobA+ZAijh2HFqv5o2A7PolLgWnD3A
 eJ5z7a0ahQtIJbFgkMnuS3+ZeVQgdt4XWAmaceJ6rKVAPfhTz8ZFxlWr/sVU8VDJ6Mkb
 Ryj/wNCLnPh+w/hwMhukr9AXZFMNYMADqFKlpd4WJLEDDO6Y1jZ+nAIKKfi3SVqpDaVW
 bGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5zSoEvcrQQwqi7GYc6f0O7/9jPr6MDaUmhyGqTfq6Ic=;
 b=6CSKfzIWG6I0J5B0EeE3zLwDQyVBKycbxTkzQMHeoJL416SUYj73PQenQYe6YAMbmU
 +15PYCvWjtfOxbjJ4q+vG377c6ig1GfRZW3Y6fuVRT6LMK4bVxcEm4gpTlCncYslJ+ut
 X0Pu1tqBdzme7TqiKvbTDiDaDjRplHS7iDmHbJfn8K2wKEiP1FTT/HxMe7goC65UvhFX
 P+FLYdvf6F8BFPtH2lv4erHLKAIf4dQEagECDQbjoeAOp5w3ktps3dYEKArX2zIZxvk0
 XFU2MfPq7GsJK+CmH8XJDIG6tXI/O50PAuDMzqHtblj4dFPQeBOE0rE82wZ8o9GjDaQI
 dZuQ==
X-Gm-Message-State: AOAM5319iWkfMaUEUTXmA9toCDw5wW9XSa1bSZdDwZF3GeT+o5Vau5hP
 yBZJ95mOeJMna3dbfwlRjYPywacBLZVy8Q==
X-Received: by 2002:adf:ea44:0:b0:206:1761:715a with SMTP id
 j4-20020adfea44000000b002061761715amr14798492wrn.534.1649427389843; 
 Fri, 08 Apr 2022 07:16:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 40/41] hw/arm/virt: Abstract out calculation of redistributor
 region capacity
Date: Fri,  8 Apr 2022 15:15:49 +0100
Message-Id: <20220408141550.1271295-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tkhH3AgCJ0RO

In several places in virt.c we calculate the number of redistributors that
fit in a region of our memory map, which is the size of the region
divided by the size of a single redistributor frame. For GICv4, the
redistributor frame is a different size from that for GICv3. Abstract
out the calculation of redistributor region capacity so that we have
one place we need to change to handle GICv4 rather than several.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/virt.h |  9 +++++++--
 hw/arm/virt.c         | 11 ++++-------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 7e76ee26198..360463e6bfb 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -185,11 +185,16 @@ OBJECT_DECLARE_TYPE(VirtMachineState, VirtMachineClass, VIRT_MACHINE)
 void virt_acpi_setup(VirtMachineState *vms);
 bool virt_is_acpi_enabled(VirtMachineState *vms);
 
+/* Return number of redistributors that fit in the specified region */
+static uint32_t virt_redist_capacity(VirtMachineState *vms, int region)
+{
+    return vms->memmap[region].size / GICV3_REDIST_SIZE;
+}
+
 /* Return the number of used redistributor regions  */
 static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
 {
-    uint32_t redist0_capacity =
-                vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
+    uint32_t redist0_capacity = virt_redist_capacity(vms, VIRT_GIC_REDIST);
 
     assert(vms->gic_version == VIRT_GIC_VERSION_3);
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 594a3d0660a..577c1e65188 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -723,8 +723,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     }
 
     if (vms->gic_version == VIRT_GIC_VERSION_3) {
-        uint32_t redist0_capacity =
-                    vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
+        uint32_t redist0_capacity = virt_redist_capacity(vms, VIRT_GIC_REDIST);
         uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
 
         nb_redist_regions = virt_gicv3_redist_region_count(vms);
@@ -743,7 +742,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
 
         if (nb_redist_regions == 2) {
             uint32_t redist1_capacity =
-                    vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
+                virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
 
             qdev_prop_set_uint32(vms->gic, "redist-region-count[1]",
                 MIN(smp_cpus - redist0_count, redist1_capacity));
@@ -2048,10 +2047,8 @@ static void machvirt_init(MachineState *machine)
      * many redistributors we can fit into the memory map.
      */
     if (vms->gic_version == VIRT_GIC_VERSION_3) {
-        virt_max_cpus =
-            vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
-        virt_max_cpus +=
-            vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
+        virt_max_cpus = virt_redist_capacity(vms, VIRT_GIC_REDIST) +
+            virt_redist_capacity(vms, VIRT_HIGH_GIC_REDIST2);
     } else {
         virt_max_cpus = GIC_NCPU;
     }
-- 
2.25.1

