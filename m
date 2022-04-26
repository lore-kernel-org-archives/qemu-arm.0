Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp366172lfu;
        Tue, 26 Apr 2022 09:47:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcfDs+2aDowd0h9/CEn1llWcn8JCVT3SFv9xAra/cFrwpT4pywRZMlGjcb3P1mCSabviY4
X-Received: by 2002:a25:76c6:0:b0:648:5616:ca50 with SMTP id r189-20020a2576c6000000b006485616ca50mr11770130ybc.423.1650991621871;
        Tue, 26 Apr 2022 09:47:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991621; cv=none;
        d=google.com; s=arc-20160816;
        b=xCcqHI5XFkeVzpdrVnVv6gmiaOW9TcokJ3nibGHXDrDd8FpSqOsjEXHL0LSRUDFN/F
         D5UwyEOto2vt5EsC2uJK8bAKVNVRd/zG5LUDYbLbGfYsd5GPCD54wjlbxTgtzaVbpeez
         549xjZAiSQDgxGmJ38oP65UQJbOCvyyXIqVRwb5zDGmg1Trcj+vn80c1fiHmKb54+W0D
         VAscK2UjM8sjgj5Yl5shWxFd91r4WG0aHQmxmK0tCleY61+DmfZImKRROyS6nvX1/JCJ
         T8nZzODHtznFcOlOJpq/XfDNyiHUgRSytCP4zAp2ZV8jsC+jZ9NkQkc3bCmjFkTidjMa
         S+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=V1l7h7RzBXJQhj58kOo+BDunsheVJJvh/PuzYMuyeHU=;
        b=DYwnxRFE7Rxu5SPU5cU71lCRr4xaprgBL6Lxi0rov1zEcPovaeUs8onseGSqCPIRJ2
         JklqzIUnrYgqusTgmUq+o0JvN6yX0SOOx+6lTA8RMpu8vm4FoZS/N6ZemgrTI9Ir8iln
         OJZEgs8mTpVG62YQS04eT0cj5v3mRLeX7xKNNrJbUuiniEdDTI8U3ydS+2NzqxgqVHaf
         U8tqBZ5+2DL7I3HeQO8dIkNCLw6LPBZaiwl5/qSgvdaLqwlt0XigNBJxBHLMoo/jo3Mj
         vOFq3mq4AjGkDRiV+DB9mll+lyzxwbPf6huYWXRYN+Z1Rk+RMxyYt67oT3HRC0q0qMxG
         gC/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qq+STMc5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8-20020a256508000000b006483e42a56esi8140606ybb.658.2022.04.26.09.47.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:47:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qq+STMc5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOL6-0003uS-VC
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5n-00031c-3n
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:14 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:43809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5i-0003rM-UE
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:09 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso3005018pjj.2
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V1l7h7RzBXJQhj58kOo+BDunsheVJJvh/PuzYMuyeHU=;
 b=Qq+STMc5JCUKJIv5a2aYxYofetwrwWpI7t37aKvAbF6yXYE0wafF4bICdF40To3yga
 OXJbZ9isPOCPPZ8HQqdfCmlQXYALd9SuibbZKE0l4E+Dq8/KWjyWl5QADpG93vXMwDhn
 XqV0t+dOL6keizDBbMUbGdzFJgvP3jIJcGECbaAk4icU05JrXi3V+PA5/eZ+WilHOm68
 KRc4U2gwTFFRIcKcbnh0qJ/11YjpSa1COep6kPQlJO+TtWFGL9CpzWV21z2utohW3iJH
 MKlwmBr79El7lbUgpxA27IKye6jIcEPn1RJatpfekNtzyoTU0UiqYScYWBKib/d8PHEM
 qbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V1l7h7RzBXJQhj58kOo+BDunsheVJJvh/PuzYMuyeHU=;
 b=pTMy6nHMXwqfWmMu2fMMU5PrGyVPb6xuebwnSEzMPZdp7XYnTNX4V1e3fG2QDWus44
 8mylnCN/xAMReIRIzFysxIhqBoT0gjbWznESx1A/trq9K+96i2ACdxtY3keNWkfvys3d
 ba0bPT4iTCQlcWs1aq/fKyMrvSet1YrCRGk1JhsesXzfGG/iyDtatHJ3jUaRGuhAj/3e
 SL2C5WcfL5E8Kghehjv6fnbvOVCWWHQf8PznOP5AINbC4e2m748BjH9PQfUHzniBcQbh
 xXGDflLuSyTOHedmj1saylcXIgBgok1nc0dJ/TM0enkyH7o1gJkk8KCRqFiLQNBSo0aI
 Xoog==
X-Gm-Message-State: AOAM532sBymWxfu85UVQZ6mbCGUHmCDJv0cYHd7aRk1VpeukrLxr8d+Y
 d5d1XRhMTHhuO4HAs6AyT8x+379t6c2Pdg==
X-Received: by 2002:a17:902:8497:b0:154:9282:bc01 with SMTP id
 c23-20020a170902849700b001549282bc01mr24670200plo.33.1650990665419; 
 Tue, 26 Apr 2022 09:31:05 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/47] target/arm: Use tcg_constant in balance of
 translate-a64.c
Date: Tue, 26 Apr 2022 09:30:17 -0700
Message-Id: <20220426163043.100432-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YmiHy4nLLhqC

Finish conversion of the file to tcg_constant_*.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 35dc21da8f..1163ba12a4 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13893,7 +13893,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         }
 
         if (is_scalar) {
-            tcg_res[1] = tcg_const_i64(0);
+            tcg_res[1] = tcg_constant_i64(0);
         }
 
         for (pass = 0; pass < 2; pass++) {
@@ -14297,7 +14297,7 @@ static void disas_crypto_four_reg(DisasContext *s, uint32_t insn)
         tcg_op2 = tcg_temp_new_i32();
         tcg_op3 = tcg_temp_new_i32();
         tcg_res = tcg_temp_new_i32();
-        tcg_zero = tcg_const_i32(0);
+        tcg_zero = tcg_constant_i32(0);
 
         read_vec_element_i32(s, tcg_op1, rn, 3, MO_32);
         read_vec_element_i32(s, tcg_op2, rm, 3, MO_32);
@@ -14317,7 +14317,6 @@ static void disas_crypto_four_reg(DisasContext *s, uint32_t insn)
         tcg_temp_free_i32(tcg_op2);
         tcg_temp_free_i32(tcg_op3);
         tcg_temp_free_i32(tcg_res);
-        tcg_temp_free_i32(tcg_zero);
     }
 }
 
@@ -14825,22 +14824,19 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_helper_yield(cpu_env);
             break;
         case DISAS_WFI:
-        {
-            /* This is a special case because we don't want to just halt the CPU
-             * if trying to debug across a WFI.
+            /*
+             * This is a special case because we don't want to just halt
+             * the CPU if trying to debug across a WFI.
              */
-            TCGv_i32 tmp = tcg_const_i32(4);
-
             gen_a64_set_pc_im(dc->base.pc_next);
-            gen_helper_wfi(cpu_env, tmp);
-            tcg_temp_free_i32(tmp);
-            /* The helper doesn't necessarily throw an exception, but we
+            gen_helper_wfi(cpu_env, tcg_constant_i32(4));
+            /*
+             * The helper doesn't necessarily throw an exception, but we
              * must go back to the main loop to check for interrupts anyway.
              */
             tcg_gen_exit_tb(NULL, 0);
             break;
         }
-        }
     }
 }
 
-- 
2.34.1

