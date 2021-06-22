Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2887058lfg;
        Tue, 22 Jun 2021 02:37:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmlynHDlYiueSo7aQ3p0O6fARjnyCNPUi/meY/R9ofhVnAo9As2mvBvfHq1yqP+8E6dMn9
X-Received: by 2002:a25:5383:: with SMTP id h125mr3415668ybb.463.1624354656064;
        Tue, 22 Jun 2021 02:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624354656; cv=none;
        d=google.com; s=arc-20160816;
        b=qe1PeaYVH00T/qBO8UHCqkzwiJ5e8QJbLZNXe2HK4JJjjHDvSWKFV6UBDPTYpih5ZH
         jv6XNJdB69F4JGrPKP6FkK9RauCIkB/FIkussc1bE97oCNfXSn4SSp5N9au4s4lm998Q
         QmzxWY77e50lMd2PT86obfJ1cul9gGk8QTkuAKK/xoHH9IKaXoB+ivdaQXt2J73h7kx4
         DDux7Bz2UiFkACxdkd2gS+cOLPXOPqVu013FDle0Xkfk0Jztxsea0s2pTiVt/C4j9mRO
         MCB6gHw6a2jQj+4gaCv9VVX/uskKzPZ/hmhyTKz3wMWMjC0v9at/f6pKJce4V9XbR96Q
         rhSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=5pg62blJubp8UOVJhFczQE8kZL0MCz6DaPwDhDHd4rg=;
        b=MBPZdKh8p4nIUGu3TkqyBMhM7b2IZUBEB75ecLvVJnaUPSo5ZPdrRBmGEP11TnUne2
         lGqLnOzV9/N3U2NCdjvTV9E/kQQMC4tpXMBrRmFyNe6j/eLPY58ILh85NJKs+PibkQrX
         ru465zlUOzJa3iK+ytfdQkc2ta3k0GpiuZ6SyTDptQ9SvmPx/1F0MOg9H9pJlljat2T1
         oU2CBqWd9wDGO740NNBjpufbgTQuMysMcgzpVX3FlmtBHQ87HMjmJERxCYsXMGrUuNKn
         j5wyF+HgBghdteyPMvqBx8az7m+P8+Yy5YGEYkclfB3YfWdncia+RPFayMLesKiYj/0J
         GheQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si13074014ybi.234.2021.06.22.02.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 02:37:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:54886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvcqd-0001FO-Bl
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 05:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcnl-00030n-M3; Tue, 22 Jun 2021 05:34:37 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcnh-00031B-A5; Tue, 22 Jun 2021 05:34:37 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G8LkQ3NMqzZgjc;
 Tue, 22 Jun 2021 17:31:26 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:26 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:25 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
Subject: [RFC PATCH v4 4/7] device_tree: Add qemu_fdt_add_path
Date: Tue, 22 Jun 2021 17:34:10 +0800
Message-ID: <20210622093413.13360-5-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210622093413.13360-1-wangyanan55@huawei.com>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Yanan Wang <wangyanan55@huawei.com>, prime.zeng@hisilicon.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com, yangyicong@huawei.com,
 zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jnLy8iMdSeLI

qemu_fdt_add_path() works like qemu_fdt_add_subnode(), except it
also adds all missing subnodes from the given path. We'll use it
in a coming patch where we will add cpu-map to the device tree.

And we also tweak an error message of qemu_fdt_add_subnode().

Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Alistair Francis <alistair.francis@wdc.com>
Co-developed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
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
2.23.0

