Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1993313ejb;
        Fri, 24 May 2024 16:23:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZOexI43zTOMrs8gGum23kq0cJHW2085sxKZpa38lSGxDRu3Ob61j6dltNJ3UDMo74N9+T/gbbGjrKdh8aLbRbhdSJzv+U
X-Google-Smtp-Source: AGHT+IGIqOtzZ+scXh2YONYRSS6ZxIOfpJQCoFKoT3CfMjmSuCTs2OPZy6nd9QgjLoBetthYgpJc
X-Received: by 2002:aca:180d:0:b0:3c9:7097:748f with SMTP id 5614622812f47-3d1a5f24939mr3639520b6e.29.1716593020077;
        Fri, 24 May 2024 16:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593020; cv=none;
        d=google.com; s=arc-20160816;
        b=pRNkEgN0ViHgkcHFSLTee6NBQDNc/XWwqGo1noep8RE6mOxs8BgxHX34lYBNTIDWXi
         XKtwK4lyldqmOC4rPMXKYlV+2M9ArLkRyLR1xQEcqFXYHlIgAPWTcv8oruoc8dYQShv9
         aSDAOlBRZjYHlRxnG2K5I20qzvy2sPtP8f/lh4nGzGrIuvnEDSWYTVJ3QzfPnd6RGIBy
         JjVRE/wY/GOuV0GlNZtuUetXsWs2UeqsVHnJvAsWUWWBjgcNYdfvZmqypOSs5UNVlO9b
         HkGpGz/bwy12UpJXJ/exC8jUEb56uCNroN+8vGdedPVFEpkwtz5kZHoob+Q2jRaIFZRz
         9HHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nJubyT1NfWkcukaKcWaokzntrf+qNDVZUUMp7AEhbOw=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=NL9/L1PjApoO+JHabYlTgQE/hpQn5dZA4orpnWlqC3p1+Z5gwd9Hmwc7CfxnAA1BML
         k2+QcSyV8U4yOVoIioVYDCCC37vF+2XsIB63rLycgWdGuk84UARGXLIHgpLnKAtBUCkX
         CB0vhIFrbnGlo/e1ehCc1g6RntoU9as9tRG9cjKlMxRQNswJfmmzTg5OWaCC+ATtOex5
         k3iBidYYRhKlXKIr52KyXVlnppsa6g/skEaTftzgF/SWDKJbZgYCE1sUmcQHyskxefdN
         03j1hQ44H/sfeSKiWedDoRtDkfsZEi2b7eRIh86Tk5+Rf83ziMYOzRGG6fI1c0zQlOHm
         Uh9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VWu1fPKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18a61aasi28575861cf.351.2024.05.24.16.23.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:23:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VWu1fPKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeE6-0006OD-Ph; Fri, 24 May 2024 19:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeE4-0006MJ-Tv
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:28 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeE2-0005ep-1R
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:28 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1f44b6f9363so10790085ad.3
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716592885; x=1717197685; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nJubyT1NfWkcukaKcWaokzntrf+qNDVZUUMp7AEhbOw=;
 b=VWu1fPKCFJrg5T/VsDmkirgDzcvJ+k7g3rOQD6Z9L/d5jUKWbplWrnxMt+9BAq5I4y
 0qV6OwKqbMh6FcN7kqo0sYDYa2HLnA+EnswYqwNuOnOiqmI1z5WfHVGygQUrdctpaCl3
 D6D6X9w5Cz8IHUYh9EYCfk9I5RF//sxaTcao4Io6dc8ZuQ/YfpPlV/v1AMT0Eko07Glf
 V7godXZrLLgFIpF4eAiNSWIQq2tahOG53Ew3TqZdu8a6m52NHyqx2VRS3jL8g0XUMbQY
 ajrXwfbndU0/Q1lphDvlz4y286FRln0bW5e0QK4+oqwGBuhCmIZBpU3c8k8BUUORNDqj
 KfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716592885; x=1717197685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nJubyT1NfWkcukaKcWaokzntrf+qNDVZUUMp7AEhbOw=;
 b=iTs1BK3pV4bxmyp8gNuFCKn38Xrb1KvgiphPbPBLGPHTi84qrQxOQIWbaC6FKyTEZd
 4ulFvNu5P5TyN5uCzR/l7OK7td8upcDh4+AhN1cHAisM1OaNKZiWo8ceVfTQsRdimERX
 HUq6UFrXAqiw9pY70TlNkM18+UrBsSKlrSzleSJqO2odRRnvjI+Btk/kCe6rSMii3pOL
 od8DpkX5Q9WztFe1He0HnaufBO4DvbkauFaRhl9pZrZkeUl8ctZJLToSv8u18c5JjrOp
 S1L8lplxKJhn4MX+vZtiB3+xHmBdTaqj2LwWnFT275MD3MCLD8rIWg/BSnQFmXzBZTmR
 j9YA==
X-Gm-Message-State: AOJu0Yy8os+Te1fn0ZHQkxU/lYRotlQ21UWvgFwHMn5kfGZv3zFGD9h5
 ZZfRsJ/l7RdtK/zJ6P07qiqqc2tDh0+Wu4r1aYkw+luLSFwpkp9UbQDKv5xbrmJJ2b+OTvElHBF
 K
X-Received: by 2002:a17:902:64d7:b0:1f3:3f33:2873 with SMTP id
 d9443c01a7336-1f4486ed8afmr34218245ad.25.1716592884682; 
 Fri, 24 May 2024 16:21:24 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c759ceesm19178305ad.10.2024.05.24.16.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:21:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 02/67] target/arm: Use PLD, PLDW, PLI not NOP for t32
Date: Fri, 24 May 2024 16:20:16 -0700
Message-Id: <20240524232121.284515-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: YfX9PstcUWMM

This fixes a bug in that neither PLI nor PLDW are present in ARMv6T2,
but are introduced with ARMv7 and ARMv7MP respectively.
For clarity, do not use NOP for PLD.

Note that there is no PLDW (literal) -- bit 5 of the first word
is not decoded, and is PLD (literal).  Confirmed on neoverse-n1
host which does *not* trap on the (0) bit in the decode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/t32.decode  | 25 ++++++++++++-------------
 target/arm/tcg/translate.c |  4 ++--
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/t32.decode b/target/arm/tcg/t32.decode
index f21ad0167a..d327178829 100644
--- a/target/arm/tcg/t32.decode
+++ b/target/arm/tcg/t32.decode
@@ -458,41 +458,41 @@ STR_ri           1111 1000 1100 .... .... ............        @ldst_ri_pos
 # Note that Load, unsigned (literal) overlaps all other load encodings.
 {
   {
-    NOP          1111 1000 -001 1111 1111 ------------        # PLD
+    PLD          1111 1000 -001 1111 1111 ------------        # (literal)
     LDRB_ri      1111 1000 .001 1111 .... ............        @ldst_ri_lit
   }
   {
-    NOP          1111 1000 1001 ---- 1111 ------------        # PLD
+    PLD          1111 1000 1001 ---- 1111 ------------        # (immediate T1)
     LDRB_ri      1111 1000 1001 .... .... ............        @ldst_ri_pos
   }
   LDRB_ri        1111 1000 0001 .... .... 1..1 ........       @ldst_ri_idx
   {
-    NOP          1111 1000 0001 ---- 1111 1100 --------       # PLD
+    PLD          1111 1000 0001 ---- 1111 1100 --------       # (immediate T2)
     LDRB_ri      1111 1000 0001 .... .... 1100 ........       @ldst_ri_neg
   }
   LDRBT_ri       1111 1000 0001 .... .... 1110 ........       @ldst_ri_unp
   {
-    NOP          1111 1000 0001 ---- 1111 000000 -- ----      # PLD
+    PLD          1111 1000 0001 ---- 1111 000000 -- ----      # (register)
     LDRB_rr      1111 1000 0001 .... .... 000000 .. ....      @ldst_rr
   }
 }
 {
   {
-    NOP          1111 1000 -011 1111 1111 ------------        # PLD
+    PLD          1111 1000 -011 1111 1111 ------------        # (literal)
     LDRH_ri      1111 1000 .011 1111 .... ............        @ldst_ri_lit
   }
   {
-    NOP          1111 1000 1011 ---- 1111 ------------        # PLDW
+    PLDW         1111 1000 1011 ---- 1111 ------------        # (immediate T1)
     LDRH_ri      1111 1000 1011 .... .... ............        @ldst_ri_pos
   }
   LDRH_ri        1111 1000 0011 .... .... 1..1 ........       @ldst_ri_idx
   {
-    NOP          1111 1000 0011 ---- 1111 1100 --------       # PLDW
+    PLDW         1111 1000 0011 ---- 1111 1100 --------       # (immediate T2)
     LDRH_ri      1111 1000 0011 .... .... 1100 ........       @ldst_ri_neg
   }
   LDRHT_ri       1111 1000 0011 .... .... 1110 ........       @ldst_ri_unp
   {
-    NOP          1111 1000 0011 ---- 1111 000000 -- ----      # PLDW
+    PLDW         1111 1000 0011 ---- 1111 000000 -- ----      # (register)
     LDRH_rr      1111 1000 0011 .... .... 000000 .. ....      @ldst_rr
   }
 }
@@ -504,24 +504,23 @@ STR_ri           1111 1000 1100 .... .... ............        @ldst_ri_pos
   LDRT_ri        1111 1000 0101 .... .... 1110 ........       @ldst_ri_unp
   LDR_rr         1111 1000 0101 .... .... 000000 .. ....      @ldst_rr
 }
-# NOPs here are PLI.
 {
   {
-    NOP          1111 1001 -001 1111 1111 ------------
+    PLI          1111 1001 -001 1111 1111 ------------        # (literal T3)
     LDRSB_ri     1111 1001 .001 1111 .... ............        @ldst_ri_lit
   }
   {
-    NOP          1111 1001 1001 ---- 1111 ------------
+    PLI          1111 1001 1001 ---- 1111 ------------        # (immediate T1)
     LDRSB_ri     1111 1001 1001 .... .... ............        @ldst_ri_pos
   }
   LDRSB_ri       1111 1001 0001 .... .... 1..1 ........       @ldst_ri_idx
   {
-    NOP          1111 1001 0001 ---- 1111 1100 --------
+    PLI          1111 1001 0001 ---- 1111 1100 --------       # (immediate T2)
     LDRSB_ri     1111 1001 0001 .... .... 1100 ........       @ldst_ri_neg
   }
   LDRSBT_ri      1111 1001 0001 .... .... 1110 ........       @ldst_ri_unp
   {
-    NOP          1111 1001 0001 ---- 1111 000000 -- ----
+    PLI          1111 1001 0001 ---- 1111 000000 -- ----      # (register)
     LDRSB_rr     1111 1001 0001 .... .... 000000 .. ....      @ldst_rr
   }
 }
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index d605e10f11..187eacffd9 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -8765,12 +8765,12 @@ static bool trans_PLD(DisasContext *s, arg_PLD *a)
     return ENABLE_ARCH_5TE;
 }
 
-static bool trans_PLDW(DisasContext *s, arg_PLD *a)
+static bool trans_PLDW(DisasContext *s, arg_PLDW *a)
 {
     return arm_dc_feature(s, ARM_FEATURE_V7MP);
 }
 
-static bool trans_PLI(DisasContext *s, arg_PLD *a)
+static bool trans_PLI(DisasContext *s, arg_PLI *a)
 {
     return ENABLE_ARCH_7;
 }
-- 
2.34.1

