Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A5EC61DD3
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 19:39:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2DEm-0001Ta-Re; Thu, 03 Sep 2026 15:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEl-0001SI-9b
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:39 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEj-0004E6-A5
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:39 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-cc1cb472b76so325531a12.0
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 12:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788464196; x=1789068996; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HmGpSn5np7qxh7tTF9vO+IGJge7cylIvjl4owtZOfJ8=;
 b=TuSsFzMmZw8CoY4B0GVJzdwt/eZGCCnUHMz+iU+b0rsWyhituhYQ5mhRFNMm6lzY36
 tE56Yu3Wwpu0b5at4/zogiCM9G5S70RIbVf/agvAzCDCRJ5f9jqcYnUy8Rj1Qr9kscsE
 qM4VBSj4g/hZCl1WnkKWXBIEuh3qGa9Au77OvtzaHoLqW6U0jggzOKW9V9Z9FBR6YsX3
 ddA2UGs2CL3LjGkczScYc2YvlGerLjElRUvPfVY8LTYPP1LukX0ev5NgVr8V1WcnCwg9
 6VBnRIBTMTiOwbcXBxDQ0drCXXqjsMmyPvwgFir/btqd6B00wYRrkf53U8TwmL68xCek
 ljCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788464196; x=1789068996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=HmGpSn5np7qxh7tTF9vO+IGJge7cylIvjl4owtZOfJ8=;
 b=D6jtA8jVXt+wa1e+SpJUaxVVbCLTkgN+/IZMz4Ewg0qXIPN3WdhgVBOaYxekuxDL4E
 SPmm/Xp3Hzt3jfPERF08sPS5EMzCg7yhrrJaQbyXj3TR3z2F+coUkDZKz87V37GjXtBk
 hWp89VL96/ydbnW1Rtve07d43zNzlMzcZSVQ0+kMnJIIdjJBKFGMP/dvRAXcniBB0f8Z
 c4f3R4XMNT1dRQ/2a9fGjKZ9czZK8uCoKuhKzPnaPnV5k5bpBYPVaUsmPMc7MtTNgNrk
 IB3TN4bBYchyTATOIvsuLdzf6nk0cgNdWTxJX03HyDxSo21MVPbvL3DME5twClX8C7Vq
 oCJQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzgjAG36GhZOlMjYKIXi7QsshRiRusHa/cuQFhXFXK9b2amjHAXs3B3NBt9mksGLVMjeUdEdATASg==@nongnu.org
X-Gm-Message-State: AFuF++li8L8tgU3RGjbsGR1og5SjpQKbH7mlo16mXhG7hbypdXmvZ8+q
 Iii+GhCTTeDhmEUKQno0EDN5ka0/uL3/dAKeaBaYeueXKvZom99qq0Ze8URYJKLET8U=
X-Gm-Gg: AYBFou2870weFxopjGt1n6bAxTohMd9D6ADjozeI/qp1P49DhAAX7yH07hoVRbIW5sj
 nPEIiOeO6IxQZzVLVSTCCgkp6Ywtiw0WRuVPlJGnK0UPWMdZWZOHXdox07PUfWqBIZpcVpz2fkQ
 w5jh/jPcmFefxAZB+2xrJ5dfFxvGPEgmabdyZPze3baft57mbkDQUna0oyBPGtTUTXr/qWoY23j
 NbRN593MrTpP6JRTAK49AcyM1sZUPBdfCV2V2Yn/Z7+4LBu7omAc7USZMY+OpiY8QleUSVTWuZa
 A1lRcKaVLysqKyYiFHZ2GcCe1euyJ8Ut6HROXxpFdnAbvHDakKgq894Gy2Qskhl2qYt3VsuFwXq
 9beylcD7j+gxxEmQNo5VGGlDQsHoxJg0dkhuT6R+1+fIlDyWPMWhRIm0wSjw8LsqfKVwhoBGusz
 gRw+mSN9igwOrFLXjJSyp19grHJYveeMA8y7LJ1iDsEjQ7UwWtpHYesjQpjUi8t3HYHHzbetS8d
 Td6jn7/KfUTgYI=
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id
 98e67ed59e1d1-39b261002f5mr1254010a91.6.1788464195615; 
 Thu, 03 Sep 2026 12:36:35 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b083e4fafsm6836951a91.1.2026.09.03.12.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 12:36:35 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v4 12/24] target/arm/cpu: Set number of breakpoints and
 watchpoints in KVM
Date: Thu,  3 Sep 2026 13:35:59 -0600
Message-ID: <20260903193611.1058589-13-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pg1-x52b.google.com
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

Add "num-breakpoints" and "num-watchpoints" CPU parameters to configure
the debug features that KVM presents to the guest. The KVM vCPU
configuration is modified by calling SET_ONE_REG on the ID register.

This is needed for Realm VMs, whose parameters include breakpoints and
watchpoints, and influence the Realm Initial Measurement.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/arm-qmp-cmds.c |  1 +
 target/arm/cpu.h          |  4 ++
 target/arm/cpu64.c        | 81 +++++++++++++++++++++++++++++++++++++++
 target/arm/kvm.c          | 56 +++++++++++++++++++++++++++
 4 files changed, 142 insertions(+)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index 83ec95c290f6..9ed65eb090d7 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -76,6 +76,7 @@ static const char *cpu_model_advertised_features[] = {
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
     "kvm-no-adjvtime", "kvm-steal-time",
     "pauth", "pauth-impdef", "pauth-qarma3", "pauth-qarma5",
+    "num-breakpoints", "num-watchpoints",
     NULL
 };
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6bbc942f9a59..d256d66a3e1b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1173,6 +1173,10 @@ struct ArchCPU {
 
     /* Generic timer counter frequency, in Hz */
     uint64_t gt_cntfrq_hz;
+
+    /* Allows to override the default configuration */
+    uint8_t num_bps;
+    uint8_t num_wps;
 };
 
 typedef struct ARMCPUInfo {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4e8c47253086..18adb06d78ad 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -666,6 +666,86 @@ void aarch64_add_pauth_properties(Object *obj)
     }
 }
 
+#if defined(CONFIG_KVM)
+static void arm_cpu_get_num_wps(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    uint8_t val;
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    val = cpu->num_wps;
+    if (val == 0) {
+        val = FIELD_EX64(cpu->isar.idregs[ID_AA64DFR0_EL1_IDX],
+                         ID_AA64DFR0, WRPS) + 1;
+    }
+
+    visit_type_uint8(v, name, &val, errp);
+}
+
+static void arm_cpu_set_num_wps(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    uint8_t val;
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint8_t max_wps = FIELD_EX64(cpu->isar.idregs[ID_AA64DFR0_EL1_IDX],
+                                 ID_AA64DFR0, WRPS) + 1;
+
+    if (!visit_type_uint8(v, name, &val, errp)) {
+        return;
+    }
+
+    if (val < 2 || val > max_wps) {
+        error_setg(errp, "invalid number of watchpoints");
+        return;
+   }
+
+    cpu->num_wps = val;
+}
+
+static void arm_cpu_get_num_bps(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    uint8_t val;
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    val = cpu->num_bps;
+    if (val == 0) {
+        val = FIELD_EX64(cpu->isar.idregs[ID_AA64DFR0_EL1_IDX],
+                         ID_AA64DFR0, BRPS) + 1;
+    }
+
+    visit_type_uint8(v, name, &val, errp);
+}
+
+static void arm_cpu_set_num_bps(Object *obj, Visitor *v, const char *name,
+                                void *opaque, Error **errp)
+{
+    uint8_t val;
+    ARMCPU *cpu = ARM_CPU(obj);
+    uint8_t max_bps = FIELD_EX64(cpu->isar.idregs[ID_AA64DFR0_EL1_IDX],
+                                 ID_AA64DFR0, BRPS) + 1;
+
+    if (!visit_type_uint8(v, name, &val, errp)) {
+        return;
+    }
+
+    if (val < 2 || val > max_bps) {
+        error_setg(errp, "invalid number of breakpoints");
+       return;
+    }
+
+    cpu->num_bps = val;
+}
+
+static void aarch64_add_kvm_writable_properties(Object *obj)
+{
+    object_property_add(obj, "num-breakpoints", "uint8", arm_cpu_get_num_bps,
+                        arm_cpu_set_num_bps, NULL, NULL);
+    object_property_add(obj, "num-watchpoints", "uint8", arm_cpu_get_num_wps,
+                        arm_cpu_set_num_wps, NULL, NULL);
+}
+#endif /* CONFIG_KVM */
+
 void aarch64_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
 {
     uint64_t t;
@@ -807,6 +887,7 @@ void aarch64_host_initfn(Object *obj)
     kvm_arm_set_cpreg_mig_tolerances(cpu);
     kvm_arm_set_cpu_features_from_host(cpu);
     aarch64_add_sve_properties(obj);
+    aarch64_add_kvm_writable_properties(obj);
 #elif defined(CONFIG_HVF)
     hvf_arm_set_cpu_features_from_host(cpu);
 #elif defined(CONFIG_WHPX)
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ca25b707a0a8..93686b038263 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -912,6 +912,56 @@ out:
     return ret;
 }
 
+#define KVM_REG_ARM_ID_AA64DFR0_EL1     ARM64_SYS_REG(3, 0, 0, 5, 0)
+
+static void kvm_arm_configure_aa64dfr0(ARMCPU *cpu)
+{
+    int ret;
+    uint64_t val, newval;
+    CPUState *cs = CPU(cpu);
+
+    if (!cpu->num_bps && !cpu->num_wps) {
+        return;
+    }
+
+    newval = cpu->isar.idregs[ID_AA64DFR0_EL1_IDX];
+    if (cpu->num_bps) {
+        uint64_t ctx_cmps = FIELD_EX64(newval, ID_AA64DFR0, CTX_CMPS);
+
+        /* CTX_CMPs is never greater than BRPs */
+        ctx_cmps = MIN(ctx_cmps, cpu->num_bps - 1);
+        newval = FIELD_DP64(newval, ID_AA64DFR0, BRPS, cpu->num_bps - 1);
+        newval = FIELD_DP64(newval, ID_AA64DFR0, CTX_CMPS, ctx_cmps);
+    }
+    if (cpu->num_wps) {
+        newval = FIELD_DP64(newval, ID_AA64DFR0, WRPS, cpu->num_wps - 1);
+    }
+    ret = kvm_set_one_reg(cs, KVM_REG_ARM_ID_AA64DFR0_EL1, &newval);
+    if (ret) {
+        error_report("Failed to set KVM_REG_ARM_ID_AA64DFR0_EL1");
+        return;
+    }
+
+    /*
+     * Check if the write succeeded. KVM does offer the writable mask for this
+     * register, but this way we also check if the value we wrote was sane.
+     */
+    ret = kvm_get_one_reg(cs, KVM_REG_ARM_ID_AA64DFR0_EL1, &val);
+    if (ret) {
+        error_report("Failed to get KVM_REG_ARM_ID_AA64DFR0_EL1");
+        return;
+    }
+
+    if (val != newval) {
+        error_report("Failed to update KVM_REG_ARM_ID_AA64DFR0_EL1");
+    }
+}
+
+static void kvm_arm_configure_vcpu_regs(ARMCPU *cpu)
+{
+    kvm_arm_configure_aa64dfr0(cpu);
+}
+
 /**
  * kvm_arm_cpreg_level:
  * @regidx: KVM register index
@@ -1128,6 +1178,12 @@ void kvm_arm_reset_vcpu(ARMCPU *cpu)
         fprintf(stderr, "kvm_arm_vcpu_init failed: %s\n", strerror(-ret));
         abort();
     }
+
+    /*
+     * Before loading the KVM values into CPUState, update the KVM configuration
+     */
+    kvm_arm_configure_vcpu_regs(cpu);
+
     if (!write_kvmstate_to_list(cpu)) {
         fprintf(stderr, "write_kvmstate_to_list failed\n");
         abort();
-- 
2.43.0


