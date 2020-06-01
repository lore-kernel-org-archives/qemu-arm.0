Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2735558lfc;
        Sun, 31 May 2020 21:03:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwM6cSNCnIhtEYx/78nq4QKJviX/skkWhexO/NcyaY+A3uNwvfmU20OYBddYX30mRZnLWfI
X-Received: by 2002:a25:bd0e:: with SMTP id f14mr29970362ybk.427.1590984231569;
        Sun, 31 May 2020 21:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590984231; cv=none;
        d=google.com; s=arc-20160816;
        b=incXDdBz18VAgxoL5/FXCbHiYxJAyTHtl6B3JkU8cmae3RKFFXgb2/5wjUs1wTazbK
         LZTIh2dvplu5v9oENWHEHtKU4++Awl311I+FcDKn+FgnKVe7/tXU9RoBvLEJs/jJVRSr
         xxsE4Rh0YuBxDYZaSyBr2y7MKh2IJbqF2KN99hvqiijPF/4izWt9EkPhZAR96vpfu65D
         uhdt+xPAToB930zvhC363eNuZRJmqVllm5PcQLiSYDZohqhvr97k2DgIDMddjbKlBgqX
         w1+vA4k0DGWXmppjoNiyT/FrKsOnUn5NZVxLRCEgLETOonJRmfNsWJPygniLjLJfxcLD
         1ZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=7yriWp0cG6mGwV4GUlac1DOYPrvmiQaEH5RriH8OI04=;
        b=XRTkfygdK1P/8cCFcKNCU5wKcq8RqxjgUrph37uwbAKZh3h/1AbusIg/BX383YoUrM
         oBmthqd49hW5QfHvusZW4TASFD9tX/ux79oAnhyiuvypX6GldYRvA4ImFUddMIPX5zqF
         pcKi75jn12Aq/73E9Fu/6Ih2QnHBNC8Docvp8UzNOOHngNeCoTFGhCdAkUfeGLlUbMso
         TuzQxrCKHftR/+G+x9R6u0nX5GbGX2OHY4mLqtTShxsAXkZqwNl1quGfvzLpbPn+yKyW
         ZxMVnxUJ5CXp4OFKc8qFTAjgSlgDl68J8TDXyzTMtfG1dV3hDOniKx17i0T/HgjSG08Z
         tCvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o200si1298026yba.162.2020.05.31.21.03.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 May 2020 21:03:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfbfy-0005xD-TR
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 00:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jfbfq-0005wl-3w; Mon, 01 Jun 2020 00:03:42 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3771 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jfbfo-00081y-GG; Mon, 01 Jun 2020 00:03:41 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 25604FEA423AB5663262;
 Mon,  1 Jun 2020 12:03:30 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.173.221.230) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 1 Jun 2020 12:03:21 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH] migration: Count new_dirty instead of real_dirty
Date: Mon, 1 Jun 2020 12:02:50 +0800
Message-ID: <20200601040250.38324-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 00:03:30
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Chao Fan <fanc.fnst@cn.fujitsu.com>,
 Keqian Zhu <zhukeqian1@huawei.com>, wanghaibin.wang@huawei.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bD05WR2igET3

DIRTY_LOG_INITIALLY_ALL_SET feature is on the queue. This fixs the
dirty rate calculation for this feature. After introducing this
feature, real_dirty_pages is equal to total memory size at begining.
This causing wrong dirty rate and false positive throttling.

BTW, real dirty rate is not suitable and not very accurate.

1. For not suitable: We mainly concern on the relationship between
   dirty rate and network bandwidth. Net increasement of dirty pages
   makes more sense.
2. For not very accurate: With manual dirty log clear, some dirty pages
   will be cleared during each peroid, our "real dirty rate" is less
   than real "real dirty rate".

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 include/exec/ram_addr.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 5e59a3d8d7..af9677e291 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -443,7 +443,7 @@ static inline
 uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
                                                ram_addr_t start,
                                                ram_addr_t length,
-                                               uint64_t *real_dirty_pages)
+                                               uint64_t *accu_dirty_pages)
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
 
+    *accu_dirty_pages += num_dirty;
     return num_dirty;
 }
 #endif
-- 
2.19.1

