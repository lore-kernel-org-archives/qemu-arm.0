Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2451909lft;
        Sun, 3 Jul 2022 02:13:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vvg0sRVLilPghv/nUkS0BPSzdZTWpRLZ53Qz23rjQ3u8XRPROHSIETQGPMkb1mXzRIh/Ka
X-Received: by 2002:a25:3757:0:b0:66e:30a0:9fa5 with SMTP id e84-20020a253757000000b0066e30a09fa5mr4080335yba.433.1656839595319;
        Sun, 03 Jul 2022 02:13:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656839595; cv=none;
        d=google.com; s=arc-20160816;
        b=CNBnkVMxyaRtJaij1NJIks2YUW2KK8mv32s15EbVLHWLwZA58BgKuyJetgFk/up5nW
         wMQ6YGwuurq1ZJit6LOJ9wSFIJfo0yOCTXenohy4iH6K91OBrVO2vK+wV7G3VApt1tb9
         V+KNlsLbZ9nt5vVjZuovaOnauo15uejPNHcebGby3Z9nJ3IdzNhYCrJvpp6WnYOn86g1
         0xWZbHtxm1c/13QpdKqQ+eCT/tOIoLsR3InW3O8dt2cX+9ByGcU7uVPNgMj1MKkT4n50
         jJ4wSy8IIAIxrapN74I98niT3eSQhQ5KQbmxCqxIBoRdZ8jtS1fBpMg0CJnP2MTOi6Au
         4FjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IFacPIEDusd1hE7rtQmwmoagq5wzcnFBcC4AqTaOWD4=;
        b=XHZ+O9uogdgw59oexSUyAlPGKD6vceGCrVRcCb/pEdPjtm5erf+bWLAsS5v7DXETIv
         XpHBFM936G5ki9ZdFWJovi1espYqqS5zAyOkpmKXIUTO7TIZs5blK3UDtVOBibATLJXx
         aVaJ+MFkQuKhCr06ZurAjvfY6hwqPtEXHIVcKWEcdhQtgfZzZMCiaWdJko9hlKCeShsm
         q8t2kWn7wb5AayHz2VzPbh6BZbCMpJ0VQr14yVbAX5F23g1l7PU7i5R0lE3KnR4t/hmJ
         Me84cplit1QcmW3XBm4KqoToJ0oaCwPiLJM1KT/51MdAEOcl7+GBKxVgpSZ0LgJxfUko
         9C0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rI43nmAv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k132-20020a81248a000000b0031c8704aaf0si3173975ywk.261.2022.07.03.02.13.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 02:13:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rI43nmAv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vfG-0002pP-KY
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 05:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzP-0001Bk-UI
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:29:59 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uzO-0006iL-Ej
 for qemu-arm@nongnu.org; Sun, 03 Jul 2022 04:29:59 -0400
Received: by mail-pj1-x102d.google.com with SMTP id go6so6633574pjb.0
 for <qemu-arm@nongnu.org>; Sun, 03 Jul 2022 01:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IFacPIEDusd1hE7rtQmwmoagq5wzcnFBcC4AqTaOWD4=;
 b=rI43nmAv8FKAGO74g/+4inYLf8AMbBUR5jA9m6gi3h2SBv1sc0QKicyPKe2PEN+jSI
 lc8DCPbKOXtnIcJxAqff2KTk9fXdAfosMoUEMmpw67MymbnKKlnvAgMr9i1pt10VLnp9
 wHUx8zAwCGkY5xbuLs1hORXajB5rzdQiJRvNg2p2BeTMjMlklrp1N96y8RlgPREV1ssq
 l527MWQZ8kDvPg4rbrY6KNquU2N/t8PbGvvg7uSFlUKVMrUITFIZ6huoYkbY3MZT3x1N
 2ZPHZPUfDFgDWWiYAODAACDAGAkpzt7ZOszi/N6yWtgQAF7GAzGcn3i2JARTufcUIJQh
 Sipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IFacPIEDusd1hE7rtQmwmoagq5wzcnFBcC4AqTaOWD4=;
 b=eh/AS1/IInTqiE5dXrfk/RUsRdYjNhA8WT1kLZFCyEawTJq/xnMmdH3umXjCMh0M5v
 FB3kiZPNivjgve2fu9pMGDx6u0IARflH6fVY4af18570bAM89NcpW8hlPyg5QYBsqFCh
 N40t6vRNP/SmhxU9Aa+g261XZMJcivpudabrSEixxTukac0SYsJbP0KkJsb5eRvWgG1e
 EmXQparRo/0ahRQGnun4QnTf4qMgG/V4DSGsXiVy+e/m9dj2Bf+XfbYsV3sqM3f7O7Jc
 l6X9om1EVKxQdbM4k0PNMy4K8EppobBJqNju8TQvS2swpgDshBAhNzXW95L5tAvNw09x
 WRgQ==
X-Gm-Message-State: AJIora9KyIEsn2vAvjLmBpXo8ipSycN9mfXF509PzEBiHPuvoR6SFLYX
 BSFwPJXM6uWzuiZ++t2AYXF32Q==
X-Received: by 2002:a17:902:c402:b0:16a:5204:3066 with SMTP id
 k2-20020a170902c40200b0016a52043066mr30085987plk.126.1656836997241; 
 Sun, 03 Jul 2022 01:29:57 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 g6-20020a1709026b4600b0016788487357sm18574523plt.132.2022.07.03.01.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:29:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 49/62] target/arm: Use bool consistently for get_phys_addr
 subroutines
Date: Sun,  3 Jul 2022 13:54:06 +0530
Message-Id: <20220703082419.770989-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
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
X-TUID: I0XDpVNdl4Ng

The return type of the functions is already bool, but in a few
instances we used an integer type with the return statement.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 993f015904..a2c441d947 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2376,7 +2376,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
                     fi->type = ARMFault_AddressSize;
                     fi->level = 0;
                     fi->stage2 = false;
-                    return 1;
+                    return true;
                 }
 
                 /*
@@ -2397,7 +2397,7 @@ static bool get_phys_addr_disabled(CPUARMState *env, target_ulong address,
     result->cacheattrs.is_s2_format = false;
     result->cacheattrs.shareability = shareability;
     result->cacheattrs.attrs = memattr;
-    return 0;
+    return false;
 }
 
 static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
@@ -2408,7 +2408,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
 {
     hwaddr ipa;
     int s1_prot;
-    int ret;
+    bool ret;
     bool ipa_secure;
     ARMCacheAttrs cacheattrs1;
     ARMMMUIdx s2_mmu_idx;
@@ -2486,7 +2486,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
                   (env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW)));
         }
     }
-    return 0;
+    return false;
 }
 
 /**
-- 
2.34.1

