Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BA6D6AB17
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 22:01:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8Q2Z-00007F-SS; Thu, 02 Apr 2026 17:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q2W-000050-Ib
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:57:24 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q2T-0007CN-GV
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:57:23 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-66b2f6e983bso2260793a12.0
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 14:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775167040; x=1775771840; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iq6P3SESs/IOCtPL61KoE1DsZM3683YfrNg3jTL5uxc=;
 b=N3lcUhX315uXxCps8mesZsW4BlznRcdmf1RaNaShhwHw4NcLcWnZyB8E1nmZTrVpZs
 8mEzC3F9hlkz93b/FGEJF1eSOVK/P4AxJb1JPRIuWO6Ig4I2TF8rWpgAXnKSLNWeP2pA
 xpj2B5BYnBfRAt+8XZkwO9ODjcE6hRW4PnggimQYJmzUvaXHxkToreyQx9n2vBk8d10G
 CmlmNVFHFGTj0XlwBDE+Y/ZMU5vdxorUiLpvt/vH0UKQ3k6JcAgZt+PIwSpUwFEFkKcY
 70i4Q3cGRoJzm5aKi2PryL9FC1+88Fr+PbiOsWRTXQasQdd/bYyIDoft4jWZ5L8KicpI
 dgbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775167040; x=1775771840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Iq6P3SESs/IOCtPL61KoE1DsZM3683YfrNg3jTL5uxc=;
 b=E1ygaQ5rXVIFjPFsFMeF0MPLknji+aQRm4TTRa+4+pK+DuysG8Tvd4ujUZX5H78rrQ
 AEZwQjd5HXE2JBkCtXW2lSqx++QkqsAF6p/P7oKKYLH2yj99PgqQaH7c3w9e4eP1TEnB
 wI6+W8RaYpiPBcKutT6azwXTaipyj0QYIfc32ier3PCeZYSEM1kQbBn8N8R2732b304B
 S/v94q6Dvy9STJLOPa6tRUUVhPBY0g2sBpT9oiXcUjGXCDprOnB147DBuctGaOcmDLuf
 MKYzj4uV7varKXcH41hJ6jetBrva5jp3xPa5y76AWUJXYfVsmSOo+fJHlkDgTzFncFaP
 jb6w==
X-Gm-Message-State: AOJu0Ywjn+b6E2jzsqvPjYNnnvGBHvtQCXNYWOPl2OdUI2S2ewptjzyx
 dgQOZRxo6wWWEDl1rgnkhtWEpJwzG7WYuDJrKVPj7gsQJB/mwkWRq8VGAVVWHren
X-Gm-Gg: AeBDietnwWpKOvFgKWac8pOyOaHxGmcDsFvYGnAUEod9xqTBQrHKJaP77saxyJRFxes
 Qm2d5q0k+x6ipx4+56ZK+TfiVmN6rbgFroHzgHXmNPn8OWm551CIuCcrMeiVmlyxtnDNY/6g0NT
 CVsJommGAA7Gv9uywqR/bwsTuy5gUevkvs+hEkCmnzWgY+QwdKzSqZfLBQzStogv1XLgay3xbT0
 o0Zr3HKnzxPKo84ElxQ4XnuBPnCCnsyspPstkKZUPaNk8wuzPTh6rZ0idT5prZ9tM18XFla7VYF
 E2w16Ri6w3wzn41+ZP2JkGR85QksRlwk6uR3dnG3yqa8NLH77SNqqLXZcdr8FFqZpUj3L4OQjH/
 HYY1Ny9BN5h46rYPXBDbakrEuzB+Eh36zu4S1DlhO1a7zl5pujui56AKtgwnr2ryLbvCeKtDdb2
 E/nIRxrR32aI3Dc8eicIHHdMm6tXMVpf16JiLAr5MntRhfhfwP9eKJ6Ov6kiQlCkBPMpmeHq9vM
 yA/ZBtr
X-Received: by 2002:a17:907:a44:b0:b9b:207c:f7b7 with SMTP id
 a640c23a62f3a-b9c6768d2e2mr27200266b.3.1775167039942; 
 Thu, 02 Apr 2026 14:57:19 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-182-244.adsl.net.t-com.hr.
 [93.143.182.244]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b9c3cac0e1asm134009166b.27.2026.04.02.14.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 14:57:19 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v3 21/33] hw/arm/arm_generic_fdt: Add support for host-backed
 RAM regions
Date: Thu,  2 Apr 2026 23:56:06 +0200
Message-ID: <20260402215629.745866-22-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402215629.745866-1-ruslichenko.r@gmail.com>
References: <20260402215629.745866-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Add the ability to dynamically map QEMU host memory backends to
guest memory using configuration from the Device Tree.

To map a host memory backend, memory region nodes with the
'qemu-memory-region' compatible string and the 'qemu,ram' property
must specify a 'qemu,host-id' property containing the memdev name.

The corresponding memory backends can be specified via the command line:

...
-object memory-backend-file,id=mem0,mem-path=memory.img,size=256M
...

If no host backend is found, the initialization will fall back to
standard anonymous memory mapping.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/arm/arm_generic_fdt.c | 96 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/hw/arm/arm_generic_fdt.c b/hw/arm/arm_generic_fdt.c
index 7b50957a82..de121820e0 100644
--- a/hw/arm/arm_generic_fdt.c
+++ b/hw/arm/arm_generic_fdt.c
@@ -43,6 +43,98 @@ struct ARMGenericFDTState {
 
 OBJECT_DECLARE_SIMPLE_TYPE(ARMGenericFDTState, ARM_GENERIC_FDT_MACHINE)
 
+static void map_host_memdev_node(FDTMachineInfo *fdti, const char *node_path)
+{
+    int len;
+    uint64_t mr_size, backed_size;
+    Object *mem_obj;
+    Object *backend_obj;
+    MemoryRegion *mr;
+    MemoryRegion *backend_mr;
+    MemoryRegion *container;
+    HostMemoryBackend *backend_mem;
+
+    const char *compat = qemu_fdt_getprop(fdti->fdt, node_path,
+                                          "compatible", &len, NULL);
+    const char *host_id = qemu_fdt_getprop(fdti->fdt, node_path, "qemu,host-id",
+                                           &len, NULL);
+    bool is_qemu_ram = (qemu_fdt_getprop(fdti->fdt, node_path, "qemu,ram",
+                                         &len, NULL) != NULL);
+
+    if (!compat || strcmp(compat, "qemu-memory-region")) {
+        return;
+    }
+
+    if (!is_qemu_ram || !host_id) {
+        return;
+    }
+
+    mem_obj = fdt_init_get_opaque(fdti, node_path);
+    if (!mem_obj) {
+        return;
+    }
+
+    backend_obj = object_resolve_path_type(host_id, TYPE_MEMORY_BACKEND,
+                                            NULL);
+    if (!backend_obj) {
+        warn_report("No mem backend found for FDT requested host-id %s",
+                    host_id);
+        return;
+    }
+
+    backend_mem = MEMORY_BACKEND(backend_obj);
+    backend_mr = host_memory_backend_get_memory(backend_mem);
+
+    mr = MEMORY_REGION(mem_obj);
+    container = mr->container;
+    if (!container) {
+        warn_report("No parent found for requested host-id %s",
+                    host_id);
+        return;
+    }
+
+    mr_size = memory_region_size(mr);
+    backed_size = memory_region_size(backend_mr);
+
+    if (backed_size != mr_size) {
+        error_report("Unable to map host backed memory: %s, "
+                        "dts size: 0x%" PRIx64 ", but memdev size: 0x%" PRIx64,
+                        host_id, mr_size, backed_size);
+        exit(1);
+    }
+
+    hwaddr base_addr = mr->addr;
+
+    memory_region_del_subregion(container, mr);
+    memory_region_add_subregion(container, base_addr, backend_mr);
+
+    fdt_init_set_opaque(fdti, node_path, OBJECT(backend_mr));
+    object_unparent(mem_obj);
+}
+
+/* Parse device-tree starting from 'node' and attach file-backed RAM's */
+static void map_host_memdevs(FDTMachineInfo *fdti, const char *node_path)
+{
+    int i;
+    char **children;
+    int num_children = qemu_devtree_get_num_children(fdti->fdt, node_path);
+
+    if (num_children > 0) {
+        children = g_malloc0(sizeof(*children) * num_children);
+
+        num_children = qemu_devtree_get_children(fdti->fdt, node_path,
+                                      num_children, children);
+        for (i = 0; i < num_children; ++i) {
+            map_host_memdevs(fdti, children[i]);
+            g_free(children[i]);
+        }
+
+        g_free(children);
+    }
+
+    map_host_memdev_node(fdti, node_path);
+}
+
 static void init_machine(void *fdt, ARMGenericFDTState *s)
 {
     FDTMachineInfo *fdti;
@@ -63,7 +155,9 @@ static void init_machine(void *fdt, ARMGenericFDTState *s)
     /* Instantiate peripherals from the FDT.  */
     fdti = fdt_generic_create_machine(fdt, NULL);
 
-    mem_area = MEMORY_REGION(object_resolve_path(node_path[0], NULL));
+    map_host_memdevs(fdti, "/");
+
+    mem_area = MEMORY_REGION(fdt_init_get_opaque(fdti, node_path[0]));
 
     s->bootinfo.loader_start = object_property_get_int(OBJECT(mem_area),
                                                             "addr", NULL);
-- 
2.43.0


