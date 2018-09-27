Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1728040wrt;
        Thu, 27 Sep 2018 02:28:28 -0700 (PDT)
X-Google-Smtp-Source: ACcGV620Kalp7huLtQLSH3doM9NJggrxjqG4lTadKT2wDgVR2ojtrMigVY5t9jMwaDTm/5Ui8Q8E
X-Received: by 2002:a37:8786:: with SMTP id j128-v6mr7273832qkd.32.1538040508404;
        Thu, 27 Sep 2018 02:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538040508; cv=none;
        d=google.com; s=arc-20160816;
        b=b5RKu4L4JQYFqFE8RadJyLaFbMtudR+xbAyN7TWqoBoP7k6bQ/fh4Pv9MJAVq4nvja
         F0UxdG+pHWPTrDaLYLk8SmI9ccolV7IWvdJCnXF9khvyUs2KA/gJsl56W8KbbUflIKMS
         1RUsyK5ViHkpk5Qxz337pRdfIUr/s2DIuAx70Sf6ei+kYpKJFrXY2p9EnM5Myq74RlGm
         vU8FAJw+uIScA/cYCpWoQ6M3cRhW+cWxKtX3Dzt6S1GQQe5W+skBqxjVWrbwoqFDbJXK
         Suudv3OgxxYojv0X98RoT4LaqJNZ3OQbv0UAp/grK3e0/6pEsrFmEQ3drryc6nYL371N
         VDzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=c8z+hTxGfAzDKZsjtUb4Kmiqy8zDyKEahSGl5NzKVrI=;
        b=dA4RzdLvLkovF/4WiBgw43w9aQaa1vl98R3iGmtyBMt+ecDt9k9l6WJldf646dQgls
         /0vdDV9paGmKvtvW6BCEFCL00fshGiZ9r4CmvdvcKjD4PC84vw0ZL9umzndnMFTxUWA+
         u8DfKQ7Coy3BTTj8YvCgtzj4YjnlX+u87/7B1yZ7Iifhc3YIDnVGjnhGpLCLapoYS7Uz
         po70wgcs3W0XxuaSd90IYfGptLsjAASCEeIl4tfPA0LNlLAg2aVXVZ78YIkEi1FcZ+Ot
         EVTRJVWveHAxZRpQXrWaA0Ry6WcleubZRoPPPqC99mun7vkrKLf6+xk+3mQdZUSkAKxq
         zpZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p5-v6si806343qkb.120.2018.09.27.02.28.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Sep 2018 02:28:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34587 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5Sax-0007co-Vm
	for alex.bennee@linaro.org; Thu, 27 Sep 2018 05:28:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g5Sah-0006Cl-1C
	for qemu-arm@nongnu.org; Thu, 27 Sep 2018 05:28:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g5SSx-0000YE-Lp
	for qemu-arm@nongnu.org; Thu, 27 Sep 2018 05:20:14 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:57162 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1g5SSx-0000KC-9N; Thu, 27 Sep 2018 05:20:11 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 717B4CA850BAF;
	Thu, 27 Sep 2018 17:20:05 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server
	id 14.3.399.0; Thu, 27 Sep 2018 17:19:59 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Date: Thu, 27 Sep 2018 13:24:06 -0400
Message-ID: <1538069046-5757-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH] target/arm: fix code comments error
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: gengdongjiu@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H8mNIfQGkmuy

The parameter of kvm_arm_init_cpreg_list() is ARMCPU instead of
CPUState, so correct the note to make it match the code.

Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
---
 target/arm/kvm.c     | 2 +-
 target/arm/kvm_arm.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 65f867d..54ef5f7 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -310,7 +310,7 @@ static int compare_u64(const void *a, const void *b)
     return 0;
 }
 
-/* Initialize the CPUState's cpreg list according to the kernel's
+/* Initialize the ARMCPU cpreg list according to the kernel's
  * definition of what CPU registers it knows about (and throw away
  * the previous TCG-created cpreg list).
  */
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 863f205..5948e8b 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -50,9 +50,9 @@ void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
 
 /**
  * kvm_arm_init_cpreg_list:
- * @cs: CPUState
+ * @cpu: ARMCPU
  *
- * Initialize the CPUState's cpreg list according to the kernel's
+ * Initialize the ARMCPU cpreg list according to the kernel's
  * definition of what CPU registers it knows about (and throw away
  * the previous TCG-created cpreg list).
  *
-- 
1.9.1

