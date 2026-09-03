Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B27C624D7
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 19:40:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2DEh-0001PY-Lj; Thu, 03 Sep 2026 15:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEc-0001NL-Ok
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:30 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEb-0004AT-6y
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:30 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-38dc4553f62so225586a91.0
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 12:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788464188; x=1789068988; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WkBIOKR4nn6Cp90N68JmMr/qaQZgLTq2QO4yasLXKy0=;
 b=SY54dgM+mMcsSeUiy9m6Cvh5+Od+v2ywSLx7cMPhhXsLucYbGg0s9YTzrWVtxDNshf
 bAnT7kEmARTwIncZ/WKltiLxPrSggADMdfv4rNgWATKjVAvFmk63MGZ43e90e0WQmHjg
 MyWm4Czov2r12J45BiNsZw0ByBOWLTdoE+OQ+XAxfgdv7kn/MqqQdPdcLQnetpOkUNb2
 b4PtsZayYohbZS/1JRz7osq/WJfgnOP1BFEgjsVUZJ8L9A8qZws/voql6JezRJ7cY4hs
 LpRMhJNfGGvAvOwSx3AOraCesWzfNOZ9B9UK6SFe9tN+rXJrLq1k3ipzuMcaNkRUWnl8
 tC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788464188; x=1789068988;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WkBIOKR4nn6Cp90N68JmMr/qaQZgLTq2QO4yasLXKy0=;
 b=ID2sBCTnRU9nWExRy8/GVktpAxEOJEqCjPkef3VheKa/Q7lCj94+WsV+elbhNdTNCL
 cq8MDepejy5fCky9hr1h7903l65mYr/EzH9FflX0a7W4cGg69Oz6SWF0PzCMLbP0WzG0
 8n3O0pLc2/J62MNoUHxGjve1ZwscEWzJ+yEhi617YIYsktgaJ3babNMf/UtXqNUtTOT1
 IOhoDXKGiGJCGjLuu48ItzH3InUTexIqJc9xSmiTCdLciUFxuYYTa1rWGZVgcwngOcjr
 gmfJqMY8UZCV+q0jwYgQXjH40oJ4Ow9sJKkvM9IB2CWHh8Lo3Fl/G/NuaTER1BsWKAVV
 1LNg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxKkfFwej0bVmh2zCTA8COtTRO1szehBX1bnUHelSJY2zRVivP60fazFHjM0oKOpWtO9wd62u5feQ==@nongnu.org
X-Gm-Message-State: AFuF++nukqlQW4rmfUvqqN5ngRHG/oHMfEwnm0kJ/hF2u7fS38kaxm67
 KpU31i/dA2zcOeVRT+OFkqvqFCeeJqaSLFcXditWwDLbv9T8eci4Umc6+rKy67ypgv4=
X-Gm-Gg: AYBFou3wQ+J+hUZL+xtBic6i/rJ6oNhD/sJKZ9sESH8GatKJOmFJ1T89oKhDC1ntPcT
 X1lKplFiBXzfAbTHbBsLIFmC0N5qwV+Z/MCaJhivJ9zDjsKqkc+g3h4HM/KbXk3Jt+M2AO2f6px
 nIHaG6Q6tP4zQ/NMNnv2MqFsgo6xu6E4/4iugwGWQyu/rYyT9g2uQZizpcOGeCjimnXpF0aqrk+
 Bc4Gb6CxLuxkafUbwhksGEZFFmUZTiCv7V51HbyNRuGkyQxPnjIw3C8BtfP8EuQiYBbOrYco1c7
 39qjgzhc8HcYr1bnDDvFyiQvVDuz7j1q3OWFvZGNk18QoNj8wjc+KmlyrePonwbjY7rCmfkSlw6
 JOhcFTMVn1+iRkZI2noj4lni250mx9Ulu96+Q5fnFDkL7Bo4kMBuSK9SaFvOrLwVwaYbr297x1D
 P5cSbQAMAkXHAYmjsuaIM5hFPDXbWut19BLCzlpFNq+tIfX8YG77yunQ2M3w/bueLsLgVtXxFJ0
 NYic96zQS1NSFH2XYiVPs8N3w==
X-Received: by 2002:a17:90b:394a:b0:393:19a3:4f1 with SMTP id
 98e67ed59e1d1-39b2613150amr1206644a91.6.1788464187787; 
 Thu, 03 Sep 2026 12:36:27 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b083e4fafsm6836951a91.1.2026.09.03.12.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 12:36:27 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v4 08/24] target/arm/kvm: Use kvm_vm_check_extension() where
 necessary
Date: Thu,  3 Sep 2026 13:35:55 -0600
Message-ID: <20260903193611.1058589-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1032.google.com
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
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>
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


