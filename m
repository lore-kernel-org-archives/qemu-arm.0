Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2803726lfm;
        Sun, 21 Jun 2020 20:22:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuHELtT26Os1pZ1VQEcCqsvcHRO41XnZys4pa2G8UG6flRl8f5gWiBmzmgQuOUG6pu7rHH
X-Received: by 2002:a05:6902:4ef:: with SMTP id w15mr5056911ybs.44.1592796148825;
        Sun, 21 Jun 2020 20:22:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592796148; cv=none;
        d=google.com; s=arc-20160816;
        b=Z3epRBJK2421h+2CcXhdhLY/hU3DGtuTkFdY8jYxuqjOLopHlMt9wA4u7FOdCRujWn
         C3xcmKYWQReAUtz7BNhbIWgymBXUvuh9RmfrXvyuc7FOWhjw8FQ5aVe+l3/TxKIRIxwa
         VJe7pJT0NmCrSsPIxXuHMkVzUTF5DbKSnXzyM26XHeCrbYb7syOJbdvwUmEC4MgFx7nB
         +BGYnlqkKARzwmt9auXRyD7tXQgClrkl/VDhupNI6Eys7zw/9g0qqv2aJSNNeZ1+sZhX
         QJnV9hOGJ556OarFn6nyPpELI6UrdGUt1dL3RHva1COOVqJTMPCDcOatwM+QNWWRUumE
         LK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=cjSi9evskx0ELXIPjiJP8zO1o4OzjgnLwjQzc6aurFM=;
        b=pjzOO16Gi7JO+l8lCwKPOLVRg0xgBuoTKUMdub60Nn9GhMXWyhnYSVTo9ieGLK5sUA
         lDrCEVyWnYvL1RiMN4Ka/lJJwYABHC5DxaT9PUe43oCnnLghZPnxY++PxgBQynT0Lp6A
         03gynuJfRlkU9PaNq7H9xeUIS2c74uTo3O03G7vyh11wRAccxACQ8gGnIln895Nutgq3
         psleYT824buFfaM5wB527UYjUNOqSAncegOZFw/QeWnypZzaOxzVV1lWbguNnPC1FiCS
         t8GZFhdm2rtFAFreV1tprMQw8CC+oq+T9tKc4eXlHi9fa/w2trd+zqTawbkmYDiIZmNj
         Diow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h130si12750063ybc.75.2020.06.21.20.22.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jun 2020 20:22:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnD2S-0007zE-8Q
	for alex.bennee@linaro.org; Sun, 21 Jun 2020 23:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jnD2K-0007yt-GY; Sun, 21 Jun 2020 23:22:20 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3712 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jnD2I-0007rh-5o; Sun, 21 Jun 2020 23:22:20 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D1A51BA96CBD8B5F43E1;
 Mon, 22 Jun 2020 11:22:04 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.173.221.230) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 22 Jun 2020 11:21:57 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v3] migration: Count new_dirty instead of real_dirty
Date: Mon, 22 Jun 2020 11:20:37 +0800
Message-ID: <20200622032037.31112-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/21 23:22:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: zhang.zhanghailiang@huawei.com, Juan Quintela <quintela@redhat.com>,
 wanghaibin.wang@huawei.com, Chao
 Fan <fanc.fnst@cn.fujitsu.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 jianjay.zhou@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +UjzG5uTLj6q

real_dirty_pages becomes equal to total ram size after dirty log sync
in ram_init_bitmaps, the reason is that the bitmap of ramblock is
initialized to be all set, so old path counts them as "real dirty" at
beginning.

This causes wrong dirty rate and false positive throttling.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
Changelog:

v3:
 - Address Dave's comments.

v2:
 - Use new_dirty_pages instead of accu_dirty_pages.
 - Adjust commit messages.
---
 include/exec/ram_addr.h | 5 +----
 migration/ram.c         | 8 +++++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 7b5c24e928..3ef729a23c 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -442,8 +442,7 @@ static inline void cpu_physical_memory_clear_dirty_range(ram_addr_t start,
 static inline
 uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
                                                ram_addr_t start,
-                                               ram_addr_t length,
-                                               uint64_t *real_dirty_pages)
+                                               ram_addr_t length)
 {
     ram_addr_t addr;
     unsigned long word = BIT_WORD((start + rb->offset) >> TARGET_PAGE_BITS);
@@ -469,7 +468,6 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
             if (src[idx][offset]) {
                 unsigned long bits = atomic_xchg(&src[idx][offset], 0);
                 unsigned long new_dirty;
-                *real_dirty_pages += ctpopl(bits);
                 new_dirty = ~dest[k];
                 dest[k] |= bits;
                 new_dirty &= bits;
@@ -502,7 +500,6 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
                         start + addr + offset,
                         TARGET_PAGE_SIZE,
                         DIRTY_MEMORY_MIGRATION)) {
-                *real_dirty_pages += 1;
                 long k = (start + addr) >> TARGET_PAGE_BITS;
                 if (!test_and_set_bit(k, dest)) {
                     num_dirty++;
diff --git a/migration/ram.c b/migration/ram.c
index 069b6e30bc..5554a7d2d8 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -859,9 +859,11 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
 /* Called with RCU critical section */
 static void ramblock_sync_dirty_bitmap(RAMState *rs, RAMBlock *rb)
 {
-    rs->migration_dirty_pages +=
-        cpu_physical_memory_sync_dirty_bitmap(rb, 0, rb->used_length,
-                                              &rs->num_dirty_pages_period);
+    uint64_t new_dirty_pages =
+        cpu_physical_memory_sync_dirty_bitmap(rb, 0, rb->used_length);
+
+    rs->migration_dirty_pages += new_dirty_pages;
+    rs->num_dirty_pages_period += new_dirty_pages;
 }
 
 /**
-- 
2.19.1

