Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EA5E9A04A
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:38:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt57d-0000Mz-8c; Thu, 19 Feb 2026 09:35:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt57N-0000FI-NX
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:35:02 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt57L-00031h-Nz
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:35:01 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48069a48629so10383685e9.0
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771511698; x=1772116498; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+o4P+WixlSveqwPM81MzIq9MXznfscUez/G4LTT0AoQ=;
 b=ITtawJ6EakbqgvR389Fy/opKQFppMlS4FoD1bM1FNB+cF3tA0U691HSfiOgq9dS1SD
 TpnUvKysrEsKeISZTPpUGVfaIBpbvtxFP61IIHV98ZmdT2d1Xd2QjKkhzonE4vGCqGmu
 XzCLJpL1BtDsslfctB06aoV0CYBHy7YOG1hM818gwnfBRcbMLzJ1OGoFnx7OLZlfAAOS
 dZYkA4kJvMDv/TsSWpITHNIlsIWmlP3707Bq4fE3R1FK8SSX8nzbOJlVmjGlF7+0h0lD
 ci2qCGw2uV0YIm7Tb/YpRgbg/JGIg5KARLX9LsxWD+N+zfJFj6Xkr1F3fn6ZM1jqGt/2
 b68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771511698; x=1772116498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+o4P+WixlSveqwPM81MzIq9MXznfscUez/G4LTT0AoQ=;
 b=P2r1B4yRZI9bZ5yx4UhCCimnzazwZBn+2vyphL1nfbk7Af6RP91GtCoEhHDWpUpQWC
 gWYo8T5iHFpCIa1eMkMLDMVyDXPuyVMokA7Gy8TsDjvsulQ2EblFnOrDIwKhFzrqqdp8
 LVlpF0ThYLNJPkbdBPEM4esr1LKPJUOYmEQCt/5KPT2m1vI1N8W3sEAbkdPvUYgwbunn
 DnADvIzXvX5Ju1beru7VWRpXD3YJWY0t/wMVxfibuBxdnn4tLJS8nUa2sMJXpUjCImEd
 zk1FmQ+Huxp5TffU9HuaRTH3y4BOnjuyYPzP78D9J0PyZJMo3mvt9I2WMaMEQHVaS5Qp
 TdTQ==
X-Gm-Message-State: AOJu0YwatzUdK3iL7dPW3GM7j6SpEKRqLruCqxLu4aFwmONm12S4+H88
 CwmtE2oiWaGxxa+gV3JOHOnGUP3duliw0omz3wh7cn7Mjdcuy6OZ3wNQ
X-Gm-Gg: AZuq6aIbYyJ88Qar6DsxYgafTzkY0P9AjJJam1qSCOmNusOJ1KGz+MLFINMWkanFAwA
 T4RIBysDE+4Mz2zZED1LqehN63rUGGCBksFoKMnJqjJWvwDdm8IC2rRlStiq9kGCBblITRQCWUR
 CISFBF3GDslQbXCaE5wygJD8KZikwk/g3Kqov7c+2mlBqqfGnAcYmS8LHj06GX3nv3tn308isFF
 S0x3ez74KJ1Dos/iFPHec82u3XI3gsMUSv2MDqYVQxUcehjYHZcsdCuMyJlqz31jLr10cP4pthE
 Fa196uZrVQ1D3CozcEoE2jEyi7mYcJz1UTtJ/2jjyKkqFIgBpOKag9qIy1rOkDAbe3VcbKNq0ZL
 SRkUpNqnxOa6xlxp2V6XU0eG/WbtMOvOsmKqt6mzX+aWj/QSjzxvVlJsVCR0bXLXZcTYmoMAtzA
 QBr3M/6mqXPXqniOKW13Cdd99gtjR7s+GvJSccfPaa6maOpqKqUOL6pmYryUWck43m1wWw
X-Received: by 2002:a05:600c:4745:b0:47e:e20e:bbbe with SMTP id
 5b1f17b1804b1-48373a4e7dfmr356698125e9.25.1771511697961; 
 Thu, 19 Feb 2026 06:34:57 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-129-182.adsl.net.t-com.hr.
 [93.143.129.182]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43796abd259sm52022770f8f.24.2026.02.19.06.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 06:34:57 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v2 15/33] hw/core/fdt_generic_util: map device memory
Date: Thu, 19 Feb 2026 15:33:14 +0100
Message-ID: <20260219143332.3316679-16-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wm1-x32f.google.com
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

Parse device mmio regions provided within 'reg' and
'reg-extened' device tree properties.
Call corresponding device interface class handlers to
create memory regions.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/fdt_generic_util.c | 129 +++++++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/hw/core/fdt_generic_util.c b/hw/core/fdt_generic_util.c
index dcacc5033b..838ed9a85c 100644
--- a/hw/core/fdt_generic_util.c
+++ b/hw/core/fdt_generic_util.c
@@ -630,6 +630,22 @@ static inline uint64_t get_int_be(const void *p, int len)
     }
 }
 
+/* FIXME: use structs instead of parallel arrays */
+
+static const char *fdt_generic_reg_size_prop_names[] = {
+    "#address-cells",
+    "#size-cells",
+    "#bus-cells",
+    "#priority-cells",
+};
+
+static const int fdt_generic_reg_cells_defaults[] = {
+    1,
+    1,
+    0,
+    0,
+};
+
 /*
  * Error handler for device creation failure.
  *
@@ -831,6 +847,117 @@ static void fdt_init_qdev_array_prop(Object *obj,
     DB_PRINT_NP(0, "set property %s propname to <list>\n", propname);
 }
 
+static void fdt_parse_node_reg_prop(FDTMachineInfo *fdti, char *node_path,
+                            Object *dev)
+{
+    FDTGenericRegPropInfo reg = {0};
+    Object *parent;
+    char parent_path[DT_PATH_LENGTH];
+    int cell_idx = 0;
+    bool extended = true;
+    Error *errp = NULL;
+    int i;
+
+    if (!object_dynamic_cast(dev, TYPE_SYS_BUS_DEVICE) &&
+        !object_dynamic_cast(dev, TYPE_FDT_GENERIC_MMAP))
+        return;
+
+    qemu_fdt_getprop_cell(fdti->fdt, node_path, "reg-extended", 0,
+                            &errp);
+    if (errp) {
+        error_free(errp);
+        errp = NULL;
+        extended = false;
+        qemu_devtree_getparent(fdti->fdt, parent_path, node_path);
+    }
+
+    parent = fdt_init_get_opaque(fdti, parent_path);
+
+    for (reg.n = 0;; reg.n++) {
+        char ph_parent[DT_PATH_LENGTH];
+        const char *pnp = parent_path;
+
+        reg.parents = g_renew(Object *, reg.parents, reg.n + 1);
+        reg.parents[reg.n] = parent;
+
+        if (extended) {
+            int p_ph = qemu_fdt_getprop_cell(fdti->fdt, node_path,
+                                                "reg-extended", cell_idx++,
+                                                &errp);
+            if (errp) {
+                error_free(errp);
+                errp = NULL;
+                goto exit_reg_parse;
+            }
+            if (qemu_devtree_get_node_by_phandle(fdti->fdt, ph_parent,
+                                                    p_ph)) {
+                goto exit_reg_parse;
+            }
+
+            while (!fdt_init_has_opaque(fdti, ph_parent) &&
+                   qemu_in_coroutine()) {
+                fdt_init_yield(fdti);
+            }
+
+            if (!fdt_init_has_opaque(fdti, ph_parent)) {
+                goto exit_reg_parse;
+            }
+
+            reg.parents[reg.n] = fdt_init_get_opaque(fdti, ph_parent);
+            pnp = ph_parent;
+        }
+
+        for (i = 0; i < FDT_GENERIC_REG_TUPLE_LENGTH; ++i) {
+            const char *size_prop_name = fdt_generic_reg_size_prop_names[i];
+            int nc = qemu_fdt_getprop_cell_inherited(fdti->fdt, node_path,
+                                            size_prop_name, 0, &errp);
+            uint64_t val = 0;
+
+            if (errp) {
+                int size_default = fdt_generic_reg_cells_defaults[i];
+
+                DB_PRINT_NP(0, "WARNING: no %s for %s container, assuming "
+                            "default of %d\n", size_prop_name, pnp,
+                            size_default);
+                nc = size_default;
+                error_free(errp);
+                errp = NULL;
+            }
+
+            reg.x[i] = g_renew(uint64_t, reg.x[i], reg.n + 1);
+            for (int j = 0; j < nc; ++j) {
+                val <<= 32;
+                val |= qemu_fdt_getprop_cell(fdti->fdt, node_path,
+                                            extended ? "reg-extended"
+                                                        : "reg",
+                                            cell_idx + j, &errp);
+               if (errp) {
+                    val = 0;
+                    break;
+               }
+            }
+            reg.x[i][reg.n] = val;
+            cell_idx += nc;
+            if (errp) {
+                goto exit_reg_parse;
+            }
+        }
+    }
+
+exit_reg_parse:
+    if (object_dynamic_cast(dev, TYPE_FDT_GENERIC_MMAP)) {
+        FDTGenericMMapClass *fmc = FDT_GENERIC_MMAP_GET_CLASS(dev);
+        if (fmc->parse_reg) {
+            while (fmc->parse_reg(FDT_GENERIC_MMAP(dev), reg,
+                                  &error_abort) && qemu_in_coroutine()) {
+                fdt_init_yield(fdti);
+            }
+        }
+    }
+
+    return;
+}
+
 static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
 {
     Object *dev, *parent;
@@ -972,6 +1099,8 @@ static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
         }
     }
 
+    fdt_parse_node_reg_prop(fdti, node_path, dev);
+
     g_free(dev_type);
     g_free(props);
 
-- 
2.43.0


