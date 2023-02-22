Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3827333ejb;
        Tue, 21 Feb 2023 18:35:20 -0800 (PST)
X-Google-Smtp-Source: AK7set+p1CS+MeIsmDrsOIyyugi/lv07sd6DOBYB6u/D28NdZBQEPAe38RCiJvzZRBggbuk/j9xk
X-Received: by 2002:a05:6214:da5:b0:56e:a9c6:d2c6 with SMTP id h5-20020a0562140da500b0056ea9c6d2c6mr10852269qvh.6.1677033320235;
        Tue, 21 Feb 2023 18:35:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677033320; cv=none;
        d=google.com; s=arc-20160816;
        b=beMkFlKWslD+L0kJ+UMLTTzJd4FYoMWzehi1dHvQUmZnY3jJR7fPLNfwMRnl3GUOpL
         pk1AzXSDgAlT/liESVihYNjgR+DOdkfArID/3UezSR+qtQFn/xdVH+531/UVEEOFNU1B
         vCYYBNBBTTPKW0XP3PJJqOGxHm/kD5TlKO/4JETBHm9jr2R8vmc7zNdu2ldQfzv+kjVB
         mDlC9W2cfcFl1gGzqnxhSMjimbFBqHejkFYgXwFs3XFmq4so3zw727MWwBT66grGM8FJ
         k8aNxpJyIrcpv2jiON8KSdk255KpbnGQFYlpCbcrylX2S917Ji+aR9WO2Pcn+X9cdb4G
         as4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BdnIrBC/vjhypfMOEhRm01STyDVGWe2QDHvXiznUOKk=;
        b=aaxn8OUpvt1cJHI2iD84bv8Q+6wRSIUgLXVE8Nbxu08spawrHKC3emGWEJybxVhM4r
         uCw8ESTqeJx8gWW7LsQ+/Rg+39yWyYxwTr6cOMvhmkZcSNPxPdXIwYrDmAf3WXvMRTAg
         IrNZ2Fp66kXWqB2depf5DA/kc4mr7GVNm0JKXLPFJ309wpaCycWo4cWlwmAZwNFFlkW8
         nEgxkkcog309j/x0XFvPJCJ/BHFancFMh9AtBjsLrmdByLpbyjD5oJKDHK6/yRv2qRlC
         avQWlTxp9vdJnsQbWpCjs6pW00AU5j1aFNdFE2k9ESRobtMr2hx2IujvYZy7RimYH03P
         mhPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zso61bsF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020a0cb2c7000000b0056eb3abe4f1si5434637qvf.168.2023.02.21.18.35.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 18:35:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zso61bsF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUexV-0007iI-1k; Tue, 21 Feb 2023 21:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexQ-0007aR-3S
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 21:34:12 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUexO-0001ib-9N
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 21:34:11 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 il18-20020a17090b165200b0023127b2d602so6865624pjb.2
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 18:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BdnIrBC/vjhypfMOEhRm01STyDVGWe2QDHvXiznUOKk=;
 b=zso61bsFfah/MWT18NzTF8AtAjKsks4Cy/ph/tOiuBaHnIsiuTMfL5WUCUkzGw197O
 AU12Noq9Gk+EddplGG2EKL4PxO2XGm33hnyig73x57Rf2WYR7II8HvgvdfIxGq1F0hvu
 HJo0N3OMq9CVRT0wYmD/Y2VPFAGsLIW6MQsIP7Vhf2LLZ7sQJza/J2Fr7PCwZwQJNN/o
 zluuikVoSg47bYg3Amolmamt4K0fHji+DfDRkeKrCc+SWh+iRVZwEEcqu9kAdTy85tCP
 Hu1sZjgzbzr9X2sf84JKxAExnpv1jk2fFq9KuH4HBFZXjic8BfwG0VpuS7sC0DcwL5es
 6fGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BdnIrBC/vjhypfMOEhRm01STyDVGWe2QDHvXiznUOKk=;
 b=3LdH721f0A9VfcJXvW/btSSAqTC5dK4cZefpfhyxbfvqw3aqZAgKq4dgJZBvCoWueu
 cY7bXgAX2ppyaIbqVOymvEnNuvMogAnUNqJjXiSy6M2KDZH0aWksrvJDgTGWaI11YmOq
 U+Gm1/N2vJFV8NmnT369y3ZzwzlxYmZGfPGlWlEsEDCGy8dj3xVpFT4bWzItvEeqb5U+
 uhs26qpvBRMpwO7gGrXJ9Kv6VfUoCn6Un1dxCfmMF6Vy3LDPYPbx7JnF7bfzFOja7/oX
 lXVaNz8WH3VPAAo3jmH14ET7CH27+6mu94Or/B6FQ8g38Id9cFxocObC/HHPuFiXkMfl
 o5kg==
X-Gm-Message-State: AO0yUKWYWBtI/ReHG/1g3xF+AHDmy27WtS7mGvkPEPmjz0TCSSoybUe6
 FZRtYDAX2FZsfPvd/QfxWz0y8Rgl0l6J+szrsFE=
X-Received: by 2002:a17:902:6bcb:b0:19a:ae81:b09b with SMTP id
 m11-20020a1709026bcb00b0019aae81b09bmr7346310plt.11.1677033248751; 
 Tue, 21 Feb 2023 18:34:08 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:34:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 21/25] target/arm: Add GPC syndrome
Date: Tue, 21 Feb 2023 16:33:32 -1000
Message-Id: <20230222023336.915045-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
X-TUID: apBVhiMd82qy

The function takes the fields as filled in by
the Arm ARM pseudocode for TakeGPCException.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index d27d1bc31f..62254d0e51 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -50,6 +50,7 @@ enum arm_exception_class {
     EC_SVEACCESSTRAP          = 0x19,
     EC_ERETTRAP               = 0x1a,
     EC_SMETRAP                = 0x1d,
+    EC_GPC                    = 0x1e,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
     EC_PCALIGNMENT            = 0x22,
@@ -247,6 +248,15 @@ static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
         (cv << 24) | (cond << 20) | rm;
 }
 
+static inline uint32_t syn_gpc(int s2ptw, int ind, int gpcsc,
+                               int cm, int s1ptw, int wnr, int fsc)
+{
+    /* TODO: FEAT_NV2 adds VNCR */
+    return (EC_GPC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (s2ptw << 21)
+            | (ind << 20) | (gpcsc << 14) | (cm << 8) | (s1ptw << 7)
+            | (wnr << 6) | fsc;
+}
+
 static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
 {
     return (EC_INSNABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-- 
2.34.1

