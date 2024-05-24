Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1995633ejb;
        Fri, 24 May 2024 16:31:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1OW59I/VPomkRSYM9sVGMYk4WuCvK9JdIan9JBbj1CAipenmbwy34gm6SKYv63v1I8n23lJfkvJ7t91ShAvPxAj1LKIvf
X-Google-Smtp-Source: AGHT+IHppd1oghT7/WgnLSI3/+MSNwWP9mhpeTXRVBDYQf3XDsU7h3anhn3zUTQqU7wQx8C4QEG1
X-Received: by 2002:a05:6214:590c:b0:6ab:6efc:b9c9 with SMTP id 6a1803df08f44-6abbbcbec4dmr35250836d6.33.1716593461959;
        Fri, 24 May 2024 16:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593461; cv=none;
        d=google.com; s=arc-20160816;
        b=dhh+3bC4Q4K2s18mO9fGFYZyueYKB94XZP51uZsDkWhaMUR+BtztELdt90RdPW/H/H
         kbiJ4U+835BJNnthFiC5RBI9kpSF4JhNxCbhZ+btPnFj68uUuMihkvxFzHnCvnFXjLoy
         70DyQAjFVtiuI1YyiGrAY6GWqV7R3COqQlsjUTr05KOVXCylBD51OzvXGWrsxx9G3lCg
         g0VGrltdGyG6wwDb3dIW3vl9BL/VA3WOHp+3hFeA1Q6bE7qnNafQBgt9aHEHlOypkdj7
         RHEYGv4iLFS/k7ULhVXCRm9Tbuv9/UCR1VA6vZvlc9dOkOMU0yoguII+p/O6YwGEGdqB
         /BCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xnQyj7jh7NMF7XqKnheMTRMPUBrUq1CKfrzf5INB11g=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=tYqOYSRBC1hn6NL/Csfo0iAxjFhIWJDLa0Q52iuxacnfwIOZw/4PtPO7MO1W2qPmgh
         vkVO0TLgnhBS2N2NJ4zrQneI2z7LiOtG9vQ9okz+sYm+guXe7MHs5THJapkZQHIPqKG5
         P6sjbSulJN8OD82iMintzBPst5rERiLfGrKcXioQsZ0TOQlHpspbMjv2VkKlG20XT+7Y
         E3U2LozxEK/SQ/kCTLCK9bHlRSoRKxtNyD7CzxDZ5AgXepIFqehrXDz7tjgHyDvwRSIJ
         WMSXv9aw2CM8HApSltUk8Vpj/071zwe/q/E/DpbHmC6vyFwUaNacW0BF3qsGdfmAq767
         UrRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NduP3F1Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18b1a09si33508971cf.404.2024.05.24.16.31.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:31:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NduP3F1Y;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sAeJD-0003MQ-Qg; Fri, 24 May 2024 19:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeI6-000827-8z
 for qemu-devel@nongnu.org; Fri, 24 May 2024 19:25:38 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHt-0006vE-Vq
 for qemu-devel@nongnu.org; Fri, 24 May 2024 19:25:36 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6fbbd937719so639435b3a.0
 for <qemu-devel@nongnu.org>; Fri, 24 May 2024 16:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716593114; x=1717197914; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xnQyj7jh7NMF7XqKnheMTRMPUBrUq1CKfrzf5INB11g=;
 b=NduP3F1Y9RIKGemWqRWlPTY92maUJPIQKNYdHl2Z41hs83m0aCGoOOaAY6NT9VpFAN
 1+NZqqPGj9RBh64E4v76AdjovjfrpfGeaim2rrOReQjHJyGJwCElkKtQsQ5CAZjv8JNm
 YNUujpAi0XjhLJh+CxUL1edFgAnKsAX4SYA9d7m9sBaKu5RBMgrFLKRT75HWXH/JfelQ
 lt85jCenQS3lbNwrVTpzv6fK/WVMLK4VdykP9SxA1sYPEjRfZp+JXsiCFYZ0cpjpIxfX
 StdB+tlI23NDeNm9/nmeiepHu0Jbe38b9PvnYtaZo1auybQfaGdsrBBTtFoiDSEzH9Od
 jL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716593114; x=1717197914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xnQyj7jh7NMF7XqKnheMTRMPUBrUq1CKfrzf5INB11g=;
 b=lnWFtS2K0UzzvdsL5bmvy5R0oAbIuNO4HObetC8tlCG4ErupQo24zoEtfpQacxoZAj
 Ra3L//qi6VD5iE8MMJ2AX377Pvin+rVbAFDpv3vpH7T/5cJWeFfqSDZuMWws7ydkcL8d
 iz3WBtPstg+nWBAe0SQ8B7FhE2iLNsn6rCk4yCF5BZcRq70+VWZsVkiFTrHymvHsbvJJ
 b4xUBXrBBycxKd41TzKyrO/BssIqkElUdqTqewAiCBNPh34SNgq7o9ZsmMuxRWwaZejB
 4yN4k/Z46V0+71pVtrGkDrf/4/AGP53zGov4oUcx2QUEiut7WsJhjxbFVpXuOVcMKg4m
 xQQw==
X-Gm-Message-State: AOJu0YyMcwHJ7bi/AV6yCBRAzSbCpMP//NkovpiTIQSaZmakFoY4byvC
 qMqT5e8rx+KfNGHFg7obhY2nNaG3TX2PN5jCGq1ZaYCgqTkjQSNy1W0klJwJDgNrcINPZXCy/KF
 8
X-Received: by 2002:a05:6a00:1f12:b0:6ed:1c7:8c6b with SMTP id
 d2e1a72fcca58-6f8f2c56b89mr3781795b3a.1.1716593114515; 
 Fri, 24 May 2024 16:25:14 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2cfd1sm1591695b3a.3.2024.05.24.16.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:25:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 59/67] target/arm: Convert SRHADD, URHADD to decodetree
Date: Fri, 24 May 2024 16:21:13 -0700
Message-Id: <20240524232121.284515-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
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
X-TUID: +ac7eAgWRNAV

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  2 ++
 target/arm/tcg/translate-a64.c | 11 +++--------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index b1bbcb144e..1c448b4f7c 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -916,6 +916,8 @@ SHADD_v         0.00 1110 ..1 ..... 00000 1 ..... ..... @qrrr_e
 UHADD_v         0.10 1110 ..1 ..... 00000 1 ..... ..... @qrrr_e
 SHSUB_v         0.00 1110 ..1 ..... 00100 1 ..... ..... @qrrr_e
 UHSUB_v         0.10 1110 ..1 ..... 00100 1 ..... ..... @qrrr_e
+SRHADD_v        0.00 1110 ..1 ..... 00010 1 ..... ..... @qrrr_e
+URHADD_v        0.10 1110 ..1 ..... 00010 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 40aa7a9d57..9ef5de6755 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5458,6 +5458,8 @@ TRANS(SHADD_v, do_gvec_fn3_no64, a, gen_gvec_shadd)
 TRANS(UHADD_v, do_gvec_fn3_no64, a, gen_gvec_uhadd)
 TRANS(SHSUB_v, do_gvec_fn3_no64, a, gen_gvec_shsub)
 TRANS(UHSUB_v, do_gvec_fn3_no64, a, gen_gvec_uhsub)
+TRANS(SRHADD_v, do_gvec_fn3_no64, a, gen_gvec_srhadd)
+TRANS(URHADD_v, do_gvec_fn3_no64, a, gen_gvec_urhadd)
 
 static bool do_cmop_v(DisasContext *s, arg_qrrr_e *a, TCGCond cond)
 {
@@ -10923,7 +10925,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             return;
         }
         /* fall through */
-    case 0x2: /* SRHADD, URHADD */
     case 0xc: /* SMAX, UMAX */
     case 0xd: /* SMIN, UMIN */
     case 0xe: /* SABD, UABD */
@@ -10949,6 +10950,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
 
     case 0x0: /* SHADD, UHADD */
     case 0x01: /* SQADD, UQADD */
+    case 0x02: /* SRHADD, URHADD */
     case 0x04: /* SHSUB, UHSUB */
     case 0x05: /* SQSUB, UQSUB */
     case 0x06: /* CMGT, CMHI */
@@ -10968,13 +10970,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x02: /* SRHADD, URHADD */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_urhadd, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_srhadd, size);
-        }
-        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
-- 
2.34.1

