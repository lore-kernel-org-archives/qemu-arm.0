Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4044542lfm;
        Mon, 24 May 2021 18:56:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGnCKnxlJJlgNmsCYQokcqswR3pLAd4knmtk3rkxXzCmLukEaTm9zmvPFsUu0yz/+fXbnO
X-Received: by 2002:a05:6602:242b:: with SMTP id g11mr16608431iob.105.1621907779044;
        Mon, 24 May 2021 18:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621907779; cv=none;
        d=google.com; s=arc-20160816;
        b=ecWb/SXgbvyq/JQdx/uGqEEKOU5AHItOiFwRVoqado9PmDnWz3sqtAp+iI+ZU5WEj9
         J6Bp9CGNEqogiXAwLcI+LjAn33/PEhM3XcORVplursvfUBq2QIZAD88UxlCxeTqP3L94
         5S4FdoHSFwyCzuAQw4AyLCAU4M1lL6/m7KmoCqBxY+S+epUujPXM9jhSCsyq2MF56zjU
         /UGW5hBsO1yhMJKPBrpkPs4fR2WHK7exVaoM3keft0JuGz9ZfPs6mchwJj0R1HDmCo9f
         BBTaqQRthzVDzENu0cFRlCBvB22iOVQOsJztujl4ZVBuxO6w4hHHj7JyMT/7w1ZxgTzc
         wEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nAnCZLz+MRigDJDZpVvfWKaVfWlaQMDaEQ15z1KDlqw=;
        b=WjaYPCeGZBZivi6nh+EHrWC32p2W1vPfNHbuCIcWbtRPuASAKc67XSmjJjGUjAdx0x
         2/AwcIwOuJXf0Xc2lRxS7nTWQQh5RwFDvd7LBVp8qDgZ4IGgu/03sHusF7IuWq8yLnlS
         Pw5hSwNtjKLTQKagHJimJIGdTFFS3HZ8q3jbvJr51iIIqE/aXn9i9+WU+UY486LI/xRt
         4ZOJ11ppIxXsrxdIPTyAWXS9UWcnj+NzYbdRjyFn81uN7QIDZUCE4eIUPwZvCGJUYm2g
         xfqvZUfb07IIM7ByB08xRYaTh6UXXXAGLdkB0mgxsls2ASmiILkG15sc1wH4eIVyfziq
         g71Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X2Boind6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7si16204292jat.98.2021.05.24.18.56.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:56:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X2Boind6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMIs-0003x1-Aq
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLY7-0008H6-UW
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:07:59 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:37525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXr-00046I-Jr
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:07:57 -0400
Received: by mail-pl1-x62f.google.com with SMTP id u7so6943350plq.4
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nAnCZLz+MRigDJDZpVvfWKaVfWlaQMDaEQ15z1KDlqw=;
 b=X2Boind6meauKW67aXkIfxA9DnmqGVI+R8Rs1fAzr+5FbaoTWPbL30HMmneSGcrxjd
 qizAh16aUCgDQ7wc9qLe+5Z0e0SbB7jGz9OiwW75o68db/jOgplcEXOojFEbSjzxtsyO
 CDTy6nev7t6luKXmXDnXy4FUK4umTdMVZCqBOx7B1dFXlmUVQ2FMpr2S/tIVPjQMSa6J
 G3EHjSkvy7BC+pzH/u2Qkn19ZuShWfhcFqjIlUxI8JGp/623/b+nYl594E1BKWdExRrD
 vva8Q48PN+6cJCd82AC6H352CJgz6NKCA03w7jdHKk74/HfN1nFc9RnMFSJu6X5khpRf
 dJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nAnCZLz+MRigDJDZpVvfWKaVfWlaQMDaEQ15z1KDlqw=;
 b=G7/HC9YeL+2H1+y9thGfmoguEg2HpQkroEMYMZyXHHAsqEMn+7jBtAGMcAnA7kkYNG
 wvMPKu57oOhI5WKiNu2QUFwZB0oSBsrsV9hO6BlwwKRIhi6TLr2skZ4dw3kTKB/rYTFt
 yZLpstNSkyIZEI+AikNzBqXT+ugVLbwi9MQv/Ss0+SifqV/NwV3Wp8/6y+tq+JjkhH/H
 6iKXrzw+hw336Fp5mx85657coXKMo+kvM9JKexEMDG8JBphMukWya3/II7WDgVkI8BZP
 K9rJaWOs0JDQt8/V2ZKaNCxkm70LVEFoic4uWjAMQsKuYyncxNeEYb0GvPIgI/Na9kJ0
 KzbQ==
X-Gm-Message-State: AOAM531A1PcxgPoC/oNsPhzzp2VrA3yNfu8SbjoAeV+8b7uJtUreV86h
 PL//+vtjSd1ycsqxeqI3ZUGu/KqyjzxffQ==
X-Received: by 2002:a17:90a:b796:: with SMTP id
 m22mr2058749pjr.146.1621904860670; 
 Mon, 24 May 2021 18:07:40 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 67/92] target/arm: Implement SVE mixed sign dot product
Date: Mon, 24 May 2021 18:03:33 -0700
Message-Id: <20210525010358.152808-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z95tLA2PPND3

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  1 +
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 target/arm/vec_helper.c    |  1 +
 4 files changed, 22 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index e4c6458f98..2e212ae96b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -612,6 +612,7 @@ DEF_HELPER_FLAGS_5(gvec_sdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_udot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_sdot_idx_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index c6b32a3f69..9f037fe5a7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1530,6 +1530,10 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
+## SVE mixed sign dot product
+
+USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
+
 ### SVE2 floating point matrix multiply accumulate
 
 FMMLA           01100100 .. 1 ..... 111001 ..... .....  @rda_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 30894a4143..ae078b095a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8132,3 +8132,19 @@ static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
     }
     return true;
 }
+
+static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
+{
+    if (a->esz != 2 || !dc_isar_feature(aa64_sve_i8mm, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           vsz, vsz, 0, gen_helper_gvec_usdot_b);
+    }
+    return true;
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index f128b41eac..21ae1258f2 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -566,6 +566,7 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
 
 DO_DOT(gvec_sdot_b, int32_t, int8_t, int8_t)
 DO_DOT(gvec_udot_b, uint32_t, uint8_t, uint8_t)
+DO_DOT(gvec_usdot_b, uint32_t, uint8_t, int8_t)
 DO_DOT(gvec_sdot_h, int64_t, int16_t, int16_t)
 DO_DOT(gvec_udot_h, uint64_t, uint16_t, uint16_t)
 
-- 
2.25.1

