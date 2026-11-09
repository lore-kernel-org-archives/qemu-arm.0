Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1993F606A321
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kOQZJhun
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXuC-0005RZ-U1; Mon, 09 Nov 2026 17:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtl-0005Do-1S
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:34 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtj-0003tQ-Ap
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:32 -0500
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-8b600fae14dso578016b3a.2
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794263489; x=1794868289; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sQYbIzhYybqZKpHEFkom106KOJMNZUoms04H7LpX2sA=;
 b=kOQZJhunLsaBYimhzL1spvYsVLGMNTNzr8BE3ZmxhB6MvhHIZ6CDU/gPRYIb6SHWad
 TpWZuSzQ927yJ7G8LLF3QXYNwsPoCDxlff5QEdDtEcHpRa9d7IT3dSL7UoP7BCC30G04
 BC6I4YntGWfvf+RQ2+W7uyishwdkoLzWcPMtlUovz4V/BB3wXw/2RjhVpT8Lrz+ygymY
 nqpWgktgV9yM6pxseDbPgxJIKnIQ7DNpuvFLFt+mLJIBchD3+0LSi50fvq3QhP6/tQfZ
 AOvhXq1Lqz8YaPpqukkglAtAmBVMXsB4doU9xN8T9ui5Vb8G+4arZ4LIC862SBfFZ912
 zPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263489; x=1794868289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sQYbIzhYybqZKpHEFkom106KOJMNZUoms04H7LpX2sA=;
 b=J+hbwLIvfSGPhPFZxp4LrohNkgBxdsu07c5aFN6vjMav+4kcbvyhUQTIGseSyVX+UR
 wxq2LW8QLtkipYWYWpwJQ8SJaVHZFwiTdD43pV732790zIg3vDqdZY1fjMEihrQVyDTl
 W/I4n3bxpY7VX4SjlUcu2HAMmZORIL96YlPPOLoJZiLACULsnjJmLJbGi/DS3c2fb9f7
 xoEH2EPymHM5rpKVpYRZT/xEPQtcIMlPP5cKN+6PpBqpxnG7ir1syM4R+w0NwqdYJJYn
 eEhVc4HaZ9QOTNgvTZtylhcBD6WAxdOuOQ3tqzfdZ64rQfYpR6E5HZ3OUABJtMqOEt0v
 QBnA==
X-Forwarded-Encrypted: i=1;
 AL+hErFba0PZeiqh+pH+qhL2x3b7YOzV6PNUWHtdoRZICuaLSXb6+c8IO8nFpBHkNZFwqTmzsh2pi+/6nw==@nongnu.org
X-Gm-Message-State: APuU4Z+0PUJ1nTSv2wm+cvHwrYivHFGaR+iR15w+LoxIMRel/02cCT3p
 wAwUzikUF/WxuRC3oa/jIDAL9Ws2/fh8G+wSR/Jb9pKT6VtT7iedr+YCQfrJ9IU0aTWmrC1fgg7
 C4qq9
X-Gm-Gg: AYBFou1ispQn9PFNw0F0vl8cBhdqFjdjCxMlxw86q9y0zdh65v+WIaXiDfY5R9LnyV7
 0Sbzc8I9QKCGd4nspFb1LJ+2xtyFCTF5gnYEk+3TN7aDVerSjPzclqQpuYEkkEGcUhBynUXcDGc
 8cCHs59pEtPeLp7mBinhx4ye8yr8B5YtrUno2fzsvnh6mAFUn7eTo/XG7QyI4bRydMhIMWCic7U
 +tPG/qYnRqLapW87iE5sG4EXSNFgA4n8penXWXC+SbTFCys4nY5ZK66FnhIwpdxx0lQ9rLyuemN
 ZRsBjtFS6u891RFTih2vpvgeR9lAvHOq2xxEYyzKY8+wGDs94cpXUIHnbZgANj/wob6l4DBUMMC
 nqJcDjl5KSbvR9A+O5AEfX0pdtwgxMDyMXUVqZCmjxQBfNoP8GMQ6N5+J9wMRiRXlKIfiVRZcuf
 +POxfqa5xkVYOEnHUNmBzwTVjY+LkCkN7wCtYJGsqJBJgt3lY+1MwHPVckQoVtB1NVDmyZ9sA9K
 +QTB4KOwlUgnrYJw6A9fbdew56k77uJfrrbFqiuEDU7jiJkPG/54mq7k7jqTLVjJ314Rs47drRj
 JbCu5NxSGHnRiaMrXm7OOV8frbTV60bO3VtFbCnaEcuGABGVH+LmNQ==
X-Received: by 2002:a05:6a00:812:b0:886:cae0:fb6f with SMTP id
 d2e1a72fcca58-8ba852368abmr890817b3a.14.1794263488778; 
 Mon, 09 Nov 2026 14:31:28 -0800 (PST)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa506bca4sm165830b3a.0.2026.11.09.14.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:31:27 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v6 07/23] target/arm/kvm: Use kvm_vm_check_extension() where
 necessary
Date: Mon,  9 Nov 2026 16:30:54 -0600
Message-ID: <20261109223110.1619504-8-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
References: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x431.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index 63a3e78efd53..dc1004785cb0 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -384,7 +384,7 @@ static void kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf, Error **errp
                              1 << KVM_ARM_VCPU_PTRAUTH_GENERIC);
     }
 
-    if (kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3)) {
+    if (kvm_vm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3)) {
         init.features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
         pmu_supported = true;
         features |= 1ULL << ARM_FEATURE_PMU;
@@ -695,7 +695,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         return -EINVAL;
     }
 
-    if (kvm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
+    if (kvm_vm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
         if (kvm_vm_enable_cap(s, KVM_CAP_ARM_NISV_TO_USER, 0)) {
             error_report("Failed to enable KVM_CAP_ARM_NISV_TO_USER cap");
         } else {
@@ -726,11 +726,11 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
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
 
@@ -1978,7 +1978,7 @@ void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa)
 
 void kvm_arm_steal_time_finalize(ARMCPU *cpu, Error **errp)
 {
-    bool has_steal_time = kvm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
+    bool has_steal_time = kvm_vm_check_extension(kvm_state, KVM_CAP_STEAL_TIME);
 
     if (cpu->kvm_steal_time == ON_OFF_AUTO_AUTO) {
         if (!has_steal_time || !arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-- 
2.53.0


