Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4548482lft;
        Wed, 6 Jul 2022 01:53:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vTFnETXosGKaPS7PlXenGfeiC6CYmpXq3evNctOOIClhTSSEI5YijU8aeurk3Oj+RVM9Cv
X-Received: by 2002:a37:416:0:b0:6ae:ea2e:c82c with SMTP id 22-20020a370416000000b006aeea2ec82cmr26126168qke.273.1657097607227;
        Wed, 06 Jul 2022 01:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657097607; cv=none;
        d=google.com; s=arc-20160816;
        b=wC2TcVEkpPFXOjr9ED2u+brR67ZLCo/JvkFypLbYFhNmqydSvj71GwOCwAFqSyx75E
         IfgtEP3go2e8qT8MKy4hHcQJzf4nOHyiXYtesY6/3gc4SJK1wU6b3CsgodzoU3frhd6d
         FbUzo2475pUma65b7tjVjt2spzdCT2Uauk+5Rz184JjzieNWWF7KPXv6He7ed0zv3e2b
         EQgK7kMcEq9aVNIJjntJkBkLmxK5IdGWH4wcaSYTZlFYJ7KuZnX9ulsY+apsCymHHems
         NgqP6/SpuJPPevv9yALmFUHF4MmHSrNZdbIOWSb25BlPg8hYMLrhq1x80otiSi/d2Jxg
         QLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4m+iHIMfbnBsMZ3ri5BagDQ5TJ6WuhbAqlKM6iP5vPw=;
        b=vAoNCUmKwjC5ju1vmGJ7FzSTYB2gigO9rjo9a4iiKFRZjwWMd7j+Cb45kJpoIeF4Nw
         N76z+UpgSL7JgzRAeGZCdr1nI7AgmG6+aiuDyvWeVOvwUv5+joWtglYRq+i9Cg8RWLUN
         qh3vO0O8+je8OeptVI9VtWmEDu+z3CMcTc0OiGU32wqTgCgPjftXcNqdA/ZqT6rug746
         XvEa4E1MqdEH3LGVZAnpMmPhKlHa00ewU+HlTYL/Wx4novWWUh52STMoi0dOAbE4wD1q
         JcvalujOtY5OeZGMOrbXV9QpU0qj8KJWTIWQx8fkmurb6EhB6/+Sgut4im1HEiWSXHbi
         BPzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gmUGO8lN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv13-20020a05622a4a0d00b0031d482768fdsi5563732qtb.271.2022.07.06.01.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 01:53:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gmUGO8lN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o90mk-0002uH-Nm
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 04:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kx-0005qR-IV
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:43 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:38813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Ki-0000K7-Pk
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:42 -0400
Received: by mail-pf1-x436.google.com with SMTP id o12so177249pfp.5
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4m+iHIMfbnBsMZ3ri5BagDQ5TJ6WuhbAqlKM6iP5vPw=;
 b=gmUGO8lNlUELF1oZuswjvef4QQbNXesY+rsivVKC8J0kOSBmoWyF8dfcYvnJCXKnbs
 EsK2pANf67PN0wGHFRGqkfKrrq3DzyvAYJNwe790ayNpyjydOcPS7yHXdHa6ybagwj+C
 I121pXwUUSRchIb0ovQuM6ni4//N2AQG3nP7KOGgX6VAV4VEzHu4XGrUcDCBI9h78SIM
 pVBTO8ehjrGNr0SR8S3bs5GZDZmZcVcDOlNhNhZmYZXWY/4fY23QhpiFKI2tGOsRta6+
 CrTXhakTSdLbsZfWxUIba5q648kyQxzO5rSkuPknT+Kx61K6Yg5GUwSj17+GAiCqC5xH
 g80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4m+iHIMfbnBsMZ3ri5BagDQ5TJ6WuhbAqlKM6iP5vPw=;
 b=xCcxNcKfphvF9ytXngfv/SeQ/TV+L+y2iQzuVVMKBesNqngTQqzI9d3COha1wP8Bji
 H4c0PZqaMD5XBLf+Ufi51FzXZytykpGwNpSF/o9lUVV0wDantPZfPktnUDqQDAtVCerU
 h0IZoPGMurWel6wi7UCmcVGm7IY0Pxcrmnxuw3Ki5RGzOemrXYQIufG4wYzVmTtB3ylC
 JLNGTlYwkU0tOZgY7Kcdibg7ejve/xCyX0HwOvc0NJF4ZqJaHsgvkZW6xD6KYw/pum4c
 i1yG5BzV9X3MpWI2qzWIBD/2sy6dvGKb9QV5wFqmZzZMwrvRQrZgmPbAzGr4FWFlvfaz
 lEUw==
X-Gm-Message-State: AJIora/vfiYHkiWBD4lCoV7UhPHmRGyRRWPfZlK10pUfPuw3lBZN6//V
 2D4SE59hQNkFHzFvqdxjatn8ZzQUMkdkv7+f
X-Received: by 2002:a05:6a00:1592:b0:525:52ca:bee6 with SMTP id
 u18-20020a056a00159200b0052552cabee6mr45403178pfk.38.1657095866531; 
 Wed, 06 Jul 2022 01:24:26 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 04/45] target/arm: Mark ADR as non-streaming
Date: Wed,  6 Jul 2022 13:53:30 +0530
Message-Id: <20220706082411.1664825-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dpvgzALShJ6d

Mark ADR as a non-streaming instruction, which should trap
if full a64 support is not enabled in streaming mode.

Removing entries from sme-fa64.decode is an easy way to see
what remains to be done.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 7 +++++++
 target/arm/sme-fa64.decode | 1 -
 target/arm/translate-sve.c | 8 ++++----
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index cbc907c751..e2e619dab2 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -566,4 +566,11 @@ uint64_t asimd_imm_const(uint32_t imm, int cmode, int op);
     static bool trans_##NAME(DisasContext *s, arg_##NAME *a) \
     { return dc_isar_feature(FEAT, s) && FUNC(s, __VA_ARGS__); }
 
+#define TRANS_FEAT_NONSTREAMING(NAME, FEAT, FUNC, ...)            \
+    static bool trans_##NAME(DisasContext *s, arg_##NAME *a)      \
+    {                                                             \
+        s->is_nonstreaming = true;                                \
+        return dc_isar_feature(FEAT, s) && FUNC(s, __VA_ARGS__);  \
+    }
+
 #endif /* TARGET_ARM_TRANSLATE_H */
diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 3d90837fc7..73c71abc46 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,7 +59,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0000 0100 --1- ---- 1010 ---- ---- ----   # ADR
 FAIL    0000 0100 --1- ---- 1011 -0-- ---- ----   # FTSSEL, FEXPA
 FAIL    0000 0101 --10 0001 100- ---- ---- ----   # COMPACT
 FAIL    0010 0101 --01 100- 1111 000- ---0 ----   # RDFFR, RDFFRS
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 62b5f3040c..5d1db0d3ff 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1320,10 +1320,10 @@ static bool do_adr(DisasContext *s, arg_rrri *a, gen_helper_gvec_3 *fn)
     return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, a->imm);
 }
 
-TRANS_FEAT(ADR_p32, aa64_sve, do_adr, a, gen_helper_sve_adr_p32)
-TRANS_FEAT(ADR_p64, aa64_sve, do_adr, a, gen_helper_sve_adr_p64)
-TRANS_FEAT(ADR_s32, aa64_sve, do_adr, a, gen_helper_sve_adr_s32)
-TRANS_FEAT(ADR_u32, aa64_sve, do_adr, a, gen_helper_sve_adr_u32)
+TRANS_FEAT_NONSTREAMING(ADR_p32, aa64_sve, do_adr, a, gen_helper_sve_adr_p32)
+TRANS_FEAT_NONSTREAMING(ADR_p64, aa64_sve, do_adr, a, gen_helper_sve_adr_p64)
+TRANS_FEAT_NONSTREAMING(ADR_s32, aa64_sve, do_adr, a, gen_helper_sve_adr_s32)
+TRANS_FEAT_NONSTREAMING(ADR_u32, aa64_sve, do_adr, a, gen_helper_sve_adr_u32)
 
 /*
  *** SVE Integer Misc - Unpredicated Group
-- 
2.34.1

