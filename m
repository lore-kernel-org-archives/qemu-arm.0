Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp2175176lfn;
        Tue, 26 Oct 2021 21:58:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpENNl+CiemDE2VD97IlRFeh6/aTQquMZ2h/kk4ACNUzQLKfeVyKaFpa0GaRiU9p/PwA2D
X-Received: by 2002:a4a:d84e:: with SMTP id g14mr20326413oov.62.1635310682837;
        Tue, 26 Oct 2021 21:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635310682; cv=none;
        d=google.com; s=arc-20160816;
        b=ILbhhb3mjjYkHTHw3eJDNhd2q/EiU6A6SWeTi6p4CzDUMCLebB0NUCbG5PSPg57OsG
         QTgQmHtiFFFvlJoIgrnIaWLHwUmIGnW9izw7nUJuSaa3WEyG23MTYuJJvhWegqKIfhth
         p/3Fjok0Z0vd2MW/YIfKIpYf8l06cDTWCtJU75xOfQQNwLgA+KjLcko4eLEJ6u5pGCa7
         Gd63AmDZOVvqHCH7SLBJ+uyJ6qVDC6d2I3bndCKwGgBNfoc278r6kyn+XLa6fDdHSqfE
         tcADMkOKxubg3Ra7u+Wt1NFuhenpNqHgz2BNihd2WXYHK/BUFqIQTb4TP+4ssGR0duQ7
         hGVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MY9quCqJ/2Bz6tK8Zx9ZzguPdmzXrHRSyEOAkDlUTqE=;
        b=YU6p7xY5vFbkiLJ4/t8V+4PNbIA5vt9z6MFESq5CYf+odoVXoC6+AoIpjB21meGOCl
         9fDc9eVuh+Hwq3fI+jBlNQkEmKxbpxceoryy58WCF06CnvVMcbNvu6WBqpQJcggfmmkT
         lV4yvn6+0uhwQOlJM8HtkcUvEU9Uv3f6fAPA3/hj9coki8RfAN3vWVMTgHfZez0cJyaF
         1CFEL95qyqzJtVXlFWOVRDVp3JHS4P7qY/W3/ZmR0dT0L3MVZVsfS6tDQDGaciA9dORh
         515JdFRbzuhYcIgJqVQgKaqYxKPqI3jjU3H/yqGHmu8vuLXxzj2BhKV2FtXys6Vd7Ey/
         o28A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=X8rD3XRQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5si26179952otk.209.2021.10.26.21.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Oct 2021 21:58:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=X8rD3XRQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mfb0k-0006tF-00
	for alex.bennee@linaro.org; Wed, 27 Oct 2021 00:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfazJ-0005ZP-AE; Wed, 27 Oct 2021 00:56:34 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfazH-0005cC-4e; Wed, 27 Oct 2021 00:56:33 -0400
Received: by mail-wr1-x42c.google.com with SMTP id u18so1901474wrg.5;
 Tue, 26 Oct 2021 21:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MY9quCqJ/2Bz6tK8Zx9ZzguPdmzXrHRSyEOAkDlUTqE=;
 b=X8rD3XRQQbIQ8SMC/Nk5M7bQ94j/6zB4N/OuCASoFwtlzKH8rAcjVvxlTB3WNO1pAl
 NEk8LaRchiDAKnkJiFrjG5qMyiz0R1rq0Gc7uSLuVmRlcdOdXRUgo34B3LWixMOHF3A2
 s1xqzxYWWNyd4q02U1VuoZ8LS5c02P1gSihtYK2kjBTzQyL4rZEYBncs97H8HnmY43yZ
 Z6nx8Xd3UAJrr4Sjs9BYdCZcP6stKAj09adf9C0My9P80o9npiVGxJNLGihGdbatV6MO
 Sgm7vQ/a8vnrYXBG3IVLCm5rdiLWkKQZcMeHeOJ9ISKbX1OwGpUOjtjdv5dT6SE0lNNU
 USMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MY9quCqJ/2Bz6tK8Zx9ZzguPdmzXrHRSyEOAkDlUTqE=;
 b=RuZQ4sV16MDqz3Bv38yYKk7LXOQboRNdQYPTS/e5KXdNFfM8512kjckZpmsnnQpbTZ
 02UjuMTBT0IIMr7I8B+lojBa2A+dqFdrNPx27i+mTZOlgrpdma4Pz0itOm7KWcaGHD0D
 4b8hh1M8vWKcl0wHE9tUG8SY3YGPNdNFGRyV7ZXURcKDUpvqQG77M/YpxZPcEXxut8zo
 aKkWXc4UiWW0IEB60/FETcO70IXmYUBO3G/WDJSPyqWtAU+kgmX6CYVR32kFJ3tWujpv
 /8N2niEI836jcn3hh0ZIzDxARoqLCICFRP91+cG/1OPIZ1gDRtO7XQJ6mXl+z2zQCmn9
 TMSg==
X-Gm-Message-State: AOAM532i953Xqv1LSElKjyLMzmss4ykPSttLJgKAxM15S9K9C2o8r9TH
 k5VA0XfPNVr596aeZA93k8oeOP1U3Wo=
X-Received: by 2002:adf:dc0e:: with SMTP id t14mr38656196wri.277.1635310589374; 
 Tue, 26 Oct 2021 21:56:29 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id b15sm2251061wmj.22.2021.10.26.21.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:56:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] target/arm: Use tcg_constant_i64() in
 do_sat_addsub_64()
Date: Wed, 27 Oct 2021 06:56:07 +0200
Message-Id: <20211027045607.1261526-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027045607.1261526-1-f4bug@amsat.org>
References: <20211027045607.1261526-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GotU8VVJ4pa2

The immediate value used for comparison is constant and
read-only. Move it to the constant pool. This frees a
TCG temporary for unsigned saturation opcodes.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate-sve.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bc91a641711..76b5fe9f313 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1943,20 +1943,20 @@ static void do_sat_addsub_32(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
 static void do_sat_addsub_64(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
 {
     TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i64 t1 = tcg_temp_new_i64();
     TCGv_i64 t2;
 
     if (u) {
         if (d) {
             tcg_gen_sub_i64(t0, reg, val);
-            tcg_gen_movi_i64(t1, 0);
-            tcg_gen_movcond_i64(TCG_COND_LTU, reg, reg, val, t1, t0);
+            t2 = tcg_constant_i64(0);
+            tcg_gen_movcond_i64(TCG_COND_LTU, reg, reg, val, t2, t0);
         } else {
             tcg_gen_add_i64(t0, reg, val);
-            tcg_gen_movi_i64(t1, -1);
-            tcg_gen_movcond_i64(TCG_COND_LTU, reg, t0, reg, t1, t0);
+            t2 = tcg_constant_i64(-1);
+            tcg_gen_movcond_i64(TCG_COND_LTU, reg, t0, reg, t2, t0);
         }
     } else {
+        TCGv_i64 t1 = tcg_temp_new_i64();
         if (d) {
             /* Detect signed overflow for subtraction.  */
             tcg_gen_xor_i64(t0, reg, val);
@@ -1966,7 +1966,7 @@ static void do_sat_addsub_64(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
 
             /* Bound the result.  */
             tcg_gen_movi_i64(reg, INT64_MIN);
-            t2 = tcg_const_i64(0);
+            t2 = tcg_constant_i64(0);
             tcg_gen_movcond_i64(TCG_COND_LT, reg, t0, t2, reg, t1);
         } else {
             /* Detect signed overflow for addition.  */
@@ -1977,13 +1977,12 @@ static void do_sat_addsub_64(TCGv_i64 reg, TCGv_i64 val, bool u, bool d)
 
             /* Bound the result.  */
             tcg_gen_movi_i64(t1, INT64_MAX);
-            t2 = tcg_const_i64(0);
+            t2 = tcg_constant_i64(0);
             tcg_gen_movcond_i64(TCG_COND_LT, reg, t0, t2, t1, reg);
         }
-        tcg_temp_free_i64(t2);
+        tcg_temp_free_i64(t1);
     }
     tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
 }
 
 /* Similarly with a vector and a scalar operand.  */
-- 
2.31.1

