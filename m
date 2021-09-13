Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3519436lfb;
        Mon, 13 Sep 2021 03:07:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGZqjmZMrf6pEkNhrGrOP5gnINiE8Rts0Pt4ji4o91yFJbrrpRB6rwz4az7uBU8CzuimSs
X-Received: by 2002:a02:95ee:: with SMTP id b101mr8810212jai.96.1631527621143;
        Mon, 13 Sep 2021 03:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631527621; cv=none;
        d=google.com; s=arc-20160816;
        b=fgGwxEGI/YJIcPiG5SeXZb4Q116/4/e2vdDRTW+WPrwv8Ra43EqMh7uOLCJJmjUf8G
         DGTtds675bGkA7QUkupwFmKSK1cVj8PtEs5GGwt1rzpOg7ht4hre5E2aPn7TFjFBPiYw
         mb6jR0BqRZ5ctXxvjIBUlLGX42jZHHpRuzWyPM2rpHzDjl2YJG62TvyDUzg9pFppYNBw
         wqDYu2ETdzJ2W6cTSYA2u9gN1Hn01lvCqgEEcZ8DmiuSQP6/1gAAaUT+/g5D4JW0n5eE
         p+EK9ZAhpoO/BPF8U8r2HiqhYNLcwcj0H9vMz6E3vfownq1f3CzNzCAcCeQYtpy8mpcu
         NJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hMgDnJrlLts//MTlwriTo0UqSckqctPz2j1pbkrNwIc=;
        b=hUYyYk+UgmlVfXIhTFzXIbgcTrr+sD8yhlAD6hcaJizgzBsUc6jBXDK7sZ3ty6ns6/
         fmm36CBpY7rUoE5RyJsJJDyPH2F65/AJsSkYes9xxUFD7ARAWPsD+s94t8wgzEbIER1e
         S2CKQnNgkLmshd8baCQrYaO8wbvFpPM1PPfhyDiG2WpH2OikjjYeQZ4ITepRI2yJ7ZKF
         vlGh1+KVJl6bPgcr+/+w2uZHvqaquVZmchcN+aCOvjx3ssJINx9FvAvvd9SPnjhrLfpB
         Nu89glkDee7lbPfxAe0lZvQ5fj8qRI9Wu30wUclOVOeE7GSr6gLHKn4DvwBW2A457nLM
         wrHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IGP6Fhdh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5si6127797ioa.54.2021.09.13.03.07.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 03:07:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IGP6Fhdh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPirc-0006zu-Ad
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 06:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPigE-0008ER-Ir
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:55:17 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifq-0001vp-V3
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:55:11 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w29so12924762wra.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 02:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hMgDnJrlLts//MTlwriTo0UqSckqctPz2j1pbkrNwIc=;
 b=IGP6FhdhvMrkE7Nl1ueiFXbpSZiLfB2AUZpcwS1kqDtVBWBix2GKotMcQR3NYZCQB5
 BtdWAbYE/DGVaRusHA6ZAz/2LdOLeoV9toQBeXKZHHEgCZP1VC31ndh/nFZDPUvIPULm
 mvAdmdLoWz1hxrfBc3uVsL+kWxbKGApeSxwlsud11GvKftf+mj9HUGZn5mgQyvnizjR+
 w0h60pcOj8a3vtEpTqh/IT6kFY56ZJgSq2U8I7cayKg2j7RYl7assSVR4nyMmIV8EZu3
 +84HrjwnVsjL3KJXarZ6WNDYNVXlCLyQX9SLAWLUSj3Vh0dlFBFHfYneGKG/sPAGXY7I
 S7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hMgDnJrlLts//MTlwriTo0UqSckqctPz2j1pbkrNwIc=;
 b=X+uDvVJbQ6iKHXg6LjNI/6AJ34e2MQgKPXpLTqE13OS2YxhUG5KL5QwkvY6X3u/Krr
 HQ9l59Y7O/K0VdgUEjoEFxeitTaDRECz3cBp2oZ+zhePZeEW5yrAFcH+83um1zBhxAHO
 D6s3j6aHT6r+lEiJ2qkxKBLGjHr56ZtPTk9ElD8btZJScmfWzcWONve6K7U6F5fYT8pL
 Kj9V+YcFZcSunn1c8RrwHa8nLO+kNm9lbL75HvtROKSVUKW4Z07Jasyo9eLV9Sb6rDQ+
 2hz1xEmflj7he1kXw8gXlC/y1ajqYCfsL27itYDudZyulDCQLMsyM57/iSB0OIHVPlsA
 hJTA==
X-Gm-Message-State: AOAM532HfAlj8XgVSdI62W0T2P0rMmK94IJ3caxDEAlXNGQz77KiWcCk
 SqT0IUMjf+XvHDLEcok6wCCWWA==
X-Received: by 2002:a5d:5408:: with SMTP id g8mr11654100wrv.34.1631526889418; 
 Mon, 13 Sep 2021 02:54:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 10/12] target/arm: Optimize MVE VSHLL and VMOVL
Date: Mon, 13 Sep 2021 10:54:38 +0100
Message-Id: <20210913095440.13462-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0CXAwPLS1p7/

Optimize the MVE VSHLL insns by using TCG vector ops when possible.
This includes the VMOVL insn, which we handle in mve.decode as "VSHLL
with zero shift count".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The cases here that I've implemented with ANDI then shift
could also be implemented as shift-then-shift. Is one better
than another?
---
 target/arm/translate-mve.c | 67 +++++++++++++++++++++++++++++++++-----
 1 file changed, 59 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 00fa4379a74..5d66f70657e 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1735,16 +1735,67 @@ DO_2SHIFT_SCALAR(VQSHL_U_scalar, vqshli_u)
 DO_2SHIFT_SCALAR(VQRSHL_S_scalar, vqrshli_s)
 DO_2SHIFT_SCALAR(VQRSHL_U_scalar, vqrshli_u)
 
-#define DO_VSHLL(INSN, FN)                                      \
-    static bool trans_##INSN(DisasContext *s, arg_2shift *a)    \
-    {                                                           \
-        static MVEGenTwoOpShiftFn * const fns[] = {             \
-            gen_helper_mve_##FN##b,                             \
-            gen_helper_mve_##FN##h,                             \
-        };                                                      \
-        return do_2shift(s, a, fns[a->size], false);            \
+#define DO_VSHLL(INSN, FN)                                              \
+    static bool trans_##INSN(DisasContext *s, arg_2shift *a)            \
+    {                                                                   \
+        static MVEGenTwoOpShiftFn * const fns[] = {                     \
+            gen_helper_mve_##FN##b,                                     \
+            gen_helper_mve_##FN##h,                                     \
+        };                                                              \
+        return do_2shift_vec(s, a, fns[a->size], false, do_gvec_##FN);  \
     }
 
+/*
+ * For the VSHLL vector helpers, the vece is the size of the input
+ * (ie MO_8 or MO_16); the helpers want to work in the output size.
+ * The shift count can be 0..<input size>, inclusive. (0 is VMOVL.)
+ */
+static void do_gvec_vshllbs(unsigned vece, uint32_t dofs, uint32_t aofs,
+                            int64_t shift, uint32_t oprsz, uint32_t maxsz)
+{
+    unsigned ovece = vece + 1;
+    unsigned ibits = vece == MO_8 ? 8 : 16;
+    tcg_gen_gvec_shli(ovece, dofs, aofs, ibits, oprsz, maxsz);
+    tcg_gen_gvec_sari(ovece, dofs, dofs, ibits - shift, oprsz, maxsz);
+}
+
+static void do_gvec_vshllbu(unsigned vece, uint32_t dofs, uint32_t aofs,
+                            int64_t shift, uint32_t oprsz, uint32_t maxsz)
+{
+    unsigned ovece = vece + 1;
+    tcg_gen_gvec_andi(ovece, dofs, aofs,
+                      ovece == MO_16 ? 0xff : 0xffff, oprsz, maxsz);
+    tcg_gen_gvec_shli(ovece, dofs, dofs, shift, oprsz, maxsz);
+}
+
+static void do_gvec_vshllts(unsigned vece, uint32_t dofs, uint32_t aofs,
+                            int64_t shift, uint32_t oprsz, uint32_t maxsz)
+{
+    unsigned ovece = vece + 1;
+    unsigned ibits = vece == MO_8 ? 8 : 16;
+    if (shift == 0) {
+        tcg_gen_gvec_sari(ovece, dofs, aofs, ibits, oprsz, maxsz);
+    } else {
+        tcg_gen_gvec_andi(ovece, dofs, aofs,
+                          ovece == MO_16 ? 0xff00 : 0xffff0000, oprsz, maxsz);
+        tcg_gen_gvec_sari(ovece, dofs, dofs, ibits - shift, oprsz, maxsz);
+    }
+}
+
+static void do_gvec_vshlltu(unsigned vece, uint32_t dofs, uint32_t aofs,
+                            int64_t shift, uint32_t oprsz, uint32_t maxsz)
+{
+    unsigned ovece = vece + 1;
+    unsigned ibits = vece == MO_8 ? 8 : 16;
+    if (shift == 0) {
+        tcg_gen_gvec_shri(ovece, dofs, aofs, ibits, oprsz, maxsz);
+    } else {
+        tcg_gen_gvec_andi(ovece, dofs, aofs,
+                          ovece == MO_16 ? 0xff00 : 0xffff0000, oprsz, maxsz);
+        tcg_gen_gvec_shri(ovece, dofs, dofs, ibits - shift, oprsz, maxsz);
+    }
+}
+
 DO_VSHLL(VSHLL_BS, vshllbs)
 DO_VSHLL(VSHLL_BU, vshllbu)
 DO_VSHLL(VSHLL_TS, vshllts)
-- 
2.20.1

