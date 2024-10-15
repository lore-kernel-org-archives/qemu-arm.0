Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2344715njb;
        Tue, 15 Oct 2024 03:17:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+QYrZ26ippewPpoay9xoaWd0WVumg6dSNrnKbfISOzYzj1/vem2Z9ZuIwkp3NWQFmNNb8jlwOw9x+iw==@linaro.org
X-Google-Smtp-Source: AGHT+IEcJw6Adr43o3bAMC0GNhkLzlYAW/uHDaWPlrB0NdnpzP5Wyr5hCLxNxnDIALsXraWUjey6
X-Received: by 2002:a05:6902:11cf:b0:e26:aac:e89b with SMTP id 3f1490d57ef6-e2919db5feemr11604705276.31.1728987462411;
        Tue, 15 Oct 2024 03:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728987462; cv=none;
        d=google.com; s=arc-20240605;
        b=lQRzNdPuQYTddYYM75mdCsT3FIv82mLa+pg50s/j2nzZYOpuHG6FVb22+E5KCjsq9G
         Ntgp6Z3/AnJMpdvO7YmvQWj8G9h6jST7SzcGAGHejhpi/VAy+VZHMIXH5JsqpJ1LF+yv
         Rn5DqDYM/0CQIvP/3s/2ylkrCNIgMNOZKtZ7JpoHl9FCqV2nJaZzk0f8Ol4z78qtYIar
         lPZZMKTn1ev73gs56rBxh3XVINxK/NQGZCIL9ODwKMTTxHFf/i+cmwg8GkGyrDbiqGQt
         MhoNJzRZsF+FyQsxEymHz0nmexnBi10TEmNTYEfIDE0bvMffCBvdtsfbSmaz7HxGZCVs
         N06A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ydkYIUVvxKvJ/KF8zq28V6bhiE02qiIOCQCjIztTqEM=;
        fh=f7aqOn0Aylihzqer4hTA2kHSEaA8DU6KE1VFtniI5w4=;
        b=WOHBSSB9G0zjHNZ3f2tdxRpBVEQ+Y5p+OLMhW/avH+KlwqEhGgv/09rDFumpeS3cyY
         dwOxCEwz0oG6Avlx4jQgOg3068o9wtaAwiKWu6uWuTLOPxU+x7qhdBIui8rWYNa3LV89
         A69WU7aEPu7cfONj69bLG3MLT7uT2ut+2YBZzWVREXyl1f+TpkwVOjVrVVzN3J9KOECX
         scAJNtfrqlDltc2ZkXHMEylcBXn7EGEU9SON+KdeHRVUTR3iQ+XnPe7CBn5L/gIguWVK
         r0udi44TKbjE/H1WAVgGzDWownkfHTqh4bMwdTyOGuoR0HpRODrH63534sND4nysM9fh
         wyFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d75a77b69052e-4607b4a0a0csi10396771cf.439.2024.10.15.03.17.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2024 03:17:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XSVQB2VjXz6K985;
	Tue, 15 Oct 2024 18:17:06 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 7FB101400D9;
	Tue, 15 Oct 2024 18:17:40 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.48.146.149) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 12:17:21 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <peterx@redhat.com>, <eric.auger@redhat.com>,
	<will@kernel.org>, <ardb@kernel.org>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>, <npiggin@gmail.com>,
	<harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
	<darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
	<vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
	<miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V5 29/30] hw/intc/arm_gicv3_kvm: Pause all vCPU to ensure locking in KVM of resetting vCPU
Date: Tue, 15 Oct 2024 11:16:56 +0100
Message-ID: <20241015101656.254330-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015100012.254223-1-salil.mehta@huawei.com>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.146.149]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: ARcW6BZ3ayPA

vCPU reset can result in device access to VGIC CPU system registers using the
`IOCTL KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS` interface. When accessing these
registers in the KVM host, it is necessary to acquire a lock on all vCPUs during
the `vgic_v3_attr_regs_access()` operation.

This operation may fail if KVM is unable to acquire the necessary locks on all
vCPUs. Therefore, to ensure proper locking of the vCPU being reset and prevent
failures, we need to *pause all vCPUs* during this operation to facilitate
successful locking within the host.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 hw/intc/arm_gicv3_kvm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 3e1e97d830..bcdbf83897 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -714,10 +714,19 @@ static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
         return;
     }
 
+    /*
+     * This shall be called even when vcpu is being hotplugged or onlined and
+     * other vcpus might be running. Host kernel KVM code to handle device
+     * access of IOCTLs KVM_{GET|SET}_DEVICE_ATTR might fail due to inability to
+     * grab vcpu locks for all the vcpus. Hence, we need to pause all vcpus to
+     * facilitate locking within host.
+     */
+    pause_all_vcpus();
     /* Initialize to actual HW supported configuration */
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
                       KVM_VGIC_ATTR(ICC_CTLR_EL1, c->gicr_typer),
                       &c->icc_ctlr_el1[GICV3_NS], false, &error_abort);
+    resume_all_vcpus();
 
     c->icc_ctlr_el1[GICV3_S] = c->icc_ctlr_el1[GICV3_NS];
 }
-- 
2.34.1
