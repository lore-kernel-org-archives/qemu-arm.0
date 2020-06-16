Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2213635lfm;
        Mon, 15 Jun 2020 19:11:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYSDgWCMwXh+xwWfy+GYtUMhvqXDCqXByr9zmK3XIttTaikUnwXnUC8xBv7MgoQlnYiMce
X-Received: by 2002:a25:2313:: with SMTP id j19mr804081ybj.144.1592273491246;
        Mon, 15 Jun 2020 19:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592273491; cv=none;
        d=google.com; s=arc-20160816;
        b=xh6Ff65n6xwZkD9lXpjyj+RIwZ71riJUzgo4mvtble90XfbrL8nmLZf/NnIKqpOlyi
         hbkRBds09egOE10By4cJD1FlPfaLhSt3zJyTf2ZhMz9NlQNioVVJvCAZyGO6icxQPGbo
         CYEnhjwKWo6KDSZmPaiHK4MbiFs+Cpch7RsIrPQP+TRvMH1S7yxJ2jGNCHfWjnvvvMjG
         fIxMI8NghkMk+ZZP5vXTFB3XiqDNYa6ucQTXaifh2+oQA/oXK6iEBkQm2KACfDnxO4+O
         Ctk1Udyp1vpdGUftwyKtbQmG9/CLUL1XuXRx8bi6D4/4/7ONxqysl9d7gEDXWV44TQ75
         xLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=0g0nH2qn5vW3tgUWbwT5yXPbKcrHs4zb48kipjgzCq8=;
        b=JubyIZ5H7sJil4wja4ibdFUee8/HHmNUUt24GiDifKMOOZh/PRyt+/0nVxBknIoHk7
         oI1OkCixzQxqCZ7/fhYQ5CtsaHK5Qwo9USGJabj3NFYvQ+Uoi6uyFhiJXxEh+ymJ24zX
         LAIsiYNr+7HShzq6yonj9RF2eHf6X+mysobcNGdBGm0ibgjDY8qnGHHxDGcNEphLHbyL
         wOqZokCSAY5nR8fLgBFRCVJTK0OWm59wOlMcVSAZ2EBwWA6489fap1aJxnovC1UGbNjK
         DHRFTkd6fOiz0df77JNr+jhu3sVuLR7n5+waY0aTchHQ8CBpUMh/4bp/9YjF8tLQ+TbP
         Cx7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c83si15645706ybb.261.2020.06.15.19.11.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 19:11:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl14U-00039t-LB
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 22:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jl14N-00039K-2d; Mon, 15 Jun 2020 22:11:23 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3783 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jl14K-00030X-UB; Mon, 15 Jun 2020 22:11:22 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7C17DEDDFCFFC548C81E;
 Tue, 16 Jun 2020 10:11:14 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.173.221.230) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Tue, 16 Jun 2020 10:11:06 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v2] migration: Count new_dirty instead of real_dirty
Date: Tue, 16 Jun 2020 10:10:59 +0800
Message-ID: <20200616021059.25984-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 22:11:15
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
Cc: zhang.zhanghailiang@huawei.com, Juan Quintela <quintela@redhat.com>, Chao
 Fan <fanc.fnst@cn.fujitsu.com>, jianjay.zhou@huawei.com,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 98dAG+1LPIrw

real_dirty_pages becomes equal to total ram size after dirty log sync
in ram_init_bitmaps, the reason is that the bitmap of ramblock is
initialized to be all set, so old path counts them as "real dirty" at
beginning.

This causes wrong dirty rate and false positive throttling at the end
of first ram save iteration.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>

---
Changelog:

v2:
 - use new_dirty_pages instead of accu_dirty_pages.
 - adjust commit messages.

---
 include/exec/ram_addr.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 7b5c24e928..a95e2e7c25 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -443,7 +443,7 @@ static inline
 uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
                                                ram_addr_t start,
                                                ram_addr_t length,
-                                               uint64_t *real_dirty_pages)
+                                               uint64_t *new_dirty_pages)
 {
     ram_addr_t addr;
     unsigned long word = BIT_WORD((start + rb->offset) >> TARGET_PAGE_BITS);
@@ -469,7 +469,6 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
             if (src[idx][offset]) {
                 unsigned long bits = atomic_xchg(&src[idx][offset], 0);
                 unsigned long new_dirty;
-                *real_dirty_pages += ctpopl(bits);
                 new_dirty = ~dest[k];
                 dest[k] |= bits;
                 new_dirty &= bits;
@@ -502,7 +501,6 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
                         start + addr + offset,
                         TARGET_PAGE_SIZE,
                         DIRTY_MEMORY_MIGRATION)) {
-                *real_dirty_pages += 1;
                 long k = (start + addr) >> TARGET_PAGE_BITS;
                 if (!test_and_set_bit(k, dest)) {
                     num_dirty++;
@@ -511,6 +509,7 @@ uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
         }
     }
 
+    *new_dirty_pages += num_dirty;
     return num_dirty;
 }
 #endif
-- 
2.19.1

