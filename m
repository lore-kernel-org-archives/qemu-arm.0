Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp298170lfq;
        Wed, 16 Sep 2020 02:26:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlUUrDjzm2OVptCYeThIDe/h0UuEpxR5rQQ/W3td9zmlz62nu6AYMFiAumt8/dTokacvjR
X-Received: by 2002:a25:aa46:: with SMTP id s64mr23879998ybi.115.1600248417607;
        Wed, 16 Sep 2020 02:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600248417; cv=none;
        d=google.com; s=arc-20160816;
        b=sy/ZBGQfEyaCfRrGgHibARhBq/l8uqSrwnKAikBFfLh33pg029ToK2OhiPnGYwga5E
         Tz6AHptB+Rj02Fs2U3slVHjh7bNU+u8dOyeY/O2sg1Yq03+RKEps020Zq4uvzi7tY/OQ
         kg4so+o/wee5msibe45G+PA1XM+tlyApxf1YHys1ueNZnZzdwg0IbqblPIYxL5u1zZ1H
         jITT0OJegaAB0xCRIhm0nc7jqn3Xv8EMnw+wMHuoPlWU7TRT9sH4I/D7HCoJcZscavr9
         sAgIHx+NGSQ2dEHAZ4m5RSEgCpB8qe0vS7mzP8AtTZeh/5qPWq5r7D/dDccNR6z7TLWX
         pK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JYA+zFKDmKH8V8HXIMs/oeL/JdVQqc9A9vJ3k5IO9KY=;
        b=fpSwgqwQgm7myKDzf7spzqRT+t5AaZsLGGsthnIlzByqDkE+Suir+knYB7o3KWF2oI
         UgHonwzNyJjy/WEovRMkEHFhswI/coramiMOSUU38WQ5ldnX//ZU+CbS6guvOa7LAxvp
         1DWFi76y9qFMr+Ui5DqazE2HkT8V4RPiiqNK0gSHYfb79P+iMRM2S0UGRJhB5HCeLc7P
         SDPt5IF13Ikj6iiWla/5iKD2YUfGtNbwpvhMBeAXuCvowzKS1erQdObRA/ov00nnx6ZH
         GgMUz0G44OVPdv8Q8ivz6XqraCeEl+7YC62UD+NozIBrnlAkO8XvKwP5J2+076Ra7XKC
         2ZnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MLk3Zos5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si18178600ybc.201.2020.09.16.02.26.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 02:26:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MLk3Zos5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kITiL-0008QG-1Y
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 05:26:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kIThz-0008Om-EA
 for qemu-arm@nongnu.org; Wed, 16 Sep 2020 05:26:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27207
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kIThw-0005Ea-VL
 for qemu-arm@nongnu.org; Wed, 16 Sep 2020 05:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600248392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JYA+zFKDmKH8V8HXIMs/oeL/JdVQqc9A9vJ3k5IO9KY=;
 b=MLk3Zos5ujmKkc8/ttKTlW4nHOnxtdz/b3mAP/foxKYupLcHU1X6ce56xpMSA8SkQqhwrV
 kKgBtt71Q+Vaajv8qpR8gixvlgLLEHWRQnz7ImZVQWZT5gvHdmOKAPROseOZDRHrpHinVh
 BXTxbfvRsYbDze3EwtbIjw2XOgpM57M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-JY-Yn2hBNVOsGrQIge6Ekw-1; Wed, 16 Sep 2020 05:26:30 -0400
X-MC-Unique: JY-Yn2hBNVOsGrQIge6Ekw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36873801ABD;
 Wed, 16 Sep 2020 09:26:29 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB8855DE86;
 Wed, 16 Sep 2020 09:26:27 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v3 1/5] target/arm/kvm: Make uncalled stubs explicitly
 unreachable
Date: Wed, 16 Sep 2020 11:26:16 +0200
Message-Id: <20200916092620.19161-2-drjones@redhat.com>
In-Reply-To: <20200916092620.19161-1-drjones@redhat.com>
References: <20200916092620.19161-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 03:05:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wDOom08mYkXf

When we compile without KVM support !defined(CONFIG_KVM) we generate
stubs for functions that the linker will still encounter. Sometimes
these stubs can be executed safely and are placed in paths where they
get executed with or without KVM. Other functions should never be
called without KVM. Those functions should be guarded by kvm_enabled(),
but should also be robust to refactoring mistakes. Putting a
g_assert_not_reached() in the function should help. Additionally,
the g_assert_not_reached() calls may actually help the linker remove
some code.

We remove the stubs for kvm_arm_get/put_virtual_time(), as they aren't
necessary at all - the only caller is in kvm.c

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/kvm_arm.h | 51 +++++++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index bc178eeb84c0..f513702176a7 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -344,18 +344,10 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
 #else
 
-static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
-{
-    /*
-     * This should never actually be called in the "not KVM" case,
-     * but set up the fields to indicate an error anyway.
-     */
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
-    cpu->host_cpu_probe_failed = true;
-}
-
-static inline void kvm_arm_add_vcpu_properties(Object *obj) {}
-
+/*
+ * It's safe to call these functions without KVM support.
+ * They should either do nothing or return "not supported".
+ */
 static inline bool kvm_arm_aarch32_supported(void)
 {
     return false;
@@ -371,23 +363,44 @@ static inline bool kvm_arm_sve_supported(void)
     return false;
 }
 
+/*
+ * These functions should never actually be called without KVM support.
+ */
+static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
+{
+    g_assert_not_reached();
+}
+
+static inline void kvm_arm_add_vcpu_properties(Object *obj)
+{
+    g_assert_not_reached();
+}
+
 static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
-    return -ENOENT;
+    g_assert_not_reached();
 }
 
 static inline int kvm_arm_vgic_probe(void)
 {
-    return 0;
+    g_assert_not_reached();
 }
 
-static inline void kvm_arm_pmu_set_irq(CPUState *cs, int irq) {}
-static inline void kvm_arm_pmu_init(CPUState *cs) {}
+static inline void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
+{
+    g_assert_not_reached();
+}
 
-static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map) {}
+static inline void kvm_arm_pmu_init(CPUState *cs)
+{
+    g_assert_not_reached();
+}
+
+static inline void kvm_arm_sve_get_vls(CPUState *cs, unsigned long *map)
+{
+    g_assert_not_reached();
+}
 
-static inline void kvm_arm_get_virtual_time(CPUState *cs) {}
-static inline void kvm_arm_put_virtual_time(CPUState *cs) {}
 #endif
 
 static inline const char *gic_class_name(void)
-- 
2.26.2

