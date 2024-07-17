Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp614908njk;
        Tue, 16 Jul 2024 23:09:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8N7eK8tbLa9ddkDAJGfkaQ7XmOx8TpDVaN2iZ20GXQS+S/2vmd8ETgk4LSKSVNAiZNgprp3un7eAAZwb/qm1f9YvEG9ZN
X-Google-Smtp-Source: AGHT+IG3Gd3DaKXq7oxzdfNxvgGtKZad8mJNZcduOCZKn8awdLB20pL3KBCWHk+HbOLmo/24Dy4b
X-Received: by 2002:a05:6214:1310:b0:6b7:4712:c878 with SMTP id 6a1803df08f44-6b78e40efdcmr10306566d6.41.1721196598348;
        Tue, 16 Jul 2024 23:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196598; cv=none;
        d=google.com; s=arc-20160816;
        b=KAq3XZc0ncKjBotc2ranJ3mAPXjCOoCe0cShkMyWaLyWEGJvRvcPyIwVa5kLNzrH1y
         9eKdfBfjoUSwNtEeHmXiD35LCD7XZ3yRgpkbN9K6fqhXuHS0l6SWJ8+QP2LBlG8jA7/F
         X/BSmBf+McrnzDHel6OdhEa1h0LLp6MbtAtP7wtilt2xtCIqrfrCSokjGcnqz2O/4BUX
         6Nwkccta1WHDMl2cfX4IWosP4UcyQobvX9YccW0w+RGWYqgIt+T3ubJyro+RgtWxqOBE
         K5vwSwd0XND0x3xGzdhSkxaqHb8a8ktnAeVxsBykU4L03XRXux9UeOXlaALya9v1Ft2Y
         JQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KWgoYLfzMnfDNpgTk3QgWKgKCgGOVK31L1W5B2Ww47g=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=KGYRSEfxQBGu8kgPsJc33O1FpJgMFiL+tmYih05Z+qg3DK6i1fhmN7XcQQysshm+jw
         Gv9fhC09kat9Bz1eZvxQIG3krLLmuW1lDI1MbmlukQEQ0Aqth+0CxNbZr+aM0ZwVULZK
         MBT/phBo4wttLFsOkBZpu/VgGYEMnS3C+vaqarwXkTipT3Qxz09aJYGBJQet6yZKBzMU
         R0HQZACSvU0DiPFSJq6JB1pz8nQuY2n6rPaKHW9RRLXzEaRDL2knjoFhX5WPFI7mcgMi
         A5Ed8Dbv0mKYIZptS0EkWHsvp2yzYiekk4floJMe2ddXp0d4mSCoAtZPhHHo9mi1nz/9
         8GHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=veWzBQxD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b78efd7d51si5479296d6.615.2024.07.16.23.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=veWzBQxD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sTxqs-0003h6-M5; Wed, 17 Jul 2024 02:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxqn-0003b0-SF
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 02:09:17 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxqm-0002zv-7b
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 02:09:17 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-70af4868d3dso4867572b3a.3
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2024 23:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721196553; x=1721801353; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KWgoYLfzMnfDNpgTk3QgWKgKCgGOVK31L1W5B2Ww47g=;
 b=veWzBQxD0YVDv6FJjCz+6Ju1yJ99iN2ZlHVsffzKZNgi33aRdisbUzD7Lo6uWWlxO5
 mDycysinnE9PAjS5PMVmAs4vS2OLQL9A/wxxQ/ncduje1RMxZEqejurQ7qXAyBCRbk9z
 ME5apeYRetdh/PxJkBO44BrGMfnTbS+23HoUV9OTAAmLl1oJOBxRIX27byoWEe3gQpm1
 AoJB+WkTVfrIWsA+nNEEzGb5kMzlGUnx0TowSOI47XYcZkyIWTgzbcpuG81j0906WRK2
 OIGMvSCBTTOgBvwPrBgD8yPffkA8M4QB+Xmoka8GTLVitgPUnB9v8qvGxfgqgb5qb33K
 kijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721196553; x=1721801353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KWgoYLfzMnfDNpgTk3QgWKgKCgGOVK31L1W5B2Ww47g=;
 b=dNxrX/4lDRnEnEAnCh50rugnocmdU5V2PTiuEUxMbEC+LYGMwPelkhkp/G+I2r95+G
 6G2H4ryASx4O9MqBVc/U3Go38GcUW8fx8FT3ZVLtgYOknaD2E20WrMmGb4/woQ2L6Dqg
 Gb9xVG9tNtHHSwgv849f0Za1fELyqnlVT7+2LfKu/nCi+QNNXZ6Pi6eKA2AfL3L7lQY0
 UzjGNZ6V4bkvhZrlotnebdLlcAC/EILoWwN+3ZgryCot42N3JXGT64hFd6oqryoRVKcl
 ADohph6Fcwk00imkl1o+YWMjuekmZqXdiFTn29E4kdYEHVf+KgIAWwxjhZyLx2tJd784
 ywmw==
X-Gm-Message-State: AOJu0YwFphwd0GMf4j9cSFZTGjyBBlxHZSU0L01N06R8KDvSgYq1GqRx
 d0FJBk/XsZDgqWmYhHRDB842yXAp2MvGpNrGSrak1Xv1rMHzXmk7SF6Ss90m0cbHGxkZCAU28QR
 w3HM=
X-Received: by 2002:a05:6a00:2d28:b0:704:209a:c59e with SMTP id
 d2e1a72fcca58-70ce4fb5cfdmr788811b3a.9.1721196553444; 
 Tue, 16 Jul 2024 23:09:13 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ecd603bsm7330404b3a.219.2024.07.16.23.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 23:09:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/17] target/arm: Use tcg_gen_extract2_i64 for EXT
Date: Wed, 17 Jul 2024 16:08:47 +1000
Message-ID: <20240717060903.205098-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717060903.205098-1-richard.henderson@linaro.org>
References: <20240717060903.205098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: kiv9GeSNpwZl

The extract2 tcg op performs the same operation
as the do_ext64 function.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 559a6cd799..e4c8a20f39 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8849,23 +8849,6 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
     }
 }
 
-static void do_ext64(DisasContext *s, TCGv_i64 tcg_left, TCGv_i64 tcg_right,
-                     int pos)
-{
-    /* Extract 64 bits from the middle of two concatenated 64 bit
-     * vector register slices left:right. The extracted bits start
-     * at 'pos' bits into the right (least significant) side.
-     * We return the result in tcg_right, and guarantee not to
-     * trash tcg_left.
-     */
-    TCGv_i64 tcg_tmp = tcg_temp_new_i64();
-    assert(pos > 0 && pos < 64);
-
-    tcg_gen_shri_i64(tcg_right, tcg_right, pos);
-    tcg_gen_shli_i64(tcg_tmp, tcg_left, 64 - pos);
-    tcg_gen_or_i64(tcg_right, tcg_right, tcg_tmp);
-}
-
 /* EXT
  *   31  30 29         24 23 22  21 20  16 15  14  11 10  9    5 4    0
  * +---+---+-------------+-----+---+------+---+------+---+------+------+
@@ -8903,7 +8886,7 @@ static void disas_simd_ext(DisasContext *s, uint32_t insn)
         read_vec_element(s, tcg_resl, rn, 0, MO_64);
         if (pos != 0) {
             read_vec_element(s, tcg_resh, rm, 0, MO_64);
-            do_ext64(s, tcg_resh, tcg_resl, pos);
+            tcg_gen_extract2_i64(tcg_resl, tcg_resl, tcg_resh, pos);
         }
     } else {
         TCGv_i64 tcg_hh;
@@ -8924,10 +8907,10 @@ static void disas_simd_ext(DisasContext *s, uint32_t insn)
         read_vec_element(s, tcg_resh, elt->reg, elt->elt, MO_64);
         elt++;
         if (pos != 0) {
-            do_ext64(s, tcg_resh, tcg_resl, pos);
+            tcg_gen_extract2_i64(tcg_resl, tcg_resl, tcg_resh, pos);
             tcg_hh = tcg_temp_new_i64();
             read_vec_element(s, tcg_hh, elt->reg, elt->elt, MO_64);
-            do_ext64(s, tcg_hh, tcg_resh, pos);
+            tcg_gen_extract2_i64(tcg_resh, tcg_resh, tcg_hh, pos);
         }
     }
 
-- 
2.43.0

