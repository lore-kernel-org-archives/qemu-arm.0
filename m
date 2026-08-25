Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F924C61DBD
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:02:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzDQ-0004JK-Am; Tue, 25 Aug 2026 18:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCv-0003Mk-DE
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:25 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCt-0001T9-OD
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:25 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-cbedf6a6fe8so208644a12.3
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695282; x=1788300082; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2Yc9MuHh9PbC3Ytohig4KatF9izBef0JRQCyKKLS8VY=;
 b=cPxLDaV2XREnd3/SXkTsKzB1On/pewTnfIvotv1CeZ2B/kLkS5/VIKZxKXlhN1Z0aw
 oDc3/YHwFiuehB0JR4BMMtk+cAsausrPs7FhAskppg3WIZjX2oOFe834pOUPDctufVVI
 YHnztWz08F0X8gzQEmbCQ6p9IDvC7L1VoItnmV8F3vUhvA3mnzNwvnWYL9LaTO4IJRAY
 6E/KXxTt8p41XUrrrLDA7TExnfEp01owgTSmZ0AR2nqLu5ZWKwFiO+1rBdXMfX5lpMuy
 dEEZqOmI1B6Iwc/pQhF/tRacsBwxL/DzhpqlOkVGr/ppGZ7dVwqFkrpn5vaTAa7KNDbw
 lElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695282; x=1788300082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2Yc9MuHh9PbC3Ytohig4KatF9izBef0JRQCyKKLS8VY=;
 b=NBsPbeZKf8evD5g2ZWB6jZBnB/5/Zj8a+cyHdN+plSZWWO8YNcw5UKk8dcTscoudeZ
 TTbpck2Zmp7ez4wfHe3LO48uF0thHLL2ePTx+nGI4Ars0p/Tlq1HGvthJ8O08wZl0GQZ
 GhPKJ5+F/okEs03bylqvfWJBnisDS7AiL5i9ObZU3lzDiPuRbZfv6LGJW7kP4H70EkNR
 pKKx+a11uIbJuLfsUX2ga+GDQ7ptxmTXIOHUfMvTd8JsWYjKSLLG2N8BNodqq/08cX6a
 wmTD3HUdiCPgHp9aquIgouEMfqriJDydcb4ErR+UYgo8r+yLFoiiFPQAtIdYfudyjDm1
 wWnA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp6jQbnLC4TFs1uJ2ZPTL8y0I6CSGAw61o5qHso0j2YISy407inkAwq5+Hu5VKwq4DMAIg30Sy/rQ==@nongnu.org
X-Gm-Message-State: AFuF++nHwqxH/6yCRND9yK378K0nZeWF6djQ735z0ZuCt5ziJlq5MlLA
 OFL1BOps5RyP3AXQAV9T7++SWInj2ol66IhTNXXG/xrqXC9nQC8BeVCwy4mRVW+YK5A=
X-Gm-Gg: AR+sD12cgQz0ezUknMe+QAGn7S1mxvOXoHS+D6im6tvdzDh6BWo+z8KZHwC7CZik1YF
 1bAZp7FhU3IOvNhk48hF/dioHkRK6WC4A7AMeOJ60CxFEFK0TSJ3Q3dltkqaeu0NY1QK7Hl3BWE
 TbUOHkXEeaOdEfi4WvgodW8S/YCRVI5mSYQ5rHHnEa3OUY+CZrTWNIl7ZfYapCx1ksVkOTxvMZY
 btwrW3EGH8S7fh7EGwm62rfpQxxDF0EFxmE7cWVCSz5aQ+UX0xMM75RuNDh7735k1vgn7I4NTnS
 58SYtly9/MQVYbf7Mp89qIPLHRfN5wcXPE51B8aXAa6bmqMfamHqKuFeb7MBeTwmert51b+CavN
 AumsiuzYyVqjaoEoxNsnD388ODAlP/WVXVLkjoe4LeoCtaMtPsP+gwBOIbvjs3sOHTLhuXuikhX
 bctlOpLMZtvntwFiVETFlrQkf8iKsxqUdO9o9BCnK25UcTcfFilR0bU3a5BILZ1o1YzMcCpSwdC
 Pu9Ocm6gL1Wwlo=
X-Received: by 2002:a17:90b:4d88:b0:395:4de0:b78f with SMTP id
 98e67ed59e1d1-3966d36e327mr4349485a91.1.1787695281998; 
 Tue, 25 Aug 2026 15:01:21 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:21 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 08/24] target/arm/kvm: Use kvm_vm_check_extension() where
 necessary
Date: Tue, 25 Aug 2026 16:00:45 -0600
Message-ID: <20260825220101.3443954-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pg1-x52d.google.com
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

The Arm KVM code can return different values from KVM_CHECK_EXTENSION
depending on the VM type. Use kvm_vm_check_extension() where necessary
to ensure we get the right response from KVM.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 1acbd885bf4e..c02845486aa9 100644
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
 
@@ -1910,7 +1910,7 @@ void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa)
 
 void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
 {
-    bool has_steal_time = kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
+    bool has_steal_time = kvm_vm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
 
     if (cpu->kvm_steal_time == ON_OFF_AUTO_AUTO) {
         if (!has_steal_time || !arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-- 
2.43.0


