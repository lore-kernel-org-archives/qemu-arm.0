Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956235lfg;
        Tue, 9 Mar 2021 08:22:25 -0800 (PST)
X-Received: by 2002:a9d:6196:: with SMTP id g22mr4915838otk.74.1615306945746;
        Tue, 09 Mar 2021 08:22:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306945; cv=none;
        d=google.com; s=arc-20160816;
        b=OZ48U2qKV2mi1G7rVp0puKsZ0VuTtVyG3ZrU8lJkh3IZ+/KT0yBS2KW5OGPVwmk1Gd
         BCV7bc1NWE3adGW6FEX9fNHzypxuigG64vK+1az0KgF6lqhqxpcjB77AXRhZMx9L/M3B
         2iXXQImpqiSBtNVUwMQWUot/FrORXTen46Oi7tSLKrEeS0RmMlFo6VWvLa892cIgt5Ht
         fNO0ctflf418pEeNRCyJ7OJH6Kvy2PhxvBeNGt2o55l3ifdheMNTE5Te6XVkRb+3mC7w
         PuEeol9fbLvBEV9LS/8O2krioJTnhgzSs8Xk5eRnO/+nGeU1ToQQNxi//7Pj8mddid72
         VI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SdeTKTulbQDqH8eRRD1J9G4EQUVyNG3m/VHui2jrnMM=;
        b=j+Z/lzu5V7O0EYQvhzzukPOXt6j2EgtERfeOT/oBzBrxAFruq7ypJAB5cBUt6tJ2kV
         afZh6bwQAuzikKS+llaM29045m+OQz7CLgpqF9wSbjvvjmDG0ftn4Ug8DCqr5E7rhxPu
         IMOwAX/7W4N/6ABCbR2GeGLGi3PXrlX5AHexyV5LafFlUo0aivi2OGKbpBMEXcvArc/j
         TPQSM+yv8pnQKba16Mc+3G5oCfjEm3INj9yA/SYP56V/dRs8R+yy8FOrH3LjSU+pP+TQ
         ZfUlXnA8ONqzA0JWr1L7PXzocbbLuywJYSAmhm5Krw0KLulS0V4nno7Szs0QzDIdzFi3
         Lh/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ss2LAf/2";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a6sor4109922oiw.95.2021.03.09.08.22.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:25 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ss2LAf/2";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SdeTKTulbQDqH8eRRD1J9G4EQUVyNG3m/VHui2jrnMM=;
        b=ss2LAf/2SGarxL80xk5r+s4Miq0am4KEwjBvd8Z9Xvpvz+EDk1V2pcfRn7rRkC4s0P
         dTOwxKU276Byn5TKIgeRanQkeXD5efa5a8IYGDuIfjtSQ228khHcYT5ZbmY3NwFWbFXP
         LbjXSTLnTN+MTGN7Y/v7DY1GdvJvEX+hfFVqkVPGoXSOCYrxZUOvnwvmaF4lNeE3lvpZ
         7xOXdpPIiBfUJNO1hXUBD+E2bLA0daAQy9Ky4fT3EVdNNht2/bI6GnvopNxJ69dQT09L
         ASUih0K34IKpTiuiLKv3pOT8Pqw+0jk5PHfDLG2O7Yq445oraiQJDX7L195M6MvYkSFK
         ftrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SdeTKTulbQDqH8eRRD1J9G4EQUVyNG3m/VHui2jrnMM=;
        b=roV9HDBL6N/wWwRsFkNjfXa4xH867zoZ8VNZTPbi1xDD+Jt83jJobaFDJB8HJKibqL
         L0brZsdhcv4CvQOOWOn0maKuVxgrWQdHobYakgaitFy3G0kEasicPz3mCuWYcT31ScyV
         NGzz2MVI3od/poF+V3LTkWGQckQgW3Whi6nXiZqwtpch0kfo13elZIKGquejVzC5IL/c
         yvf3l2fxlIFXaYNCUHubIIJv/VC8S9pgwolW2ExANgsrS67jhvjNdljxnsHKxnhDu+4T
         PmIQVqGKr1gMzyNavgN1jrQtDDja9ITpjbUaN4vfxiuccvV4ELFjfmGBRI4vvSqcRvZm
         ri9g==
X-Gm-Message-State: AOAM53276UXTAG7Qzu8XB1kA9nUA/LgFUjm0b0e3drz6WTQBjL/2Kum6
	7XO1opVDBsSeUfR2bFyQ/pSIrabe
X-Google-Smtp-Source: ABdhPJx13w292cOtqBa273/tS7c4K+Feji9RngnYSpJv1uo3oNQKRKbg0PMhP4nTnRBlg8W3VC360Q==
X-Received: by 2002:aca:4e13:: with SMTP id c19mr3571969oib.40.1615306945414;
        Tue, 09 Mar 2021 08:22:25 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 63/78] target/arm: Implement SVE mixed sign dot product
Date: Tue,  9 Mar 2021 08:20:26 -0800
Message-Id: <20210309162041.23124-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: k5th/zz2ubKE

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
index 499d989087..6c4002de60 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1523,6 +1523,10 @@ UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
 CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
 SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
 
+## SVE mixed sign dot product
+
+USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
+
 ### SVE2 floating point matrix multiply accumulate
 
 FMMLA           01100100 .. 1 ..... 111001 ..... .....  @rda_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6f80c944d3..23ffad33b0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8107,3 +8107,19 @@ static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
     }
     return true;
 }
+
+static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
+{
+    if (a->esz != 2 || !dc_isar_feature(aa64_sve2_i8mm, s)) {
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
