Received: by 2002:a17:906:e18:b0:a38:6d10:c5dd with SMTP id l24csp126875eji;
        Tue, 6 Feb 2024 18:53:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBNZ9U87IqR8Ol9RPgfMN4qr/iAmfdK1s0b8IM+ZYs1JdxHKGiCj36MPNFc/gvBKWf4KnD
X-Received: by 2002:a05:622a:6dcb:b0:42a:55c9:6792 with SMTP id ir11-20020a05622a6dcb00b0042a55c96792mr3274315qtb.37.1707274414507;
        Tue, 06 Feb 2024 18:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707274414; cv=none;
        d=google.com; s=arc-20160816;
        b=MsNHUaznyzXjePjCbExFTAtQoJBJF3TpbMBl1MIuWkbW1h7MLjFnihWGmydSh0izbI
         j/Uubp/nGI73CruRxGPSIKwGGL42OONuEd1eqv9mTlSUYGi4+GtnjYphMCCL9dkcwEHp
         IPDjgm2cEq/RlYUs6YQDkHqboxrPVCrxfP7Jsnr4YBTnv8m8W6Uvte7kvDVGLMprRmHB
         rwUE6gwF82eKkVH6ufOqddEqiOETxqR/Ix9VlakUa9qVnv7GV18v3PcQTr3NQVTcDhLw
         7VgNV2GwzL+M77n6zxAbqpuwfWUnN1oBD3uQqqode8JLydlcWdpW6VoGgj2uEUKf2ShT
         EF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8/3IB+SoDAzkmHVKlFR4bQnh/JTWAMai5rQK+rwyNyA=;
        fh=vOWE12KUjLHOxzO1Y6zFKnuSlfwGT7fiyPnpZsBlSOQ=;
        b=g5Crlu9lasi5VpXd5TA2gcwW1XfcMK7kYHH4g456pqcQeRz9wL1Voh7WAWOV7pv7ZW
         ScPV+0DHJTEDpCcUyYyoYxZfgyy12yPgS7oL7keOEQulOybpCKXBkpcnwi2xBTUtyfnR
         XcIOyZm6Tvyim8hKL+IfqFONVLuwBQVMUAooJfLl58mpM/otmXPd3Jtuni7cesG79CNa
         1KwAWWtcnUSe38F876uVJxKQsMlf9BUTleuY1sPLf/+DS0gJfEkiajd1JwJBbLMXifm+
         rMKQfg+eLjlLFz/OJklxrqImPwOQ06B8Bpcmiq4/IrzVE1ZFKmdIUnuCnWP0LvYFpOOz
         Tv6A==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DoKQseyc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCUpqLRY9H9BZ3RcULr8m/kk/ZnVurDLeiNvfYVWLVhL8ta1Wn7enZOf7h+ZaQuYxGt79mmt1t+l+f3IGm/NKjZSW678y8HS
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15-20020a05622a130f00b0042beeb18f6asi296347qtk.212.2024.02.06.18.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 18:53:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DoKQseyc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXY34-0003EG-8m; Tue, 06 Feb 2024 21:52:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXY33-0003Dr-Au
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 21:52:29 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXY30-0000dA-QJ
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 21:52:29 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1d7858a469aso1656705ad.2
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 18:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707274345; x=1707879145; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/3IB+SoDAzkmHVKlFR4bQnh/JTWAMai5rQK+rwyNyA=;
 b=DoKQseycYOVQwr8krjmQ/jUO33B5km8OCt6v40vdaxCfDT46uM3ssBhtel4LeuRK5S
 GLQmwxNXhqrBvXRUcPWhOSdPwN6OHoTWdbQPQ/aDfErS20vlni2CbK4wkEPqQg0uWFdW
 2QCG/O2+1OLb1/FgWOOYqx1IO46FOu6rjQN01D+LP11RQnbvlcRxAEnKISfAkJSnSrhi
 V3gDmej5hSGoVM7YgDH4SoKzlbUEO133qQOIVRFRMWkrf2pFmvihEKxODYC38aR+B0ai
 NroTP2ZbBhBaxyJ14swTgFBAvNYpYi9suR23pj5+LZYbJOGqpVyilCvlScwTDNarYkYW
 lTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707274345; x=1707879145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8/3IB+SoDAzkmHVKlFR4bQnh/JTWAMai5rQK+rwyNyA=;
 b=MbbgNyTHlD6OkYvnvpXij6emOt5kDpOy2IQ8d5q0SZym8pjgb2DtHCJvLxascygpTR
 X/Asodr0P1B9imHi8J414ceF6V1cbaXS+nq8v4bVsT1mflLrUnMc0fdGh7Z3n179Flk1
 gFDSen/mFXgaB12vcjYPeo+MMXsme+Oag5JgdtunxCINnXrWS4odVuckIdqgq3kRfXle
 wGCG6sefVDsPfK++ro7wtFTMyVdoR5zO8lhK+vEvMxE20alUOY7zebVYOVxf6xJ4gnE+
 ACUO8e4gqp23mJ56WElXkRBNGYKgK4urVIVBU/PsQO+dsuynuweeLEZ3VpIDI4OFCIDA
 Q4XA==
X-Gm-Message-State: AOJu0YzqFYdjZp5hy9w2/zTUOXJC+5/PNsbWNthKDQkH/QuBSpk5zgjK
 oN4EUteSbLsX+7Epr9Qw0cn2n7FR8IayT5geYAlbgxRVDGkOvbcHvWafK7JnZwQ=
X-Received: by 2002:a17:903:41c9:b0:1d9:e1e3:8639 with SMTP id
 u9-20020a17090341c900b001d9e1e38639mr3687125ple.62.1707274345389; 
 Tue, 06 Feb 2024 18:52:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUAfiWzBiEt+kkkM9AN4fJ9p671JGoUeySNOU45usbl6NeaLO/FoX2gbZsuaQ8j6WIGE5bI9ADxzEBFkh4fDKXffqTFLcO+SG+kTwEKX4Jb4z5JusfDZQS+JuKObEdtmvy3
Received: from stoup.. (60-242-98-186.static.tpgi.com.au. [60.242.98.186])
 by smtp.gmail.com with ESMTPSA id
 kr8-20020a170903080800b001d8ef97de4asm255435plb.38.2024.02.06.18.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 18:52:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org,
	qemu-stable@nongnu.org
Subject: [PATCH v3 2/6] target/arm: Fix nregs computation in do_{ld,st}_zpa
Date: Wed,  7 Feb 2024 12:52:06 +1000
Message-Id: <20240207025210.8837-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207025210.8837-1-richard.henderson@linaro.org>
References: <20240207025210.8837-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lwxRWNR6jrDe

The field is encoded as [0-3], which is convenient for
indexing our array of function pointers, but the true
value is [1-4].  Adjust before calling do_mem_zpa.

Add an assert, and move the comment re passing ZT to
the helper back next to the relevant code.

Cc: qemu-stable@nongnu.org
Fixes: 206adacfb8d ("target/arm: Add mte helpers for sve scalar + int loads")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 296e7d1ce2..7108938251 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4445,11 +4445,7 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
     TCGv_ptr t_pg;
     int desc = 0;
 
-    /*
-     * For e.g. LD4, there are not enough arguments to pass all 4
-     * registers as pointers, so encode the regno into the data field.
-     * For consistency, do this even for LD1.
-     */
+    assert(mte_n >= 1 && mte_n <= 4);
     if (s->mte_active[0]) {
         int msz = dtype_msz(dtype);
 
@@ -4463,6 +4459,11 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
         addr = clean_data_tbi(s, addr);
     }
 
+    /*
+     * For e.g. LD4, there are not enough arguments to pass all 4
+     * registers as pointers, so encode the regno into the data field.
+     * For consistency, do this even for LD1.
+     */
     desc = simd_desc(vsz, vsz, zt | desc);
     t_pg = tcg_temp_new_ptr();
 
@@ -4600,7 +4601,7 @@ static void do_ld_zpa(DisasContext *s, int zt, int pg,
      * accessible via the instruction encoding.
      */
     assert(fn != NULL);
-    do_mem_zpa(s, zt, pg, addr, dtype, nreg, false, fn);
+    do_mem_zpa(s, zt, pg, addr, dtype, nreg + 1, false, fn);
 }
 
 static bool trans_LD_zprr(DisasContext *s, arg_rprr_load *a)
@@ -5168,14 +5169,13 @@ static void do_st_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
     if (nreg == 0) {
         /* ST1 */
         fn = fn_single[s->mte_active[0]][be][msz][esz];
-        nreg = 1;
     } else {
         /* ST2, ST3, ST4 -- msz == esz, enforced by encoding */
         assert(msz == esz);
         fn = fn_multiple[s->mte_active[0]][be][nreg - 1][msz];
     }
     assert(fn != NULL);
-    do_mem_zpa(s, zt, pg, addr, msz_dtype(s, msz), nreg, true, fn);
+    do_mem_zpa(s, zt, pg, addr, msz_dtype(s, msz), nreg + 1, true, fn);
 }
 
 static bool trans_ST_zprr(DisasContext *s, arg_rprr_store *a)
-- 
2.34.1

