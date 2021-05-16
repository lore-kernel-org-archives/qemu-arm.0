Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp347576lfm;
        Sun, 16 May 2021 03:31:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxYZa/JXS/ygQhDXJMBtDdRjq6MxF91i5EQkHlGI03pfPXjq5ciGb0kOgLG1hUmIMJl5Nb
X-Received: by 2002:a25:6d89:: with SMTP id i131mr8393735ybc.148.1621161100850;
        Sun, 16 May 2021 03:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621161100; cv=none;
        d=google.com; s=arc-20160816;
        b=EOfMfoBB+y6m68UYUrL3ObocP4sFTTJO//XHtdaOvKvbCY2FQmPTJ8X6iZjB8/YwWZ
         5i8hKRxdrVOenXWRSG8MpGA0hU2enrcUJIZ6P+9VHg38dhKP1gcAN19qqeVciiT1HYpZ
         idxEWxfRfyamytiSB90iHkcrpOkdlAW0ADI/jO6eTKyIhT0E4lyKLorQMzU/BMUtkUqc
         9+BXZ1HhzDfadget9RAeu9iGiiHoqGpVv8eLRUSIxbp8SRhTBrTR1ysoSoVFe/XLLQd7
         niOXIIz6WWx0gI4N90NqLQuU6PJtIKhyl3FSyv+Gg7FE+yeoEJEZJL1+0xgm7nXK6GEk
         +DZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=Fp5mSQmEnjuIWZElIeyot1wiaFAKEpWQc8ZEA3HtnVc=;
        b=X5db2kwTjoZMO0Iai0HTvsD2uRJUGb7iAmGwICf/yMc68ZlAUsWKEuOm4HOhtzX04x
         xkCY6isN9i3H3JHdIKyRFFA3eBYzlbkzsiDLrqJlZ3PHGUTlBwRvVFpdV8aToBjArnff
         BJOCCqhQMZ8WaACK1TDtLNy8WAyva6+qnaudeS2FeAGqf85DVvVeRd39YFVUBEN2Q7if
         Yun6GxUvmgBHdVXcF6tnLjWduEwmghqcnj1+PqnGRxaFtDPDtCiqvgxx2dwfaWy/aXfV
         ij3J2YhE3E9QQL/x3aduYYY2gRFXH7+Xf7CNAxERSCYEkk65HrSwISiowWRwWdOT9hxj
         YyNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x5si11513022ybt.428.2021.05.16.03.31.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 03:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liE3g-0004M8-2x
	for alex.bennee@linaro.org; Sun, 16 May 2021 06:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE1S-0001Rd-13; Sun, 16 May 2021 06:29:23 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE1K-0007B7-Ta; Sun, 16 May 2021 06:29:21 -0400
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fjdhx0qnmzmVVm;
 Sun, 16 May 2021 18:26:25 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:29:08 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:29:07 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, "Alistair
 Francis" <alistair.francis@wdc.com>, David Gibson
 <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v3 2/9] device_tree: Add qemu_fdt_add_path
Date: Sun, 16 May 2021 18:28:53 +0800
Message-ID: <20210516102900.28036-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210516102900.28036-1-wangyanan55@huawei.com>
References: <20210516102900.28036-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangyanan55@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Barry Song <song.bao.hua@hisilicon.com>, zhukeqian1@huawei.com,
 yangyicong@huawei.com, prime.zeng@hisilicon.com, wanghaibin.wang@huawei.com,
 yuzenghui@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KRTyofmrqkpF

From: Andrew Jones <drjones@redhat.com>

qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except it
also adds all missing subnodes from the given path. We'll use it
in a coming patch where we will add cpu-map to the device tree.

And we also tweak an error message of qemu_fdt_add_subnode().

Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 include/sysemu/device_tree.h |  1 +
 softmmu/device_tree.c        | 44 ++++++++++++++++++++++++++++++++++--
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 8a2fe55622..ef060a9759 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -121,6 +121,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
 uint32_t qemu_fdt_alloc_phandle(void *fdt);
 int qemu_fdt_nop_node(void *fdt, const char *node_path);
 int qemu_fdt_add_subnode(void *fdt, const char *name);
+int qemu_fdt_add_path(void *fdt, const char *path);
 
 #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
     do {                                                                      \
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index b621f63fba..3965c834ca 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -540,8 +540,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
 
     retval = fdt_add_subnode(fdt, parent, basename);
     if (retval < 0) {
-        error_report("FDT: Failed to create subnode %s: %s", name,
-                     fdt_strerror(retval));
+        error_report("%s: Failed to create subnode %s: %s",
+                     __func__, name, fdt_strerror(retval));
         exit(1);
     }
 
@@ -549,6 +549,46 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
     return retval;
 }
 
+/*
+ * qemu_fdt_add_path: Like qemu_fdt_add_subnode(), but will add
+ * all missing subnodes from the given path.
+ */
+int qemu_fdt_add_path(void *fdt, const char *path)
+{
+    const char *name;
+    const char *p = path;
+    int namelen, retval;
+    int parent = 0;
+
+    if (path[0] != '/') {
+        return -1;
+    }
+
+    while (p) {
+        name = p + 1;
+        p = strchr(name, '/');
+        namelen = p != NULL ? p - name : strlen(name);
+
+        retval = fdt_subnode_offset_namelen(fdt, parent, name, namelen);
+        if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
+            error_report("%s: Unexpected error in finding subnode %.*s: %s",
+                         __func__, namelen, name, fdt_strerror(retval));
+            exit(1);
+        } else if (retval == -FDT_ERR_NOTFOUND) {
+            retval = fdt_add_subnode_namelen(fdt, parent, name, namelen);
+            if (retval < 0) {
+                error_report("%s: Failed to create subnode %.*s: %s",
+                             __func__, namelen, name, fdt_strerror(retval));
+                exit(1);
+            }
+        }
+
+        parent = retval;
+    }
+
+    return retval;
+}
+
 void qemu_fdt_dumpdtb(void *fdt, int size)
 {
     const char *dumpdtb = current_machine->dumpdtb;
-- 
2.19.1

