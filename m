Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255D6D19512
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 17:51:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkQd7-0001dF-LT; Mon, 26 Jan 2026 12:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQcn-0001Og-Pt
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:42 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQcm-00007J-51
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:41 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4801c731d0aso37903105e9.1
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 09:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769449418; x=1770054218; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p4fgFw+MmsKOfnzb3jQSk/XlDC0OxrRjW4c0oi2lmAo=;
 b=B3BV2XQfKxB8RQ3iZwrxHeK0E2UIEO4wUe+srZMZX85yK1mx9UztnFL41vDd8DJa6T
 Q8JcY9mPe6Tzh/Km2/TPT31tkTMKXpgBWzzjG6fstZY5/hRHV/iCAuaIlbreL3Lsdj90
 UsCyoY0LBke1cJUuMrb/RF7DqjtxIpFPxbl5wz77OFRJZkyDIGAok1x6ytPEU8I0vfLC
 OJzr3kq9nHiSMuXk4k+1yM8/ko2zvI+8mytDAokmYQtuy7DMHhZ5EKxDvZ1k6KG8Hxp1
 1OpNORRMuSO7YDDdFutDw6RDJyGbVR4JUL1eRybKvbfvxN93h09p3faVptWWK5IeW3ob
 uE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769449418; x=1770054218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=p4fgFw+MmsKOfnzb3jQSk/XlDC0OxrRjW4c0oi2lmAo=;
 b=Nd5v6c5SyvTezRsPKdiSXYty1xJO+BGolabEVg1r7RHete4XxnhAU2GFQuh7BcIU+n
 0j0pQIILTEZaO4cl6+3nch+i/kXnjNDXtBW88K0zG+Kt6chZvoFZLdy2v7Hq2aBz3BQI
 /eCv0PvqmOJg+zzIAnExiNcv6fftq71KZFRx4v/EKnR0Hn9VEHFMl2JAFe3ltLRxKdLj
 kEu8tjcFiioN4OesDYp7Q6cgf9ZN3Tq4j1ZlwRV9vnhHQZjYOhckwLG9EWkln7x1yk1y
 Jby4iRGNY7qF+vwBg+rsB/NPB7uEYt4/QACrJZj0cxtyz64J1dBC7A75z6fV8eksnxCf
 wKQw==
X-Gm-Message-State: AOJu0YyULv4CCwLU4IB4MHyQXbOncY8BSJv+sdy9UyVsfdBwG1exEIxv
 tlrZRDMEQnw/jMh3oRbm8YSiSh2bK0Cqfepx1PM8qmx7R4WZO9mgoDUn
X-Gm-Gg: AZuq6aItkUGCOaQFWE1FxFLe2LExUl/hjGAdu/R9Z6dReJ48aR8HCMhuyWBw1lf6jhD
 c2ImvVWFtmbdwv8VtAX35/ScPWilIBSyR/kax7v6+/7ehV4FbLNven3s2Lf6b3jVeh0mk54iG2g
 /ASNsJZAg+/+oiXygVMoE/h5IK54l64zxUQmNY6t6xJC6pW57La8LjswfbOwzdrG8LSbR6NFT9d
 QL1ljX9NYOfi0UR9RnlNuJPDlO5rlw+vqlrsK6MQIPvX5CRPwYuvMfI9jhwMXTRf1lxWKct/J4P
 57m4c+fe+uS2S1EZLWIr9NFAsIgRTtsN4PgCEZLMQDn/nAaVcx8YSBwKj/+Tbzp/ep9eg1pkEt0
 2EEL2wXtUVhwr0nXaDVy6sLoGu3ZMSw/5544TRHjpNAJfNWG70A6hNlHhppyRisW2Kh4RJuTp9A
 LPHb3kFDYDPAKD8LcxbxzfNoGNFfM8xUYHLZzicvu5bWeQk67UaHb/PQ==
X-Received: by 2002:a05:6000:2501:b0:431:c60:c5ed with SMTP id
 ffacd0b85a97d-435ca1258a5mr8598574f8f.13.1769449417839; 
 Mon, 26 Jan 2026 09:43:37 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-71-105.adsl.net.t-com.hr.
 [93.143.71.105]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-435b1e71730sm34199603f8f.26.2026.01.26.09.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:43:37 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com
Subject: [PATCH 14/27] hw/core/fdt_generic_util: map device memory
Date: Mon, 26 Jan 2026 18:43:00 +0100
Message-ID: <20260126174313.1418150-15-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wm1-x335.google.com
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
 hw/core/fdt_generic_util.c | 103 +++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/hw/core/fdt_generic_util.c b/hw/core/fdt_generic_util.c
index d57d9387a1..af20ffd9db 100644
--- a/hw/core/fdt_generic_util.c
+++ b/hw/core/fdt_generic_util.c
@@ -622,6 +622,22 @@ static inline uint64_t get_int_be(const void *p, int len)
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
@@ -892,6 +908,8 @@ static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
 {
     Object *dev, *parent;
     char *dev_type = NULL;
+    Error *errp = NULL;
+    int i;
     QEMUDevtreeProp *prop, *props;
     char parent_node_path[DT_PATH_LENGTH];
 
@@ -1022,6 +1040,91 @@ static int fdt_init_qdev(char *node_path, FDTMachineInfo *fdti, char *compat)
         }
     }
 
+    if (object_dynamic_cast(dev, TYPE_SYS_BUS_DEVICE) ||
+        object_dynamic_cast(dev, TYPE_FDT_GENERIC_MMAP)) {
+        FDTGenericRegPropInfo reg = {0};
+        char parent_path[DT_PATH_LENGTH];
+        int cell_idx = 0;
+        bool extended = true;
+
+        qemu_fdt_getprop_cell(fdti->fdt, node_path, "reg-extended", 0, false,
+                              &errp);
+        if (errp) {
+            error_free(errp);
+            errp = NULL;
+            extended = false;
+            qemu_devtree_getparent(fdti->fdt, parent_path, node_path);
+        }
+
+        for (reg.n = 0;; reg.n++) {
+            char ph_parent[DT_PATH_LENGTH];
+            const char *pnp = parent_path;
+
+            reg.parents = g_renew(Object *, reg.parents, reg.n + 1);
+            reg.parents[reg.n] = parent;
+
+            if (extended) {
+                int p_ph = qemu_fdt_getprop_cell(fdti->fdt, node_path,
+                                                 "reg-extended", cell_idx++,
+                                                 false, &errp);
+                if (errp) {
+                    error_free(errp);
+                    errp = NULL;
+                    goto exit_reg_parse;
+                }
+                if (qemu_devtree_get_node_by_phandle(fdti->fdt, ph_parent,
+                                                     p_ph)) {
+                    goto exit_reg_parse;
+                }
+                while (!fdt_init_has_opaque(fdti, ph_parent)) {
+                    fdt_init_yield(fdti);
+                }
+                reg.parents[reg.n] = fdt_init_get_opaque(fdti, ph_parent);
+                pnp = ph_parent;
+            }
+
+            for (i = 0; i < FDT_GENERIC_REG_TUPLE_LENGTH; ++i) {
+                const char *size_prop_name = fdt_generic_reg_size_prop_names[i];
+                int nc = qemu_fdt_getprop_cell(fdti->fdt, pnp, size_prop_name,
+                                               0, true, &errp);
+
+                if (errp) {
+                    int size_default = fdt_generic_reg_cells_defaults[i];
+
+                    DB_PRINT_NP(0, "WARNING: no %s for %s container, assuming "
+                                "default of %d\n", size_prop_name, pnp,
+                                size_default);
+                    nc = size_default;
+                    error_free(errp);
+                    errp = NULL;
+                }
+
+                reg.x[i] = g_renew(uint64_t, reg.x[i], reg.n + 1);
+                reg.x[i][reg.n] = nc ?
+                    qemu_fdt_getprop_sized_cell(fdti->fdt, node_path,
+                                                extended ? "reg-extended"
+                                                         : "reg",
+                                                cell_idx, nc, &errp)
+                    : 0;
+                cell_idx += nc;
+                if (errp) {
+                    goto exit_reg_parse;
+                }
+            }
+        }
+exit_reg_parse:
+
+        if (object_dynamic_cast(dev, TYPE_FDT_GENERIC_MMAP)) {
+            FDTGenericMMapClass *fmc = FDT_GENERIC_MMAP_GET_CLASS(dev);
+            if (fmc->parse_reg) {
+                while (fmc->parse_reg(FDT_GENERIC_MMAP(dev), reg,
+                                      &error_abort)) {
+                    fdt_init_yield(fdti);
+                }
+            }
+        }
+    }
+
     g_free(dev_type);
 
     return 0;
-- 
2.43.0


