Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1271115ejc;
        Sun, 5 May 2024 18:09:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWh2dT6k20gWUebxfAtgo9ZoEZREz+ICc1AFG0+aEcXBU6UoGSHvLcUz+RyzbKPoIp1nUrS81Sw1p7BXzpYupbUMmfocBUp
X-Google-Smtp-Source: AGHT+IF7AWCJXCE4+djRRWbe24KZQUNI7GvS6KH8mQLuW3umD8LXDg3FQpHVp2UlqweoZi3Lw/Ij
X-Received: by 2002:a05:6808:10d4:b0:3c8:69b6:9b7e with SMTP id s20-20020a05680810d400b003c869b69b7emr11773877ois.7.1714957757431;
        Sun, 05 May 2024 18:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957757; cv=none;
        d=google.com; s=arc-20160816;
        b=aLowFeeXUIJKYqBG4ONahZ1ijcFRZjIWHH7N789ptJC1LfXmPuwtYbpkTYWvoG1ARu
         GnBlPE3FuApxyyD6xJEwAjz9+/+G62rNZMJc1edLHP6SPb3HBKg8gtobxWg7ksNhrIch
         kbGm2k001fVaxqSLMmnvhsu56X0Y1YgmxT3yVsHpmquXTCuhbxQcvWbaDGxBsfjwhK/Z
         hX2QHTw1BYxGT3wsnt6COAbfvzIYwPXKu/H6VIaYX3XMSlSydin4MbbPSQvT7lZEhf3J
         bS69Oqbi6+IaMJOB8DtveIWT7HZkPg+Bt4X9oF+n/zD+kBxD4yh7Fdtkw8cx+YWBpuWy
         Pdlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dL7mAB8TBpKQiJ0NobasPIhB/RF/PQ9QibMDfx0vRQo=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=RjcZQaZFY0dTg50drUz6ZHo5laNi4zJU5bJ5MxDaGptB1JXPkJq2GzXmfQRGiY/Srp
         NgL9632KFSVIAZCYkKUIfjJSAg3X65YlOLN7wgk9AjuWPvMKT3Csv5kqbk0hJ1nZW5TM
         4/Cn4AoaZ4IVV3iGDzJ9mo9q5WCl0rURCZZpCD0I7c6fOJGvPDeedAww4oaZF0vSqf/2
         FP7JO+YT4iWkE+VKoLKoOmY7TS34/JCphsjEUAciASTfjiuSJU8TQjOIbTu3Sz29DDtd
         D8O5DIu72Gw4eJycX4qfmlbm9pYMcWUX+a3CBAr4VNX6bc633+yyib/iOUSReiNAjN+m
         M8ZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vkf9TTBP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3-20020a05622a000300b0043b0b3a0743si8493193qtw.418.2024.05.05.18.09.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:09:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vkf9TTBP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s3mqS-0002Kn-9i; Sun, 05 May 2024 21:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mps-0008C1-TM
 for qemu-devel@nongnu.org; Sun, 05 May 2024 21:08:12 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpb-0003OD-Sv
 for qemu-devel@nongnu.org; Sun, 05 May 2024 21:07:59 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6f453d2c5a1so1428382b3a.2
 for <qemu-devel@nongnu.org>; Sun, 05 May 2024 18:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957669; x=1715562469; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dL7mAB8TBpKQiJ0NobasPIhB/RF/PQ9QibMDfx0vRQo=;
 b=Vkf9TTBPA7ICmsuAzQggoAOTyayTCCP+bKzSKny4VrZ1s9hLJwgkpTKpvnPJlC1slI
 GauMKpHk5+Nunuk3ejH13LRMsOSiTdw9mnYE8zVqB0Nqj+IAFp/cNkExym7bpVNSN2yw
 CRYldVkLzdaCJO+4v6PLO45Px+rPOtcq6SS0Pg7cGrBUtD4+A4xoFk2+bdyAjb0YYe3a
 fmhdwMueu0xafWBMB4vw0WBkye7NAnO9bHoI1LNkfnDA4Q3MQWDvfuURHtBbKH223nR1
 xkoJNKy9usi1wMwnmYlezPMCZg+g4YxuaP9x677ro6Y+yaAAOpLffY/0EGLhJY6014l2
 s9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957669; x=1715562469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dL7mAB8TBpKQiJ0NobasPIhB/RF/PQ9QibMDfx0vRQo=;
 b=RshX4jDmfFRhTmtO8J/QUP2nZo5AdA99SrddsP7r8+LiRhwkf3qJ0WBcO8Z33g7uGc
 n4puKEj5tlqCyundWRnkUb4B+A0Luq7LrB0/nU0yPspCn9MZj8vz1zHNnUaxn5K83Kxy
 O5wigrMynqrTr9ZLjmLth8Z1VH0alG8D9PyOlxF0pNaoTxPsxT5Ps7S8CZba5G0FDbi9
 rmBoZRQ8xXnUIywvsrN4o/2Q2kJ7NU2H4EdlnuwaA8/Gb+fv/q7UR4htWwdTaXHOwiaT
 ceaAI+2az9kUkC1zV36wp+NoFYEEznGLrkcj2nsICaHdoWjUzHzmB1OMnIvsOHITJoNI
 Csbg==
X-Gm-Message-State: AOJu0Yw9JRMQVwj+B2Qsv11TsYudgdnEgRn+8qOsIHFRWyl/IQWk+Yl5
 JiiFOpoIVrzG84sEhyU3lYgMyyF+j43qogwE6GlxVcdv4qk8pkLBe9pOs7Rjcnrjy00WfHGZtJo
 a
X-Received: by 2002:a05:6a21:168d:b0:1a7:a6f3:1827 with SMTP id
 np13-20020a056a21168d00b001a7a6f31827mr9335135pzb.46.1714957669346; 
 Sun, 05 May 2024 18:07:49 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 kp4-20020a056a00464400b006e580678dfbsm6577287pfb.193.2024.05.05.18.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:07:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 53/57] target/arm: Convert SABA, SABD, UABA, UABD to decodetree
Date: Sun,  5 May 2024 18:03:59 -0700
Message-Id: <20240506010403.6204-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
X-TUID: VFtXu4mSnskX

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  4 ++++
 target/arm/tcg/translate-a64.c | 22 ++++++----------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 9b68444595..e1667775f6 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -922,6 +922,10 @@ SMAX_v          0.00 1110 ..1 ..... 01100 1 ..... ..... @qrrr_e
 UMAX_v          0.10 1110 ..1 ..... 01100 1 ..... ..... @qrrr_e
 SMIN_v          0.00 1110 ..1 ..... 01101 1 ..... ..... @qrrr_e
 UMIN_v          0.10 1110 ..1 ..... 01101 1 ..... ..... @qrrr_e
+SABD_v          0.00 1110 ..1 ..... 01110 1 ..... ..... @qrrr_e
+UABD_v          0.10 1110 ..1 ..... 01110 1 ..... ..... @qrrr_e
+SABA_v          0.00 1110 ..1 ..... 01111 1 ..... ..... @qrrr_e
+UABA_v          0.10 1110 ..1 ..... 01111 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9ab73fc330..2e746d2877 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5465,6 +5465,10 @@ TRANS(SMAX_v, do_gvec_fn3_no64, a, tcg_gen_gvec_smax)
 TRANS(UMAX_v, do_gvec_fn3_no64, a, tcg_gen_gvec_umax)
 TRANS(SMIN_v, do_gvec_fn3_no64, a, tcg_gen_gvec_smin)
 TRANS(UMIN_v, do_gvec_fn3_no64, a, tcg_gen_gvec_umin)
+TRANS(SABA_v, do_gvec_fn3_no64, a, gen_gvec_saba)
+TRANS(UABA_v, do_gvec_fn3_no64, a, gen_gvec_uaba)
+TRANS(SABD_v, do_gvec_fn3_no64, a, gen_gvec_sabd)
+TRANS(UABD_v, do_gvec_fn3_no64, a, gen_gvec_uabd)
 
 static bool do_cmop_v(DisasContext *s, arg_qrrr_e *a, TCGCond cond)
 {
@@ -10923,8 +10927,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             return;
         }
         /* fall through */
-    case 0xe: /* SABD, UABD */
-    case 0xf: /* SABA, UABA */
     case 0x12: /* MLA, MLS */
         if (size == 3) {
             unallocated_encoding(s);
@@ -10957,6 +10959,8 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     case 0x0b: /* SQRSHL, UQRSHL */
     case 0x0c: /* SMAX, UMAX */
     case 0x0d: /* SMIN, UMIN */
+    case 0x0e: /* SABD, UABD */
+    case 0x0f: /* SABA, UABA */
     case 0x10: /* ADD, SUB */
     case 0x11: /* CMTST, CMEQ */
         unallocated_encoding(s);
@@ -10968,20 +10972,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0xe: /* SABD, UABD */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_uabd, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_sabd, size);
-        }
-        return;
-    case 0xf: /* SABA, UABA */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_uaba, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_saba, size);
-        }
-        return;
     case 0x13: /* MUL, PMUL */
         if (!u) { /* MUL */
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_mul, size);
-- 
2.34.1

