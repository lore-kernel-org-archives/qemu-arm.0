Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CEFC61DC4
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 22:02:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyzD6-0003gf-P2; Tue, 25 Aug 2026 18:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCo-0003BZ-2l
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:18 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wyzCm-0001II-3Y
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 18:01:17 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2cc891373e0so4710175ad.2
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 15:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787695274; x=1788300074; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=flXrUG20aPexgqGmyi5LqrRx9IuZht6hYiik7BZP4Bg=;
 b=pDlfux8HJJbSo6EuiEQlpxOj2Lt3pqWfyfVWicwUhvp9dZ81VdnME9MHeaQdVC6Rqm
 SPmlFcJoB99Aa4/sEuvRfC5ZhnCVIYph68HekIZfmyBbE/GtwHfYVfD0SBj9O1F1tDk3
 4QW7vw6HyCKAsbxkG67nveGVjkjV9oxRb2ZewoVtqzw8M91k/MEC07oTc/9YI7DO5v0S
 PBcFsHBQgQNu/4W3wazxeaT1oZozOiZCQskAkQM+zj9PyAKN60TlfUksy24nKCe7Nhr/
 gAGpCALysYH0WgF41EBRdBlMylOinFWRBnwqd4tHdTF5OQ9yU55KZDwvCB0+s7Inf4nM
 tR7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787695274; x=1788300074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=flXrUG20aPexgqGmyi5LqrRx9IuZht6hYiik7BZP4Bg=;
 b=GwahSivwrFo6oL/4lzrulu8trUW79MqvmaegMfWc/S8GeGh0YOLFOeqEYjdC74Rh8A
 u6+Y/fFg5lM/veQ2b3JGAzDl1BYXbjOQ6tqEKRjE6HuWK64ErE9zVi9ao8GE0nD1pm5O
 jr89mS2e2MMIgI53KHXmNLccEQm8iOSOBEfnOVZpRcC3LuuJWxgfkcz5Nr96N5rNg81X
 PbKAiIyOTmX1S3O7AGafOzyxcw5jFzHux5s+0SdpP9/qVUp2eU7IXqfC6jnpxHRY4tKM
 +j3Q3tqmbxtsET/pvuMCIkHxoRcBNW6cMROb6hEWoWZGT27H5RgLswLR8DhMayzGrrsE
 KyqA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqZKRen0So4YQWjmo4Is0/Q/qFC+N7yvjPXDFHivRrj5eEC3gclxj4QOhmfu63A1MKDdRpe13kdtw==@nongnu.org
X-Gm-Message-State: AFuF++m7b8nY07QNj9+RwZ5241F/T/peCLy4tUVoNit3jwhr+5DM7dSF
 CzQAAGSW9kAj8LGT2rZQN+sLUpLqgYqfkswv044zc3e7FbpI7vpexmGGMzykcYg32bc=
X-Gm-Gg: AR+sD12l9OxhqamrwmATzOhcIyAainJZ/B5whx455xOkBDi5C5hsVBwDcQAY3dET7ok
 KZHuCI0gvaiKZZnFbnN2cWR/zJw1cTymAazTeJhNDFgTZKUMcb9fEPnUZMYmRKgnNvn7GA5JwS9
 1H/1dwljKwES3ziPgiauCDFOhC5unXAVf+j/wRXC3wr8S3VBslwh0PO2rBT5qbwNkrmZ3kBJSe/
 rzd3HhKuwieINCoK3UpZ1VC7mssw1mR8FwLIatXsvSjTkBoXXjZw041DHb80e9LNTuYOy9e3coC
 uqudF1LaI1nco21BU8PorL4RhVzkJGcat/tH2ya2lpaZmfViyY0vDwKh7rlM1EG1mEXA/RyeeWX
 J1Jkl0z1IWfg8VVp3zSij4fsDa1kRU/hush93zYNPLo7eUITkV0U1893Ysp6D9iOaMvHjgVQWjJ
 SwrmyZgGya6dMaPXnitfuZDGZqq61nQEq97lZQzF0HeMgTE+cbW16gcNT6UA65CHPMUA1GhUuNj
 t8fEByOCUZh517cOqPle+sT5Q==
X-Received: by 2002:a17:90b:2f8d:b0:396:4dfb:5890 with SMTP id
 98e67ed59e1d1-3966d144197mr4659218a91.2.1787695274276; 
 Tue, 25 Aug 2026 15:01:14 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:a37a:292f:1363:c0af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3965d119724sm3090120a91.2.2026.08.25.15.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 15:01:13 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v3 05/24] target/arm/kvm: Split kvm_arch_get/put_registers
Date: Tue, 25 Aug 2026 16:00:42 -0600
Message-ID: <20260825220101.3443954-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
References: <20260825220101.3443954-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pl1-x62c.google.com
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

For a Realm, KVM is much more restrictive on the registers a VMM can
initialize.  To prepare for Realm VM initialization, split the get/put
register functions for a non-secure VM in their own function.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 0c853d17413e..33ac9528c45f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2166,7 +2166,7 @@ static int kvm_arch_put_sve(CPUState *cs, uint32_t vq, bool have_ffr)
     return 0;
 }
 
-int kvm_arch_put_registers(CPUState *cs, KvmPutState level, Error **errp)
+static int kvm_arm_put_core_regs(CPUState *cs, Error **errp)
 {
     uint64_t val;
     uint32_t fpr;
@@ -2269,6 +2269,19 @@ int kvm_arch_put_registers(CPUState *cs, KvmPutState level, Error **errp)
         return ret;
     }
 
+    return 0;
+}
+
+int kvm_arch_put_registers(CPUState *cs, KvmPutState level, Error **errp)
+{
+    int ret;
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    ret = kvm_arm_put_core_regs(cs, errp);
+    if (ret) {
+        return ret;
+    }
+
     write_cpustate_to_list(cpu, true);
 
     if (!write_list_to_kvmstate(cpu, level)) {
@@ -2351,7 +2364,7 @@ static int kvm_arch_get_sve(CPUState *cs, uint32_t vq, bool have_ffr)
     return 0;
 }
 
-int kvm_arch_get_registers(CPUState *cs, Error **errp)
+static int kvm_arm_get_core_regs(CPUState *cs, Error **errp)
 {
     uint64_t val;
     unsigned int el;
@@ -2454,6 +2467,19 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
     }
     vfp_set_fpcr(env, fpr);
 
+    return 0;
+}
+
+int kvm_arch_get_registers(CPUState *cs, Error **errp)
+{
+    int ret;
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    ret = kvm_arm_get_core_regs(cs, errp);
+    if (ret) {
+        return ret;
+    }
+
     ret = kvm_get_vcpu_events(cpu);
     if (ret) {
         return ret;
-- 
2.43.0


