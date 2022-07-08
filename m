Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp345703lft;
        Fri, 8 Jul 2022 08:40:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sd0txE8jNLITCtZ2/zDIihTlFoIJPh+OEhKz2l+n4dvfuFqQocwiXWoh7DcNIlZxogY8i2
X-Received: by 2002:a05:620a:29d6:b0:6af:a84:c2c3 with SMTP id s22-20020a05620a29d600b006af0a84c2c3mr2821166qkp.264.1657294851255;
        Fri, 08 Jul 2022 08:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657294851; cv=none;
        d=google.com; s=arc-20160816;
        b=SJtZyl+VqczDTr+9UAiAkNA85CA/uz2Suo4UpwiQv0qajwW2JsUpH3xDV84n+1okSn
         sihYzBZlSLeabyHN5iR8ySV8HyUFFkv6OEwYnPwvuzRNbqAF9Sru/YepaNOuoJR6Blc4
         H6qzyat0nqAnOdNMBXoc5RSf/1Np2CLcL5VC1GmN0gZ9R/x2Pn3Hv0QGvr1bWGApoMSm
         9jGy+PF8JDB2xnuNep1L5RPgGHHmcWYH9goqTaa3vGfxPLHwC2F7eQ5V+uJi8c0PLlhB
         /K9oNqotBLrxFZBAu+MFLEqHejviugtiCi+MvPfPZDefac8tZMq/wKbvjLlppEciZ8qP
         tGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xubRGg1CD554iutFjuAkV3ppcjr54S3DVLv86vq5+4E=;
        b=Yz4O7LfS4JKL5p76uG1GrN2ImtPZRv7THL//CFZeGPF1yW+9cfjjuIAZ9k37MtfW5E
         tj/bc3Ail59a3AL5QrM0heorJxAGPu6sTTa9M1+RoeUYW8HOSdc9wy1pgn/rN8HdqYgs
         U6UQQjmTasC9/s7JKsNXvtLmS/b2b+9uX9aC2EFwwfSYAA1iCsfmC5MPLNSkF86Ls0U+
         1CAGOKBPKki5rCUiSqM5c3LgSC4awc5u15Xnv8n8WsrbLDiMS3+/m89Sh8mFFA46QWQd
         FlWfFe2WYdXe2sU/uUqgw6s4nEMbT0LnXwhyzcRTsteeD5oDiS32AgLzl9WijA8ur+Nu
         qNGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d1lcWU4m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a05620a410600b006b55725d9absi3635726qko.224.2022.07.08.08.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d1lcWU4m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9q66-0007e5-NY
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piz-0003Qm-FB
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:57 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:52876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pix-0002Mq-S1
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:57 -0400
Received: by mail-pj1-x1033.google.com with SMTP id fz10so12195381pjb.2
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xubRGg1CD554iutFjuAkV3ppcjr54S3DVLv86vq5+4E=;
 b=d1lcWU4msMV/mYIrhgTmQ68/IBzQpR+Vbm61k0JJD9exf3MzTaihbPKBI0VmXsOXAo
 JWyb3iMPm5D2NgbzwbzNLRzEQ8d/5V2qDogKlXxtoEvoordgcTCaUMEQ82uC86KYcBMO
 5ihL9NmJfqW+/V1BF8RUIc50uFo4enT1zpUks9Kpj/ZOwqmDREaZ2bWirpIm7xYsNleu
 DMXwCR9ZOS5U7cZemWyx4/FS9UELMTmglOQrj6dWpV2apCwddB8MxdNt25fGrWxIChY8
 m6pRFG+NmbVkfUGUN/seFFK/Hinw0YQdVXei5FFCTO12tj5GV0WA3OcH0XrbxghIhRyA
 QwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xubRGg1CD554iutFjuAkV3ppcjr54S3DVLv86vq5+4E=;
 b=eHtWcwtjWFAzsjn4O5P4hIEXj8qCYOeRgXEhfg+3LqEqYAo2iSLqC6iLRonI4KSpuq
 wLoSYLy0jg3oajHNnIqbzGiHnkvPOr74gyxnUuCpbtohsCKe+HOscxNHV6TuANAeBCMR
 SVPJ7fi/wih+kRXyApNk3VNwljHQ8zVZUH4qj5bUDzK88zfNlHCI7feyKvmEqCeh7h/a
 7IuvIVPfuy0xdm7nfRjrShE4PXievrMS9xXc8JOA8L1a8jcvlGUpxWCjenw6naxeCWFw
 AtuCvlNpsiWcp43zsDjU47ygcuKXlg2hHO0PT3rkLOCarvvvC/4Mb7wGtusGw2dZ4Xqx
 5imQ==
X-Gm-Message-State: AJIora/E5wnae/1JsiaUYZPJ78Yinyq+WQ07OwbIjvA1ER+iF350fLcJ
 dVTJLM3HyVwIXuKymyd25xuu+Q==
X-Received: by 2002:a17:90b:3c0c:b0:1ef:e647:ff48 with SMTP id
 pb12-20020a17090b3c0c00b001efe647ff48mr321935pjb.173.1657293414536; 
 Fri, 08 Jul 2022 08:16:54 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 22/45] target/arm: Implement SME LDR, STR
Date: Fri,  8 Jul 2022 20:45:17 +0530
Message-Id: <20220708151540.18136-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: jBsMYmtAXsCs

We can reuse the SVE functions for LDR and STR, passing in the
base of the ZA vector and a zero offset.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme.decode      |  7 +++++++
 target/arm/translate-sme.c | 24 ++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/sme.decode b/target/arm/sme.decode
index 900e3f2a07..f1ebd857a5 100644
--- a/target/arm/sme.decode
+++ b/target/arm/sme.decode
@@ -46,3 +46,10 @@ LDST1           1110000 0 esz:2 st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
                 &ldst rs=%mova_rs
 LDST1           1110000 111     st:1 rm:5 v:1 .. pg:3 rn:5 0 za_imm:4  \
                 &ldst esz=4 rs=%mova_rs
+
+&ldstr          rv rn imm
+@ldstr          ....... ... . ...... .. ... rn:5 . imm:4 \
+                &ldstr rv=%mova_rs
+
+LDR             1110000 100 0 000000 .. 000 ..... 0 ....        @ldstr
+STR             1110000 100 1 000000 .. 000 ..... 0 ....        @ldstr
diff --git a/target/arm/translate-sme.c b/target/arm/translate-sme.c
index 42d14b883a..35c2644812 100644
--- a/target/arm/translate-sme.c
+++ b/target/arm/translate-sme.c
@@ -243,3 +243,27 @@ static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
     tcg_temp_free_i64(addr);
     return true;
 }
+
+typedef void GenLdStR(DisasContext *, TCGv_ptr, int, int, int, int);
+
+static bool do_ldst_r(DisasContext *s, arg_ldstr *a, GenLdStR *fn)
+{
+    int svl = streaming_vec_reg_size(s);
+    int imm = a->imm;
+    TCGv_ptr base;
+
+    if (!sme_za_enabled_check(s)) {
+        return true;
+    }
+
+    /* ZA[n] equates to ZA0H.B[n]. */
+    base = get_tile_rowcol(s, MO_8, a->rv, imm, false);
+
+    fn(s, base, 0, svl, a->rn, imm * svl);
+
+    tcg_temp_free_ptr(base);
+    return true;
+}
+
+TRANS_FEAT(LDR, aa64_sme, do_ldst_r, a, gen_sve_ldr)
+TRANS_FEAT(STR, aa64_sme, do_ldst_r, a, gen_sve_str)
-- 
2.34.1

