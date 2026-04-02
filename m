Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F913D6AB17
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 22:01:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8Q1x-0008C6-5V; Thu, 02 Apr 2026 17:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q1u-0008Ae-Pi
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:56:46 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q1t-00071H-16
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:56:46 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-66c05fb27e4so2504218a12.2
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 14:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775167003; x=1775771803; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6OVtHyJEH609H+Jxo+bwaMnaWIVxFgChTmg6HBwKfPs=;
 b=JQdd2sq2KDVobuGb44+qUyrnZ8lMucOG8B3KLC6ehb+kYRxI6moG7cLEKH3Zxm+Fy5
 vdUKM3WxM0mttywtGrO6kTdfIjcwi4QZ8RRPE9pC/0lesK3uVun+ja6wGLiUROQgP9o7
 /uBvproqiMRzmSd1Fn9VtHI42tWj5/bjUDo2RJgRpVV0846xb2sMSsG4HKIarvYZwwzc
 4It4PeYbxJe0XS3wqsDBGpNK0wIeV9KKdUvGRYi1iLhCTWXA/ytnyWgkEfK8sxANfvWQ
 Oy236NhjV+aczWQnJZKqBARm0ZDKOM8qE+/JeVaROgh1q1N4ALHXdj0MlKesfrdiiHQG
 55jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775167003; x=1775771803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6OVtHyJEH609H+Jxo+bwaMnaWIVxFgChTmg6HBwKfPs=;
 b=cRUcw2P5dDRd3xtvinvftUsH+lnNkmSXLV4FqqbG7904UnO7Iv0BZlbrKs9ygfEhBq
 14i/WMpQDWWqaK95IVqtcxvlNM7YV1yBHM06c7DTRYnunlfHsfYGwMKmVAPgcpKmAwzh
 gfF6NGEITCAtUTmk52rR9+qIgKAn/tNAiZChkqjbLTq2DxYOhcv8BQuYUvCkb3IHCFQm
 EFZFuT6qeM2AMQT2wKlBG8ASuV6kyhchZi/RC5cW8qM2rQjjb/shwAWkYb03iU3W1ijz
 oack7X4Aueab/WecA0vfv5ocwh6T9533v5JXUE5OAZ3nC0z/fDGuHP552nR8gceUy05H
 +WUA==
X-Gm-Message-State: AOJu0YyZEDgv2gmTSto68eLCeyymsmHu394eQzgg8mgymdty4GL8YWMw
 RhTncLL+g4TxIOzB2vUrwx/lQZdPQ0bUg2I3ti4AoR+pPtDqu6aJJTnp
X-Gm-Gg: ATEYQzxS2l2vgNQ64YNbUlXOuKgax9Qw0BOQ262qU6nxGCtVe+zW5EDUlo1OXX2MDvt
 lYW2oJCMxNb+fiV1vVL4RdTVvgEtJa3C8iBmv4REoXgF8iV7oSvpCzR4nCwdHPrxmQQ9F9vIbbu
 i3u4UF3Ah/vBTfCffsUshkOa3e4dUWvyt7y3UK/+Y7V8LqyP4hfsrcbdAii9IVhwPVIPLfdOh/0
 xT6j7quB95c2cylVW22PoOHArqzwHf+AxH7o1BAeZm3xERgJkDQEK/8fM6UIuLSMwQsp9nokRfR
 KXDHsqpPskANAJI1XXauycozQpKczHDfu7AJSQLMuiPSygpK8bKEewZ3iaWTpvoQ5dN63BJ2J3r
 IxqoXX0rr+XB0sqWcU0g4/890QVd3OqKlAXPdUFsfTKRNTXdpJ07JeO8HT27I1HvqDg47DSrXaA
 EuVj15PJ33mHUS3rAr0Wb7hS4mZUtAbqT/yebi19R0oz41EnF6a4x2EdRSQVPrSB+5nESOzg==
X-Received: by 2002:a17:907:26c1:b0:b9c:55e8:fba1 with SMTP id
 a640c23a62f3a-b9c679ba5b3mr24713166b.26.1775167003515; 
 Thu, 02 Apr 2026 14:56:43 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-182-244.adsl.net.t-com.hr.
 [93.143.182.244]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b9c3cac0e1asm134009166b.27.2026.04.02.14.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 14:56:43 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PATCH v3 02/33] system/device_tree: add few parsing and traversal
 helpers
Date: Thu,  2 Apr 2026 23:55:47 +0200
Message-ID: <20260402215629.745866-3-ruslichenko.r@gmail.com>
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

The patch adds few utility functions for parsing FDT nodes.
The helpers are required for upcoming Hardware device tree
feature.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 include/system/device_tree.h |  22 ++++
 system/device_tree.c         | 194 +++++++++++++++++++++++++++++++++++
 2 files changed, 216 insertions(+)

diff --git a/include/system/device_tree.h b/include/system/device_tree.h
index 5667ff9538..bc378d38d0 100644
--- a/include/system/device_tree.h
+++ b/include/system/device_tree.h
@@ -116,6 +116,11 @@ const void *qemu_fdt_getprop(void *fdt, const char *node_path,
 uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
                                const char *property, int cell_id,
                                Error **errp);
+
+const void *qemu_fdt_getprop_inherited(void *fdt, const char *node_path,
+                             const char *property, int *lenp, Error **errp);
+uint32_t qemu_fdt_getprop_cell_inherited(void *fdt, const char *node_path,
+                               const char *property, int cell_id, Error **errp);
 uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
 uint32_t qemu_fdt_alloc_phandle(void *fdt);
 int qemu_fdt_nop_node(void *fdt, const char *node_path);
@@ -191,6 +196,23 @@ int qemu_fdt_setprop_sized_cells_from_array(void *fdt,
                                                 qdt_tmp);                 \
     })
 
+/* node queries */
+
+int qemu_devtree_get_num_children(void *fdt, const char *node_path);
+int qemu_devtree_get_children(void *fdt, const char *node_path,
+                                     int max_paths, char **returned_paths);
+int qemu_devtree_num_props(void *fdt, const char *node_path);
+
+/* node getters */
+
+int qemu_devtree_get_node_by_phandle(void *fdt, char *node_path, int phandle);
+char *qemu_devtree_getparent(void *fdt, const char *current);
+
+/* misc */
+
+int devtree_get_num_nodes(void *fdt);
+
+#define DT_PATH_LENGTH 1024
 
 /**
  * qemu_fdt_randomize_seeds:
diff --git a/system/device_tree.c b/system/device_tree.c
index d2db7bd355..1a70223712 100644
--- a/system/device_tree.c
+++ b/system/device_tree.c
@@ -464,6 +464,96 @@ uint32_t qemu_fdt_getprop_cell(void *fdt, const char *node_path,
     return be32_to_cpu(p[cell_id]);
 }
 
+const void *qemu_fdt_getprop_inherited(void *fdt, const char *node_path,
+                             const char *property, int *lenp, Error **errp)
+{
+    const void *found_val = NULL;
+    int found_len = 0;
+    int curr_offset = 0;
+    int temp_len;
+    char **tokens;
+    char **iter;
+
+    found_val = fdt_getprop(fdt, 0, property, &found_len);
+
+    tokens = g_strsplit(node_path + 1, "/", -1);
+
+    for (iter = tokens; *iter != NULL; iter++) {
+        if (**iter == '\0') {
+            continue;
+        }
+
+        curr_offset = fdt_subnode_offset(fdt, curr_offset, *iter);
+        if (curr_offset < 0) {
+            error_setg(errp, "%s: Path '%s' not found",
+                       __func__, *iter);
+            g_strfreev(tokens);
+            return NULL;
+        }
+
+        const void *val = fdt_getprop(fdt, curr_offset, property, &temp_len);
+        if (val) {
+            found_val = val;
+            found_len = temp_len;
+        }
+    }
+    g_strfreev(tokens);
+
+    if (!found_val) {
+        error_setg(errp, "%s: Property '%s' not found",
+                   __func__, property);
+        return NULL;
+    }
+
+    if (lenp) {
+        *lenp = found_len;
+    }
+
+    return found_val;
+}
+
+uint32_t qemu_fdt_getprop_cell_inherited(void *fdt, const char *node_path,
+                               const char *property, int cell_id, Error **errp)
+{
+    int len;
+    const uint32_t *p;
+
+    p = qemu_fdt_getprop_inherited(fdt, node_path, property, &len, errp);
+    if (!p) {
+        return 0;
+    }
+    if (len < (cell_id + 1) * 4) {
+        error_setg(errp,
+                   "%s: %s/%s is too short, need %d bytes for cell ind %d",
+                   __func__, node_path, property, (cell_id + 1) * 4, cell_id);
+        return 0;
+    }
+    return be32_to_cpu(p[cell_id]);
+}
+
+char *qemu_devtree_getparent(void *fdt, const char *current)
+{
+    const char *sep;
+    int len;
+
+    if (!current || !strcmp(current, "/")) {
+        return NULL;
+    }
+
+    sep = strrchr(current, '/');
+    if (!sep) {
+        return NULL;
+    }
+
+    if (sep == current) {
+        len = 1;
+    } else {
+        len = sep - current;
+    }
+
+    return g_strndup(current, len);
+}
+
 uint32_t qemu_fdt_get_phandle(void *fdt, const char *path)
 {
     uint32_t r;
@@ -631,6 +721,110 @@ out:
     return ret;
 }
 
+int qemu_devtree_num_props(void *fdt, const char *node_path)
+{
+    int offset = fdt_path_offset(fdt, node_path);
+    int ret = 0;
+
+    for (offset = fdt_first_property_offset(fdt, offset);
+            offset != -FDT_ERR_NOTFOUND;
+            offset = fdt_next_property_offset(fdt, offset)) {
+        ret++;
+    }
+    return ret;
+}
+
+int qemu_devtree_get_children(void *fdt, const char *node_path,
+                                     int max_paths, char **returned_paths)
+{
+    int count = 0;
+    int subnode;
+    const char *name;
+    int offset = fdt_path_offset(fdt, node_path);
+
+    if (offset < 0) {
+        return offset;
+    }
+
+    bool is_root = (strcmp(node_path, "/") == 0);
+
+    fdt_for_each_subnode(subnode, fdt, offset) {
+        if (count >= max_paths) {
+            break;
+        }
+        name = fdt_get_name(fdt, subnode, NULL);
+        if (returned_paths) {
+            returned_paths[count] = g_strdup_printf("%s/%s",
+                                                is_root ? "" : node_path, name);
+        }
+
+        ++count;
+    }
+
+    return count;
+}
+
+int qemu_devtree_get_num_children(void *fdt, const char *node_path)
+{
+    int count = 0;
+    int subnode;
+    int offset = fdt_path_offset(fdt, node_path);
+
+    if (offset < 0) {
+        return offset;
+    }
+
+    fdt_for_each_subnode(subnode, fdt, offset) {
+        ++count;
+    }
+
+    return count;
+}
+
+int qemu_devtree_get_node_by_phandle(void *fdt, char *node_path, int phandle)
+{
+    int offset = 0, cur_depth = 0;
+    int path_lens[64] = { 0 };
+
+    for (offset = 0; offset >= 0; offset = fdt_next_node(fdt, offset,
+                                                         &cur_depth)) {
+        if (cur_depth >= 64) {
+            break;
+        }
+        const char *name = fdt_get_name(fdt, offset, NULL);
+
+        int parent_len = (cur_depth > 0) ? path_lens[cur_depth - 1] : 0;
+        int len = snprintf(node_path + parent_len,
+                             DT_PATH_LENGTH - parent_len,
+                             "%s%s",
+                             (parent_len > 1) ? "/" : "",
+                             (cur_depth == 0) ? "/" : name);
+
+        path_lens[cur_depth] = parent_len + len;
+
+        if (fdt_get_phandle(fdt, offset) == phandle) {
+            return 0;
+        }
+    }
+
+    return -FDT_ERR_NOTFOUND;
+}
+
+int devtree_get_num_nodes(void *fdt)
+{
+    int num_nodes = 0;
+    int depth = 0, offset = 0;
+
+    for (;;) {
+        offset = fdt_next_node(fdt, offset, &depth);
+        num_nodes++;
+        if (offset <= 0 || depth <= 0) {
+            break;
+        }
+    }
+    return num_nodes;
+}
+
 void qmp_dumpdtb(const char *filename, Error **errp)
 {
     ERRP_GUARD();
-- 
2.43.0


