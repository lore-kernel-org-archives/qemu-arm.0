Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4041807lfm;
        Mon, 24 May 2021 18:51:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9A0UZxmvRuCwJznbRH0SFCDNO8+3q4Uyac4NUgOtkGZ/RLzwq3mmTkFjD4w0ZfpZGqdWq
X-Received: by 2002:a25:a89:: with SMTP id 131mr39324567ybk.300.1621907493066;
        Mon, 24 May 2021 18:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621907493; cv=none;
        d=google.com; s=arc-20160816;
        b=rfKIgfUEORQNwf7kM1DnQ9Y5Kaogp1MATk16t9r0ZDw1bo2d8q3iLrnP76BrSSet8B
         D/KfB381zlFHMX1sw37flfyNd010V6v6t1uY/HRnHsdFm7yLJHN7ATzjypEVdb4I7HP7
         pb7C+5iD0Zp3qCqAPga/rdpgEDtZrTRBADWEhC3EGsngvFtdkqC6NTLLlXYzxNZWcxUL
         9mdl32U+64xDayLiXBByrIKNwgMmimayM8LXDnKn94QYh/4Pdla+EBMQ8wrJv8ZIapsV
         nq/ZA4vPRuxviSZfEuT30yz30tyt/TZVKDCxacAP7l2IjAe65fgdm6VQayeNe+XkEZdI
         1eEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=znRmUtPpPzNdkgxhCUoIISqXwMWpCGz1tEvasknwhl0=;
        b=AHzBl2l+nWi6r5aXVI0qLUeV1xhoK9XlWCdB5cJqepfo/g4aFOulJ/JUucemNysoNM
         pAY2uCzqCTR5GN909K4QBJOlQXqvgs/MeyOt6/X3Uu3D0kHNHqMgG7z9jU8hpsxVLDWt
         LkwBJn73A6OoLJByruCOnX3JFkDEVr4tEorUaGBRmZAyvVqiZvv+I0K+pLg121D7UmbP
         ZuxrUgNpVR/2FCud9MVB+5/vY53rANIzlh2N2SfoNufBd5iPJAZ1YGeekd6zu/05+sjx
         3U2x/BdgJiGVS+oqQIP2C/tQMheJT/5BGrqHKcWsf1ylO319ayTmIJsDAhbpeyVYW/gB
         /MBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j5YHUEF7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14si16135380ybu.313.2021.05.24.18.51.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:51:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j5YHUEF7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMEG-0008FU-Ch
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYR-0000hC-D2
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:19 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXs-00043p-47
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:19 -0400
Received: by mail-pf1-x42b.google.com with SMTP id 22so21881753pfv.11
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=znRmUtPpPzNdkgxhCUoIISqXwMWpCGz1tEvasknwhl0=;
 b=j5YHUEF77esK3OhPf0DtpTYt1FX9GDFvdcZc7maAJDS4GFZXr0eAmaCmAvgE47qJ7D
 QteP1209u6dym2+wu/HoFeq4i7DIwOjG9GuzNw+SfF1cqMQDxO0iE+bRtlUyL0pmLyx6
 RNpSYkj6NI6ASGsx11QylxiVbfvC21W95LYHRcYspEw9lbTEdBiaIErZtaJn+jUXPMNF
 XMiRZscE9L9z0WtN+S3kXRLH14eD92bXyzHNHDbLQmNTQMiMOwMZcamOA9ioXLunmhdh
 Ecu+b2wPbnB2oshTy6hcRTt7+p2j3jPLhX/Vo3hkjt3dxBJjE8vNeBJUQbJLS65vzj/K
 4tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=znRmUtPpPzNdkgxhCUoIISqXwMWpCGz1tEvasknwhl0=;
 b=KJSe1I6KdEYWwQrb/5h5Mx3pCwB8e2sOypyKemiQaHfHpy9lfGGb2C/M4bwMdWfyyL
 Mvez9FOGjbv8laFKOXcZRPM2Hwpt6kgfzfM06RhA7xYgv7cIK48i6p8Wg9ZEKP/8jDzd
 WX5WGrvyWFWHVRdcLBHlnhB+/V8YbAjaMXX8F1prQ6JN/65/jP/foBqtz+xBsOU3Bqrv
 sVkCyEMNxcphqxIZ+2U3ZHVB6NPu1DIaPK5K28CnrV1hB5J/qkODiFm2ULEOy9W7wrd8
 fw8z1wEZuzH2SUe9hWVA40z8ZPWToYW7xBUdvfB8o2F8ezJyF5vZ1pmG0Fy4UbUsb+9M
 cv5Q==
X-Gm-Message-State: AOAM530AVJD5kzNBnDK70VXM6u14hO941wWrzgCp9tv56WwTwL82aPlA
 G9WdBfB4BJe9hLgdi042QV9/UgbAP4ivyg==
X-Received: by 2002:a63:6f8e:: with SMTP id
 k136mr16602341pgc.326.1621904852971; 
 Mon, 24 May 2021 18:07:32 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 54/92] target/arm: Implement SVE2 integer multiply-add
 (indexed)
Date: Mon, 24 May 2021 18:03:20 -0700
Message-Id: <20210525010358.152808-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vw9P1+TLIwX8

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Split arguments to do_sve2_zzzz_data.
---
 target/arm/sve.decode      |  8 ++++++++
 target/arm/translate-sve.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 65cb0a2206..9bfaf737b7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -783,6 +783,14 @@ SDOT_zzxw_d     01000100 11 1 ..... 000000 ..... .....   @rrxr_1 esz=3
 UDOT_zzxw_s     01000100 10 1 ..... 000001 ..... .....   @rrxr_2 esz=2
 UDOT_zzxw_d     01000100 11 1 ..... 000001 ..... .....   @rrxr_1 esz=3
 
+# SVE2 integer multiply-add (indexed)
+MLA_zzxz_h      01000100 0. 1 ..... 000010 ..... .....   @rrxr_3 esz=1
+MLA_zzxz_s      01000100 10 1 ..... 000010 ..... .....   @rrxr_2 esz=2
+MLA_zzxz_d      01000100 11 1 ..... 000010 ..... .....   @rrxr_1 esz=3
+MLS_zzxz_h      01000100 0. 1 ..... 000011 ..... .....   @rrxr_3 esz=1
+MLS_zzxz_s      01000100 10 1 ..... 000011 ..... .....   @rrxr_2 esz=2
+MLS_zzxz_d      01000100 11 1 ..... 000011 ..... .....   @rrxr_1 esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index dbab067a53..39a6839de4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3866,6 +3866,37 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
+static bool do_sve2_zzzz_data(DisasContext *s, int rd, int rn, int rm, int ra,
+                              int data, gen_helper_gvec_4 *fn)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           vec_full_reg_offset(s, ra),
+                           vsz, vsz, data, fn);
+    }
+    return true;
+}
+
+#define DO_SVE2_RRXR(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
+    { return do_sve2_zzzz_data(s, a->rd, a->rn, a->rm, a->ra, a->index, FUNC); }
+
+DO_SVE2_RRXR(trans_MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
+DO_SVE2_RRXR(trans_MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
+DO_SVE2_RRXR(trans_MLA_zzxz_d, gen_helper_gvec_mla_idx_d)
+
+DO_SVE2_RRXR(trans_MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
+DO_SVE2_RRXR(trans_MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
+DO_SVE2_RRXR(trans_MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
+
+#undef DO_SVE2_RRXR
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.25.1

