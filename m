Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5121081lfb;
        Mon, 30 Nov 2020 05:18:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2ULsoE4kbvD37VbspjByWmXkDUu+rzHiK/r4H1vj3SQEjLHiQGAEJft7QUSxwE4RX6nIZ
X-Received: by 2002:a25:2605:: with SMTP id m5mr27828192ybm.98.1606742323303;
        Mon, 30 Nov 2020 05:18:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606742323; cv=none;
        d=google.com; s=arc-20160816;
        b=tt/7l5uj/gScweFu0nsSRLFRuNpBkfLubh9OrcgxAH6AJiIi+QlTys9HtXZX8vietg
         md4MllemmVX4YTC2pD/tinElOUq3qRrEcf6KgNGqmY3y7RryD2ZkVuMIi7wYBm11trI/
         BE+1RwzuRQCc3L07IYc6YuU8//CLkSk7zIJgMoQzebPvxUeFGKttLNZdwJ2/eE2yTJqH
         l17Iut6wdIbgGUNmfKWI2D9hZwUx8fdq4xsn7ggdlVZzV5armbArarptbytCqsNQ1yXr
         wH11k2L21vr7OYlXxx/OpuAe5aOlCUeVuaNGpEoOAQ3Z4dkUibZdIJwjdiPNLqsmOT8d
         hSxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=fcql/kR07RK2Q0lTuEyDNnrKF3+91IH/99tA26IhrYQ=;
        b=qJArj5PSfceX3VJeuYyCZcApycMt7lSMONULUW5ucWVRjmn7Oek0olQ4R0VhCrVPKc
         UVLh0WfnVIvOcqFgSUo8QVoCRXeU1TWUvyHAreLvaOy//JW3qCl/5KMX8eSIJfjsET0R
         I2g8muNQJ8PIqeQwm9JnkOndchDREy0SI2sCcWx5SuHV4WqN4rxiGcyJraEzrK/wuVCC
         LNoOVQ6sDwlLlNI2PckJF87IfKhBj7PbT6wQ6PykT9CT0n1EcxLZ5VEelYBiW2/TGrra
         qdX6SLT+0p0A9t8X2SxuiHgtIrhtM+Xt26RWOrmj54MqNnP6hmBLfTs39hbAQxGQWkOl
         K//Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p25si18438015ybj.343.2020.11.30.05.18.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 05:18:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjj4k-0000gz-KY
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 08:18:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kjiyA-0004ZA-3b; Mon, 30 Nov 2020 08:11:55 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kjixz-0007hp-GO; Mon, 30 Nov 2020 08:11:52 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cl5G20mDPz15VHM;
 Mon, 30 Nov 2020 21:11:06 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Mon, 30 Nov 2020 21:11:22 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>, "Fam
 Zheng" <famz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 2/2] ramlist: Resize dirty bitmap blocks after remove
 ramblock
Date: Mon, 30 Nov 2020 21:11:04 +0800
Message-ID: <20201130131104.10600-3-zhukeqian1@huawei.com>
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
X-TUID: iSeeL5S8aXNg

Use the new "dirty_memory_resize" interface to reduce dirty bitmap
blocks after we remove a ramblock from ramlist.

This bug is found by ASAN after executing several qmp commands about
object-add/object-del of memory-backend-ram. After applying this patch,
the memory leak is not reported anymore.

=================================================================
==qemu-system-aarch64==1720167==ERROR: LeakSanitizer: detected memory leaks
Direct leak of 2359296 byte(s) in 9 object(s) allocated from:
    #0 0xfffeedf3e938 in __interceptor_calloc (/lib64/libasan.so.5+0xee938)
    #1 0xaaaaf6f1e740 in bitmap_new /qemu/include/qemu/bitmap.h:101
    #2 0xaaaaf6f1e81c in dirty_memory_extend ../exec.c:2212
    #3 0xaaaaf6f22524 in ram_block_add ../exec.c:2261
    #4 0xaaaaf6f22988 in qemu_ram_alloc_internal ../exec.c:2434
    #5 0xaaaaf6f8ae70 in memory_region_init_ram_shared_nomigrate ../softmmu/memory.c:1513
    #6 0xaaaaf66edee0 in ram_backend_memory_alloc ../backends/hostmem-ram.c:30
    #7 0xaaaaf660d03c in host_memory_backend_memory_complete ../backends/hostmem.c:333
    #8 0xaaaaf70f6968 in user_creatable_complete ../qom/object_interfaces.c:23
    #9 0xaaaaf70f6dac in user_creatable_add_type ../qom/object_interfaces.c:93
    #10 0xaaaaf70f7030 in user_creatable_add_dict ../qom/object_interfaces.c:134
    #11 0xaaaaf7340174 in do_qmp_dispatch_bh ../qapi/qmp-dispatch.c:110
    #12 0xaaaaf732da30 in aio_bh_poll ../util/async.c:164
    #13 0xaaaaf735c9a8 in aio_dispatch ../util/aio-posix.c:381
    #14 0xaaaaf732d2ec in aio_ctx_dispatch ../util/async.c:306
    #15 0xfffeecb029d8 in g_main_context_dispatch (/lib64/libglib-2.0.so.0+0x529d8)
    #16 0xaaaaf733bb78 in os_host_main_loop_wait ../util/main-loop.c:244
    #17 0xaaaaf733beac in main_loop_wait ../util/main-loop.c:520
    #18 0xaaaaf70802a4 in qemu_main_loop ../softmmu/vl.c:1677
    #19 0xaaaaf655786c in main ../softmmu/main.c:50
    #20 0xfffeec043f5c in __libc_start_main (/lib64/libc.so.6+0x23f5c)
    #21 0xaaaaf656a198  (/qemu/build/qemu-system-aarch64+0x9ba198)
SUMMARY: AddressSanitizer: 2359296 byte(s) leaked in 9 allocation(s).

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>

----
little concern:
According to code, my bugfix can solve two problems:

1. Lose reference to dirty bitmap of deleted ramblock, because the reference is
   covered by dirty bitmap of newly added ramblock.
2. All dirty bitmap is not freed before qemu exit.

However, ASAN do not report memory leak for point 2.
Any thoughts or explanations?
---
 softmmu/physmem.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3e4f29f126..8c5f910677 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2132,6 +2132,8 @@ static void reclaim_ramblock(RAMBlock *block)
 
 void qemu_ram_free(RAMBlock *block)
 {
+    ram_addr_t old_ram_size, new_ram_size;
+
     if (!block) {
         return;
     }
@@ -2141,12 +2143,18 @@ void qemu_ram_free(RAMBlock *block)
     }
 
     qemu_mutex_lock_ramlist();
+
+    old_ram_size = last_ram_page();
     QLIST_REMOVE_RCU(block, next);
+    new_ram_size = last_ram_page();
+    dirty_memory_resize(old_ram_size, new_ram_size);
+
     ram_list.mru_block = NULL;
     /* Write list before version */
     smp_wmb();
     ram_list.version++;
     call_rcu(block, reclaim_ramblock, rcu);
+
     qemu_mutex_unlock_ramlist();
 }
 
-- 
2.23.0

