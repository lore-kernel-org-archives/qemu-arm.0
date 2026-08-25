Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD4FC61DC4
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:03:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzE5-0005nz-M1; Tue, 25 Aug 2026 18:02:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzD8-0003jL-9H
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:38 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzD4-0001l6-WC
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:37 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-38ec1402b05so419260a91.2
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695294; x=1788300094; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6PlYTxLys8FyXXQC36kcwbteM/tzVHbDeJa1sLv5MJI=;
 b=Sf/0mPBsFaUCyB6TnYtGB8M6/r6tC/HRn4/PHBOhuhDNKsIXUVXoQjPQN6S6ev9ORf
 Tz/dZ4ksAVdef//U40XHpFEbtu6k7um6clLh1IvxJLiwXssNAeiqSwqToYqhNsO+7NR2
 bipYpaX7KqZRJydJXh7iTHvmtl7qlf1wURUBP8OMZwbazZ2Vi4CGiePQmA6kB3t1uSJC
 jLck1pOn+TBT4EGTCO3zZN1VMtqTQzBCB7l2pQbkSa2eViVdc+rqm3myU223u4j1i7ok
 A5aaqeX5g3Vm4bsxgVtUcChJpqHmsavzRqtg9hngpCFaJEwFLo1MpphrifvfIJ21Nmli
 GgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695294; x=1788300094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6PlYTxLys8FyXXQC36kcwbteM/tzVHbDeJa1sLv5MJI=;
 b=ZebsnaCYgOleSGBlGU78yOnyYAd5hFzVOnQq731H2RXj3jF8eYsFeMYmKS6pYfgK2j
 rW8qqkNda66QLpCI1OIcupbIg+IeBhM47YNd+a4x218Na+1gMmfG7OuHqy2RIfRFbsQy
 2UdrNpTXavTrnhxY2w2fAzXdfABjXL98rwyXUplrB2d6R+CYpxSn05QNjEd7soW6x22y
 DTXz8Hm48KS9GPDPUkt2E7zk9vfiIzzEFqhY0pj5Va5aBgolFcUKU0iob++Ialx6GjjR
 NTiNW6t0vsT2CHrMB5qlZfQy5y6I6HCnz3ZnblBGQ3Pyi+fqiKSFY3KRePrGseLKCOhi
 sPgQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpxa63FxSt5RaYwbNF4Y6TfwcionU1pUn8kvawoNMyGQdK3jSUIRuqoUu4F879qtCdomS1jJVUBgw==@nongnu.org
X-Gm-Message-State: AFuF++mt3iEnXloNwBS+HMS6m8OYUdefnBwnM4XaK8Nli/jT5WWu7Hav
 7RUGyNDWD6Cn3mZ5xWseGkcXr/wLm6BKCMAJXQkyLerfiLNycQbYxFxutiVjiLmUOmc=
X-Gm-Gg: AR+sD13/+P6pcu29u5SS2mZ+kUxpX8yZschOYvkfd/jYvImY4V0fiPRdK3iJ1NMNBZw
 vztDjJk7DwBXuyZHs15b3u/42xYAKypzMsh+Xgov7lTE4gCjntVDGWbr9IVhz3LKlEKkK9fcsMS
 6JgsBDR0LwKXc3NPFVjW1dnRcnCtEkWfj8zG3GmiIo9jx5uQSK14b42YTqy5J4NGAXdt/JDpAR/
 3rSIvIZby9Wh5rR8249sZ4cPAgAKK6fWNA5DkFxEboLa5KMpZbxv+GdDtMPJWJ/tXslYKd3n7wl
 u1YC9t2V5uauDTCPRRXxsWcVX2gzVsKroqW0sDwqp6VMort98BS4zTCgy2EOTAh1vnBdtX44yuj
 va5RN8PVcxWCMAcjmPSTxJJ2dnhXK/ztkDgUSdWJsOeYJUn7XXJI9Mr1yXc39yYVM1/KAgT4R/f
 BBc7nTjIL03lMiNvw8PoZp93iPqbzVotCsC95HJ9+qBBzkVCDebTI5ohXyAf9ACG9lQeyG1ohVa
 lYDdtqLp/yLcXH95KRBhHLPNg==
X-Received: by 2002:a17:90b:164b:b0:38e:6a44:671b with SMTP id
 98e67ed59e1d1-3966cdf6813mr4226592a91.0.1787695293024; 
 Tue, 25 Aug 2026 15:01:33 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:32 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 13/24] target/arm/cpu: Set number of PMU counters in KVM
Date: Tue, 25 Aug 2026 16:00:50 -0600
Message-ID: <20260825220101.3443954-14-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Add a "num-pmu-counters" CPU parameter to configure the number of
counters that KVM presents to the guest. This is needed for Realm VMs,
whose parameters include the number of PMU counters and influence the
Realm Initial Measurement.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/arm-qmp-cmds.c |  2 +-
 target/arm/cpu.h          |  3 +++
 target/arm/cpu64.c        | 41 +++++++++++++++++++++++++++++++++++++++
 target/arm/kvm.c          | 34 ++++++++++++++++++++++++++++++++
 4 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index 9ed65eb090d7..9350dc30d12f 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -76,7 +76,7 @@ static const char *cpu_model_advertised_features[] = {
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
     "kvm-no-adjvtime", "kvm-steal-time",
     "pauth", "pauth-impdef", "pauth-qarma3", "pauth-qarma5",
-    "num-breakpoints", "num-watchpoints",
+    "num-breakpoints", "num-watchpoints", "num-pmu-counters",
     NULL
 };
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bc21291eb3e5..da46254ae0c4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1161,6 +1161,7 @@ struct ArchCPU {
     /* Allows to override the default configuration */
     uint8_t num_bps;
     uint8_t num_wps;
+    int8_t num_pmu_ctrs;
 };
 
 typedef struct ARMCPUInfo {
@@ -2109,6 +2110,8 @@ FIELD(MFAR, FPA, 12, 40)
 FIELD(MFAR, NSE, 62, 1)
 FIELD(MFAR, NS, 63, 1)
 
+FIELD(PMCR, N, 11, 5)
+
 QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <= R_V7M_CSSELR_INDEX_MASK);
 
 /* If adding a feature bit which corresponds to a Linux ELF
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 72c0176420fa..d46d6789d886 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -737,12 +737,53 @@ static void arm_cpu_set_num_bps(Object *obj, Visitor *v, const char *name,
     cpu->num_bps = val;
 }
 
+static void arm_cpu_get_num_pmu_ctrs(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    uint8_t val;
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    if (cpu->num_pmu_ctrs == -1) {
+        val = FIELD_EX64(cpu->isar.reset_pmcr_el0, PMCR, N);
+    } else {
+        val = cpu->num_pmu_ctrs;
+    }
+
+    visit_type_uint8(v, name, &val, errp);
+}
+
+static void arm_cpu_set_num_pmu_ctrs(Object *obj, Visitor *v, const char *name,
+                                     void *opaque, Error **errp)
+{
+    uint8_t val;
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint8_t max_ctrs = FIELD_EX64(cpu->isar.reset_pmcr_el0, PMCR, N);
+
+    if (!visit_type_uint8(v, name, &val, errp)) {
+        return;
+    }
+
+    if (val > max_ctrs) {
+        error_setg(errp, "invalid number of PMU counters");
+        return;
+    }
+
+    cpu->num_pmu_ctrs = val;
+}
+
 static void aarch64_add_kvm_writable_properties(Object *obj)
 {
+    ARMCPU *cpu = ARM_CPU(obj);
+
     object_property_add(obj, "num-breakpoints", "uint8", arm_cpu_get_num_bps,
                         arm_cpu_set_num_bps, NULL, NULL);
     object_property_add(obj, "num-watchpoints", "uint8", arm_cpu_get_num_wps,
                         arm_cpu_set_num_wps, NULL, NULL);
+
+    cpu->num_pmu_ctrs = -1;
+    object_property_add(obj, "num-pmu-counters", "uint8",
+                        arm_cpu_get_num_pmu_ctrs, arm_cpu_set_num_pmu_ctrs,
+                        NULL, NULL);
 }
 #endif /* CONFIG_KVM */
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ff5034397746..85c9cbd57114 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -957,9 +957,43 @@ static void kvm_arm_configure_aa64dfr0(ARMCPU *cpu)
     }
 }
 
+#define KVM_REG_ARM_PMCR_EL0            ARM64_SYS_REG(3, 3, 9, 12, 0)
+
+static void kvm_arm_configure_pmcr(ARMCPU *cpu)
+{
+    int ret;
+    uint64_t val, newval;
+    CPUState *cs = CPU(cpu);
+
+    if (cpu->num_pmu_ctrs == -1) {
+        return;
+    }
+
+    newval = FIELD_DP64(cpu->isar.reset_pmcr_el0, PMCR, N, cpu->num_pmu_ctrs);
+    ret = kvm_set_one_reg(cs, KVM_REG_ARM_PMCR_EL0, &newval);
+    if (ret) {
+        error_report("Failed to set KVM_REG_ARM_PMCR_EL0");
+        return;
+    }
+
+    /*
+     * Check if the write succeeded, since older versions of KVM ignore it.
+     */
+    ret = kvm_get_one_reg(cs, KVM_REG_ARM_PMCR_EL0, &val);
+    if (ret) {
+        error_report("Failed to get KVM_REG_ARM_PMCR_EL0");
+        return;
+    }
+
+    if (val != newval) {
+        error_report("Failed to update KVM_REG_ARM_PMCR_EL0");
+    }
+}
+
 static void kvm_arm_configure_vcpu_regs(ARMCPU *cpu)
 {
     kvm_arm_configure_aa64dfr0(cpu);
+    kvm_arm_configure_pmcr(cpu);
 }
 
 /**
-- 
2.43.0


