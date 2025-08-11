Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A21CA0EC4
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 17:11:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulVzy-0005Og-8W; Mon, 11 Aug 2025 13:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVzR-0004zw-9x
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 13:07:23 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVzF-0001qt-RR
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 13:07:13 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-458b2d9dba5so29503955e9.1
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 10:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754932017; x=1755536817; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tTxLOjP4FhmiKvW9Jt5SVA/50ytmZzwnIVFBfjDcbbg=;
 b=tWU74dEgB3EVpn7rAjr+e77kFYrWhEh06tRS+95tcgAINtDcISArOQ42gFZ03dJjb6
 1I2D/UPUKEDeJUN6X618wcDu0YVHHA9DjQaWX1jYJarbkaOdjSaRSdKQZ3ItkGncYdZS
 /oLYGg5iruAv/mH5N90Ggfs36ExhhNomD/gkmtSlNXugSBSAxaxFt9Sn0YPGkD+C0aOT
 0mL/XniRbs5+MpT7wbwpx11a6Ru/2Q8h9bMgZT6zMFBxKlhHagycgbo1CJ5Z+JtE7+Fs
 eyEq6akGqTly/RFcVyEIyT6cAuDnZVrYltGYNusEtsEf4B+qEI/Ue9MznlVPAOgNnhxi
 ZJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754932017; x=1755536817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tTxLOjP4FhmiKvW9Jt5SVA/50ytmZzwnIVFBfjDcbbg=;
 b=fd45l1rKswhkn9QhT22qfiuOKD51DpzAa4JTl+dvdyWbXZ73g7wVkd4X06+TKQyC4s
 vlcHbNWqNlqYBjk0/tj0K4ZZGB6dnWeWEZbTigFYLyTFcGqKnQi0yf+ekw0uec6IQRmd
 9TLdNR3udCVkks4n7vaIZHyqdI9h/lZHpB6eRiQXWR4Qm1q015VU/kwgonmo01PZHYAr
 PaxpMfg1Z0paqXqDsml8GwfU/rlyHvg8o294mREJ9Ng8xd6X6KXIQV4QywAsm2Z1zKKE
 kjqYcuQ7LiF9i90lOuQDoJm9RLKGGA0WDgRednPO9VL/OtelvgrYJ5fSjCGSO6YDPyxz
 nr1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbOTpW4PES6okEe5EHVgjI7QK6SRSHqrtc4EF77ZEzRVGHOz8pBpG5pHcvh3/aI05a83NfJqqAYQ==@nongnu.org
X-Gm-Message-State: AOJu0YwOzQ9ChBeHd2T2KJybRtBDLZkJFcEK3MX52Er3PiG6dURt3D5t
 6krihznpUVWLe4sWi3KhxGHWgvqkn6qCQWyjBFFuDh+nli12HLCskBQjUfsPhvENPKY=
X-Gm-Gg: ASbGncuoxfGeib/FI4y3EaYNmRRO8TLx2NHsCaYJ3ZQ5IqEQNxrSNHh8WhhNtlGFm59
 0SKg5mUPZlRxQhtbtZKq0em+9TencO8SzcdFRrUxt4gQNKTdCjRQO5YM/gTAC18hjouppTV9dcY
 w+rwQC7Q7wGus86sGxVLFcp1QS9TpGbG3T7xRocQ++8wEBRYDAY0oNFyyjjkSts2zhtGXLhYWZO
 dUtElNVoC5+xFp4uEVeDU1GXcRrMSMlP2veZ1K/h3rWAAiVImmFh67/oKjc6dfKOCZZw2Ym0Q3a
 DzxK+XTXunJG2FRY/fk1EN1is8Ipe1lf7RW73y7tX6ciYL/MN6fLSL4Wjpj6e8WfohMNfky02kq
 x1fyQaBM3bQ73n/TkFoy4s7WSBcKrYP+yG1XT24SsI2+X+gl1jMA03BfLJN89GQ3JHM8HlUw4F3
 cMHw0r0p4=
X-Google-Smtp-Source: AGHT+IEMcG/Ev4eyU/L7hIS6KC5DMgPfd5GRoRtRkLPDfgT0WRaP7S9VSCoMBvoitgce/yrC+B3d3w==
X-Received: by 2002:a05:600c:470c:b0:459:d709:e5cf with SMTP id
 5b1f17b1804b1-45a10bad987mr5229185e9.3.1754932017284; 
 Mon, 11 Aug 2025 10:06:57 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5887b7fsm261545415e9.30.2025.08.11.10.06.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Aug 2025 10:06:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Miguel Luis <miguel.luis@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Haibo Xu <haibo.xu@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Mark Burton <mburton@qti.qualcomm.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 08/11] target/arm: Replace kvm_arm_el2_supported by
 host_cpu_feature_supported
Date: Mon, 11 Aug 2025 19:06:08 +0200
Message-ID: <20250811170611.37482-9-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250811170611.37482-1-philmd@linaro.org>
References: <20250811170611.37482-1-philmd@linaro.org>
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

Use the generic host_cpu_feature_supported() helper to
check for the EL2 feature support. This will allow to
expand to non-KVM accelerators such HVF.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/kvm_arm.h  | 11 -----------
 hw/arm/virt.c         |  8 +-------
 target/arm/kvm-stub.c |  5 -----
 target/arm/kvm.c      |  6 +++---
 4 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 364578c50d6..7e5755d76b2 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -191,12 +191,6 @@ bool kvm_arm_sve_supported(void);
  */
 bool kvm_arm_mte_supported(void);
 
-/**
- * kvm_arm_el2_supported:
- *
- * Returns true if KVM can enable EL2 and false otherwise.
- */
-bool kvm_arm_el2_supported(void);
 #else
 
 static inline bool kvm_arm_aarch32_supported(void)
@@ -213,11 +207,6 @@ static inline bool kvm_arm_mte_supported(void)
 {
     return false;
 }
-
-static inline bool kvm_arm_el2_supported(void)
-{
-    return false;
-}
 #endif
 
 /**
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ef6be3660f5..c2f71ecbfa7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2267,13 +2267,7 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    if (vms->virt && kvm_enabled() && !kvm_arm_el2_supported()) {
-        error_report("mach-virt: host kernel KVM does not support providing "
-                     "Virtualization extensions to the guest CPU");
-        exit(1);
-    }
-
-    if (vms->virt && !kvm_enabled() && !tcg_enabled() && !qtest_enabled()) {
+    if (vms->virt && !host_cpu_feature_supported(ARM_FEATURE_EL2, true)) {
         error_report("mach-virt: %s does not support providing "
                      "Virtualization extensions to the guest CPU",
                      current_accel_name());
diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
index 3beb336416d..35afcc7d6f9 100644
--- a/target/arm/kvm-stub.c
+++ b/target/arm/kvm-stub.c
@@ -42,11 +42,6 @@ bool kvm_arm_mte_supported(void)
     return false;
 }
 
-bool kvm_arm_el2_supported(void)
-{
-    return false;
-}
-
 /*
  * These functions should never actually be called without KVM support.
  */
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 0fe0f89f931..a9f05bfa7ea 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -274,7 +274,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     /*
      * Ask for EL2 if supported.
      */
-    el2_supported = kvm_arm_el2_supported();
+    el2_supported = host_cpu_feature_supported(ARM_FEATURE_EL2, false);
     if (el2_supported) {
         init.features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
     }
@@ -1780,7 +1780,7 @@ bool arm_hw_accel_cpu_feature_supported(enum arm_features feat, bool can_emulate
     case ARM_FEATURE_PMU:
         return kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3);
     case ARM_FEATURE_EL2:
-        return kvm_arm_el2_supported();
+        return kvm_check_extension(kvm_state, KVM_CAP_ARM_EL2);
     case ARM_FEATURE_EL3:
         return false;
     default:
@@ -1918,7 +1918,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
         cpu->kvm_init_features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
                                       1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
     }
-    if (cpu->has_el2 && kvm_arm_el2_supported()) {
+    if (cpu->has_el2 && host_cpu_feature_supported(ARM_FEATURE_EL2, false)) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_HAS_EL2;
     }
 
-- 
2.49.0


