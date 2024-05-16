Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1410087ejl;
        Thu, 16 May 2024 07:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXkw5NJCWICTInuVyDDyr1FtRsYDbA28S2SA2b26yVOegrYsrno4TZGIBS7lvrYQ7a0RvXFFxa8g5FhNk+zEQGrX60U6AVh
X-Google-Smtp-Source: AGHT+IGpp7RP2pBLsj9pafM2pIrfO281akr3dX+n+tkP3jRLH5lZeGV6dw2kZlB5Ry6w4hJNxu3u
X-Received: by 2002:a05:6e02:1905:b0:36c:7eb2:50d7 with SMTP id e9e14a558f8ab-36cc14a72c1mr235641445ab.14.1715870094252;
        Thu, 16 May 2024 07:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715870094; cv=none;
        d=google.com; s=arc-20160816;
        b=M7pByaiq/ksXcR0RquuhWcfYh2CmpYmxGEpLVX/NhmjREuQ6U1aednxO1f056piyE7
         iVi0vm3xbOi9BQLqSNkEPntWaDHylwu1obGbRwqZ8GMlku4H5LPG1DICZ5n2x0vy312u
         bo5ln1gPPCKqeWYTCSxhVc7PskGolfHrMPQiozypqUgX0iD4yN1PljiNNHYbon6SEAw/
         8Naz42Kzih6p8pN+5qsalk31WWCynJLeJ8nd+BPuyhVimT8xbJO40I+Bayqf9127/mYg
         MYh6/t3Tc5114FPtYyx8covWiYoUaZb1rJEiEB+1apCxDFsQtjbHROAyBlQMUo1xRGLR
         Mv3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qzVYWafzbxg88sfXP7TQ/3kp6aOIADZfGAq7TNs4do8=;
        fh=F8lI6APrpOpRMGxIPqCutMXITf12uKef9cJV3DxjelY=;
        b=Y51A79cL06RCJKpbSBa24GkYomLk2pKtdPnTcAVHxhbUPd4bRVVDdXzniUpErYK6r0
         TCMdQParWSUaEMuEYN8b+sGhayLSM8wmr/j3TOROeNtpblWDn+SjiCv+yXyBrCjkkSew
         CgGydbDttCt+ekuXCYosjTXDDI9r+S2aOziMmV5qnNgPjnwGnZM56Wsq1NyV+csK7XiY
         6yxJWwUhV+eMjsdfk2nDLPs4B7AR1iPCCv9X8cCMIBKXTRVKWdHdV7hB+cXfUSMMljI7
         Y3q6TBwlN+SaoapcxPHVuYucaT5ypj7ao6/KcIoxBDpLnJXRCOlgTHzpVKBLYdSBUUjo
         AyRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=jFhwbkPV;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com. [205.220.168.131])
        by mx.google.com with ESMTPS id e9e14a558f8ab-36cb9e037b9si68206695ab.200.2024.05.16.07.34.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2024 07:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) client-ip=205.220.168.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=jFhwbkPV;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.168.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G9i7Uj011111;
	Thu, 16 May 2024 14:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=qzVYWafzbxg88sfXP7TQ/3kp6aOIADZfGAq7TNs4do8=; b=jF
	hwbkPVYBMzWU8FW2DGkO2WVM6c5hckjm3wrmDW5uSMj5RUremkbkEDfRDZcdxmqH
	DDIos4kuHFpg5VpAyyX0xW9Aj9EJeNPHgKiYb3jCKWHhw7DHBadMFPtpBfRmegHL
	f8Wr5GHi1aELoa7l3sf7BHF8iDD/wryGoYF8Ti7E8dJYa/oB2aGc1mTP9izfW24A
	jzQncCN9RVFT1a/qJ9wdpzctFRC7mR6W4+1FdFhyDCal+8iQjp3Mcwv6TsN1/wU1
	wx94FmOYvfSvsN7kE4rMibHCQOQVARy3vzuCunMrL5kSRtnSeuwbVXcZVHmAR9rn
	A9dxrUiLumW8K/sD7eZg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3x51pwy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GEYpSY007418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:51 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 07:34:48 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v2 10/12] gunyah: CPU execution loop
Date: Thu, 16 May 2024 14:33:54 +0000
Message-ID: <20240516143356.1739402-11-quic_svaddagi@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516143356.1739402-1-quic_svaddagi@quicinc.com>
References: <20240516143356.1739402-1-quic_svaddagi@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9TdXzo6mC7cWB7m7rXizmxH1XXMxEfpZ
X-Proofpoint-ORIG-GUID: 9TdXzo6mC7cWB7m7rXizmxH1XXMxEfpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015 mlxlogscore=762
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160103
X-TUID: rdYV+Nwd61Iy

Complete the cpu execution loop. At this time, we recognize exits
associated with only MMIO access. Future patches will add support for
recognizing other exit reasons, such as PSCI calls made by guest.

Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
---
 include/sysemu/gunyah_int.h     |   9 ++
 accel/gunyah/gunyah-accel-ops.c |   7 +
 accel/gunyah/gunyah-all.c       | 252 +++++++++++++++++++++++++++++++-
 target/arm/gunyah.c             |  18 +++
 4 files changed, 285 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/gunyah_int.h b/include/sysemu/gunyah_int.h
index e19872dae2..ef82c6edd8 100644
--- a/include/sysemu/gunyah_int.h
+++ b/include/sysemu/gunyah_int.h
@@ -46,12 +46,21 @@ struct GUNYAHState {
     bool preshmem_reserved;
     uint32_t preshmem_size;
     uint32_t nr_irqs;
+    uint32_t vm_started;
+};
+
+struct AccelCPUState {
+    int fd;
+    struct gh_vcpu_run *run;
 };
 
 int gunyah_create_vm(void);
+void gunyah_start_vm(void);
 int gunyah_vm_ioctl(int type, ...);
 void *gunyah_cpu_thread_fn(void *arg);
 int gunyah_add_irqfd(int irqfd, int label, Error **errp);
 GUNYAHState *get_gunyah_state(void);
+int gunyah_arch_put_registers(CPUState *cs, int level);
+void gunyah_cpu_synchronize_post_reset(CPUState *cpu);
 
 #endif    /* GUNYAH_INT_H */
diff --git a/accel/gunyah/gunyah-accel-ops.c b/accel/gunyah/gunyah-accel-ops.c
index af8a4ad606..f6a0d8d782 100644
--- a/accel/gunyah/gunyah-accel-ops.c
+++ b/accel/gunyah/gunyah-accel-ops.c
@@ -37,6 +37,11 @@ static void gunyah_accel_instance_init(Object *obj)
     s->vmfd = -1;
 }
 
+static void gunyah_setup_post(MachineState *ms, AccelState *accel)
+{
+    gunyah_start_vm();
+}
+
 static void gunyah_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelClass *ac = ACCEL_CLASS(oc);
@@ -44,6 +49,7 @@ static void gunyah_accel_class_init(ObjectClass *oc, void *data)
     ac->name = "GUNYAH";
     ac->init_machine = gunyah_init;
     ac->allowed = &gunyah_allowed;
+    ac->setup_post = gunyah_setup_post;
 }
 
 static const TypeInfo gunyah_accel_type = {
@@ -104,6 +110,7 @@ static void gunyah_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->kick_vcpu_thread = gunyah_kick_vcpu_thread;
     ops->cpu_thread_is_idle = gunyah_vcpu_thread_is_idle;
     ops->check_capability = gunyah_check_capability;
+    ops->synchronize_post_reset = gunyah_cpu_synchronize_post_reset;
 };
 
 static const TypeInfo gunyah_accel_ops_type = {
diff --git a/accel/gunyah/gunyah-all.c b/accel/gunyah/gunyah-all.c
index d8c3758c59..4c56dd8c73 100644
--- a/accel/gunyah/gunyah-all.c
+++ b/accel/gunyah/gunyah-all.c
@@ -26,6 +26,9 @@
 #include "hw/boards.h"
 #include "qapi/error.h"
 #include "qemu/event_notifier.h"
+#include "qemu/main-loop.h"
+#include "sysemu/runstate.h"
+#include "qemu/guest-random.h"
 
 static void gunyah_region_add(MemoryListener *listener,
                            MemoryRegionSection *section);
@@ -40,6 +43,18 @@ static void gunyah_mem_ioeventfd_del(MemoryListener *listener,
                                   bool match_data, uint64_t data,
                                   EventNotifier *e);
 
+/* Keep this here until Linux kernel UAPI header file (gunyah.h) is updated */
+enum gh_vm_exit_type {
+    GH_RM_EXIT_TYPE_VM_EXIT = 0,
+    GH_RM_EXIT_TYPE_PSCI_POWER_OFF = 1,
+    GH_RM_EXIT_TYPE_PSCI_SYSTEM_RESET = 2,
+    GH_RM_EXIT_TYPE_PSCI_SYSTEM_RESET2 = 3,
+    GH_RM_EXIT_TYPE_WDT_BITE = 4,
+    GH_RM_EXIT_TYPE_HYP_ERROR = 5,
+    GH_RM_EXIT_TYPE_ASYNC_EXT_ABORT = 6,
+    GH_RM_EXIT_TYPE_VM_FORCE_STOPPED = 7,
+};
+
 static int gunyah_ioctl(int type, ...)
 {
     void *arg;
@@ -70,6 +85,18 @@ int gunyah_vm_ioctl(int type, ...)
     return ioctl(s->vmfd, type, arg);
 }
 
+static int gunyah_vcpu_ioctl(CPUState *cpu, int type, ...)
+{
+    void *arg;
+    va_list ap;
+
+    va_start(ap, type);
+    arg = va_arg(ap, void *);
+    va_end(ap);
+
+    return ioctl(cpu->accel->fd, type, arg);
+}
+
 static MemoryListener gunyah_memory_listener = {
     .name = "gunyah",
     .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
@@ -282,6 +309,11 @@ static void gunyah_set_phys_mem(GUNYAHState *s,
             error_report("Overlapping slot registration not supported!");
             exit(1);
         }
+
+        if (qatomic_read(&s->vm_started)) {
+            error_report("Memory map changes after VM start not supported!");
+            exit(1);
+        }
     }
 
     if (area->readonly ||
@@ -418,13 +450,231 @@ GUNYAHState *get_gunyah_state(void)
     return GUNYAH_STATE(current_accel());
 }
 
+static void gunyah_ipi_signal(int sig)
+{
+    if (current_cpu) {
+        qatomic_set(&current_cpu->accel->run->immediate_exit, 1);
+    }
+}
+
+static void gunyah_cpu_kick_self(void)
+{
+    qatomic_set(&current_cpu->accel->run->immediate_exit, 1);
+}
+
+static int gunyah_init_vcpu(CPUState *cpu, Error **errp)
+{
+    int ret;
+    struct gh_fn_desc fdesc;
+    struct gh_fn_vcpu_arg vcpu;
+    struct sigaction sigact;
+    sigset_t set;
+
+    cpu->accel = g_new0(AccelCPUState, 1);
+
+    /* init cpu signals */
+    memset(&sigact, 0, sizeof(sigact));
+    sigact.sa_handler = gunyah_ipi_signal;
+    sigaction(SIG_IPI, &sigact, NULL);
+
+    pthread_sigmask(SIG_BLOCK, NULL, &set);
+    sigdelset(&set, SIG_IPI);
+
+    ret = pthread_sigmask(SIG_SETMASK, &set, NULL);
+    if (ret) {
+        error_report("pthread_sigmask: %s", strerror(ret));
+        exit(1);
+    }
+
+    vcpu.id = cpu->cpu_index;
+    fdesc.type = GH_FN_VCPU;
+    fdesc.arg_size = sizeof(struct gh_fn_vcpu_arg);
+    fdesc.arg = (__u64)(&vcpu);
+
+    ret = gunyah_vm_ioctl(GH_VM_ADD_FUNCTION, &fdesc);
+    if (ret < 0) {
+        error_report("could not create VCPU %d: %s", vcpu.id, strerror(errno));
+        exit(1);
+    }
+
+    cpu->accel->fd = ret;
+    cpu->accel->run = mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, ret, 0);
+    if (cpu->accel->run == MAP_FAILED) {
+        error_report("mmap of vcpu run structure failed : %s", strerror(errno));
+        exit(1);
+    }
+
+    return 0;
+}
+
+static void gunyah_vcpu_destroy(CPUState *cpu)
+{
+    int ret;
+
+    ret = munmap(cpu->accel->run, 4096);
+    if (ret < 0) {
+        error_report("munmap of vcpu run structure failed: %s",
+                strerror(errno));
+        exit(1);
+    }
+
+    close(cpu->accel->fd);
+    g_free(cpu->accel);
+}
+
+void gunyah_start_vm(void)
+{
+    int ret;
+    GUNYAHState *s = GUNYAH_STATE(current_accel());
+
+    ret = gunyah_vm_ioctl(GH_VM_START);
+    if (ret != 0) {
+        error_report("Failed to start VM: %s", strerror(errno));
+        exit(1);
+    }
+    qatomic_set(&s->vm_started, 1);
+}
+
+static int gunyah_vcpu_exec(CPUState *cpu)
+{
+    int ret;
+    enum gh_vm_status exit_status;
+    enum gh_vm_exit_type exit_type;
+
+    bql_unlock();
+    cpu_exec_start(cpu);
+
+    do {
+        struct gh_vcpu_run *run = cpu->accel->run;
+        int exit_reason;
+
+        if (qatomic_read(&cpu->exit_request)) {
+            gunyah_cpu_kick_self();
+        }
+
+        /* Todo: Check need for smp_rmb() here */
+
+        ret = gunyah_vcpu_ioctl(cpu, GH_VCPU_RUN);
+        if (ret < 0) {
+            if (errno == EINTR || errno == EAGAIN) {
+                qatomic_set(&run->immediate_exit, 0);
+                /* Todo: Check need for smp_wmb() here */
+                ret = EXCP_INTERRUPT;
+                break;
+            }
+
+            error_report("GH_VCPU_RUN: %s", strerror(errno));
+            ret = -1;
+            break;
+        }
+
+        exit_reason = run->exit_reason;
+        switch (exit_reason) {
+        case GH_VCPU_EXIT_MMIO:
+            address_space_rw(&address_space_memory,
+                run->mmio.phys_addr, MEMTXATTRS_UNSPECIFIED,
+                run->mmio.data,
+                run->mmio.len,
+                run->mmio.is_write);
+            break;
+
+        case GH_VCPU_EXIT_STATUS:
+            exit_status = run->status.status;
+            exit_type = run->status.exit_info.type;
+
+            switch (exit_status) {
+            case GH_VM_STATUS_CRASHED:
+                    bql_lock();
+                    qemu_system_guest_panicked(NULL);
+                    bql_unlock();
+                    ret = EXCP_INTERRUPT;
+                    break;
+            case GH_VM_STATUS_EXITED:
+                /* Fall-through */
+            default:
+                switch (exit_type) {
+                case GH_RM_EXIT_TYPE_WDT_BITE:
+                    bql_lock();
+                    qemu_system_guest_panicked(NULL);
+                    bql_unlock();
+                    ret = EXCP_INTERRUPT;
+                    break;
+
+                case GH_RM_EXIT_TYPE_PSCI_SYSTEM_RESET:
+                case GH_RM_EXIT_TYPE_PSCI_SYSTEM_RESET2:
+                    qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+                    ret = EXCP_INTERRUPT;
+                    break;
+                case GH_RM_EXIT_TYPE_VM_EXIT:
+                case GH_RM_EXIT_TYPE_PSCI_POWER_OFF:
+                    /* Fall-through */
+                default:
+                    qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+                    ret = EXCP_INTERRUPT;
+                }
+            }
+            break;
+
+        default:
+            error_report("unhandled exit %d", exit_reason);
+            exit(1);
+        }
+    } while (ret == 0);
+
+    cpu_exec_end(cpu);
+    bql_lock();
+
+    if (ret < 0) {
+        cpu_dump_state(cpu, stderr, CPU_DUMP_CODE);
+        vm_stop(RUN_STATE_INTERNAL_ERROR);
+    }
+
+    qatomic_set(&cpu->exit_request, 0);
+
+    return ret;
+}
+
 void *gunyah_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
 
+    rcu_register_thread();
+
+    bql_lock();
+    qemu_thread_get_self(cpu->thread);
+
+    cpu->thread_id = qemu_get_thread_id();
+    cpu->neg.can_do_io = true;
+    current_cpu = cpu;
+
+    gunyah_init_vcpu(cpu, &error_fatal);
+
+    /* signal CPU creation */
+    cpu_thread_signal_created(cpu);
+    qemu_guest_random_seed_thread_part2(cpu->random_seed);
+
     do {
-        /* Do nothing */
+        if (cpu_can_run(cpu)) {
+            gunyah_vcpu_exec(cpu);
+        }
+        qemu_wait_io_event(cpu);
     } while (!cpu->unplug || cpu_can_run(cpu));
 
+    gunyah_vcpu_destroy(cpu);
+    cpu_thread_signal_destroyed(cpu);
+    bql_unlock();
+    rcu_unregister_thread();
     return NULL;
 }
+
+static void do_gunyah_cpu_synchronize_post_reset(CPUState *cpu,
+                                run_on_cpu_data arg)
+{
+    gunyah_arch_put_registers(cpu, 0);
+    cpu->vcpu_dirty = false;
+}
+
+void gunyah_cpu_synchronize_post_reset(CPUState *cpu)
+{
+    run_on_cpu(cpu, do_gunyah_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
+}
diff --git a/target/arm/gunyah.c b/target/arm/gunyah.c
index c33a0c0615..bbad2171a8 100644
--- a/target/arm/gunyah.c
+++ b/target/arm/gunyah.c
@@ -122,3 +122,21 @@ void gunyah_arm_fdt_customize(void *fdt, uint64_t mem_base,
         g_free(nodename);
     }
 }
+
+int gunyah_arch_put_registers(CPUState *cs, int level)
+{
+    /*
+     * No support (yet) to set/get vCPU registers.
+     *
+     * We specify device-tree location via GH_VM_SET_DTB_CONFIG, which is
+     * passed on to RM. RM will inspect the device-tree before VM begins
+     * execution and makes arrangement (with hypervisor) for VM to receive a
+     * pointer to device-tree via X0 register at boot time.
+     *
+     * Image entry point is assumed to be the beginning of slot containing
+     * device-tree, which seems to be true currently. In future, Gunyah could
+     * add API to set boot CPU's register context.
+     */
+
+    return 0;
+}
-- 
2.25.1
