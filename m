Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1273608lfg;
        Mon, 25 Jul 2022 22:03:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tDIPpwSfgJuhutGAO/DsSfGAM0c7/6uGTjDr35qgQomLnet10wEl+karUYLi7Bxy9h8s6D
X-Received: by 2002:ad4:5dc7:0:b0:473:e8d0:220d with SMTP id m7-20020ad45dc7000000b00473e8d0220dmr13567403qvh.128.1658811808921;
        Mon, 25 Jul 2022 22:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658811808; cv=none;
        d=google.com; s=arc-20160816;
        b=xBRt0uFk0jIvN13F6cS0DkmtIXmbFUnFcmVzItpC765eAe3d5CS6R5puOYh1f2thfW
         zGaWLy9rrrXXrIT7ffyImBOs2vZFsKmT2uLRxCy+5CPJ5CggEUmyw/HlkZw5hhwbbcQl
         zJZSfUpJ39UZjTKsvJG2oPbUwaHcXGPQzBLTLDiUZh/CZI/wF4fjtYvlX1NI8q8H6gHa
         tvJsSa/kDcHaQbZVuyTx79X367vYQBGwL/EjyMrd7Em4f4XQfCQf/PrLaDeCqC5ANXtI
         OtOkug9Yyik/aigGKQgzdsVh0E9CpgDxsm6UgeXuE2COJyrN3tXuf5TNMX2emMuyi/nD
         mQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KDVN6nTJJe7rCbQUwyIy/u753J7JpZeC4VTwUN/cZno=;
        b=TGu2k8qUtnZP1tZKc+WX8Cy5ax1DZ3hzGVttMSue9EHBWsNF8QnIarFYSudJFCmD6x
         +sA9eqThwlSLdkV+u1A0iIc81bWs2vxxL2rNcXkiet2ENFm5TiP6RXt2mKzq470H03dh
         xX+k9sCuMka2N1bipa8LqIYDk6PPMwn4b8wkY3fSBQXBFw2jD1VcfpAwdu2gGfY6P7g3
         7ATIEgq1puijocP6jXOXBB/NINTZfFrQu2nQDUJRUslZKeJlQMjSuh1WdFj+z+i5PRVD
         +rzegCZnOh2CutcDxQild4uJVscFGQMOo83ihXYRAo3DqLSHDkRpI5FA5DyT7D7NrL1P
         elYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=APhM1Irp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv18-20020a05622a0a1200b0031f3a5602bdsi1900107qtb.717.2022.07.25.22.03.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jul 2022 22:03:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=APhM1Irp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGCjA-0001KK-5Z
	for alex.bennee@linaro.org; Tue, 26 Jul 2022 01:03:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCeT-0006FU-Qi
 for qemu-arm@nongnu.org; Tue, 26 Jul 2022 00:58:40 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:37455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCeQ-0002bW-RL
 for qemu-arm@nongnu.org; Tue, 26 Jul 2022 00:58:37 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 v16-20020a17090abb9000b001f25244c65dso8870971pjr.2
 for <qemu-arm@nongnu.org>; Mon, 25 Jul 2022 21:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KDVN6nTJJe7rCbQUwyIy/u753J7JpZeC4VTwUN/cZno=;
 b=APhM1IrpttSVx3NmqdfhpBa9QHQqWO9MHeI1Mp0npitZS5gM/fp3WXKk2x9f2Gy0Uq
 0O1mfalpAM+mqAIOVQUTy+E9XG05BfkEeWN1suY7m6CaLyBC53q773jd/sci7kHl3APp
 PUJ1HBJCUH+SNVib9az6aHQz9N9W0ycVfNpuj/s2Uj6TlR8xu3za8BV1alSZQn4dzQzv
 5qZ4+QYfEWAI510ijeheAxtQX+nowrlLEigwp6eaDd6VE5hL1c8J8RCcaWz2kOlfyxzT
 IB1Fv/27gh8igstFblkmqVk6QVGwxmp8ciGUDBF/awPxr1zywzBJe/mKnYBVA3fK9anl
 G5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDVN6nTJJe7rCbQUwyIy/u753J7JpZeC4VTwUN/cZno=;
 b=58nwgvEm1WQpoCuO4dZI8XzNrO3YfYc1DM7j+iecmxbpyE7lQ0AB1lDrU+3JpApwAW
 u5MHcAdQ7J/VdbkGbDQLQQk8zxZLXGHMmgEDg0fP2/Vnfvn31zRbifo4DgUocQYy2jE6
 e+4mMGey5zCxGRvLRitl7Wu/KeiPBUlIRoWigGp1JxJfFU1g30gSSXUXN6UPKl1rz1bO
 Btld+xcQ3YdaqlbuZKiKFo2yiweh8cLS76l0cLUuAU6dBpApqqtjpWBRRBRq5fvC3cts
 Iz1yYTcEehB0dkf5xp9bkPeQt2mE+eMheooCJUZGylyJWmXxWMJ3zlpPVFwtLXl+hjox
 V0eA==
X-Gm-Message-State: AJIora9lxyAnYhkkNrc1ZCw62ayUQuKuwzstf76mDDPNhRyDYb6iu7W5
 3xU1qBY0jZFXIx5vFs2ChpJQNg==
X-Received: by 2002:a17:90b:4c08:b0:1f2:977:c147 with SMTP id
 na8-20020a17090b4c0800b001f20977c147mr35532174pjb.6.1658811512608; 
 Mon, 25 Jul 2022 21:58:32 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:673b:b40:a955:bc1b])
 by smtp.gmail.com with ESMTPSA id
 o19-20020aa79793000000b00525343b5047sm10550460pfp.76.2022.07.25.21.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 21:58:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com,
	qemu-arm@nongnu.org
Subject: [PATCH v2 2/3] target/arm: Set KVM_ARM_VCPU_SVE while probing the host
Date: Mon, 25 Jul 2022 21:58:27 -0700
Message-Id: <20220726045828.53697-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726045828.53697-1-richard.henderson@linaro.org>
References: <20220726045828.53697-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4z8R6TuPhSX6

Because we weren't setting this flag, our probe of ID_AA64ZFR0
was always returning zero.  This also obviates the adjustment
of ID_AA64PFR0, which had sanitized the SVE field.

The effects of the bug are not visible, because the only thing that
ID_AA64ZFR0 is used for within qemu at present is tcg translation.
The other tests for SVE within KVM are via ID_AA64PFR0.SVE.

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index bb1516b3d5..43cd7eb890 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -507,7 +507,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     bool sve_supported;
     bool pmu_supported = false;
     uint64_t features = 0;
-    uint64_t t;
     int err;
 
     /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
@@ -528,10 +527,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     struct kvm_vcpu_init init = { .target = -1, };
 
     /*
-     * Ask for Pointer Authentication if supported. We can't play the
-     * SVE trick of synthesising the ID reg as KVM won't tell us
-     * whether we have the architected or IMPDEF version of PAuth, so
-     * we have to use the actual ID regs.
+     * Ask for SVE if supported, so that we can query ID_AA64ZFR0,
+     * which is otherwise RAZ.
+     */
+    sve_supported = kvm_arm_sve_supported();
+    if (sve_supported) {
+        init.features[0] |= 1 << KVM_ARM_VCPU_SVE;
+    }
+
+    /*
+     * Ask for Pointer Authentication if supported, so that we get
+     * the unsanitized field values for AA64ISAR1_EL1.
      */
     if (kvm_arm_pauth_supported()) {
         init.features[0] |= (1 << KVM_ARM_VCPU_PTRAUTH_ADDRESS |
@@ -675,20 +681,13 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         }
     }
 
-    sve_supported = kvm_arm_sve_supported();
-
-    /* Add feature bits that can't appear until after VCPU init. */
     if (sve_supported) {
-        t = ahcf->isar.id_aa64pfr0;
-        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
-        ahcf->isar.id_aa64pfr0 = t;
-
         /*
          * There is a range of kernels between kernel commit 73433762fcae
          * and f81cb2c3ad41 which have a bug where the kernel doesn't expose
          * SYS_ID_AA64ZFR0_EL1 via the ONE_REG API unless the VM has enabled
-         * SVE support, so we only read it here, rather than together with all
-         * the other ID registers earlier.
+         * SVE support, which resulted in an error rather than RAZ.
+         * So only read the register if we set KVM_ARM_VCPU_SVE above.
          */
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
                               ARM64_SYS_REG(3, 0, 0, 4, 4));
-- 
2.34.1

