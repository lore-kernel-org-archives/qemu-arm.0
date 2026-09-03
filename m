Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32880C624D7
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 19:40:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2DEo-0001UR-36; Thu, 03 Sep 2026 15:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEm-0001TZ-SA
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:40 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEk-0004Ep-TD
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:40 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-3969e82ff8fso233781a91.0
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 12:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788464197; x=1789068997; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZyMMTgmt2sQTNt+w2rcYuEGgP51if0I05nXqeLHxTK8=;
 b=Mc3zsmV/Ivpl+ipGalinFGdd7kgP5g+7wFY/8L5ml2KBsGAsHYi5kJxBTra2UggUGs
 w66Dmy9jfhGH930PW+R6aLEGZDrGQO+KFaAHmuqgk3jzu/yCYG3ejdz5K4IcFFlErEec
 +TDRkk/m0UjuxvF9kkgp6veZu7cEfqAmsgLp3SDOFa/lMKG+N2yFHNImgBdAxE7nDTNs
 XGgjkH0jCv02cQSEUQvhT8cCkDcog5dHNlNYz5PbDZXAs9PLyQ+7zFIeIt0nig7OnKCY
 wLG+C8aw+CV8Lt6s0gTtIvrW9GQ+DWa7Y1iB5WMKqYLE+LNHCQ+r9mY3R46L7cM1cyy3
 wqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788464197; x=1789068997;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZyMMTgmt2sQTNt+w2rcYuEGgP51if0I05nXqeLHxTK8=;
 b=YeXU0eTvvJgPAdneh/dUTI2WAJ+r3nJurmqdkyZlpx59hi1Pr0FxyatQc8RjdVPCJK
 VTVVBJr2WJRCj/K1byAbJNPS+CEDBwHiMNceWH1Gc0sIJ9R6PBrSN9I6d5ev71EMPkAz
 MaBcUx1RnfP2P6qcwa27HvSvbENInW4OiOwymoPiIn8Vk1UP3vKb+KrTTuIR9nazq2id
 D4BVHB5aghgSOFrRGmzO63wuUTI9yZt3RYzk7daNFVLzBfmgHxHJy779cRO1xEUQ/acF
 ks+XI63SvTH2EfwTZHZ4hl2kl8zdP/GCTqPNwPANIk5n2P3ytta8FHdhWsJ5MCDnQbCM
 ebvA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxkx6+p2aCyWQnbYN9nozzQqkXJTQ5pY7bXgQMP5fIEFqTap17ubKNcY/hDgxALa5tpT24fvznrWA==@nongnu.org
X-Gm-Message-State: AFuF++kEqVZ90xkxL/S74nffTvhgxKGQXcn03fKGVkVKeoYSjVGwXep8
 b/LgJTYbYICf0q8M+70sHf+etprsq2XPgyMlCfrI9Oaz+dGyic7D4HAONk15XKt+zRg=
X-Gm-Gg: AYBFou3+TxRh3pYM9e9rocJTybwjkStc7KHbk6y6wu4cdO9FgGRt9jRXBV38gVpZ5lz
 M+UvvEPeNBiw8qiRXq/tRK+MkuEkX1FC121WJe+1neqcRwcZ+t9chsKkZLyIzXRIobwOfzD1AVG
 N2qug2RaMRYfnMaGBaqIHk9Qvxv6UGE0Gf++luPo/AIIilv2AuuibbCL5wJfu0LBL6bwSF/DOpB
 Rtomxr2B7+V0kaW+E419bG6j2vjE66iPqbxhJ337N3ry/HGJ/MR+bd4EVLWAspM2esesquauQ9Z
 ySRvNr1oRxDBHNyBMUYfLOe9p/U4/O1R7oXVczkJ2bcMb+U7zWwNU5yarVDfHMbST+YcE3RHFKB
 CvZymuNnlgIqa+SutFqlfqgSSCIQ+QrBE0wGTGKxvOSCsqI+iORVojfuvL2PuiO8YSdoUJaW0Pw
 6Nnu1R5RgvSuh4gpaE7GlJQozjdOdTvMrBulaQhUG/DvEbdsaoGng3i0Op3VYc6WZeBN1AOb8R0
 ou/qUboj6cei4o=
X-Received: by 2002:a17:90b:528e:b0:38e:ad9d:1161 with SMTP id
 98e67ed59e1d1-39b25ee67f0mr1432023a91.0.1788464197492; 
 Thu, 03 Sep 2026 12:36:37 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b083e4fafsm6836951a91.1.2026.09.03.12.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 12:36:37 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v4 13/24] target/arm/cpu: Set number of PMU counters in KVM
Date: Thu,  3 Sep 2026 13:36:00 -0600
Message-ID: <20260903193611.1058589-14-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
index d256d66a3e1b..608c5e0124b9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1177,6 +1177,7 @@ struct ArchCPU {
     /* Allows to override the default configuration */
     uint8_t num_bps;
     uint8_t num_wps;
+    int8_t num_pmu_ctrs;
 };
 
 typedef struct ARMCPUInfo {
@@ -2133,6 +2134,8 @@ FIELD(MFAR, FPA, 12, 40)
 FIELD(MFAR, NSE, 62, 1)
 FIELD(MFAR, NS, 63, 1)
 
+FIELD(PMCR, N, 11, 5)
+
 QEMU_BUILD_BUG_ON(ARRAY_SIZE(((ARMCPU *)0)->ccsidr) <= R_V7M_CSSELR_INDEX_MASK);
 
 /* If adding a feature bit which corresponds to a Linux ELF
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 18adb06d78ad..3581268cd718 100644
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
index 93686b038263..b8cb04f7eeb1 100644
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


