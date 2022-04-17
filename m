Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1272146lfk;
        Sun, 17 Apr 2022 11:04:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKqkllN8qLE2qyur2N2faZHTZr55RhnneyeMUlLNJORZovm07lpLuOtTixY81Z5NtAMQHA
X-Received: by 2002:a05:6214:1d22:b0:440:cccc:8212 with SMTP id f2-20020a0562141d2200b00440cccc8212mr5741886qvd.78.1650218680857;
        Sun, 17 Apr 2022 11:04:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650218680; cv=none;
        d=google.com; s=arc-20160816;
        b=N/BrISI3HmXhnRHB7XHaarbbFQXC9CfL5At0nR+SNbF5nf76WWzN8gj0ajh6pHwPCg
         mukSuTcGfNMSbZKt1xKWxviicN2yWwUKDSiN6YhFDdV9KDywYykxL8r7JR9/2Eo9THYR
         UwYX25REKJBRb5362yVOSIr2XaZ2deeWH6QTWSTCiafI5Lsd2BtC5UDVEgcJjIddK6Od
         g+DwzeDjegpss085p+FhqiAlutL+yvObLLF+gCHqydFz12CrIo8N4CaLlqEPvr+Ty0/r
         AnKwZ6npjeqr+KX2icOIOr3VbUaUsKiXHEenW+ySbY/Vafac5GqjnPKUJy4Rd3BP69ab
         f4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rwqJPJ//6TQT5UmISyCch80APlTh3KWpu8wgkVgb10g=;
        b=jyk5bWthbTaOeOcW2a+7sSVu4hFBDVoHKC+KOJAVA06Rdoo3JkLUmsj+oW7Bws7PhI
         HCz11KBa6TSmsDmEOiAVOznGwqduI1qg6EavtLMX2ppnnKRTmnK2JN3auK6W7S64+DvL
         Qhm2i80czLQYs8x1ToWeNC0P5cSNcjomeifO872LfuIOwfjPhR9Hjk/ijzbILP0zkHlb
         OMJIcxT+pPLwsioucrYTr4qA+3Zz5bbd4uMA+0gPehMtS6H1snjCtQbWMuxCGI6B6cpX
         F57DhhdDeTsK5py68MUlT88Ypi2qS64XwiJVAEJsZipVCjrZFDmfrcVLP581qklGjHb3
         jP6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=US1SyCFa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16-20020a05620a289000b0067e4be2388esi2531448qkp.211.2022.04.17.11.04.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:04:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=US1SyCFa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9GK-0005k5-9x
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8xA-0000pF-Cp
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:52 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:37669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8x6-0003LC-GT
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:52 -0400
Received: by mail-pg1-x534.google.com with SMTP id t184so1964335pgd.4
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rwqJPJ//6TQT5UmISyCch80APlTh3KWpu8wgkVgb10g=;
 b=US1SyCFaW/3LmCuUoc+LgmazZxmkCpZZpzMxB4hNYsFVGlTquh7Y86bMsdauF4M2Rn
 NOyNH2sVKaP/SOlwj51bXQoLOWoCZ51dT5c6MkDaM3TObSt5dIvFiNwIAzyCFL+CyNlb
 vd8mze0Rnyiwqlgj+XwW/QYG5s0+Mp9A5jjGpg8He71VgUBOwRvgwFgFjMTmQ+yt85tm
 gr39fedn+ZCe7ZzOgTVD0P03f4Z69BxEGIUR3ICkbM8br9O5jd73eS3w5OOABxoO0PaE
 4Kkp2KOKChRFzEDwdRe+kRh7VAIMtE7D2o+dSrEmdx84J5Sli6/S6V1Y+NK9poyFpn1k
 kHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rwqJPJ//6TQT5UmISyCch80APlTh3KWpu8wgkVgb10g=;
 b=GfKOzkogxgD7I/MoidRH82nc43ftmdLAcYT6qiz8+b2bMmAQUgMUPEQRz7BKBPu7gz
 tKPycuLKRg6x41DiUdiLHBIj1sHm2EhXaRhyFczXMDH+vgOLD6sLm5+4z410CIQekpqj
 gVuorPa6rYOkAiti/grbe7X6HyC6sCOGtnT4psNugf9vCklUpWrtehdMvYz3hg54bH+R
 c0wS2141GrbKF5uyrfDen5YSJgDnaT4Yl7KGa3JK6yxcSUE8KY8KPCZzRCZpElHYMiWi
 6uh7327HlB+L/VzC1ekJtK4grgkTg6WOHJ6LrOmfjHchAVWug5oJYdICa0sfnQrSY6St
 inDA==
X-Gm-Message-State: AOAM533Nh/eY0SAQ8oZjWXrHQHMCFcoZUssvIaUJdVvx9iV0Seh0e7Eb
 AU8Jt592MrLJX6ZgjzCqzjeGilSrkha2Ww==
X-Received: by 2002:a63:cf41:0:b0:399:3e74:d249 with SMTP id
 b1-20020a63cf41000000b003993e74d249mr7096851pgj.475.1650217487304; 
 Sun, 17 Apr 2022 10:44:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/60] target/arm: Use smin/smax for do_sat_addsub_32
Date: Sun, 17 Apr 2022 10:43:46 -0700
Message-Id: <20220417174426.711829-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GMFcrWMs29PQ

The operation we're performing with the movcond
is either min/max depending on cond -- simplify.
Use tcg_constant_i64 while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2c23459e76..ddc3a8060b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1916,8 +1916,6 @@ static bool trans_PNEXT(DisasContext *s, arg_rr_esz *a)
 static void do_sat_addsub_32(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
 {
     int64_t ibound;
-    TCGv_i64 bound;
-    TCGCond cond;
 
     /* Use normal 64-bit arithmetic to detect 32-bit overflow.  */
     if (u) {
@@ -1928,15 +1926,12 @@ static void do_sat_addsub_32(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
     if (d) {
         tcg_gen_sub_i64(reg, reg, val);
         ibound = (u ? 0 : INT32_MIN);
-        cond = TCG_COND_LT;
+        tcg_gen_smax_i64(reg, reg, tcg_constant_i64(ibound));
     } else {
         tcg_gen_add_i64(reg, reg, val);
         ibound = (u ? UINT32_MAX : INT32_MAX);
-        cond = TCG_COND_GT;
+        tcg_gen_smin_i64(reg, reg, tcg_constant_i64(ibound));
     }
-    bound = tcg_const_i64(ibound);
-    tcg_gen_movcond_i64(cond, reg, reg, bound, bound, reg);
-    tcg_temp_free_i64(bound);
 }
 
 /* Similarly with 64-bit values.  */
-- 
2.25.1

