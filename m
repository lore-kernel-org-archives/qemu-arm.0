Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D6310ED660
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 11:23:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w65Dk-0001Bl-J6; Fri, 27 Mar 2026 07:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65Ca-0007ju-Be
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:18:08 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w65CX-0000GJ-4J
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 07:18:07 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-439bcec8613so1482531f8f.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774610280; x=1775215080; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1bFuTPS3UTloN9GePWn+4uta9cNIKepddcVURPyhzcE=;
 b=g9HJU6ypSgFWlnmGM2ZZPHM/GqKKagifzBykiBZP2fBtXpWDnsDc9FDvEn13QTaozP
 OKckfMzX3uIyQLh9fs7r1nKEKxmUs4089DQ3YFyIPjfylId/srojm9YBgVUys0Cb8gAG
 U2UDqxW+kmCFyGypKexteakJsY2EsaIdfgdMid9NS4LYnbbd1SkyGQskeVdzSGmd13iH
 KbIgcq+wPlZB6RzrpAFseYf/58diqmCcoPFb81uR6t3hk19BqmivgwzV+RsFYpQ1k5s+
 AgoKtBJNnwfBiC0lHpCb7JE1BPlVWCS59pXOW2FyUcwntNSg3BHyiBFsi2Q9Naug5lZj
 NTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774610280; x=1775215080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1bFuTPS3UTloN9GePWn+4uta9cNIKepddcVURPyhzcE=;
 b=BeejZhO9Pup/Lj3sajfsOEtw6Lg5a3IMViM/WkKV6PVAImAAVUcIGpqCrilPNtIWTe
 kaWU0F9oLGJ/VT6OwKhBhGlszgzG30Rgufr7yeDA0yeQ/RgEDo5qmzc+kLRBgT8QOnyQ
 z40SPjIcTPpL1/mE+OlhDJRPahk4tUPg2zjMMXO0Lcv6E7qrUp/mGPItNKGJe4rEGLGL
 WKW3Uuv75cAdtG81i0R3f7SOrcsP2mL/01brBGNtyZB5b6KoVlc/IITIYtGvRooBz7Vg
 d2RHbd1MSgmJ8/feU6HjfWB0rFiCTrLJI6/bsZXeyFdV1120uaZybZ5D8nqQ3qiHn4KC
 gd6g==
X-Gm-Message-State: AOJu0YyBpefKbWiWZf2brJ0hVjRntY3sL7ObrzvuitRwSO+VulwYRr7e
 UyTIAn41eYQnK0CyABPs+xqvCSJWxwdMpFcHpaHlqxWuAzc4urh1OBG1lFlh/9InqeeIZ9PIBdK
 yPaaO8hA=
X-Gm-Gg: ATEYQzy+NGb6jvAkcYeIan8PeUsqFz76JpVx7dxhPhijpy5yloaKcZpgL65pQtLijXz
 s6PNPlHziMo2TPseGESnc1H7aX1oO+wasVL9TlWluNvRlfJ7wmazOZJDicxjaF4Z1TjHoCLil6v
 yWY7zGMghHPnHS4BEqr2DezvLu28zyvvXFhB+ApiaNhyel1UXuD/kaD/ZYEG+F/8SHKwQmKSOfS
 6pDLaL5a6bS3XWOxlQmvJ8FFHQalGi0xUq/ez0Eu+nTT0aN71/bIPZDg7+EO1HMMPaddwNz1FSH
 fkk+2MM7b9ujjGD55iyyrtu8PgqZZqidCEw0RXOvAbEmBCqPrEb+6BbYaPTdHlZT86gBxU6qTeT
 DvajJPNdaH2mm2/W4jgL5n5icmCfo4pN3ExItcQIqt19wYGOdVOUSkDHU1O62TJ12Ws0Dm4Bt7c
 ZSVnvQXUKw0HM+57ojltku8CbagbH6ZuTmXOgi91lzsZn2RPC7os5xb6eQQuwnYhSs3ESpLdTkQ
 FpubaXE6unxJm9RZ9jPDMGbbQ1Fx6Y=
X-Received: by 2002:a5d:64e4:0:b0:43a:16aa:1448 with SMTP id
 ffacd0b85a97d-43b9e9e8f13mr3404046f8f.22.1774610280282; 
 Fri, 27 Mar 2026 04:18:00 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf2b2sm15484227f8f.18.2026.03.27.04.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 04:17:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: [PATCH v2 61/65] hw/arm/virt: Advertise GICv5 in the DTB
Date: Fri, 27 Mar 2026 11:16:56 +0000
Message-ID: <20260327111700.795099-62-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
References: <20260327111700.795099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Advertise the GICv5 in the DTB. This binding is final as it is in
the upstream Linux kernel as:
Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/arm/virt.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b6a04f868b..7a34af766a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -794,6 +794,72 @@ static void create_v2m(VirtMachineState *vms)
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
+     * The "cpus" property is an array of phandles to the CPUs, and
+     * "iaffids" is an array of uint16 IAFFIDs. For virt, our IAFFIDs
+     * are the CPU indexes.  This function is called after
+     * fdt_add_cpu_nodes(), which allocates the cpu_phandles array.
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
+     * When we implement the GICv5 IRS, it gets a DTB node which is a
+     * child of the IRS node.
+     */
+}
+
 static void create_gicv5(VirtMachineState *vms, MemoryRegion *mem)
 {
     MachineState *ms = MACHINE(vms);
@@ -835,6 +901,8 @@ static void create_gicv5(VirtMachineState *vms, MemoryRegion *mem)
      * that information is communicated directly between a GICv5 IRS and
      * the GICv5 CPU interface via our equivalent of the stream protocol.
      */
+
+    fdt_add_gicv5_node(vms);
 }
 
 /*
-- 
2.43.0


