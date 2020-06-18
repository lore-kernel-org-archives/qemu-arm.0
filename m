Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1260779lfm;
        Wed, 17 Jun 2020 21:29:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOF75tOv8HK4mfsgEdqc4TQi6sdn8CESrgPVuCbY79MwAQp7QJWU6tGanzNBwiRsGFGmnn
X-Received: by 2002:a25:50d5:: with SMTP id e204mr3471345ybb.72.1592454588819;
        Wed, 17 Jun 2020 21:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592454588; cv=none;
        d=google.com; s=arc-20160816;
        b=ZRUN4jlmTaslLlbCcQzxx0SO9ndv+2XvABwsSt8vl4nurpkhpvEARlNkVEtfDf0XoL
         WFYWMzEcpkCSijnJ+I/8DTqz/CXeBgqhBthAhpv6tZqv6JEMpgDmCQx5nGwP7RdPLP+x
         e5+390dldNvO0aJ3AMmBRZpogPyQ8ww1POLF3MBKU2NP8vLMBwvfKBUFsZuvTaAiqd9N
         btKVDFwXOS9s0slF3ZKphE6oDHNY950lw/GciqWs5MMZRdH7l/OPS41U7oGrOXgdIN2M
         +DPFxNASlQAX1VGG0GfZwM26Q0JmJb3BNUFvderdl5CZowyOAh3I9QFXfxW0sbxigasv
         1ZhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CK2elIXOTHImMlsaoqCYUcyN3xToI2uVAuloYRoKKNU=;
        b=0SJ1B3inAEvsxKqKXKs449hBqMYUxKy8l4/CqrXyNmeFCj0EFUMI/MzbniyZhj0QXG
         j5JQ3BuU8mxPsRDxq0MxMz0jtZRMonz493L3/b+2+rrcNl4RSfW5j5ky52OpFmNKsT3x
         TM1ZIo54uzIB/Qf/dj3G0Fr7tC/cluz/P47ymNJBR94ATJh8S+5QKGrzhEvkRlx5Db7k
         Jn3F84DRzewWpAr+hLIjIqrGIYJnxW49S73W0WjnAf1IBLN7a+7o2GvLF903sbNo/YGv
         7YZg7W8e7DTwHhwrWOGkH4WWvdYrNDY2GPbzggEfXFLq5AeCkVhuLYmCg5aN4v+RlRb/
         2F3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xD939vyX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i81si1667894yba.193.2020.06.17.21.29.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:29:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xD939vyX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmBQ-0007ld-3S
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9I-00038m-Nt
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:27:36 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm9F-0002Qk-S9
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:27:36 -0400
Received: by mail-pf1-x443.google.com with SMTP id x207so2198159pfc.5
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CK2elIXOTHImMlsaoqCYUcyN3xToI2uVAuloYRoKKNU=;
 b=xD939vyXfZYH4ys3CkLFzVHUvh2tO662tbDdcZ1P4ZfLHGg+NwA1GXvP2gC/XN0B5m
 VeOTF+t98N7pEl41xhtfOOxuvX4kZFocX5iWsLAh0WfN3r7hC65uUolMocOv+qQLaD3c
 y4/8yXfqiUxD3JW0XARvcr9axxXvPt60mX9komdgg7g8jRRvfJLys1YXg9wKcCWEZj/C
 yBS9rXSv7i4TgvyqDxFWGGg4d8mZJ3f1VLPXVQlmU7+J98CeTEYKLCsny7h8e0gfdAdS
 2v1Fgwrb0qiQNVhCQUzTLzodNunUUP/g7rIhqyR0WQnZW4yWPn9G37JVps1OPqh/+aWX
 7Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CK2elIXOTHImMlsaoqCYUcyN3xToI2uVAuloYRoKKNU=;
 b=TRBwWm/DVQui5ywjg+FMFQxJeM9xhkfKEiL+3Vzz5P26ydgTqjMrLq2HVXp7CUgHE+
 OZTkOblK16eERq8GlwqJexiyI2QyBLBfoxeBpQrP/4w5FpL0K/q/cc/F2xsh8OfZnBhN
 OTfU9QzLKXLzEIFq68hjNybEmBkNBwAWFaIqcz5LntS2Euj8rvsbKMP1EbqzC/OAeFI8
 HCP/tkRj3VhWAUCU0kEbMBM0WvJSoY6xuQICkGiGCAULuUA3BLOZ/aBOCHS1ggKBcldZ
 FOoI/MAjtLo8AJTPBRbZ0A8yJUcL53sitMJT3g8GGfTtgriW+NlhV1kJC2NHlyFXFMxU
 hrRQ==
X-Gm-Message-State: AOAM531wMGCWpj59+P0JIiYAZalgf/Df/7lkaa6Z1ycEy+ElDU7SV4kH
 Un9wUPMpVy6UxCwY1Oj1gAigLA==
X-Received: by 2002:a63:7c56:: with SMTP id l22mr1765420pgn.127.1592454452054; 
 Wed, 17 Jun 2020 21:27:32 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id u61sm964897pjb.7.2020.06.17.21.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:27:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 011/100] target/arm: Split out gen_gvec_ool_zzp
Date: Wed, 17 Jun 2020 21:25:15 -0700
Message-Id: <20200618042644.1685561-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BCg6JjKmfIbA

Model after gen_gvec_fn_zzz et al.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 9687606a93..3e9bbaca94 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -142,6 +142,17 @@ static int pred_gvec_reg_size(DisasContext *s)
     return size_for_gvec(pred_full_reg_size(s));
 }
 
+/* Invoke an out-of-line helper on 2 Zregs and a predicate. */
+static void gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
+                             int rd, int rn, int pg, int data)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       pred_full_reg_offset(s, pg),
+                       vsz, vsz, data, fn);
+}
+
 /* Invoke an out-of-line helper on 3 Zregs and a predicate. */
 static void gen_gvec_ool_zzzp(DisasContext *s, gen_helper_gvec_4 *fn,
                               int rd, int rn, int rm, int pg, int data)
@@ -415,11 +426,7 @@ static bool do_zpz_ool(DisasContext *s, arg_rpr_esz *a, gen_helper_gvec_3 *fn)
         return false;
     }
     if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           pred_full_reg_offset(s, a->pg),
-                           vsz, vsz, 0, fn);
+        gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, 0);
     }
     return true;
 }
@@ -603,11 +610,7 @@ static bool do_movz_zpz(DisasContext *s, int rd, int rn, int pg,
     };
 
     if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
-                           vec_full_reg_offset(s, rn),
-                           pred_full_reg_offset(s, pg),
-                           vsz, vsz, invert, fns[esz]);
+        gen_gvec_ool_zzp(s, fns[esz], rd, rn, pg, invert);
     }
     return true;
 }
@@ -616,11 +619,7 @@ static bool do_zpzi_ool(DisasContext *s, arg_rpri_esz *a,
                         gen_helper_gvec_3 *fn)
 {
     if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           pred_full_reg_offset(s, a->pg),
-                           vsz, vsz, a->imm, fn);
+        gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, a->imm);
     }
     return true;
 }
-- 
2.25.1

