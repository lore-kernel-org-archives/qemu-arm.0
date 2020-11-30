Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5114646lfb;
        Mon, 30 Nov 2020 05:12:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAEbPdBpLu0dph7B1i30zeeyH842Gl77/YF1X+7wHdFWHFBw2N9TaPMYOGdJpFUX409N0S
X-Received: by 2002:a25:ce13:: with SMTP id x19mr23939931ybe.390.1606741959598;
        Mon, 30 Nov 2020 05:12:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606741959; cv=none;
        d=google.com; s=arc-20160816;
        b=aT2NSjTvtCWCw+ZTFJsj/lSChK/s6gplGwTCpF5LdsYTuCARHQpIOqc5RNECpE+uKW
         drJsU4ZoS35quEVVG9grpjy07HdsSCzeFdPp8OS3qUtMY65RZJ0lIDvSmhmBheph8KD5
         khtn8+rRmOZfrDVMICcjhtyk7hPZ7LrM3IPbt8g5I6UpSXFX1pqCu+uLP5VNngXN/biN
         YQXH13AJthOy+w9OKyS9b3xX2wcy+NOTJJDW6ep/+uvj7yaIn0BHZcWcHK3RfoILxyi4
         gmEfUBlzqbiNdtiBcOeJ/Vkau6q+BsTc2dAKV7Hk2n/NNJOUM52fJt2ni/D5GdCBrWBl
         a4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=O8VxyhaT50ZuGG8lbd1BI9ydNdbTaVCdtKqS88T06S0=;
        b=EkL2W32PUDCKU9f5cMlSKCPJsZUl0oNYRhWVldEvAWXmhihShp5oD8ts1i1Fqeq+F3
         YEB8reD1QmBXfK1nfDriSuaKxby6PZWYi20QM32kIZC04yplBc6hwZkKDc8bzL3JfHcv
         c9YwKS6CFPQWWhxtzdzxrIfvW02tt0pF4OprLNXTL7Vtz253409RIT09T5a1mp5t9ln1
         ARybBKMvCM0XPzcVUrfBBxDPhuLq5PNtplUoMRVbGWsD2b9vbxpps83ThjncrIp4Kwvv
         RvKScmil7Hz6k14z8+Vm6tB7Qzl508uR28CaN4ERjFsfK0AUmqI0sufHBTkFLxUOZBMQ
         Wqdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12si17384784ybm.191.2020.11.30.05.12.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 05:12:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjiys-0004ap-Qw
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 08:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kjiy7-0004Z2-7C; Mon, 30 Nov 2020 08:11:53 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kjixz-0007hu-BK; Mon, 30 Nov 2020 08:11:50 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cl5G217DFz15VhK;
 Mon, 30 Nov 2020 21:11:06 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Mon, 30 Nov 2020 21:11:21 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>, "Fam
 Zheng" <famz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 1/2] ramlist: Make dirty bitmap blocks of ramlist resizable
Date: Mon, 30 Nov 2020 21:11:03 +0800
Message-ID: <20201130131104.10600-2-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20201130131104.10600-1-zhukeqian1@huawei.com>
References: <20201130131104.10600-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org,
 Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3+HZvy0ypg80

When we remove a ramblock, we should decrease the dirty bitmap blocks
of ramlist to avoid memory leakage. This patch rebuilds dirty_memory_
extend to support both "extend" and "decrease".

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 softmmu/physmem.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3027747c03..3e4f29f126 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1816,17 +1816,19 @@ void qemu_ram_msync(RAMBlock *block, ram_addr_t start, ram_addr_t length)
 }
 
 /* Called with ram_list.mutex held */
-static void dirty_memory_extend(ram_addr_t old_ram_size,
+static void dirty_memory_resize(ram_addr_t old_ram_size,
                                 ram_addr_t new_ram_size)
 {
     ram_addr_t old_num_blocks = DIV_ROUND_UP(old_ram_size,
                                              DIRTY_MEMORY_BLOCK_SIZE);
     ram_addr_t new_num_blocks = DIV_ROUND_UP(new_ram_size,
                                              DIRTY_MEMORY_BLOCK_SIZE);
+    ram_addr_t cpy_num_blocks = MIN(old_num_blocks, new_num_blocks);
+    bool extend = new_num_blocks > old_num_blocks;
     int i;
 
-    /* Only need to extend if block count increased */
-    if (new_num_blocks <= old_num_blocks) {
+    /* Only need to resize if block count changed */
+    if (new_num_blocks == old_num_blocks) {
         return;
     }
 
@@ -1839,15 +1841,26 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
         new_blocks = g_malloc(sizeof(*new_blocks) +
                               sizeof(new_blocks->blocks[0]) * new_num_blocks);
 
-        if (old_num_blocks) {
+        if (cpy_num_blocks) {
             memcpy(new_blocks->blocks, old_blocks->blocks,
-                   old_num_blocks * sizeof(old_blocks->blocks[0]));
+                   cpy_num_blocks * sizeof(old_blocks->blocks[0]));
         }
 
-        for (j = old_num_blocks; j < new_num_blocks; j++) {
-            new_blocks->blocks[j] = bitmap_new(DIRTY_MEMORY_BLOCK_SIZE);
+        if (extend) {
+            for (j = cpy_num_blocks; j < new_num_blocks; j++) {
+                new_blocks->blocks[j] = bitmap_new(DIRTY_MEMORY_BLOCK_SIZE);
+            }
+        } else {
+            for (j = cpy_num_blocks; j < old_num_blocks; j++) {
+                /* We are safe to free it, for that it is out-of-use */
+                g_free(old_blocks->blocks[j]);
+            }
         }
 
+        if (!new_num_blocks) {
+            g_free(new_blocks);
+            new_blocks = NULL;
+        }
         qatomic_rcu_set(&ram_list.dirty_memory[i], new_blocks);
 
         if (old_blocks) {
@@ -1894,7 +1907,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp, bool shared)
     new_ram_size = MAX(old_ram_size,
               (new_block->offset + new_block->max_length) >> TARGET_PAGE_BITS);
     if (new_ram_size > old_ram_size) {
-        dirty_memory_extend(old_ram_size, new_ram_size);
+        dirty_memory_resize(old_ram_size, new_ram_size);
     }
     /* Keep the list sorted from biggest to smallest block.  Unlike QTAILQ,
      * QLIST (which has an RCU-friendly variant) does not have insertion at
-- 
2.23.0

