Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp335018lft;
        Fri, 8 Jul 2022 08:23:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tIoxGNxL3mbXauwOG8yVORMSzDL7uMCl3HeFjDo/uJ/y8WJuyGzLYPqAEjnrpdxGQSlMIG
X-Received: by 2002:a05:6214:1c88:b0:472:a7e2:bef4 with SMTP id ib8-20020a0562141c8800b00472a7e2bef4mr3236915qvb.32.1657293824326;
        Fri, 08 Jul 2022 08:23:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657293824; cv=none;
        d=google.com; s=arc-20160816;
        b=SUy+ot26td9fT1HX6t+5YrnqagY2JAr7kLEFHBM6YDVU7RBGSdUZr5r/OJRi4LtoJa
         HilaGmWF9lUhCF3jBYx6QgdyRkbr01fhXvC1TqRxYFNQkDWdd8devkU/Re/kQM/Kv763
         RRaum3dot+54g7IU+zu+KtbML2i5KiIPf7ism45Qa6cIVJ2jJz3oiUg2sBYR8CF8ewBX
         PUsYJ7VJaLVdZU6JPIxPzcg99WWQmGxywkTkdAbTUWGkj5W4wkmJx6qDd1qZmiaB/Nsp
         YC3Abq21GeU+RwuBeAj3wgvekCpiYWyo62eEiQLrvE/DRBQjcoSR6X8kzGE2dJ0aDa0X
         R7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4m+iHIMfbnBsMZ3ri5BagDQ5TJ6WuhbAqlKM6iP5vPw=;
        b=Pa6PFJIYUjECPNK4iKQPll9JYPdAIl7q3nt8XredfUMYyWv+sHqy8bvJmNr/4QeVpR
         Ixce2bHHjOIPlWrIwJ5SMbIU4zckqtidvaTivl2W3bfbqiYDG15MV6TKjFk3EYVulVpT
         3frIKeTurEynVvrpgo1aVn6Tj44KKMMg31vZ2aMPxfk/pujqHMByt7KzzUjFYUhL6eJP
         RuG5KuIpP9AxknYeNx9mua4wHB2oT+u1qADM80VjpBaBv43LhN62V7nhdCH4vyj9fY/5
         RjaNXVkn9M2th0iImbUN62z857cGm8jWbbh6SvOzlRVTwDLhuAbAwBIhO6joJefIRK8M
         UN0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nmANE5U3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v4-20020a05622a144400b0031d2a575501si18547024qtx.262.2022.07.08.08.23.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:23:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nmANE5U3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9ppX-0008JT-Oe
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pi7-00028W-8i
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:03 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pi4-00025y-Eb
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:16:02 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 v4-20020a17090abb8400b001ef966652a3so2217651pjr.4
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4m+iHIMfbnBsMZ3ri5BagDQ5TJ6WuhbAqlKM6iP5vPw=;
 b=nmANE5U35j25gFU7ETbeA1uxSVgTzLBgebsI/S2YU3LSnW6FpoIa3Lip7EFmCmycic
 I2Rrt53oH6gN40isCMojFtcDgwq74vsHj/S4yljs9fha30k5MY0L/G34BsBcbkjA2GTp
 PMmaMCTzVKs1cOHM8I4enO5WY2Po7Gz1Jam3FNgmujVCuL9IV+JURnL7gZtAXEteR+/S
 cEvyjcHoqNqNZqYea01pXAObC9A3I8ueYdDCIcOdyb4qanhAxQRwFD4QmkdqhYSVQCls
 Wj3uiFJhEMUndB06nycx9PABLaQsJGiOOm1fsQ4KOHshmwRXhF4TvxdgVtTqEhBh7dKW
 uYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4m+iHIMfbnBsMZ3ri5BagDQ5TJ6WuhbAqlKM6iP5vPw=;
 b=O2eMMM7aJTNwZwoM/PksF066Np5zfHdLoOjrPI7jin/D6lEdYrHPnADTiPwFX1Dc4f
 B8wFk6nsXBVVOvrbgT8xncWr6QEtsS8H+jXwBkTSfomC/O154equgbPO7T21TGybBTxf
 10emUmKHbnjF9yam8v3BDgIUL88aipgPMQTKlO+tBZPQf/4YuiE81WDS78RGJ9rG5T8Q
 Y+kd0l925pEB2MI6AhWJpRsLvIfsQkgQaYwBfRzPSRbMLZllrORdS7U9py0uyhpRp9rM
 W28Nmad+qS2wLoRZkFlpKSeKwA4POvinJXnby8ZaXSGU34/Ll59PyCcAyr4B5VKlPS7r
 IgOA==
X-Gm-Message-State: AJIora+ekMg0kC9EiJGyynFzwYnQVpKJjhqW/WGEF+BcVOpJRbNVuKqI
 DqWV0hU/61C7YtteOm0EJC3tJafTDKTpTdUV
X-Received: by 2002:a17:90a:fe4:b0:1ef:8564:4f4 with SMTP id
 91-20020a17090a0fe400b001ef856404f4mr382248pjz.118.1657293358766; 
 Fri, 08 Jul 2022 08:15:58 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:15:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 04/45] target/arm: Mark ADR as non-streaming
Date: Fri,  8 Jul 2022 20:44:59 +0530
Message-Id: <20220708151540.18136-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 4VOd1BNDQhYV

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

