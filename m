Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1019294lfg;
        Mon, 25 Jul 2022 11:16:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1trW6S9Yd4V0f1dQwwTaFXdoZQvm3FMTUWYvb5nt86pGoteSDsAUIWjLYjeJUA0mPZaeQsR
X-Received: by 2002:a37:63cb:0:b0:6b5:d13a:67cc with SMTP id x194-20020a3763cb000000b006b5d13a67ccmr9784708qkb.165.1658773011108;
        Mon, 25 Jul 2022 11:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658773011; cv=none;
        d=google.com; s=arc-20160816;
        b=wXE+Ar1DQeIAmVKW3Ogj81WWbOHmY0kBw04lzNF/uc70FqD/lnfjfBTnHPyUi0W5zf
         KQBPordBJISI8nhT7O3bkKRQ20HJ6s6mvbu8t5z82OiJKFSHdXodkOOjLIGrpkcaC3eO
         HRpe7YjSqP3TpkKqRINAZ4QrRjQxUCaK+yjCC0k/+mikdSCvEJU+i4BSmQt4YZXIEz8t
         eXx+1aB1gmiNA2wFtvUcxXFwh//+2DwIgMGHfJzP1URn+Vx8fkmdx8M2OqAXrWfUE0m+
         JfufSIJgvsLBQPMSQ1RTkJL0298ME+a9wG9ZMILBalqmSFdsW7svFonPFnU/zoH93YRG
         QyJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=N2OJQKKwRLRjFx/fh9iTaEVWiqAoFPuSiTt6AYqCB48=;
        b=KE3PGMHF9Ocl/aq7kzLnqry1twRhgM1aHBC+aslJZZ5pNtIiqXknRNgkVw4EX2iKpw
         kuRWUdzPsTS8ZOmWpvWUm/OhiIHJ+4O/4QflX11r7H8F4muhykFArQks4wL7zhnTf8SJ
         HmrxZII7qNhIOI7gGpK7E394Fn1WnUL9G1vPE8q35MNlbjdHIiQgz+SqtD4ZiKjBV6iN
         8BZ+0V1kTAsin8OUyq33hUQoYURJFwF/HV1n8g/9Ap1p3CE/zKfQ3ffF5uupgBWi+NO1
         IzhVluF3D7vztl/P5jY55jbZcMEHJAYlUarpEhpySPu1RYSyt2vCO+VIUBP3waXlYeDe
         V6nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k4z62w5I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8-20020a0562141cc800b004742b8e7991si4265961qvd.464.2022.07.25.11.16.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jul 2022 11:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k4z62w5I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oG2dO-0005kx-HE
	for alex.bennee@linaro.org; Mon, 25 Jul 2022 14:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bo-0004mg-6u
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 14:15:14 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:36443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oG2bl-0005qA-BX
 for qemu-arm@nongnu.org; Mon, 25 Jul 2022 14:15:11 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 t3-20020a17090a3b4300b001f21eb7e8b0so14516591pjf.1
 for <qemu-arm@nongnu.org>; Mon, 25 Jul 2022 11:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N2OJQKKwRLRjFx/fh9iTaEVWiqAoFPuSiTt6AYqCB48=;
 b=k4z62w5IpFLty3Sy7/0qLGS4SWQO4CjNegPSxpWly3VcZf0kSa3MzwL3M4+34CbLqa
 LhO166wyO+M/MVMahHYFFxJ7H01JznqF9r7NbhAoioPy8vi9YSASVFtEPlklaj2an2Ss
 k7UVdtb1Fj6G2gCTDMlP9X+a9TkrSxAzHGuPy5+jg0MDCHDYzOFw6FbNTTlnudA7DtJ6
 OtjUVMv1N3d6Jfq/JvRFU2b1uPxtJqq0G4qoFUw3/AUtEn0yLFJ+BJsAiB3nyZeGoFDV
 et2p2QvXUaNQjN8F4Mz8I9sZMaBu23dvZo/mzJA0lJBnyKfNKDjAHuniH6cnJC1O9xsP
 SYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N2OJQKKwRLRjFx/fh9iTaEVWiqAoFPuSiTt6AYqCB48=;
 b=bcySbl+d0mnLCdSfjoOrRi1UDfFTdXGQEM+JZvvcNXhmXL2HOyBHWonPvMZFsl11wN
 TGeNV3z34syhpwLipVlUM16O2Dwus1F1AtC2CtE3WuxDw8TeNc2SoOgQ9W9lKzijDCIT
 u9xJu0f9yuZ+Ej9CV4sKYt3st+63nHsDAbfhQQeofLe+i99dYWkNB7z9WbCMp/Fjn8Ac
 HYJH5JQyVYAAblECrUF6kJdcTlIdfmyn2tTcpDLi+NqM82u8GVOMWgCjrG4aSIOGqqDy
 S+MRTbm1ypwHNmmEhL2YP2VuWnfVHQ1HrM0Za678wiacXYrfqr+nDE5qwzb+PFlu4sc0
 Nq5w==
X-Gm-Message-State: AJIora8pvFCc4qZfHzQopiaDqAJhL7GVGmQ5bjldiSnUZH2q03Rv4mpL
 lHq7zioMgc0qU+wl+/Wp5kEVlg==
X-Received: by 2002:a17:902:ec86:b0:16d:6424:efb2 with SMTP id
 x6-20020a170902ec8600b0016d6424efb2mr9952698plg.62.1658772908058; 
 Mon, 25 Jul 2022 11:15:08 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:30c1:2484:a853:233d])
 by smtp.gmail.com with ESMTPSA id
 bg5-20020a1709028e8500b0016d8d277c02sm1125004plb.25.2022.07.25.11.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 11:15:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com,
	qemu-arm@nongnu.org
Subject: [PATCH 2/3] target/arm: Set KVM_ARM_VCPU_SVE while probing the host
Date: Mon, 25 Jul 2022 11:14:56 -0700
Message-Id: <20220725181457.41083-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725181457.41083-1-richard.henderson@linaro.org>
References: <20220725181457.41083-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: reCVSBoRn3ku

Because we weren't setting this flag, our probe of ID_AA64ZFR0
was always returning zero.  This also obviates the adjustment
of ID_AA64PFR0, which had sanitized the SVE field.

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 36ff20c9e3..8b2ae9948a 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -512,7 +512,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     bool sve_supported;
     bool pmu_supported = false;
     uint64_t features = 0;
-    uint64_t t;
     int err;
 
     /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
@@ -533,10 +532,17 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     struct kvm_vcpu_init init = { .target = -1, };
 
     /*
-     * Ask for Pointer Authentication if supported. We can't play the
-     * SVE trick of synthesising the ID reg as KVM won't tell us
-     * whether we have the architected or IMPDEF version of PAuth, so
-     * we have to use the actual ID regs.
+     * Ask for SVE if supported, so that we can query ID_AA64ZFR0,
+     * which is otherwise RAZ.
+     */
+    sve_supported = kvm_arm_svm_supported();
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
@@ -680,20 +686,13 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         }
     }
 
-    sve_supported = kvm_arm_svm_supported();
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

