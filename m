Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB951CA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 17:32:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulsqi-0007fW-Qa; Tue, 12 Aug 2025 13:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsqg-0007fC-6B
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:31:46 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsqd-0003vK-Rm
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:31:45 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-458bf6d69e4so52280185e9.2
 for <qemu-arm@nongnu.org>; Tue, 12 Aug 2025 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755019897; x=1755624697; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fGIZJncm597lQ1UHTGlOf0gdA0nz+VRBE4mDNz581R8=;
 b=mR4VSuJQ1cH90gW1p3UNg5Dia8fusboEQg+o1/ON1pFn59Y9aYyEaT+FDGQSexUXgt
 dQpD+FLH/uQoXaCdU4+qvGytb8notJ9nvMyKOBgIilZh0K/UmVV0rbioZ0evGv0NteSK
 i98inKfRNfN10VVSiCRt2OBhz9OxfWasbOkuWgO1YGBkDfSw8Qd69xHLkRJFb8cPfpAL
 RikM4Z8fQIILXM3kP5jJJrA8AD0mmRaaJZDntfbcyIUk8UxnPeUcU51rmUdDS49gIHdi
 wsgezV5JtBjetu0A+3bHi+0zKVppnanfhEktkko8cylN7xDIG4qoFXOpZi9ZdiU1j8e5
 RZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755019897; x=1755624697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fGIZJncm597lQ1UHTGlOf0gdA0nz+VRBE4mDNz581R8=;
 b=Kyt0Y6HrHwRqqJ2F1tXIuBWVvu+x0BiB7YktI1E8HNIQ0vxeh30VQrtSp3+EmvOvBX
 7vs/aPZBhUHG5QaApBzrVxQ8jmGb7eC5ems9BVviAEOZBEvHygjfpjYq+Y6X/dRObbKg
 J8nFEoGMWVP02sqWuPj7IfL2n+xLP/Mwr5t2PzWf9uZ4tS5O7epEwkMM31eUucj+LA14
 6Rm1ceYi0icTCyf3h+oaRgYBsMvr7LkfCBCSaHF/unw4X2cCQbbeezJPAERr9E1+N5OW
 DIt0rIxQjh1EMH5Orna2qd5TKcEBAPnsZ5DCcJWWxcjDOXKNeHsIkjT2uNHuZwM//3pf
 c2uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDlFs1fCq/0GaHGUj79UjQfERLhsCXl6bZv5M3z4fH6+vNHmxBA94Uv27U6cl7XK5viMyoVYWKmA==@nongnu.org
X-Gm-Message-State: AOJu0Yw9OVGpopCpXqLKcdO3KzyIuSu0jzjgWfYkMjn1laf0zbhh9ghK
 gI4wZPmCBejFJ7WjDmLIaatms/mVRywUHU+4+qXqsVg4343VLomdVoPamNHA/aqoGtI=
X-Gm-Gg: ASbGnctV8OuUr6zLKXhmxfwGWw+As/DWCPejBSlSiCsW2PF+O9KMgK18V3IU9AU6KSL
 sHK8qW4JpTd1TRRG/LuUFCEuE1OaWb1yEONe1YQznauIYGlrKY3bIFOaESqcCcY04GZBfgg//V3
 rgVktOdWLn5DPxDcKUsuhzvgYdmJKndQBO51bTUp878xTN6Wgik9Mb6umynUVymmHJUK3ScdGxO
 ah0rEZ5PCnAXdn8T8RS2guo+bGbtV5hoCGOG2/jm5DPSDCCyoaeySvRtHCrGrWW7vykXwdD4f1U
 Q1vWhBIcAODhukLfdEo6fo+ye6PRt2PIR6FIerZXmsJK0+BB2TFj4kuFhW7kfL1E/Smpw+9793e
 CfMY6dDiPkcTGGNK5n9bgu8o4xqd8IcHUi6hw8zn2Rk2Qm9NMw5lG658wGjl5FBTh9/HALOEg
X-Google-Smtp-Source: AGHT+IGEtHAmytFVhll3Er2XT0W8VFQFfgTL33dO4ePx6UWWR29T0NixVEQVlSdAz1cpzX+OtO9DqQ==
X-Received: by 2002:a05:600c:3b97:b0:459:e165:2661 with SMTP id
 5b1f17b1804b1-45a1660b14dmr25675e9.23.1755019897070; 
 Tue, 12 Aug 2025 10:31:37 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dc900606sm370219985e9.15.2025.08.12.10.31.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Aug 2025 10:31:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org
Subject: [RFC PATCH v2 05/10] target/arm: Introduce
 host_cpu_feature_supported()
Date: Tue, 12 Aug 2025 19:31:29 +0200
Message-ID: <20250812173131.86888-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250812172823.86329-1-philmd@linaro.org>
References: <20250812172823.86329-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Introduce host_cpu_feature_supported() helper, returning
whether a ARM feature is supported by host hardware.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h |  8 ++++++++
 target/arm/hvf/hvf.c   | 20 ++++++++++++++++++++
 target/arm/kvm.c       | 22 ++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 1b3d0244fd6..1742dd88443 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1612,6 +1612,14 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
 
 void arm_log_exception(CPUState *cs);
 
+/**
+ * host_cpu_feature_supported:
+ * @feature: Feature to test for support
+ *
+ * Returns: whether @feature is supported by hardware accelerator or emulator
+ */
+bool host_cpu_feature_supported(enum arm_features feature);
+
 #endif /* !CONFIG_USER_ONLY */
 
 /*
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 48e86e62945..05fbd8f7fc9 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -547,6 +547,26 @@ static struct hvf_sreg_match hvf_sreg_match[] = {
     { HV_SYS_REG_SP_EL1, HVF_SYSREG(4, 1, 3, 4, 0) },
 };
 
+bool host_cpu_feature_supported(enum arm_features feature)
+{
+    if (!hvf_enabled()) {
+        return false;
+    }
+    switch (feature) {
+    case ARM_FEATURE_V8:
+    case ARM_FEATURE_NEON:
+    case ARM_FEATURE_AARCH64:
+    case ARM_FEATURE_PMU:
+    case ARM_FEATURE_GENERIC_TIMER:
+        return true;
+    case ARM_FEATURE_EL2:
+    case ARM_FEATURE_EL3:
+        return false;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 int hvf_get_registers(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 66723448554..93da9d67806 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1771,6 +1771,28 @@ void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
     }
 }
 
+bool host_cpu_feature_supported(enum arm_features feature)
+{
+    if (!kvm_enabled()) {
+        return false;
+    }
+    switch (feat) {
+    case ARM_FEATURE_V8:
+    case ARM_FEATURE_NEON:
+    case ARM_FEATURE_AARCH64:
+    case ARM_FEATURE_GENERIC_TIMER:
+        return true;
+    case ARM_FEATURE_PMU:
+        return kvm_arm_pmu_supported();
+    case ARM_FEATURE_EL2:
+        return kvm_arm_el2_supported();
+    case ARM_FEATURE_EL3:
+        return false;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 bool kvm_arm_aarch32_supported(void)
 {
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL1_32BIT);
-- 
2.49.0


