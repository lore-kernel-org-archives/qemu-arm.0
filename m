Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp345235lft;
        Fri, 8 Jul 2022 08:40:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tuScKPVPb5Eh16n0ArAk2S3jCLtuSUFJ4slkc6A267KZVu5AjauDMeW0fRpUyAqmftflj4
X-Received: by 2002:ac8:5d91:0:b0:31e:a97a:5360 with SMTP id d17-20020ac85d91000000b0031ea97a5360mr955494qtx.497.1657294804475;
        Fri, 08 Jul 2022 08:40:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657294804; cv=none;
        d=google.com; s=arc-20160816;
        b=aG8zW/ZYSXMgzFr40D9Nqr92SunBa3Hbfu8o4Mlest6Tsjv0GrfXOMi62r7sHjsUXW
         wyXesoAv2caZ+T6QSN/xtuSFZXwAzBhET45/jWSavxF8JOVJV7WRGsG66q/oi8au8akb
         SJVGTPeLSG61U6KFCbqzf3/rFdHxYzK5pJWtXOL7ADda2yoVFJXCsYS4yAn9znRZ4yh+
         7A5fpWlaXiOVhW2b707vF4jvQ2lov/umc4nYkzEDdXrqjF69HlXVfEkB6xcLpaR3wIr1
         NpA/pE0P3wRLx9BR8jzBosfv4E/Kcr4qLeqxq/x0StYB8VgFDDRXtEjrwLnsoEbthnm9
         9vqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vrb9+6VIoq7Bg5bHZHKrK2kLLIpATDy32zLGrACiZHA=;
        b=pzXjbxnfbaVy7rzRF4lEvzJb5PUAKd81gBScLAarnsuFebgRUrpmsiUVtKpIn+f0pJ
         fyXti0tEhcbtEUDdjyG4Bn+9jsJ1u5pOFNaQYYYpkckemMQVkc9oyZ6d47ab2GjxcYaO
         yw4GAeGaVRgY7uTski9Vh7EP/suWwAlycOytxQ5y2+hxcoRAUvcl3iwRdTXlEa8l+s/p
         ZxWB4gifwKJBiFhoBxL1u6neS6Kbr7sNvDe+X+BOSBNHlri+tYs7RXmut/5uwOblSlXd
         Y8vVbaHXd/8Doo3Si52EOLrs/xwcOeOaVy2vlhoBQ2PFdsVlcLb8/DYRXo+slMa06ggC
         LumQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JsNuTco9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020a05621419e400b00461da72843esi10525889qvc.455.2022.07.08.08.40.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:40:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JsNuTco9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9q5L-0006YL-Uu
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjS-0004Ob-A9
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:26 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pjP-0002TX-P6
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:17:25 -0400
Received: by mail-pg1-x52d.google.com with SMTP id bh13so16666083pgb.4
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vrb9+6VIoq7Bg5bHZHKrK2kLLIpATDy32zLGrACiZHA=;
 b=JsNuTco92PWee4YPTOxZ0ukqtXHhyzxdktd4+4b/Kd1wSsVzI2bo3/L2cz4Y1l8D5k
 JG1tRPfWDPYsh7IKTRnXKVADszStX9kZxLyRAfIxT13YmKT3RIwbyDoQ21UXw+VoYDd1
 MTLHstHmZrolixbWN1FI114M3lSzZLbYFIKStnfWeFzpQzcSfnXupGHUWn48oTfHvkDV
 KvUuue/nBQHHXXspVe6hNyy1ty044KC+wCF3iPe4sj56KdUTOOZhe6VCbu7iC+5pYSBC
 JIDwsRh7RsSgdqph+qudtiN1TgQW7ZQ5AgQiDzyQWVOffDQ+imRE6eAV8uxA9vbRt9b8
 23ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vrb9+6VIoq7Bg5bHZHKrK2kLLIpATDy32zLGrACiZHA=;
 b=2Ox3i1h3xGZyyCePb35ncrco3tXHhU6mffbJYMXEQVY5d+N5juUXCzqCQz5lzNtKm2
 xt6ZuBTxxKyWop+mS/s2IUMyQ2HVVb05UjVsrw9LO3MWaP96LJM3oAeHeYo2gVDaUtyQ
 9N0383XvHX4wZ5hHDgAJ0j6IGmRnfsMZqDWijUZdnHeI861S0vEOR3f3uHW7rvzUiSnP
 Nu8XGMWjiRAfBDi7+SXUaFVSMPKCbqVTPNB0due5ALAJgqRBS7Q8Xz2ivNOvIGh6SQe6
 yX4ivDsMZdw5Mvu5M7F3nrTUUm3tm4SLON6cBtrq0bErwU29+zZkAqVK7Y2AfgpHwg/R
 M20Q==
X-Gm-Message-State: AJIora/PXkSnneEOVcH3XVFVJOLjDsTjvurAKtfgFzN6gEv+ksZKymxu
 Nj9PezHcoz36S6bz+aZBFSl1Ew==
X-Received: by 2002:a05:6a00:1688:b0:517:cf7b:9293 with SMTP id
 k8-20020a056a00168800b00517cf7b9293mr4523126pfc.7.1657293442649; 
 Fri, 08 Jul 2022 08:17:22 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:17:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 32/45] target/arm: Enable SME for -cpu max
Date: Fri,  8 Jul 2022 20:45:27 +0530
Message-Id: <20220708151540.18136-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
X-TUID: T3zADexVH5o8

Note that SME remains effectively disabled for user-only,
because we do not yet set CPACR_EL1.SMEN.  This needs to
wait until the kernel ABI is implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst |  4 ++++
 target/arm/cpu64.c            | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 83b4410065..8e494c8bea 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -65,6 +65,10 @@ the following architecture extensions:
 - FEAT_SHA512 (Advanced SIMD SHA512 instructions)
 - FEAT_SM3 (Advanced SIMD SM3 instructions)
 - FEAT_SM4 (Advanced SIMD SM4 instructions)
+- FEAT_SME (Scalable Matrix Extension)
+- FEAT_SME_FA64 (Full A64 instruction set in Streaming SVE mode)
+- FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
+- FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SPECRES (Speculation restriction instructions)
 - FEAT_SSBS (Speculative Store Bypass Safe)
 - FEAT_TLBIOS (TLB invalidate instructions in Outer Shareable domain)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index b4fd4b7ec8..78e27f778a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1024,6 +1024,7 @@ static void aarch64_max_initfn(Object *obj)
      */
     t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
     t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
+    t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr1 = t;
 
@@ -1074,6 +1075,16 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
+    t = cpu->isar.id_aa64smfr0;
+    t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, B16F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, F16F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, I8I32, 0xf);  /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, F64F64, 1);   /* FEAT_SME_F64F64 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, I16I64, 0xf); /* FEAT_SME_I16I64 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
+    cpu->isar.id_aa64smfr0 = t;
+
     /* Replicate the same data to the 32-bit id registers.  */
     aa32_max_features(cpu);
 
-- 
2.34.1

