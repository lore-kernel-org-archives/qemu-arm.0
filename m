Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2707519ejb;
        Mon, 20 Feb 2023 15:28:59 -0800 (PST)
X-Google-Smtp-Source: AK7set97Ws7SViNgKGpZJhXY3uhdzpW+SV1/eRBc9m42AA9qsMqBHdtYmYAXpjXMNcwfeQcsdp81
X-Received: by 2002:a05:6214:21c6:b0:54f:b7e9:182 with SMTP id d6-20020a05621421c600b0054fb7e90182mr3811666qvh.45.1676935739727;
        Mon, 20 Feb 2023 15:28:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935739; cv=none;
        d=google.com; s=arc-20160816;
        b=MLbCx2DDApN5wb9SpCfBgRdtG0UMB2MGXWFBVJvRCX26MpzWGADmxW2VsgAcWVhSRW
         18Nlg99lDUtGfiSoXkR++TupPNMdIFgKAQl4OzdizosBBP/68ZuYDhjEJ9JAMyvqLq5d
         sVyIeLbvHLXaeguZb8C8wQV7lbKOYiZx39RyWoMXSeY4VgAm8nEG2iK9cYUXRSdZjfca
         9EiXlnrqyC5gh8zhaYtv4d81ZkJS1PNi0yybnLLaidE7p8zUp5OTjI6JFCsVXH2pZDmL
         ti4rv1KDQjjpfTq13+jZoduiCdydEUD3SlK5tgcCBeV9xfaYM9J2qzNvq21ElZTSJiMm
         fM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BdnIrBC/vjhypfMOEhRm01STyDVGWe2QDHvXiznUOKk=;
        b=OTD9i2/mtP9kKrOPI+2HCjylL28hxBmYYKwCppfXXKyzV3QUtB+zTGwcqC85mnd5VY
         rwHTCDCTwyKN7S9BnxaAiR/7Q2Y+pSdLh8g/61s1tbsgaplcQlxvzcXtEHQVZXxkHa3/
         zlxmu7Vn235R3upjZRUmNTOyASigKaA3fSxPol8FkSsYAl+QjRGAMW+f9Axud5lrdSTW
         HDEeYsMThuARvW26FW3Ynwc6V96OzbBXCHJUJotlspq67NQT23MjLVNbumh4PtNEaEqi
         8b8wgE1Jw6MTCpEXPsEP2pYhArpXvKeurtHfdsjZKa5tF79rdUAcESl88W8STplm2awp
         63gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TUOdBq8x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6-20020a05620a29c600b0071c230a72fesi10954058qkp.515.2023.02.20.15.28.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:28:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TUOdBq8x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUFYp-0004ho-SW; Mon, 20 Feb 2023 18:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYh-0004P5-Ca
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:59 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYf-0000JI-Qc
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:59 -0500
Received: by mail-pj1-x1029.google.com with SMTP id o16so2898921pjp.3
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 15:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BdnIrBC/vjhypfMOEhRm01STyDVGWe2QDHvXiznUOKk=;
 b=TUOdBq8xbouISD67Tp0NvVaozs9Bhh6/loj1Byeww6gSDx3TKf4KT8/XkpqD+AMNTd
 eT2cc+p+ri/R1YCaaGWdbTJDkHzeeNc7RT4BCNXXf809f1VEeGq5EbjKeMQM2mJr12VK
 Z4FSa4NH5rcikVDpvGATz3KU7Rz8EbcHC37Q3TBIblxKO/H+UbRCPeM+3MIjW0F8UweS
 R2NkhLcxYODbpY99GUGX7rq+zGD2q5/z0ur8Icl1PTiBCnbOUrMlHHMpj7HhVGCtlI3m
 tBQrzz9pyNwuaQm1HMDzm72TNnc5q0xzDCMy2O/rnk0PiEiKoRFvMFhvHCzFHTg/lrNJ
 Xm0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BdnIrBC/vjhypfMOEhRm01STyDVGWe2QDHvXiznUOKk=;
 b=qH9YBFIHh6NWzOv/++RRfbxBQhgb3yUJLuR2o6FtC9uldoM2mnlA+eR6soFJvnR+qm
 spWdjCAhiOOVcmKqLfl8Du0Hii92MUwO+P9NOArE5DDSEWFrlvd5/fcCXceXvCtRtP3D
 1QIrwcPw843FCsDNuSSazR8Hk2dTO/g2Iut4dymPvYVQZUtg8Tv4ZYH4gaAC9UbyGPSM
 SKWXpO1zAucOXxM6eQW7cC1VFmwoEjeVXbbYmExYpLeRW9nP9LLThh1LI3gHcYWnEeO8
 k8KBrFv/sq8gBxMJlntRwTz1gt2SqQTFjakdsFJFG4ap6dJFwgYSMtKo4uocp9uUFGxS
 6U+Q==
X-Gm-Message-State: AO0yUKUzPcQPs+9lbUz0SGDup+KCWEak7+ELG7AJ28gjHNG4Y+PU9+yt
 GIPKcOiOUPk33ozwccErRK4tq/43MPBRZDFOG1Y=
X-Received: by 2002:a17:903:32cf:b0:19a:b092:b31a with SMTP id
 i15-20020a17090332cf00b0019ab092b31amr2393748plr.8.1676935616792; 
 Mon, 20 Feb 2023 15:26:56 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 17/21] target/arm: Add GPC syndrome
Date: Mon, 20 Feb 2023 13:26:22 -1000
Message-Id: <20230220232626.429947-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: Z+xyqWTBBixP

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

