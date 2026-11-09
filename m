Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FA2606A321
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ey3MeaRU
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXuA-0005Pj-Aq; Mon, 09 Nov 2026 17:31:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtg-0005C9-Gi
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:29 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXte-0003sC-On
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:28 -0500
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8a058315c79so696061b3a.3
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794263485; x=1794868285; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QabwaZ3QztE12fUnRQUDmJLjH3Q7qN4pzyHF5b0I4hg=;
 b=ey3MeaRU85W4S/8XG9Z2t1+EcymusdgZ1+O0zsWccfGxyuR1Jw974iQRHPtTjNdEgk
 a3JY4YDHn2k+jzigvH69VmhlJpHF14h3ErIW2CQq+h5tu9vNUAtYUh6R9M0/BWvTjp5z
 enqdYAXr8Jzjn22N4X1vHua5V96t/cB3H8H51i1u92VAGqHjKROH0Q+dBn1XWTax6Vlk
 RBk9nRGQrjPl+qiy8oYlX/eQA+Q+aMr/0tw7iw5WFzzySRdFQrNw+CrUff+f+5r9eUWN
 04uUBnwsa5UWitp9WK0Ty2kSfD19njrk3L9Dc99FfdnO9zBOIS3xgLymVomVTT0S04Sa
 xN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263485; x=1794868285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=QabwaZ3QztE12fUnRQUDmJLjH3Q7qN4pzyHF5b0I4hg=;
 b=OBKbMAT4dZ7zJyfKmoMCFkaqBqnGtR2l3Lp+olcgfmh0djvEhTfKkm6WERRin7WNmq
 VxoyY7dh8GytkEj90UUmUBrTeaNTILnhcMj5WZhVbfWUaREfd59h0h9qk1MLppvSdJyA
 V4IbBsjx9U3a66P2bD2BUBovyp/lLBAfSh3iBcVaHuBV3+Gvx3ChB+qDflKA+/kgzfGy
 2424+v0Y/STlVnx+TvFMQJjoA64Me8YJE0d4uul5HIYJx/4F3Vqs3I0kq3lXr5pRVW/M
 WGy6OAS47JNxCo3V0kzRJDLR7i4nrUo9ir72Gymb4GURHn6mIGVS0l1WclyUE5JcGGM5
 HyCA==
X-Forwarded-Encrypted: i=1;
 AL+hErHRBRwUrwVLWfMi2EVlTzWhGan1KLSJsdjHs8+HACBU60MtFYsX9hKoJK0wCTHpe5iP7j+/wccGLw==@nongnu.org
X-Gm-Message-State: APuU4Z9dnxnesZNJ66o4nKpom4ZVU2odmv1uhg8WbSt76u3v5WtM5Zm3
 H2od3dDoJYTAV5uWbp5ITtQD95+Djp5Glaya10bbaSROo5gTCDKYMVqkemcRyT8ExXg=
X-Gm-Gg: AYBFou00h8R/SFc/OLFi90BtwrT5VF/0gKIlq0gTAhpEhLb/6vgMAPYoUk/AltNPkh9
 8YQC8S4mYmhKwzaFd9CzO9NHXYZPIy19KjXx/G66jbcrx7ot2zG0TDvRRwVIknUFr7Zqk/qyiZe
 8mBP2DVhwC2BVuCaROJBiubygJ47QyrUNEiH47C59kFcehKxTbvBFeRDGZaI0CeP5FZnptpMVZ9
 aQIhei+Z9boIWl0H68vSBAdjMQn6WNK+Od+vKCJwNB3ZWFSboJydPiy6UT2eqEdm61spXAQN5ao
 7SD5lKzarHVQEULOPzWkhCBPPKHUgDoUtcjFQPIrFMJqYo2pkS8+mcLQ/ex3Iisi/whxtbmgoni
 etELguIUBZ/HN0Bv6GlefiX2hhRWXF4dItTXLwbENamBBHoeKShFU3hDgjyY/OlEecEDMxUUrvw
 5X190msRMam0LB6jBU90/joJ1aCeJe3JDT/tzpElfjJHACKUNviIIhIGFExrKIIAwnKcIAFgei/
 zy4zg0NW3nTf4qo0vzXLu+qx4e7cszu27C619YNf8JiTYgNWLbBa9r6NZaxAJe+TLOmvUtEZei9
 7nB2nAot3CMziK813SToLfBYAr/tOG9hHA/q5248at59N32ZdfWUjg==
X-Received: by 2002:a05:6a00:e0e:b0:886:73c9:89d7 with SMTP id
 d2e1a72fcca58-8ba85237216mr903536b3a.11.1794263485006; 
 Mon, 09 Nov 2026 14:31:25 -0800 (PST)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa506bca4sm165830b3a.0.2026.11.09.14.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:31:22 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v6 05/23] target/arm/kvm-rme: Initialize vCPU
Date: Mon,  9 Nov 2026 16:30:52 -0600
Message-ID: <20261109223110.1619504-6-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
References: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x42b.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

The target code calls kvm_arm_vcpu_init() to mark the vCPU as part of a
Realm. For a Realm vCPU, only x0-x7 can be set at runtime. Before boot,
the PC can also be set, and is ignored at runtime. KVM also accepts a
few system register changes during initial configuration, as returned by
KVM_GET_REG_LIST.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 5f40b665cb7d..941951a9bc05 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2257,6 +2257,29 @@ static int kvm_arch_put_sve(CPUState *cs, uint32_t vq, bool have_ffr)
     return 0;
 }
 
+static int kvm_arm_rme_put_core_regs(CPUState *cs, Error **errp)
+{
+    int i, ret;
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /* The RME ABI only allows us to set 8 GPRs and the PC */
+    for (i = 0; i < 8; i++) {
+        ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(regs.regs[i]),
+                              &env->xregs[i]);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    ret = kvm_set_one_reg(cs, AARCH64_CORE_REG(regs.pc), &env->pc);
+    if (ret) {
+        return ret;
+    }
+
+    return 0;
+}
+
 static int kvm_arm_put_core_regs(CPUState *cs, Error **errp)
 {
     uint64_t val;
@@ -2368,7 +2391,11 @@ int kvm_arch_put_registers(CPUState *cs, KvmPutState level, Error **errp)
     int ret;
     ARMCPU *cpu = ARM_CPU(cs);
 
-    ret = kvm_arm_put_core_regs(cs, errp);
+    if (MACHINE(qdev_get_machine())->cgs) {
+        ret = kvm_arm_rme_put_core_regs(cs, errp);
+    } else {
+        ret = kvm_arm_put_core_regs(cs, errp);
+    }
     if (ret) {
         return ret;
     }
@@ -2455,6 +2482,23 @@ static int kvm_arch_get_sve(CPUState *cs, uint32_t vq, bool have_ffr)
     return 0;
 }
 
+static int kvm_arm_rme_get_core_regs(CPUState *cs, Error **errp)
+{
+    int i, ret;
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    for (i = 0; i < 8; i++) {
+        ret = kvm_get_one_reg(cs, AARCH64_CORE_REG(regs.regs[i]),
+                              &env->xregs[i]);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
 static int kvm_arm_get_core_regs(CPUState *cs, Error **errp)
 {
     uint64_t val;
@@ -2566,7 +2610,11 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
     int ret;
     ARMCPU *cpu = ARM_CPU(cs);
 
-    ret = kvm_arm_get_core_regs(cs, errp);
+    if (MACHINE(qdev_get_machine())->cgs) {
+        ret = kvm_arm_rme_get_core_regs(cs, errp);
+    } else {
+        ret = kvm_arm_get_core_regs(cs, errp);
+    }
     if (ret) {
         return ret;
     }
-- 
2.53.0


