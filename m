Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp486336lfu;
        Sat, 30 Apr 2022 23:57:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykQ5cwfcsgF5VNRob/icCKPGJGLjdCCdv9x5VNZGewFGU0m3L0ZfUqYh3pkSUMNO5bAJed
X-Received: by 2002:a05:6214:cc9:b0:446:4ca0:ab7a with SMTP id 9-20020a0562140cc900b004464ca0ab7amr5475577qvx.105.1651388274667;
        Sat, 30 Apr 2022 23:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651388274; cv=none;
        d=google.com; s=arc-20160816;
        b=n9gQJQ4P09vp1mcrkr6tgSJRSKNl5oe9Xd1Vv2rl2TWLnKZWk+ZLnpnbLU0VtE/LJ3
         3aqHnrRcT9GzgKZ3PZrDj5Ccpn4+6Z55LqL9VAuzgjPR2BGAz4YjeAjx3zfFMq1eytMA
         rFN/cgg54hvqa/kclpH/wCj8M+59utoZ9+2mKoZox0HL65eo5dduY9164Tv577sOVOza
         AB+1U7ly+jl6NC2sT9TjMmIbkEZ2KslwYk0oWoNZtKu3dR7Fbrm9rICvLL6k2NgUHzAV
         UkbSJMD05/HFVjcKv3tnDqcqNFQCgu3HjNsKzwR0emmAir2ocomoRYgp6jGUPjys1QKI
         EVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YgPJJBWxd6UwNbu8I9UhpjXUvb+eh/ewRL4C5SYoXZc=;
        b=mhGWUmZ/k5P2VFSL3UgjJR6kSpYm4XNgH9KFUqzgIwTppTdOqjGRBc/B2b/md9Aww6
         BwfH7YnYH+dRugHWsAHW4okvY3enEmtyGrrRHStLMtQoyIiifOFunB24ZiBKdZqBq8Ls
         GUKUkFBe0st1skquLGoUKdcdBTes0XjvGqXzNK1dMzXgK6IObPgVBYyitJMjwjqXjR5+
         z8JEYs2RpHH259+637tRIcO1gjZOqgqXUiXCXE8nSRaZm30Sy9i+59B1k2ZVKUa3IXRB
         3iPlEvKSNL7Y2K4U9cyNkLkOUl0VzLSgIGH5n+JWg03JzkTnnOWb3UH5AfvE98LYdrWm
         Z0SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ljUxeRGa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8-20020a05622a044800b002f368c31bf0si4691878qtx.136.2022.04.30.23.57.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:57:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ljUxeRGa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl3Wk-0007AP-62
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2X5-0001AP-Uo
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:54:12 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2X3-0001lX-Pc
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:54:11 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so13806404pjq.0
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YgPJJBWxd6UwNbu8I9UhpjXUvb+eh/ewRL4C5SYoXZc=;
 b=ljUxeRGa0jwvJTYyNAzohNeJNnLr1DQxCjttj/QKBYNjVUQnWWSZaRvLgKJdB9R2To
 0LwzWV0iSsS6nXujHOrRXUSgM6FjbjTfeXIQDW0SBt3Drymx8aOQPrhtXtNVT+Nzh1pH
 OKpgFzQGVJbbyO6mMnKaAcpO7ZUnFA2z2DakqgXM8U9qQQjYgY+SKPaoLMD/GdUky9iK
 lhir4+PO8gtLuTB21oW6m7RcefTz/eUeF6b806x6OZ28K/gx/ZSujZExs/gjBgye3uDy
 U4+K6+Ef+9ef97Uu+izG6WQQ47lcIpsrkaUKgL7e5R+E4BsnUSBny6hWqlUVHAc+CWLZ
 DLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgPJJBWxd6UwNbu8I9UhpjXUvb+eh/ewRL4C5SYoXZc=;
 b=ZXzx8bZ3b6BcHntaxztM3JBPccC19OkjrD0b+Xf9e6cy8Vaonm8EskmR6cFbepekmf
 lVQeYyQC2tjGMzi8ZQfDc7MWGv6LCmG3e/iBGdRYw1RvAGVsJ+e9BLKsN/nGVAerZZ3w
 jEjSyIKwlogpnZNT9ehilAVh4Z7kkpsbAWT5o2VR+ZwqzBhkm+mwS4ed/C6jvh5r6PfF
 4SIlXBys9toNBaJZdLerBa237CPz4wG+IcnKxDSJsl3eUXWRh8kUoJx7Rq8uo9fR6NjR
 ggcZrJEtUpyc0GjVs6QE2sJmgKDIfkHdV7E5NqSxwUDExLqhV4GET7ODSjg+YMHVtD21
 9AIQ==
X-Gm-Message-State: AOAM5305wDn0s1UOEanDt73b11dloi+3C6VgUz9un9FJaJem0bkBbW49
 DOVmtyMbnWlxiNCOM7geDkiKhA==
X-Received: by 2002:a17:90b:124a:b0:1d9:de12:520f with SMTP id
 gx10-20020a17090b124a00b001d9de12520fmr7139816pjb.28.1651384448637; 
 Sat, 30 Apr 2022 22:54:08 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 u63-20020a626042000000b005082a7fd144sm2341507pfb.3.2022.04.30.22.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:54:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 40/45] target/arm: Enable FEAT_CSV2 for -cpu max
Date: Sat, 30 Apr 2022 22:50:22 -0700
Message-Id: <20220501055028.646596-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RoeX4v0ohZ98

This extension concerns branch speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/cpu_tcg.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b200012d89..b2a3e2a437 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -12,6 +12,7 @@ the following architecture extensions:
 - FEAT_BBM at level 2 (Translation table break-before-make levels)
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
+- FEAT_CSV2 (Cache speculation variant 2)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 10410619f9..25fe74f928 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -748,6 +748,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 1);      /* FEAT_CSV2 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index c5cf7efe95..762b961707 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -68,6 +68,7 @@ void aa32_max_features(ARMCPU *cpu)
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
     t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
-- 
2.34.1

