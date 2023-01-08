Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1328800ejc;
        Sat, 7 Jan 2023 18:49:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvtG9r1I2kdXIz5NlOzoAx32GtR9rSABM2B8djAUGEIvTUbWOw99plQeiCQ7ejno9tG10rn
X-Received: by 2002:a0c:c683:0:b0:531:e1dd:c4d0 with SMTP id d3-20020a0cc683000000b00531e1ddc4d0mr20022054qvj.37.1673146158927;
        Sat, 07 Jan 2023 18:49:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673146158; cv=none;
        d=google.com; s=arc-20160816;
        b=JJJ1URwXbrCnrv3DdFa+6Z8X57qKNCJAVu7FxKk1tG+p05Sv3eNfhSEKvD4S8KNJpR
         aJojUqUdN/++7gS3YtdudojuUWVqtKaitMqurhsVO0rEfd6ovIDUpAzUze9amAqzBuoD
         xqlL+pu8VgrUrhnxyvQ9EhUD5ykkLV/+0288m9R1H2SId6sAIw1F59Xg1riSFnyjISt1
         EQMPNZ7Dn0XZYt97mHeBuBUlejC+mSl4eQgh8xJi22hqwp6UeUjkuPGowC0WgbQafEtn
         i5rMKOKjUWykFWdZdM9TwItu3vrh/RKvO6AnTuLMjGzv9NB3FGEgWolyoQ3omHecbcSr
         RZbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eH8QC2IFkRWe6pofdb+MHZgnEhO+cdUQERbeKdouJGM=;
        b=RUsanR850kvM98l4k+ev9ZzgLjcq5lgWW3Os8zlOVWROgdFNDX0/0Zb0X+Avw5nvr0
         pgrJ+3IS4khWxtm0h7Cj1Uf5h0R2juyKQqQR/Lkua4F0CRk3FV+P5CKk/QtFFwipF3CO
         2mPtpSIvfZX7slBe7uvVRbEFRZPOLZCTBBll8gc1SQkNGi/NRuVqqttCDML5BQZgR6bq
         78w6ivMYR5b7OP0lF5UkAvpBFnH2gzO0u0TKQUPLGOXGHXDwbLLHcAo5yHpuDG7mOUpZ
         RJ/d2nz0NZeITc2249BEqXQfhA58A+CLS755Rl04V1ewC58YQ/ywceS0J4vx6WNKsJGW
         SL5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TegwglnL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj19-20020a056214529300b005322c03e3a6si482577qvb.557.2023.01.07.18.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 07 Jan 2023 18:49:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TegwglnL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELaC-0006CL-WB; Sat, 07 Jan 2023 21:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELa8-0005u5-8U
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:44 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZH-0004jl-Tg
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:38:43 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so9303945pjq.1
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eH8QC2IFkRWe6pofdb+MHZgnEhO+cdUQERbeKdouJGM=;
 b=TegwglnL6q7iVTSGCpZcoM+tVYYCB0J+zT6QfcVW8A3uqu9fs9/M/S7aIYXTb9MeCq
 6dAGsHTy/eqwhddJoWnJcioaLlzMzqXE8wwz9dgy5CIYcZuaaFqXuIVFmTXn76ZmOS7I
 GaPS5AFZt3FGUrr5CqsMUhPdM4gu1mGkSO9qRjiafE2nqMnN8XWaAcJ1Pbg9mAYxDT84
 1ZGu4l/knxUXydyMvkAlbE9mnv021BghbD8jZUXdlittqV6cmkxoylWR0F20J4Z6nSyT
 RqCM/WbUSfr+fyaLfHdwxfSRQubpUcbI2T2TDki/jkvoylrffqxMV6s7FCq3nuxo7Dpr
 7kqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eH8QC2IFkRWe6pofdb+MHZgnEhO+cdUQERbeKdouJGM=;
 b=KnS7mdON3dRmOtsVRAQSSItufS1FkAhdkIRDf/qlhtgGjQr52utOmKMBVXQtvD/y4D
 fH9UkJmbcOGGcpVl7OqQwg0qBbNwy7xNgaGBHYszkhR3A2XOGjTd5URWuRC95IRmJug9
 mBYLH7IDQuVwYbPxkPxjRcnJqfd8kV+ZGYHJbLv1ky5LLHyWiRYlUtRhjMbnQ5wXi7oj
 jy0UWY9kFqlPxg3YctZFolJw/Udjo+bqEqbA/pgYlePgbMDeMJoNCPj1euCrh3oOH8we
 o/6S04FzsAtk3hrwZ64kWAuwAW6Nl2Oc5+tssaZYJge7hDcuT1Xm0yTy9ZBRT2Vz9vNc
 PH2A==
X-Gm-Message-State: AFqh2krgKiwYF44bayz26bgMDGXe/6Ae15eH5wWxaOqpNB/OEjemnAMj
 ECg0+4+JQIqjYPXtW3OlI+RwCGq8zVnBAVhe
X-Received: by 2002:a17:903:189:b0:189:ba1f:b178 with SMTP id
 z9-20020a170903018900b00189ba1fb178mr97835919plg.9.1673145470705; 
 Sat, 07 Jan 2023 18:37:50 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 27/36] target/s390x: Use Int128 for return from CKSM
Date: Sat,  7 Jan 2023 18:37:10 -0800
Message-Id: <20230108023719.2466341-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: CA4xTc2qdOkL

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/helper.h         | 2 +-
 target/s390x/tcg/mem_helper.c | 7 +++----
 target/s390x/tcg/translate.c  | 6 ++++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 25c2dd0b3c..03b29efa3e 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -103,7 +103,7 @@ DEF_HELPER_4(tre, i64, env, i64, i64, i64)
 DEF_HELPER_4(trt, i32, env, i32, i64, i64)
 DEF_HELPER_4(trtr, i32, env, i32, i64, i64)
 DEF_HELPER_5(trXX, i32, env, i32, i32, i32, i32)
-DEF_HELPER_4(cksm, i64, env, i64, i64, i64)
+DEF_HELPER_4(cksm, i128, env, i64, i64, i64)
 DEF_HELPER_FLAGS_5(calc_cc, TCG_CALL_NO_RWG_SE, i32, env, i32, i64, i64, i64)
 DEF_HELPER_FLAGS_2(sfpc, TCG_CALL_NO_WG, void, env, i64)
 DEF_HELPER_FLAGS_2(sfas, TCG_CALL_NO_WG, void, env, i64)
diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 9be42851d8..b0b403e23a 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -1350,8 +1350,8 @@ uint32_t HELPER(clclu)(CPUS390XState *env, uint32_t r1, uint64_t a2,
 }
 
 /* checksum */
-uint64_t HELPER(cksm)(CPUS390XState *env, uint64_t r1,
-                      uint64_t src, uint64_t src_len)
+Int128 HELPER(cksm)(CPUS390XState *env, uint64_t r1,
+                    uint64_t src, uint64_t src_len)
 {
     uintptr_t ra = GETPC();
     uint64_t max_len, len;
@@ -1392,8 +1392,7 @@ uint64_t HELPER(cksm)(CPUS390XState *env, uint64_t r1,
     env->cc_op = (len == src_len ? 0 : 3);
 
     /* Return both cksm and processed length.  */
-    env->retxl = cksm;
-    return len;
+    return int128_make128(cksm, len);
 }
 
 void HELPER(pack)(CPUS390XState *env, uint32_t len, uint64_t dest, uint64_t src)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 8397fe2bd8..1a7aa9e4ae 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -2041,11 +2041,13 @@ static DisasJumpType op_cxlgb(DisasContext *s, DisasOps *o)
 static DisasJumpType op_cksm(DisasContext *s, DisasOps *o)
 {
     int r2 = get_field(s, r2);
+    TCGv_i128 pair = tcg_temp_new_i128();
     TCGv_i64 len = tcg_temp_new_i64();
 
-    gen_helper_cksm(len, cpu_env, o->in1, o->in2, regs[r2 + 1]);
+    gen_helper_cksm(pair, cpu_env, o->in1, o->in2, regs[r2 + 1]);
     set_cc_static(s);
-    return_low128(o->out);
+    tcg_gen_extr_i128_i64(o->out, len, pair);
+    tcg_temp_free_i128(pair);
 
     tcg_gen_add_i64(regs[r2], regs[r2], len);
     tcg_gen_sub_i64(regs[r2 + 1], regs[r2 + 1], len);
-- 
2.34.1

