Received: by 10.223.159.82 with SMTP id f18csp1393188wrg;
        Mon, 27 Nov 2017 02:44:40 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbUw3kxkp93TaptCfi6Rj0Q39xwCqPDIMG8Oy4ONmGmI51T3TBvNp7KER9qDba/57GrV1Xf
X-Received: by 10.101.93.77 with SMTP id e13mr36469677pgt.431.1511779480269;
        Mon, 27 Nov 2017 02:44:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511779480; cv=none;
        d=google.com; s=arc-20160816;
        b=SKcsIo/BTXujrlTGT63SGbUFBmijPdcUobmK3Z/yEgptdQDkshYne28asBcW+eFhTF
         1TD+CC6Xf8iT09RBAc5eHWYodsXn5eRCOY30UU+sQMmT0r8EkAhs3XWJkmAnK7jTRhkS
         H4d/Y8yQHS6VH9Yo5VPUToxtMTdOV/k9FAaMB0zfwid3+73UeTVUxeyahZpTbF6E47aI
         0EMchmsHGHd2YLdCGWhmBopHnNmD4OdThyhrux4pAas9wLV4fJJKZfhlEgEKwtQc8BR7
         +htZWp7MMdC0jIc+Dc9jJhPWPjJNxCSUMu3HVksiA9eLNK0wXa6LMjvcQCt9GtpiBQYu
         0CKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=SILSJ2XECTBCtWWKI76rKm3QJ44nCzzq/vIZ/n1i1uM=;
        b=GqkapzWD8Ntg2CR5klZZuw5BMNuF28ubhH+06nVPG4rPhla2BU2wZ3kGkd9RWfkad5
         8nzMW5QH6oqHtn+hxosBuFGVVf+Nxshd2NW5BtD5mqwJRZ0mOvbKWnMjZuzP+KVOJt4g
         0y4sYSsB9mHHdR1Ixwmlzgm0EER+29kYlEAAbXPrMyiUG97ytVfqAYv3F7ZxUhE38W/y
         M6AqkvJB1FxFWW4H5F7Tzt9CjNSU7Z27epiiqLwlgE8yp1Wi7vGCSgtJF7tvbylcfxVM
         uCxQeia3bFwY98t7se7c/1jgXzZT6g8aPwgf5v2Nmdp+shrJSK9lWKnF1LNv4KcV8KKr
         Dnhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t11si23462099plq.683.2017.11.27.02.44.40;
        Mon, 27 Nov 2017 02:44:40 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751619AbdK0Koa (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Mon, 27 Nov 2017 05:44:30 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2173 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751544AbdK0Ko3 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 27 Nov 2017 05:44:29 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 3E29B700FE97;
        Mon, 27 Nov 2017 18:44:25 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.361.1; Mon, 27 Nov 2017 18:44:20 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v13 06/12] target-arm: kvm64: detect whether can set vsesr_el2
Date:   Tue, 28 Nov 2017 02:49:49 +0800
Message-ID: <1511808595-24158-7-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511808595-24158-1-git-send-email-gengdongjiu@huawei.com>
References: <1511808595-24158-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: U/EpSEcbO4VJ

Check if kvm can support to set vsesr_el2 value for vcpu. When
guest takes a virtual SError interrupt exception, this value
will provides syndrome value reported into ESR_EL1 ISS filed.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Quanming Wu <wuquanming@huawei.com>
---
Address James's(james.morse@arm.com) comments to detect whether KVM has the capability to set ESR
instead of detecting CPU RAS capability in [1]

[1]
https://www.spinics.net/lists/kvm-arm/msg27150.html
https://www.spinics.net/lists/arm-kernel/msg604440.html
---
 target/arm/kvm64.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index a16abc8..af8ebc9 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -980,3 +980,9 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
 
     return false;
 }
+
+static bool kvm_can_set_vcpu_esr(struct KVMState *state)
+{
+    int ret = kvm_check_extension(state, KVM_CAP_ARM_INJECT_SERROR_ESR);
+    return (ret) ? true : false;
+}
-- 
1.8.3.1
