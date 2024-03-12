Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp1552993ejc;
        Mon, 11 Mar 2024 19:01:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXF6mhV1lGA9iAWMNLfrRMfiwJi7K4LASRUILkh7jwZwsaL2tUXzs5ijL1fmSNKu8o5Z0CF0y/Sj/VRfvaNbKJsByOUMyRa
X-Google-Smtp-Source: AGHT+IEpBVbFboOi3839XozuPGXHs9V2DiRdcHLw+VRDzeIqMrpccVF0PZWA7wZEITBbhQuTpyxH
X-Received: by 2002:adf:8b14:0:b0:33e:7a1e:d603 with SMTP id n20-20020adf8b14000000b0033e7a1ed603mr5309617wra.20.1710208862513;
        Mon, 11 Mar 2024 19:01:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710208862; cv=none;
        d=google.com; s=arc-20160816;
        b=woy3VCgdltwOvTTr9kzHImWhHPZiysFGbqKsdHzYVbjlNik4kR4VHURxeCmR4+CiO4
         LQXr3dib4m1Cpiy7F6xyKbMIyEMSSECIQIXIi1HgXwaYde8qVd6TyNY9tBkLn9twHDQ7
         7NkAFJk3ft3/VpmEf3bjmw9xTtCyHvRNQ9iC3znecC9hRCoqKjmC3xhIVfpEqmsSRBv+
         WBYQ+7kHCak0rG7RyEAuhbiALNjwPkCjspHPRM8mcT/9ohZVNVIHLss+F9T0KgZcmHNp
         FGPu5TIS1f/ZWmPlgH+F6aimeuNiwFgqFyKWAiMazqVlWPS1TelJVrQ2r7tyGeoa712x
         WpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=kpXOUytV02CDxh8ESZVmYB8j1uKM/Kp1smegpCM9ZxY=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=FVL6eqpeXYzGSNSFcqplO8QHRIMVZ0mDUEPIxC0r3ATPMkfAOZz6FK9OGS4b6RJJwk
         /tFOqSuyLKTbOpTn0epp+jOSa/vivrm/u/optZNWWakSnuyR97bAMonXthtSnJHURiSa
         MmX7cBIq4JLL4auku9w3DbXD+0dFjqb13Bm5qRhwWJTPNwQvwrNosXTqx0+NBT85ch4R
         AwKJRjsIOS7abcAxRKUWnzZiobeoBray3q8f82vznTANij+uo6x1TyaxwncGFkSNV9xr
         E2T9j0+zMQ3WolFA5pgl/dhj1bRcodTYLEFQ8jBRuOtuBuk9TsLS4TxZ6iy0PY/lAkZT
         TYYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id q16-20020adffed0000000b0033e69ab9cf4si3297505wrs.401.2024.03.11.19.01.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2024 19:01:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TtxbD5gKxz6K9Pw;
	Tue, 12 Mar 2024 09:56:56 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id 91C18140B3C;
	Tue, 12 Mar 2024 10:01:01 +0800 (CST)
Received: from A190218597.china.huawei.com (10.48.148.5) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 02:00:41 +0000
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
Subject: [PATCH V8 1/8] accel/kvm: Extract common KVM vCPU {creation,parking} code
Date: Tue, 12 Mar 2024 01:59:53 +0000
Message-ID: <20240312020000.12992-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20240312020000.12992-1-salil.mehta@huawei.com>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.48.148.5]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: vAKkcP9BuYz0

KVM vCPU creation is done once during the vCPU realization when Qemu vCPU thread
is spawned. This is common to all the architectures as of now.

Hot-unplug of vCPU results in destruction of the vCPU object in QOM but the
corresponding KVM vCPU object in the Host KVM is not destroyed as KVM doesn't
support vCPU removal. Therefore, its representative KVM vCPU object/context in
Qemu is parked.

Refactor architecture common logic so that some APIs could be reused by vCPU
Hotplug code of some architectures likes ARM, Loongson etc. Update new/old APIs
with trace events instead of DPRINTF. No functional change is intended here.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Tested-by: Xianglai Li <lixianglai@loongson.cn>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 accel/kvm/kvm-all.c    | 64 ++++++++++++++++++++++++++++++++----------
 accel/kvm/trace-events |  5 +++-
 include/sysemu/kvm.h   | 16 +++++++++++
 3 files changed, 69 insertions(+), 16 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index a8cecd040e..3bc3207bda 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -126,6 +126,7 @@ static QemuMutex kml_slots_lock;
 #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
 
 static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
+static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id);
 
 static inline void kvm_resample_fd_remove(int gsi)
 {
@@ -314,14 +315,53 @@ err:
     return ret;
 }
 
+void kvm_park_vcpu(CPUState *cpu)
+{
+    struct KVMParkedVcpu *vcpu;
+
+    trace_kvm_park_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
+
+    vcpu = g_malloc0(sizeof(*vcpu));
+    vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
+    vcpu->kvm_fd = cpu->kvm_fd;
+    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
+}
+
+int kvm_create_vcpu(CPUState *cpu)
+{
+    unsigned long vcpu_id = kvm_arch_vcpu_id(cpu);
+    KVMState *s = kvm_state;
+    int kvm_fd;
+
+    trace_kvm_create_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
+
+    /* check if the KVM vCPU already exist but is parked */
+    kvm_fd = kvm_get_vcpu(s, vcpu_id);
+    if (kvm_fd < 0) {
+        /* vCPU not parked: create a new KVM vCPU */
+        kvm_fd = kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
+        if (kvm_fd < 0) {
+            error_report("KVM_CREATE_VCPU IOCTL failed for vCPU %lu", vcpu_id);
+            return kvm_fd;
+        }
+    }
+
+    cpu->kvm_fd = kvm_fd;
+    cpu->kvm_state = s;
+    cpu->vcpu_dirty = true;
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
 
-    trace_kvm_destroy_vcpu();
+    trace_kvm_destroy_vcpu(cpu->cpu_index, kvm_arch_vcpu_id(cpu));
 
     ret = kvm_arch_destroy_vcpu(cpu);
     if (ret < 0) {
@@ -347,10 +387,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
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
@@ -371,6 +408,8 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
         if (cpu->vcpu_id == vcpu_id) {
             int kvm_fd;
 
+            trace_kvm_get_vcpu(vcpu_id);
+
             QLIST_REMOVE(cpu, node);
             kvm_fd = cpu->kvm_fd;
             g_free(cpu);
@@ -378,7 +417,7 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
         }
     }
 
-    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
+    return -ENOENT;
 }
 
 int kvm_init_vcpu(CPUState *cpu, Error **errp)
@@ -389,19 +428,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
 
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
diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
index a25902597b..5558cff0dc 100644
--- a/accel/kvm/trace-events
+++ b/accel/kvm/trace-events
@@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) "dev fd %d, type 0x%x, arg %p"
 kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to retrieve ONEREG %" PRIu64 " from KVM: %s"
 kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to set ONEREG %" PRIu64 " to KVM: %s"
 kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
+kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
+kvm_get_vcpu(unsigned long arch_cpu_id) "id: %lu"
+kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
+kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
 kvm_irqchip_commit_routes(void) ""
 kvm_irqchip_add_msi_route(char *name, int vector, int virq) "dev %s vector %d virq %d"
 kvm_irqchip_update_msi_route(int virq) "Updating MSI route virq=%d"
@@ -25,7 +29,6 @@ kvm_dirty_ring_reaper(const char *s) "%s"
 kvm_dirty_ring_reap(uint64_t count, int64_t t) "reaped %"PRIu64" pages (took %"PRIi64" us)"
 kvm_dirty_ring_reaper_kick(const char *reason) "%s"
 kvm_dirty_ring_flush(int finished) "%d"
-kvm_destroy_vcpu(void) ""
 kvm_failed_get_vcpu_mmap_size(void) ""
 kvm_cpu_exec(void) ""
 kvm_interrupt_exit_request(void) ""
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index fad9a7e8ff..2ed928aa71 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -435,6 +435,22 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
 int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
                                        hwaddr *phys_addr);
 
+/**
+ * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU
+ * @cpu: QOM CPUState object for which KVM vCPU has to be fetched/created.
+ *
+ * @returns: 0 when success, errno (<0) when failed.
+ */
+int kvm_create_vcpu(CPUState *cpu);
+
+/**
+ * kvm_park_vcpu - Park QEMU KVM vCPU context
+ * @cpu: QOM CPUState object for which QEMU KVM vCPU context has to be parked.
+ *
+ * @returns: none
+ */
+void kvm_park_vcpu(CPUState *cpu);
+
 #endif /* NEED_CPU_H */
 
 void kvm_cpu_synchronize_state(CPUState *cpu);
-- 
2.34.1
