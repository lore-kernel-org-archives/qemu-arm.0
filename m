Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp393162lfq;
        Tue, 8 Sep 2020 01:13:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSZtWpTXtq+CpCu9gsFvJ6BCEfJMgNXoX1dZQJWg+NnQQpTpstIndUStJbB4qSEree7SUp
X-Received: by 2002:a25:3fc7:: with SMTP id m190mr26316008yba.450.1599552839706;
        Tue, 08 Sep 2020 01:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599552839; cv=none;
        d=google.com; s=arc-20160816;
        b=oYZ8foNpv6pgeuYH4K3RzrPpgrUuulvBLCJf+BEc8XdbAdHOtNJeHu3/PtF5bQ1Zmc
         vb5MKKA1TflQcv7ezknOp3rr521vkK4nPhy0Jeugj33zPUfJ/uy9SRBiOWiN/w3PHiOx
         Egj2ZAPK+jbOI8c7BgzD3jbvxeXnYiBzGavPxd50ahoKBYZUG3B3e6kqhhRoo4vUANPo
         xiYSc/ZS9yO4vd4BOFqJhYXQpNyD3YPcfLTur6RWokgPIcRTxnP+2gTFi6sgalMdr1qM
         jj5wXt5ifzLLro3+1bCg2RY+ABhF1RfVl8cK8a6JUXIMVt3ADEtmhkAgAK9DxvpnMFLn
         ZooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NODmkJ7zv3Ze8nSAAv5Nj47e1RMWaOU9HVwH97SKsQI=;
        b=VOW1IoH7xp+0QMX9T5vzNepVDKavViDhneKYws6vs5LTEnLZ3hSFhRzxFN5f0/dXlk
         DWX9gXgr08Rrh4/m2vRR2BzGOVw2M7fUWDDPry3WmKWn3xHagWWNnXQ66B3QLGDzcZ3E
         NzQwJ9MdhKD6E7ENcMwswuXybVTFp0sGFTzoZ8L3yMTIhuopzlpTWM0D7Hglv4YsYRrB
         1XdvlBiGPDDjbQYS2kv7LOYCqfJo/+f7KU8PnhoIm21W+Gbkyp2UQWACBvVC+23phFfb
         ndLAZKbHVx/pMCha5mCSc3NfppNiI6FLzte8yRy5c4YZujR6n1ov64GOw0hNi65ZWMeV
         kP0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vJ8gJHor;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si18174470ybc.52.2020.09.08.01.13.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 01:13:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vJ8gJHor;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFYlL-0005cd-1C
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 04:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYlA-0005Zo-3o
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:13:48 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kFYl8-0000Qn-1k
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 04:13:47 -0400
Received: by mail-pg1-x544.google.com with SMTP id 5so9511804pgl.4
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2020 01:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NODmkJ7zv3Ze8nSAAv5Nj47e1RMWaOU9HVwH97SKsQI=;
 b=vJ8gJHor/P+Jl1BmkcHCpjIjT1JCsWa6RcvfIElzkZQMD3ubbmjT/n4HZwlmsc0Xfg
 WZ7W5PqRbzbppkxmUx5FGpPFmOo/le/LfovbCExJ/KZZb1+3Oe6rnMU4jFgKOoOz+16M
 afDRw36jeZOE7ot9hJBxsZKXf5HBp1DeBmcDM1sUJvKboUpteuu4Wv+1rm3eJtg3WlOo
 4zSYvpKY8QKbZlFF9utJce6omxNc2nR0jsI0Gb/LDmHVHGmStvtbHHA2orgC+UB/19dS
 gyjlh7/omwadkmQbqlsG5QM2n5klBJtQhsjwDpblHY4dtWrlyEpL81GgnwZrvD3jWHq3
 qYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NODmkJ7zv3Ze8nSAAv5Nj47e1RMWaOU9HVwH97SKsQI=;
 b=Rd1hnSfes2b3VS0pdZ+GaODXoujIHY47YFLJ7378cZklpOi/00yNXxBGzS21NeCmVD
 9p5kDHFY50kznmCWMSXwcCG9kX/2hCExyZJg/IhrOzjluOdd9OPn6mJmI1KgBBSaNCHt
 jSGRMK2LqaeFKONHX1p75/YbC8SYBr9VVFxWB5XKJIO1uqAYaPosgNynDHMXkJFQ/VzN
 3DOU5Voy19jQhHrgBL3AMlLuicPwgR8qmQlLAPVPdaVaNCd+GcX4ygqIZIXozdX71aTj
 Du4EQief3d1vIvAGz1p4GMreG8/Acbzj/BG89ZY/IeLJJmxXETVsQ6LIluGfO2hTzPnD
 D4og==
X-Gm-Message-State: AOAM533FYXh+bSZ9axq8TK0uM8ltjNOZUHSrtC2YQgcpQwWUS+iVlKox
 xvSdQJjTGyaI2MXOfUXYfopE
X-Received: by 2002:a17:902:8bc2:b029:d0:cbe1:e709 with SMTP id
 r2-20020a1709028bc2b02900d0cbe1e709mr98104plo.23.1599552824822; 
 Tue, 08 Sep 2020 01:13:44 -0700 (PDT)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id m190sm16934788pfm.184.2020.09.08.01.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:13:44 -0700 (PDT)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 02/12] target/arm/kvm: spe: Add helper to detect SPE when
 using KVM
Date: Tue,  8 Sep 2020 08:13:20 +0000
Message-Id: <e4a8f10ed4e3379994b7e260ad6ef715512289d4.1599549462.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1599549462.git.haibo.xu@linaro.org>
References: <cover.1599549462.git.haibo.xu@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=haibo.xu@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: FufhdfV5exuK

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
---
 target/arm/kvm.c     |  5 +++++
 target/arm/kvm_arm.h | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 8bb7318378..58f991e890 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -214,6 +214,11 @@ bool kvm_arm_pmu_supported(void)
     return kvm_check_extension(kvm_state, KVM_CAP_ARM_PMU_V3);
 }
 
+bool kvm_arm_spe_supported(void)
+{
+    return kvm_check_extension(kvm_state, KVM_CAP_ARM_SPE_V1);
+}
+
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
 {
     KVMState *s = KVM_STATE(ms->accelerator);
diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index adb38514bf..f79655674e 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -283,6 +283,14 @@ bool kvm_arm_aarch32_supported(void);
  */
 bool kvm_arm_pmu_supported(void);
 
+/**
+ * kvm_arm_spe_supported:
+ *
+ * Returns: true if the KVM VCPU can enable its SPE
+ * and false otherwise.
+ */
+bool kvm_arm_spe_supported(void);
+
 /**
  * kvm_arm_sve_supported:
  *
@@ -366,6 +374,11 @@ static inline bool kvm_arm_pmu_supported(void)
     return false;
 }
 
+static inline bool kvm_arm_spe_supported(void)
+{
+    return false;
+}
+
 static inline bool kvm_arm_sve_supported(void)
 {
     return false;
-- 
2.17.1

