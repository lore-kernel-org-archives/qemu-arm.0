Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1637ejb;
        Fri, 29 Sep 2023 17:20:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1UfN2ca1FFYCstaYJP/aDF+tKrvqUHL5DkneJvI+qUI+gI5SJHWbxBD+9oiROnBknLN9Q
X-Received: by 2002:a5d:4a05:0:b0:323:1f49:de96 with SMTP id m5-20020a5d4a05000000b003231f49de96mr5105552wrq.49.1696033228454;
        Fri, 29 Sep 2023 17:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696033228; cv=none;
        d=google.com; s=arc-20160816;
        b=FhXlhv/H4VEjJZWdSrZ+Q4dGfJYQl3mze3UyZkTsXy3GLEsTiqIVzxRdKMBu6HkpfS
         SvGfjsD9RS3RVVCLT8appFRDB+PFMOGPFpOiqZvcEfqTNrLj7IsZy0hda6JcNMcz8uYK
         slilJwiuUGX0bJgdL0Fsc016e0O9EFyPIVOi36smjzYz4OKPU7+q7kHcS7jGkxIIn3Vk
         5OaALiXh7irPZdUzpz2Ee0ww9Wf3DGt+U9+XNvLiDgZ8uTqzJlO2HKQR8siMZPA2xgf7
         npo9MsOh4z2zzaW7inuUpeFPRctJ9jEq1D+tOFh50PNmuiNYDPcGsXmYrkg824dP7ByP
         WjLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ekv9/mhCNUy0S1lSDsI9RwgNt6VGQAyDqH08N9ADk1s=;
        fh=I+6CS2uJqPEgP3gz8gmk6tLbm1jsmO9tblK+QTjWHxs=;
        b=nsyrw/Rs7tO/PJN8NdzlWpVrKA4quccGUuhD9zlsrFS3/VROYmEsx4w+y8rumvI9cM
         NPNQjJYg6TO5bumx5WFv705hvnNS0gij3l6K8D5jLU5Cd/A559GM/xCuhDRQ5G2ansNq
         mDmJsUtwrMAYwn4ahXnKXR/OBDuYnb9Ga3kgKZ3dY4Add2wMSkFd/cEj2q7xyDssbPxQ
         Pb5N3L3h3dGpqZKGKVS9MNTlsiQ4btkFsPoadsdB01e+p0EzozPBb8D4ESNTTsn3A7pK
         sOQ9u+HNiCEIVe6uGLVjgLcNbXyvGTHZ3JkE13MJXvdrk4emupUi5JdcMVSNmhpe4dBR
         yOVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id z14-20020adfec8e000000b003251303356asi1630699wrn.185.2023.09.29.17.20.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 17:20:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ry78j1MLGz6HJTn;
	Sat, 30 Sep 2023 08:17:57 +0800 (CST)
Received: from A190218597.china.huawei.com (10.195.35.96) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 30 Sep 2023 01:20:07 +0100
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
Subject: [PATCH V2 01/10] accel/kvm: Extract common KVM vCPU {creation,parking} code
Date: Sat, 30 Sep 2023 01:19:24 +0100
Message-ID: <20230930001933.2660-2-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20230930001933.2660-1-salil.mehta@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.195.35.96]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 lhrpeml500001.china.huawei.com (7.191.163.213)
X-CFilter-Loop: Reflected
X-TUID: lVOfaty44acc

KVM vCPU creation is done once during the initialization of the VM when Qemu
threads are spawned. This is common to all the architectures.

Hot-unplug of vCPU results in destruction of the vCPU objects in QOM but
the KVM vCPU objects in the Host KVM are not destroyed and their representative
KVM vCPU objects/context in Qemu are parked.

Refactor common logic so that some APIs could be reused by vCPU Hotplug code.

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 accel/kvm/kvm-all.c  | 63 +++++++++++++++++++++++++++++++++-----------
 include/sysemu/kvm.h | 14 ++++++++++
 2 files changed, 61 insertions(+), 16 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ff1578bb32..b8c36ba50a 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -80,7 +80,7 @@
 #endif
 
 struct KVMParkedVcpu {
-    unsigned long vcpu_id;
+    int vcpu_id;
     int kvm_fd;
     QLIST_ENTRY(KVMParkedVcpu) node;
 };
@@ -137,6 +137,7 @@ static QemuMutex kml_slots_lock;
 #define kvm_slots_unlock()  qemu_mutex_unlock(&kml_slots_lock)
 
 static void kvm_slot_init_dirty_bitmap(KVMSlot *mem);
+static int kvm_get_vcpu(KVMState *s, int vcpu_id);
 
 static inline void kvm_resample_fd_remove(int gsi)
 {
@@ -320,11 +321,49 @@ err:
     return ret;
 }
 
+void kvm_park_vcpu(CPUState *cpu)
+{
+    int vcpu_id = cpu->cpu_index;
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
+    int vcpu_id = cpu->cpu_index;
+    KVMState *s = kvm_state;
+    int kvm_fd;
+
+    DPRINTF("kvm_create_vcpu\n");
+
+    /* check if the KVM vCPU already exist but is parked */
+    kvm_fd = kvm_get_vcpu(s, vcpu_id);
+    if (kvm_fd < 0) {
+        /* vCPU not parked: create a new KVM vCPU */
+        kvm_fd = kvm_vm_ioctl(s, KVM_CREATE_VCPU, vcpu_id);
+        if (kvm_fd < 0) {
+            error_report("KVM_CREATE_VCPU IOCTL failed for vCPU %d", vcpu_id);
+            return kvm_fd;
+        }
+    }
+
+    cpu->vcpu_dirty = true;
+    cpu->kvm_fd = kvm_fd;
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
@@ -353,10 +392,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
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
@@ -369,7 +405,7 @@ void kvm_destroy_vcpu(CPUState *cpu)
     }
 }
 
-static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
+static int kvm_get_vcpu(KVMState *s, int vcpu_id)
 {
     struct KVMParkedVcpu *cpu;
 
@@ -384,7 +420,7 @@ static int kvm_get_vcpu(KVMState *s, unsigned long vcpu_id)
         }
     }
 
-    return kvm_vm_ioctl(s, KVM_CREATE_VCPU, (void *)vcpu_id);
+    return -1;
 }
 
 int kvm_init_vcpu(CPUState *cpu, Error **errp)
@@ -395,19 +431,14 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
 
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
index ee9025f8e9..785f3ed083 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -464,6 +464,20 @@ void kvm_set_sigmask_len(KVMState *s, unsigned int sigmask_len);
 
 int kvm_physical_memory_addr_from_host(KVMState *s, void *ram_addr,
                                        hwaddr *phys_addr);
+/**
+ * kvm_create_vcpu - Gets a parked KVM vCPU or creates a KVM vCPU
+ * @cpu:  QOM CPUState object for which KVM vCPU has to be created/fetched.
+ *
+ * @returns: 0 when success, errno (<0) when failed.
+ */
+int kvm_create_vcpu(CPUState *cpu);
+/**
+ * kvm_park_vcpu - Gets a parked KVM vCPU if it exists
+ * @cpu:  QOM CPUState object for which parked KVM vCPU has to be fetched.
+ *
+ * @returns: kvm_fd (>0) when success, -1 when failed.
+ */
+void kvm_park_vcpu(CPUState *cpu);
 
 #endif /* NEED_CPU_H */
 
-- 
2.34.1
