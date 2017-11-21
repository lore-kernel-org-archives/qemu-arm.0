Received: by 10.223.159.82 with SMTP id f18csp507275wrg;
        Tue, 21 Nov 2017 02:32:12 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbpEf82OSsCsnZUIV3aw+DQ67bNR6zQ7O7Q7qyPQexeoT6dFpJDEIbufa7FXX5ndmdV/Vwe
X-Received: by 10.99.106.137 with SMTP id f131mr16786302pgc.334.1511260332193;
        Tue, 21 Nov 2017 02:32:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511260332; cv=none;
        d=google.com; s=arc-20160816;
        b=KrV+rZuNff/rqyS+TKRZUkoNyuDBmVsjaJR2su+OgBia78up+FJetlApiuYGhG5P1G
         72xYiNYuBGTM/APYwp6dZc9Bxl318oFiSy+A+KT/PxveGeNGq9hn/0EtqPW1Z2mX25Dm
         NsFyBIg9C9sXREdRWWgdd0KYnESpBTfm5Ao66xA/9w5VnD2RLsgM0gd7rbK301BmEfr9
         KDeeTqU0iQxP1R5QtuHDm0TN/VUGF/4w9GzM0ixveITGeZqvhWfKbfQ/GeQvqe7WBF4q
         IJNfromr8pxJUSoieELn/AcuHo413yZyfXjrq9j7iCeiCdUMxozz5HYGafyY9mv3Myd1
         IWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:arc-authentication-results;
        bh=mXG1ZKOJDxaf/ey3LWm7FsgGaos9uYy6375X1CGNY6M=;
        b=yHZQNktU3o3RBHDTLnqvNINATx3brQ7XQeYZsW9yaGDtF4UsreS3Wc+Ijd6Jo7Gy6Q
         VMwJHYTwxSQZp2HqNao+tql0/BrAyrej5r+fuDy0wj6/vqs5eLlnkRlbNnP/9gCrdzlp
         RSQvc9Fn+fzkBuKxR4AqQ0q7vS0+jFMKqL4gDwK7cylqkrEmCZod2xlN6wvXIzQGZH/o
         Jm3E9owngKWOxKXQ70w0v7QafXre8YTKej8yUrxKfLUHy59zMZRHFoKSKl761ETTL9uz
         ctJqc/cPMVUVK58ZUtIbj+qoM6eFQzGSfkrivWHI6kwkcV+IgH1GUSlPmIlrN4gYNiIV
         1fhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 1si10611141pla.339.2017.11.21.02.32.11;
        Tue, 21 Nov 2017 02:32:12 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752067AbdKUKcC (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Tue, 21 Nov 2017 05:32:02 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:10972 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752036AbdKUKb6 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 21 Nov 2017 05:31:58 -0500
Received: from 172.30.72.58 (EHLO DGGEMS402-HUB.china.huawei.com) ([172.30.72.58])
        by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
        with ESMTP id DLG39785;
        Tue, 21 Nov 2017 18:31:45 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.361.1; Tue, 21 Nov 2017 18:31:35 +0800
From:   Dongjiu Geng <gengdongjiu@huawei.com>
To:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <zhaoshenglong@huawei.com>, <peter.maydell@linaro.org>,
        <mtosatti@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <marc.zyngier@arm.com>, <christoffer.dall@linaro.org>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <kvm@vger.kernel.org>,
        <guohanjun@huawei.com>, <lijinyue@huawei.com>,
        <huangshaoyu@huawei.com>, <wuquanming@huawei.com>,
        <zhengqiang10@huawei.com>, <linuxarm@huawei.com>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <dingtianhong@huawei.com>, <wangxiongfeng2@huawei.com>
CC:     <gengdongjiu@huawei.com>
Subject: [PATCH RESEND v12 06/12] target-arm: kvm64: detect whether can set vsesr_el2
Date:   Wed, 22 Nov 2017 02:37:08 +0800
Message-ID: <1511289434-1551-7-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
References: <1511289434-1551-1-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
        refid=str=0001.0A020203.5A140091.0080,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
        ip=0.0.0.0,
        so=2014-11-16 11:51:01,
        dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 730eae1b87a973507ebb3e579f33d610
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: QNR/+6z43eHB

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
