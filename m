Received: by 2002:a05:6214:21e7:0:0:0:0 with SMTP id p7csp1626602qvj;
        Fri, 4 Mar 2022 12:07:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyVoqD57PiS7y8NkBZLlsxPU964C3+GLsLzacHjeYpmnEKIMd2C39wPXLRb9WlKZlDIklY
X-Received: by 2002:a25:8b:0:b0:628:9774:d6f4 with SMTP id 133-20020a25008b000000b006289774d6f4mr89865yba.545.1646424427531;
        Fri, 04 Mar 2022 12:07:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646424427; cv=none;
        d=google.com; s=arc-20160816;
        b=rsc6VX3x1FKPWHtfogsmHC9gULAtr55WhicEuxV6WeMhOffAZt3kh9nmE8Qcb5Zp8/
         hKAQpuD/MfPNu1A2jMEJ99Rnw/nK4IDcshfpYuY+kS4W064/GZOuEgbZjiCMlvLRLGbq
         nFahZtGzNvYOKubdnkTqRnThRrIJEoJB9Cw3ttSjEBZL3dvZJQURdIJkzN5gF3CHJCYW
         y+tFT7Bo6RncRK9LCoK1m7sU0ZOFo1npMTkkW9xLhvLzvstI+XJAknDXK0s8b7R6dkg4
         EOANCrv6C7yO6wq7yGUBuDYZ6XO6oZ7W/xsGElIPDnDwdaerZkKSdtDzWa7u4Xl3J1Dp
         xsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TLjgVybJvPoE9KhD4vPFEO3Qby2QVt4ZAtq9+cFyp24=;
        b=QTarxITfqMfWa+/ebunG0IN31nDV8LSzeTDLUOXB9aBlHk7+jz4Xtcg5/y4A2cNpcC
         9/TpN57e9OfyLH+070/l1uWmHWxXZNe3z02KMMLnM0EYfzfGRcjpz00RLHKfcw75GUWE
         dS03vG5ptVAeVleo5DKl8ZBnCpBVdZJTyIqCNLxKJ4vnFDeM/nHSg4hDOpJzm9BZkgx+
         uZvHma1ewTBZMQ6A8ym8JQwToqTYpUccog0+T68cN41VvSpI/hg+xU1hLp/DlDINAvu3
         dcYU1Qoy1mnbNso+SzRheOCfu8Bxd00usvO98AILdooGi/tXuLquRstzzUpshGlf/jP+
         grfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m2ehXtTa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z200-20020a814cd1000000b002d035ccfae5si4676520ywa.393.2022.03.04.12.07.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 12:07:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=m2ehXtTa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQECh-0002O8-2N
	for alex.bennee@linaro.org; Fri, 04 Mar 2022 15:07:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQE8q-0004zy-Bu
 for qemu-arm@nongnu.org; Fri, 04 Mar 2022 15:03:08 -0500
Received: from [2607:f8b0:4864:20::630] (port=46767
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQE8o-0005xt-LZ
 for qemu-arm@nongnu.org; Fri, 04 Mar 2022 15:03:08 -0500
Received: by mail-pl1-x630.google.com with SMTP id bd1so8666578plb.13
 for <qemu-arm@nongnu.org>; Fri, 04 Mar 2022 12:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TLjgVybJvPoE9KhD4vPFEO3Qby2QVt4ZAtq9+cFyp24=;
 b=m2ehXtTaHFJ87qpPsfMv9GvJbGPuTBmbxAyLMzwWufNEnLaFqDmJ8cSyHUfYMOIivi
 RWYNwoxKf2G0BmYRdOJUfbc/91U0X2UbWJVl/a4hpHa0YMGdo/TvRdD103lftdL/gzxn
 w6WbYXJWNDp6WXcT3YntgUsxMyGHggxoKMTGBt8rOX9s7nlmxsOxKIdUZo586lhzaXUL
 2cX9rCHj3KbadTgKzrq7iR4Vx55AbHWil8/9HzC5X850Ut4jzQhCoWUv3moTxfd4u5dY
 FvbEB8v5H1AzzKxr8it1kv2vzOhmXVEidJkoQufmdgVqRTxkFjSGNrW1rJmjVJobxboU
 pFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TLjgVybJvPoE9KhD4vPFEO3Qby2QVt4ZAtq9+cFyp24=;
 b=od95n+YaViHdyEUsW15x3hyTj0yhFK+hCMzXQXBj19jxOiWWdy+H7/q74iiOrzJ5GJ
 nV+QrWxqiDoaR7o7IUVjan0yY+vtwUCvMoJZsq7Xq6RX9nSHbjH9KaZgPquw1uJAaGu/
 BrVPSLrWju9Zs3xebCTGSD/mGT287aSc5/JGngJdjYBx2cLmvlt5uWNVhJ1J//E4teDh
 Tt+bBbm3Kk1aGqy64+lhx0xgw77d47JRb1XXkoOhVrkhl+7Mv+ute9BEJlnJy2n2ZOjR
 bpQQjnqdovBj1sODeIv6mfQEyzA6n5x4+RgzwWdP4UJAuCjnlKc8ffxjh2nsIoGasYQD
 azsw==
X-Gm-Message-State: AOAM533hNXXRP3kI5dXikfqEnSc3ti9zxeNQxpFtuhbaf5J69M0nH4uc
 X/oWBEebqlxaonzGaHwxGHTs8Q==
X-Received: by 2002:a17:903:11c4:b0:151:9bf6:f481 with SMTP id
 q4-20020a17090311c400b001519bf6f481mr122410plh.50.1646424185235; 
 Fri, 04 Mar 2022 12:03:05 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 hk2-20020a17090b224200b001bf0a7d9da3sm5716744pjb.9.2022.03.04.12.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:03:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/2] target/arm: Provide cpu property for controling
 FEAT_LPA2
Date: Fri,  4 Mar 2022 10:03:00 -1000
Message-Id: <20220304200301.524525-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304200301.524525-1-richard.henderson@linaro.org>
References: <20220304200301.524525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2NRvaa4jrO1u

There is a Linux kernel bug present until v5.12 that prevents
booting with FEAT_LPA2 enabled.  As a workaround for TCG, allow
the feature to be disabled from -cpu max.

Since this kernel bug is present in the Fedora 31 image that
we test in avocado, disable lpa2 on the command-line.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h            |  5 ++++-
 target/arm/cpu.c            |  6 ++++++
 target/arm/cpu64.c          | 24 ++++++++++++++++++++++++
 tests/avocado/boot_linux.py |  2 ++
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 24d9fff170..4aa70ceca1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -204,10 +204,12 @@ typedef struct {
 # define ARM_MAX_VQ    16
 void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
 void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
+void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
 #else
 # define ARM_MAX_VQ    1
 static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
 static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
+static inline void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp) { }
 #endif
 
 typedef struct ARMVectorReg {
@@ -975,10 +977,11 @@ struct ARMCPU {
 
     /*
      * Intermediate values used during property parsing.
-     * Once finalized, the values should be read from ID_AA64ISAR1.
+     * Once finalized, the values should be read from ID_AA64*.
      */
     bool prop_pauth;
     bool prop_pauth_impdef;
+    bool prop_lpa2;
 
     /* DCZ blocksize, in log_2(words), ie low 4 bits of DCZID_EL0 */
     uint32_t dcz_blocksize;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7091684a16..185d4e774d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1392,6 +1392,12 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             error_propagate(errp, local_err);
             return;
         }
+
+        arm_cpu_lpa2_finalize(cpu, &local_err);
+        if (local_err != NULL) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
 
     if (kvm_enabled()) {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2fdc16bf18..eb44c05822 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -688,6 +688,29 @@ void aarch64_add_pauth_properties(Object *obj)
     }
 }
 
+static Property arm_cpu_lpa2_property =
+    DEFINE_PROP_BOOL("lpa2", ARMCPU, prop_lpa2, true);
+
+void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
+{
+    uint64_t t;
+
+    /*
+     * We only install the property for tcg -cpu max; this is the
+     * only situation in which the cpu field can be true.
+     */
+    if (!cpu->prop_lpa2) {
+        return;
+    }
+
+    t = cpu->isar.id_aa64mmfr0;
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 2);   /* 16k pages w/ LPA2 */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4, 1);    /*  4k pages w/ LPA2 */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 3); /* 16k stage2 w/ LPA2 */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 3);  /*  4k stage2 w/ LPA2 */
+    cpu->isar.id_aa64mmfr0 = t;
+}
+
 static void aarch64_host_initfn(Object *obj)
 {
 #if defined(CONFIG_KVM)
@@ -897,6 +920,7 @@ static void aarch64_max_initfn(Object *obj)
     aarch64_add_sve_properties(obj);
     object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
                         cpu_max_set_sve_max_vq, NULL, NULL);
+    qdev_property_add_static(DEVICE(obj), &arm_cpu_lpa2_property);
 }
 
 static void aarch64_a64fx_initfn(Object *obj)
diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index ab19146d1e..ee584d2fdf 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -79,6 +79,7 @@ def test_virt_tcg_gicv2(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
+        self.vm.add_args("-cpu", "max,lpa2=off")
         self.vm.add_args("-machine", "virt,gic-version=2")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
@@ -91,6 +92,7 @@ def test_virt_tcg_gicv3(self):
         """
         self.require_accelerator("tcg")
         self.vm.add_args("-accel", "tcg")
+        self.vm.add_args("-cpu", "max,lpa2=off")
         self.vm.add_args("-machine", "virt,gic-version=3")
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
-- 
2.25.1

