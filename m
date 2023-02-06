Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4076327ejb;
        Mon, 6 Feb 2023 03:23:58 -0800 (PST)
X-Google-Smtp-Source: AK7set/8I0t48mqpwWgswyns+GcIdrrt392Ba0/mq6UryMSoAbA5r14gTQuCuGhJi8qQ7Jt229ZQ
X-Received: by 2002:a05:6214:2a4a:b0:56b:ed55:3a29 with SMTP id jf10-20020a0562142a4a00b0056bed553a29mr10996407qvb.42.1675682638795;
        Mon, 06 Feb 2023 03:23:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675682638; cv=none;
        d=google.com; s=arc-20160816;
        b=arJaHN5+DmDU9zO4BG3CeRVkrzyZpw70R4EeSHWcvIYGmm1kM3tp2RCUq/gM/Iz1KL
         ORP+AP4rUpVD4Sh5C9HehtkjgZpOBBpP8sdfGebZ+XNqwlYUafxTU5cQvSURlamw5dZP
         edZwJdCEpx+GSQNuE/zk/xQINO13HKcIsez+mDyapongkdoU3LQGHML3rga/Ipwm3eW9
         J5j3Ypv8KIuuzkLtWfriYTQ453jpnrXkdBtm/xpEDQPLReu3A7rb+JOwVIVXbcSnYlL8
         2l6eZeFBXfiqxchhWzG4beacLNOHlvPG78qZJO/edfW2SZskuN2JZjZGcAc6CV7WmJ2t
         TJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=URENfRLE4MQd654yowZvE5OyBk8WhhSip8pYfRKwdxs=;
        b=wHCoUhyHg5YTtqCi5HxYbl0AeAfT/X/mxtW2WnnIPjSFl2TvrOI3s14o0xOtqCeR63
         MOpE5svFZMzuszvMg5Kk48zra83+Zb1drQh4qHByP2BCuFpKzsMyMLGITcQn46uEYysl
         NmGeIvQx6wheUVPvPzMLHo+k3etv9WxVV3Rcr5YSW4rTzmApG1yLF7Imt5YIfh4b4g6J
         1oPcUUoUJPpsT2umfNBoy28My1vqOl5cBDCPCVSKUXgdWOwEa/xm2B0IUd9Qm/7Y4sLf
         x0NrQlKNiXOkDJgGZrhHZsdikS+UvJr6lCbdK9VnjqYyNnrdydgx2Age0wFf4tBf6Kq0
         8pfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RrC5AABQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy5-20020a0562140f6500b005322f15ba2bsi9120076qvb.6.2023.02.06.03.23.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 03:23:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RrC5AABQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pOzaW-0005KH-Lf; Mon, 06 Feb 2023 06:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzaU-0005E7-K4
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 06:23:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzaP-0003Xd-M1
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 06:23:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675682580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=URENfRLE4MQd654yowZvE5OyBk8WhhSip8pYfRKwdxs=;
 b=RrC5AABQ74Dl4WKJt+X+kZXgi4rnYNyFnDob2TfAjSf+XHN2ci0OCa+F6xK2ge/+bHHRCv
 B5l3hVDCUkdny1YDHE1rrDTcfYEcQzkl7vQNHGPELiCQI0Wjll+Oe1ZxvVHNqtSuR3vGla
 STqZjDdnL33YRWFd+/zJyt6/48koBVE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-6PszlWFZOBWBDUH4zbgUTQ-1; Mon, 06 Feb 2023 06:21:38 -0500
X-MC-Unique: 6PszlWFZOBWBDUH4zbgUTQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B55C3C0E45A;
 Mon,  6 Feb 2023 11:21:38 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-63.bne.redhat.com [10.64.54.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BE9E492B21;
 Mon,  6 Feb 2023 11:21:33 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH RFCv1 7/8] hw/arm/virt: Enable backup bitmap for dirty ring
Date: Mon,  6 Feb 2023 19:20:09 +0800
Message-Id: <20230206112010.99871-8-gshan@redhat.com>
In-Reply-To: <20230206112010.99871-1-gshan@redhat.com>
References: <20230206112010.99871-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TsZqB5uKGmS1

When KVM device "kvm-arm-gicv3" or "arm-its-kvm" is used, we have to
enable the backup bitmap for the dirty ring. Otherwise, the migration
will fail because those two devices are using the backup bitmap to track
dirty guest memory, corresponding to various hardware tables.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c        | 26 ++++++++++++++++++++++++++
 target/arm/kvm64.c   | 25 +++++++++++++++++++++++++
 target/arm/kvm_arm.h | 12 ++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ba47728288..b91b5972bc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2025,6 +2025,8 @@ static void machvirt_init(MachineState *machine)
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     const CPUArchIdList *possible_cpus;
+    const char *gictype = NULL;
+    const char *itsclass = NULL;
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *secure_sysmem = NULL;
     MemoryRegion *tag_sysmem = NULL;
@@ -2072,6 +2074,30 @@ static void machvirt_init(MachineState *machine)
      */
     finalize_gic_version(vms);
 
+    /*
+     * When "kvm-arm-gicv3" or "arm-its-kvm" is used, the backup dirty
+     * bitmap has to be enabled for KVM dirty ring, before any memory
+     * slot is added. Otherwise, the migration will fail with the dirty
+     * ring.
+     */
+    if (kvm_enabled()) {
+        if (vms->gic_version != VIRT_GIC_VERSION_2) {
+            gictype = gicv3_class_name();
+        }
+
+        if (vms->gic_version != VIRT_GIC_VERSION_2 && vms->its) {
+            itsclass = its_class_name();
+        }
+
+        if (((gictype && !strcmp(gictype, "kvm-arm-gicv3")) ||
+             (itsclass && !strcmp(itsclass, "arm-its-kvm"))) &&
+            !kvm_arm_enable_dirty_ring_with_bitmap()) {
+            error_report("Failed to enable the backup bitmap for "
+                         "KVM dirty ring");
+            exit(1);
+        }
+    }
+
     if (vms->secure) {
         /*
          * The Secure view of the world is the same as the NonSecure,
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 1197253d12..91960e1cd3 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -764,6 +764,31 @@ bool kvm_arm_steal_time_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
 }
 
+bool kvm_arm_enable_dirty_ring_with_bitmap(void)
+{
+    int ret;
+
+    /* No need to enable the backup bitmap if dirty ring isn't enabled */
+    if (!kvm_dirty_ring_enabled()) {
+        return true;
+    }
+
+    ret = kvm_check_extension(kvm_state, KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP);
+    if (!ret) {
+        return false;
+    }
+
+    ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP,
+                            0, 1);
+    if (ret) {
+        return false;
+    }
+
+    kvm_state->kvm_dirty_ring_with_bitmap = true;
+
+    return true;
+}
+
 QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
 
 uint32_t kvm_arm_sve_get_vls(CPUState *cs)
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 99017b635c..402281e61a 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -282,6 +282,13 @@ void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp);
  */
 bool kvm_arm_steal_time_supported(void);
 
+/**
+ * kvm_arm_enable_dirty_ring_with_bitmap:
+ * Returns: true if KVM dirty ring's backup bitmap is enabled
+ * and false otherwise.
+ */
+bool kvm_arm_enable_dirty_ring_with_bitmap(void);
+
 /**
  * kvm_arm_aarch32_supported:
  *
@@ -395,6 +402,11 @@ static inline bool kvm_arm_steal_time_supported(void)
     return false;
 }
 
+static inline bool kvm_arm_enable_dirty_ring_with_bitmap(void)
+{
+    return false;
+}
+
 /*
  * These functions should never actually be called without KVM support.
  */
-- 
2.23.0

