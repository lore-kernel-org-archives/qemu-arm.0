Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp909594ejc;
        Mon, 22 Aug 2022 06:27:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR51vsT7R0D96BpS2lrsiA8fAc6sHDlyuVaV/LEGi3g7nf7+blZ9Xl2OZVCK0kHvM/ctbrJB
X-Received: by 2002:a05:6214:ca2:b0:496:e2d0:e964 with SMTP id s2-20020a0562140ca200b00496e2d0e964mr4015077qvs.19.1661174830865;
        Mon, 22 Aug 2022 06:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661174830; cv=none;
        d=google.com; s=arc-20160816;
        b=weJbIaL27hMFA10Eha1jS6IOZxjL7FEgpUXNk90HNF3sS88PuDF5KU2CpfnZ4HanTq
         Mdxh9N4niHuaUQtgbPm8BkfUBBBxJQCg5D7OGjpj+lXpYEKs4sCZdapXD7J9YcslU+or
         HuTtcT4A5IdAeWtqopPFAgSHXw1TyPJKNafwveAyO0FFVceLcIv62tUHFyGWYBTWyiuR
         CWWP2jwIYzszvhCI0C0VtTYdd8ukJeP2TS1RtlUqxgiPo784eHEz4mMHrDqUfG7nzG4i
         07idI/R4CzTV7/HMK3cbZhRfxSfM6b3X2FDK4pGOskllwiAw+9cqu7jm9JoPI2IHaFoq
         AMvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WKtyI8kjRNlnCB4JM27i0afmEKH1KHPL+DE/obbLKuA=;
        b=0nO4XWJ2C9nZLGF7kcTUtmCwkJm//A912W9SV9eMKCNzW0/3vQiTnVWr3thzipd3EN
         RFg6W+hCfCyb+QU9jn/uzc1R3fPFZMeXJ2PKIXTD/6uYqgdTXsIFGZ4rUdg/HB4L6rjM
         /brMWLRaMjuE0n+4OyL9FILezmwuViLjMGUZoKzs3/6wYn88rIQrg6tz/lHl61fezg5i
         PnTpQdQrwio7W3EA6osJLS2i4BHz0czv66QkLTMZwObWq3ztOBoiPvs8vZP5kpXBaZP6
         cksY4BMKY4TqMbWnmynUNSiR/uKXl4AVrAnn8avGHXvBfIwnZDMw97TmZCPl3ReyHRXR
         Lc0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XIvLYfSW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf11-20020a0562142a4b00b00496a815f59bsi4840594qvb.478.2022.08.22.06.27.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 06:27:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XIvLYfSW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQ7SQ-0001gI-6g
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 09:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PZ-0006FO-Ss
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:13 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ7PY-0001hH-93
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 09:24:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id k9so13229741wri.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=WKtyI8kjRNlnCB4JM27i0afmEKH1KHPL+DE/obbLKuA=;
 b=XIvLYfSWLsrWUnIX93zfq1Lp2LaVw/gKwEh7tArs9eWFgs4MsoJkikWAArcb2Kp0ic
 Pc1yJlszmCAS0J6hmGIh5JKv4ClP8nF3QfwqzHdZ24RITh2uMR5cfqTIYsVLwgTVMWnr
 bYSJ3IYHXsg9KUzO0Dn62IA8BOYvB0sLoPFvOVoFKVnd670fJ+sS6VWBBtk6XevP1OiS
 /6gUw5x6YmpuX3DVvmPhMaPWb9mVBiYiu8P5w1bHPSYyX52/4Vsd/HUioZyCCpOrerWy
 8CNBbWQa8Wvau23gL8wTNcVHsamH4j1OEz/JqVafdTKP2QcGesgGeYYlTsaaS86nMevd
 FU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=WKtyI8kjRNlnCB4JM27i0afmEKH1KHPL+DE/obbLKuA=;
 b=tEdHAeVuu6NXf0uJ1hAeiE52uQ3w/peknSCC/tFSq5gC4vOxo0xv+uVYn1hzedsP7s
 4fr2AZRQHItdIJHc4IcoTHHvO9ZyozZWhuGAdvqLQydO1AoxLilxGRNgVYr+8LXFQHz3
 azBxQR6xp+yc5LeFyyReHrE0fCOnsIdZEO3YFWiMuyknFyJFGu1Rt2UxAiIaUexNumkX
 gxQwV2tx4WussTzLyPGbHmcEBndCVk8TYKyjpRqTP1t6YjE6+C3+E23Q+L3pF6uxATVk
 6WXCXffPegNWW+0N5LeKz8vmQkTL5BX3MJnxed0vFhF6GRT71OOIULkjvMc228zJ0kkS
 RSvw==
X-Gm-Message-State: ACgBeo1xzzSDK/5zkqAOH7O1Ugn0N74ZGfDakoC91m+crDKxtqGROQfw
 oco9MA3+xYiVoXWLNeya2OF07g==
X-Received: by 2002:a5d:5269:0:b0:225:4fa6:6b03 with SMTP id
 l9-20020a5d5269000000b002254fa66b03mr4257352wrc.163.1661174651046; 
 Mon, 22 Aug 2022 06:24:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020adff98c000000b0021f13097d6csm11527946wrr.16.2022.08.22.06.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 06:24:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 10/10] target/arm: Report FEAT_PMUv3p5 for TCG '-cpu max'
Date: Mon, 22 Aug 2022 14:23:58 +0100
Message-Id: <20220822132358.3524971-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220822132358.3524971-1-peter.maydell@linaro.org>
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xOZh5Jt3oiKS

Update the ID registers for TCG's '-cpu max' to report a FEAT_PMUv3p5
compliant PMU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v1->v2: update emulation.rst too
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 2 +-
 target/arm/cpu_tcg.c          | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8e494c8bea5..e36a60a4da6 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -52,6 +52,7 @@ the following architecture extensions:
 - FEAT_PMULL (PMULL, PMULL2 instructions)
 - FEAT_PMUv3p1 (PMU Extensions v3.1)
 - FEAT_PMUv3p4 (PMU Extensions v3.4)
+- FEAT_PMUv3p5 (PMU Extensions v3.5)
 - FEAT_RAS (Reliability, availability, and serviceability)
 - FEAT_RASv1p1 (RAS Extension v1.1)
 - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 78e27f778ac..fa4b0152706 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1072,7 +1072,7 @@ static void aarch64_max_initfn(Object *obj)
 
     t = cpu->isar.id_aa64dfr0;
     t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 9);  /* FEAT_Debugv8p4 */
-    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
+    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 6);    /* FEAT_PMUv3p5 */
     cpu->isar.id_aa64dfr0 = t;
 
     t = cpu->isar.id_aa64smfr0;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 3099b38e32b..4c71a0b612d 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -81,7 +81,7 @@ void aa32_max_features(ARMCPU *cpu)
     t = cpu->isar.id_dfr0;
     t = FIELD_DP32(t, ID_DFR0, COPDBG, 9);        /* FEAT_Debugv8p4 */
     t = FIELD_DP32(t, ID_DFR0, COPSDBG, 9);       /* FEAT_Debugv8p4 */
-    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 6);       /* FEAT_PMUv3p5 */
     cpu->isar.id_dfr0 = t;
 }
 
-- 
2.25.1

