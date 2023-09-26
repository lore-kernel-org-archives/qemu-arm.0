Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp980453ejc;
        Tue, 26 Sep 2023 03:07:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKBpkNqxOkYRyWDqZlv1gHZE1oSPAmF5xeU8LlKAjhcO5cjlxorxWHpM2cWr0PfoXrqGED
X-Received: by 2002:adf:9bde:0:b0:323:264d:9cef with SMTP id e30-20020adf9bde000000b00323264d9cefmr4807031wrc.12.1695722821604;
        Tue, 26 Sep 2023 03:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695722821; cv=none;
        d=google.com; s=arc-20160816;
        b=dV8hVcp0FscQuceJK8znmqfPePZ+n06Lz+Z1KMdZAQo+QRJP7Ezr/q4jCkg2I6Rxq6
         92k9Ja7ShB+CL1O9pnT/2U8JgMd2PpctKPN1oYLA+UDiZ2/yOYXoBhGOxi0heITw4VMw
         wHGjRkojcqAeq24n5Ukxq9SVlSqvudGnayZo9zj/AjtLmoVyohdAQkoZy7q7ascA+y0z
         C4CtkNX8Lt3W2AkoXuRfDaEwyG8LYQIEdHfqwjbYYaJsmfJPPqEasUx/c2Tj7QJk9VVF
         SNy8aa5OFsbBlCv7ZcaaKPwUVItntpcxnoGsQ7avHu537/B2qRReYlosXt1ysOwJXOaO
         E1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ig7zoPRYOufpS1BK7QMjM1XOkg44Aw1O0THriug+3d8=;
        fh=S0+uYiUekNlY+vd8jPZbTHxsQBwDC5l2YHnO2B7ftdQ=;
        b=h584aecTX6P62+oUWxrLY2N2CTS4Xuf8MvYTsp+tL4wBYk4pCIitY9Cao5Mq2JfSMv
         4HQTrEBxoeSxQG3u/W6fdq+F5Ue3A+/4NhThSVgDjWR2xYawrOCqCQ/4VnQoOBAC2fOr
         dEvHkWx8RbHLskbVMewcCSRQIoC3/qZFC6Kwm5dpBxx+cEzblp4E+v29wjBYKGnuKYNk
         /kmSZsRT9TPqnb4lcmevAgPo1wwABdMFJl71W2ZtDEeHFi2ovnvJrklShm0UCa6Rt9+X
         wTR64Ud5WrrAm/QgOkM1zUS0UfmVPwqWTm483enL2ZL7dK2L5CafBqydIEseXgi2A9t7
         w8IA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id y6-20020adfee06000000b0031c5c8fbc89si5799100wrn.1002.2023.09.26.03.07.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 03:07:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvwNp2tLnz6K8sk;
	Tue, 26 Sep 2023 18:05:46 +0800 (CST)
Received: from A190218597.china.huawei.com (10.126.174.16) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 26 Sep 2023 11:06:42 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <salil.mehta@huawei.com>, <maz@kernel.org>, <jean-philippe@linaro.org>,
	<jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <will@kernel.org>,
	<ardb@kernel.org>, <oliver.upton@linux.dev>, <pbonzini@redhat.com>,
	<mst@redhat.com>, <gshan@redhat.com>, <rafael@kernel.org>,
	<borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>
Subject: [PATCH RFC V2 05/37] accel/kvm: Extract common KVM vCPU {creation,parking} code
Date: Tue, 26 Sep 2023 11:04:04 +0100
Message-ID: <20230926100436.28284-6-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230926100436.28284-1-salil.mehta@huawei.com>
References: <20230926100436.28284-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.174.16]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: ot3VmYG/S/bm

KVM vCPU creation is done once during the initialization of the VM when Qemu
threads are spawned. This is common to all the architectures. If the architecture
supports vCPU hot-{un}plug then this KVM vCPU creation could be deferred to
later point as well. Some architectures might in any case create KVM vCPUs for
the yet-to-be plugged vCPUs (i.e. QoM Object & thread does not exists) during VM
init time and park them.

Hot-unplug of vCPU results in destruction of the vCPU objects in QOM but
the KVM vCPU objects in the Host KVM are not destroyed and their representative
KVM vCPU objects in Qemu are parked.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 accel/kvm/kvm-all.c  | 61 ++++++++++++++++++++++++++++++++++----------
 include/sysemu/kvm.h |  2 ++
 2 files changed, 49 insertions(+), 14 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 7b3da8dc3a..86e9c9ea60 100644
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
+    /* create a new KVM vcpu */
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
index 115f0cca79..2c34889b01 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -473,6 +473,8 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
 
 int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
                                        hwaddr *phys_addr);
+int kvm_create_vcpu(CPUState *cpu);
+void kvm_park_vcpu(CPUState *cpu);
 
 #endif /* NEED_CPU_H */
 
-- 
2.34.1
