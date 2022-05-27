Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1244002lfh;
        Fri, 27 May 2022 12:33:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMm9teoAcTlpulpO6EtbzLdwrVrNWdxFX3bG2Qru4vwNqvMo5KR4VP8kKU9fl+bkPpyYBC
X-Received: by 2002:a05:6214:27eb:b0:45a:b022:c97d with SMTP id jt11-20020a05621427eb00b0045ab022c97dmr36248852qvb.24.1653680010570;
        Fri, 27 May 2022 12:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653680010; cv=none;
        d=google.com; s=arc-20160816;
        b=MzOWZcCaDCsY/aBS1rhcF6K7sCdAu8zm1WtTTCgv9O2yaFz+NQbEwn5+tGHkyjnZ1I
         NjwXR/1QSNLtgZ2vDoK1H3Y7Gu9bc+0L6Glvw6ZESIbVhKVLKCX0jRfTjBtNPwLhg4CG
         snsL5WK/7tXoz6CjRnp/wud+OKcqFaM/fnSuTSr5C18tbwG6+WOKVIx3YYwl3HS4kCCi
         J/svxzuX11DXbbu4TPkQtD9aN+1b6e9wwkKklvmXyZN9DLNmnq38jaLYuIiEKYkaNGEB
         cWIoDETPEtub0jRameHinAVLLbPI/0CL0Qc/nEl4JRcqn/IidCvwxJWYbBzBn4jrPoeM
         WA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Umzjh1y3AxoU9a+kw8LngLenhzwr5WnXAazQzHmlXww=;
        b=XrlaNTtH03RdIzQgAInf9fHNNNUmUYvyoBf21vFSI0aMll+i0s5p5voEuq8wDeSC6s
         KHYBprPfmVuji5WpE85HWThpglC+GNUtolFxE+BW1p4XnF1hyKgUR+kJ3HtuZ4iIN1ts
         PtbXtMiIqpWb2CMk/mpV6Wg2jpz3wzeJFeKsYvDSrW9OWOEi3yBlStku1SZDSQ498FWN
         tiVPtmYo2uBeXd9hQM/qlkohDezsPOz9z6GT8X1KhM8UK1snGNTdOMot7ce4ftbj/c4y
         9SdUlHN58mHrtp6Uqi4tNcWt2CxT/cZPi3Z/0T8gdjsAE2w4hf+GNqGmpoiXaiKyNR2D
         1aDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=srm6x1r1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n21-20020ae9c315000000b006a3ad4edaaasi2947052qkg.543.2022.05.27.12.33.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:33:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=srm6x1r1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufiD-0005rN-1a
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecZ-00046w-1J
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:35 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:37664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecN-0004Lh-0d
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:23:34 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 m14-20020a17090a414e00b001df77d29587so7800968pjg.2
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Umzjh1y3AxoU9a+kw8LngLenhzwr5WnXAazQzHmlXww=;
 b=srm6x1r1wXkJ4SItY0fCasesih8Dd/CGNPM3NP9L/1Anz9JaJ6Rvv/G9PcVFqN1bo1
 sSyNTFzbnSjRBZQ2MVywAk7kLWcqILXgN1Xrk/rIZ544MDJG7zF/mCgPWLPpi35BFa1e
 NQLBNyXXamUXxEgDkMd+jL5TRe0xAl1goyD93NhEC6sIhVQQX4MPHCYmBj+Ly9Z0kzuC
 L1PjZwojIjppSwc3r6ToqIMYq9C2u/1TQrdFLnhcgoCToOJJmDTVlKHkwP080d5r3/Kr
 pO7F55sx1qFowlLEO+ubB7UnpUTMMa2YeIQk22sDsUQvOyks3FkJY+mR/uaieQqpnZ3y
 VHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Umzjh1y3AxoU9a+kw8LngLenhzwr5WnXAazQzHmlXww=;
 b=RjKrT4SMa72TbDJN5maTPuwAOrTkZzk85hwqRSrXQjrRNDMAgnkLiDnTeCI6RvAviO
 Do1hAoKP0QCjWjE8yfEkjTaw3JzYkVBmwIiKBRYngYMWdsLTII1Z8amw2/IoC+kh1kKK
 tHde07UvC3CUOoey+GDT5JLXyBwZoEgRxfF9OJdceH0GYnC5Nvok3aKwyIA5GY8DCObB
 BLeOCkX7EWvoTXC+vH3/7LnIvKlTpr0KOG45S2LfPabFUXO9K4Tu+ZEdDxBWnqJAb1fo
 K9NzQWafxvIXjrmNP5yVf3jF1uqwTMqUphhWYZTyzYj0Yy0gDGSpD16GxowuDX/OOPj1
 TWpQ==
X-Gm-Message-State: AOAM532uUEM/Y43HCjRsDxPFtghgU5xEjKa5H49SY1rvWwRjCDzrY5Ld
 v/yVgQtrWaeDdZqvvpVe85kdPWQiiLzJSg==
X-Received: by 2002:a17:90b:33c5:b0:1e0:2912:f9cd with SMTP id
 lk5-20020a17090b33c500b001e02912f9cdmr9742718pjb.79.1653675801189; 
 Fri, 27 May 2022 11:23:21 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 079/114] target/arm: Move sve check into gen_gvec_fn_ppp
Date: Fri, 27 May 2022 11:18:32 -0700
Message-Id: <20220527181907.189259-80-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: lXkpkwNVF+1o

Combined with the check already present in gen_mov_p,
we can simplify some special cases in trans_AND_pppp
and trans_BIC_pppp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 364e419f3e..f33bc9d480 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -370,13 +370,16 @@ static void do_dupi_z(DisasContext *s, int rd, uint64_t word)
 }
 
 /* Invoke a vector expander on three Pregs.  */
-static void gen_gvec_fn_ppp(DisasContext *s, GVecGen3Fn *gvec_fn,
+static bool gen_gvec_fn_ppp(DisasContext *s, GVecGen3Fn *gvec_fn,
                             int rd, int rn, int rm)
 {
-    unsigned psz = pred_gvec_reg_size(s);
-    gvec_fn(MO_64, pred_full_reg_offset(s, rd),
-            pred_full_reg_offset(s, rn),
-            pred_full_reg_offset(s, rm), psz, psz);
+    if (sve_access_check(s)) {
+        unsigned psz = pred_gvec_reg_size(s);
+        gvec_fn(MO_64, pred_full_reg_offset(s, rd),
+                pred_full_reg_offset(s, rn),
+                pred_full_reg_offset(s, rm), psz, psz);
+    }
+    return true;
 }
 
 /* Invoke a vector move on two Pregs.  */
@@ -1317,19 +1320,13 @@ static bool trans_AND_pppp(DisasContext *s, arg_rprr_s *a)
     };
 
     if (!a->s) {
-        if (!sve_access_check(s)) {
-            return true;
-        }
         if (a->rn == a->rm) {
             if (a->pg == a->rn) {
-                do_mov_p(s, a->rd, a->rn);
-            } else {
-                gen_gvec_fn_ppp(s, tcg_gen_gvec_and, a->rd, a->rn, a->pg);
+                return do_mov_p(s, a->rd, a->rn);
             }
-            return true;
+            return gen_gvec_fn_ppp(s, tcg_gen_gvec_and, a->rd, a->rn, a->pg);
         } else if (a->pg == a->rn || a->pg == a->rm) {
-            gen_gvec_fn_ppp(s, tcg_gen_gvec_and, a->rd, a->rn, a->rm);
-            return true;
+            return gen_gvec_fn_ppp(s, tcg_gen_gvec_and, a->rd, a->rn, a->rm);
         }
     }
     return do_pppp_flags(s, a, &op);
@@ -1358,10 +1355,7 @@ static bool trans_BIC_pppp(DisasContext *s, arg_rprr_s *a)
     };
 
     if (!a->s && a->pg == a->rn) {
-        if (sve_access_check(s)) {
-            gen_gvec_fn_ppp(s, tcg_gen_gvec_andc, a->rd, a->rn, a->rm);
-        }
-        return true;
+        return gen_gvec_fn_ppp(s, tcg_gen_gvec_andc, a->rd, a->rn, a->rm);
     }
     return do_pppp_flags(s, a, &op);
 }
-- 
2.34.1

