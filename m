Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36434D6AB10
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 21:58:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8Q39-0000tR-Lg; Thu, 02 Apr 2026 17:58:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q2i-0000GA-7v
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:57:36 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q2e-0007GE-VR
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:57:35 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b8f9568e074so217020566b.0
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 14:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775167051; x=1775771851; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cm4Knrt01+q22g03cv2LHlISpCqmkMA20253kshEnnc=;
 b=Ms/btjQpogWBBhSkMEfuT5y12TPi2cVxUJSoyc7Xne2ojCeEovYXz71zyFKTz3uszA
 tpbDe8JUu7231r3c0fS1Lq7XWkRCEcovfG8A5e7VjjarKVPzPF7fecSY43yYlxQTcwXw
 XZd+keciCt1y85dLMKXt52uDYRH0Q6887mBmNP4jdDzO0PWboMj4w547lpCEBwYSPnv+
 r3u3TKhFGzzCVP7rvKvmREVWfL6L/wWrI1SDavpCLm6qgRhiWh/qQnoFhITM/t6wHZuj
 r98tY/bAOe7Dzq+5K81jvItKmH8TOWX4+hCU/ZiKfys4ATSeXZOyefQni1+Q0f0yrdDA
 rjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775167051; x=1775771851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Cm4Knrt01+q22g03cv2LHlISpCqmkMA20253kshEnnc=;
 b=bgad57ww1YrZgLoRFTonm/ZTF3EgwNCZuoSKjJ7svVzW80aPyZaf9x7c9V4AWB+wjc
 Gc4sJx9kV0ljdp37/cI2vQoecR/OGYBLxBxwDVvuU1ucw3XE5QF03bM43UyqJDbuOi8B
 HhG0MZYLUOQbmYE8q/gj3Rah5wbHG87gvduCRNKAk7LNJOkkTS+9ro+g0XDWm22AGB2q
 OYV9l/TQhB0sK9PlUPY338VZRw2n/shhr7IrFghXnccJxg9YTBettxmBHwq5bcE492i/
 Wnqx+z+AqmSjrB1Qac6aJEyDlo49wqpxlHWdZe3SFfRhSIpLm+KfU5Le8KP49lOthRy8
 mhGw==
X-Gm-Message-State: AOJu0YxSu5i1dl0qZIdFzpAccQt8ZDRaxq4t0ZfL4fd1Hk0Xknp/+9nC
 OH/6qUhJyO+ELnvTqZbNLe9JK49M5rikAmwbTDll1wbGesiiuw6HxBNl
X-Gm-Gg: ATEYQzxHYpnC7t0PY2ulQsuiQ5x7CyKpebyEDBrOokSJPUDjxWlLbG2sHmudK0RRuS8
 xTdOq+fZKKBvgkuIg884jUqdyJmga0aRameXboOuKizDBk0Xw30t8PQ7+0sbUpzMG0oEW1OSoDv
 hGivg0HUFa+MldXFjhyqQVFcXlpU+ZS7n2Jle66OHptSlqM3e1Ege9WvVCKxYExKXgD9TyKQ6Yn
 NGVsKGOArqt5TlvCyAjytkGIJ9/cJQo64F2FVhGLGwlujOU+EXqwYSSM/IUyQueQM5QGkK33/U9
 xFqx6VYFZcx9DOISWwRaNUSAnlfwixC59EA6f/6Ls8K3A06geIKfFiY4E4KZzU4pJudDSaa0yTR
 Segg91t3KjOIdUOEMg0Z5kda6M3PL9p33g/ON8c4hlk+5WG8B7j6Hni1yniKAiygchRqNcVrcbe
 AKcEfEBp9JG42zmzvEfpdd+WNzyilL4vLTMWXDg3DQYe7PtCIXA21qYV/XV3ZMVwAPKl4uqQ==
X-Received: by 2002:a17:907:3e8a:b0:b99:7462:3c57 with SMTP id
 a640c23a62f3a-b9c6754ad85mr23799266b.14.1775167051283; 
 Thu, 02 Apr 2026 14:57:31 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-182-244.adsl.net.t-com.hr.
 [93.143.182.244]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b9c3cac0e1asm134009166b.27.2026.04.02.14.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 14:57:30 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 28/33] system/memory: add QOM aliases for fdt support
Date: Thu,  2 Apr 2026 23:56:13 +0200
Message-ID: <20260402215629.745866-29-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402215629.745866-1-ruslichenko.r@gmail.com>
References: <20260402215629.745866-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ej1-x62d.google.com
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

The patch registers FDT compatibility handlers and
QOM aliases of memory subsystem, so that memory
regions can be created from a device tree model.

The alias 'qemu:system-memory' could be used to attach
subregion to root address space.
The system memory can also be attached to another
container with other priority, which may be used
for implementing secure memory structures.

Also 'qemu-memory-region' types can be used to create
new memory regions.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 system/memory.c | 78 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/system/memory.c b/system/memory.c
index b3d981dc0c..bd8b6e06ad 100644
--- a/system/memory.c
+++ b/system/memory.c
@@ -4024,3 +4024,81 @@ static void memory_register_types(void)
 }
 
 type_init(memory_register_types)
+
+static int sysmem_fdt_init(char *node_path, FDTMachineInfo *fdti,
+                           void *priv)
+{
+    int i, ret = 0, priority = 0;
+    uint32_t container_phandle;
+    MemoryRegion *container;
+    char container_node_path[DT_PATH_LENGTH];
+    FDTGenericRegPropInfo *reg;
+    Error *errp = NULL;
+
+    fdt_init_set_opaque(fdti, node_path, OBJECT(get_system_memory()));
+
+    /* allow to set system_memory region as subregion */
+    container_phandle = qemu_fdt_getprop_cell(fdti->fdt, node_path,
+                                            "container",
+                                            0, &errp);
+    if (errp) {
+        /* container is an optional property */
+        error_free(errp);
+        return 0;
+    }
+
+    if (qemu_devtree_get_node_by_phandle(fdti->fdt, container_node_path,
+                                            container_phandle)) {
+        error_report("failed to get container node");
+        return -1;
+    }
+
+    while (!fdt_init_has_opaque(fdti, container_node_path)) {
+        fdt_init_yield(fdti);
+    }
+
+    container = MEMORY_REGION(fdt_init_get_opaque(fdti,
+                                                    container_node_path));
+    reg = fdt_get_reg_info(fdti, node_path, OBJECT(get_system_memory()));
+    if (reg && reg->n > 0) {
+        if (reg->x[0][0] || reg->x[1][0]) {
+            error_report("can't change sysmem address or size");
+            ret = -1;
+            goto out;
+        }
+        priority = reg->x[3][0];
+    }
+
+    memory_region_add_subregion_overlap(container, 0,
+                                        get_system_memory(), priority);
+
+out:
+    if (reg) {
+        g_free(reg->parents);
+
+        for (i = 0; i < FDT_GENERIC_REG_TUPLE_LENGTH; ++i) {
+            g_free(reg->x[i]);
+        }
+
+        g_free(reg);
+    }
+    return ret;
+}
+
+fdt_register_compatibility(sysmem_fdt_init, "compatible:qemu:system-memory");
+
+static const TypeInfo fdt_qom_aliases[] = {
+    {   .name = "qemu-memory-region",       .parent = "memory-region"  },
+    {   .name = "simple-bus",               .parent = "memory-region"  },
+};
+
+static void fdt_memory_types(void)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(fdt_qom_aliases); ++i) {
+        type_register_static(&fdt_qom_aliases[i]);
+    }
+}
+
+type_init(fdt_memory_types)
-- 
2.43.0


