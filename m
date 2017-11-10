Received: by 10.223.150.237 with SMTP id u100csp3629393wrb;
        Fri, 10 Nov 2017 03:14:56 -0800 (PST)
X-Google-Smtp-Source: ABhQp+S1a80D4DoyISvNifAH6plxlH+RSUky0PQEPffIqoWL3+FKhqb8jtv1ZVugnkVvoRH5ccGs
X-Received: by 10.99.51.205 with SMTP id z196mr3827545pgz.374.1510312496463;
        Fri, 10 Nov 2017 03:14:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510312496; cv=none;
        d=google.com; s=arc-20160816;
        b=0pRWBJ8q69hr1HmuTvV3jFaHKYYVzetYxH5Fv9gu+dgRi3GCSB8dvVITLr1yNsnodS
         xHkIwUtZMDzvqGk4CEpyBY3B353JQYW8CS0s9FpycpesOjop3+SgCZDUIgtThgT8X07S
         OVWUesMvTzGzucRtSG9D2PKCxrdBQipVI0kv6bHzQspBw6NI8yEHijb6pXA++ACGptRI
         nFPzRQDqfYSkJ8IcLzpJrWtQEk53losGGf8LzL+khq2m/tmtmoad7O8+TCGH7gVPbzb9
         RDhtqqGtjPvS4eklbUhbfV5Ep1/Ks0YqPJyU2Z570KKZfdGdmfq0jNJe8Lc8zgzumHly
         cTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:arc-authentication-results;
        bh=a1o3Nwe6cpoHe/oE+MqjzE94Lxf1DJpxnnE0M9VfGJw=;
        b=f4ymiwNRbHZefJB0QySB/0WkinrF35fB+wFUjyiMw1Pwk8bH3ntDcy6Pf71TtTdXVy
         +ZOo2eDPy4imZT9BIOmztY8zX6WU1ouFyfojGvApOMvfpzurI4d1FuNVWa7G+XavU17V
         fVPuIg/sE3pQ0zWdQyjmUAnqV7+JJVn+Je6gZcabk+b345nXKsD1QG7cL5yWMlDsK2ZO
         jRExTJwzCkr5JFIOq8kXLlO3CKSCVR0m8H6j8FDRGpT1ErAY/7Bwv+4yZzDmsTYP1EYv
         FukykfSQYoJ06LFAnLRWP+lj5iK3MNqT5cLf9p3iXLl/CJCYx4DiX61wjNtgitVbqhGQ
         nFEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s15si8697707plp.268.2017.11.10.03.14.56;
        Fri, 10 Nov 2017 03:14:56 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753066AbdKJLOt (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Fri, 10 Nov 2017 06:14:49 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10507 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752985AbdKJLOd (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 10 Nov 2017 06:14:33 -0500
Received: from 172.30.72.60 (EHLO DGGEMS403-HUB.china.huawei.com) ([172.30.72.60])
        by dggrg05-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DKR46784;
        Fri, 10 Nov 2017 19:14:15 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.361.1; Fri, 10 Nov 2017 19:14:03 +0800
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
Subject: [PATCH v12 06/12] target-arm: kvm64: detect whether can set vsesr_el2
Date:   Sat, 11 Nov 2017 03:19:45 +0800
Message-ID: <1510341591-22817-7-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
References: <1510341591-22817-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A090201.5A058A08.022A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ad27d86be7ac10c5644c1703eca0c064
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 4ZfDTE8LgDze

Check if kvm can support to set vsesr_el2 value for vcpu. When
guest takes a virtual SError interrupt exception, this value
will provides syndrome value reported into ESR_EL1 ISS filed.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
Signed-off-by: Quanming Wu <wuquanming@huawei.com>

---
Detect whether KVM has the capability to set ESR instead of detecting CPU RAS capability
is discussed here:

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
