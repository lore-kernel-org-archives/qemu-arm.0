Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp862340lfq;
        Wed, 16 Dec 2020 17:51:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2JmUTMN7tPfWfM7JYv08Csv7menGpAT0E20yLrWe1I1Da4R3NN7fEG+ugi60ePciOZwZM
X-Received: by 2002:a25:8b89:: with SMTP id j9mr52547444ybl.302.1608169893176;
        Wed, 16 Dec 2020 17:51:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608169893; cv=none;
        d=google.com; s=arc-20160816;
        b=gijUrxHd1vtXZG+X4fSoVLypCReiq0Mp6GF7CXiZ3FnUQuKS6vBKXXS+LLcyZMKgBb
         57wuNyjhK6xtAaFPz/dnZosVeEWbOPQ4WlB3K7IFAnxx9krrGHWkPBY0AAbbsm7MR99b
         3pphOilB92r/SLu5fL+w2gGbCjo+sVWL0Su/l2QFCeXTJTv6PB86COPCvL7ha4qCq+KA
         JwmhJoJ2F5iB6LuEgVSIJypyh+zLHxjwZoeaTd/FOPibYQGoHqOi/hu611rjLY/OHzgh
         zW2D+mz1yAW/GGeh7X5VkXp/Bj2CmBecPWMVjDkjs6vshYAtrvd2BMObBILSrwkB3VYW
         QuMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=BWfGsTzK5rKjlWuJUWUeqJYinUxptHD90QJQY93bstQ=;
        b=Fp3Lm+ccezLtmPSnd9cexU5rqEM6YNMkLN8LBTxVE7LVfgVlKdfeNl0qUMnUEFxxYX
         Q0sVUw141Uk+8m865hZ1Mqiwy4SIZAFiy85+8/D1CHRR5iRlgWQXnnhFfLvacGkk9QK/
         SrMCq87MhY/LJYsmVQC4lHyv0Tp2cKOwWAEHOmsxiI3F4/c9sx/f9v/RhFmz6Wykthou
         8wjnA8FgRY8W/MQIamWELtRUNCX1Kv7zPUJvwtpcpE7uOZL4zy3T6hwV/qu8CKaAxz1m
         ZgEdJeRVnGJD1xpM/DxiAPWucdYCwVBseOnEi0WmYBRGZrcwsej8PIGb8dU853W5i5WP
         r3ng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t127si2805447ybf.263.2020.12.16.17.51.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 17:51:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpiS3-0001Ol-Jr
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 20:51:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kpiR8-0000yD-Hd; Wed, 16 Dec 2020 20:50:34 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kpiR5-0005tD-E3; Wed, 16 Dec 2020 20:50:34 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CxFKz3sWmz7FlN;
 Thu, 17 Dec 2020 09:49:43 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 17 Dec 2020 09:50:14 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 1/2] accel: kvm: Fix memory waste under mismatch page size
Date: Thu, 17 Dec 2020 09:49:40 +0800
Message-ID: <20201217014941.22872-2-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20201217014941.22872-1-zhukeqian1@huawei.com>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhukeqian1@huawei.com;
 helo=szxga07-in.huawei.com
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
Cc: jiangkunkun@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wi97Tp7voD0Q

When handle dirty log, we face qemu_real_host_page_size and
TARGET_PAGE_SIZE. The first one is the granule of KVM dirty
bitmap, and the second one is the granule of QEMU dirty bitmap.

As qemu_real_host_page_size >= TARGET_PAGE_SIZE (kvm_init()
enforced it), misuse TARGET_PAGE_SIZE to init kvmslot dirty_bmap
may waste memory. For example, when qemu_real_host_page_size is
64K and TARGET_PAGE_SIZE is 4K, it wastes 93.75% (15/16) memory.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

---

v2
 - Address Andrew's comment (qemu_real_host_page_size >= TARGET_PAGE_SIZE
   is a rule).
 - Add Andrew and Peter's R-b.

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 389eaace72..f6b16a8df8 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -620,8 +620,12 @@ static void kvm_memslot_init_dirty_bitmap(KVMSlot *mem)
      * too, in most cases).
      * So for now, let's align to 64 instead of HOST_LONG_BITS here, in
      * a hope that sizeof(long) won't become >8 any time soon.
+     *
+     * Note: the granule of kvm dirty log is qemu_real_host_page_size.
+     * And mem->memory_size is aligned to it (otherwise this mem can't
+     * be registered to KVM).
      */
-    hwaddr bitmap_size = ALIGN(((mem->memory_size) >> TARGET_PAGE_BITS),
+    hwaddr bitmap_size = ALIGN(mem->memory_size / qemu_real_host_page_size,
                                         /*HOST_LONG_BITS*/ 64) / 8;
     mem->dirty_bmap = g_malloc0(bitmap_size);
 }
-- 
2.23.0

