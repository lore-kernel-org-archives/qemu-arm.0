Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp599786njl;
        Tue, 8 Oct 2024 20:38:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWaJqCUTUpVC/xt0WLT4Q4POxaxK0NtJELA/2EGNOOjpGwQ2Yj/oQH9qMxYIp22vrE9/gHGt4uyPXSwLg==@linaro.org
X-Google-Smtp-Source: AGHT+IHObpc9+wxz0PDyncGUPv1sJbkt1Fd6hum6J4iNB5o0HCSk6dyPoYrmCG+ZZEK8BYz+lXhO
X-Received: by 2002:a05:600c:45d1:b0:426:6308:e2f0 with SMTP id 5b1f17b1804b1-430d729f2cdmr5081465e9.26.1728445110114;
        Tue, 08 Oct 2024 20:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728445110; cv=none;
        d=google.com; s=arc-20240605;
        b=luJucEicZGc5CLpDk33LAz456jByctouE4BhXPZEszqGmNJpQbkV9pGe8swKgUMpHx
         ZCbtW85lr49WW9kH1cYppR3OgGoQRKwS6hTUOS+AvjVMbdHsGC9NjaTrw+lFZ7S2Mwi7
         P22W/XBzeY4JIkwb1WswmkGAxo3DUt+hKVObLCUSlfYy2/NG5K8a1QQ0KPTbEIGxMZ4F
         GKk2Mfd5bpdScY0qWCh8a97mosqPyw6Y0z/uDaDEx1rkP+/RWUCR6CH7cP62aI6vQRK4
         iYByQOq6flJQuYwdxVaxlAEzDQ3vumitcx0QV/sm0E2hWwSgr6RpqTxJl/6pdoCPxb1J
         cLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=ydkYIUVvxKvJ/KF8zq28V6bhiE02qiIOCQCjIztTqEM=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=Rv3j2agWLg1+9hIqUDZbrGajYMvD62E9eWTJO8NH9/xiOfNLcyd5fc1xgmgiVuEard
         YJozZkQ3pFF3drlQprltO9HZxSIvv/glcPWHphANLghTfy4niwPBlFQWFMxaWpayxGk5
         VDQAYMAZ93thHmTs0JZQywZf4tsUHm5r9oTrE3OW2ragc53vgzAzOFmXXdac0WJrMBQ1
         nX5FarcLa2OyA/AI8eJltiCAWTEhzdtMOhAlz/7eIBdfTaSzqI8OQgtTQn7MSy52n7jJ
         270PjuwVr5tX9MbgUbtNXwogCtz6TI2nUXv6IuYSuc6CJc0cL2ugz4XCzHuhBMmed+0D
         eDJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-430ccf516ecsi2807395e9.98.2024.10.08.20.38.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:38:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdm23Sybz6LDBf;
	Wed,  9 Oct 2024 11:34:10 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id 352F7140447;
	Wed,  9 Oct 2024 11:38:29 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:38:10 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<gshan@redhat.com>, <rafael@kernel.org>, <borntraeger@linux.ibm.com>,
	<alex.bennee@linaro.org>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<shahuang@redhat.com>, <zhao1.liu@intel.com>, <linuxarm@huawei.com>,
	<gustavo.romero@linaro.org>
Subject: [PATCH RFC V4 32/33] hw/intc/arm_gicv3_kvm: Pause all vCPU to ensure locking in KVM of resetting vCPU
Date: Wed, 9 Oct 2024 04:37:03 +0100
Message-ID: <20241009033704.250287-3-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009033704.250287-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
 <20241009033704.250287-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: uRqeoV/Cf8+p

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
