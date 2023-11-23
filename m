Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp150052ejj;
        Wed, 22 Nov 2023 20:44:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXc2kSlV3shMfFApcmTJ+f2K8CtWqhFnJr83W+rDZxahkqOQ8p/TH5BeGfNT6nJGClSr3t
X-Received: by 2002:a05:622a:100a:b0:423:70d0:6f2a with SMTP id d10-20020a05622a100a00b0042370d06f2amr5448145qte.53.1700714675820;
        Wed, 22 Nov 2023 20:44:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700714675; cv=none;
        d=google.com; s=arc-20160816;
        b=z17ObEUOZTtJPFFNlUxJg5pdWU0g28iA7IAdjdYVv/VwY49hkqowxKbio8FqVXqu6z
         PZMFOAKulYETXUTE67SEcMrl5rofhuBJUGmVRYwYX8wIF9tpa8xld6S5aaWcktrcgqVf
         FSbBxUECXprAzz51S4GVEIx7AVi+jbVX4HE9eWBU0AtHNytg+gIph9nSP0sAYwFZaEi8
         iZyHhUyQI6ZHhhjGzizaoMqPOZHicQ9Sb9rkQ6Fw/uyezTtnEBFepaiNiE2h1xtFvH0W
         gGA+ldlt9LGUrCWmWPSlnWIDxOhdq3PplQBNN3bUHXlT8oNtBL2ZXzNGlkqA6EZYLEKL
         +M7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sKoFS6vupvdOb9gSEJ//vdL16AVl5a0a1fSx8jeXTzw=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=C/1ryPufX4tBalyBZH5KcbZMCgvXh4//dU/R9Pe2B6mgu7Heu5KEU8RAe3i4llCw2t
         lQ12pl++Dqy6O78Q/T5pi0KjFWN0y2jNQjq2lyQyK+kzxCxSMus+JyydyzHhQAnRCd1z
         HtuL418vLYJpdySzyMvmI8XORoan0PwNDR82mAOQk1u9/I1t46McSdTxjL5ymek6kvT/
         jG7IPwbjtxiHLKj/hCyPXCp7IsHAyXdlRD2WP0a4iHFAx2sGx6reKYK9ooj5Gug554JF
         X9zpAC/GBFELJggsnxD8rUQxFDCMZkC7TJ5OKDy+xPAb/MSn6sVy5ubJjk6iBLk46IEA
         ExjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aYZ7ACcy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020a05622a008f00b004237216688bsi460822qtw.340.2023.11.22.20.44.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 20:44:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aYZ7ACcy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r61YM-0006dV-Ej; Wed, 22 Nov 2023 23:43:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Y2-0006OQ-Hg
 for qemu-devel@nongnu.org; Wed, 22 Nov 2023 23:42:44 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xw-0006CD-Ny
 for qemu-devel@nongnu.org; Wed, 22 Nov 2023 23:42:41 -0500
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3b83432ca31so365782b6e.1
 for <qemu-devel@nongnu.org>; Wed, 22 Nov 2023 20:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700714554; x=1701319354; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sKoFS6vupvdOb9gSEJ//vdL16AVl5a0a1fSx8jeXTzw=;
 b=aYZ7ACcy0X2wpyy1XPWRSKVvHEMCQJqc3ACbQ12cG1lcZ4qxMxD0G3Xcu+rq7awOrK
 LqIWBsWQ9bU4DnyxAaxFRX9sfdGZ2W4a5RiifId1MRE8VDDiofpYGP00rLk3HPUBOYZp
 0TEZd+Zb0wpIPwIHPvBOmYNXXwIhCJZ4eonWZ0ukrR7BO6Xg3Vqv7j20vKr0t+tiwi+5
 kS0s1HLE7I5NNQMV//fwdBGYpCQt91PaY4SJFaX21Vk1ZKH5BJs+a8jytvUHWQHTN0qN
 QqoyNnzrTqDGIYDJVs/Z8ZnCgDOwEp01hlTY8BXp74xMj++umU47I4uCXk2XDEq0QH0A
 7jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700714554; x=1701319354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sKoFS6vupvdOb9gSEJ//vdL16AVl5a0a1fSx8jeXTzw=;
 b=OEoc958EEjqMmDlVIHO8g/hXxvZVcduPAsjfoaqiEd1vZqlBS5OEsEndNzPEUJMiX/
 DkkJQT42UDZGSKcaFzS18BwRO2d1xgA2094V5emJUchNlMLkkRRtkyUH1TM4Xq4o9LOP
 LC86vwW4lBCaH0ngYaD/RSmKXaGeCn3w0UlBe3xMKguUgMiZWCWNZ4ht4rUJv41LHDsI
 K6NlJKPt2Pzui2v8KkV8Q00Hx2ciwnUbhzHUUZep6ODXH/acKtwUPlw5nsaff3cBfi/x
 Edmr4EyjYYEhvZxO130vdSQXJhGZYpYN+P7ArzJRfk6m0uQLUgX1eWxIHVpMPfTe1tCp
 3nBQ==
X-Gm-Message-State: AOJu0YxguyhAKqxMr1DzmEvGUrsX2HOwasZqSIB5gsgD4bdbg5GrBjDz
 107Q/xO603eRvdXehDn2Y/Kwgm83dGj7+7UV1hLdafp8
X-Received: by 2002:a05:6808:f11:b0:3b8:4125:c1e with SMTP id
 m17-20020a0568080f1100b003b841250c1emr3893557oiw.31.1700714554672; 
 Wed, 22 Nov 2023 20:42:34 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 i7-20020a056808030700b003b8347de3c2sm73888oie.19.2023.11.22.20.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 20:42:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 13/21] target/arm/kvm: Move kvm_arm_reg_syncs_via_cpreg_list
 and unexport
Date: Wed, 22 Nov 2023 22:42:11 -0600
Message-Id: <20231123044219.896776-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C+pUEj5jVvwQ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h | 10 ----------
 target/arm/kvm.c     | 23 +++++++++++++++++++++++
 target/arm/kvm64.c   | 15 ---------------
 3 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 2755ee8366..1043123cc7 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -77,16 +77,6 @@ void kvm_arm_register_device(MemoryRegion *mr, uint64_t devid, uint64_t group,
  */
 int kvm_arm_init_cpreg_list(ARMCPU *cpu);
 
-/**
- * kvm_arm_reg_syncs_via_cpreg_list:
- * @regidx: KVM register index
- *
- * Return true if this KVM register should be synchronized via the
- * cpreg list of arbitrary system registers, false if it is synchronized
- * by hand using code in kvm_arch_get/put_registers().
- */
-bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx);
-
 /**
  * write_list_to_kvmstate:
  * @cpu: ARMCPU
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index dadc3fd755..9bca6baf35 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -740,6 +740,29 @@ static uint64_t *kvm_arm_get_cpreg_ptr(ARMCPU *cpu, uint64_t regidx)
     return &cpu->cpreg_values[res - cpu->cpreg_indexes];
 }
 
+/**
+ * kvm_arm_reg_syncs_via_cpreg_list:
+ * @regidx: KVM register index
+ *
+ * Return true if this KVM register should be synchronized via the
+ * cpreg list of arbitrary system registers, false if it is synchronized
+ * by hand using code in kvm_arch_get/put_registers().
+ */
+static bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
+{
+    /* Return true if the regidx is a register we should synchronize
+     * via the cpreg_tuples array (ie is not a core or sve reg that
+     * we sync by hand in kvm_arch_get/put_registers())
+     */
+    switch (regidx & KVM_REG_ARM_COPROC_MASK) {
+    case KVM_REG_ARM_CORE:
+    case KVM_REG_ARM64_SVE:
+        return false;
+    default:
+        return true;
+    }
+}
+
 /* Initialize the ARMCPU cpreg list according to the kernel's
  * definition of what CPU registers it knows about (and throw away
  * the previous TCG-created cpreg list).
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index a184cca4dc..52c0a6d3af 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -346,21 +346,6 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
     return 0;
 }
 
-bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
-{
-    /* Return true if the regidx is a register we should synchronize
-     * via the cpreg_tuples array (ie is not a core or sve reg that
-     * we sync by hand in kvm_arch_get/put_registers())
-     */
-    switch (regidx & KVM_REG_ARM_COPROC_MASK) {
-    case KVM_REG_ARM_CORE:
-    case KVM_REG_ARM64_SVE:
-        return false;
-    default:
-        return true;
-    }
-}
-
 /* Callers must hold the iothread mutex lock */
 static void kvm_inject_arm_sea(CPUState *c)
 {
-- 
2.34.1

