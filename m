Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3720920ejm;
        Tue, 25 Apr 2023 12:43:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y65bvp8CehNxFKkRaklDIopA3wi0v0ERlnelToPAkTd8u4IlfpeqWFReBh22CVlfE/2Ve1
X-Received: by 2002:a05:622a:64a:b0:3ea:6371:9f01 with SMTP id a10-20020a05622a064a00b003ea63719f01mr27667055qtb.18.1682451808666;
        Tue, 25 Apr 2023 12:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451808; cv=none;
        d=google.com; s=arc-20160816;
        b=yNkNNuuceULEtlzHg3+q4/2v9se0cVj+UYuWWKuEHO37qR+tN3L0XXmMAmF2HU5/la
         wcMTvGQdfkqzlO801ItMKOQ7o5lJ6Q51yD3x7h+Y01fNf3Nm+vkzI9dv0jnN+buQGz/A
         pCm+nMUrw2cNQTp87ZY9XZ6liNQLYF3l82wkpr71FBAwMGtQ44l6pRUOQbdrPQ9+N84Y
         Yq/2YLY4/3Dv1W1tGJWy8uXQ5IbjMQ9IsWmBOy8TyWTyFeV34t6RPjuzFk5Hlc5oKinL
         kRNpCLByqLqageXAmLsqIAy/OxoiSFwlp02EAMMKVS+JVSInlb/4TsEaUb6NTDAnEntn
         KdEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6s7rQstWrDxaC1BjVuEYZobw8VSYDLiLkliwIltqh+E=;
        b=XbOoeeMQ/aNrcHUU8zVy5VnMmX8ZAPCI7Rgs4bSgYnDUPo6Nb1OVHUCCEAQL8FGuIK
         /Bi2zPJwQEPjVOkKVxapYsVzxjRBHPJX7XAfdyx/6ytTfHdb7fjNJQP31OnmwbBaVP6D
         rkmTtUrV8KhP9nA+7IQB0zxoQEr4I55535l1Qv08Q3XflJJ5b/58UUF9m1gTN8HTh/gc
         751laFtSOgNH/aGLSWdHHjoF3/2yYzprwWWQQc5YMLuI9LKfFKTOMeAffU3/JgvDk5DC
         whJdybFX8eCc7NYz52ILfaExdqt4Dj1NLSp0m7PrKzg5pf3FfBCkfKB3+6UoLyeRFRFm
         skPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cejMgGVX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16-20020a05622a11d000b003ef6035045asi6927638qtk.728.2023.04.25.12.43.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:43:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cejMgGVX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOS9-0006IS-J6; Tue, 25 Apr 2023 15:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORn-0005dX-5h
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:35:31 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prORJ-00059g-2u
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:35:30 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a7af0cb2e6so59949881fa.0
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451297; x=1685043297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6s7rQstWrDxaC1BjVuEYZobw8VSYDLiLkliwIltqh+E=;
 b=cejMgGVXMpZVF2BRpBxRtwq9/Bb7QnOR7SFG5M7gpFh3egQXp6cDTaQvbEM6hfq9Ky
 NyaWgjRDly73YzNOMMN2wJxpM+/XMJhTTT1BP/yDCoxk5o8AAEBWw8ZqQQAFtnrggIjA
 ELapJLD/PlQO7k+4b8y2oqG2itcqrNdxy7N4w2StrwHVVxd3FA75NSsU+wWeseP6WyCn
 +uNIHTFTcsM7fmbyK4IqJuV4CdMzscTFihejmdSt02LR9eaw2Rd61AmGlYYSNGVP2Lwx
 LN0eTFWWcYFO4q3FVxwH/Tm1ZYSdccNoI6pR+ckhWTpJMVdzSJe9ouO8ldkO2KjmdmSl
 tNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451297; x=1685043297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6s7rQstWrDxaC1BjVuEYZobw8VSYDLiLkliwIltqh+E=;
 b=FMECk45nm9bTjt4IDcg7lmGbidBkzRwTriF3tshd+BuJH08ePIL9z13GsigpbTy8ld
 OY0D44iX8IdSJT4TJXrdk2xAudoQdWXMn6QGIV9g6vHUeUmc2vcNU+EQ2t0lxtRqH9OW
 gw4wIulI0n435uc9PYVVAXwnbPLFnHiPsD78uFQGZmHmuOXjCqyzjYCSrWDXvi9oHZMR
 Sg2xbhSps+GdVEnyHLW0MQgNUxWNrXnmYEoDc31BUyYnMUHqK7JM1RgXbnwUZPaABuh1
 4BX97N5gjoGekh6rwkjZMc8PmB5R5EBCZ1cOq7UwPjd16S14Y8/8mV7Z3pwOcarxKwr6
 EJHw==
X-Gm-Message-State: AAQBX9f8Pwry4CjqPVJpagrdNHUL190UhuDc1IuWJkVnrZJiqjFEkIkT
 LtGbFYj8kNSIihxMVAk0td7dHQ==
X-Received: by 2002:a2e:3803:0:b0:2a8:b995:ffe5 with SMTP id
 f3-20020a2e3803000000b002a8b995ffe5mr3771287lja.25.1682451296951; 
 Tue, 25 Apr 2023 12:34:56 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:34:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 33/57] tcg/sparc64: Split out tcg_out_movi_s32
Date: Tue, 25 Apr 2023 20:31:22 +0100
Message-Id: <20230425193146.2106111-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x229.google.com
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
X-TUID: R0Vta3Ytmtjq

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index e244209890..4375a06377 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -405,6 +405,13 @@ static void tcg_out_movi_s13(TCGContext *s, TCGReg ret, int32_t arg)
     tcg_out_arithi(s, ret, TCG_REG_G0, arg, ARITH_OR);
 }
 
+/* A 32-bit constant sign-extended to 64 bits.  */
+static void tcg_out_movi_s32(TCGContext *s, TCGReg ret, int32_t arg)
+{
+    tcg_out_sethi(s, ret, ~arg);
+    tcg_out_arithi(s, ret, ret, (arg & 0x3ff) | -0x400, ARITH_XOR);
+}
+
 /* A 32-bit constant zero-extended to 64 bits.  */
 static void tcg_out_movi_u32(TCGContext *s, TCGReg ret, uint32_t arg)
 {
@@ -444,8 +451,7 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 
     /* A 32-bit constant sign-extended to 64-bits.  */
     if (arg == lo) {
-        tcg_out_sethi(s, ret, ~arg);
-        tcg_out_arithi(s, ret, ret, (arg & 0x3ff) | -0x400, ARITH_XOR);
+        tcg_out_movi_s32(s, ret, arg);
         return;
     }
 
-- 
2.34.1

