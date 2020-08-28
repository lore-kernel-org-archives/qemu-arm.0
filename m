Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1693003lfc;
        Fri, 28 Aug 2020 11:42:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTDdphzYTxCiNY3RVh7zFCgZwKmzoOFxYoXwku9oSGSEqz2+4CtQnu9Rj/3PHbH/xFM6LQ
X-Received: by 2002:a25:f30a:: with SMTP id c10mr3835247ybs.522.1598640151218;
        Fri, 28 Aug 2020 11:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598640151; cv=none;
        d=google.com; s=arc-20160816;
        b=YCQKiNkgcuygP4y77yyBdKYy0sZheWojbOgCY8HRYzR+Ebgs+UlyhETOyZB3x8qDHR
         IsJEOOcRrBnk+6Oh1dph5Wc/LjPN3KHK/OfSe/d2RCTYOfSS50o/EiBbyY9VeYtIsQym
         jGWnF1UbVacSbfr6VcejGCTtHPJ8s0DPMbCYzXZX3m2Maavulm9dDnGNDL9oqAUlI5gJ
         dJXVkwykQHdUThyMBXoUeYSm53fGdvbJQ2zyhiB5HIYQBTqw1xE6vQg4NcHpHK0ECaDx
         E4fi4T07qlMtSUL9vofAiSa+UcotmEamde7W9c+0ORRzTZv592YuaLXqzVfrXIXH6lBg
         ZkLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FHUFQV4FXXHkAhMkndvZsQ9Vo9mjapkfHTwxSOIt/l0=;
        b=CRZHluDHtXlqiVzhLQqzkE5gWznSgMLKqn7FxzGFkDXXvYv9NNduJY9q+wVdCF+TpF
         Wo69DzEn+mJUba2n5e4n4ipMqn5RuEin5AazXdaJ0qQXlWAFBFwhG+ZQXb95Tkd2hzsT
         1h4qKFSIZBTpy7gyZ/7aiAxpB2zB4wXkFKVN+2sifEu01PSYqkL4ShdJtNGJQ6LNQQ7k
         taZ0BRIDXtka5pQBf3q7LyxNQ+HE3wMvYWnpvoa0WQ98eAFVZa5YnGee/y69Ul48YD1C
         82rtiq6u9KZVnb59Lyk7Wmn+hnGMEtVtRrR0t5dD7UtieuvP6VxfBo7E0FLOxuRD1sij
         ctzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wA1LJRFm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o77si107220ybg.74.2020.08.28.11.42.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:42:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wA1LJRFm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjKY-0006Pt-F6
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCg-0002Pq-Ig
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:22 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCZ-0005xh-5U
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:22 -0400
Received: by mail-wr1-x443.google.com with SMTP id i7so23742wre.13
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FHUFQV4FXXHkAhMkndvZsQ9Vo9mjapkfHTwxSOIt/l0=;
 b=wA1LJRFmANZRhoMDSzF/eLoNuFzKYRS7FgDydVoMnQxheKrL+cb3yy09zcgwh9gzsn
 c2ACeUIE4TjscPAmEYOvWasQwrdkhticOuX1LKF/8Kw1Pm91nKVvv4JEN+bKClWr9hts
 +EAT+/lI4v/rjCO2OUy4SVCagy3rVp7QoKcMu/5yhPyLqs+qlWkqLkWLVYY0pIo4C1kT
 Tz0tDNKcbVSyGWttngYi+K9Bkbq08NzNBF92sRGicrncd1g99TPGKNu8BxxX8qnWa+y7
 flhkq97fjte91cjlMB2Ud8ZxreAjWrElkpxfr+MTiEfjmramAAPL652FMxLMe6agV/wL
 5ScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FHUFQV4FXXHkAhMkndvZsQ9Vo9mjapkfHTwxSOIt/l0=;
 b=fdIJg6qUbdVGMa/caa4o8xoMG7hV4H8BxSaxAlufqpjkhK5FNAh9RkyLnvQcGBpfjb
 /PizU6N+Bz/FUahOy+lZGvViuNlsPRbG5OQOWX8QrcSwWvJByCRH+PzAIEYOK9Pd9OEZ
 57uKy28iCb02zdAIhVMkhDhvc8XC6qR5rVAAM+viaQx4PyMjJlAE4RtMIAFNiIc/AgQE
 fMIbg4otmG+ImWm4Ws2K5j+KDJ7PltRX1sQy4DszwuBWW7o8T+UC1355/YQ6T1Fdrh51
 mI/SWxNqNilv7xoSQ8k42jzqlMiKNokYgAsXXP3noeiRN8LdKgVPTTqVvKAJjCBSsPj+
 mJOQ==
X-Gm-Message-State: AOAM531m1AISUTj7AsAzdIJSJ5PclnWh1UFXX+TjXmhaRQJMDP+oRAf+
 XzwyLQuDAfytHIIQU15EMNOX2Eiak2gkVwh7
X-Received: by 2002:adf:dd44:: with SMTP id u4mr266229wrm.366.1598639652225;
 Fri, 28 Aug 2020 11:34:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 13/45] target/arm: Make VFP_CONV_FIX macros take separate
 float type and float size
Date: Fri, 28 Aug 2020 19:33:22 +0100
Message-Id: <20200828183354.27913-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Py3yvBNp9+e

Currently the VFP_CONV_FIX macros take a single fsz argument for the
size of the float type, which is used both to select the name of
the functions to call (eg float32_is_any_nan()) and also for the
type to use for the float inputs and outputs (eg float32).

Separate these into fsz and ftype arguments, so that we can use them
for fp16, which uses 'float16' in the function names but is still
passing inputs and outputs in a 32-bit sized type.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vfp_helper.c | 46 ++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 55aa38f0ce8..7650890d440 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -394,13 +394,13 @@ float32 VFP_HELPER(fcvts, d)(float64 x, CPUARMState *env)
 }
 
 /* VFP3 fixed point conversion.  */
-#define VFP_CONV_FIX_FLOAT(name, p, fsz, isz, itype) \
-float##fsz HELPER(vfp_##name##to##p)(uint##isz##_t  x, uint32_t shift, \
+#define VFP_CONV_FIX_FLOAT(name, p, fsz, ftype, isz, itype)            \
+ftype HELPER(vfp_##name##to##p)(uint##isz##_t  x, uint32_t shift,      \
                                      void *fpstp) \
 { return itype##_to_##float##fsz##_scalbn(x, -shift, fpstp); }
 
-#define VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, isz, itype, ROUND, suff)   \
-uint##isz##_t HELPER(vfp_to##name##p##suff)(float##fsz x, uint32_t shift, \
+#define VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, ftype, isz, itype, ROUND, suff) \
+uint##isz##_t HELPER(vfp_to##name##p##suff)(ftype x, uint32_t shift,      \
                                             void *fpst)                   \
 {                                                                         \
     if (unlikely(float##fsz##_is_any_nan(x))) {                           \
@@ -410,30 +410,30 @@ uint##isz##_t HELPER(vfp_to##name##p##suff)(float##fsz x, uint32_t shift, \
     return float##fsz##_to_##itype##_scalbn(x, ROUND, shift, fpst);       \
 }
 
-#define VFP_CONV_FIX(name, p, fsz, isz, itype)                   \
-VFP_CONV_FIX_FLOAT(name, p, fsz, isz, itype)                     \
-VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, isz, itype,               \
+#define VFP_CONV_FIX(name, p, fsz, ftype, isz, itype)            \
+VFP_CONV_FIX_FLOAT(name, p, fsz, ftype, isz, itype)              \
+VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, ftype, isz, itype,        \
                          float_round_to_zero, _round_to_zero)    \
-VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, isz, itype,               \
+VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, ftype, isz, itype,        \
                          get_float_rounding_mode(fpst), )
 
-#define VFP_CONV_FIX_A64(name, p, fsz, isz, itype)               \
-VFP_CONV_FIX_FLOAT(name, p, fsz, isz, itype)                     \
-VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, isz, itype,               \
+#define VFP_CONV_FIX_A64(name, p, fsz, ftype, isz, itype)        \
+VFP_CONV_FIX_FLOAT(name, p, fsz, ftype, isz, itype)              \
+VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, ftype, isz, itype,        \
                          get_float_rounding_mode(fpst), )
 
-VFP_CONV_FIX(sh, d, 64, 64, int16)
-VFP_CONV_FIX(sl, d, 64, 64, int32)
-VFP_CONV_FIX_A64(sq, d, 64, 64, int64)
-VFP_CONV_FIX(uh, d, 64, 64, uint16)
-VFP_CONV_FIX(ul, d, 64, 64, uint32)
-VFP_CONV_FIX_A64(uq, d, 64, 64, uint64)
-VFP_CONV_FIX(sh, s, 32, 32, int16)
-VFP_CONV_FIX(sl, s, 32, 32, int32)
-VFP_CONV_FIX_A64(sq, s, 32, 64, int64)
-VFP_CONV_FIX(uh, s, 32, 32, uint16)
-VFP_CONV_FIX(ul, s, 32, 32, uint32)
-VFP_CONV_FIX_A64(uq, s, 32, 64, uint64)
+VFP_CONV_FIX(sh, d, 64, float64, 64, int16)
+VFP_CONV_FIX(sl, d, 64, float64, 64, int32)
+VFP_CONV_FIX_A64(sq, d, 64, float64, 64, int64)
+VFP_CONV_FIX(uh, d, 64, float64, 64, uint16)
+VFP_CONV_FIX(ul, d, 64, float64, 64, uint32)
+VFP_CONV_FIX_A64(uq, d, 64, float64, 64, uint64)
+VFP_CONV_FIX(sh, s, 32, float32, 32, int16)
+VFP_CONV_FIX(sl, s, 32, float32, 32, int32)
+VFP_CONV_FIX_A64(sq, s, 32, float32, 64, int64)
+VFP_CONV_FIX(uh, s, 32, float32, 32, uint16)
+VFP_CONV_FIX(ul, s, 32, float32, 32, uint32)
+VFP_CONV_FIX_A64(uq, s, 32, float32, 64, uint64)
 
 #undef VFP_CONV_FIX
 #undef VFP_CONV_FIX_FLOAT
-- 
2.20.1

