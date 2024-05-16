Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1409778ejl;
        Thu, 16 May 2024 07:34:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqprN1588ZN7ZMbNkSHWGQoNyKLSJqJnW9mANybZU2DwlGHvFShNllHflmdELxFnfPmuXyMnTemocjmWZdzbZ6RL5M/SWX
X-Google-Smtp-Source: AGHT+IHa5RkvgfI7XeIOHqUOTv69tEFk0/6EZ9YjZX26BTO/iC3BKQn+edeMRo3HyNr9EM9XzTr5
X-Received: by 2002:a25:a507:0:b0:df1:cfb3:47fb with SMTP id 3f1490d57ef6-df1cfb34c58mr5051334276.54.1715870072686;
        Thu, 16 May 2024 07:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715870072; cv=none;
        d=google.com; s=arc-20160816;
        b=vUOS+nGCi8lkAz4ZiLHvBhoMrVrHLds+F6MlgMMD8VJFd6XZI0BbCFSAlaYP+A899y
         SexMKmgi1qUkL2HN9UxcKMJBW6pCz6TpwOf9ym6Y6DjQjGh1s2SNMTLdHSjUZO8oblgk
         m+uL2FhLdDUjmC195jYqSnQgZYnUD12ZTnhHUfvIHhbawUe6rJ54szGd1IpUf2Fp4z2N
         DjbafBxieP3zmj61eJHfOkcZC/Ui3qwnzTEY3WAhdQdMQNn5tXydhEs2u+KpJBSFwk84
         M3NmHtZVCrjdVh9v5DHDxczFzTUcBPhm7AZi26SKx8bKqBcHYM/zYvtf8P/7T7v+asyv
         Dr5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uviPvqv+rWB/nK74mpoQ0WrfHmUlUXN1Ahud51wS5LM=;
        fh=F8lI6APrpOpRMGxIPqCutMXITf12uKef9cJV3DxjelY=;
        b=psaOfweExqyC0G6s84+g8DQ5A2vaQIKB2yM66KeGCiOHdDKELDMdFuwAFXB+y0/Fqv
         bPdCJZ3/OvXFI+dBiIGxsnlJlWgupM4K2NPdcSrQt/mQVVCSXhrby0xvTW/vJ46Wr4T6
         edKATVw4xImD3FDg6ln8rBJBBfYZV4in5raVs9dMxhjep59g+wgG3exSVZywQDUQ45YZ
         P8ZMXy9TL5KVfzU3D544LyNMkCn3GDbSwtnz/2H2OP8y146flXCfHf8ZWHpUtUBs/Tzx
         voprPsHvBhoncJGoET4BFnJrPD1A1Moo9HVIxQpRMgU1xls7FszMcuszD0rGTBsH38HR
         UvTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=hgerd8PU;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Return-Path: <quic_svaddagi@quicinc.com>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com. [205.220.180.131])
        by mx.google.com with ESMTPS id 3f1490d57ef6-debd3712d57si7859876276.17.2024.05.16.07.34.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2024 07:34:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) client-ip=205.220.180.131;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=hgerd8PU;
       spf=pass (google.com: domain of quic_svaddagi@quicinc.com designates 205.220.180.131 as permitted sender) smtp.mailfrom=quic_svaddagi@quicinc.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G90TmO021394;
	Thu, 16 May 2024 14:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=uviPvqv+rWB/nK74mpoQ0WrfHmUlUXN1Ahud51wS5LM=; b=hg
	erd8PUY4HaIiydQXb0lxiS1fOGzr39CSRGNYdiQNUEd4/8a8L9u94CMjZIKBF1LA
	z7HLcp2MXT6EXWDu8PuViNeAAJF/v3DxWqEIuenGj5XszwDQfk8Fn/VQd3o6os2c
	RcEjlTBLPRLK7R40ytkHIKIBPqY93J3glscRVREIuVgZL6ACIC47JJKc1IywnHlD
	fiINS8wa1dHkA1IhJikk6jgl5F8Dt+BXRhnJlrRGqMLnPl0N7o2OKebrdxQj3IdW
	8q39zjb6B4ZYLeYFhzSt9YOewqg9npIPutoXogiEXmRCP2nUxpl0IPRBJDuCDmaL
	7dvg9h1G5pr4Q0T0QHrw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y45vbe0m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GEYUOu009410
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 14:34:30 GMT
Received: from blr-ubuntu-31.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 07:34:26 -0700
From: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
To: <peter.maydell@linaro.org>, <philmd@linaro.org>, <alex.bennee@linaro.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <quic_svaddagi@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_pheragu@quicinc.com>, <quic_eberman@quicinc.com>,
        <quic_yvasi@quicinc.com>, <quic_cvanscha@quicinc.com>,
        <quic_mnalajal@quicinc.com>
Subject: [RFC/PATCH v2 05/12] gunyah: Support memory assignment
Date: Thu, 16 May 2024 14:33:49 +0000
Message-ID: <20240516143356.1739402-6-quic_svaddagi@quicinc.com>
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
X-Proofpoint-GUID: ajEhrCXIBNJsATtWQxdTRaBftMk6MxaV
X-Proofpoint-ORIG-GUID: ajEhrCXIBNJsATtWQxdTRaBftMk6MxaV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160101
X-TUID: 2PLbqto+TOpZ

Gunyah hypervisor supports several APIs for a host VM to assign some of
its memory to the VM being created.

    Lend - assigned memory is made private to VM (host loses access)
    Share - assigned memory is shared between host and guest VM

No APIs exist however, at this time, for a confidential VM to share some of
its (private) memory with host at runtime.

Since, in practice, even a confidential VM may need some shared memory to
exchange information with its host, we split VM's memory into two
portions - one that is kept private (via Lend API) and other that is
shared with host (via Share API).

Note: Gunyah kernel driver from Android common kernel repository exposes
two separate ioctls for lend and share operations [1]. A subsequent
version of kernel driver that will be merged in Linux kernel repository
will combine the two ioctls into one, when this patch will be updated.

1. Refer GH_VM_ANDROID_LEND_USER_MEM and GH_VM_SET_USER_MEM_REGION in
https://android.googlesource.com/kernel/common/+/refs/heads/android14-6.1/drivers/virt/gunyah/vm_mgr.c

Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
---
 include/sysemu/gunyah.h     |   2 +
 include/sysemu/gunyah_int.h |  26 ++++
 accel/gunyah/gunyah-all.c   | 261 ++++++++++++++++++++++++++++++++++++
 accel/stubs/gunyah-stub.c   |   5 +
 hw/arm/virt.c               |   4 +
 5 files changed, 298 insertions(+)

diff --git a/include/sysemu/gunyah.h b/include/sysemu/gunyah.h
index 4f26938521..78cb80f01e 100644
--- a/include/sysemu/gunyah.h
+++ b/include/sysemu/gunyah.h
@@ -20,6 +20,8 @@
 
 extern bool gunyah_allowed;
 
+void gunyah_set_swiotlb_size(uint64_t size);
+
 #define gunyah_enabled() (gunyah_allowed)
 
 #define TYPE_GUNYAH_ACCEL ACCEL_CLASS_NAME("gunyah")
diff --git a/include/sysemu/gunyah_int.h b/include/sysemu/gunyah_int.h
index 37de628b37..0967b2d7d7 100644
--- a/include/sysemu/gunyah_int.h
+++ b/include/sysemu/gunyah_int.h
@@ -13,15 +13,41 @@
 
 #include "qemu/accel.h"
 #include "qemu/typedefs.h"
+#include "qemu/thread.h"
+
+typedef struct gunyah_slot {
+    uint64_t start;
+    uint64_t size;
+    uint8_t *mem;
+    uint32_t id;
+    uint32_t flags;
+
+    /*
+     * @lend indicates if memory was lent.
+     *
+     * This flag is temporarily used until the upstream Gunyah kernel driver
+     * patches are updated to support indication of lend vs share via flags
+     * field of GH_SET_USER_MEM_API interface.
+     */
+    bool lend;
+} gunyah_slot;
+
+#define GUNYAH_MAX_MEM_SLOTS    32
 
 struct GUNYAHState {
     AccelState parent_obj;
 
+    QemuMutex slots_lock;
+    gunyah_slot slots[GUNYAH_MAX_MEM_SLOTS];
+    uint32_t nr_slots;
     int fd;
     int vmfd;
+    uint64_t swiotlb_size;
+    bool preshmem_reserved;
 };
 
 int gunyah_create_vm(void);
+int gunyah_vm_ioctl(int type, ...);
 void *gunyah_cpu_thread_fn(void *arg);
 
 #endif    /* GUNYAH_INT_H */
diff --git a/accel/gunyah/gunyah-all.c b/accel/gunyah/gunyah-all.c
index 370add75f9..19f96225a0 100644
--- a/accel/gunyah/gunyah-all.c
+++ b/accel/gunyah/gunyah-all.c
@@ -14,12 +14,21 @@
 #include <sys/ioctl.h>
 #include "qemu/osdep.h"
 #include "qemu/typedefs.h"
+#include "qemu/units.h"
 #include "hw/core/cpu.h"
 #include "sysemu/cpus.h"
 #include "sysemu/gunyah.h"
 #include "sysemu/gunyah_int.h"
 #include "linux-headers/linux/gunyah.h"
+#include "exec/memory.h"
 #include "qemu/error-report.h"
+#include "exec/address-spaces.h"
+#include "hw/boards.h"
+
+static void gunyah_region_add(MemoryListener *listener,
+                           MemoryRegionSection *section);
+static void gunyah_region_del(MemoryListener *listener,
+                           MemoryRegionSection *section);
 
 static int gunyah_ioctl(int type, ...)
 {
@@ -36,9 +45,32 @@ static int gunyah_ioctl(int type, ...)
     return ioctl(s->fd, type, arg);
 }
 
+int gunyah_vm_ioctl(int type, ...)
+{
+    void *arg;
+    va_list ap;
+    GUNYAHState *s = GUNYAH_STATE(current_accel());
+
+    assert(s->vmfd);
+
+    va_start(ap, type);
+    arg = va_arg(ap, void *);
+    va_end(ap);
+
+    return ioctl(s->vmfd, type, arg);
+}
+
+static MemoryListener gunyah_memory_listener = {
+    .name = "gunyah",
+    .priority = MEMORY_LISTENER_PRIORITY_ACCEL,
+    .region_add = gunyah_region_add,
+    .region_del = gunyah_region_del,
+};
+
 int gunyah_create_vm(void)
 {
     GUNYAHState *s;
+    int i;
 
     s = GUNYAH_STATE(current_accel());
 
@@ -55,9 +87,238 @@ int gunyah_create_vm(void)
         exit(1);
     }
 
+    qemu_mutex_init(&s->slots_lock);
+    s->nr_slots = GUNYAH_MAX_MEM_SLOTS;
+    for (i = 0; i < s->nr_slots; ++i) {
+        s->slots[i].start = 0;
+        s->slots[i].size = 0;
+        s->slots[i].id = i;
+    }
+
+    memory_listener_register(&gunyah_memory_listener, &address_space_memory);
     return 0;
 }
 
+#define gunyah_slots_lock(s)    qemu_mutex_lock(&s->slots_lock)
+#define gunyah_slots_unlock(s)  qemu_mutex_unlock(&s->slots_lock)
+
+static gunyah_slot *gunyah_find_overlap_slot(GUNYAHState *s,
+                uint64_t start, uint64_t size)
+{
+    gunyah_slot *slot;
+    int i;
+
+    for (i = 0; i < s->nr_slots; ++i) {
+        slot = &s->slots[i];
+        if (slot->size && start < (slot->start + slot->size) &&
+            (start + size) > slot->start) {
+            return slot;
+        }
+    }
+
+    return NULL;
+}
+
+/* Called with s->slots_lock held */
+static gunyah_slot *gunyah_get_free_slot(GUNYAHState *s)
+{
+    int i;
+
+    for (i = 0; i < s->nr_slots; i++) {
+        if (s->slots[i].size == 0) {
+            return &s->slots[i];
+        }
+    }
+
+    return NULL;
+}
+
+static void gunyah_add_mem(GUNYAHState *s, MemoryRegionSection *section,
+        bool lend, enum gh_mem_flags flags)
+{
+    gunyah_slot *slot;
+    MemoryRegion *area = section->mr;
+    struct gh_userspace_memory_region gumr;
+    int ret;
+
+    slot = gunyah_get_free_slot(s);
+    if (!slot) {
+        error_report("No free slots to add memory!");
+        exit(1);
+    }
+
+    slot->size = int128_get64(section->size);
+    slot->mem = memory_region_get_ram_ptr(area) + section->offset_within_region;
+    slot->start = section->offset_within_address_space;
+    slot->lend = lend;
+
+    gumr.label = slot->id;
+    gumr.flags = flags;
+    gumr.guest_phys_addr = slot->start;
+    gumr.memory_size = slot->size;
+    gumr.userspace_addr = (__u64) slot->mem;
+
+    /*
+     * GH_VM_ANDROID_LEND_USER_MEM is temporary, until
+     * GH_VM_SET_USER_MEM_REGION is enhanced to support lend option also.
+     */
+    if (lend) {
+        ret = gunyah_vm_ioctl(GH_VM_ANDROID_LEND_USER_MEM, &gumr);
+    } else {
+        ret = gunyah_vm_ioctl(GH_VM_SET_USER_MEM_REGION, &gumr);
+    }
+
+    if (ret) {
+        error_report("failed to add mem (%s)", strerror(errno));
+        exit(1);
+    }
+}
+
+static bool is_confidential_guest(void)
+{
+    return current_machine->cgs != NULL;
+}
+
+/*
+ * Check if memory of a confidential VM needs to be split into two portions -
+ * one private to it and other shared with host.
+ */
+static bool split_mem(GUNYAHState *s,
+        MemoryRegion *area, MemoryRegionSection *section)
+{
+    bool writeable = !area->readonly && !area->rom_device;
+
+    if (!is_confidential_guest()) {
+        return false;
+    }
+
+    if (!s->swiotlb_size || section->size <= s->swiotlb_size) {
+        return false;
+    }
+
+    /* Split only memory that can be written to by guest */
+    if (!memory_region_is_ram(area) || !writeable) {
+        return false;
+    }
+
+    /* Have we reserved already? */
+    if (qatomic_read(&s->preshmem_reserved)) {
+        return false;
+    }
+
+    /* Do we have enough available memory? */
+    if (section->size <= s->swiotlb_size) {
+        return false;
+    }
+
+    return true;
+}
+
+static void gunyah_set_phys_mem(GUNYAHState *s,
+        MemoryRegionSection *section, bool add)
+{
+    MemoryRegion *area = section->mr;
+    bool writable = !area->readonly && !area->rom_device;
+    enum gh_mem_flags flags = 0;
+    uint64_t page_size = qemu_real_host_page_size();
+    MemoryRegionSection mrs = *section;
+    bool lend = is_confidential_guest(), split = false;
+    struct gunyah_slot *slot;
+
+    /*
+     * Gunyah hypervisor, at this time, does not support mapping memory
+     * at low address (< 1GiB). Below code will be updated once
+     * that limitation is addressed.
+     */
+    if (section->offset_within_address_space < GiB) {
+        return;
+    }
+
+    if (!memory_region_is_ram(area)) {
+        if (writable) {
+            return;
+        } else if (!memory_region_is_romd(area)) {
+            /*
+             * If the memory device is not in romd_mode, then we actually want
+             * to remove the gunyah memory slot so all accesses will trap.
+             */
+             add = false;
+        }
+    }
+
+    if (!QEMU_IS_ALIGNED(int128_get64(section->size), page_size) ||
+        !QEMU_IS_ALIGNED(section->offset_within_address_space, page_size)) {
+        error_report("Not page aligned");
+        add = false;
+    }
+
+    gunyah_slots_lock(s);
+
+    slot = gunyah_find_overlap_slot(s,
+            section->offset_within_address_space,
+            int128_get64(section->size));
+
+    if (!add) {
+        if (slot) {
+            error_report("Memory slot removal not yet supported!");
+            exit(1);
+        }
+        /* Nothing to be done as address range was not previously registered */
+        goto done;
+    } else {
+        if (slot) {
+            error_report("Overlapping slot registration not supported!");
+            exit(1);
+        }
+    }
+
+    if (area->readonly ||
+        (!memory_region_is_ram(area) && memory_region_is_romd(area))) {
+        flags = GH_MEM_ALLOW_READ | GH_MEM_ALLOW_EXEC;
+    } else {
+        flags = GH_MEM_ALLOW_READ | GH_MEM_ALLOW_WRITE | GH_MEM_ALLOW_EXEC;
+    }
+
+    split = split_mem(s, area, &mrs);
+    if (split) {
+        mrs.size -= s->swiotlb_size;
+        gunyah_add_mem(s, &mrs, true, flags);
+        lend = false;
+        mrs.offset_within_region += mrs.size;
+        mrs.offset_within_address_space += mrs.size;
+        mrs.size = s->swiotlb_size;
+        qatomic_set(&s->preshmem_reserved, true);
+    }
+
+    gunyah_add_mem(s, &mrs, lend, flags);
+
+done:
+    gunyah_slots_unlock(s);
+}
+
+static void gunyah_region_add(MemoryListener *listener,
+                           MemoryRegionSection *section)
+{
+    GUNYAHState *s = GUNYAH_STATE(current_accel());
+
+    gunyah_set_phys_mem(s, section, true);
+}
+
+static void gunyah_region_del(MemoryListener *listener,
+                           MemoryRegionSection *section)
+{
+    GUNYAHState *s = GUNYAH_STATE(current_accel());
+
+    gunyah_set_phys_mem(s, section, false);
+}
+
+void gunyah_set_swiotlb_size(uint64_t size)
+{
+    GUNYAHState *s = GUNYAH_STATE(current_accel());
+
+    s->swiotlb_size = size;
+}
+
 void *gunyah_cpu_thread_fn(void *arg)
 {
     CPUState *cpu = arg;
diff --git a/accel/stubs/gunyah-stub.c b/accel/stubs/gunyah-stub.c
index 1edbe1433e..2028fa04c7 100644
--- a/accel/stubs/gunyah-stub.c
+++ b/accel/stubs/gunyah-stub.c
@@ -11,3 +11,8 @@
 #include "sysemu/gunyah.h"
 
 bool gunyah_allowed;
+
+void gunyah_set_swiotlb_size(uint64_t size)
+{
+    return;
+}
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index fee1e5dab5..3b0fcf812f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2136,6 +2136,10 @@ static int confidential_guest_init(MachineState *ms)
         return -1;
     }
 
+    if (gunyah_enabled()) {
+        gunyah_set_swiotlb_size(obj->swiotlb_size);
+    }
+
     acg = obj;
     cgs->ready = true;
 
-- 
2.25.1
