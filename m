Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCDDC53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 19:29:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wonS4-0003A8-49; Tue, 28 Jul 2026 15:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonS2-00038X-KA
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:26:54 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonS1-0001S4-3J
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:26:54 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-38f0f132f56so981533a91.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 12:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785266811; x=1785871611; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mFQLzsllffyN31O2DXNS30O6LLhjzrmI1+U27crjJrU=;
 b=UHvSYU7BGMdkvjItJpb/WE6VMxA9x79L4smxoMWRqWRdS7gGWcY1+isut44Is6hf/2
 vex/+1GNGHltvT2SdSR52AC8tUcVjY0HCow7F7pyOnrXYeetZ6Rke5/8H1qcP9n59rW9
 TTGlyJWjKyNUSxFiNOO9m/Fr4585ah+LaUTS+A/+SgKAHZp1eElBy0TXJhA3/ebN2FQ4
 8CmNWfe+XEh0XSTu12g8j6nhR4Lpr227ZnCsGtfIZ0u3GckvAMCGzGjmlJJzO0CMTm06
 qE+q9w10tGbCREpGd9HYgEj08Tz5EBDiRVwwE6yCaGMdSlQNp77/B6fT9oQ3eEnb68sb
 Jj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785266811; x=1785871611;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mFQLzsllffyN31O2DXNS30O6LLhjzrmI1+U27crjJrU=;
 b=On1un57G5X2i7HiAZ8QshhseYJexgoAht6vcvFwsYKonQcQIcFEcy5wYGJ0HtdAYr4
 U5AazQZ8xU/OJHcedTMawwiqQK9lpjFhU3qwusm/g+O2jgn4UhSXFIJxJA54SQysnZ9A
 b75dMYJFD+ittvLa/qz0m5bZ/q6ARH9HA+RdjE6L3yhzUWGgRMHcurbRpoT5XCMj1Jfr
 4L17UlMlFdZnRolq+cJw29ge2TLnDhYpyiX7QNhufNeor2Ppp2feXPgjC2oFTxp+HXJH
 /ACv+f2p7Ifs60yMNocVWI9IKd8FxLVwlmeP48z9sh0qLAgvaouKZP+hGEkPs/V378qS
 Y9EQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpqMjxcPAvhUhZ+roOm03tAO7vwm7MG1uM33LlUlFS+pvhFwkSgfC77yf4b+SAiRkkjtvELSH0XGA==@nongnu.org
X-Gm-Message-State: AOJu0YzphZcss3Gq5Yr66KTInU2QQj6VtkJKH+8DTibYjwKb0Potr7gR
 KCXM1ZjM5w79P7p9L28rLHjCjEI9nSgGMqBBr4/CKZCwy+ZlI2SrBClKPcThncK/XKk=
X-Gm-Gg: AR+sD13Os0jSgbNWY4yGKOJLtfvh9lJ90TvRNfBeWthFKRFk2vb9dV6zSMG256BzApS
 roZVI2bJIvuV7KSYrQXuUhuujkU5H45c3F8bibOUHhYr2p1BxeTpJjb8MC67f2mvB+Ct5lES28v
 pnLxc60l2qr7kV9J9BcwHC7qG9QvXcOQiUswr7isGXmEluFEgSLm/5S/uH8/5bAjvgElmrIACVg
 SkWzONpRiEZm9179QkqnkZgKJ+KBmdZpo/9HNR7aRHsV9WUZ3bn1A+A3w+GXK0pq/mrVlQki/+D
 LR89NAezsRoaXl6QpZ+AkWSvZMEVaEW/HNCocV2Es9c0O4gdc98ly8T3zQkm2jkr/h9YGiOWBW2
 cxId90XUtJuNKcBFF9ldyJ63q4s2VjhjpEJ7Y2TEkdEuwWh5K9XgSr65aVhgIPQRr1gQh5ExnMJ
 Zj0oX89PEFWZFhQG5jUELHcb1+m8v5
X-Received: by 2002:a17:90b:582d:b0:37d:a52a:ff12 with SMTP id
 98e67ed59e1d1-38f6a30c7ddmr3585247a91.10.1785266811540; 
 Tue, 28 Jul 2026 12:26:51 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:b9d1:87c9:a085:86c9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f7f1353fdsm372650a91.8.2026.07.28.12.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 12:26:49 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v2 08/24] target/arm/kvm: Use kvm_vm_check_extension() where
 necessary
Date: Tue, 28 Jul 2026 13:26:14 -0600
Message-ID: <20260728192630.240375-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728192630.240375-1-mathieu.poirier@linaro.org>
References: <20260728192630.240375-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1031.google.com
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

The Arm KVM code can return different values from KVM_CHECK_EXTENSION
depending on the VM type. Use kvm_vm_check_extension() where necessary
to ensure we get the right response from KVM.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d86e66e056b9..ca25b707a0a8 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -331,7 +331,7 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                              1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
     }
 
-    if (kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3)) {
+    if (kvm_vm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3)) {
         init.features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
         pmu_supported = true;
         features |= 1ULL << ARM_FEATURE_PMU;
@@ -636,7 +636,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         return -EINVAL;
     }
 
-    if (kvm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
+    if (kvm_vm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
         if (kvm_vm_enable_cap(s, KVM_CAP_ARM_NISV_TO_USER, 0)) {
             error_report("Failed to enable KVM_CAP_ARM_NISV_TO_USER cap");
         } else {
@@ -667,11 +667,11 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
-    max_hw_wps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_WPS);
+    max_hw_wps = kvm_vm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_WPS);
     hw_watchpoints = g_array_sized_new(true, true,
                                        sizeof(HWWatchpoint), max_hw_wps);
 
-    max_hw_bps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_BPS);
+    max_hw_bps = kvm_vm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_BPS);
     hw_breakpoints = g_array_sized_new(true, true,
                                        sizeof(HWBreakpoint), max_hw_bps);
 
@@ -1913,7 +1913,7 @@ void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa)
 
 void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
 {
-    bool has_steal_time = kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
+    bool has_steal_time = kvm_vm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
 
     if (cpu->kvm_steal_time == ON_OFF_AUTO_AUTO) {
         if (!has_steal_time || !arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-- 
2.43.0


