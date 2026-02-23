Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349E4EC1115
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:10:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZMv-0006Ld-Ea; Mon, 23 Feb 2026 12:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZLF-0002wG-7x
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:32 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZL9-0000Sf-Tx
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:28 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso50778875e9.0
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866201; x=1772471001; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p/a7uEL7hLfdBbmhtWHUOjRbCfekgNn59cldCooxS+c=;
 b=kpLQPmIRpwMaPsR6WJskdeefQgsjkw8f20QEddBnu00t5IkCu2BOFYYqXYonh5tVbi
 ddV3flQz/amaWJGu+DPVNCU+4xvuWQNfgH7uT/hew1YQv1bOG0TqSW6zuH156Xr/B5MX
 n6TUoK82jShW4N+e1DZinpLEriAqSJ3ZSy0MHIeadpyAFYgMmACA6n5YrFdvhYVzR/PL
 +vQR72jaDpvBo1sfbT32mgRSpDaC1f9BkgKbHV+m5yWdEVYaca7WjlQqq606TRqvddMc
 DyVm6sGB94cnY+u3xuZdK+AQahfjCi2AYbvWgDqIXWUrseAC9WXGR6RXT77ArgoYhcP5
 fDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866201; x=1772471001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=p/a7uEL7hLfdBbmhtWHUOjRbCfekgNn59cldCooxS+c=;
 b=IiC+IDxdFoe987PpnRnvIJDuzoF3PMN0CAHNNBZ8n7z+H6utTJXfQh3W7rFj17gnko
 KzOOGyCeSdTRO7bueclsof5bXuVwzAygaiq32OF7T2XA22X2iRSpp5lpZoqG/Fe6EAKE
 xDtPVmQYbunZjGfQ1FGNjKKQo9jDe/7lSoMNNuqMY0+ocszQcYi6LYc9L44K0W/S1di9
 3PD2LbycGeG7sAEK4Z906jMZpw7u4vkP5E35h6lwVceszsEvQrME9bv83xqKCDIURT+2
 5P5oRPTxQdl5JJI7PP3NmSA3enOEYnOPE0GA+WQag0ygy2TjvcJarvxVl6IAdmmKtBpJ
 D7ww==
X-Gm-Message-State: AOJu0YwBQVuPILmn/+Zs8Fc3ppKR89fQ+2tIhOEhHJIkJ491Hpx1z/07
 Vkl+t3GI+lShFYsBihPpOJppT2Z6HkRzySZA6JkLS2ne4HmTvS7xNbvO/vSn2cecpFqD9YXWeSh
 XE/9j
X-Gm-Gg: AZuq6aK72TTNKIcOBt6D4XQDK5zgHpUSrrIRiPUZvtSSU/taAIncCYBzbmORsALOhJQ
 y6xRNpAER0wzmHZ6HNAZ8HWRlsaD+fBlRTH/S6c4SHP6kGZVpcnbe4w5jCJrWAov07xeyZ7sKy5
 0Y1Dm88099K+GlX4N3hdWI8A6NmBZJ9QmOyw7yQYtPBzPnVC1QitJkXRMLpottuQyeTSGvIz08k
 ggWdCtAxjQmvtU5ItCNdfqXCfDRYBjSdHh32E3ZISEE4jfNuDwQlCXtCuXsfoIVRxFp271uCy+l
 /me3p/n42y1DKL1Obz95UcJjZj3yYYyOqw39weCI4KnzhDCydQS9xZj5Gi74GSiq/9V4eex3yOk
 VgXlIzvsTinX3hxNYd7OVvzlxQIrmNu9G5+BdRsYop9pORTlkSdwpYa+SzFpf7jFHpf5lD9Q73x
 YUiFinKCde8halAOpoQdzjvhf3DdCmwqPT+B9sxWLVpTHEVDto9uBocFNjRhie7pNDLMan0rTck
 chE7O29U3z/RRah5xyWcDH08EZ13Vg=
X-Received: by 2002:a05:600d:6413:20b0:483:78e7:ce15 with SMTP id
 5b1f17b1804b1-483a00aa4cdmr174653315e9.13.1771866201190; 
 Mon, 23 Feb 2026 09:03:21 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 61/65] hw/arm/virt: Advertise GICv5 in the DTB
Date: Mon, 23 Feb 2026 17:02:08 +0000
Message-ID: <20260223170212.441276-62-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Advertise the GICv5 in the DTB. This binding is final as it is in
the upstream Linux kernel as:
Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a9addf5ac0..6775062c5d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -795,6 +795,72 @@ static void create_v2m(VirtMachineState *vms)
     vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
 }
 
+static void fdt_add_gicv5_node(VirtMachineState *vms)
+{
+    MachineState *ms = MACHINE(vms);
+    const char *nodename = "/intc";
+    g_autofree char *irsnodename = NULL;
+    g_autofree uint32_t *cpu_phandles = g_new(uint32_t, ms->smp.cpus);
+    g_autofree uint16_t *iaffids = g_new(uint16_t, ms->smp.cpus);
+
+    vms->gic_phandle = qemu_fdt_alloc_phandle(ms->fdt);
+    qemu_fdt_setprop_cell(ms->fdt, "/", "interrupt-parent", vms->gic_phandle);
+
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle", vms->gic_phandle);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "arm,gic-v5");
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#interrupt-cells", 3);
+    qemu_fdt_setprop(ms->fdt, nodename, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#address-cells", 0x2);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#size-cells", 0x2);
+    qemu_fdt_setprop(ms->fdt, nodename, "ranges", NULL, 0);
+
+    /* The IRS node is a child of the top level /intc node */
+    irsnodename = g_strdup_printf("%s/irs@%" PRIx64,
+                                  nodename,
+                                  vms->memmap[VIRT_GICV5_IRS_NS].base);
+    qemu_fdt_add_subnode(ms->fdt, irsnodename);
+    qemu_fdt_setprop_string(ms->fdt, irsnodename, "compatible",
+                            "arm,gic-v5-irs");
+    /*
+     * "reg-names" describes the frames whose address/size is in "reg";
+     * at the moment we have only the NS config register frame.
+     */
+    qemu_fdt_setprop_string(ms->fdt, irsnodename, "reg-names", "ns-config");
+    qemu_fdt_setprop_sized_cells(ms->fdt, irsnodename, "reg",
+                                 2, vms->memmap[VIRT_GICV5_IRS_NS].base,
+                                 2, vms->memmap[VIRT_GICV5_IRS_NS].size);
+    qemu_fdt_setprop_cell(ms->fdt, irsnodename, "#address-cells", 0x2);
+    qemu_fdt_setprop_cell(ms->fdt, irsnodename, "#size-cells", 0x2);
+    qemu_fdt_setprop(ms->fdt, irsnodename, "ranges", NULL, 0);
+
+    /*
+     * The "cpus" property is an array of phandles to the CPUs, and "iaffids" is
+     * an array of uint16 IAFFIDs. For virt, our IAFFIDs are the CPU indexes.
+     * This function is called after fdt_add_cpu_nodes(), which allocates
+     * the cpu_phandles array.
+     */
+    assert(vms->cpu_phandles);
+    for (int i = 0; i < ms->smp.cpus; i++) {
+        /*
+         * We have to byteswap each element here because we're setting the
+         * whole property value at once as a lump of raw data, not via a
+         * helper like qemu_fdt_setprop_cell() that does the swapping for us.
+         */
+        cpu_phandles[i] = cpu_to_be32(vms->cpu_phandles[i]);
+        iaffids[i] = cpu_to_be16(i);
+    }
+    qemu_fdt_setprop(ms->fdt, irsnodename, "cpus", cpu_phandles,
+                     ms->smp.cpus * sizeof(*cpu_phandles));
+    qemu_fdt_setprop(ms->fdt, irsnodename, "arm,iaffids", iaffids,
+                     ms->smp.cpus * sizeof(*iaffids));
+
+    /*
+     * When we implement the GICv5 IRS, it gets a DTB node which
+     * is a child of the IRS node.
+     */
+}
+
 static void create_gicv5(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
@@ -836,6 +902,8 @@ static void create_gicv5(VirtMachineState *vms, MemoryRegion *mem)
      * that information is communicated directly between a GICv5 IRS and
      * the GICv5 CPU interface via our equivalent of the stream protocol.
      */
+
+    fdt_add_gicv5_node(vms);
 }
 
 /*
-- 
2.43.0


