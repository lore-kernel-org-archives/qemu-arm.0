Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp3221086ejc;
        Fri, 29 Sep 2023 05:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoW0jBoVBrhger2gCmzyuxN+ZePuSvu8B34btCU73QRvTmTTvlGJc3UlIuztspoobWxb4u
X-Received: by 2002:adf:f302:0:b0:320:b2a:4ea6 with SMTP id i2-20020adff302000000b003200b2a4ea6mr4128679wro.9.1695991495966;
        Fri, 29 Sep 2023 05:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695991495; cv=none;
        d=google.com; s=arc-20160816;
        b=rwGBzl192iHzTd2L1PQqxXqXx0RuH/PApg2sJUwLYGDvz60tNjvoN58z0kUNX4maf/
         8f+ZIdRGt3GD3K8pTlNFaGVf8S86PCzeH1GKaA2o0fnMi3FRsh5rIL87trAmtmPv8jH8
         xZO1KILJxeShfyZTeIerP8GASWunuy8yIrAPE5vbDuemy6zQUm3R5Yi2GB4w36D2MZhh
         n5gTIJZUO+CbystzPdYwqKsM1h8fc2C6F6yQmcMODlQpa1o1k1pvIlh1F3Qw50mKoKKd
         n9C1+RogaTEioVtgZ3YCWnXxUkAajzxYV2JHaiBAtMNmNcISBWkUqGBs1ZwkGgMzdT7m
         7cLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=2QebfKURkRUOfWn5D8AEdqf/N4S6TKOkxIGf3i6YfCE=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=VbxC9/RXiFzgHQwjrJfUx1ZoM5ObTc0WkBl5S6RVwo+YrJpsc6y5vzYf/sXzZMoanl
         I5i0f2GeTUpaANTDvD3Yp/iwj3V4E6N9wGzWyAiusRm1NLGVgn53qGZ91ZUZA0BXJi2t
         cRARKIct8JyX4YLFIYQdpbO9IsGCqfC5lkHJNq3xELB+ds+JHCZ546ecpBa4qRofX6PV
         09DDqM+e35UOsa2JSvgMnl4LeV1czNB7Jtm9DqNsHxwJPZjmF8n+qqYaFtgImf1f7hRl
         r0WKHj/S1l5eFquKphmFdm4MkqGczjl1QdjGS6jyPoPUr3tQwEeJjYEE7Nty/iFB1IQI
         Q9Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id w2-20020a5d4b42000000b0031ffb4c83d0si4467318wrs.422.2023.09.29.05.44.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 05:44:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rxqk86HwXz67hmj;
	Fri, 29 Sep 2023 20:42:24 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.156.153) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 29 Sep 2023 13:44:34 +0100
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
Subject: [PATCH 1/9] accel/kvm: Extract common KVM vCPU {creation,parking} code
Date: Fri, 29 Sep 2023 13:42:56 +0100
Message-ID: <20230929124304.13672-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230929124304.13672-1-salil.mehta@huawei.com>
References: <20230929124304.13672-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.156.153]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: nD4hHuEKK9xW

KVM vCPU creation is done once during the initialization of the VM when Qemu
threads are spawned. This is common to all the architectures.

Hot-unplug of vCPU results in destruction of the vCPU objects in QOM but
the KVM vCPU objects in the Host KVM are not destroyed and their representative
KVM vCPU objects/context in Qemu are parked.

Refactor common logic so that some APIs could be reused by vCPU Hotplug code.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 accel/kvm/kvm-all.c  | 61 ++++++++++++++++++++++++++++++++++----------
 include/sysemu/kvm.h |  2 ++
 2 files changed, 49 insertions(+), 14 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ff1578bb32..57889c5f6c 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -137,6 +137,7 @@ static QemuMutex kml_slots_lock;
 #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
 
 static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
+static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id);
 
 static inline void kvm_resample_fd_remove(int gsi)
 {
@@ -320,11 +321,51 @@ err:
     return ret;
 }
 
+void kvm_park_vcpu(CPUState *cpu)
+{
+    unsigned long vcpu_id = cpu->cpu_index;
+    struct KVMParkedVcpu *vcpu;
+
+    vcpu = g_malloc0(sizeof(*vcpu));
+    vcpu->vcpu_id = vcpu_id;
+    vcpu->kvm_fd = cpu->kvm_fd;
+    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
+}
+
+int kvm_create_vcpu(CPUState *cpu)
+{
+    unsigned long vcpu_id = cpu->cpu_index;
+    KVMState *s = kvm_state;
+    int ret;
+
+    DPRINTF("kvm_create_vcpu\n");
+
+    /* check if the KVM vCPU already exist but is parked */
+    ret = kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
+    if (ret > 0) {
+        goto found;
+    }
+
+    /* create a new KVM vCPU */
+    ret = kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
+    if (ret < 0) {
+        return ret;
+    }
+
+found:
+    cpu->vcpu_dirty = true;
+    cpu->kvm_fd = ret;
+    cpu->kvm_state = s;
+    cpu->dirty_pages = 0;
+    cpu->throttle_us_per_full = 0;
+
+    return 0;
+}
+
 static int do_kvm_destroy_vcpu(CPUState *cpu)
 {
     KVMState *s = kvm_state;
     long mmap_size;
-    struct KVMParkedVcpu *vcpu = NULL;
     int ret = 0;
 
     DPRINTF("kvm_destroy_vcpu\n");
@@ -353,10 +394,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
         }
     }
 
-    vcpu = g_malloc0(sizeof(*vcpu));
-    vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
-    vcpu->kvm_fd = cpu->kvm_fd;
-    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
+    kvm_park_vcpu(cpu);
 err:
     return ret;
 }
@@ -384,7 +422,7 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
         }
     }
 
-    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
+    return -1;
 }
 
 int kvm_init_vcpu(CPUState *cpu, Error **errp)
@@ -395,19 +433,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
 
     trace_kvm_init_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
 
-    ret = kvm_get_vcpu(s, kvm_arch_vcpu_id(cpu));
+    ret = kvm_create_vcpu(cpu);
     if (ret < 0) {
-        error_setg_errno(errp, -ret, "kvm_init_vcpu: kvm_get_vcpu failed (%lu)",
+        error_setg_errno(errp, -ret,
+                         "kvm_init_vcpu: kvm_create_vcpu failed (%lu)",
                          kvm_arch_vcpu_id(cpu));
         goto err;
     }
 
-    cpu->kvm_fd = ret;
-    cpu->kvm_state = s;
-    cpu->vcpu_dirty = true;
-    cpu->dirty_pages = 0;
-    cpu->throttle_us_per_full = 0;
-
     mmap_size = kvm_ioctl(s, KVM_GET_VCPU_MMAP_SIZE, 0);
     if (mmap_size < 0) {
         ret = mmap_size;
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index ee9025f8e9..17919567a8 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -464,6 +464,8 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
 
 int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
                                        hwaddr *phys_addr);
+int kvm_create_vcpu(CPUState *cpu);
+void kvm_park_vcpu(CPUState *cpu);
 
 #endif /* NEED_CPU_H */
 
-- 
2.34.1
