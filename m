Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp932481njk;
        Fri, 24 Jan 2025 08:38:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWGAgisvx1w5cz//GcEdWT68gVrrPwGUphISfOSsKlHd+pTIYqC+upW7ZNYfgs1xaodMfwwen4fvQ4u9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFkPnReDeovSptNgS5tr51AMhNVX98qc0CqE2WLlz8xdOE3wxn4HY5TYCVY+zyAj9MMN5Za
X-Received: by 2002:ac8:7155:0:b0:46e:23ad:a120 with SMTP id d75a77b69052e-46e23ada189mr316865841cf.35.1737736714385;
        Fri, 24 Jan 2025 08:38:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736714; cv=none;
        d=google.com; s=arc-20240605;
        b=Zb0EFY4S451ZSe2qYuvBlOnpOPcBiUxSEOGX1nq+UYky4QnAVyJGj1rt4dAMFeWwuE
         vN7jHCsC9HTF9P1KdHiqAz7gAi+oV3+r9j5U4eYo9xBzx1bZUVNhVYa7VfrjG3H3h+CZ
         MstOvclL/iOujZmCC5bae6bap2X2P7of0/6+zysAcSiE3Mzo7XolcwBkGWwrsOLTIGG7
         dTygTS0S4cEdxWQTcEjd5BUpeOo8a/SVvikg87M1t+i7hKBzh89cyyI7ywnKwcPkzoqy
         v5pB55juq7m+OOSVhbt62L3kUFNroe54ID88hbtLNp2WdvNj03MQJlGkDrMkdHStmvAg
         OMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qs+MQLYyxydi0FLdHXNe7tQBtwbpgP1LG2ASJBHmqjY=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=F9OeW1NN0UPI5kP4xFxt3hX3Xr7qQWEH6+JW4BZJOLNj/YFx238TAgfnISSxLgLaDC
         uSRiK9WGeVVdssF4J9Ufb6hQNyKET93qrQ1QFkArUpI1OoYi+MFXZDIDVn9S8scDwRDB
         kQi7BMr5kSNx2GxegfO8V1XRAhomxo0i9UrCL4XwvKok7KwKM4aR57a50QeaXbI7ybEg
         9CM8bHc8FdGRA78BSlWyumYGr2r76m07p1nF4J79Ftmmm2dVt0qvqS5H4EXzw1DvCyHW
         UqQydbrJK1xKYCeuK3fLqBTvfY04r3JZiQWq16kcSvLadnOfyaTTR7PKMJ6RVG/Gr62M
         gv2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yYGtQUG0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66b6710dsi26009171cf.280.2025.01.24.08.38.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:38:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yYGtQUG0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMb6-0001aa-I2; Fri, 24 Jan 2025 11:31:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYo-0004yr-HT
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:34 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYm-0005fI-Rh
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:34 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so23933205e9.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736171; x=1738340971; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qs+MQLYyxydi0FLdHXNe7tQBtwbpgP1LG2ASJBHmqjY=;
 b=yYGtQUG0I7+/cLlW9WUyoHq/U9dq9XO5l/FOSAMH49EYSkMCZ8segxdUcfty4Kzw49
 NLEUN62eNzun+dNEptLE2O5uj1Q2kzxMz8385B9wkX8kUb409ubgAH7We3Lbcacw6BTY
 TSzUm/0r9u/FqhSENqk/tr70Hy47sCwa4PGRuSOl6SeibjeArqkMYltdYl57X+4YTRsZ
 ZCDIB+vVoXFySpwX2CYgd6Dfz6rkoQE+SJU6/G+K3kxttu0RP02wuDTo9B9H5j9Wyq0m
 D8LXTbJU+9mE1ztDaa/ahwQeyGk2EgYlKsqtgLDcWO+ON0uHLmgoefxJrbkqmeoTB31t
 HI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736171; x=1738340971;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qs+MQLYyxydi0FLdHXNe7tQBtwbpgP1LG2ASJBHmqjY=;
 b=agPUCtS0Exq9ROQoBWFbcuzMlARz6ABYA9Va5vXhPY9xicomkdrqcrNRXWUOn2k8ms
 Fmu1qIfuFLLI8skMp26DhQSgnBiRawnGuGZC/48JuqOrQHb7ZfqmIwDlqXL4efwob4+t
 mNGEog+ILVNK9ckODxowjsD8DRGrIXE6lmxmJUtKCu1UpB1hWCiKnBDUmnIwUqc1Z65W
 F6IkOU54zR3dnHlxlAt7JYOgwnoB+kv2oZVYUfYY5Oyge13x6luVA79ecUST3r+ZWIty
 6FmXjPJwu/BTUxcRnCHTeqKqOrEKgmlIU4138y3UrJCqbbm4N6+DSRhETZh0RGU9xUnH
 ltqA==
X-Gm-Message-State: AOJu0YwnT6UDg2+xa1nM8cZcMoqbgKs6dOQf0Xqfa81d66DePDVF+PPv
 5zpc//B802Ge2jpgTlkdllit1qNpFbjs8EXKxDr7RAbXwWrSegcHCck5qpP39SGociPl9eCIWX0
 3
X-Gm-Gg: ASbGnct+Sdp0JNup0ubqEHnJwMvclkWMDccCyEX22wTkCdRY0c2UAMWZP4yaYNiv+LF
 ZFM1k3hIB9Rb9Khe3HH/6pN9ZRsaVrJAFABgH8bEsHgwzUqFwOljMCYPqoRX6JNXemSINKt98Qk
 HAb+v6y2/6G04BGYO7B+w6t4GI5J2UQ2TUPle0heMk+htFcmNkMran1CCOVJKaXXtSTWrNOKXdT
 WKZBaW0C1i+oHsIQWtqK5OBhaC+dZGXn2hD0ZlXgDl2l2/1t7Il2Gy3Arnow6rPqT7r5Yqbyu6i
 rYuSKyGg718=
X-Received: by 2002:a05:600c:3b0a:b0:434:9c60:95a3 with SMTP id
 5b1f17b1804b1-438913ca93cmr315685425e9.11.1737736171426; 
 Fri, 24 Jan 2025 08:29:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 43/76] target/arm: Handle FPCR.NEP for FCVTXN (scalar)
Date: Fri, 24 Jan 2025 16:28:03 +0000
Message-Id: <20250124162836.2332150-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h5DrP1finRgR

Unlike the other users of do_2misc_narrow_scalar(), FCVTXN (scalar)
is always double-to-single and must honour FPCR.NEP.  Implement this
directly in a trans function rather than using
do_2misc_narrow_scalar().

We still need gen_fcvtxn_sd() and the f_scalar_fcvtxn[] array for
the FCVTXN (vector) insn, so we move those down in the file to
where they are used.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 43 ++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 7412787b6b6..6dc5648cb1b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9258,24 +9258,21 @@ static ArithOneOp * const f_scalar_uqxtn[] = {
 };
 TRANS(UQXTN_s, do_2misc_narrow_scalar, a, f_scalar_uqxtn)
 
-static void gen_fcvtxn_sd(TCGv_i64 d, TCGv_i64 n)
+static bool trans_FCVTXN_s(DisasContext *s, arg_rr_e *a)
 {
-    /*
-     * 64 bit to 32 bit float conversion
-     * with von Neumann rounding (round to odd)
-     */
-    TCGv_i32 tmp = tcg_temp_new_i32();
-    gen_helper_fcvtx_f64_to_f32(tmp, n, fpstatus_ptr(FPST_FPCR_A64));
-    tcg_gen_extu_i32_i64(d, tmp);
+    if (fp_access_check(s)) {
+        /*
+         * 64 bit to 32 bit float conversion
+         * with von Neumann rounding (round to odd)
+         */
+        TCGv_i64 src = read_fp_dreg(s, a->rn);
+        TCGv_i32 dst = tcg_temp_new_i32();
+        gen_helper_fcvtx_f64_to_f32(dst, src, fpstatus_ptr(FPST_FPCR_A64));
+        write_fp_sreg_merging(s, a->rd, a->rd, dst);
+    }
+    return true;
 }
 
-static ArithOneOp * const f_scalar_fcvtxn[] = {
-    NULL,
-    NULL,
-    gen_fcvtxn_sd,
-};
-TRANS(FCVTXN_s, do_2misc_narrow_scalar, a, f_scalar_fcvtxn)
-
 #undef WRAP_ENV
 
 static bool do_gvec_fn2(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
@@ -9377,11 +9374,27 @@ static void gen_fcvtn_sd(TCGv_i64 d, TCGv_i64 n)
     tcg_gen_extu_i32_i64(d, tmp);
 }
 
+static void gen_fcvtxn_sd(TCGv_i64 d, TCGv_i64 n)
+{
+    /*
+     * 64 bit to 32 bit float conversion
+     * with von Neumann rounding (round to odd)
+     */
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    gen_helper_fcvtx_f64_to_f32(tmp, n, fpstatus_ptr(FPST_FPCR_A64));
+    tcg_gen_extu_i32_i64(d, tmp);
+}
+
 static ArithOneOp * const f_vector_fcvtn[] = {
     NULL,
     gen_fcvtn_hs,
     gen_fcvtn_sd,
 };
+static ArithOneOp * const f_scalar_fcvtxn[] = {
+    NULL,
+    NULL,
+    gen_fcvtxn_sd,
+};
 TRANS(FCVTN_v, do_2misc_narrow_vector, a, f_vector_fcvtn)
 TRANS(FCVTXN_v, do_2misc_narrow_vector, a, f_scalar_fcvtxn)
 
-- 
2.34.1

