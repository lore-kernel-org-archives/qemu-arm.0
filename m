Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp434309lfy;
        Wed, 5 Aug 2020 02:18:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxanlA2NuHPRvXu+yCEebHZsg10WZxYe411Vz26bdGpjerkVb+EUV8xt5rHEa1MnXE+t4PW
X-Received: by 2002:a25:be45:: with SMTP id d5mr3317124ybm.444.1596619101683;
        Wed, 05 Aug 2020 02:18:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596619101; cv=none;
        d=google.com; s=arc-20160816;
        b=HjV/Gf/o/ok1ivZn9Irs054OsXU7xoArcFktlZB2iqjhg85it5k2boctqCTHKLraST
         c4OAOPTn4aHp64Fha8MB7DOsi5KCMM5gdJVAj12h2YRAse0NCAGyUjVsHcIvmjHn/FQh
         zo0teQRM5xZg8oUfTp0KIRh16+NF6sUJQhRV66FQO9KT9otWO/PgcPl5r17W11/kXXFj
         jg+vAO81qwmMZzDNPPHHey52gl/Dr+N1sx8dzRaIf1HO5k7M3XFMJx02rjnjZKwgLdod
         7PC/QM5SVhJzPxfK7i8cXRMi82TI4w4NI2AoPgor+fFkGJOcKNDaTkLTSkha6znld0S5
         GEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RaBgmbtPTVZPc9Dfy2dHqvHe+ifm4ZctTlglyls1p9k=;
        b=mhBGno7GOGKo1K4RZkpdoF3/5yQ11iveDKPqRoo3kbZv0LSrcGSk64zCeAfgRgpGrC
         tgLK4nktht0vC7k7y1ycVfVHhP93OMTRIWO3vWcrbcPdEN9x91zoAs15VOq9Y0a4YmPR
         IrB2WVJYIKz+ZiMAYWhEif0kC84tzl+dVybzZVCUTdWLqQQT7Lk36sFyoei80Im7W2TQ
         6kVHm4gBxqpAKKmFAoKK17uDU/NBH7UfeJPbe76TzmQHdupVGoGSDdrxx8aT2uwdSswD
         zZq85v0hTgfpP1J6XUead48JB78B7HYJaLCk7EnFo9V2v7BddM6xEkdDs+ZTE8Rw8/0x
         yhig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ebuHmTJm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si1494467ybt.102.2020.08.05.02.18.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Aug 2020 02:18:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ebuHmTJm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3FYz-0000o0-3W
	for alex.bennee@linaro.org; Wed, 05 Aug 2020 05:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k3FXZ-0007Dz-90
 for qemu-arm@nongnu.org; Wed, 05 Aug 2020 05:16:53 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:28120
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k3FXX-0003j6-3m
 for qemu-arm@nongnu.org; Wed, 05 Aug 2020 05:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596619009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RaBgmbtPTVZPc9Dfy2dHqvHe+ifm4ZctTlglyls1p9k=;
 b=ebuHmTJmcWZGQo8OE+yzvc6PNWv2syBYDKnuNMqFyCURbRYlDbmPda/oIfywwyHwuD6LS0
 hJikxKD+aK3XxHveJ7DM4f72nL91rxFgW8yT520d2NXM+2dswvdbTEZZ+pv//LkL14ri82
 UDdJ9BacwJqSY+XLLB1WTn5svWP52FA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-HPfPi3m4OBK3opOw05WMGg-1; Wed, 05 Aug 2020 05:16:47 -0400
X-MC-Unique: HPfPi3m4OBK3opOw05WMGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33258E918;
 Wed,  5 Aug 2020 09:16:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E935E2DE66;
 Wed,  5 Aug 2020 09:16:44 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 2/5] target/arm/kvm: Make uncalled stubs explicitly
 unreachable
Date: Wed,  5 Aug 2020 11:16:37 +0200
Message-Id: <20200805091640.11134-3-drjones@redhat.com>
In-Reply-To: <20200805091640.11134-1-drjones@redhat.com>
References: <20200805091640.11134-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 03:37:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZNzn4JW3r9iB

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

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 target/arm/kvm_arm.h | 44 +++++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index adb38514bf20..0da00eb6b20c 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -344,16 +344,10 @@ int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
 
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
+/*
+ * It's safe to call these functions without KVM support.
+ * They should either do nothing or return "not supported".
+ */
 static inline void kvm_arm_add_vcpu_properties(Object *obj) {}
 
 static inline bool kvm_arm_aarch32_supported(void)
@@ -371,23 +365,39 @@ static inline bool kvm_arm_sve_supported(void)
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
2.25.4

