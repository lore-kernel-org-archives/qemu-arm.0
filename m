Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1054698ejc;
        Mon, 22 Aug 2022 10:58:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4PCEv9nknZoFgb1L+/hQ/TUM8uu65+waJKtW+desR2S4A1heqtD5ziJqxtaZoF1tJSbBZm
X-Received: by 2002:ad4:5f08:0:b0:476:bf01:ffd8 with SMTP id fo8-20020ad45f08000000b00476bf01ffd8mr16314736qvb.14.1661191093280;
        Mon, 22 Aug 2022 10:58:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661191093; cv=none;
        d=google.com; s=arc-20160816;
        b=0MqRX0W12LaUinlIvA8nIbmakIyDGhMGifr5TY7vaRCMoV8o6uhnb641AuvkVtfxH+
         tDF8DVHC/z50ZSGt8f286VJ1psNj2Zc9BIeka7/z1N3kiKp3ZX11w/PdD3ObmiadDr81
         ATr8+p/2+wOpg6X4hoAAjbS1tVt45qIlpOpT1x1Ht6LBYbflBbxNJfABgX4S5kH0DgkW
         doXLNJHqrifaI3sqrfATyUdfhqipPYQnIwW6OVVtQILCZrATeXsroxD80zRroyngrz5E
         u7EQzOIa0ZHiz8BeodwOAjsAXPFhD6X1+b4K1U7BshhUGrJDBxZcX9AWDt5iP0r7rfWt
         8ftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FF+VbrmmZnxZ1wObhTbkrmTqMO4Rm6Z3tRZAxl2tAjA=;
        b=NkOd+pna5U94t1ynh9rFdu8UoE8Sff6L83NCTlww75kUfJTLgkB+RNMTMKpFNGGk0o
         RrK1i7wzPg6Gv4nRr1kobpOldeYMaT07URYYycVOLgbmxP9w3GuqlB+wchVC904ayQ+m
         3eg0tp81HlXzAG2Ufnf6ozxinTPInlF2yFOe2/f2jBhG3OF0RZChshhS2rE8/p9+u46y
         MISrIY5IiYeIMl/JHKXeQOQFWeryyvHl01Z7aKAcSB2LtktOaTTa4TDjZvQlaqGadal/
         U+A/ezjUSwagvHVjCDpWOzH1vxq1Or+0dteWgVGG7s5xC+orRqaJgLzssqFOR7Y1L+5U
         8HAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cmHx8rF2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c21-20020ac81e95000000b003446793187esi4935037qtm.520.2022.08.22.10.58.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 10:58:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cmHx8rF2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQBgi-0003Qy-On
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 13:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ox-0004kn-RY
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:47 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Om-0001fG-61
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:37 -0400
Received: by mail-pf1-x435.google.com with SMTP id f17so4527688pfk.11
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=FF+VbrmmZnxZ1wObhTbkrmTqMO4Rm6Z3tRZAxl2tAjA=;
 b=cmHx8rF2008OR9gqQz/utMFSfT8tvZ+l6m2k/U3Vban8t/aaqHkJUvdPCJEGCGA2Cr
 7P8k/kkfjMlsFSbH3Y1/z3MLMalfLC1ebgAdrbsiFuGRP1DWk+ZiCON44lymu52rxVaN
 w4TgtQdD4Mz5zo84i9vTzRbeL1TVWGuNYZfJMMCipJZcyo7dp8OoIKzp8hkQxDjfEahP
 UwsSn5rd2lGQDG9GW5yyt7pt1ZRIp+iSNZDWAuyM/GugDgVBu0U7HSG7UV28/xpj86uJ
 RS87nD6cbHCRrBw5tbg/pz0YxTrRNazPaHMuhy0NyEVq75cg0R0UJU3gdrqOalg+bpev
 rt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FF+VbrmmZnxZ1wObhTbkrmTqMO4Rm6Z3tRZAxl2tAjA=;
 b=BrIW9cOmPSxhXFMvDPLP5wzVD0fLqZ872pHPmrPzGCaGGR5Wnb/1XFfvf4w0KRPHr9
 dYrOe7vg1Ry/svGtIiKMVQ5B/klXcFhnoP8bRPU7PPLRBEDXxxcMUsHHJOIAQjYVw+TB
 Z4XQDSra5x3gkyQkvewZ65SVP4H5/cLRADL/cByUz9FMr7mZfcc50eH6S7NhokCKp6gK
 XzFJZ6YL1NLGQEZSQQBAJGyiUNc280lsXYn618Qpi8S2HVtLpXkvb8XMTgdWjWOGq4nR
 Di4lFT3JFBa7gohxFgfIQivoLQY5nMtsrd1c/we69QBhgMvRxRW78wFKIoo4X3bNM3P8
 Z1uw==
X-Gm-Message-State: ACgBeo3YULhNQwk3XQvROFMClAhtd4q82V0EOmpshQrC4r1NrFnq3Ogj
 o3F7QHKrbFU6YJoTsC2FjJ8Xzw==
X-Received: by 2002:a05:6a00:804:b0:52f:43f9:b634 with SMTP id
 m4-20020a056a00080400b0052f43f9b634mr21450290pfk.62.1661182290529; 
 Mon, 22 Aug 2022 08:31:30 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 54/66] target/arm: Only use ARMMMUIdx_Stage1* for two-stage
 translation
Date: Mon, 22 Aug 2022 08:27:29 -0700
Message-Id: <20220822152741.1617527-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: jqoUQxx8UWxx

If stage2 is disabled, we do not need to adjust mmu_idx.
Below, we'll use get_phys_addr_lpae and not recurse.
Adjust regime_is_user so that it can be used for E10_0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 46f5178692..9366066ae0 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -90,6 +90,7 @@ static bool regime_translation_big_endian(CPUARMState *env, ARMMMUIdx mmu_idx)
 static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
+    case ARMMMUIdx_E10_0:
     case ARMMMUIdx_E20_0:
     case ARMMMUIdx_Stage1_E0:
     case ARMMMUIdx_MUser:
@@ -99,10 +100,6 @@ static bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
         return true;
     default:
         return false;
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-        g_assert_not_reached();
     }
 }
 
@@ -2534,10 +2531,6 @@ bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
                                           s1_mmu_idx, is_secure,
                                           result, fi);
         }
-        /*
-         * For non-EL2 CPUs a stage1+stage2 translation is just stage 1.
-         */
-        mmu_idx = s1_mmu_idx;
     }
 
     /*
-- 
2.34.1

