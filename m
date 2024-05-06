Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1273283ejc;
        Sun, 5 May 2024 18:15:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOf+N+h0lfrOI/yizMO1mOAiVj6+AqmmfmtwM5zDknoYwHtWMU1Z6wo9g9ntqnwsS530WjbfoZWcdWqpICw0FwsAt1t/42
X-Google-Smtp-Source: AGHT+IG8bR1CaTsMb25lONJS6viUmRa9589QNcT9gr4ELdvb7tkG/+1gkrHhtX7AmxF/OVOhLPMm
X-Received: by 2002:a05:620a:40c9:b0:790:95ad:a688 with SMTP id g9-20020a05620a40c900b0079095ada688mr11528558qko.2.1714958122478;
        Sun, 05 May 2024 18:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714958122; cv=none;
        d=google.com; s=arc-20160816;
        b=uYdJJop1s3BXqsPuvoo6XsPfcaUptxtQaFXVilTVB8oqSeE7cWzluvomQvFqaXLGis
         HdECfPK8Va2qWHSDKu7zhz3NSMABUYxEwt0FNGQdH1x2eLYnakMSEOe/m6QRZtDrZK/D
         nCeirSEAm03rsX+KQwYCPEJLOEw9zJzuMmUC3C3EAz5TCgXLxMGD4U9EZW9dVwm2ty+T
         t52JdDK73eqeiBD155A3Z4cD2mr8BVmSGvk+8kQQKyxOUDJupzS0oZFnZoCju39OBM8u
         1i90Y95QJ51ErLT71o+44Zi0K/on78Ds0wiOaJPJPgSnTRa99kuQr959z+1VV8r96L/S
         6w8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OWoN8rIDjYKzkHikiqSLDwjV9UowPQlh2PhAhnTcBuo=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=hf7nplLBg7TL+wxVTMNys2csYf6UynLZvtlp8TQcjS3jJ9hSIKQVcGrp3RrdC4UhlC
         d1KQMRAxeOFmpOb48+tPQQQ0GO1givF3hexOiFm9JSP8PyGxgATVVlo6gUI/kfs6aArb
         P6OWKA5LmW7OJ8R2iOHBaLRWTth3tf6s++rc4THu3SzwP3LhGkHeME3GLfhGmIxJZFov
         cQpz9tK5eFzZeh0G/fCYYhlAMHPoEUKkFQsFm+BVZU512nxGTD/GNR0QKpBwZ8fl9Lc+
         CbEKpH+QR0S2FhEGjs4damXsdh1AaGne/7SCoQ1hFlWmqgJ8sdUZxAG10YJCxaVLbuNY
         jckw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WEuWDBZQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ow36-20020a05620a822400b00790f8848d66si8154103qkn.69.2024.05.05.18.15.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:15:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WEuWDBZQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s3mqI-0001Le-FB; Sun, 05 May 2024 21:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpd-0007eI-2h
 for qemu-devel@nongnu.org; Sun, 05 May 2024 21:07:54 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpW-0003MI-1v
 for qemu-devel@nongnu.org; Sun, 05 May 2024 21:07:52 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6f44e3fd382so897783b3a.1
 for <qemu-devel@nongnu.org>; Sun, 05 May 2024 18:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957665; x=1715562465; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OWoN8rIDjYKzkHikiqSLDwjV9UowPQlh2PhAhnTcBuo=;
 b=WEuWDBZQ3oRBlSFq0pnrNfD4P9U/su8exWwXoYOQdm1vdO9MYTAqb0B83M+S/yj6Mo
 6+LKAHQvw1Qnm4yRulFHsaUKoeHTZ40FaA/2UShHhCLjwxTPNIlIfvQ+StvXRAdluSeo
 /mqOGU2yGKnyh6AWjZA/mzbJH930O6t5xA/yuOJhlP8pcnIN4peXFr9K1xs8sOFlrzD1
 /eFUM/gEmfM6dDxwnOuGo6mhBJmwgae9tFWHBFNu2ANXUwdagCpOM0s+W/1DNanDuwX1
 HPXj1/YPkmUYxn1bo/GCNKHgxTyt5Yu3zMiv7IjDOgHj5/WdPDE/fAChc9fJQXmKke+K
 RzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957665; x=1715562465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OWoN8rIDjYKzkHikiqSLDwjV9UowPQlh2PhAhnTcBuo=;
 b=BhwNbvSsh5ZKOOXC44z96y1POEseSYyLkVsFQFTh9JndZA4r4b3xX/w35+nzKUa/v2
 /+Ynw0n7zencY8DFL3R3d+qLGvEFxoEiauFHnBseLsszWpT9V1506dTjYsGExR+qNFBV
 kkSjJFrnoWC+QaakGh19h/DthP2PpNcLOrpz0y4G08fHDcmjJKThwUx3wcvQATBU3CrO
 0Uz7ifktKClur4u1WAKEF9wGrOHpa4mJdXF9s9+ioHeR6NLtEkjmH1k3fJ8LkcCHUAi8
 V4enLG5PMSS3shhzb4OmT5g8vXmdsgUndYpXJYti5FtE49Ao3GEkOKDsyTzlRwwa5WHZ
 3Usw==
X-Gm-Message-State: AOJu0YwabAsUJ9DxkbOarEXgb3aKQWVauJfIFONrhaKauuMRppqsfcbb
 D7PtM0qE5mig0k/H3xR2pwMChW+PonPPoPexngU2exB3GAz6vtMZsbCEW32BgLeW4oUOxzlQFAy
 S
X-Received: by 2002:a05:6a21:9184:b0:1af:a1bc:b4ff with SMTP id
 tp4-20020a056a21918400b001afa1bcb4ffmr3713754pzb.37.1714957664715; 
 Sun, 05 May 2024 18:07:44 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 kp4-20020a056a00464400b006e580678dfbsm6577287pfb.193.2024.05.05.18.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:07:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 47/57] target/arm: Convert SHADD, UHADD to decodetree
Date: Sun,  5 May 2024 18:03:53 -0700
Message-Id: <20240506010403.6204-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
X-TUID: Rug/0lW/n2fB

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  2 ++
 target/arm/tcg/translate-a64.c | 11 +++--------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index d97390cacb..0881f00ecf 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -912,6 +912,8 @@ CMGE_v          0.00 1110 ..1 ..... 00111 1 ..... ..... @qrrr_e
 CMHS_v          0.10 1110 ..1 ..... 00111 1 ..... ..... @qrrr_e
 CMTST_v         0.00 1110 ..1 ..... 10001 1 ..... ..... @qrrr_e
 CMEQ_v          0.10 1110 ..1 ..... 10001 1 ..... ..... @qrrr_e
+SHADD_v         0.00 1110 ..1 ..... 00000 1 ..... ..... @qrrr_e
+UHADD_v         0.10 1110 ..1 ..... 00000 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 4f7d03b5f2..c70c3cec2a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5455,6 +5455,8 @@ TRANS(UQRSHL_v, do_gvec_fn3, a, gen_neon_uqrshl)
 
 TRANS(ADD_v, do_gvec_fn3, a, tcg_gen_gvec_add)
 TRANS(SUB_v, do_gvec_fn3, a, tcg_gen_gvec_sub)
+TRANS(SHADD_v, do_gvec_fn3_no64, a, gen_gvec_shadd)
+TRANS(UHADD_v, do_gvec_fn3_no64, a, gen_gvec_uhadd)
 
 static bool do_cmop_v(DisasContext *s, arg_qrrr_e *a, TCGCond cond)
 {
@@ -10914,7 +10916,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             return;
         }
         /* fall through */
-    case 0x0: /* SHADD, UHADD */
     case 0x2: /* SRHADD, URHADD */
     case 0x4: /* SHSUB, UHSUB */
     case 0xc: /* SMAX, UMAX */
@@ -10940,6 +10941,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
         }
         break;
 
+    case 0x0: /* SHADD, UHADD */
     case 0x01: /* SQADD, UQADD */
     case 0x05: /* SQSUB, UQSUB */
     case 0x06: /* CMGT, CMHI */
@@ -10959,13 +10961,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x00: /* SHADD, UHADD */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_uhadd, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_shadd, size);
-        }
-        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
-- 
2.34.1

