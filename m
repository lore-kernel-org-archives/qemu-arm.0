Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3826918ejb;
        Tue, 21 Feb 2023 18:34:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+lyTR5h6CZJZR3D8fSqSa6aEPwW7i6wUdhzaCIVQvinwLC71YDP2fl5qkPw8MQYWFysLlk
X-Received: by 2002:a05:622a:1013:b0:3b6:8b52:1359 with SMTP id d19-20020a05622a101300b003b68b521359mr12056651qte.0.1677033273732;
        Tue, 21 Feb 2023 18:34:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677033273; cv=none;
        d=google.com; s=arc-20160816;
        b=B7ebVLVwSGZxI0MMnHtvI3681/InOwGcvjHJLrb3UnA4p5As7qSRv9sw6To4nvMXlA
         qut/ZbS5/ViEH8Yt0Q52EWiEH1P6cdRM4zgLmBUUL7NM34IAeOBXnkFYdsJqBhym2qNt
         CPm+zyT4+rA8ixD5WSTBYz7v9HRmYn/9YXEbZ3iHF8MOq6d3v7gc23lXI7NzjwA3yE8s
         7zzHeBm5RjWHQ1XoTMRGY7/QGARn01Le4BJGqh9/dcQj4kju2T5tuRVN/0uIlTEF4NXx
         UWDK/wLGDSTt5DUepHdJsfmgULZPC9+JxoTvoZBUTY7V0+JnSouJhgH2Qn8WRWbr/a+s
         I57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LyJ1TFoD8DKR6NPPurEInLjBprHxsrJkr+brbjdIpWE=;
        b=w/jJkdCELryL5w5W14T+Bd559leEJxWkaucYDoZ6lms43T9D4VM0/lLO+yzCzWKc/Q
         JqFnbTFji3L+XHN2EpbFMjUJ6H6v7nwV3L2BBVbXEk/Z9ISUEYTU+VkynSCw0pj0F2rt
         gxRcJt/riPMosRUElSatip8/BvlJ4b2tIhpMg1qRTZLVI3xeTqBJBUeLM/pEmnZZth+K
         2+iDoXWwcVKIjoFtvu7H3v5WWYHZ29NZ11JYXU7Mc7/6aS4sIJJ4J8e+rZMT4OV3Y/N1
         zYJRFbhNIpu4luk/loyxWN97Q+GBqnqceTpK689MjZmZCIIFgu/UcrRdhkQG3itLB8dZ
         ycvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KoYka+m3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16-20020ac85a10000000b003b86a606052si13925818qta.383.2023.02.21.18.34.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 18:34:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KoYka+m3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUexL-0007PL-LY; Tue, 21 Feb 2023 21:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUewz-0007DM-Ck
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:45 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUewx-0001Xg-Ro
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:33:45 -0500
Received: by mail-pl1-x62c.google.com with SMTP id ko13so7848259plb.13
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LyJ1TFoD8DKR6NPPurEInLjBprHxsrJkr+brbjdIpWE=;
 b=KoYka+m3MnB3Dh407pkL/LSp1/Yj40RAX6G8yCRm/DMOmXJXvS0Bo+ObKisZUrmQqM
 651KugXF3JOFzOnuXCp52oAU23Vcl5BD6z0tjx9iuOy7blx+igbxbvOu4BlbaGP74lMY
 bV0WYRtkN6Kv27c7sR8eH6/Cr8f4hSvH5aquKMX8j3TvXtUEnQ45zsG7bvk7iFzoXplO
 RIk85Rf3ok1sTkx0iPDnGkwjzW1HCWCnHEoHrkOMFJjbTrmQTyY+6uZw95vHvvaIkdMR
 /CqFPy3kWSWgSzwuClyzHlWj7IQTp7bVRlBXfHS9bIiQ8IIL0bFh1W2zaarEWKQnWTo8
 83TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LyJ1TFoD8DKR6NPPurEInLjBprHxsrJkr+brbjdIpWE=;
 b=oEY5xIVf/lKEgLiJn+CtMgMo2XQpPsRoNJYlDWts/SnQwIQi5XY9an/cU10hYIsqt3
 lGb+ep2U5sdL6IQKRH0KQzD+ZZZdFhn7UEKMj0fvTU4Lw/rhSIS5yYTQSc6T6tV0Rjp2
 g3wkMJSIFfOzUWhflrmYJ0mKS6VM1/lefVdW8RWdNNpTZ3LxZD3Mg38Lkyi3HawFuuxU
 Nvk5ghZu7nsg6C3mDW0bFRvssLjDnX5AoepRsf+W8orGRiI45in88ZErCe8ti+Gwz0ae
 YCG40b8xeeRNId0I8CKIeh7+sxleWP5hr8iYgukMyzX22sS5pBBeR8PCWbdA8Pix5N7S
 Wj2w==
X-Gm-Message-State: AO0yUKXO+t7hG5zZ5ZZHCDoe/bH+r2vo2U7z9YMb1Nt86WQ6acqqcIeN
 AmeEnJQpuL6Qt+n51jcc0OCFC/D8bRfaxzmycv0=
X-Received: by 2002:a17:902:f60e:b0:19a:aaac:f4d1 with SMTP id
 n14-20020a170902f60e00b0019aaaacf4d1mr6007893plg.13.1677033222242; 
 Tue, 21 Feb 2023 18:33:42 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 02/25] target/arm: Stub arm_hcr_el2_eff for m-profile
Date: Tue, 21 Feb 2023 16:33:13 -1000
Message-Id: <20230222023336.915045-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /JpnU1TUJAnI

M-profile doesn't have HCR_EL2.  While we could test features
before each call, zero is a generally safe return value to
disable the code in the caller.  This test is required to
avoid an assert in arm_is_secure_below_el3.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 07d4100365..37d9267fb4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5788,6 +5788,9 @@ uint64_t arm_hcr_el2_eff_secstate(CPUARMState *env, bool secure)
 
 uint64_t arm_hcr_el2_eff(CPUARMState *env)
 {
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        return 0;
+    }
     return arm_hcr_el2_eff_secstate(env, arm_is_secure_below_el3(env));
 }
 
-- 
2.34.1

