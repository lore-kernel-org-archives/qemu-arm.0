Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp947209lfp;
        Wed, 6 Oct 2021 20:08:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMzsyp8ZbAyJaxnV0GUmSxpaOghMhVuiwhtSuimuy9KaCsvANxknUS7NfcJNGl3/A/7lrM
X-Received: by 2002:a05:6e02:164f:: with SMTP id v15mr1324797ilu.171.1633576131041;
        Wed, 06 Oct 2021 20:08:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633576131; cv=none;
        d=google.com; s=arc-20160816;
        b=DbBoFfMOzxa7vBBD7Ap2f+D7u8gIbU5mmKdAfviNs17WmG89o0r5gDotGAcUG00JG6
         WO3U56dQRX3CMad1ZnoC8DJzkr8eMZUr0fwOGNkA/6mPf9ZdGY8OfALPf6rVJjmCvPeR
         T/XgrK6bpbrKXOn9FHoPRwV0+UqKRqOyIxnqkDsNKIzk1MzCK5okDNoEyvOxT7A5F4nF
         9ckZcEQ5pqHjG2LufIZA9u4Hcn1HkbgHR1StxEReQo0GsDD4vbC3gW8GhrxgegzV9erw
         8NdnLTTZbl8gGNs/6GRd0GXOiaBw2kmlFfKK8tgggy16c2kyRrGM3evr++hkqsMvGr0s
         Pllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=3YQoZJoMIuNs4ttI463B0hdRSTN7Y5x81t6FyhwxCzw=;
        b=O6Q9TyfuaMyjzijveK7qLFnfHzzEqLRljkj+wNsn1UhkoCM5VKrOUxFNR2c0+8MGda
         MIS1J/zxoZ60S1G9h64OSTPVvw5rEdHVGIBgCkGkM+v96kot8tpzOOhHsV8Tev6j7RC+
         5aHxV6QXKBiV9P+9iM3BrDQsob0Trt8KzLCCtakq0Q7nIkfkrbHeGsnO5e2XOSQEr25F
         oumxtch3I5ziyxRUhQs1OUlt8JKnvQCPCehy5tpVVJGXZaBmoCp1/t3ayjVTt8rqCeFK
         nXLc/rssMKpJbSPkhWOEPkxDRGWvjeXaYBT80cf4SfskRqg8Ydtcz5+LlQJnJo0tfirH
         l9QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11si3930309ill.105.2021.10.06.20.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Oct 2021 20:08:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:33174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYJm5-0005SQ-EH
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 23:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYJlP-0004f5-5G; Wed, 06 Oct 2021 23:08:07 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYJlL-00012V-Dw; Wed, 06 Oct 2021 23:08:06 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HPx3P2GF8zbcxZ;
 Thu,  7 Oct 2021 11:03:29 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 11:07:52 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 11:07:51 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v7 2/8] device_tree: Add qemu_fdt_add_path
Date: Thu, 7 Oct 2021 11:07:40 +0800
Message-ID: <20211007030746.10420-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211007030746.10420-1-wangyanan55@huawei.com>
References: <20211007030746.10420-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vc04XZ3bVAEb

qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except it
also adds all missing subnodes from the given path. We'll use it
in a coming patch where we will add cpu-map to the device tree.

And we also tweak an error message of qemu_fdt_add_subnode().

Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>
Co-developed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Andrew Jones <drjones@redhat.com>
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

