Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1898400ejb;
        Mon, 9 Oct 2023 04:32:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz07YDE6oPdrNwUNQIkTDxIF51rJjHWlOC5w8L+KBxIso9roaJK9SsmQjh71G21HE9gbkQ
X-Received: by 2002:adf:fd46:0:b0:31c:7001:3873 with SMTP id h6-20020adffd46000000b0031c70013873mr13428916wrs.60.1696851157143;
        Mon, 09 Oct 2023 04:32:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696851157; cv=none;
        d=google.com; s=arc-20160816;
        b=unD3cslbd0caJBX2TKnzx+jS1uJmWgaBfaZxM3ExDjzCiyp1CsFlpKdKZhYqBccM9r
         jUbwTCDmbhZqcvCWInLxtamofR6BLRI2ggKFMYV7XyyThIuQ4ZOHa/uqjKItCjk6BT5j
         Bo5pSxZMy930e10V0f2rJfoNVJ5sEoR6h5K25/iByqcEFM5ZokvT4ZGqlvqr0X7OLFNB
         f+oxeMEDu63DczLwL3fDHmsUJnW2EUUWDn9apMQySiGOPDvNBmeVK7EGGPPLXceh0Ho6
         ZpSlRT68y5mWcRIDUnzKTB2xepBiOLa2PQdtA1kk6g38EIrsZIhCFOqkK6bV0NPK8qOL
         f29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=qCNh/vOVVjEQnNSeKvwPw4nUeQ5allYWPl1Jwdp4Yyg=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=e+uo8NRl+UIrx5tBvvVYH3gU6BMQLrooinkXV6Ty45y9IJUSyaQI8ZdXS01tPlfX9G
         seFKXiuiT1oP4V3wI6uZBHpUxQwNC7yG+g5isle4y3NIg2CnPTc5fEMzSKI2Qt58S0lu
         FDrXz2zBQ6wFxPy57XYyVt0rXL/Ci79dHRMEFv4UYL5G04S2vEN1stsvXhJsCMY+EwfN
         wH1RtpIecQfE+qEHOL37UYrSU4Q1snq6C4eMpLBj2Mi52wB5ToEBkP898qcejDIELGJr
         u89ZXNZMR0e6q13A5F3MRrILM9rhLJnTKaC0116wC0EsT42sdoiBv/lUnR/xhpxo8VVW
         x5eg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id z5-20020a5d4405000000b00325aad01297si3434310wrq.213.2023.10.09.04.32.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Oct 2023 04:32:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S3xhd5bGDz67cSL;
	Mon,  9 Oct 2023 19:32:17 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.154.91) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 9 Oct 2023 12:32:16 +0100
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
Subject: [PATCH V3 10/10] target/arm/kvm: Write CPU state back to KVM on reset
Date: Mon, 9 Oct 2023 12:28:12 +0100
Message-ID: <20231009112812.10612-11-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20231009112812.10612-1-salil.mehta@huawei.com>
References: <20231009112812.10612-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.154.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: XCpztN5DHEHy

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
