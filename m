Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp209696lfq;
        Wed, 16 Sep 2020 20:22:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9QhpcjgLZHIxTOZ2VPqIckRxUdoXoICs5G5esUBTgeCU+BBJd5oN6RwG+OJxfj7i39Rv0
X-Received: by 2002:a25:a3e4:: with SMTP id e91mr12313605ybi.51.1600312957343;
        Wed, 16 Sep 2020 20:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600312957; cv=none;
        d=google.com; s=arc-20160816;
        b=ZbVMxmAVdRy8Vckrf1kGSUZvrOSG00UtsvISlSim/gmnnFhDA5cjnT2rRWXgDFgHw3
         PXm4KnFzK12nDc+Ao5R23cfyYDvPCVNxxvvTRQf5Ox3VzMSaJKP8V/jhBGAcDX2CqH47
         uzCGR/2ZB6s2OIof+hVF2jDEJgxmE/54VOMucb/2p87xhp68cRzFMWx0Z++Kxq7UfB8e
         HraPoGroK1VOxho0c5GzzXdwV+M9A6CEfZhtgVg0zRFL29FMXWAKFiDbnN/JvNSvzOSN
         tr+QGcLwSaosHBvPH3DKJIQxVNhormrAPs/fW+CJIgqaB1lG1cG/jbAB+Mb/NQWWSR8A
         JeCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=rn6I3OdqBuPCvP4y7Xr/rAgQUkW6YSbc61OmzjiVwRM=;
        b=hE5Zf8WZeIrjTetWmzuUEjvNe1WytmzdG9lXTEaFGJ1ZpjSnnRn8ym4ZfAUKm+GL71
         QTn0VIlPn1s/plixrsKW+X7Ku3Sm9mxzvIG2j79soqGipZs/UWkdt9jygfKb8gB6CQlR
         CJyo6zaMxFXTkdSWNUh5CRCcgy7j/dV093bfprI7Vu+Q2i7rbNX4yOsDJPtR7GWeRU0M
         E77AkW9MXa55MU17DDN8tIpmzLG7oqZg3PNZo2z1u3pHesbWD/t2OPlTU9jUsecsCFdL
         eZgI64sWNCdObItxjr0oAsJJUDWPEPUhctAS8wSsfVY9DijLrZpCqCmTH3lOuIKehO9T
         JQfA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10si8606418ybg.410.2020.09.16.20.22.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 20:22:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIkVI-0005wM-OW
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 23:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUO-0004y2-Q8; Wed, 16 Sep 2020 23:21:40 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:53514 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkTp-0004Qe-Nj; Wed, 16 Sep 2020 23:21:40 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 876F151E885C02A826EF;
 Thu, 17 Sep 2020 11:20:58 +0800 (CST)
Received: from localhost (10.174.185.104) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 11:20:49 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 04/12] device_tree: add qemu_fdt_add_path
Date: Thu, 17 Sep 2020 11:20:25 +0800
Message-ID: <20200917032033.2020-5-fangying1@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20200917032033.2020-1-fangying1@huawei.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 23:20:58
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
 zhang.zhanghailiang@huawei.com, Alexander Graf <agraf@suse.de>,
 alex.chen@huawei.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 alistair.francis@wdc.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DO5X66jt7OD7

From: Andrew Jones <drjones@redhat.com>

qemu_fdt_add_path works like qemu_fdt_add_subnode, except it
also recursively adds any missing parent nodes.

Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Cc: Alexander Graf <agraf@suse.de>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 device_tree.c                | 24 ++++++++++++++++++++++++
 include/sysemu/device_tree.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/device_tree.c b/device_tree.c
index b335dae707..1854be3a02 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -524,6 +524,30 @@ int qemu_fdt_add_subnode(void *fdt, const char *name)
     return retval;
 }
 
+int qemu_fdt_add_path(void *fdt, const char *path)
+{
+    char *parent;
+    int offset;
+
+    offset = fdt_path_offset(fdt, path);
+    if (offset < 0 && offset != -FDT_ERR_NOTFOUND) {
+        error_report("%s Couldn't find node %s: %s", __func__, path,
+                     fdt_strerror(offset));
+        exit(1);
+    }
+
+    if (offset != -FDT_ERR_NOTFOUND) {
+        return offset;
+    }
+
+    parent = g_strdup(path);
+    strrchr(parent, '/')[0] = '\0';
+    qemu_fdt_add_path(fdt, parent);
+    g_free(parent);
+
+    return qemu_fdt_add_subnode(fdt, path);
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

