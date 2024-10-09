Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp599700njl;
        Tue, 8 Oct 2024 20:38:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkcsU337ieRZ+D0OCTYOInX1RX4PBUxbl+sT2h9wHCuntEIXBsuQA/fckE0kt2aYv4r44JvlLUOccXbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEAeEcEfnqG1wAPPmqZV3akf6lxFwSizCmBAQYIDu5aXEeQNPwnPhj70WZKl4OJve5BdoHU
X-Received: by 2002:a05:600c:1c9e:b0:42f:6878:a68d with SMTP id 5b1f17b1804b1-430ccf4479emr5203405e9.20.1728445090785;
        Tue, 08 Oct 2024 20:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728445090; cv=none;
        d=google.com; s=arc-20240605;
        b=jtq/0iRkytjwetQhx4FbjZ66LwO8oUsy5aIsu5tN5HLM0N0ow8wOeIIqIulS6gOKqq
         4gy8tIs62bBoyJVfxCZONiuOK/5TSUhATBQsQKmXGhYkvCbjdKMSVQ0V6RhTfpBdm3OQ
         JrPDANlsz5YzLMXYlzTdxoNV6ERLwN5e2EjZpHeKXC4aitvrNqOK+r295Jt87guawO6k
         Nf5ULgXyFIzWCprpzVu9RYM9+y9x5snCh6/bqYB++RLnEeil2yDu1xOCghZNQvS0FnPi
         l0FUX5kiCnbQli8cX7JZp2LnuSHNopIgfw+pa2Dh6FEQOT8g9T3T3eo+nW5G+bG9jw2h
         RmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=QrQ7+ib6Ph5JrDrptaoX41E6MZEWipo8dXs9ekABYyI=;
        fh=4Dgx8jc1gJCFDIGNl8iT3gucG+cuHYR9XmJ7yDXtNzA=;
        b=YHCVJLC+J5HzIJwhHxdBbBGFrUH1QKDSHVYRYb1oLWRFVhf9QADoK3u+GIz1EEseiE
         Att7vJdZNpbX9QHJ/FpHR9xtnFsxVphJ4AgV44uH9wNcdW8aczSTaWjk+/tZ29K9PaEx
         tTKxk1qE3U5rPRNuBVsz6xzPvsyYirmXR7R+f+L4iP/1Vt7G5JoiHxpysQ9wswVmAYU9
         40blgteQLzwXfPdGFk9OZwTmjqQOYmyxYqmO33ZSrlySGRJoBmjFJ4KH8ay8yrEoNHHQ
         n8smp/WBMLtvmPuarzkBGYBU+KBPLaix33RC06KDXE6Dgip/OsywEbC69SlTthfaKtwG
         FShQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-430ccf5e062si2802265e9.98.2024.10.08.20.38.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2024 20:38:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XNdrK1XBmz6K9Gg;
	Wed,  9 Oct 2024 11:37:53 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
	by mail.maildlp.com (Postfix) with ESMTPS id DBEDE140B3C;
	Wed,  9 Oct 2024 11:38:09 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.173.89) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 05:37:50 +0200
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
Subject: [PATCH RFC V4 31/33] target/arm/kvm: Write vCPU's state back to KVM on cold-reset
Date: Wed, 9 Oct 2024 04:37:02 +0100
Message-ID: <20241009033704.250287-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009033704.250287-1-salil.mehta@huawei.com>
References: <20241009031815.250096-1-salil.mehta@huawei.com>
 <20241009033704.250287-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.173.89]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 frapeml500007.china.huawei.com (7.182.85.172)
X-TUID: zR43uuZVqODt

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Previously, all `PSCI_CPU_{ON, OFF}` calls were handled directly by KVM.
However, with the introduction of vCPU hotplug, these hypervisor calls are now
trapped to QEMU for policy checks. This shift can lead to inconsistent vCPU
states between KVM and QEMU, particularly when the vCPU has been recently
plugged in and is transitioning from the unparked state in QOM. Therefore, it is
crucial to synchronize the vCPU state with KVM, especially in the context of a
cold reset of the QOM vCPU.

To ensure this synchronization, mark the QOM vCPU as "dirty" to trigger a call
to `kvm_arch_put_registers()`. This guarantees that KVM’s `MP_STATE` is updated
accordingly, forcing synchronization of the `mp_state` between QEMU and KVM.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 target/arm/kvm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 9a51249a42..a3c98fa213 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1038,6 +1038,7 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu)
 void kvm_arm_reset_vcpu(ARMCPU *cpu)
 {
     int ret;
+    CPUState *cs = CPU(cpu);
 
     /* Re-init VCPU so that all registers are set to
      * their respective reset values.
@@ -1059,6 +1060,12 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
      * for the same reason we do so in kvm_arch_get_registers().
      */
     write_list_to_cpustate(cpu);
+
+    /*
+     * Ensure we call kvm_arch_put_registers(). The vCPU isn't marked dirty if
+     * it was parked in KVM and is now booting from a PSCI CPU_ON call.
+     */
+    cs->vcpu_dirty = true;
 }
 
 void kvm_arm_create_host_vcpu(ARMCPU *cpu)
-- 
2.34.1
