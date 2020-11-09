Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3261627lfb;
        Sun, 8 Nov 2020 19:06:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5SO7CU4MT4Lc/a1TwSEEnJF+QlnNxbRBGH0wyb3wMOTVyMzfX5KXgBA6hmhy3F2n/Y3qH
X-Received: by 2002:a37:9b17:: with SMTP id d23mr12201165qke.254.1604891175152;
        Sun, 08 Nov 2020 19:06:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604891175; cv=none;
        d=google.com; s=arc-20160816;
        b=xmaPAEMypNbBnROWePz2XzV+0V4Vx5wGfWo/4Lj/R7R4tRnUI0nXHFzAjl/92rMSvp
         /+eczkKVgiaM0jhlSwqxxXmXLsAisBO3uK+tap0ZCHE8/tKlTnlz5/nYVy7tW9HWOyaO
         UgW2n/RYG5xKOch8QIBOqD9numakry3ICieaKYwJMxXd/ZTBK1urhg1C6YEtwc/3K+ZY
         oz6XuNO/7qT2vxP/UhS+vEg+2ARHZpfdajFGg8Ljg8g/wcwGPRP28rkRVaIKtFM2s46K
         vmxl1/+Te8rwliK5Iqhzeg9LrRjk8OghiAfyVrhqGD8V7Q3TPGIvrV9V57LDVVx2bNPp
         q06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=iL7MCbwqGVoU1q+dcPxA2igQwOuVu+H+71SnaBwX7Sw=;
        b=GZHlwQnWbN20WPAkWTRP/GuInpXbCT/EarYMNQJeZU5tjobR/XSIMIsTE6Nwd3v1T9
         9Y9oMKf9eRlPIQXPgwtqtoate0zS7igcEYRfIpAKS7mN7DNe85Yv+ZSIT4BaKhHJ6zKW
         xLz7WKDK6zO+UTk7i6tSpB13jkxL1DSkBCl6nv1KmTiv2GfWoElphgHs76a4oWBJ9qEN
         rjF/6bZ5UaLkeqVIJ7rMSxkHiJoHhWC0Gx19lHOKBPWOvqQ50ad6RP5QFmC1TeKSu6OT
         tN1i9is3WbmMm5SUMastiWzMbkDaX8Rz+HdIUbCq/cAWhVjZKkKkckg/xjHOhmR1+kr6
         dUSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si4562283qvb.135.2020.11.08.19.06.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 19:06:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kbxVW-0001ha-Hn
	for alex.bennee@linaro.org; Sun, 08 Nov 2020 22:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUs-0001as-66; Sun, 08 Nov 2020 22:05:34 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUn-0006ab-LN; Sun, 08 Nov 2020 22:05:33 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CTwpd2b2Rzhhqx;
 Mon,  9 Nov 2020 11:05:13 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 11:05:11 +0800
From: Ying Fang <fangying1@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [RFC PATCH v3 04/13] device_tree: Add qemu_fdt_add_path
Date: Mon, 9 Nov 2020 11:04:43 +0800
Message-ID: <20201109030452.2197-5-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201109030452.2197-1-fangying1@huawei.com>
References: <20201109030452.2197-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 22:05:17
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: drjones@redhat.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com, salil.mehta@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +qGgvTKuzdo7

From: Andrew Jones <drjones@redhat.com>

qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except
it also adds any missing parent nodes. We also tweak an error
message of qemu_fdt_add_subnode().

We'll make use of the new function in a coming patch.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 device_tree.c                | 45 ++++++++++++++++++++++++++++++++++--
 include/sysemu/device_tree.h |  1 +
 2 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/device_tree.c b/device_tree.c
index b335dae707..c080909bb9 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -515,8 +515,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
 
     retval = fdt_add_subnode(fdt, parent, basename);
     if (retval < 0) {
-        error_report("FDT: Failed to create subnode %s: %s", name,
-                     fdt_strerror(retval));
+        error_report("%s: Failed to create subnode %s: %s",
+                     __func__, name, fdt_strerror(retval));
         exit(1);
     }
 
@@ -524,6 +524,47 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
     return retval;
 }
 
+/*
+ * Like qemu_fdt_add_subnode(), but will add all missing
+ * subnodes in the path.
+ */
+int qemu_fdt_add_path(void *fdt, const char *path)
+{
+    char *dupname, *basename, *p;
+    int parent, retval = -1;
+
+    if (path[0] != '/') {
+        return retval;
+    }
+
+    parent = fdt_path_offset(fdt, "/");
+    p = dupname = g_strdup(path);
+
+    while (p) {
+        *p = '/';
+        basename = p + 1;
+        p = strchr(p + 1, '/');
+        if (p) {
+            *p = '\0';
+        }
+        retval = fdt_path_offset(fdt, dupname);
+        if (retval < 0 && retval != -FDT_ERR_NOTFOUND) {
+            error_report("%s: Invalid path %s: %s",
+                         __func__, path, fdt_strerror(retval));
+            exit(1);
+        } else if (retval == -FDT_ERR_NOTFOUND) {
+            retval = fdt_add_subnode(fdt, parent, basename);
+            if (retval < 0) {
+                break;
+            }
+        }
+        parent = retval;
+    }
+
+    g_free(dupname);
+    return retval;
+}
+
 void qemu_fdt_dumpdtb(void *fdt, int size)
 {
     const char *dumpdtb = qemu_opt_get(qemu_get_machine_opts(), "dumpdtb");
diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 982c89345f..15fb98af98 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -104,6 +104,7 @@ uint32_t qemu_fdt_get_phandle(void *fdt, const char *path);
 uint32_t qemu_fdt_alloc_phandle(void *fdt);
 int qemu_fdt_nop_node(void *fdt, const char *node_path);
 int qemu_fdt_add_subnode(void *fdt, const char *name);
+int qemu_fdt_add_path(void *fdt, const char *path);
 
 #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
     do {                                                                      \
-- 
2.23.0

