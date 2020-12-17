Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp862570lfq;
        Wed, 16 Dec 2020 17:51:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoA16tUvZLpYOYMcrd7oZOUzybtmYSbkGY7d1CJir9x1QfP1q8aGXorPEFAJ0p3GvF7gs/
X-Received: by 2002:a25:748a:: with SMTP id p132mr23849221ybc.268.1608169916215;
        Wed, 16 Dec 2020 17:51:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608169916; cv=none;
        d=google.com; s=arc-20160816;
        b=Ph28SKQbU7TJ5YQf4jgmqiaCFIMWKdvncyQOnJTcAaMJIrAM866SbjUrVVLVn18r52
         T0dN7cev32p8dUFjxggzZqUGRkIma/pSTis1bXGYv9NNjZo2CtRo687Gf/+5jl9Woord
         1l7ybYCFuahTlBj6yF4Twz7my9Ov4tKVzgRygMLTh2UKPepUAaM4GEiL0ewF8NAr4/yU
         WoiYcD5uT71H0DlX8Dv8Ztik4WXMpXVKQPEzwXj66cyY067p/G33HsN5BHA+E9CIOHd2
         oAS5FljO6zwJnJWwwn4UjPo9SyB6E3KK1qac5OwpNpoDVkEcOjV12rWvEBTMu9VOuTuu
         /ymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=sH/ndD48dYLjGjS/hRL2DO3I5tRlvdT0bb+Sbj7jE48=;
        b=oeRbED0AVqViVTFyJ2K4TPvTBgR78SfrgAUSrkXqD2V11GAhHEPh1iljERIWJBMD+P
         yH6OOre/oTZjEBO1MMwYyLowughlH0/wD7uI4l5UlT8iUEPkb03gEeih5xplpYfDWEth
         LMZS+DqPTEc80rxQiBhnna+9pr/AI19N6/9D1oXetK8zGgOq4fvRKZ7gUobmBYE7huOr
         p+4bsRBEI5YOr5Tx8l34PngMWY+DYBFqU4nHlrYvU+Uc/apT5glKakoi4tSYhhv2tZuy
         apD0XRxStHy09aNckeSxUErqGqgvTfsodH41TEVc+bzPF1tNY+yHtAqbEQYUYb36zlkN
         Fr5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e5si2380927ybo.330.2020.12.16.17.51.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 17:51:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpiSR-0000z3-KH
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 20:51:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kpiR8-0000yN-Uj; Wed, 16 Dec 2020 20:50:35 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kpiR5-0005tC-Dr; Wed, 16 Dec 2020 20:50:34 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CxFKz3bs1z7Fhk;
 Thu, 17 Dec 2020 09:49:43 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 17 Dec 2020 09:50:14 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 2/2] accel: kvm: Add aligment assert for
 kvm_log_clear_one_slot
Date: Thu, 17 Dec 2020 09:49:41 +0800
Message-ID: <20201217014941.22872-3-zhukeqian1@huawei.com>
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
Cc: jiangkunkun@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hbGBddoKGe2Q

The parameters start and size are transfered from QEMU memory
emulation layer. It can promise that they are TARGET_PAGE_SIZE
aligned. However, KVM needs they are qemu_real_page_size aligned.

Though no caller breaks this aligned requirement currently, we'd
better add an explicit assert to avoid future breaking.

Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---
 accel/kvm/kvm-all.c | 7 +++++++
 1 file changed, 7 insertions(+)

---
v2
 - Address Andrew's commment (Use assert instead of return err).

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index f6b16a8df8..73b195cc41 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -692,6 +692,10 @@ out:
 #define KVM_CLEAR_LOG_ALIGN  (qemu_real_host_page_size << KVM_CLEAR_LOG_SHIFT)
 #define KVM_CLEAR_LOG_MASK   (-KVM_CLEAR_LOG_ALIGN)
 
+/*
+ * As the granule of kvm dirty log is qemu_real_host_page_size,
+ * @start and @size are expected and restricted to align to it.
+ */
 static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
                                   uint64_t size)
 {
@@ -701,6 +705,9 @@ static int kvm_log_clear_one_slot(KVMSlot *mem, int as_id, uint64_t start,
     unsigned long *bmap_clear = NULL, psize = qemu_real_host_page_size;
     int ret;
 
+    /* Make sure start and size are qemu_real_host_page_size aligned */
+    assert(QEMU_IS_ALIGNED(start | size, psize));
+
     /*
      * We need to extend either the start or the size or both to
      * satisfy the KVM interface requirement.  Firstly, do the start
-- 
2.23.0

