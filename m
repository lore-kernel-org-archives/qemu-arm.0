Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE4DC54F54
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 19:27:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wonRz-00034V-Fc; Tue, 28 Jul 2026 15:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonRu-0002vN-Ji
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:26:47 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1wonRs-0001OF-La
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 15:26:46 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-38d489b6b71so201076a91.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 12:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785266803; x=1785871603; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZnODmfi9jlHeHZOeJx2IurnBfxwM7mGEa2KAs0ZmXME=;
 b=Q/mMlGakGgs2YOgDLwJ79Gl8Ur9xGRe1JVhQf+Yvn4EaA7xzAiuSFi6qoD+RgEAgQA
 hTaL9+FR6zUsY5HV904mUJXG7V6yUYTDa9BzSP7lsEJnlBCIesQRUAfbQ/zzRmGUu+kF
 vO5m76NdKOMA6xCakYjXYKMKQCxpDk7MXSaMsD0Kv0DfI1SulgWSXD0hUwWQCoPDCEqe
 kYQJ2GfoKC+4m+1ezSXvda3LngUrxuiAQk7zmZl/fOfnI9/pkaU1eY3L0NoQyN6JSaSf
 LPeUDRMtZ9HxFSV+3/RFmw1ky5z89zVrNjhKyyFdlvdVsCrcJ7WQoull9IGYz7FYqUdp
 FxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785266803; x=1785871603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZnODmfi9jlHeHZOeJx2IurnBfxwM7mGEa2KAs0ZmXME=;
 b=WNEe4eP1cpne91Klh/NRN9ZZCBO+PQEAVTYMqFiw+qk4PJVjbloZamruvXUHBWrIq5
 AH913d+EtT+II8bnA6uhPdgtvtc3YK+uLDPtiJC73NqzTjoSpFGjWQJxOiVSiPPYLGa5
 G2U44PMsbTzMoDeZPk3nhCWPoix4K+P/ePki9g0vwySwiP9GWgGeEG2u9GOdFsNmhATR
 MKfK18aTo8181C/LaKg1qTBx8He2PMiuZ5v80ACmVUbx1Q0w26H/UFgjvPJXjMI50U8j
 AyuElsIyGzvlwpyNihl97w0h3IxUQ4DkJeyHqPDUQLsl1ejvhpOrpAA2glNpAH6Wyj31
 KtfA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpNbd3reOrCYv1wRQqWp5w/eoKf5i66q643xZBWsmt7rvH2ZdpH1GryEmBAzsNRNm3U8kpwH4QKTw==@nongnu.org
X-Gm-Message-State: AOJu0YwiqXI+8NTvnZgzsn4FqX1AkOeo2jEEveXVOkr7bWfEV9vB/aJe
 wK9+Mv0naQl3Ggb4FR1ZT6P5DQhUpquI5b2Tkz4JHeDGPgF3iR5sF+qXhVf69yo2tyY=
X-Gm-Gg: AR+sD137d54ND++QBoph98BdvuI0mBPt2kqdVLd0G2+VN/2G7EfEsKvA7TBWMv2isSs
 Nj2rmN9AJBNWcRxfr5ot9jrVuXxRp6ifQ7kkN1ApngcOa20cTzvdRtvyvjR1okmYRdyuQEzzU35
 BkTWIn6EuDCaf1zKkWscvyA2PvMRdF1LubZvtvPrtqdjYxKk9CUvmKSfcRxBy2mz1PCLwPgJ8b7
 t7XXlEcZEu3d2s64M73eQc+QZJ67kUhA0Mtt3LWKn43IYbvptdtNnWygIMQqVqqi4+cd/PgqW1o
 AXuaJcXsTqZCSXBNM3mKzXD2mpajtb63zEwbCFLRlpey/Hun8ikFIjLKOfb1PCsB6XO8ztDmgTj
 9KlaO47tpO0tJc1ZoSK9Z86qKDxkvYdzuqK0bsbllmOG1kFYEg1aPaGP3/rU6M3LmDZiA1iYbW9
 E8Pv+x8yP0wAlF3bwCFLDrmNna7TW5IwinIw1gUyg=
X-Received: by 2002:a17:90b:3802:b0:380:9f17:6df3 with SMTP id
 98e67ed59e1d1-38f6a34e1edmr3788843a91.4.1785266803143; 
 Tue, 28 Jul 2026 12:26:43 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:b9d1:87c9:a085:86c9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38f7f1353fdsm372650a91.8.2026.07.28.12.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2026 12:26:42 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [RFC v2 05/24] target/arm/kvm: Split kvm_arch_get/put_registers
Date: Tue, 28 Jul 2026 13:26:11 -0600
Message-ID: <20260728192630.240375-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728192630.240375-1-mathieu.poirier@linaro.org>
References: <20260728192630.240375-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x1035.google.com
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
index 401a6f669cbb..33c3763aebfa 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2169,7 +2169,7 @@ static int kvm_arch_put_sve(CPUState *cs, uint32_t vq, bool have_ffr)
     return 0;
 }
 
-int kvm_arch_put_registers(CPUState *cs, KvmPutState level, Error **errp)
+static int kvm_arm_put_core_regs(CPUState *cs, Error **errp)
 {
     uint64_t val;
     uint32_t fpr;
@@ -2272,6 +2272,19 @@ int kvm_arch_put_registers(CPUState *cs, KvmPutState level, Error **errp)
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
@@ -2354,7 +2367,7 @@ static int kvm_arch_get_sve(CPUState *cs, uint32_t vq, bool have_ffr)
     return 0;
 }
 
-int kvm_arch_get_registers(CPUState *cs, Error **errp)
+static int kvm_arm_get_core_regs(CPUState *cs, Error **errp)
 {
     uint64_t val;
     unsigned int el;
@@ -2457,6 +2470,19 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
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


