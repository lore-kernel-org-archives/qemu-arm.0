Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A45D11705
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Dec 2025 16:11:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQSyK-0007wA-Vf; Tue, 02 Dec 2025 11:11:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vQSw7-0004xC-Rx
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 11:09:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vQSw4-00006s-QF
 for qemu-arm@nongnu.org; Tue, 02 Dec 2025 11:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764691743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1r6iwMV7OOxfpGBTEnAoro8MxvDg/dbyx+KBPvZFR2o=;
 b=QOBMOUbpeitCIvH9k8jaiPAxCwMjeBNH9vzzZE57lK+B+WMTAzh4v/La+FO20Mu0wRFUn7
 bof3pS/c88JaVJwcpriqGINyL4vn+UBLmftDPzmR9PMqlIxcFMn02lm9wue7u4QdZPCDBf
 l2bRk+nzVPHEBa6bYeJ7pzJMgmddfHQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-DW2ah2BGMxmtEGaKZajLCg-1; Tue, 02 Dec 2025 11:09:02 -0500
X-MC-Unique: DW2ah2BGMxmtEGaKZajLCg-1
X-Mimecast-MFC-AGG-ID: DW2ah2BGMxmtEGaKZajLCg_1764691741
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-477c49f273fso55262065e9.3
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 08:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764691741; x=1765296541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1r6iwMV7OOxfpGBTEnAoro8MxvDg/dbyx+KBPvZFR2o=;
 b=YvFPo4rI/IWv7b0XKuI3eW8pHxtinq/sas4r+aSdEnz3UeZf8xyObNMOriGeHr5Uex
 NzZne4QjFEYpyo6EWigHn2CA5B0RvaePepRRY9SAfWR7Sm7Zmp8U1fgivD8zSAMPhcNl
 IyOozAIzUZQHCn/zY7sNp1Qbl6JsISfxY/7yUZvYEd36iFZSWESYBR+3Jsc6yvY+awiY
 zomv4izftXyD8A0wFqSF2ubpX8ONMePoJzwJ4bfR+h9gsS5KZvUlM4mI2MjVK+AJtzgU
 XPgL7v0Zr1vl5kM7w3bxfHEgkAQCQ0QAWxW3DNGNhAQ+G6Sm1GK1myM6qdt9RmJXeQlG
 k/uQ==
X-Gm-Message-State: AOJu0YxQlgoDxtNLHexf+pQNpjhet83fss7SAmQ2T76U+PVhRwSuEvN3
 wl6BLG3W8xs5epB+r3Xv9qsPQplh2FSHZ24bHBT2H+dqizcCNBftAs2JqLe0Q2osFwxJ6rHF35s
 CBUY6jzLhhvMKsyyTHfphRsQrRO2X56IWQqkxKupvV6NqEGvjXgysGg==
X-Gm-Gg: ASbGncsMKeBitVp0fh9vxoBNG01XSt8rhhZAPuLYDnW20Vw2WnwJBV5Kjeaic6Cv9e+
 f+v1/Hj7kRBOhcVpCi2S2PsYZkR52HL8oGGEVdAQ+0s4tNSkf+2KzH6L12eyhl+DAycSNAh7AcU
 RPdQClZ7SQnvxQN1K0NSI+czAE13300d+5skF+YyR1FKJptCsnNv2ESLja2mOjwXj8NnFa1wMJl
 VPZtsJUfisFUAKDM72jU/O5ZkFZA4WapcV09dfBXtx93BZDBQtpsLRq6vJPlB4+yMIJpOEta98L
 yt5q4s4suxiur2PymcMtfp25vD4vvv4Z8SWaFsz7mk7QTdjdst/LO5XJMT4eZgtLI3dEvHoNCjS
 RYxRn+xZnyDGpHwM0cx3UW9tR/OB3mYwSrPyiOhBt/GLAnPLbVcYSj76JIQ9mSrmd0eFWCSkp
X-Received: by 2002:a5d:584d:0:b0:42b:3592:1b82 with SMTP id
 ffacd0b85a97d-42cc1ac9c76mr46078120f8f.1.1764691740732; 
 Tue, 02 Dec 2025 08:09:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5eHkIz8G/4NXCExVWJEsXbaVN2WN77R5ZJZIrxOxxmaTtp/wopCTKYSwO8GkK2AKblszQOg==
X-Received: by 2002:a5d:584d:0:b0:42b:3592:1b82 with SMTP id
 ffacd0b85a97d-42cc1ac9c76mr46078089f8f.1.1764691740199; 
 Tue, 02 Dec 2025 08:09:00 -0800 (PST)
Received: from rh.redhat.com
 (p200300f6af35a800883b071bf1f3e4b6.dip0.t-ipconnect.de.
 [2003:f6:af35:a800:883b:71b:f1f3:e4b6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1caa767dsm34300899f8f.38.2025.12.02.08.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 08:08:59 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev, Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v4 2/2] target/arm/kvm: add kvm-psci-version vcpu property
Date: Tue,  2 Dec 2025 17:08:53 +0100
Message-ID: <20251202160853.22560-3-sebott@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202160853.22560-1-sebott@redhat.com>
References: <20251202160853.22560-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lxi86JUMd09hkRG_7wBMev0rGhGV7IZTfP8zMG43rck_1764691741
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Provide a kvm specific vcpu property to override the default
(as of kernel v6.13 that would be PSCI v1.3) PSCI version emulated
by kvm. Current valid values are: 0.1, 0.2, 1.0, 1.1, 1.2, and 1.3

Note: in order to support PSCI v0.1 we need to drop vcpu
initialization with KVM_CAP_ARM_PSCI_0_2 in that case.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 docs/system/arm/cpu-features.rst |  5 +++
 target/arm/cpu.h                 |  6 +++
 target/arm/kvm.c                 | 64 +++++++++++++++++++++++++++++++-
 3 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 37d5dfd15b..1d32ce0fee 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -204,6 +204,11 @@ the list of KVM VCPU features and their descriptions.
   the guest scheduler behavior and/or be exposed to the guest
   userspace.
 
+``kvm-psci-version``
+  Override the default (as of kernel v6.13 that would be PSCI v1.3)
+  PSCI version emulated by the kernel. Current valid values are:
+  0.1, 0.2, 1.0, 1.1, 1.2, and 1.3
+
 TCG VCPU Features
 =================
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 39f2b2e54d..e2b6b587ea 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1035,6 +1035,12 @@ struct ArchCPU {
     bool kvm_vtime_dirty;
     uint64_t kvm_vtime;
 
+    /*
+     * Intermediate value used during property parsing.
+     * Once finalized, the value should be read from psci_version.
+     */
+    uint32_t kvm_prop_psci_version;
+
     /* KVM steal time */
     OnOffAuto kvm_steal_time;
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 0d57081e69..cf2de87287 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -484,6 +484,49 @@ static void kvm_steal_time_set(Object *obj, bool value, Error **errp)
     ARM_CPU(obj)->kvm_steal_time = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
 }
 
+struct psci_version {
+    uint32_t number;
+    const char *str;
+};
+
+static const struct psci_version psci_versions[] = {
+    { QEMU_PSCI_VERSION_0_1, "0.1" },
+    { QEMU_PSCI_VERSION_0_2, "0.2" },
+    { QEMU_PSCI_VERSION_1_0, "1.0" },
+    { QEMU_PSCI_VERSION_1_1, "1.1" },
+    { QEMU_PSCI_VERSION_1_2, "1.2" },
+    { QEMU_PSCI_VERSION_1_3, "1.3" },
+    { -1, NULL },
+};
+
+static char *kvm_get_psci_version(Object *obj, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    const struct psci_version *ver;
+
+    for (ver = psci_versions; ver->number != -1; ver++) {
+        if (ver->number == cpu->psci_version)
+            return g_strdup(ver->str);
+    }
+
+    return g_strdup_printf("Unknown PSCI-version: %x", cpu->psci_version);
+}
+
+static void kvm_set_psci_version(Object *obj, const char *value, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    const struct psci_version *ver;
+
+    for (ver = psci_versions; ver->number != -1; ver++) {
+        if (!strcmp(value, ver->str)) {
+            cpu->kvm_prop_psci_version = ver->number;
+            return;
+        }
+    }
+
+    error_setg(errp, "Invalid PSCI-version value");
+}
+
 /* KVM VCPU properties should be prefixed with "kvm-". */
 void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
 {
@@ -505,6 +548,12 @@ void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
                              kvm_steal_time_set);
     object_property_set_description(obj, "kvm-steal-time",
                                     "Set off to disable KVM steal time.");
+
+    object_property_add_str(obj, "kvm-psci-version", kvm_get_psci_version,
+                            kvm_set_psci_version);
+    object_property_set_description(obj, "kvm-psci-version",
+                                    "Set PSCI version. "
+                                    "Valid values are 0.1, 0.2, 1.0, 1.1, 1.2, 1.3");
 }
 
 bool kvm_arm_pmu_supported(void)
@@ -1959,7 +2008,12 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (cs->start_powered_off) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_POWER_OFF;
     }
-    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
+    if (cpu->kvm_prop_psci_version != QEMU_PSCI_VERSION_0_1 &&
+        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
+        /*
+         * Versions >= v0.2 are backward compatible with v0.2
+         * omit the feature flag for v0.1 .
+         */
         cpu->psci_version = QEMU_PSCI_VERSION_0_2;
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PSCI_0_2;
     }
@@ -1998,6 +2052,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
         }
     }
 
+    if (cpu->kvm_prop_psci_version) {
+        psciver = cpu->kvm_prop_psci_version;
+        ret = kvm_set_one_reg(cs, KVM_REG_ARM_PSCI_VERSION, &psciver);
+        if (ret) {
+            error_report("PSCI version %"PRIx64" is not supported by KVM", psciver);
+            return ret;
+        }
+    }
     /*
      * KVM reports the exact PSCI version it is implementing via a
      * special sysreg. If it is present, use its contents to determine
-- 
2.42.0


