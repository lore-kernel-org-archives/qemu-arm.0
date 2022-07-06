Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4548584lft;
        Wed, 6 Jul 2022 01:53:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1snQrhKnVO8Tg1gF8sxEfW1zz6e7eAZDRAoQTCndXZfHI0PEPWor+mGLm/5B9GokxA39Boz
X-Received: by 2002:ac8:5c47:0:b0:31d:347d:d621 with SMTP id j7-20020ac85c47000000b0031d347dd621mr23818812qtj.524.1657097620435;
        Wed, 06 Jul 2022 01:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657097620; cv=none;
        d=google.com; s=arc-20160816;
        b=a07lcESDK/QQeCcqNc3HUGxJCTJwk5rwXyPm92Wzd26J/sGDs9fClF6RkVc8ZGz7ks
         7I7G3h63QeU9DYCqrL9Q4aK2WP1W11YBVfiDSnuxqC1KzfIAibt0KKALe7t5D+WATO8I
         4afrHuT1+y77xPuz4l6skxSSelGCo17j0CxwO8q+V2t5B+C1eCMgCM8hz+Cy8WYcN5BZ
         yKAQqZ1sIC4t2JCeKT7V9xTrwHN7D2/AV1kYddc6WK4OfeUnXp73qsBXbbprhs72uF2n
         gC5xcppaD2ZAdfpZjcEU9vXBe8Om0tigqCdRjTVwbDNJdAZy8NV/qezrctPo9q6LIXKy
         lEMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pHHLspKH8W4B5YilQ8WrGPBQ+uTIDLVeEbSmBurKp7U=;
        b=ilTVplHfDdCejE2JyRJcvQ6Xnx9Yup59AIbVz2J6jzvP3zUfQGnIlCcQ4T3Yw1fN9n
         z/fmBMpSWuXSTZsJCI29n5S5jXDJC37eBhB+tI2gO/Nu6tl9sXjfaF8FtG7BtpV32+C5
         28Y9aN1a9jiKKR4c6oIl9xc9ns7gegNaz5N32IE0L0nvM7nonReklhAT2VN6k5uIzmjD
         b8zw6ae9CW7XZGjSJeZ/K+0/PIVrjQ7jKjV2m5EGv+GUwmeUUd0tJ7xYOrVfOyNoBqeh
         bGU3Nnmy4LprSu1KVq01Pe2Cro0GxKKICyYIk19z3DS33Ncxk5INczzmTjg1FqzxRh06
         zLcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oo9DHuJf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12-20020ac8014c000000b00304bf77a97csi20267798qtg.243.2022.07.06.01.53.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 01:53:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oo9DHuJf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o90mx-0004WS-RJ
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 04:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Km-0005kR-PV
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:24:34 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:40584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kk-0000Lg-Pp
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:24:32 -0400
Received: by mail-pl1-x632.google.com with SMTP id b2so13043596plx.7
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pHHLspKH8W4B5YilQ8WrGPBQ+uTIDLVeEbSmBurKp7U=;
 b=Oo9DHuJfnnmzmLrvY3NJdC9VCgy5EBfaZ0G71Cnqd4YOtS5S3Ah0mUvvuxyc+aTRq0
 mmn1Cgv9zEuSRPvxTdQUZo5SZiNlbTaN+rP7y5IGJC37yCyB6e23Jp3Xe6u5PJEltoT4
 9TQVsThDooV9fzpqRtr+Hn7D9fsre1H4XeQSTYzKG9EsE1EaWqEK8LW2UzNerAf6hqxI
 6EeNvr4uSmAm25eHVphZNjuj8zoOLcv/Cz5u2AoY9k7yhFojAWZOB5zDFdYtiKkyc01t
 GdCEDMD+mbbfHLmnZ6YcefGzxq+tq0clQuNm4ZnS8rPG9CaWnF5nxoRsBzPFkhGtmZrh
 F6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pHHLspKH8W4B5YilQ8WrGPBQ+uTIDLVeEbSmBurKp7U=;
 b=shj31bvEJS2Qz0gvmHwygyFFKbXu52wqQyDN1bY3XNlNuRaX1DjDfEnHJReUrW3m6A
 3Zv1n3tc7Zbo0Dtbro8s0YJMr5neA39k168YHJo19GBE65J9BmUjeNcrHDCNMn+MTl8Q
 mJBcGHl4L1lTNH1yfkNwAOfrB+S2f490dAUKm25Skd2ZEc0Pt6SVIofSBPcs1OXi86im
 WWW1YlZQvCBiCrmQ0GNCa5IlQjtLheYRR6qVm+b7sZ0ZSy4UgIUmiNPt4meAU/H8yV+F
 6wFZnHWOEw+CepL/+vkhKSC8ClOjODeqKI5NIUCx/PSOlI6JlHenchJyLPNaj/xRNo26
 40iw==
X-Gm-Message-State: AJIora+C2sJJDwArNVWztZO3QvxajTu5LxFF2KZYEqbMjLyW/wO2hpo5
 MQG38/EppSjFyNXkp/rYG4guBSAvUpaNOml1
X-Received: by 2002:a17:902:c948:b0:16a:58f4:c142 with SMTP id
 i8-20020a170902c94800b0016a58f4c142mr46645631pla.103.1657095869446; 
 Wed, 06 Jul 2022 01:24:29 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 05/45] target/arm: Mark RDFFR, WRFFR,
 SETFFR as non-streaming
Date: Wed,  6 Jul 2022 13:53:31 +0530
Message-Id: <20220706082411.1664825-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: WFC7XhBK869V

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode | 2 --
 target/arm/translate-sve.c | 9 ++++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 73c71abc46..fa2b5cbf1a 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -61,8 +61,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 
 FAIL    0000 0100 --1- ---- 1011 -0-- ---- ----   # FTSSEL, FEXPA
 FAIL    0000 0101 --10 0001 100- ---- ---- ----   # COMPACT
-FAIL    0010 0101 --01 100- 1111 000- ---0 ----   # RDFFR, RDFFRS
-FAIL    0010 0101 --10 1--- 1001 ---- ---- ----   # WRFFR, SETFFR
 FAIL    0100 0101 --0- ---- 1011 ---- ---- ----   # BDEP, BEXT, BGRP
 FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
 FAIL    0110 0100 --1- ---- 1110 01-- ---- ----   # FMMLA, BFMMLA
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5d1db0d3ff..d6faec15fe 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1785,7 +1785,8 @@ static bool do_predset(DisasContext *s, int esz, int rd, int pat, bool setflag)
 TRANS_FEAT(PTRUE, aa64_sve, do_predset, a->esz, a->rd, a->pat, a->s)
 
 /* Note pat == 31 is #all, to set all elements.  */
-TRANS_FEAT(SETFFR, aa64_sve, do_predset, 0, FFR_PRED_NUM, 31, false)
+TRANS_FEAT_NONSTREAMING(SETFFR, aa64_sve,
+                        do_predset, 0, FFR_PRED_NUM, 31, false)
 
 /* Note pat == 32 is #unimp, to set no elements.  */
 TRANS_FEAT(PFALSE, aa64_sve, do_predset, 0, a->rd, 32, false)
@@ -1799,11 +1800,13 @@ static bool trans_RDFFR_p(DisasContext *s, arg_RDFFR_p *a)
         .rd = a->rd, .pg = a->pg, .s = a->s,
         .rn = FFR_PRED_NUM, .rm = FFR_PRED_NUM,
     };
+
+    s->is_nonstreaming = true;
     return trans_AND_pppp(s, &alt_a);
 }
 
-TRANS_FEAT(RDFFR, aa64_sve, do_mov_p, a->rd, FFR_PRED_NUM)
-TRANS_FEAT(WRFFR, aa64_sve, do_mov_p, FFR_PRED_NUM, a->rn)
+TRANS_FEAT_NONSTREAMING(RDFFR, aa64_sve, do_mov_p, a->rd, FFR_PRED_NUM)
+TRANS_FEAT_NONSTREAMING(WRFFR, aa64_sve, do_mov_p, FFR_PRED_NUM, a->rn)
 
 static bool do_pfirst_pnext(DisasContext *s, arg_rr_esz *a,
                             void (*gen_fn)(TCGv_i32, TCGv_ptr,
-- 
2.34.1

