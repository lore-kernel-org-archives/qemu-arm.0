Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp1457482nji;
        Sat, 13 Jul 2024 11:26:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXFeifZ8sASfpbLZ64fTRtccwowjV/aB8yXPLCX5jERNxq/ccLnnzxre+9h3cRVzND3raZ9VwbaG53eS6xxVoGT7YgwFosW
X-Google-Smtp-Source: AGHT+IF6e2QlEGc2r00lzdQRx1+P0ZkWwFDf6XoeD8fkHCGbflS/pOgVE+/EvPBjXUtjJ8dMmLsL
X-Received: by 2002:a17:902:f68b:b0:1fb:6473:e91f with SMTP id d9443c01a7336-1fbb6d5b551mr135880245ad.40.1720895178360;
        Sat, 13 Jul 2024 11:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720895178; cv=none;
        d=google.com; s=arc-20160816;
        b=EWM0sW7KkV2JB9h00G+HstQCwKHOq1WKCFgPlr63j01RrQH6OopG2y9F7jg3crsjDA
         +YfNx2Xicb8b7kDOpISQMSLHlhq422Z0i55do+gioDxLWmtSuN13tvU3yCuj4awEcQdg
         UNvIuVh5dpIEbi2kJNWiC+nx9mIkbYaixZ+e7T5WADdOL0T2F0snIXuCctcujiBU9+GX
         BRr3yIvEVaqTmKH9iDKW8fWllCIh4AvroQCaekBavrJKhvZXRkVMGppcF+2skNqMmiCc
         f0Dvwdn94cogGS8Yq0e1CKoMicBws2+MLzFt4WmAzBcxoOxM0bIolaGVViYWRl9XK3XZ
         Do6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=nhp3l3v5ZAJGRHq4TmWETR2fUJ3iJf1kqynaCriv57U=;
        fh=Xo8/EPNwP7EUrVyhHTVtanAqhhO+2buLSCvWDhoNF5E=;
        b=r57jJppln33IwLRx6sBFulZVmenBn8RhHaiSdOzfu9uX1tM2IEyTbVXuZEmDmfk1nd
         Uxtj+6nwPdT0Iy3dbFt6VCb0HYSYuuKBl95ZOVDolruVC8oQwdb272tmX1pa9mEv703l
         4Qx+aZsReUgVRCX7YL5wGykNzUHr1sjgiwuK0Z/XZ+FOOJK/6saKAAHA1b6/PH704/+F
         WOcI6a2J9It6wr0HnvR7K2epRgqw/EnN8229YWRc3ObThGgQaGPwm1jrzGz4klvTcx12
         12Szo+LGNJTLKuBdtTnTFDfznO/ri05MeLSYE73Usx7rIFc4gCoZ3zVcEK82HBXI9Lzx
         tTZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-1fc0bc90f30si15624465ad.299.2024.07.13.11.26.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2024 11:26:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WLxgS00NKz6K6j4;
	Sun, 14 Jul 2024 02:24:03 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (unknown [7.191.163.213])
	by mail.maildlp.com (Postfix) with ESMTPS id B40D1140A78;
	Sun, 14 Jul 2024 02:26:12 +0800 (CST)
Received: from 00293818-MRGF.huawei.com (10.126.172.138) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 13 Jul 2024 19:25:54 +0100
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
	<npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linuxarm@huawei.com>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Shaoqin Huang <shahuang@redhat.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH V15 1/7] accel/kvm: Extract common KVM vCPU {creation,parking} code
Date: Sat, 13 Jul 2024 19:25:10 +0100
Message-ID: <20240713182516.1457-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240713182516.1457-1-salil.mehta@huawei.com>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.172.138]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-TUID: 8u5vp2oo38eZ

KVM vCPU creation is done once during the vCPU realization when Qemu vCPU thread
is spawned. This is common to all the architectures as of now.

Hot-unplug of vCPU results in destruction of the vCPU object in QOM but the
corresponding KVM vCPU object in the Host KVM is not destroyed as KVM doesn't
support vCPU removal. Therefore, its representative KVM vCPU object/context in
Qemu is parked.

Refactor architecture common logic so that some APIs could be reused by vCPU
Hotplug code of some architectures likes ARM, Loongson etc. Update new/old APIs
with trace events. New APIs qemu_{create,park,unpark}_vcpu() can be externally
called. No functional change is intended here.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Tested-by: Xianglai Li <lixianglai@loongson.cn>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Reviewed-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Tested-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
---
 accel/kvm/kvm-all.c    | 95 ++++++++++++++++++++++++++++--------------
 accel/kvm/kvm-cpus.h   |  1 -
 accel/kvm/trace-events |  5 ++-
 include/sysemu/kvm.h   | 25 +++++++++++
 4 files changed, 92 insertions(+), 34 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 2b4ab89679..e446d18944 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -340,14 +340,71 @@ err:
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
+int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id)
+{
+    struct KVMParkedVcpu *cpu;
+    int kvm_fd = -ENOENT;
+
+    QLIST_FOREACH(cpu, &s->kvm_parked_vcpus, node) {
+        if (cpu->vcpu_id == vcpu_id) {
+            QLIST_REMOVE(cpu, node);
+            kvm_fd = cpu->kvm_fd;
+            g_free(cpu);
+        }
+    }
+
+    trace_kvm_unpark_vcpu(vcpu_id, kvm_fd > 0 ? "unparked" : "not found parked");
+
+    return kvm_fd;
+}
+
+int kvm_create_vcpu(CPUState *cpu)
+{
+    unsigned long vcpu_id = kvm_arch_vcpu_id(cpu);
+    KVMState *s = kvm_state;
+    int kvm_fd;
+
+    /* check if the KVM vCPU already exist but is parked */
+    kvm_fd = kvm_unpark_vcpu(s, vcpu_id);
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
+    trace_kvm_create_vcpu(cpu->cpu_index, vcpu_id, kvm_fd);
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
@@ -373,10 +430,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
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
@@ -389,24 +443,6 @@ void kvm_destroy_vcpu(CPUState *cpu)
     }
 }
 
-static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
-{
-    struct KVMParkedVcpu *cpu;
-
-    QLIST_FOREACH(cpu, &s->kvm_parked_vcpus, node) {
-        if (cpu->vcpu_id == vcpu_id) {
-            int kvm_fd;
-
-            QLIST_REMOVE(cpu, node);
-            kvm_fd = cpu->kvm_fd;
-            g_free(cpu);
-            return kvm_fd;
-        }
-    }
-
-    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
-}
-
 int kvm_init_vcpu(CPUState *cpu, Error **errp)
 {
     KVMState *s = kvm_state;
@@ -415,19 +451,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
 
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
diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
index ca40add32c..171b22fd29 100644
--- a/accel/kvm/kvm-cpus.h
+++ b/accel/kvm/kvm-cpus.h
@@ -22,5 +22,4 @@ bool kvm_supports_guest_debug(void);
 int kvm_insert_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len);
 int kvm_remove_breakpoint(CPUState *cpu, int type, vaddr addr, vaddr len);
 void kvm_remove_all_breakpoints(CPUState *cpu);
-
 #endif /* KVM_CPUS_H */
diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
index 681ccb667d..37626c1ac5 100644
--- a/accel/kvm/trace-events
+++ b/accel/kvm/trace-events
@@ -9,6 +9,10 @@ kvm_device_ioctl(int fd, int type, void *arg) "dev fd %d, type 0x%x, arg %p"
 kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to retrieve ONEREG %" PRIu64 " from KVM: %s"
 kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to set ONEREG %" PRIu64 " to KVM: %s"
 kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
+kvm_create_vcpu(int cpu_index, unsigned long arch_cpu_id, int kvm_fd) "index: %d, id: %lu, kvm fd: %d"
+kvm_destroy_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
+kvm_park_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
+kvm_unpark_vcpu(unsigned long arch_cpu_id, const char *msg) "id: %lu %s"
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
index c31d9c7356..c4a914b3d8 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -313,6 +313,31 @@ int kvm_create_device(KVMState *s, uint64_t type, bool test);
  */
 bool kvm_device_supported(int vmfd, uint64_t type);
 
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
+/**
+ * kvm_unpark_vcpu - unpark QEMU KVM vCPU context
+ * @s: KVM State
+ * @vcpu_id: Architecture vCPU ID of the parked vCPU
+ *
+ * @returns: KVM fd
+ */
+int kvm_unpark_vcpu(KVMState *s, unsigned long vcpu_id);
+
 /* Arch specific hooks */
 
 extern const KVMCapabilityInfo kvm_arch_required_capabilities[];
-- 
2.34.1
