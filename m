Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79640CA5FE6
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 20:22:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCjkY-0007NP-Ok; Fri, 02 Oct 2026 16:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkU-0007Kh-5j
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:54 -0400
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xCjkR-0005nC-F0
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 16:20:53 -0400
Received: by mail-pj2-x0c.google.com with SMTP id
 d9443c01a7336-2dfaf76605dso4695ad.0
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 13:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790972449; x=1791577249; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6DwGY+dTgmWXHvT/Uc+wVJeKOjzNv5zK48BpM+cp2kU=;
 b=vPfheEzlQFm5a5PAZgy3PWzasfinnanLp0LA4ApLqHfaj/LV3i/8kDW3dplYToW8yr
 aX0isH/l8zDs6T1WR65GosPYVTF9p6kGdftwKrhxs1dwqVI25I2BQ8clerARxQLCI+Hr
 82n3Iu1e61IwSS8v3EU3DRqndpWnNTLxnn1YjZj/yaig8e7Vw+MuYpN6SFePfHThR9IJ
 QpW+VGUc2CsdobGZHI4whCUomWgluSRKuPzYXUQA7zuShs+rMzea6AubJHlNoHywQgIb
 mgNBNjPQY0FiCOjcj/0gKbtWmv4uGhMsNFWArxZ9bQcwI7CvKqZxYdbqVCCYboQucnt8
 Qcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790972449; x=1791577249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6DwGY+dTgmWXHvT/Uc+wVJeKOjzNv5zK48BpM+cp2kU=;
 b=SLhyREFEHmcXlH+fwzF0p/F4//kdcCZBOsvMUjaPt0NSy3Jul2xtgCred29v1IINJ8
 Uzn582j6QBtI7Zg2rPjO+WPbCM6xpA2ue8LbRIwAVS5msnmFwj2ChP6dXLU4OcgCrjlc
 XDxcxvU8QJFlF92Md4wIx1nUh80uTfuQgQRXDxyMYG3Lq2/kFEA4sjmFeySv+8hlVZec
 QmW2oKJJfPC+y9EE/BMQdUX4EKW9yQV5ETAVT+l/U1pHiEzWqwnupqxMfimElwLIJHlz
 wIaTGNejPxa2Ji9CDtr44ElwTNLUIYZquA4UEytl7dFAWMlyqSDE6OqCOvACu+yr7Mac
 JbhQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwRlA8soEkqkV1xmzERCOrbFVBxua/igFAW8SL7sjVluxKm9YrJOiIv+vNmBsUm2rrXwdukUpDfeg==@nongnu.org
X-Gm-Message-State: AFq9FYIO6CnoHAi8IXgO3s3wLA9I/m+AseSz2TH8XH/dlywW7TbOsZfO
 +YHanNhoQun4o+w/HNCgIFggagNPbuAur9ZmMGAx6+WXniyYtJWdmJXe7Me1llt5J/c=
X-Gm-Gg: AYBFou2lGPfgmeko4RMqbZ0yi8reFLnWXSAhKG5Juhsg2zS1Repg0SLSyPjj99ATon/
 /3m/l9foFGkuvzSa9vq4DErstMjvMgHDDcRnP4ezn/FtijNWqmVXf0DtNjHD3Kv4IIOQRdcSqTe
 rcETtoTHyRz/Qb+5n+iqQOlHOHKC2UwGRkZajlK+y+eozcRZIzzfh1AIhOJKi/B2HK9cf1fGxPc
 WxHHOkz9oOuqJeJ7Kd+7CJN84iQd8F9MXreqS4b3tZixuGi5ySow4rB3jgaJvWmdjTytw70MWqB
 mew0j/PIoZ7eu5ldnf8RPvN6K0aCyfxDtK3mLveFN5iORomWgR+pbL4M+ElsiunjJ7j1eGcdGKH
 2r/CqrwEeYU5njDsapm3odemP0OwGwFoGsO6PsWYxd5Jsqk/jmlRIOxoJi7kdYYlb5Q/E3uuejS
 LpoBQ3gg24HALitFp8/DItWDksSCv3xIyvxxxzl60yU1eDyI4zkBBXHSZM7cVlgUGnEdgvVI3pc
 iCA96ShVmcEeHhQdoXRjigN
X-Received: by 2002:a17:902:ec92:b0:2dd:8e7d:90f7 with SMTP id
 d9443c01a7336-2e49b6052bfmr37376585ad.9.1790972449156; 
 Fri, 02 Oct 2026 13:20:49 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:61ac:e744:6559:a357])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e49f6a99acsm12399415ad.34.2026.10.02.13.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 13:20:48 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v5 11/22] target/arm/cpu: Set number of PMU counters in KVM
Date: Fri,  2 Oct 2026 14:20:15 -0600
Message-ID: <20261002202026.1204110-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
References: <20261002202026.1204110-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::c;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 2e41c2be3b71..a5b8b7ccc70b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1201,6 +1201,7 @@ struct ArchCPU {
     /* Allows to override the default configuration */
     uint8_t num_bps;
     uint8_t num_wps;
+    int8_t num_pmu_ctrs;
 };
 
 typedef struct ARMCPUInfo {
@@ -2158,6 +2159,8 @@ FIELD(MFAR, FPA, 12, 40)
 FIELD(MFAR, NSE, 62, 1)
 FIELD(MFAR, NS, 63, 1)
 
+FIELD(PMCR, N, 11, 5)
+
 /* If adding a feature bit which corresponds to a Linux ELF
  * HWCAP bit, remember to update the feature-bit-to-hwcap
  * mapping in linux-user/elfload.c:get_elf_hwcap().
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 483441dfabe3..22a8394a9f4e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -745,12 +745,53 @@ static void arm_cpu_set_num_bps(Object *obj, Visitor *v, const char *name,
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
index 1acf62545e7a..28d00f520e9f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1000,9 +1000,43 @@ static void kvm_arm_configure_aa64dfr0(ARMCPU *cpu)
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


