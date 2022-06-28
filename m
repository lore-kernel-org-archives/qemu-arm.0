Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2890127lft;
        Mon, 27 Jun 2022 21:38:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vILCKGMNdoHhJcKTNfbFV9Iv20BFstXD4XZh9EWdI5tiHno1BXU8jnqdkcNUzVTFaxLBbU
X-Received: by 2002:ae9:f40b:0:b0:6ae:fdd7:1939 with SMTP id y11-20020ae9f40b000000b006aefdd71939mr10624754qkl.657.1656391137110;
        Mon, 27 Jun 2022 21:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656391137; cv=none;
        d=google.com; s=arc-20160816;
        b=mGJTlAbqFzNTZWUYr+JswJXe7bfgvIBg8wRSwgIDJu9e6zoX5J8wWqP/PNHjHVyNSa
         iLV+4ozzox0ZOlf7R2hDkZcZfpPh6VgCv89P5Qgdf98RymtjEhv6OhKHVR4Ud8P42KgF
         rVzRjDoP7BH1vCDNmLELsOE2ZrxRbjG4u8DY1m4jdAO7u8npWcjaQfPobYnIpU5u9eCp
         xLK04muS5Xmy3pHmHCgOiXEY8ZodY9wM82MdlffJ7H+u3wppfVJiHoUcArQILRh1hdoG
         Dpq0dSaiunPGqyH4DD1y8vJyHHH5OQJI+JOsNoR+56RGIv0TpXcMtUrHq7JdOscmOa2g
         PEwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LkdgUQ+JvOvBJ2qAkFuSD3rXAe1IkZmBYBBm8jukjA4=;
        b=rgPuA+Gegqc8/rTkocqCdZ07U75JVLaSXSg4BdaqCyi49YO7wWd8s6mUJjZ1urEJqn
         r+tuzShrmqdzxJB6zhCVUDlfqBl6xzxD+kbwkrYv5t5yx2YGlkq+VUbYTBJ4RkTiEBdO
         /7erZeK0fZbel2pVES1elu0S8dli6pdMxtD3x88llnpCoq71zV8ANQp16i2Xta3f99gz
         PFlnHZdNSIKqbZ0HyvsasPnx+MluOjgkqNzuT7zau6fc2xYxRcZab750Dza6FSgUqRsN
         EBFbPxUp7SP15AjwX1KKYO2xr9nZ1TIYgEH93+ypUfsiiWNpwl46aYT2+Py83Y+cHTHu
         3AcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QbggUhIk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g8-20020a05620a40c800b006a6ccaece60si7541134qko.637.2022.06.27.21.38.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:38:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QbggUhIk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6304-0002Jy-I5
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jX-0001dX-0y
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:51 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:35335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jU-0003hK-Mt
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:50 -0400
Received: by mail-pg1-x535.google.com with SMTP id r66so11029725pgr.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LkdgUQ+JvOvBJ2qAkFuSD3rXAe1IkZmBYBBm8jukjA4=;
 b=QbggUhIktc0UPG9RF7U2SEGR4WhLywA5SjCbibXV+ZHv2ay0YJEVb06xg7sW0BKFr1
 Bshux9D3k419xa3WJdYsCXkFVxw5/L0Aeuh1lwvd3QC+D40AUIBCEOQSZuiLizuu6j1h
 4YTCDKLMWQVqkX972L4rcT4KJgofLbwZWEE1YHZ/ELBQSBU0Kg8njfMAchkn8qhnMf1H
 PU+WI7Lja9MqjBiYX11J5P5YXrme7KckpILfis/4dx+5wS68LkFlAMSTqtNsNC5e4HAc
 gRmzg414/YlGTIleOkTNbqLu9gIxdcbXgtYe8SsifdC94wWlZ6FS1NF2QT+1CZW57mw6
 HglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LkdgUQ+JvOvBJ2qAkFuSD3rXAe1IkZmBYBBm8jukjA4=;
 b=vg1uAT5gj/Vuo4RC695iCivE8DtXrWpz6wJS7ggnp+OIEQoWaxxjT23+lrcZuCwb0Z
 +6NKFHuARDvP34AtF4n8GuLxDAh+qYn20dQWGAdJ8ovWs3M0omeZNFOtHlcyasYh1bE5
 RXtHIjGbQQf0Fu1H24KGvuaH7+CvXae955bl92wQnc0Xi1xVhipxqbFaxSjssWQP40P4
 X2kfno10cnlgRQIkz3DFK0ABP4vGkPwxgnWC3kgZCEoLhcrlUnzAIprrEgZ3yHDdNT57
 0gW05AdKTsk7qQl2y39Q3Bu6wtUHX0TQuv9MiI954j8tgRTECt1ggVszoDfZgI+pfNsU
 EQvg==
X-Gm-Message-State: AJIora9Nde/1Otbm1CcZwUQyG9nlPb2W3mL+uTY5O88WTAh9oZDth0+I
 yezY4QVn/ZipTugSM78XVx7Nzw==
X-Received: by 2002:a63:2b8c:0:b0:3fe:2062:c14b with SMTP id
 r134-20020a632b8c000000b003fe2062c14bmr15655533pgr.345.1656390107477; 
 Mon, 27 Jun 2022 21:21:47 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 11/45] target/arm: Mark gather/scatter load/store as
 non-streaming
Date: Tue, 28 Jun 2022 09:50:43 +0530
Message-Id: <20220628042117.368549-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
X-TUID: 7EBD36n/etTp

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode | 9 ---------
 target/arm/translate-sve.c | 6 ++++++
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 4683850fa5..711636ed30 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -58,19 +58,10 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    1000 010- -00- ---- 10-- ---- ---- ----   # SVE2 32-bit gather NT load (vector+scalar)
 FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
 FAIL    1000 0100 0-1- ---- 0--- ---- ---- ----   # SVE 32-bit gather prefetch (scalar+vector)
-FAIL    1000 010- -01- ---- 1--- ---- ---- ----   # SVE 32-bit gather load (vector+imm)
-FAIL    1000 0100 0-0- ---- 0--- ---- ---- ----   # SVE 32-bit gather load byte (scalar+vector)
-FAIL    1000 0100 1--- ---- 0--- ---- ---- ----   # SVE 32-bit gather load half (scalar+vector)
-FAIL    1000 0101 0--- ---- 0--- ---- ---- ----   # SVE 32-bit gather load word (scalar+vector)
 FAIL    1010 010- ---- ---- 011- ---- ---- ----   # SVE contiguous FF load (scalar+scalar)
 FAIL    1010 010- ---1 ---- 101- ---- ---- ----   # SVE contiguous NF load (scalar+imm)
 FAIL    1010 010- -10- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
 FAIL    1010 010- -100 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
 FAIL    1100 010- ---- ---- ---- ---- ---- ----   # SVE 64-bit gather load/prefetch
-FAIL    1110 010- -00- ---- 001- ---- ---- ----   # SVE2 64-bit scatter NT store (vector+scalar)
-FAIL    1110 010- -10- ---- 001- ---- ---- ----   # SVE2 32-bit scatter NT store (vector+scalar)
-FAIL    1110 010- ---- ---- 1-0- ---- ---- ----   # SVE scatter store (scalar+32-bit vector)
-FAIL    1110 010- ---- ---- 101- ---- ---- ----   # SVE scatter store (misc)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4c28cc9200..a50b2f485b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5669,6 +5669,7 @@ static bool trans_LD1_zprz(DisasContext *s, arg_LD1_zprz *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (!sve_access_check(s)) {
         return true;
     }
@@ -5700,6 +5701,7 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (!sve_access_check(s)) {
         return true;
     }
@@ -5734,6 +5736,7 @@ static bool trans_LDNT1_zprz(DisasContext *s, arg_LD1_zprz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (!sve_access_check(s)) {
         return true;
     }
@@ -5857,6 +5860,7 @@ static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (!sve_access_check(s)) {
         return true;
     }
@@ -5887,6 +5891,7 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
     if (!dc_isar_feature(aa64_sve, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (!sve_access_check(s)) {
         return true;
     }
@@ -5921,6 +5926,7 @@ static bool trans_STNT1_zprz(DisasContext *s, arg_ST1_zprz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
+    s->is_nonstreaming = true;
     if (!sve_access_check(s)) {
         return true;
     }
-- 
2.34.1

