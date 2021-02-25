Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp174679lfg;
        Thu, 25 Feb 2021 00:58:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznQtKxhhu1X6soWl0RMlhQA+n9klTFA6PKFksEAtX3jSB6NSKNNm0j2rQufhvBFuvff5NW
X-Received: by 2002:a25:d4e:: with SMTP id 75mr2546717ybn.271.1614243499150;
        Thu, 25 Feb 2021 00:58:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614243499; cv=none;
        d=google.com; s=arc-20160816;
        b=flSD8SFjEC5KTawD+QgLBSEAhMAKwkYRkjH7s0hzDuZQ5sGUHvpAIJ89iwJGGTsbKe
         bRUbQksT9WpD77cV3231CXeNt2ZQjJx5pL/rtS6TUu7T/dlz3kT9DLY8J0RZ9T2rCDXv
         fmQ9EvqJvtLJ7jG1YDQJuIANZFbZMakrijU+K5B1merWnrjlEpe09ZcOxbr7P6uNu5/K
         q8Z8DhrrtW+JWFkVE/FlK3cX4fy8cUuTfFz9aiu8qs5pSA76Jf/qctZxUHUDcACEiOct
         gVyqMXSAFECxjkHLvv9kubb/lvlYe4SjX13NWTSXnQMkoKEX+IhHPEagyrFXZa2TfVND
         n+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=HeOZjfpfs/hF30D0o4IljOJX7EUA+fgkQlvIxnhkfb0=;
        b=Ywy+XjT8A19Z62n+HuABEX+QG9/C4dqCwMM/0eWDbhvNySjHMUvgp7KKCZAiK9k9bp
         jHxDS2rNJEgozmikQ6ZYJK+K2oMAAh5OLER3ldZPv4ZBoEmjHnbGkBbDEISYcAt5XuE0
         UHUtxa52fN2nbgev2wi6w5GIm7pqMwT0U4VQyQTw4ku+Zj7UMweI8XmuC5uUWRgsforu
         30wLZo7kscAA0wpP54RX78dfb61HBmujH/ZbaPjr/I9rlydr4cMfvSTVtdXyxKRjb3ij
         OHZCRtVTtoUwYQUNA14+jXDukIGMfmshlKybQAdRbEOlSvCHEYividwBByt7qZ2A37+N
         3yeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7si4625593ybt.466.2021.02.25.00.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 00:58:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFCTS-00007v-Cg
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 03:58:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFCSF-0007Xx-9B; Thu, 25 Feb 2021 03:57:03 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:3049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFCSA-0003sX-6G; Thu, 25 Feb 2021 03:57:03 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DmRSw5dKqzjRGB;
 Thu, 25 Feb 2021 16:55:28 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Feb 2021
 16:56:38 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 1/5] device_tree: Add qemu_fdt_add_path
Date: Thu, 25 Feb 2021 16:56:23 +0800
Message-ID: <20210225085627.2263-2-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20210225085627.2263-1-fangying1@huawei.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, salil.mehta@huawei.com,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zK6BMrS65cRl

qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except
it also adds any missing parent nodes. We also tweak an error
message of qemu_fdt_add_subnode().

Signed-off-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 include/sysemu/device_tree.h |  1 +
 softmmu/device_tree.c        | 45 ++++++++++++++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)

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
diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
index b9a3ddc518..1e3857ca0c 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
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
     const char *dumpdtb = current_machine->dumpdtb;
-- 
2.23.0

