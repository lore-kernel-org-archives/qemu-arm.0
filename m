Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4645555lfr;
        Tue, 13 Apr 2021 01:08:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYGItBgMpYB0Lt+nngqrxRnwdn57IS+vfkrdj9hHUZsTuA4+Wmdc2/OKW//hjsmxvF/PNv
X-Received: by 2002:ac5:c0c8:: with SMTP id b8mr9436204vkk.18.1618301306584;
        Tue, 13 Apr 2021 01:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618301306; cv=none;
        d=google.com; s=arc-20160816;
        b=A+mAVRHyACEICd9ASUX9Jo4hmLfo4aWNEpTic2/fWTNT/5qQlFDYcppKS7yxdxW3GP
         qczVttfhRsGTswFVca9b6mLh7WfyDwqzY51bksBG8zCfEfJfOWoRCqpqXocgWDEbjfgn
         Bk+XYCKKc8o56vh3EVXcudiCGCThzQgn3uvKLBGnh59zFWR9DY59VlQS7YFWuOhTsd6R
         M3Ja89LIb1TIPxJ0MfcoDvzb8ejrwgsLfMxs89SHDcsRMTMMfViM5idAavTtV0+0L+fL
         TnbX+RBzVPXsOHfadvjcUzNJHhV6S5FMDMkWOc6cucdn/GYPLKKtqj5CrQ7YMciTn2KT
         XZ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=mXnwdtTVR8iXPHkftY93JoueAV9w+gERgLcoDNLqaS8=;
        b=Aly9OQKyAhDTs5WSYW/nAVmFsU5wQ2fO9+IlubuQ91Tiz7Y1+6P3kDAcJowm3TkZkW
         N8YcUYUTJY4rkyWpE5GsI4m9iRczI0sbgNdulT2JmI/o81t8U+sSQd2FiEtmYqQoMdqQ
         oxGJNKks5RHvEfCUu572YSNZZIxD8x++jak38WRwVO0F9J2z5/ZxbyW/3+XxQervTliO
         qhB3/lMJmxFsWH5AIU2Pvrg+AS4QXiCYC9pgUH+LVd9Q//nAGj+ab07GpYrreaEJcMTI
         u1O5cpVg1Bbu2OliRbqaHWc90A3D2qUhZ6S1uuwTgAPyx0ZikgqO2aE19WTJl3qK5zMt
         z3Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c17si5483023vsl.69.2021.04.13.01.08.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 01:08:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:60376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWE5x-0004EZ-R7
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 04:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWE5m-00048x-BZ; Tue, 13 Apr 2021 04:08:14 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:5029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWE5h-0006Pu-8t; Tue, 13 Apr 2021 04:08:14 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FKJ8H320rzlXcY;
 Tue, 13 Apr 2021 16:06:07 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 16:07:49 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v2 1/6] device_tree: Add qemu_fdt_add_path
Date: Tue, 13 Apr 2021 16:07:40 +0800
Message-ID: <20210413080745.33004-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210413080745.33004-1-wangyanan55@huawei.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangyanan55@huawei.com; helo=szxga06-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IG1wH+zf+0Of

From: Andrew Jones <drjones@redhat.com>

qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except
it also adds any missing subnodes in the path. We also tweak
an error message of qemu_fdt_add_subnode().

We'll make use of this new function in a coming patch.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 include/sysemu/device_tree.h |  1 +
 softmmu/device_tree.c        | 45 ++++++++++++++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)

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
index 2691c58cf6..8592c7aa1b 100644
--- a/softmmu/device_tree.c
+++ b/softmmu/device_tree.c
@@ -541,8 +541,8 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
 
     retval = fdt_add_subnode(fdt, parent, basename);
     if (retval < 0) {
-        error_report("FDT: Failed to create subnode %s: %s", name,
-                     fdt_strerror(retval));
+        error_report("%s: Failed to create subnode %s: %s",
+                     __func__, name, fdt_strerror(retval));
         exit(1);
     }
 
@@ -550,6 +550,47 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
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
2.19.1

