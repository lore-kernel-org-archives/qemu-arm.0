Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp731324lfr;
        Fri, 16 Apr 2021 14:12:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1PRxyZDzVG4AyOkjsJuI9YsQkALRYoPcHkuXqrACIXHjNU2FQNtW2KhxW5MdKT1t5VV1b
X-Received: by 2002:a05:6e02:20c5:: with SMTP id 5mr8646066ilq.14.1618607520173;
        Fri, 16 Apr 2021 14:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618607520; cv=none;
        d=google.com; s=arc-20160816;
        b=U3ehtDe9Sm7sFDtfBrNrJsWabMcnMKt8DVIkrlMt57qc7+9oT1kZQYM/UZ8kQ8846W
         Eshb0e4+P8t56S8HXPpO2nxc5RSKLe3zaf8AkEpwksyBVfQezwU9wllLQ0P1QP055hO6
         4aT8RLgM9M0iDh8rt6Um1693ZxlR1VAtcMWj3y2FQzYINrbe0HWSGY1HCpiIpdWum3PB
         fsHEPmHWT7I6creNedzNqFO3o8YURW286jJmaTNp41GlKSn5Rsb/SycgzWDX6X2yGwa+
         FDMf20Nb+gln4R1snRhQy4wfitz25pZTX8MNjmKSePWV7A4mviI5zzUqtNjt3WDLr7Sd
         Duhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KjnryLyEOHY0qpMOVIlDWjkao3wWlEhJ3Rqkl3sc8kg=;
        b=BhX2ngAEYyoJvUQg9FEi02leYzYdXWSTX1FJZ43G2fFXSWH/0HgOw4isdYkIM7Pt/8
         XNLi7d46sxFKI55RbA3ykIHVvDSCXi2SsLeKiI5yZZpc7gGA1S+RIb5jZtzo+CMlyPJ4
         bbc2YNE8z+t44XKpcskZ8Hy/jezp+8SmASFDOCr1Ruxnmok6tWtNc1WDPGC6Uxo9SLss
         65dFu0nc8ToRTJ9OiwCfza8nyv3OhyDJfyKgWDwag9ufqYw6Nw5auYxqvCaCxwlpYjcc
         ZJZ4I3W2coBBpBHlk5sEhVJX2TpGfFshf+d1o2ddC80PfLDHOBYXZEqFZvcaR1ciAd7T
         0Egw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kOd/CTO5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15si5523727ile.69.2021.04.16.14.12.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:12:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kOd/CTO5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVkt-0007UC-EF
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcL-0004L1-Rm
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:09 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:55220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcG-0001AX-IH
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:09 -0400
Received: by mail-pj1-x1036.google.com with SMTP id cu16so12665236pjb.4
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjnryLyEOHY0qpMOVIlDWjkao3wWlEhJ3Rqkl3sc8kg=;
 b=kOd/CTO5zXQ4xCyhMCXXbMP32T39BI/fF9VisOt/gxNDXGVIqPcVXSiRXyvTU3Xwkz
 g3yzSU3QpNTRXWKUPV6b6IXk9UPvlyrF4MuTw4bfdojODoD7+BqQQ0F6Y0QeBx3tlo8Y
 lroNMS1cZpOkCH3iGD2PrsvOU4jscIiSsTVpcxPWeoBDVyEVS5DYB2KpXGSvTtjqrBHo
 u76AUkcvZoR5BN6FRTObPy34fCNfTPW5l5VNgAYfgr6pb1VmSh/P1Vm5/kcUlmyxX18e
 6jzvrlOHOc6SiLzbPCapQWRI1Q6RXtvVX1uCHHtm5YRQRei/vB0JOAOCcgeyIJlnZaDE
 BS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KjnryLyEOHY0qpMOVIlDWjkao3wWlEhJ3Rqkl3sc8kg=;
 b=Mr7uwG/u1O6a12nTE0sGVnNru3JGdxMrcfu1X7TdQEuimwP6MmhdZUZ3wHaKObIIbo
 hRkwjbL5FtAjDPYipPDWS/q4ml8I60UA/huapxhzMRiBkSoYUI6NZBU6KyXxTzzLjEtI
 ARM1VnVUg7+Bx4PVEu19Zf8ho19J/afbfC5ZMtXwlhADcYXsiAOGf0WGQ5kchFqxo8aN
 VV/5ny6tdBJE39q6iM/mlp9tVT4vxG3kghUUrMHBxT4phHjo8FWW1tCnqQgnqKDWseLc
 5lb3xBUZ/h/28lQgI56hEXC6rrTYkIgyUMzeq2dMKsZ139yW06AfwDylgzSHgIMHzWim
 Oidg==
X-Gm-Message-State: AOAM532l4pybWTLj6CoB9SmI0InKKjbg630TLPrGkOS+Wwn81sNGpTRG
 eMvBzHYKTj0IYylD25+Mulo4NKgHdgERQg==
X-Received: by 2002:a17:902:b60d:b029:e6:7a9:7f4 with SMTP id
 b13-20020a170902b60db02900e607a907f4mr11498703pls.3.1618606983272; 
 Fri, 16 Apr 2021 14:03:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/81] target/arm: Implement SVE2 bitwise shift right and
 accumulate
Date: Fri, 16 Apr 2021 14:01:40 -0700
Message-Id: <20210416210240.1591291-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vSOKiwri8t1J

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  8 ++++++++
 target/arm/translate-sve.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 79046d81e3..d3c4ec6dd1 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1253,3 +1253,11 @@ UABALT          01000101 .. 0 ..... 1100 11 ..... .....  @rda_rn_rm
 # ADC and SBC decoded via size in helper dispatch.
 ADCLB           01000101 .. 0 ..... 11010 0 ..... .....  @rda_rn_rm
 ADCLT           01000101 .. 0 ..... 11010 1 ..... .....  @rda_rn_rm
+
+## SVE2 bitwise shift right and accumulate
+
+# TODO: Use @rda and %reg_movprfx here.
+SSRA            01000101 .. 0 ..... 1110 00 ..... .....  @rd_rn_tszimm_shr
+USRA            01000101 .. 0 ..... 1110 01 ..... .....  @rd_rn_tszimm_shr
+SRSRA           01000101 .. 0 ..... 1110 10 ..... .....  @rd_rn_tszimm_shr
+URSRA           01000101 .. 0 ..... 1110 11 ..... .....  @rd_rn_tszimm_shr
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6f5e39b741..c11074cccc 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6394,3 +6394,37 @@ static bool trans_ADCLT(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_adcl(s, a, true);
 }
+
+static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
+{
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        unsigned rd_ofs = vec_full_reg_offset(s, a->rd);
+        unsigned rn_ofs = vec_full_reg_offset(s, a->rn);
+        fn(a->esz, rd_ofs, rn_ofs, a->imm, vsz, vsz);
+    }
+    return true;
+}
+
+static bool trans_SSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_ssra);
+}
+
+static bool trans_USRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_usra);
+}
+
+static bool trans_SRSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_srsra);
+}
+
+static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
+{
+    return do_sve2_fn2i(s, a, gen_gvec_ursra);
+}
-- 
2.25.1

