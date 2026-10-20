Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92542606A31C
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Oct 2026 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WLk8/Ghn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJ7Jh-0004Es-4a; Tue, 20 Oct 2026 06:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7Jd-0004Af-HV
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 06:43:33 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJ7JW-0004KE-0E
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 06:43:33 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a1e34ecb02so15805585e9.2
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 03:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792493004; x=1793097804; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=W1YwD7IMkeAO6OcLReHpxRqQRfDPA/W1esQDN17JAFU=;
 b=WLk8/GhnBAieYOmX5YzfTP0mUrMUmVZAg2B+KvR39R/M5uB5DJ+7uF26XOABPfeqeP
 vRk7l4jSFagwJqIL7hNe7aj5datw3BXx+bb/tQQNL/eI5Gvn+8/NfxEazDUlJCOIHg1P
 YCWgJyAcISEIgOoNXzFEsTRALa73sK35O5uhgG/LBayB+71L9gnZfJ+A/KVzVk5Gj6GT
 QsOLGr9OAfBk9IgZb2BL9nnfdE1StgvhNqPjI+llNilprLpnL1Nj2LW8Glu6Bj8oG9qV
 ZXNEDqDj99KMhX98okb8zcPyBhyh9PO85uHDHwHV7oOxh/mFzfRa6bQkgav02e1dI30o
 FNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792493004; x=1793097804;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=W1YwD7IMkeAO6OcLReHpxRqQRfDPA/W1esQDN17JAFU=;
 b=RftP22LeID6zupFlGOsl5PRj6LZlKOZCHnSwNtx5sqdCsXKYa2UG5frfOzc3CJWZ4b
 +3ZmQoW+A5Pv3aETUO++MQilm5UCKOHaFeXZTegSAv4mkM1MBpUjHmTAvO96UiwziWBM
 DIZj3o+3WrO09yXqSJCYuEC4TnJ0MOgL4VqREDBUnI5JaDuzx+E4U+jsbdf/ogFJ+7f6
 cHScDU69u9STfPD3uqAfBLoa7VdhTtQuN8r8y0Sta8aD/iHi4z6zfIn/1NyUB+X+z/fm
 LESyzXJezV35SW+Y8e/t5mLY3SkNb2Xqth056KurzyA7LUugzjyvc0iND8f+WacKbhDl
 d+mQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxLIX+lRd91HLRqTzQlBLuTtEt++L5dEWR8Be5w5KSlx8RsvFyisa1wrP4ECVZb29F9wGVaJQZNrA==@nongnu.org
X-Gm-Message-State: AFq9FYLCi3xTB0btbfM6WDPPhLBtqomHvIlRfUT60iiR1DHd2uPiIKQH
 iWBBSb6H6XmRQRCsTLj+TzZTAp45KU04IY/Or1EUMhcHMyjzklKC4Rl4w5YIpMHNcxs=
X-Gm-Gg: AYBFou3DicwQL/Ib0+WYn6FHvY4zWqFTz2TgTOkSSq2nSAOQb9ZgmTpeowzHpLkBFI5
 Z+hEeiNtGiXbZw9c2aiTq2muSnL10bd3pUKNU4QZasVuzIDjyAu7HTNUavxOOXuIhfFTgVaFIMH
 cyOA1OuiYpSj1rXQHShNTzEsnbfuSmX/KecP015UgUGL1IbkYXtFQ1l9wPgtbAYQt2L97wfvBl3
 tp+SZeOTKJR+o8Db9IKJdOLGQKQ8sDLsuQL3sKiWekpsbGdnTNXOAouAjmcuSu41AftsaB11VT0
 mbS6/CVVtm1Q++82QpDgDmKy4SzbpMTiy3YZWygwmqwfm1heWJycoLBjHb7Xi1gU6SirJ7iJM/i
 wdfGKhC0btWYcr4b15GSWJ5IDzn5DMCz2V2OmsGmIUPiyXLYuP73sMFYX11oe/wzHjF0tBaoD8P
 Q/2LDbwSCUiyVEj9zQ5glwmXR+JA0JGGkUWOrysiWyiRATu5TIbEMEHFr19qMrFR5YtJJo9w==
X-Received: by 2002:a05:600c:8b6f:b0:4a1:d307:d578 with SMTP id
 5b1f17b1804b1-4a1d75e6d1amr197176025e9.11.1792493004251; 
 Tue, 20 Oct 2026 03:43:24 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f2c9e9c3sm56999645e9.3.2026.10.20.03.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2026 03:43:21 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B08A65FA43;
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
Subject: [PATCH 04/23] target/riscv: wire up empty KVMAccelCPUClass
Date: Tue, 20 Oct 2026 11:42:58 +0100
Message-ID: <20261020104320.3686723-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020104320.3686723-1-alex.bennee@linaro.org>
References: <20261020104320.3686723-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
 target/riscv/kvm/kvm-cpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
index 45ad5e1525a..b3fa0548c8a 100644
--- a/target/riscv/kvm/kvm-cpu.c
+++ b/target/riscv/kvm/kvm-cpu.c
@@ -33,6 +33,7 @@
 #include "cpu.h"
 #include "trace.h"
 #include "accel/accel-cpu-target.h"
+#include "accel/kvm/cpu-ops.h"
 #include "hw/pci/pci.h"
 #include "exec/memattrs.h"
 #include "system/address-spaces.h"
@@ -2195,18 +2196,23 @@ void riscv_kvm_cpu_finalize_features(RISCVCPU *cpu, Error **errp)
     kvm_riscv_destroy_scratch_vcpu(&kvmcpu);
 }
 
+static const KVMCPUOps riscv_kvm_cpu_ops = {
+};
+
 static void kvm_cpu_accel_class_init(ObjectClass *oc, const void *data)
 {
     AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+    KVMAccelCPUClass *kacc = KVM_ACCEL_CPU_CLASS(oc);
 
     acc->cpu_instance_init = kvm_cpu_instance_init;
     acc->cpu_target_realize = kvm_cpu_realize;
+    kacc->cpu_ops = &riscv_kvm_cpu_ops;
 }
 
 static const TypeInfo kvm_cpu_accel_type_info = {
     .name = ACCEL_CPU_NAME("kvm"),
 
-    .parent = TYPE_ACCEL_CPU,
+    .parent = TYPE_KVM_ACCEL_CPU,
     .class_init = kvm_cpu_accel_class_init,
     .abstract = true,
 };
-- 
2.47.3


