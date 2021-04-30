Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp489518lfg;
        Fri, 30 Apr 2021 14:00:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN/p0zxBFsjAkHHWoRtsO8j9dTzqMEgMJ5JW3zSIPkiGPVwa82+jBhOPEQoBiRhnAQr8S/
X-Received: by 2002:a05:6e02:1bcb:: with SMTP id x11mr5789496ilv.87.1619816428430;
        Fri, 30 Apr 2021 14:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619816428; cv=none;
        d=google.com; s=arc-20160816;
        b=sH3AVfJROJn8BGJeEIN7eZBdFQmPjfxPTYbEgxZ854vt8sOSLbuiCayfOIcJws7Y8O
         EJ7OqkKC+Nk3CMKqYe8rgZvDtkSYpKPwFL1qGz5kp+xxU3TDDoOZ7hR3pajAjXmrombu
         /9eGXFaVmQnmOuWI5LjrGWr/GxOZwxZMPHpAQEYz0FuBsRDvag2qhnlSBbrq0FVah/HN
         HzPyKXOJzK10cU1oFpAuTs6lgn4bRcoYEwbRTBSyCiJar7GFzQqxtMls2xtDrIOXBZQd
         mIRSyvTP6Id/HsrfX9FfCwRsF0N2pAwMGVIY/H6E9PA0k68sEBGutQx2sC2/syqH6Df8
         MCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vUNPTNdfvzy60eNisdwBmT1BzT2snFcTBFFJdjdBzuE=;
        b=q1c69zm6SeaqT3QVyCwrAXpaTKzy/Y9SzPpYoM+yt/CAu6ASLc/rkexswK+MnH2kwX
         qQs29qtbFWXHguns2Zp6X83VXiziPN8GqeV0q5fBPgwfPm3mffxpW3rfhRyuXC7zEsKQ
         s5d98hujBv0IahCCpCLFgFjeO62cOzx5Qe9BcYf+LuY5/4VQTRfZrAwVYHBJhKbUO4Ht
         FPys/35fYIKqCPyCtI6ba5cgGMgqOScXQgL6412MNfQwnQ+vlaaIyNd3Qz8fct57DPc8
         BLqKfivf33cgIc3yHAT3IKTvhy8mg+764JuwaQ0QETUMdKkeegK9KH4gujrTRiBtngw6
         fDaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DWRfRI0B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si4833019iot.55.2021.04.30.14.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:00:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DWRfRI0B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaFP-0000ja-NG
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmF-0004KO-Bi
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:19 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007ke-3v
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:19 -0400
Received: by mail-pg1-x52f.google.com with SMTP id j189so3168329pgd.13
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vUNPTNdfvzy60eNisdwBmT1BzT2snFcTBFFJdjdBzuE=;
 b=DWRfRI0BB7QZZuEceoxeR1/ZAZZUh6tpSZDss6r1XAnGUzpDy4HrpR680862rsW7Vb
 2X2yejhu3Y+t7DtqKr+/SEvbSQawqeEFTxlG1xqh/geSIE6YIg7KDnTpI3YzWlJWmfqy
 rAtnxDcT2YaUBM1sVy3TmMZm5+4tfZ/ByBBnHM9Q9nhEowK6eIOfCF9jAs78xPF1FFOe
 x5e05SYSg2JiBd2/eauNZ9whFu1WTCBOFPn3YMMoat/UGizJMxpzATabdqIJHVkIGZGE
 5pCgjnCtwUUX28XGWRPewBzZRU76u7KkY2pdXneKsI4cdaANGSry++HKB4RFvfZSNPdx
 sNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vUNPTNdfvzy60eNisdwBmT1BzT2snFcTBFFJdjdBzuE=;
 b=MuKzFGeCCrcfpxT5MpFrVRDXlBB8W18F0OdY1pVjDZx4vMUF9ao8Zjk12xHe7a7Pe6
 PZR6TDTIpjeGL9cIk2EOcxU9YWD6oe+rmsTdp2DGh5VqUl4KTj+r83s1MPBXEIchdr1B
 JILbuTe66X5YrUaH1urdG92QYWwljLE14xd8hJU4B4Hz8U02M2IfLidUt38BhUpFvLyw
 CjskV9nPHxW8DsH4BU7l9kYWmmTSMXEcnIHKT0NTm03dv7Ax4Ivecf2xJajiqrZIUcu0
 Ff1wI1gGCfWnkPYthnC9FiQvSK2f+uFNdJPEnFkWO0NQftNVWBpanHCjxXgr75oPnihP
 bv9Q==
X-Gm-Message-State: AOAM533tsCRjYthRI3ya56f9YSXBMhQcSdFjrIGzGtqFYsvDm3hPz2c8
 609h6DuVVRou6JrN9Ch/k139XA==
X-Received: by 2002:a63:1f25:: with SMTP id f37mr6372080pgf.142.1619814588855; 
 Fri, 30 Apr 2021 13:29:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 60/82] target/arm: Implement SVE mixed sign dot product
Date: Fri, 30 Apr 2021 13:25:48 -0700
Message-Id: <20210430202610.1136687-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xf8XYdinX93a

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  2 ++
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 target/arm/vec_helper.c    | 18 ++++++++++++++++++
 4 files changed, 40 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index e4c6458f98..86f938c938 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -612,6 +612,8 @@ DEF_HELPER_FLAGS_5(gvec_sdot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_udot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_sdot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_udot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usdot_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_sdot_idx_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 05360e2608..73f1348313 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1481,6 +1481,10 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
+## SVE mixed sign dot product
+
+USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
+
 ### SVE2 floating point matrix multiply accumulate
 
 FMMLA           01100100 .. 1 ..... 111001 ..... .....  @rda_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c988d0125a..8952990453 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8056,3 +8056,19 @@ static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
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
index 98b707f4f5..9b2a4d5b7e 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -579,6 +579,24 @@ void HELPER(gvec_udot_b)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
 
+void HELPER(gvec_usdot_b)(void *vd, void *vn, void *vm,
+                          void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *a = va;
+    uint8_t *n = vn;
+    int8_t *m = vm;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = (a[i] +
+                n[i * 4 + 0] * m[i * 4 + 0] +
+                n[i * 4 + 1] * m[i * 4 + 1] +
+                n[i * 4 + 2] * m[i * 4 + 2] +
+                n[i * 4 + 3] * m[i * 4 + 3]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
+
 void HELPER(gvec_sdot_h)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-- 
2.25.1

