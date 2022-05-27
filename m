Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1232192lfh;
        Fri, 27 May 2022 12:11:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQD2b7dVT0oIXHFU4Fm/6ZsD+WsJDE33/OFMtRVCkb/wmli+ssCOTytOWVgi3jGqaq8sHm
X-Received: by 2002:a05:6214:5009:b0:462:1c15:772f with SMTP id jo9-20020a056214500900b004621c15772fmr29230994qvb.43.1653678667594;
        Fri, 27 May 2022 12:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653678667; cv=none;
        d=google.com; s=arc-20160816;
        b=CF+eVwBmgM25kp4Vcn+5q3G49O0CzeBIS9S72T4Y0B9m4Ijvx945g42DvLJUg2qD/B
         3wWvZ7ClSVyW3wpUHy2i2ttC89fYfErdszL130jhz14zYZVh3LBeeLpYkhIKv1OlsrPR
         AyN2cSW2tBJBsuf8dx+diSmktlCHGkXP7Sy01ISESJoeZuhLQIfOh3JTq13IKZPLA9PB
         hmqXAvEMmEc4JTDyWC33LZ0lLItYcBJGM8Hbt4gSfKswpUZsJDgNZlwgcEwOA/YAWP52
         d7DqDfGsWlAySNSjkKTdNmg0xYbtzJG9sZ09wmi6XF0EFOURow7umqfAa1V8I2rMdm8y
         ug0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PYLZf8zC20mmW3jXcEfbUTtjVkHsaiF5pPD+J1b8YEw=;
        b=N0gTMeKzOkUYw1OWQwJDFvXjBh6HVmeAE+QV9R0j+LuwdTPVMwcJJj/w6AFEzN93fF
         7wOq2LxyYtpjGuRqJ/XpMw0nj2d/N9a+pvhMe5thLCLQRtfEnbMA2gQi3qusfhn/yjrm
         kG/ea2M2u2hGXVYBsYKW0uhtW7nm5jYlbgYTFI9FjQ4JQvnv56MPqUhXuIT2Nu1FMc46
         bDvZXiPLQR/AJYcQ3jOL0bfl96el9APGb2fZ+86waxd9JaQxyo6TOyF97wFZssjDVRb9
         Qx9bfSOG653cL+fOpO8t3fY4zbNDTzkdO2OezmBSCQlCsXqJ9QxBQxe3eOSJfVVTYos0
         sQ/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Tk/zXBHw";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020ac85809000000b002f90a4cb4fesi3141805qtg.121.2022.05.27.12.11.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Tk/zXBHw";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufMZ-0000bS-35
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec0-0003HL-8r
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:01 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:42677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuebx-0004Lq-UW
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:22:59 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 cs3-20020a17090af50300b001e0808b5838so5040727pjb.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PYLZf8zC20mmW3jXcEfbUTtjVkHsaiF5pPD+J1b8YEw=;
 b=Tk/zXBHwrwTzi75LBtkJZ4PKbXkB0Q5r+Kl+rKcSzQLWLPCqKbVte5Ro1hED9nPqJ/
 NBmYmtL7rlH1N+Vq7Aku1sQ5HYGxD9lzWwi8n6LClnGkA01Njy4RDj4dLZvnzOfnFiPG
 AyKgdgPLrAZhQfY0z//22NYffCQptag/i9uYtsohzK3hQ8kdND58yGilqGW12xO/4tgK
 zROCI94rNp978qwZnYW1PEZseDlkFKLYUaPaX+cGWHcQVQMRMfsQ7uFFxYiaC4dFWU4Y
 wGEhIBBIe+EwXOJCNAxNUD4EQEGxc/SI0cC7jPd7/y06mudQ7gTF41u18yNpCQqxSRCf
 mqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PYLZf8zC20mmW3jXcEfbUTtjVkHsaiF5pPD+J1b8YEw=;
 b=gx6CS5bJC4Qf0Bce8GKtDXznAx8sVsq9KgahMrNqW6q8rCnmzDtvzs6AF46h5B+5wg
 nUHPgtMnx4Nf5a4t+rdkjidZgB0h75VcTbJy2ppoGDFbREjkqla0lspEvYje/Bxg2y9A
 Yf6bPT652R9V2iiasaJ/Jli880Qc2mweNnxoXKWC7QkjRuULKyVpOCQvobG41BFRTbna
 acR30rYMAYEqZjl2qIgluN3SompqL2Qqaf5jw9SHHnybZOMRVN/x48ejS+UWzZZgQvPM
 OLNt0djAC1p1diItOlJn4W9dAJOCzn91R0KKaYI1NqVoH8yTEjqBA+JmdDev4ImYUCWl
 SU5g==
X-Gm-Message-State: AOAM533y1pjxqaoOFqX1+c+XQsx9pGwmxlw2yuVlFZ7VIy2cuj5Cka2t
 XbDTubmyoeDgsO9Tl6KAf8vQkFGUrgQLlw==
X-Received: by 2002:a17:902:db0b:b0:163:4bc8:b90d with SMTP id
 m11-20020a170902db0b00b001634bc8b90dmr16507137plx.165.1653675775108; 
 Fri, 27 May 2022 11:22:55 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 050/114] target/arm: Use TRANS_FEAT for do_adr
Date: Fri, 27 May 2022 11:18:03 -0700
Message-Id: <20220527181907.189259-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: RFxT0N+VfxbM

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index dac29749ce..c8eb2c684b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1177,25 +1177,10 @@ static bool do_adr(DisasContext *s, arg_rrri *a, gen_helper_gvec_3 *fn)
     return gen_gvec_ool_zzz(s, fn, a->rd, a->rn, a->rm, a->imm);
 }
 
-static bool trans_ADR_p32(DisasContext *s, arg_rrri *a)
-{
-    return do_adr(s, a, gen_helper_sve_adr_p32);
-}
-
-static bool trans_ADR_p64(DisasContext *s, arg_rrri *a)
-{
-    return do_adr(s, a, gen_helper_sve_adr_p64);
-}
-
-static bool trans_ADR_s32(DisasContext *s, arg_rrri *a)
-{
-    return do_adr(s, a, gen_helper_sve_adr_s32);
-}
-
-static bool trans_ADR_u32(DisasContext *s, arg_rrri *a)
-{
-    return do_adr(s, a, gen_helper_sve_adr_u32);
-}
+TRANS_FEAT(ADR_p32, aa64_sve, do_adr, a, gen_helper_sve_adr_p32)
+TRANS_FEAT(ADR_p64, aa64_sve, do_adr, a, gen_helper_sve_adr_p64)
+TRANS_FEAT(ADR_s32, aa64_sve, do_adr, a, gen_helper_sve_adr_s32)
+TRANS_FEAT(ADR_u32, aa64_sve, do_adr, a, gen_helper_sve_adr_u32)
 
 /*
  *** SVE Integer Misc - Unpredicated Group
-- 
2.34.1

