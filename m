Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4053090lfm;
        Mon, 24 May 2021 19:10:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx00hvOGI42qOAJlYYfNx9eU2UTsUkS6r3LbwTovvzeZFUYTsfURCPfomVhEEdcgko7LCmd
X-Received: by 2002:ab0:6586:: with SMTP id v6mr24594657uam.114.1621908618143;
        Mon, 24 May 2021 19:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621908618; cv=none;
        d=google.com; s=arc-20160816;
        b=ElGXo2Af+oQCHPZoc7U/mMrRf0DdmRV1tcCsA3qkLSpC3dMUl9QQxK+H1tVJpzlIi4
         ojMKCNZd9DHSKx2ZNu5JJvdqiDeD9Q6ZKYGCGONHtxO4k+DOk04L76tVeQOjmxREdm8v
         MJM3HT0fQZpI7AgU3bHCLWfHSkTwmkANvdSIpXsy8g9LYa9RGuksrx3LOYHvWjmW8bd8
         Aevn8/CQTu5Z7tfuy38iNhbc421wJkPyRg6E5IBy2sWmiHoupn1JoZbtkoXoBgJfCNr2
         GmJ0FD05H2d/i0LOCdBUdlC7Q3p05j+EDP5GlLi68cf23vp0hR3WsySIWY71MwDCsze9
         eLYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VPedUl43P4vqxrl3NSrXGTDi5BxZimL9v1f9QzCFBpQ=;
        b=s6EhiXd/EOkJs4k+HSPLvV8+eKOKxFsASUQTBUZ5PnpcQ1j00Y/uo8ZdJEZcyTvyQ/
         OtR/Bh5iEaYF/PinRWLjVXWyUujkajhbx50E2FccCWI6GgKogWMxsSRZ5kNpplrrS23/
         nox9gtSnT2GbFQDoN6lk2M72+/te5xG9wLE8t1QRmmXye4qEa3b1QlPNLTEsgJzmevDB
         RIivWrlR+3taf5fyTPgUq+N57CKSxF20nKrKhDb4xcoT9nE4ArbWU8Y8U/uHHwa+v2ma
         ZWY/81vowHw1oLJoxVCX6tXsLRmi9V9yvhFs6cYde9ER6w4gA9jnpG3omMyjc6doYzrU
         GpIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kv2hmvyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w24si3299916vsi.361.2021.05.24.19.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 19:10:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kv2hmvyq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMWP-0002I9-F0
	for alex.bennee@linaro.org; Mon, 24 May 2021 22:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLbD-0006gK-Ew
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:11:11 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLb0-0005vD-Ff
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:11:11 -0400
Received: by mail-pf1-x432.google.com with SMTP id c12so10691961pfl.3
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VPedUl43P4vqxrl3NSrXGTDi5BxZimL9v1f9QzCFBpQ=;
 b=kv2hmvyqSmdFYk30U8N88nW4kg8v6IYVRG9JGXd4z9wBBjuoGNWH1tthMaMC7FM0IP
 gONJwLNhKL90h5H7vEFZ6tNpcOOjlDw+UWmPAk9/ePJtZJTAzLhgl2GqVqc9b3k8JOrH
 SzvfPHC8d30KcJObv8t1XtU3wUWEREtwVBjzmy1GvUppriKuYpimpIBCuemjwfMYmSNJ
 JVARX0WeW8dYc4V5Rw5hSLfi7udQgrhuNZGdysWkEReVZKRZll2FhffPMe0bVdDn3FNe
 LMlZ9pCBAKJqs55ZW1yx/UWdYT2zPfFFiAj/wkqDPIdRAaAWAsF5qagmVysw+p8tkW4p
 FFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VPedUl43P4vqxrl3NSrXGTDi5BxZimL9v1f9QzCFBpQ=;
 b=edZDwnh8l+YN3MT2K/ysE3xS1bzbfuQBICm3sqQkQ/UVpAQadBlV9XLiKNN6OLANdj
 tVtoc3mvqKvyZoBnC6oOf/Js8j9ZRJannHCxjWqfial0OV+0px/Ewlcn7hPYjh2thLYt
 gx5S7cxXRlDzuZMTUfW8pmLphX4O1AttM31X5djRhAKyVPIPn4Jap2Ovd8Uzw4DnqIkx
 kKTdAmpXxykAK1qxp+SoZk4h+LWTW6JI5nUVnrPBQEJws3TqD5/yPOxqQ3qEfv3ZSbHn
 ZSSeDKyk0fY1+bLkTNVl2OGq1FUiNvKSjeHmX/JTL3VMbvae8Guqzmlw0+JXt/EIN4xS
 DN1A==
X-Gm-Message-State: AOAM5319d7T8kuwRO5h83K0o/0flhbg3OrsgEBRm/87qJC8xnDwKjyZG
 mDQoBCUo2DO6WZiI8um+IsV/mDxYcbqi/A==
X-Received: by 2002:a05:6a00:1992:b029:2df:b93b:49a with SMTP id
 d18-20020a056a001992b02902dfb93b049amr27424816pfl.11.1621905057084; 
 Mon, 24 May 2021 18:10:57 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id i8sm10614839pjs.54.2021.05.24.18.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:10:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 92/92] target/arm: Enable SVE2 and related extensions
Date: Mon, 24 May 2021 18:03:58 -0700
Message-Id: <20210525010358.152808-93-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xm6Nuj3fIUqn

Disable I8MM again for !have_neon during realize.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c     |  2 ++
 target/arm/cpu64.c   | 13 +++++++++++++
 target/arm/cpu_tcg.c |  1 +
 3 files changed, 16 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4eb0d2f85c..7aeb4b1381 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1503,6 +1503,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
         t = cpu->isar.id_aa64isar1;
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 0);
         cpu->isar.id_aa64isar1 = t;
 
         t = cpu->isar.id_aa64pfr0;
@@ -1517,6 +1518,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         u = cpu->isar.id_isar6;
         u = FIELD_DP32(u, ID_ISAR6, DP, 0);
         u = FIELD_DP32(u, ID_ISAR6, FHM, 0);
+        u = FIELD_DP32(u, ID_ISAR6, I8MM, 0);
         cpu->isar.id_isar6 = u;
 
         if (!arm_feature(env, ARM_FEATURE_M)) {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f0a9e968c9..379f90fab8 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -662,6 +662,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
+        t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
         cpu->isar.id_aa64isar1 = t;
 
         t = cpu->isar.id_aa64pfr0;
@@ -702,6 +703,17 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
         cpu->isar.id_aa64mmfr2 = t;
 
+        t = cpu->isar.id_aa64zfr0;
+        t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
+        t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
+        cpu->isar.id_aa64zfr0 = t;
+
         /* Replicate the same data to the 32-bit id registers.  */
         u = cpu->isar.id_isar5;
         u = FIELD_DP32(u, ID_ISAR5, AES, 2); /* AES + PMULL */
@@ -718,6 +730,7 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
         u = FIELD_DP32(u, ID_ISAR6, SB, 1);
         u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
+        u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
         cpu->isar.id_isar6 = u;
 
         u = cpu->isar.id_pfr0;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 046e476f65..d3458335ed 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -968,6 +968,7 @@ static void arm_max_initfn(Object *obj)
         t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
         t = FIELD_DP32(t, ID_ISAR6, SB, 1);
         t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+        t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
         cpu->isar.id_isar6 = t;
 
         t = cpu->isar.mvfr1;
-- 
2.25.1

