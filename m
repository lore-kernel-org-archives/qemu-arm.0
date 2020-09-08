Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp393157lfq;
        Tue, 8 Sep 2020 01:13:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKWLt+Rv4coRSvewy20VqNxB7zJLSexqVcMksV8J4cb/FpptxDoW17w/otB3UW8Db0WRIA
X-Received: by 2002:a25:404c:: with SMTP id n73mr20773777yba.92.1599552839438;
        Tue, 08 Sep 2020 01:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599552839; cv=none;
        d=google.com; s=arc-20160816;
        b=Apx9//weGXRtvAKpMSIcWuk0vv9NGMJ81QwnO7t+MNI206y9I0i5plg4St7dKYYp5E
         As1eYPq4MXodv1GSfJ0hIvggmTvsG7aIumxCZfytxvxGmouceIYRkc1DNu4oRLku+5Ip
         Ou1wl1JqunpurOt+RsTuoMWKuZyiRqRUuFYpfqtXZ1LKtBb9Ir7Sbqm6joHy3DdEOcVR
         r6iVGTxFQ9c5x149zTbR0nHuawvXPysqjstx+vJ7WyJFEUZPe2+quUfib3rYNs0JXgu9
         jLHCGbN5Gbujvk5hx2N4Jziz+9sZOqW5jcPeFVgHprpB2DTh3vqHH/wtMLkIw6c1I2q+
         7eMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+orWxGBa1SRb2nSQN/q2qViaNIRmFc8NrraWTotMcp4=;
        b=iJs5FFG4DNyQRmMvJ+WlPwsV1u9+LleeKVvresR4IyyL4MQV0iHJujFQ86iksPneGS
         yXcVD1lrA4upksr6bY7nWOP161wKwN32DG9FfYQR7pnGxzsrvHvCBBzLudhv5eqIYJxz
         mDFbXGOA8KuzVRVqsAkobe4cDX0CHH2yjU7ZkzbKjj3yXWjAAGtH+92oVLtmbzmv9xbG
         6R2pwnNLaSZYguFQeLjpILh/5wYT5VOGIDBtmZsJjbObB43240ydK4xOwLjHk71TB+Mf
         Fg036yM+CRw1R7vh2xpZXnOrfZa4CR9IQPJcBDcQR6ohvJMbBEkSwpFXemunFMBTT2Fi
         pN3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xkAbbSsM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19si7903670ybj.18.2020.09.08.01.13.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 01:13:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xkAbbSsM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFYlK-0005cV-OM
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 04:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYl9-0005Zl-Tm
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:13:47 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYl7-0000QW-1i
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:13:47 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 34so86491pgo.13
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 01:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+orWxGBa1SRb2nSQN/q2qViaNIRmFc8NrraWTotMcp4=;
 b=xkAbbSsMHL13QIEKseh5FvDJpbVn1+R2Sg1fgccSIWpkC58PzKCqMkM1NBtdSnWE++
 ipaKwJSL2vLp8dsX0n3pvml9YkcnEGputtAoaK/8rCSraQu60jc3FzpHS2eNrrT1sMXi
 FPMwomj4AQ6HKJQl9fd+eEg6m0sicxxuAHVG3+Qlfgnc0q/ss013jz7NS0cgpCPqn7sk
 jnlYhdfAwcoSB8ttZ9HaALVK1We1M95q5+JG5JpNWtQJF/I12lsT6TmkLimIMEfupF8n
 qj0QCkTy/H/dnaY09xmSvUu+9b0JR1BH8mfAH+hzZ4uXK5AkRwn2PpjMyAineTKNNh5U
 8H7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+orWxGBa1SRb2nSQN/q2qViaNIRmFc8NrraWTotMcp4=;
 b=X9M5Y+OGfHKr6LALDdgPspWiA6d47PxnEeh1nn+JLpWBcxvFFXm21TXCgZ7Lft3yts
 Im4QvbQQTLKteP10QDEJ1m6WJiPLrURjY6VAofgJX1wTFB7Z1aWm3A6uIWQgyPPjUUOc
 TnVyQ9IgMyTJvLwtdwzbjWfNMD+/yg2kd2KREo0/IvJRGzFbcF0Z2hEh8gmMLpvrh34u
 Q9yRoMuWUsKlqWDhUQ2ZXcxJCfz4Xb33QTKLb8+6eyXYw6SVYHnLZzP6noGRunYcVM96
 0fFR0mPoL9Uep/kHj7LD/8eNVHOGOHPmwTY86KOqwgKxVAudm9qphXM79r1vYxmKampa
 rtZg==
X-Gm-Message-State: AOAM531IK4C8k3RJ+QyrZWQJW5naqxb9BCnfMtZsdxjxYX0EAdnGFKEZ
 DHRMZSkJYAehSyvRCH+PVvoD
X-Received: by 2002:aa7:9aef:: with SMTP id y15mr2846154pfp.119.1599552823600; 
 Tue, 08 Sep 2020 01:13:43 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id m190sm16934788pfm.184.2020.09.08.01.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:13:43 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 01/12] update Linux headers with new vSPE macros
Date: Tue,  8 Sep 2020 08:13:19 +0000
Message-Id: <ca77b62934a54aeece900d4a0964a0da78ddf16d.1599549462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1599549462.git.haibo.xu@linaro.org>
References: <cover.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=haibo.xu@linaro.org; helo=mail-pg1-x52e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7CZ0Tu885rrr

Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 linux-headers/asm-arm64/kvm.h | 4 ++++
 linux-headers/linux/kvm.h     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/linux-headers/asm-arm64/kvm.h b/linux-headers/asm-arm64/kvm.h
index 9e34f0f875..802319ee02 100644
--- a/linux-headers/asm-arm64/kvm.h
+++ b/linux-headers/asm-arm64/kvm.h
@@ -106,6 +106,7 @@ struct kvm_regs {
 #define KVM_ARM_VCPU_SVE		4 /* enable SVE for this CPU */
 #define KVM_ARM_VCPU_PTRAUTH_ADDRESS	5 /* VCPU uses address authentication */
 #define KVM_ARM_VCPU_PTRAUTH_GENERIC	6 /* VCPU uses generic authentication */
+#define KVM_ARM_VCPU_SPE_V1		7 /* Support guest SPEv1 */
 
 struct kvm_vcpu_init {
 	__u32 target;
@@ -334,6 +335,9 @@ struct kvm_vcpu_events {
 #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1
 #define KVM_ARM_VCPU_PVTIME_CTRL	2
 #define   KVM_ARM_VCPU_PVTIME_IPA	0
+#define KVM_ARM_VCPU_SPE_V1_CTRL	3
+#define   KVM_ARM_VCPU_SPE_V1_IRQ	0
+#define   KVM_ARM_VCPU_SPE_V1_INIT	1
 
 /* KVM_IRQ_LINE irq field index values */
 #define KVM_ARM_IRQ_VCPU2_SHIFT		28
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index a28c366737..8840cbb01c 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1031,6 +1031,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_PPC_SECURE_GUEST 181
 #define KVM_CAP_HALT_POLL 182
 #define KVM_CAP_ASYNC_PF_INT 183
+#define KVM_CAP_ARM_SPE_V1 184
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.17.1

