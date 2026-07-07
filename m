Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C653C43458
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Jul 2026 22:46:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whEVn-0001KX-3l; Tue, 07 Jul 2026 18:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEVl-0001Jr-IW
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:29 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1whEVj-00048v-T2
 for qemu-arm@nongnu.org; Tue, 07 Jul 2026 18:43:29 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-3856d6fbcb3so47205a91.2
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2026 15:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783464206; x=1784069006; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+Hja6qHGPQODpxQ8LqX3XJ4cmNcTjvVv4dMZ2DbbCzg=;
 b=EzxeLIpzj3uV3ofwOWi+JVWrGYk2yqT2IpRGZBWsYEUExy42YdjJPkMji5pHJyICVE
 2VOTuT2F4SLRkT3dOgZtePM7CZ4jh5MLC1EMhmszeb5fjWxRAGirMaNAvEEEkNp0/oJj
 hy5bBXXCdH+1ycXDp8Ol6y4KjsY7a+/UAgKTRpyqqRbC+2RZZ5hJo16zQprScMa47uo3
 v00PnBQXT3ZAUfNKwZpN95fMV9IwmL4czN4RMixukhVATCvXqthyj7CwpBt3aBfBifah
 BirLEFBsWRRLsZURUGirT1XBiWOlepxnO4o1CsE4IZfRJDRgyclwxmfTpbNwHSDIekvb
 UPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783464206; x=1784069006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+Hja6qHGPQODpxQ8LqX3XJ4cmNcTjvVv4dMZ2DbbCzg=;
 b=VZW8N69DT0XTeCJ3cvOgHO2Oi9Y9pG8qQBaEoepFPCGFXi80+DqP3KAAdwQHXwsKmP
 QoqCDbVRBRigDT3o+FCBJfzmLJEcjGCxAH62YtYLhitBHtScp50qHIfAvMDN61DhUFmA
 INv5EBxVZXA40lJCP3nyeV4trNfnO8cu4zYrkk9Vo/EAXE3sva13RN+lauz2vZoSHZjk
 0b7QMvshV6zlNG3HrJxHaALbD2YCiydOaAG9zw2ww36yU6fAiZ91AqluPgeBF7JRPPXx
 rvT/mPKNpK1+hv/VMrOz6O/wwEYdoBBzollzIieFHYZQn57kJOqVF9njmabYbfL4BCxT
 AiNQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpls3K41yocABgiX8lAPe0flnKQjrbyN24WaA4c2TebT482y8nxoRpt5SyM0KbNoTgeFY1D2ypsdg==@nongnu.org
X-Gm-Message-State: AOJu0YwDKrJjcrTuNWxyUt3mSc0x20uqItiZJwf0Ea9Pi9mUr6BDp4x7
 J6i/2ZwMa69fT11XH3fAfJy84JBL6c5RuL7338hYf4kZunFYKrBSD0Y75tW9W/Uy9G0=
X-Gm-Gg: AfdE7cl3aC+WQYyMFum4hwW/rNhM9ysNpe9cXlMPKhBmBERpd+B9Hhwq9mO+4vjpHG9
 52woUVTQ5/K2o1GxWQbqvMKzy/tAEY8CgBme2SrXbR15TQ9LDA4K92gtn73Cc9VeFNrF/5kNdmw
 IpeByLBoovXlfUSgJBPLwgDbmwIIxJQ3NgoUSynKtZOE6xmOXb8yEwjVB0dyGYRb6LVfHDQ0zx7
 rfOHWlufCoOjv2zBPO5c8kFE0yrpriOq7fa4Z4fOM7IUwbbnv3/EOmn5UxBwa8sEtmnoTUXFCxI
 xfesriHmOYk4SJ5rTb7p5o5zCSqa9F7wGAvj9dGido/KgTZKuBmCOru1Z8CzjQ2MdGJ02+G7nRu
 AJCAjJwmgm6L4Ko7qjJzahvwnONrU59oLns0DkOVPobTNmzweYcTbnnybOb5soBT4JVI/9DMDD0
 M+Cpckfv6Vh6yim+xMI8AiVeZCt7kKtM8mA7ASRXocsJm7BuQW1Q==
X-Received: by 2002:a17:90b:3808:b0:37f:9cdf:f037 with SMTP id
 98e67ed59e1d1-387572b3d9fmr6146459a91.26.1783464206246; 
 Tue, 07 Jul 2026 15:43:26 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:46c8:dda7:40fa:8958])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3bbaesm18183805ad.57.2026.07.07.15.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 15:43:25 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, jpb@kernel.org, lorenzo.pieralisi@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v1 08/25] target/arm/kvm: Use kvm_vm_check_extension() where
 necessary
Date: Tue,  7 Jul 2026 16:42:49 -0600
Message-ID: <20260707224306.1202330-9-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
References: <20260707224306.1202330-1-mathieu.poirier@linaro.org>
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
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 6aa1cd04e484..c69b5310c184 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -328,7 +328,7 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                              1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
     }
 
-    if (kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3)) {
+    if (kvm_vm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3)) {
         init.features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
         pmu_supported = true;
         features |= 1ULL << ARM_FEATURE_PMU;
@@ -654,11 +654,11 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
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
 
@@ -1905,7 +1905,7 @@ void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa)
 
 void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
 {
-    bool has_steal_time = kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
+    bool has_steal_time = kvm_vm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
 
     if (cpu->kvm_steal_time == ON_OFF_AUTO_AUTO) {
         if (!has_steal_time || !arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-- 
2.43.0


