Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3990541ejc;
        Tue, 29 Aug 2023 16:27:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA8OSz2n2AedOlcEtomgB6GXkVykIERH8znCqioY2Wm0jRSGLr9gAGwLVEXm2GaxdivFRz
X-Received: by 2002:a05:620a:1648:b0:76d:52a:c93b with SMTP id c8-20020a05620a164800b0076d052ac93bmr424479qko.73.1693351662660;
        Tue, 29 Aug 2023 16:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693351662; cv=none;
        d=google.com; s=arc-20160816;
        b=FWv97eebMnejFEzPynePG33GlvcqocpGMK3m4qH9nN5i5i6e33xAEsW8l4M5c12sJf
         VbyVzE1JnptI6sI0+UmIypg+3iNoCQtzJMHcnMvSm6nmSjwPSQoVhIONHEKPDmyDGI9H
         FQ9wQ3XJZ/qut73ufHRB7c2pL3/Ow8srATzlccJcVcv48Bm1zmHI/NX4rY7FC/DhDFEH
         dirmocwE03fU0fJmHIivSetWC2ZMu+a0IamDzX7DANkoVfkAmZiiOwcNbwpRhB8iq3kO
         toiaBZ1F3F0HjBqjA1B1EB7l6foGRVetN8K4iDYpzMVPtztryM2kVywc7ZcIvzXYEHj3
         9hEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dSHDOqmpvVqWZn7zJjJYDufm+wpdwBxF2KdyWkAtGiQ=;
        fh=L6OjQZ2TPsHFQEGPRBuboSqhQBavDZ5pPqlyX67xn3A=;
        b=WQocZia7Fkx/L1P1gj0c3dUvxl0hNryG/pXuKtL1AW3djKLKBG72g47edOKtJkUGjq
         0hnEYokgQpTum+PnH5cBirxk2bGNKa0PUsG62aWghDYbJLvmz/+K7ynuE7+hwl60otdL
         J5cB74h78RjJNuDo8FQmn1AWGRLS4YJzSu6ZWTYBMJPwhp8QC/WtgaIAsOTpzurxwf0p
         mZwFmCE/jH1jrJtSB471xD0r/iMM/6b/E3LSWDOWHTt+ws+6FNZvAErS+4VKY6hBZbDY
         MrgONZSNw4UuKmcK7nKiaPVQNTueu8yxjE9lq7S/7AbC9dT2dbFTbzUkRFzqCV2lYu6E
         7IlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RBXDMiCA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dl1-20020a05620a1d0100b00762216391bfsi6816178qkb.767.2023.08.29.16.27.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 16:27:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RBXDMiCA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qb83q-0003pb-St; Tue, 29 Aug 2023 19:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb83p-0003et-0A
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 19:23:49 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb83k-0001N2-6o
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 19:23:48 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-68a440a8a20so4252144b3a.3
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 16:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693351423; x=1693956223; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dSHDOqmpvVqWZn7zJjJYDufm+wpdwBxF2KdyWkAtGiQ=;
 b=RBXDMiCAbVEWOh24jzMgBq9SwBVpcHnOk3/ikUpgslogFgev87rbJIm9UFqTo99h+1
 xI/c5F72Riu/P1YyUly9Vzy5UkBORtDJ3bp6J8I+1yNXvA/o3NnZb4KRLeIRk/UphrbX
 hW8zThsIEkc6sc7aDqZutKsJqxklxuA6SYQ8JQf/arAmCVrJX+vqql911fc9ankbDXbK
 8zdktD6Tu9TqgbdmreLutguBDRk3MkIRvANfuXrx0ujcr36LqqgyvvqBJXgTgqLNUnyQ
 Upn2d4l51zR3aGhgD3fpPanjaCVMAC6SPsIY8O9IyCGlnYZogNQVicPLVmH1E2diqFrD
 aUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693351423; x=1693956223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dSHDOqmpvVqWZn7zJjJYDufm+wpdwBxF2KdyWkAtGiQ=;
 b=L+AJE6HKZs524w2W+xPHBnD7TAinFqJ+iUz7jPUaH66fslZWmvnuZJH1SLI5ryC8yb
 u6fqolv7YZQzxh68ZPDKLm1hTORUabhyj2104jtrPP7dsSarna/twj2UCZNBWCPr6/yy
 SXHSBf9YrPi96CC3RR1M3N+0cM0FEGt9cZHWO2kyJON8MBV4HhcRDuq1g2n53oj0y3FK
 xBvoFTMKZR+0QO9L/Gt+eFVssOYASv9x0na95V0D5oxTPhu6iXKlq2GXNmrTuZPbJko6
 +QgJv3RBbINVZor21c1Q5ZpQi+0Zv89s8HRirVHXro6eXz7ryopEf8yESsmHL5hHPaDx
 OsVw==
X-Gm-Message-State: AOJu0YxzrAdn9q2zWTETuOAKwianJe5EgyYxWR5q1/SidWitwTHpE+by
 DVpHP8qLQCY5QSiFO40Oq/QHzg==
X-Received: by 2002:a05:6a20:4c84:b0:148:d5d9:aaa9 with SMTP id
 fq4-20020a056a204c8400b00148d5d9aaa9mr554519pzb.33.1693351422849; 
 Tue, 29 Aug 2023 16:23:42 -0700 (PDT)
Received: from stoup.. ([71.212.131.115]) by smtp.gmail.com with ESMTPSA id
 t9-20020a170902e84900b001b9dadf8bd2sm9829970plg.190.2023.08.29.16.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 16:23:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: aaron@os.amperecomputing.com, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 06/12] target/arm: Implement FEAT_EPAC
Date: Tue, 29 Aug 2023 16:23:29 -0700
Message-Id: <20230829232335.965414-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230829232335.965414-1-richard.henderson@linaro.org>
References: <20230829232335.965414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Y30IKWE9rlwm

From: Aaron Lindsay <aaron@os.amperecomputing.com>

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230609172324.982888-5-aaron@os.amperecomputing.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/tcg/cpu64.c        |  2 +-
 target/arm/tcg/pauth_helper.c | 16 +++++++++++-----
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 06af20d10f..4866a73ca0 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -27,6 +27,7 @@ the following architecture extensions:
 - FEAT_DotProd (Advanced SIMD dot product instructions)
 - FEAT_DoubleFault (Double Fault Extension)
 - FEAT_E0PD (Preventing EL0 access to halves of address maps)
+- FEAT_EPAC (Enhanced pointer authentication)
 - FEAT_ETS (Enhanced Translation Synchronization)
 - FEAT_EVT (Enhanced Virtualization Traps)
 - FEAT_FCMA (Floating-point complex number instructions)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index fec6a4875d..85bf94ee40 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -758,7 +758,7 @@ void aarch64_max_tcg_initfn(Object *obj)
 
     t = cpu->isar.id_aa64isar1;
     t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);      /* FEAT_DPB2 */
-    t = FIELD_DP64(t, ID_AA64ISAR1, APA, PauthFeat_1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, APA, PauthFeat_EPAC);
     t = FIELD_DP64(t, ID_AA64ISAR1, API, 1);
     t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);    /* FEAT_JSCVT */
     t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);     /* FEAT_FCMA */
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index bb03409ee5..63e1009ea7 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -326,8 +326,10 @@ static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
 static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                              ARMPACKey *key, bool data)
 {
+    ARMCPU *cpu = env_archcpu(env);
     ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
     ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data, false);
+    ARMPauthFeature pauth_feature = cpu_isar_feature(pauth_feature, cpu);
     uint64_t pac, ext_ptr, ext, test;
     int bot_bit, top_bit;
 
@@ -351,11 +353,15 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
      */
     test = sextract64(ptr, bot_bit, top_bit - bot_bit);
     if (test != 0 && test != -1) {
-        /*
-         * Note that our top_bit is one greater than the pseudocode's
-         * version, hence "- 2" here.
-         */
-        pac ^= MAKE_64BIT_MASK(top_bit - 2, 1);
+        if (pauth_feature == PauthFeat_EPAC) {
+            pac = 0;
+        } else {
+            /*
+             * Note that our top_bit is one greater than the pseudocode's
+             * version, hence "- 2" here.
+             */
+            pac ^= MAKE_64BIT_MASK(top_bit - 2, 1);
+        }
     }
 
     /*
-- 
2.34.1

