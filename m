Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp49432ejb;
        Mon, 9 Oct 2023 13:40:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYgIUC7CQUGHcpisy5k2yLO21F0aaVZc5u8CRCLKn/o0Q4JQEzMW0ZraHYycXA/shd5H8t
X-Received: by 2002:a05:6000:109:b0:320:9e2:b3a2 with SMTP id o9-20020a056000010900b0032009e2b3a2mr15022014wrx.33.1696884025937;
        Mon, 09 Oct 2023 13:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696884025; cv=none;
        d=google.com; s=arc-20160816;
        b=bIGdgIS3h3NsTigub6tTAfzOiIGNPntuf1+zYKHQWi2CWjRNeNOLBtx87gPawmcGuT
         yu3WgxKQmioVjNrJxxijkeiu8sbQ7aT8G9Jz3/iWJ/6xLG3YjrvZ5j/bOCAMYF4CyjI4
         m3dlojfPCm/Rgv2os0+KUJry+rR7tpyB9Vqm1zm+sqHuJKvkeOQeT0PQwy8dLuuhuVVS
         eh5tCikcL6Bg7VLZ9VGffj84hK5OwPnfYdYOfFQvWZrBfaaWzTNLXU8IAJiBnQwAsf/C
         qkFhXPBPgCHJfoUqVpob4djpZyDxpmWsCBfB+XzmMKv4aRbK/om/9CaaLLK4032ULmRL
         CQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=qCNh/vOVVjEQnNSeKvwPw4nUeQ5allYWPl1Jwdp4Yyg=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=nR6BLYdG+cm1BAODZD/Ejxkc4+meQ1QxgAfNBXx3DM4FRFaEKk4n6zeBZIO1sauMnG
         Mz38JhEhaQGT96x1Ad4P4rn/piJzve79xPbXFPmAwxT5/6+Tyu6JSD9eDeSunXUeG3IX
         Zhy5nW0rczXX6plUyizYLcvfNS12mDDY4+1gKlnRPIhn01NjgoISXY63gLzSVE45fmZb
         lwA4gzr99+tA94ki+7nWLh00jSmSFzveOkfNMxICgmyeSsAQA7K+t6OMilSStTgkqHkC
         +kDOtAq3oLeFrCE/Q4Lc8ZTnBIJ/mB3LfJJ38SHGEt72t6BcgDaBC+OmxJYSUQVbuBA0
         01Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id a2-20020adfe5c2000000b0031adba3c71fsi3961891wrn.491.2023.10.09.13.40.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 13:40:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S49rk07wSz67hvQ;
	Tue, 10 Oct 2023 04:40:06 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.175.116) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 21:40:03 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<linuxarm@huawei.com>
Subject: [PATCH V4 10/10] target/arm/kvm: Write CPU state back to KVM on reset
Date: Mon, 9 Oct 2023 21:36:01 +0100
Message-ID: <20231009203601.17584-11-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231009203601.17584-1-salil.mehta@huawei.com>
References: <20231009203601.17584-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.175.116]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: 9OafBPi5ykyP

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

When a KVM vCPU is reset following a PSCI CPU_ON call, its power state
is not synchronized with KVM at the moment. Because the vCPU is not
marked dirty, we miss the call to kvm_arch_put_registers() that writes
to KVM's MP_STATE. Force mp_state synchronization.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 target/arm/kvm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index b66b936a95..8cb70b9e7c 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -642,11 +642,12 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu)
 void kvm_arm_reset_vcpu(ARMCPU *cpu)
 {
     int ret;
+    CPUState *cs = CPU(cpu);
 
     /* Re-init VCPU so that all registers are set to
      * their respective reset values.
      */
-    ret = kvm_arm_vcpu_init(CPU(cpu));
+    ret = kvm_arm_vcpu_init(cs);
     if (ret < 0) {
         fprintf(stderr, "kvm_arm_vcpu_init failed: %s\n", strerror(-ret));
         abort();
@@ -663,6 +664,11 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
      * for the same reason we do so in kvm_arch_get_registers().
      */
     write_list_to_cpustate(cpu);
+    /*
+     * Ensure we call kvm_arch_put_registers(). The vCPU isn't marked dirty if
+     * it was parked in KVM and is now booting from a PSCI CPU_ON call.
+     */
+    cs->vcpu_dirty = true;
 }
 
 /*
-- 
2.34.1
