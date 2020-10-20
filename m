Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4784153lfa;
        Tue, 20 Oct 2020 06:22:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzJ7ilpxGzXOlgoanas8vdeQ8+l+nkVlri4vYer6bW3aYOohTWVkZVnoLbeHFkjfixuLbM
X-Received: by 2002:a25:7c5:: with SMTP id 188mr3918481ybh.131.1603200126326;
        Tue, 20 Oct 2020 06:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603200126; cv=none;
        d=google.com; s=arc-20160816;
        b=wAN55/zjslvL/m7Jup6itfUhzkm94wjL1g0m3ktjIh0elURr9JBJXgARLRT2IYR6Vi
         pXy69D34SC2YB1z1wqVW7B1V8RzqgltjpqFBtTeVVLoYFotyML+89gt3FrhYU31SQO3/
         WvrNa+lhxcVdUlueQZHLgrqpysfcGkPmklcYbXiErgH4hrPpC70PF4WUzSjUh+Cb38GQ
         eNKDSF1cue1pBlNLn1ZIgruAiyT4HkwaoYJ8LsQFL6aC1FyNFovwYZ8M8mIY7B/kyjQo
         o2S0EB5DvbAY+zJ/jWctp64ikVSl+PFJSgjTbWR5qkJ69iiVBa63bJ6XHqVsivlmahjZ
         oSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=iL7MCbwqGVoU1q+dcPxA2igQwOuVu+H+71SnaBwX7Sw=;
        b=XzHx/BnrZrMy2hYGhPHhzEB44KMBbyenkJaXpC0FfPcraIe3Oikas945cUODNhKhxR
         2+E/BlIqzmRK9Jm+tON51/DdVfIs+EQLB7hpvI0WJQl2gnWD23gnAJukqpNY0jvdBNv6
         rzykaOMPjaoBWs7EwxVfAHkTSiuysl1T0AK0tNAf2PZ2obD4Ca+8AAmOMupGFfhUVMDR
         VL7cZjNDEk+i//UYTUWbPuHDFKr+5Ft5t8Q1c3dbxLQc9M5EndnoHG+RjAtFJNRzp/1k
         +ILzjnzeHCZl1BQ8mSeOFEKCmfB9ohWXc252/vOIcA4fAYfdnVRmQIwIhJEpD2ZK0HG0
         pdpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e34si1512717ybi.386.2020.10.20.06.22.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 06:22:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUraX-0000ax-IX
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 09:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU8-0000M6-JN; Tue, 20 Oct 2020 09:15:29 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:48302 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU0-00076d-Oe; Tue, 20 Oct 2020 09:15:28 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4D201BCECE48456486A5;
 Tue, 20 Oct 2020 21:15:08 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 20 Oct 2020
 21:15:00 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 04/13] device_tree: Add qemu_fdt_add_path
Date: Tue, 20 Oct 2020 21:14:31 +0800
Message-ID: <20201020131440.1090-5-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201020131440.1090-1-fangying1@huawei.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 07:04:17
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ejeWhbqjkiFn

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

