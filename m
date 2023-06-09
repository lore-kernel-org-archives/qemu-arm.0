Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp289615ejb;
        Fri, 9 Jun 2023 03:49:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6OchLQMHSuKCOEpBbpa7L8k8YQrAXHh44EAA7GX7JhzhWY9nZRoNkn+LsInGwkfZukX9bR
X-Received: by 2002:a05:6808:1926:b0:39a:9cef:9dd3 with SMTP id bf38-20020a056808192600b0039a9cef9dd3mr1335387oib.27.1686307751628;
        Fri, 09 Jun 2023 03:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686307751; cv=none;
        d=google.com; s=arc-20160816;
        b=fbq43lZke5e+2/dro/GW7BI8FXIUNr9CKM3HYlt0bHP0fXmY7781xPKuB4w+QVhurr
         NSfANPkrgujy/O4+X9dfUP3RTUOgUL8r3PxIO3crET+z6a+WDT5/h87QWK9IbGnDQvi1
         masv+Mjt/6tCSwBrCU/RD9sMx8a6yVnsafsoMwcHQiRGAwNFoPpfJWYV4dx/aAIcs9AH
         mZEqCSOLQ9sD3vwM/1DetdCCEdSVrWw2nqGphLd8othn/VFMXuDocL7qlo0J3w5KOJv0
         6qJKgtpDjR4iUbglVgvRADIejZS3UsJkG8HW5UlEWFKQyzyb78tE5OqoXjGSS2jE599S
         JorA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9TL2KBHzTOjD65QC7kN6aiMgnziSl4jZ9xzNyVd6EGI=;
        b=wnL3KG3stmv1DLg7tvKU8Lw0GjG9tKI6LmVStFWAeNPgdBvtNR0KSWQPFR/QBVflG6
         Z01ZFfBCXAwoyGPXMVUzrS7l+1rMyKjwPCTapYQH+rW7hKWSmKGHoZOqEbXcMyiLvsx0
         WLLNK6pDvDGo8I7byOZIvZxcGHXhbJH9FDkj4v15ewz63w/bsKt3mixl7tGLpXtOIW3A
         9vkml8yYHk1fKDGzGUFaM+55m5kYymHM9RmLvx5INDN1CXeCTeytMcxldMYLRifnY76D
         CjqKGNV3zetclGjhAC8paS3a4PnvhQ3pibBk210uda1VoIsM4QpDJrI/DqvJuw42lkst
         Y2zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qx96Qmr3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11-20020a056214124b00b005eee9ede7e0si1997297qvv.95.2023.06.09.03.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 03:49:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qx96Qmr3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7Zfo-0004bU-Bo; Fri, 09 Jun 2023 06:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Zfm-0004Mt-OE
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:48:50 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7Zfj-0001Xr-Fu
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:48:50 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f62d93f38aso2032563e87.0
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 03:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686307724; x=1688899724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9TL2KBHzTOjD65QC7kN6aiMgnziSl4jZ9xzNyVd6EGI=;
 b=qx96Qmr3Q+/KI8CwTn8fQJHxNhEpgRUHBM3Cvt7Ik7FEokC4sauZcIjbfXq6OQYnVn
 +s+ipUWE9FCL41Rsb3FErpqh8WG0WdlLftVUJlTtONop207mLfIseA4lShimPr0SGHSg
 6zZcPWDBJ1nYgJQ+eXkOAlSolz2XQs/wHusKJMYhP9v0FWMLV53LXZYzZQddUKKQFQWt
 WqEkr2OBd25fcRebqsNJ22cdxSCc8Oj2AHC00w207MKS2y5vt0Ng0yNEapmBZ9WYlM9w
 mMMZi90DEbzOdZnZKgAooZzlS/SrSoAUqekjPJ1vgEGBooCSV5CGc6KrRlLTXG45Eghx
 4xHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686307724; x=1688899724;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9TL2KBHzTOjD65QC7kN6aiMgnziSl4jZ9xzNyVd6EGI=;
 b=F9ZCKZkg+JaTAu/+ogpniLZTmP3mch8xuWRpqMa1hiTsmWYaKOqTr0itHLB5RbLO/u
 4TuK68KOCM8Ujjxr3muUnJJnK3tP8dBekzxCyt80Dh57g3Sh5SWY22fo43cJi5OYYjqB
 U7eIxubyANBpirFmpluYcsN/QUUGbBUXBV/hl/a1bApdpicdyBcvTi5O34qaFobykJu5
 FJcvW/6mo24RgClC7tkt7lZNyu8Ml7EvseILNWAn+MFNWrOM09tBGB2AkhMBL1nwyO2P
 9KAA7b2J7CqYI95VBArkFm6AMw/nAGQb4aO8Gsfw5LrhlrRKY2r42eOeqsXn3pIpaPen
 4dsQ==
X-Gm-Message-State: AC+VfDy/Ipm8dJacdRe2hxoI6Ab8hzSqyNuNcI0miPIEbF0/2rLenWB8
 vvtZRwxShb13LHzkCe0+KP9Etw==
X-Received: by 2002:a05:6512:547:b0:4f4:cacb:4b4b with SMTP id
 h7-20020a056512054700b004f4cacb4b4bmr690691lfl.18.1686307724547; 
 Fri, 09 Jun 2023 03:48:44 -0700 (PDT)
Received: from localhost.localdomain (23.171.88.92.rev.sfr.net. [92.88.171.23])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a7bce99000000b003f17848673fsm2287813wmj.27.2023.06.09.03.48.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Jun 2023 03:48:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/22] target/arm/tcg: Extract NEON definitions to
 'helper-neon.h.inc'
Date: Fri,  9 Jun 2023 12:47:08 +0200
Message-Id: <20230609104717.95555-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230609104717.95555-1-philmd@linaro.org>
References: <20230609104717.95555-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EmP3trgAl+aZ

helper.h is used by all units, but not all require the NEON
definitions. Move them to a new header; the next commit will
remove it from the common helper.h.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h              | 206 +------------------------------
 target/arm/tcg/helper-neon.h.inc | 205 ++++++++++++++++++++++++++++++
 2 files changed, 206 insertions(+), 205 deletions(-)
 create mode 100644 target/arm/tcg/helper-neon.h.inc

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 4d1b7ec6b4..2cf25f0605 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -116,7 +116,6 @@ DEF_HELPER_FLAGS_2(rsqrte_f32, TCG_CALL_NO_RWG, f32, f32, ptr)
 DEF_HELPER_FLAGS_2(rsqrte_f64, TCG_CALL_NO_RWG, f64, f64, ptr)
 DEF_HELPER_FLAGS_1(recpe_u32, TCG_CALL_NO_RWG, i32, i32)
 DEF_HELPER_FLAGS_1(rsqrte_u32, TCG_CALL_NO_RWG, i32, i32)
-DEF_HELPER_FLAGS_4(neon_tbl, TCG_CALL_NO_RWG, i64, env, i32, i64, i64)
 
 DEF_HELPER_3(shl_cc, i32, env, i32, i32)
 DEF_HELPER_3(shr_cc, i32, env, i32, i32)
@@ -135,191 +134,6 @@ DEF_HELPER_FLAGS_2(fjcvtzs, TCG_CALL_NO_RWG, i64, f64, ptr)
 
 DEF_HELPER_FLAGS_3(check_hcr_el2_trap, TCG_CALL_NO_WG, void, env, i32, i32)
 
-/* neon_helper.c */
-DEF_HELPER_FLAGS_3(neon_qadd_u8, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_qadd_s8, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_qadd_u16, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_qadd_s16, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_qadd_u32, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_qadd_s32, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_uqadd_s8, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_uqadd_s16, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_uqadd_s32, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_uqadd_s64, TCG_CALL_NO_RWG, i64, env, i64, i64)
-DEF_HELPER_FLAGS_3(neon_sqadd_u8, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_sqadd_u16, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_sqadd_u32, TCG_CALL_NO_RWG, i32, env, i32, i32)
-DEF_HELPER_FLAGS_3(neon_sqadd_u64, TCG_CALL_NO_RWG, i64, env, i64, i64)
-DEF_HELPER_3(neon_qsub_u8, i32, env, i32, i32)
-DEF_HELPER_3(neon_qsub_s8, i32, env, i32, i32)
-DEF_HELPER_3(neon_qsub_u16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qsub_s16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qsub_u32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qsub_s32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qadd_u64, i64, env, i64, i64)
-DEF_HELPER_3(neon_qadd_s64, i64, env, i64, i64)
-DEF_HELPER_3(neon_qsub_u64, i64, env, i64, i64)
-DEF_HELPER_3(neon_qsub_s64, i64, env, i64, i64)
-
-DEF_HELPER_2(neon_hadd_s8, i32, i32, i32)
-DEF_HELPER_2(neon_hadd_u8, i32, i32, i32)
-DEF_HELPER_2(neon_hadd_s16, i32, i32, i32)
-DEF_HELPER_2(neon_hadd_u16, i32, i32, i32)
-DEF_HELPER_2(neon_hadd_s32, s32, s32, s32)
-DEF_HELPER_2(neon_hadd_u32, i32, i32, i32)
-DEF_HELPER_2(neon_rhadd_s8, i32, i32, i32)
-DEF_HELPER_2(neon_rhadd_u8, i32, i32, i32)
-DEF_HELPER_2(neon_rhadd_s16, i32, i32, i32)
-DEF_HELPER_2(neon_rhadd_u16, i32, i32, i32)
-DEF_HELPER_2(neon_rhadd_s32, s32, s32, s32)
-DEF_HELPER_2(neon_rhadd_u32, i32, i32, i32)
-DEF_HELPER_2(neon_hsub_s8, i32, i32, i32)
-DEF_HELPER_2(neon_hsub_u8, i32, i32, i32)
-DEF_HELPER_2(neon_hsub_s16, i32, i32, i32)
-DEF_HELPER_2(neon_hsub_u16, i32, i32, i32)
-DEF_HELPER_2(neon_hsub_s32, s32, s32, s32)
-DEF_HELPER_2(neon_hsub_u32, i32, i32, i32)
-
-DEF_HELPER_2(neon_pmin_u8, i32, i32, i32)
-DEF_HELPER_2(neon_pmin_s8, i32, i32, i32)
-DEF_HELPER_2(neon_pmin_u16, i32, i32, i32)
-DEF_HELPER_2(neon_pmin_s16, i32, i32, i32)
-DEF_HELPER_2(neon_pmax_u8, i32, i32, i32)
-DEF_HELPER_2(neon_pmax_s8, i32, i32, i32)
-DEF_HELPER_2(neon_pmax_u16, i32, i32, i32)
-DEF_HELPER_2(neon_pmax_s16, i32, i32, i32)
-
-DEF_HELPER_2(neon_shl_u16, i32, i32, i32)
-DEF_HELPER_2(neon_shl_s16, i32, i32, i32)
-DEF_HELPER_2(neon_rshl_u8, i32, i32, i32)
-DEF_HELPER_2(neon_rshl_s8, i32, i32, i32)
-DEF_HELPER_2(neon_rshl_u16, i32, i32, i32)
-DEF_HELPER_2(neon_rshl_s16, i32, i32, i32)
-DEF_HELPER_2(neon_rshl_u32, i32, i32, i32)
-DEF_HELPER_2(neon_rshl_s32, i32, i32, i32)
-DEF_HELPER_2(neon_rshl_u64, i64, i64, i64)
-DEF_HELPER_2(neon_rshl_s64, i64, i64, i64)
-DEF_HELPER_3(neon_qshl_u8, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshl_s8, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshl_u16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshl_s16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshl_u32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshl_s32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshl_u64, i64, env, i64, i64)
-DEF_HELPER_3(neon_qshl_s64, i64, env, i64, i64)
-DEF_HELPER_3(neon_qshlu_s8, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshlu_s16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshlu_s32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qshlu_s64, i64, env, i64, i64)
-DEF_HELPER_3(neon_qrshl_u8, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrshl_s8, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrshl_u16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrshl_s16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrshl_u32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrshl_s32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrshl_u64, i64, env, i64, i64)
-DEF_HELPER_3(neon_qrshl_s64, i64, env, i64, i64)
-
-DEF_HELPER_2(neon_add_u8, i32, i32, i32)
-DEF_HELPER_2(neon_add_u16, i32, i32, i32)
-DEF_HELPER_2(neon_padd_u8, i32, i32, i32)
-DEF_HELPER_2(neon_padd_u16, i32, i32, i32)
-DEF_HELPER_2(neon_sub_u8, i32, i32, i32)
-DEF_HELPER_2(neon_sub_u16, i32, i32, i32)
-DEF_HELPER_2(neon_mul_u8, i32, i32, i32)
-DEF_HELPER_2(neon_mul_u16, i32, i32, i32)
-
-DEF_HELPER_2(neon_tst_u8, i32, i32, i32)
-DEF_HELPER_2(neon_tst_u16, i32, i32, i32)
-DEF_HELPER_2(neon_tst_u32, i32, i32, i32)
-
-DEF_HELPER_1(neon_clz_u8, i32, i32)
-DEF_HELPER_1(neon_clz_u16, i32, i32)
-DEF_HELPER_1(neon_cls_s8, i32, i32)
-DEF_HELPER_1(neon_cls_s16, i32, i32)
-DEF_HELPER_1(neon_cls_s32, i32, i32)
-DEF_HELPER_1(neon_cnt_u8, i32, i32)
-DEF_HELPER_FLAGS_1(neon_rbit_u8, TCG_CALL_NO_RWG_SE, i32, i32)
-
-DEF_HELPER_3(neon_qdmulh_s16, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrdmulh_s16, i32, env, i32, i32)
-DEF_HELPER_4(neon_qrdmlah_s16, i32, env, i32, i32, i32)
-DEF_HELPER_4(neon_qrdmlsh_s16, i32, env, i32, i32, i32)
-DEF_HELPER_3(neon_qdmulh_s32, i32, env, i32, i32)
-DEF_HELPER_3(neon_qrdmulh_s32, i32, env, i32, i32)
-DEF_HELPER_4(neon_qrdmlah_s32, i32, env, s32, s32, s32)
-DEF_HELPER_4(neon_qrdmlsh_s32, i32, env, s32, s32, s32)
-
-DEF_HELPER_1(neon_narrow_u8, i32, i64)
-DEF_HELPER_1(neon_narrow_u16, i32, i64)
-DEF_HELPER_2(neon_unarrow_sat8, i32, env, i64)
-DEF_HELPER_2(neon_narrow_sat_u8, i32, env, i64)
-DEF_HELPER_2(neon_narrow_sat_s8, i32, env, i64)
-DEF_HELPER_2(neon_unarrow_sat16, i32, env, i64)
-DEF_HELPER_2(neon_narrow_sat_u16, i32, env, i64)
-DEF_HELPER_2(neon_narrow_sat_s16, i32, env, i64)
-DEF_HELPER_2(neon_unarrow_sat32, i32, env, i64)
-DEF_HELPER_2(neon_narrow_sat_u32, i32, env, i64)
-DEF_HELPER_2(neon_narrow_sat_s32, i32, env, i64)
-DEF_HELPER_1(neon_narrow_high_u8, i32, i64)
-DEF_HELPER_1(neon_narrow_high_u16, i32, i64)
-DEF_HELPER_1(neon_narrow_round_high_u8, i32, i64)
-DEF_HELPER_1(neon_narrow_round_high_u16, i32, i64)
-DEF_HELPER_1(neon_widen_u8, i64, i32)
-DEF_HELPER_1(neon_widen_s8, i64, i32)
-DEF_HELPER_1(neon_widen_u16, i64, i32)
-DEF_HELPER_1(neon_widen_s16, i64, i32)
-
-DEF_HELPER_2(neon_addl_u16, i64, i64, i64)
-DEF_HELPER_2(neon_addl_u32, i64, i64, i64)
-DEF_HELPER_2(neon_paddl_u16, i64, i64, i64)
-DEF_HELPER_2(neon_paddl_u32, i64, i64, i64)
-DEF_HELPER_2(neon_subl_u16, i64, i64, i64)
-DEF_HELPER_2(neon_subl_u32, i64, i64, i64)
-DEF_HELPER_3(neon_addl_saturate_s32, i64, env, i64, i64)
-DEF_HELPER_3(neon_addl_saturate_s64, i64, env, i64, i64)
-DEF_HELPER_2(neon_abdl_u16, i64, i32, i32)
-DEF_HELPER_2(neon_abdl_s16, i64, i32, i32)
-DEF_HELPER_2(neon_abdl_u32, i64, i32, i32)
-DEF_HELPER_2(neon_abdl_s32, i64, i32, i32)
-DEF_HELPER_2(neon_abdl_u64, i64, i32, i32)
-DEF_HELPER_2(neon_abdl_s64, i64, i32, i32)
-DEF_HELPER_2(neon_mull_u8, i64, i32, i32)
-DEF_HELPER_2(neon_mull_s8, i64, i32, i32)
-DEF_HELPER_2(neon_mull_u16, i64, i32, i32)
-DEF_HELPER_2(neon_mull_s16, i64, i32, i32)
-
-DEF_HELPER_1(neon_negl_u16, i64, i64)
-DEF_HELPER_1(neon_negl_u32, i64, i64)
-
-DEF_HELPER_FLAGS_2(neon_qabs_s8, TCG_CALL_NO_RWG, i32, env, i32)
-DEF_HELPER_FLAGS_2(neon_qabs_s16, TCG_CALL_NO_RWG, i32, env, i32)
-DEF_HELPER_FLAGS_2(neon_qabs_s32, TCG_CALL_NO_RWG, i32, env, i32)
-DEF_HELPER_FLAGS_2(neon_qabs_s64, TCG_CALL_NO_RWG, i64, env, i64)
-DEF_HELPER_FLAGS_2(neon_qneg_s8, TCG_CALL_NO_RWG, i32, env, i32)
-DEF_HELPER_FLAGS_2(neon_qneg_s16, TCG_CALL_NO_RWG, i32, env, i32)
-DEF_HELPER_FLAGS_2(neon_qneg_s32, TCG_CALL_NO_RWG, i32, env, i32)
-DEF_HELPER_FLAGS_2(neon_qneg_s64, TCG_CALL_NO_RWG, i64, env, i64)
-
-DEF_HELPER_3(neon_ceq_f32, i32, i32, i32, ptr)
-DEF_HELPER_3(neon_cge_f32, i32, i32, i32, ptr)
-DEF_HELPER_3(neon_cgt_f32, i32, i32, i32, ptr)
-DEF_HELPER_3(neon_acge_f32, i32, i32, i32, ptr)
-DEF_HELPER_3(neon_acgt_f32, i32, i32, i32, ptr)
-DEF_HELPER_3(neon_acge_f64, i64, i64, i64, ptr)
-DEF_HELPER_3(neon_acgt_f64, i64, i64, i64, ptr)
-
-DEF_HELPER_FLAGS_2(neon_unzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_unzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_qunzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_qunzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_qunzip32, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_zip8, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_zip16, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_qzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_qzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
-DEF_HELPER_FLAGS_2(neon_qzip32, TCG_CALL_NO_RWG, void, ptr, ptr)
-
 DEF_HELPER_FLAGS_4(crypto_aese, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(crypto_aesmc, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
@@ -421,13 +235,6 @@ DEF_HELPER_FLAGS_6(gvec_fcmlas_idx, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(gvec_fcmlad, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_5(neon_paddh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(neon_pmaxh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(neon_pminh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(neon_padds, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(neon_pmaxs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(neon_pmins, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
-
 DEF_HELPER_FLAGS_4(gvec_sstoh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_sitos, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_ustoh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
@@ -648,8 +455,6 @@ DEF_HELPER_FLAGS_4(gvec_ushl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_pmul_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_pmull_q, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_4(neon_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
-
 DEF_HELPER_FLAGS_3(gvec_ssra_b, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_ssra_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(gvec_ssra_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
@@ -728,16 +533,6 @@ DEF_HELPER_FLAGS_5(gvec_mls_idx_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_mls_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_5(neon_sqdmulh_h, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(neon_sqdmulh_s, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, ptr, i32)
-
-DEF_HELPER_FLAGS_5(neon_sqrdmulh_h, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, ptr, i32)
-DEF_HELPER_FLAGS_5(neon_sqrdmulh_s, TCG_CALL_NO_RWG,
-                   void, ptr, ptr, ptr, ptr, i32)
-
 DEF_HELPER_FLAGS_4(sve2_sqdmulh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqdmulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqdmulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
@@ -813,4 +608,5 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
 #include "tcg/helper-sme.h.inc"
 #endif
 
+#include "tcg/helper-neon.h.inc"
 #include "tcg/helper-mve.h.inc"
diff --git a/target/arm/tcg/helper-neon.h.inc b/target/arm/tcg/helper-neon.h.inc
new file mode 100644
index 0000000000..82d509f929
--- /dev/null
+++ b/target/arm/tcg/helper-neon.h.inc
@@ -0,0 +1,205 @@
+DEF_HELPER_FLAGS_4(neon_tbl, TCG_CALL_NO_RWG, i64, env, i32, i64, i64)
+
+/* neon_helper.c */
+DEF_HELPER_FLAGS_3(neon_qadd_u8, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_qadd_s8, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_qadd_u16, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_qadd_s16, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_qadd_u32, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_qadd_s32, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_uqadd_s8, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_uqadd_s16, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_uqadd_s32, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_uqadd_s64, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_FLAGS_3(neon_sqadd_u8, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_sqadd_u16, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_sqadd_u32, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(neon_sqadd_u64, TCG_CALL_NO_RWG, i64, env, i64, i64)
+DEF_HELPER_3(neon_qsub_u8, i32, env, i32, i32)
+DEF_HELPER_3(neon_qsub_s8, i32, env, i32, i32)
+DEF_HELPER_3(neon_qsub_u16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qsub_s16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qsub_u32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qsub_s32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qadd_u64, i64, env, i64, i64)
+DEF_HELPER_3(neon_qadd_s64, i64, env, i64, i64)
+DEF_HELPER_3(neon_qsub_u64, i64, env, i64, i64)
+DEF_HELPER_3(neon_qsub_s64, i64, env, i64, i64)
+
+DEF_HELPER_2(neon_hadd_s8, i32, i32, i32)
+DEF_HELPER_2(neon_hadd_u8, i32, i32, i32)
+DEF_HELPER_2(neon_hadd_s16, i32, i32, i32)
+DEF_HELPER_2(neon_hadd_u16, i32, i32, i32)
+DEF_HELPER_2(neon_hadd_s32, s32, s32, s32)
+DEF_HELPER_2(neon_hadd_u32, i32, i32, i32)
+DEF_HELPER_2(neon_rhadd_s8, i32, i32, i32)
+DEF_HELPER_2(neon_rhadd_u8, i32, i32, i32)
+DEF_HELPER_2(neon_rhadd_s16, i32, i32, i32)
+DEF_HELPER_2(neon_rhadd_u16, i32, i32, i32)
+DEF_HELPER_2(neon_rhadd_s32, s32, s32, s32)
+DEF_HELPER_2(neon_rhadd_u32, i32, i32, i32)
+DEF_HELPER_2(neon_hsub_s8, i32, i32, i32)
+DEF_HELPER_2(neon_hsub_u8, i32, i32, i32)
+DEF_HELPER_2(neon_hsub_s16, i32, i32, i32)
+DEF_HELPER_2(neon_hsub_u16, i32, i32, i32)
+DEF_HELPER_2(neon_hsub_s32, s32, s32, s32)
+DEF_HELPER_2(neon_hsub_u32, i32, i32, i32)
+
+DEF_HELPER_2(neon_pmin_u8, i32, i32, i32)
+DEF_HELPER_2(neon_pmin_s8, i32, i32, i32)
+DEF_HELPER_2(neon_pmin_u16, i32, i32, i32)
+DEF_HELPER_2(neon_pmin_s16, i32, i32, i32)
+DEF_HELPER_2(neon_pmax_u8, i32, i32, i32)
+DEF_HELPER_2(neon_pmax_s8, i32, i32, i32)
+DEF_HELPER_2(neon_pmax_u16, i32, i32, i32)
+DEF_HELPER_2(neon_pmax_s16, i32, i32, i32)
+
+DEF_HELPER_2(neon_shl_u16, i32, i32, i32)
+DEF_HELPER_2(neon_shl_s16, i32, i32, i32)
+DEF_HELPER_2(neon_rshl_u8, i32, i32, i32)
+DEF_HELPER_2(neon_rshl_s8, i32, i32, i32)
+DEF_HELPER_2(neon_rshl_u16, i32, i32, i32)
+DEF_HELPER_2(neon_rshl_s16, i32, i32, i32)
+DEF_HELPER_2(neon_rshl_u32, i32, i32, i32)
+DEF_HELPER_2(neon_rshl_s32, i32, i32, i32)
+DEF_HELPER_2(neon_rshl_u64, i64, i64, i64)
+DEF_HELPER_2(neon_rshl_s64, i64, i64, i64)
+DEF_HELPER_3(neon_qshl_u8, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshl_s8, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshl_u16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshl_s16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshl_u32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshl_s32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshl_u64, i64, env, i64, i64)
+DEF_HELPER_3(neon_qshl_s64, i64, env, i64, i64)
+DEF_HELPER_3(neon_qshlu_s8, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshlu_s16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshlu_s32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qshlu_s64, i64, env, i64, i64)
+DEF_HELPER_3(neon_qrshl_u8, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrshl_s8, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrshl_u16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrshl_s16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrshl_u32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrshl_s32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrshl_u64, i64, env, i64, i64)
+DEF_HELPER_3(neon_qrshl_s64, i64, env, i64, i64)
+
+DEF_HELPER_2(neon_add_u8, i32, i32, i32)
+DEF_HELPER_2(neon_add_u16, i32, i32, i32)
+DEF_HELPER_2(neon_padd_u8, i32, i32, i32)
+DEF_HELPER_2(neon_padd_u16, i32, i32, i32)
+DEF_HELPER_2(neon_sub_u8, i32, i32, i32)
+DEF_HELPER_2(neon_sub_u16, i32, i32, i32)
+DEF_HELPER_2(neon_mul_u8, i32, i32, i32)
+DEF_HELPER_2(neon_mul_u16, i32, i32, i32)
+
+DEF_HELPER_2(neon_tst_u8, i32, i32, i32)
+DEF_HELPER_2(neon_tst_u16, i32, i32, i32)
+DEF_HELPER_2(neon_tst_u32, i32, i32, i32)
+
+DEF_HELPER_1(neon_clz_u8, i32, i32)
+DEF_HELPER_1(neon_clz_u16, i32, i32)
+DEF_HELPER_1(neon_cls_s8, i32, i32)
+DEF_HELPER_1(neon_cls_s16, i32, i32)
+DEF_HELPER_1(neon_cls_s32, i32, i32)
+DEF_HELPER_1(neon_cnt_u8, i32, i32)
+DEF_HELPER_FLAGS_1(neon_rbit_u8, TCG_CALL_NO_RWG_SE, i32, i32)
+
+DEF_HELPER_3(neon_qdmulh_s16, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrdmulh_s16, i32, env, i32, i32)
+DEF_HELPER_4(neon_qrdmlah_s16, i32, env, i32, i32, i32)
+DEF_HELPER_4(neon_qrdmlsh_s16, i32, env, i32, i32, i32)
+DEF_HELPER_3(neon_qdmulh_s32, i32, env, i32, i32)
+DEF_HELPER_3(neon_qrdmulh_s32, i32, env, i32, i32)
+DEF_HELPER_4(neon_qrdmlah_s32, i32, env, s32, s32, s32)
+DEF_HELPER_4(neon_qrdmlsh_s32, i32, env, s32, s32, s32)
+
+DEF_HELPER_1(neon_narrow_u8, i32, i64)
+DEF_HELPER_1(neon_narrow_u16, i32, i64)
+DEF_HELPER_2(neon_unarrow_sat8, i32, env, i64)
+DEF_HELPER_2(neon_narrow_sat_u8, i32, env, i64)
+DEF_HELPER_2(neon_narrow_sat_s8, i32, env, i64)
+DEF_HELPER_2(neon_unarrow_sat16, i32, env, i64)
+DEF_HELPER_2(neon_narrow_sat_u16, i32, env, i64)
+DEF_HELPER_2(neon_narrow_sat_s16, i32, env, i64)
+DEF_HELPER_2(neon_unarrow_sat32, i32, env, i64)
+DEF_HELPER_2(neon_narrow_sat_u32, i32, env, i64)
+DEF_HELPER_2(neon_narrow_sat_s32, i32, env, i64)
+DEF_HELPER_1(neon_narrow_high_u8, i32, i64)
+DEF_HELPER_1(neon_narrow_high_u16, i32, i64)
+DEF_HELPER_1(neon_narrow_round_high_u8, i32, i64)
+DEF_HELPER_1(neon_narrow_round_high_u16, i32, i64)
+DEF_HELPER_1(neon_widen_u8, i64, i32)
+DEF_HELPER_1(neon_widen_s8, i64, i32)
+DEF_HELPER_1(neon_widen_u16, i64, i32)
+DEF_HELPER_1(neon_widen_s16, i64, i32)
+
+DEF_HELPER_2(neon_addl_u16, i64, i64, i64)
+DEF_HELPER_2(neon_addl_u32, i64, i64, i64)
+DEF_HELPER_2(neon_paddl_u16, i64, i64, i64)
+DEF_HELPER_2(neon_paddl_u32, i64, i64, i64)
+DEF_HELPER_2(neon_subl_u16, i64, i64, i64)
+DEF_HELPER_2(neon_subl_u32, i64, i64, i64)
+DEF_HELPER_3(neon_addl_saturate_s32, i64, env, i64, i64)
+DEF_HELPER_3(neon_addl_saturate_s64, i64, env, i64, i64)
+DEF_HELPER_2(neon_abdl_u16, i64, i32, i32)
+DEF_HELPER_2(neon_abdl_s16, i64, i32, i32)
+DEF_HELPER_2(neon_abdl_u32, i64, i32, i32)
+DEF_HELPER_2(neon_abdl_s32, i64, i32, i32)
+DEF_HELPER_2(neon_abdl_u64, i64, i32, i32)
+DEF_HELPER_2(neon_abdl_s64, i64, i32, i32)
+DEF_HELPER_2(neon_mull_u8, i64, i32, i32)
+DEF_HELPER_2(neon_mull_s8, i64, i32, i32)
+DEF_HELPER_2(neon_mull_u16, i64, i32, i32)
+DEF_HELPER_2(neon_mull_s16, i64, i32, i32)
+
+DEF_HELPER_1(neon_negl_u16, i64, i64)
+DEF_HELPER_1(neon_negl_u32, i64, i64)
+
+DEF_HELPER_FLAGS_2(neon_qabs_s8, TCG_CALL_NO_RWG, i32, env, i32)
+DEF_HELPER_FLAGS_2(neon_qabs_s16, TCG_CALL_NO_RWG, i32, env, i32)
+DEF_HELPER_FLAGS_2(neon_qabs_s32, TCG_CALL_NO_RWG, i32, env, i32)
+DEF_HELPER_FLAGS_2(neon_qabs_s64, TCG_CALL_NO_RWG, i64, env, i64)
+DEF_HELPER_FLAGS_2(neon_qneg_s8, TCG_CALL_NO_RWG, i32, env, i32)
+DEF_HELPER_FLAGS_2(neon_qneg_s16, TCG_CALL_NO_RWG, i32, env, i32)
+DEF_HELPER_FLAGS_2(neon_qneg_s32, TCG_CALL_NO_RWG, i32, env, i32)
+DEF_HELPER_FLAGS_2(neon_qneg_s64, TCG_CALL_NO_RWG, i64, env, i64)
+
+DEF_HELPER_3(neon_ceq_f32, i32, i32, i32, ptr)
+DEF_HELPER_3(neon_cge_f32, i32, i32, i32, ptr)
+DEF_HELPER_3(neon_cgt_f32, i32, i32, i32, ptr)
+DEF_HELPER_3(neon_acge_f32, i32, i32, i32, ptr)
+DEF_HELPER_3(neon_acgt_f32, i32, i32, i32, ptr)
+DEF_HELPER_3(neon_acge_f64, i64, i64, i64, ptr)
+DEF_HELPER_3(neon_acgt_f64, i64, i64, i64, ptr)
+
+DEF_HELPER_FLAGS_2(neon_unzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_unzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qunzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qunzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qunzip32, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_zip8, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_zip16, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qzip8, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qzip16, TCG_CALL_NO_RWG, void, ptr, ptr)
+DEF_HELPER_FLAGS_2(neon_qzip32, TCG_CALL_NO_RWG, void, ptr, ptr)
+
+DEF_HELPER_FLAGS_5(neon_paddh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_pmaxh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_pminh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_padds, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_pmaxs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_pmins, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(neon_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(neon_sqdmulh_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqdmulh_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(neon_sqrdmulh_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(neon_sqrdmulh_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
-- 
2.38.1

