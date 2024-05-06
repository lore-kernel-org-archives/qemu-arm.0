Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1272785ejc;
        Sun, 5 May 2024 18:14:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsxtY3+mvq73LUEhDa+p9OQOeGr6vVQ+s69/VpjIDpebbqQivqZjOX5PIDSC7uYvL+kDjOI52Ecc3Ilya3X7gdEQhTtRHY
X-Google-Smtp-Source: AGHT+IHidepx+eZXCNH5JRXYt6/7HwyY7W1ioiBvKVAM14KfHDUEn+LOdzyArbmu1nYFR7lTxCrL
X-Received: by 2002:ac8:5954:0:b0:43c:606e:c9bc with SMTP id 20-20020ac85954000000b0043c606ec9bcmr9366537qtz.10.1714958047638;
        Sun, 05 May 2024 18:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714958047; cv=none;
        d=google.com; s=arc-20160816;
        b=hVyQ0vvewY57TR5VDCWFmxJsTKKosxQ28+4DZPgJFZxOwWlVY3VGgW4VPwB6icrdo0
         FMRZoVuE8V6ZTHzpteHD0qSkvBSJ82kqOW0nQ7okArGgudnU5f06qaxxYjbLk02oYYhR
         eCDscV/BP1uLqbd88759K41/Aq+/Aa3t9W0zP3Oe1UAUX1gR2/wgOExr8FoqOE6GmQ/n
         gAkDFISMsxxVNImjlH3T7w0OxPlOxXMgSUMZ76c178EgxKerAVB6PkPGpSs4q5uwpKrR
         CZqu6zDSw84YaCR0E94iw9rfjo5wYI/FoYioVPK9rW93cFBE7+JSjG7Ql8D8IWLSzAcE
         643w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=opsbeM2raunxCajavxAMAhO8CHOlNCLI/4hm0OSSpr8=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=Z9FJo/yLdT22CejPuhFVQPnxXv37s2hExPMqt3ijK6ea0xk+O0+lfAFwVL1WZfdTZU
         lnz+1MFC+YohB2qw0pXEo03Ge09aL40Y2Cmuq0OpCbqcP6kjCKO/WupHQ9zNkCT/lVrO
         gi+xzJ3KMofyHGGLX47oYvXWKML1edfHVQNt8ozpYk4Ph7OqvUAPtsLfdOoSExwVLU38
         ygfat+T0xv3w9/w+DW2ZWKAKVMrU8yn4BuIuZjqBD8fudPQB/9vuysEpm38bpSctQsoD
         09OfdRL0j0K0XMaRO9P6T4GNFw5DHJBdc6dIozsOAmD9OQZQi6ikJJ51nmfz7BBr8TFU
         FGiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fS1ZdGKj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20-20020a05622a131400b0043adc860f74si8471179qtk.628.2024.05.05.18.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:14:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fS1ZdGKj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s3mqb-0003SA-U5; Sun, 05 May 2024 21:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpe-0007ej-DR
 for qemu-devel@nongnu.org; Sun, 05 May 2024 21:07:54 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpU-0003Lf-3y
 for qemu-devel@nongnu.org; Sun, 05 May 2024 21:07:53 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-23f0d54c5ffso808031fac.1
 for <qemu-devel@nongnu.org>; Sun, 05 May 2024 18:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957662; x=1715562462; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=opsbeM2raunxCajavxAMAhO8CHOlNCLI/4hm0OSSpr8=;
 b=fS1ZdGKjh4URMVeZ13xdEdsjUwFUwes0VHuLneF1oiNPg3OsMy1Gty+AuVWhxpM5uU
 5rGHKyT7TR7teH5yTbgXpWWjLdrO6MKoA2HidiB/wGhdSsynS/2t4ZWgWjn2Yl0ImglD
 1S2KyYjvynGNveRQL/VYq67XAXaLWBvmnl4ulhauKqls3jXPtBUd8tJgd7pdy+oK81t+
 yV+5lcpAQ7KYWNLSJQUjbhBsKeO8109uAdEpLBWKOGLLOR1UkcYSGdTPZzAHZku1pNyu
 ChXrStbZQHngCuPcePkrHnZijWRg+q2UXzF4nrGgMqrK/CDIQpjgQa534OM5Y49Z4rkc
 zWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957662; x=1715562462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=opsbeM2raunxCajavxAMAhO8CHOlNCLI/4hm0OSSpr8=;
 b=wG3pnO9261+dYEXaapZ+3JXfD6yMqaEJTs1UYjarYcRPJvxZK2/u5p9l9EjMWOTa0L
 +icy08fsfgHTfAp5pDiwTHOXESC4ad7cSiXMUU2XYt3uibiAUcie1ELnr8r8mPmw4in0
 6Hh6LCvdHn2PWHf+ce0yY6ZOVjjEZeqpSL9AH68vhG9GxKBotv8tT7RfUb1KqaWUV8IQ
 hAKumZI2t/D3FH6Ozuo0aMkBUuN5xWSD+r4gpRGmhzJHaExmVCf0f/Q2H+cRD1nDafzq
 H85qnqzCfVQkhv+3FUGjQD1zhMi72NDEb28P5ioXILO+3taUsZXWkBbpKqZ7s9JHZigw
 OZnQ==
X-Gm-Message-State: AOJu0YzWGCRotHU7JqiCXmj7arUej17BPsvEz6LznrHsLSXUJOUofxhC
 6NgLY6w77Cyf7QUppO/0Uo992JReO4CDmDlo0Rrx8CEm0QC1+JZ/Sy50tNIy/a2wwhNAWpwoF5O
 Z
X-Received: by 2002:a05:6870:d214:b0:23d:4207:235f with SMTP id
 g20-20020a056870d21400b0023d4207235fmr10166326oac.52.1714957662698; 
 Sun, 05 May 2024 18:07:42 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 kp4-20020a056a00464400b006e580678dfbsm6577287pfb.193.2024.05.05.18.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:07:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 45/57] target/arm: Use TCG_COND_TSTNE in gen_cmtst_{i32,i64}
Date: Sun,  5 May 2024 18:03:51 -0700
Message-Id: <20240506010403.6204-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2f.google.com
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
X-TUID: wkIzEMVFEVNy

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/gengvec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 51e66ccf5f..1d6bc6021d 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -933,14 +933,12 @@ void gen_gvec_mls(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
 /* CMTST : test is "if (X & Y != 0)". */
 static void gen_cmtst_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
 {
-    tcg_gen_and_i32(d, a, b);
-    tcg_gen_negsetcond_i32(TCG_COND_NE, d, d, tcg_constant_i32(0));
+    tcg_gen_negsetcond_i32(TCG_COND_TSTNE, d, a, b);
 }
 
 void gen_cmtst_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b)
 {
-    tcg_gen_and_i64(d, a, b);
-    tcg_gen_negsetcond_i64(TCG_COND_NE, d, d, tcg_constant_i64(0));
+    tcg_gen_negsetcond_i64(TCG_COND_TSTNE, d, a, b);
 }
 
 static void gen_cmtst_vec(unsigned vece, TCGv_vec d, TCGv_vec a, TCGv_vec b)
-- 
2.34.1

