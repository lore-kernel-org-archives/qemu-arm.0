Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C2D606A321
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Nov 2026 22:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VyDu+neb
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xQXtu-0005Fp-0G; Mon, 09 Nov 2026 17:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtf-0005By-05
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:29 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1xQXtb-0003pS-2h
 for qemu-arm@nongnu.org; Mon, 09 Nov 2026 17:31:25 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-8b32bc605d9so579416b3a.2
 for <qemu-arm@nongnu.org>; Mon, 09 Nov 2026 14:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794263481; x=1794868281; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=R6shKTPJO2OMKOtP1Scv42yaR7N4lg4logstoB5OC0Q=;
 b=VyDu+nebvUkeEvJ32eUloUeWTIEOTPGQbH2EyMfNQmSbniB64qjZL0wNwlU3g4u2S/
 0Mm5zG/hmSNhfJh4A9PNzAqtzLIuwzAlOIXqhmSdUT38Ps8Kf3BJgfYcyBslXCmDxT5H
 fa7ceZ9VNj+cVEW+aLn23elNRgMY6iDN4Al7As8qroBHRpGND7+OLxcIWY0EnwHtmEw2
 KMGnPO873bsfsHr5/dXcycReATxU9InIyRNMcbO6BMgM04EJ6ZxD+kyY4xDN75GJSjJ5
 5LwfFUbDkfdqXgvJ8SyYGTgVBZ73td+kLk1KCum7t7DD4KYZUjrAdcisgQMrJrFxs0nr
 Hunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794263481; x=1794868281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=R6shKTPJO2OMKOtP1Scv42yaR7N4lg4logstoB5OC0Q=;
 b=l70+XOWPuqyGxdKps6WtbI/uvKSfdQxuI0YkX/ZoncBIPY56DA0RT7ezARtR0Ylj5z
 0ZO7kdCt5KbJb7mTLDx1FXAa22ENyOMfKDFfp0O3F06FyWo8kcTONdCHq9sqS9K/Kf50
 kRYtZJBBZLtpKvmKb9wTnL2l4qyHtwLCYlpMIzHzKEkDeUGeecIgO2QcsG2aorAXZlyy
 e05iP2UPxZ350P7Oyx8U0+vnlY4ofbMSKDNwNqI2yuZYTD479YTAtoyiPAr2y3mBeuaq
 j9PTR9n3DjCACQPwB8BX7MkJf+lfuI3gHHX+2uP9hSy2YnZHaXoRUzKbH8kUEsE8Q2VU
 mVMw==
X-Forwarded-Encrypted: i=1;
 AL+hErHNJn2u7TmAenuBXW7NGbzreTqnVDjxEiXtc/pKXR5qYE/YsKOkjlf+MGlOD3R2n+jB6ctBEWS9sA==@nongnu.org
X-Gm-Message-State: APuU4Z//Y6+/RQuKjZ18JdYNZfSXce120vg8q8/Qpgcb0QVGnQ7Yv1Qx
 ++c0l8kZ2ClwgLZttnf+YE3df287oX6cOGBLHVf1M26egiqPwd5KuZHFhBqxtbv3suSi5xNeiOd
 oIkx9
X-Gm-Gg: AYBFou2++RndW7G/J+JnnL3LZ+9y4IYjw83BTv1mHK25JL52E3gwvfRDiPXY3B4UfXR
 UKd9wP5YJMfuqnnmIyXbREMiRwtnyBd/unk/h2t66wcLx+++IrH/ApadN3e+WB1Hd9lMm0m9zjG
 RU2laH9oGGfu6UIcjUv1phSwlvHDLuKxaOnXGnmLdtJPgdSX1lhRlYYKtEGgVd5tf7Reea85g6P
 oB41dI61IXP8ccREGnKoTtVjDJgfBTX6KyqOp5VEdTsQVbXueg6vXo+xgOK82J9WUSGP6r9Asyg
 uNK8jaFH81ONuxSopy+5/T7d1nkPvCRq3QNONleJ6l0Omg4wgOp1uYIjjBZPEgZLbqHpRO0YvHi
 00V5FKOSkrkj/KvGgYebm/bpBHn6Mn82S60ycoYGoanpk3zjZi9e2tglLrLniU4n+VLv/4aYL/1
 p+GelCZa+fiGXdrIzPr9AVEHk/Z79ZE4crzG3Hj7i2AKV4zbtUK2XP8JPyE1cWxwoslv4k6HYLq
 PNIljKdY8UrGPbLP0UkTr4/qiPxyjAYJgQBPUJO47X0CBGAylXVRCZsZZ7UY3ZHFeBDujINFET5
 yCXbZP1ahM1A4EKZGgQNbd1nSpxSuuB8DrZ6uXww8OpInzYoalC/ug==
X-Received: by 2002:a05:6a21:62c4:b0:3e2:86b6:9bf4 with SMTP id
 adf61e73a8af0-3f18ebb3200mr480367637.14.1794263481319; 
 Mon, 09 Nov 2026 14:31:21 -0800 (PST)
Received: from p14s.cg.shawcable.net ([2604:3d09:148c:c800:54d7:1b5:4356:16fb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8baa506bca4sm165830b3a.0.2026.11.09.14.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 14:31:20 -0800 (PST)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, enju.kohei@fujitsu.com, lorenzo.pieralisi@linaro.org,
 gshan@redhat.com, michael.roth@amd.com
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org
Subject: [PATCH v6 04/23] target/arm/kvm: Split kvm_arch_get/put_registers
Date: Mon,  9 Nov 2026 16:30:51 -0600
Message-ID: <20261109223110.1619504-5-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
References: <20261109223110.1619504-1-mathieu.poirier@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x436.google.com
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
index 04dd85ee2776..5f40b665cb7d 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -2257,7 +2257,7 @@ static int kvm_arch_put_sve(CPUState *cs, uint32_t vq, bool have_ffr)
     return 0;
 }
 
-int kvm_arch_put_registers(CPUState *cs, KvmPutState level, Error **errp)
+static int kvm_arm_put_core_regs(CPUState *cs, Error **errp)
 {
     uint64_t val;
     uint32_t fpr;
@@ -2360,6 +2360,19 @@ int kvm_arch_put_registers(CPUState *cs, KvmPutState level, Error **errp)
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
@@ -2442,7 +2455,7 @@ static int kvm_arch_get_sve(CPUState *cs, uint32_t vq, bool have_ffr)
     return 0;
 }
 
-int kvm_arch_get_registers(CPUState *cs, Error **errp)
+static int kvm_arm_get_core_regs(CPUState *cs, Error **errp)
 {
     uint64_t val;
     unsigned int el;
@@ -2545,6 +2558,19 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
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
2.53.0


