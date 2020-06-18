Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1259181lfm;
        Wed, 17 Jun 2020 21:27:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU82d1DNdtwaq68GGjL93fSnM3VIKk1OO17Gm3i+O0WbIxTlqGLCAmUw3lZXPm8RBOcgx2
X-Received: by 2002:a25:7003:: with SMTP id l3mr3509775ybc.380.1592454433612;
        Wed, 17 Jun 2020 21:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592454433; cv=none;
        d=google.com; s=arc-20160816;
        b=hapCd0PHWp/EzZI4T06XxbZTchpfPuWsZIKcUWxpDDpyPfe5iXgmIfPx60XV3FqU0W
         //vhQXgLEozCtvn+1sm+ZoJlklW/k9gI8qCT+4Oox1RnPgtNFDNHe3mBpTlWbiXw1Ayr
         t32+GCFBaUgxrTvHchUbtaG3+UJKfZ4VSiKFm+lTVAMZU2xPR2BIxFo0mmEIROaeEvt7
         VIQ5cllc21Laxq5qzqk+4QbV5HQ2x77c/LcRdAZDH8k8tMFqmyG5Ue20HnrxUKUjEhdn
         nHvzNDUyBkjuPkXEJ5/T5wbJSo1TVoOJU3CJEew99cVAVTniUd8YXeWcCTKh7MI3LX5e
         Rskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=s4wGmXAIkyJLsPXTOxLRpkXsjobp8ryXeXVLTjvMEOw=;
        b=BHpd8HK7qhrUZzmvG22hZsSVs9RSYtxOh9N0x+mhZqBb9ibC50oCw6iHDuNUujZwPn
         P6grOBvP3C1p/H0eaOxXw8Eb7cf1hnE3LHLEHQ+V54KDXm6uNYlio1kYnvdKKWv0gaKG
         dUMcI5jvwcZVJlznARzNW09do/66PnceihCpsqlcmibFz/yJ+TMx4oT4yBJQBFCAOf6/
         ijA7NQzWHy76hGVzr84Ea779Vkqot3XoPEHQ7ykI7kDGOHBJ6RAVEEJOIq4NuDavq9Hc
         Z/tFQbyH+EmrL9n5EfXCGs4snEV9c2cH8HrFdS1ZKTXquryO3AhCe+wZhsDL051XTJov
         loFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Yf0rlRMK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i205si1341379yba.151.2020.06.17.21.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:27:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Yf0rlRMK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlm8u-0002C4-UH
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm8d-0001jQ-Cg
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:26:55 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:39003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlm8b-0002GK-Ka
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:26:55 -0400
Received: by mail-pg1-x543.google.com with SMTP id v11so2330814pgb.6
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s4wGmXAIkyJLsPXTOxLRpkXsjobp8ryXeXVLTjvMEOw=;
 b=Yf0rlRMKLpPaa9dg+YIf886Pe/rQjbGakYMGacDc603PSHbnpw+ciOY4/njNbM57OG
 djrqXLZo2B0RK8F1e/uf5Z1pfbIF9Z4MOsW4C6VMTs7+rXWdBERDzutL/k3k7fPA+i5M
 oU8wIt3qbO/8ZLXUtV3biJzDCzvC+X9F8MPL9qIZz3NsCaE9t55imLiBof/+w7cq7DWR
 tGoQzSCImcIU4lNLEJwzistEZ9dl/u1Y4xgSe2fQemt72PuqG2Jv/fU2DCQ/AYB4O5QS
 BKq+qSqW0qP7KY7R+tGHXIa+DbVpIvc98aHbnRWpo7JK7qJCZQTReMP6hl+IXv9bEeg2
 lQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s4wGmXAIkyJLsPXTOxLRpkXsjobp8ryXeXVLTjvMEOw=;
 b=NVyEoyFFd3ROVWe7upuBw9SA9RXoVnxVMb/gOyJPAlx/72WK3Xj0di/OCe4MRiCuZw
 CgC5AG+R0bw7Sja1kJ1JhM+kPTHzea06foHr36LaXc8PRvGrBLY05GlrREimBEgkdp1r
 cBRDWpxquTZ1QlV1Bc5DRLwpQTlXCZtVYfxqepDox7VhiR+onB+b+dK0fd+jgTesEKRa
 oybKqPeKJYiHcpE0MGrgwwAAhWMosQDUA3NTlxq9d0/DqRILNt4BMbTD3Qi6tc4+jOnj
 dBHn/XOEU+OkOov+B75vV+D5icqGOiAC/lok8Vwig7WzaJvML6ncb31JPOYEA58rYp4o
 PNxg==
X-Gm-Message-State: AOAM531ROfXHexu01yMSSKjiMMxfGeOgIZKUyuQXB76k+UQofMaUKfQ3
 /bs+E7X1AqB9plt6VNv/YnrjVQ==
X-Received: by 2002:a62:3806:: with SMTP id f6mr1946040pfa.102.1592454412278; 
 Wed, 17 Jun 2020 21:26:52 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id o16sm1162035pgg.57.2020.06.17.21.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:26:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 004/100] target/arm: Split out gen_gvec_fn_zzz, do_zzz_fn
Date: Wed, 17 Jun 2020 21:25:08 -0700
Message-Id: <20200618042644.1685561-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
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
X-TUID: p02HopivJTL5

Model gen_gvec_fn_zzz on gen_gvec_fn3 in translate-a64.c, but
indicating which kind of register and in which order.

Model do_zzz_fn on the other do_foo functions that take an
argument set and verify sve enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 43 +++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bc286331cb..a8d5c7421d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -153,16 +153,13 @@ static void gen_gvec_fn_zz(DisasContext *s, GVecGen2Fn *gvec_fn,
 }
 
 /* Invoke a vector expander on three Zregs.  */
-static bool do_vector3_z(DisasContext *s, GVecGen3Fn *gvec_fn,
-                         int esz, int rd, int rn, int rm)
+static void gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
+                            int esz, int rd, int rn, int rm)
 {
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        gvec_fn(esz, vec_full_reg_offset(s, rd),
-                vec_full_reg_offset(s, rn),
-                vec_full_reg_offset(s, rm), vsz, vsz);
-    }
-    return true;
+    unsigned vsz = vec_full_reg_size(s);
+    gvec_fn(esz, vec_full_reg_offset(s, rd),
+            vec_full_reg_offset(s, rn),
+            vec_full_reg_offset(s, rm), vsz, vsz);
 }
 
 /* Invoke a vector move on two Zregs.  */
@@ -274,24 +271,32 @@ const uint64_t pred_esz_masks[4] = {
  *** SVE Logical - Unpredicated Group
  */
 
+static bool do_zzz_fn(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *gvec_fn)
+{
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzz(s, gvec_fn, a->esz, a->rd, a->rn, a->rm);
+    }
+    return true;
+}
+
 static bool trans_AND_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_vector3_z(s, tcg_gen_gvec_and, 0, a->rd, a->rn, a->rm);
+    return do_zzz_fn(s, a, tcg_gen_gvec_and);
 }
 
 static bool trans_ORR_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_vector3_z(s, tcg_gen_gvec_or, 0, a->rd, a->rn, a->rm);
+    return do_zzz_fn(s, a, tcg_gen_gvec_or);
 }
 
 static bool trans_EOR_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_vector3_z(s, tcg_gen_gvec_xor, 0, a->rd, a->rn, a->rm);
+    return do_zzz_fn(s, a, tcg_gen_gvec_xor);
 }
 
 static bool trans_BIC_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_vector3_z(s, tcg_gen_gvec_andc, 0, a->rd, a->rn, a->rm);
+    return do_zzz_fn(s, a, tcg_gen_gvec_andc);
 }
 
 /*
@@ -300,32 +305,32 @@ static bool trans_BIC_zzz(DisasContext *s, arg_rrr_esz *a)
 
 static bool trans_ADD_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_vector3_z(s, tcg_gen_gvec_add, a->esz, a->rd, a->rn, a->rm);
+    return do_zzz_fn(s, a, tcg_gen_gvec_add);
 }
 
 static bool trans_SUB_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_vector3_z(s, tcg_gen_gvec_sub, a->esz, a->rd, a->rn, a->rm);
+    return do_zzz_fn(s, a, tcg_gen_gvec_sub);
 }
 
 static bool trans_SQADD_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_vector3_z(s, tcg_gen_gvec_ssadd, a->esz, a->rd, a->rn, a->rm);
+    return do_zzz_fn(s, a, tcg_gen_gvec_ssadd);
 }
 
 static bool trans_SQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_vector3_z(s, tcg_gen_gvec_sssub, a->esz, a->rd, a->rn, a->rm);
+    return do_zzz_fn(s, a, tcg_gen_gvec_sssub);
 }
 
 static bool trans_UQADD_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_vector3_z(s, tcg_gen_gvec_usadd, a->esz, a->rd, a->rn, a->rm);
+    return do_zzz_fn(s, a, tcg_gen_gvec_usadd);
 }
 
 static bool trans_UQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_vector3_z(s, tcg_gen_gvec_ussub, a->esz, a->rd, a->rn, a->rm);
+    return do_zzz_fn(s, a, tcg_gen_gvec_ussub);
 }
 
 /*
-- 
2.25.1

