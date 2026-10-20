Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC46606A31B
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Oct 2026 10:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pH4snO+n
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJ7K0-0004V3-JB; Tue, 20 Oct 2026 06:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7Jf-0004DP-Jo
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 06:43:35 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7JW-0004Kq-QB
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 06:43:35 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48df54150dfso2363440f8f.0
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 03:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792493005; x=1793097805; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xpvK8hxiiby7P5GAABphDAJ86oAgF7lyRnWJr7JT/sM=;
 b=pH4snO+n+tK8npEh5Hcs3JcM0q1mTOJ9zdmziUOKQ3QBteryHWf/cF8v5QFC3V2pzf
 71k8E7OOqxh7zbAuxXK+RVTTFUH7z5MnevEmwSbsofHTfL91V0Hixo8cniQHClyZB5hF
 Tk4NBcCah652FlMstMgCsurf8DuY7V5XtvUzpT8XZ4uDVQwqVbfyH7t5AITo7yHPyGSZ
 srxrhp3u44+N21zHBy2Hy4WkOI2hEAof70OQ7aBGtsdqUnU8AitYOvjZhXr5iyI8S7L0
 ykwIRX0ucApkb5gyy/cKnczdvJW+2yn4Wom4joTGwGdEq3OR6Dyr3jbEJqYUDM6bAThx
 h9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792493005; x=1793097805;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xpvK8hxiiby7P5GAABphDAJ86oAgF7lyRnWJr7JT/sM=;
 b=WKuwFPfZ/l1Xa8RKcQaOfT8k6ynNZC1Cq7gxmaqm9b9kNjifYSuJyPGQdTiNeEj85Q
 a3W9vtOW3c7O3R6f8KIvWssPkyi1VBS1XT1dhv26F2ax1bjKCSGEZQ5khuWRPRZdu2Qc
 yDvTv1zNsmDDhvWEzfPIIcwvGgcTE0QfF/8aCjVJqSCGGaV5Y4A/zlSbtK104L5DhmsO
 MhV1+OTNSW+k5vD0Q/8LMQc7xYbF/il2USqtSxAhQiQcsY8SUHAO8/Wky7SKtES51gBJ
 ghj9rZyKaCZ2st6slZ3VdNKfAJziws2RB6xSG0TxHEN0oTHihubwYn9E9OYTvlOAOTFZ
 Xk6A==
X-Forwarded-Encrypted: i=1;
 AKwUvBy2LEARKnkYeydIc1GFrZVGk2dP0rmYyM5ovRunxGjDw7acG4gY1kofu6l5rw8ms5up+Yc/m4/Jbw==@nongnu.org
X-Gm-Message-State: AFq9FYIG6F+KA3BWQA2Fs8zEqOBIe+EjGIbTWN//CxJu7bL+QlG/SH7C
 DnhpNFgsjDqIrCLkIWnJQxwFQuiBaecl2bnnVFrryn0W19iCatKGgi4WET47x+SN8iw=
X-Gm-Gg: AYBFou1t/RAgLkoa7kWpdw0HBvHRh6TRo3nwomnwYw6q5KUCqUabj+RT0zpVq6CSk4J
 aAkYNFpRGCoNDaNv0oW4CM+aT+8kguRNxKAfcqyEEEeJmW+mdIkIIwf5auUsuuhqZuxunRF3+m9
 lV+CL+suNVUEo2jtD05LObErgzvTe561OdYmfdeZwEnMIP5B7RPEhw2NM1NRnQz5Kzp8bwtuJSN
 2dCpTAMswGHgz0gJ2GVmSzgsmc8jDob2E7JnbiPAZ8WeVREenGO48POb3emGJ4814po7jjrU/qs
 bjMOeVSh8yt3jjIn+hjcuyF74bMcSkmNPlM9V1V+5OY2HivJFTPGZUvhriILvRyl6UxcLcDV+NX
 XpV17gwpOnl63dnLkLyRaz0vsZijPwz6axc9OZMANAGJU7fJE4korkOPT2meidQSJ9ioGySonWC
 RxvMcFo3dOBxfrdAzUL6SUA/zmAORMqv/4ZJPMCOfvJuNlrpMrLQFpod/l2tWNGaxohbdezvM=
X-Received: by 2002:a05:6000:2388:b0:48d:dec7:974c with SMTP id
 ffacd0b85a97d-48e07985764mr20442510f8f.7.1792493005061; 
 Tue, 20 Oct 2026 03:43:25 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d818237sm5338778f8f.27.2026.10.20.03.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 03:43:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CBA755FA65;
 Tue, 20 Oct 2026 11:43:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bibo Mao <maobibo@loongson.cn>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Song Gao <17746591750@163.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Halil Pasic <pasic@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Bj=C3=B6rn=20Walk?= <bwalk@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-s390x@nongnu.org,
 David Woodhouse <dwmw2@infradead.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-ppc@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, linux-edac@vger.kernel.org,
 Glenn Miles <milesg@linux.ibm.com>, Chao Liu <chao.liu@processmission.com>,
 Cornelia Huck <cohuck@redhat.com>, Gautam Menghani <gautam@linux.ibm.com>,
 Xianglai Li <lixianglai@loongson.cn>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Chinmay Rath <rathc@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Amit Machhiwal <amachhiw@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Weiwei Li <liwei1518@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 05/23] target/arm: wire up empty KVMAccelCPUClass
Date: Tue, 20 Oct 2026 11:42:59 +0100
Message-ID: <20261020104320.3686723-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020104320.3686723-1-alex.bennee@linaro.org>
References: <20261020104320.3686723-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We will fill in the functions in future commits.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/kvm.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 3d905f8565d..7a3c957c3a5 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -42,6 +42,8 @@
 #include "hw/acpi/ghes.h"
 #include "target/arm/gtimer.h"
 #include "migration/blocker.h"
+#include "accel/accel-cpu-target.h"
+#include "accel/kvm/cpu-ops.h"
 
 const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
     KVM_CAP_INFO(DEVICE_CTRL),
@@ -2662,3 +2664,26 @@ void arm_gic_cap_kvm_probe(GICCapability *v2, GICCapability *v3)
 
     kvm_arm_destroy_scratch_host_vcpu(fdarray);
 }
+
+static const KVMCPUOps arm_kvm_cpu_ops = {
+};
+
+static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
+{
+    KVMAccelCPUClass *kacc = KVM_ACCEL_CPU_CLASS(oc);
+
+    kacc->cpu_ops = &arm_kvm_cpu_ops;
+}
+
+static const TypeInfo kvm_cpu_accel_type_info = {
+    .name = ACCEL_CPU_NAME("kvm"),
+    .parent = TYPE_KVM_ACCEL_CPU,
+    .class_init = kvm_cpu_accel_class_init,
+    .abstract = true,
+};
+
+static void kvm_cpu_accel_register_types(void)
+{
+    type_register_static(&kvm_cpu_accel_type_info);
+}
+type_init(kvm_cpu_accel_register_types);
-- 
2.47.3


