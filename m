Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956309lfg;
        Tue, 9 Mar 2021 08:22:32 -0800 (PST)
X-Received: by 2002:aca:5cd6:: with SMTP id q205mr3491736oib.94.1615306952458;
        Tue, 09 Mar 2021 08:22:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306952; cv=none;
        d=google.com; s=arc-20160816;
        b=q5cZDstvkMSv01Wu8WLgxBJJIcRKTQGjnWuHaviQTHRLOcVClmnkKB5BfZUhkxXEeI
         EatfGg1kjf2Df2clTdAGraQqibpT0+LV5YtO+mnoAO4K3D96aeKloruRVbkPfdL3V5xK
         zHmngRAbnghg/piiJTQq01hD091OI4w8OJV5c8HAeDSIx8imhRBHSLJixIqR29lp8dBU
         3lJbgKgK+uE+gNFjXGaJAZXpjP2nE978c9ou/J6exJnnP4qrHq2iJHySrhNBAZ3JdmnE
         2A7hCw0uyDrjMNUKxoT36wsxY4zneHwS4qsJg5AqqZzbEk2K3TvjZHYs+WuBU21zkvzZ
         e2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bptJGYx73w0iLgXPC0ahsEqU5HiDk0G0B7MTmQ2AFnA=;
        b=Y8XojzUXToQHWx81kR8NPJHESXh5/ZRhKH2BrBdzfAwoZlxTjzoi/AhyPBz9v9QXLk
         gjvaxBw318BcBvNUgk24NVwub11Zz835nLPQ/6KzEI0EPpQjJV7rAhlkGlVkZoN9uoxN
         pdKRvOoJZORjxDArYcjoz4l3yfBCYeSjEZ8/1fd//DvKidAntqhZg4HOhdCd2kl6oGzm
         BPsUcIcDwL/c6rkLlBfjndCBNuejcGsa6w2ui8JZ6naih4VV8c9RTA3OXilUR3na8frj
         k5L5u0wzMSiTTIvIQ7wXnso0tYMkR/JT7+SiW+CilourF+f3Qrb7NHF8vU38DxS0/ZTH
         OMyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yCkrIyVp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h27sor3350229otg.151.2021.03.09.08.22.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:32 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yCkrIyVp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bptJGYx73w0iLgXPC0ahsEqU5HiDk0G0B7MTmQ2AFnA=;
        b=yCkrIyVpXMuyWp5Xowa6qQlOP7GAwLSF0pBCvOIrcEChHqsauXQ1Fko5mdQ/HWkbCy
         aWwuPk+3tKdzCoKp7oodAayj/RzcZkzznjksMRSiLoWKvIK9r/33kx7XaBvt5ERq1aSB
         gpWPaAB4jphBMsBQTKSITpPWdHg5B+R049fKa1qAn+GLSXgCKgxXnf3xOoYSoEtN7J45
         E+r4uTpfKIk2dsqvSNwuHbM1mID9QP3VucEUiB2mRXn+J21w6Kc1d2RQJKP1zLK2BW+x
         vvCxWX3uoIZX0c2FRzajmUqB4OCikmhkPXN5bDCKSAAKsT/a8k4NDfRBEqtpK80HuCkp
         yP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bptJGYx73w0iLgXPC0ahsEqU5HiDk0G0B7MTmQ2AFnA=;
        b=cwe+O8gQ7kElIDAx9q6+Pr9sFsCoMQNE1M9e03FuRJmXd6xWrY6fnqmRue1TtQulKc
         E+ThNGEyjCXH49/fbTbUt0E6I2mLGJOrt7X+v1lPu+RGOu376qhaCCLXLumeeiIcDhc3
         vDzGDUqp3+gNMxV7rjuNxtPA1PE5FKeN7CtUAdbEh4K1N8pEk7o+lUZaEiqkp8+P0oXR
         fd2tnjclAWUnSrI35pzd6TxOlENIyI4PAqvtn0db4/s/2ODCsg/EeL+qMCslkioiq+bD
         n3NdQjYhSDTp5uk17N8I6fjlmmoqiU7p6Zy9ySM6fAgRWvLkf5Kg0a24/nDw4RcNhFen
         Z7gQ==
X-Gm-Message-State: AOAM533rK8a/pc8LIVMHoX7+8+j08IED302SNuHf7LSs7DdgitGyfEvS
	yzNRgP6S6B+w2Ba9zEfqtI2o683b
X-Google-Smtp-Source: ABdhPJzqBl7DRttyKS28ge+8mbAlJXU3BvaiuhaF771LAqH62bIN1JGkCpAb4jKrd8J+StQhaS/rFA==
X-Received: by 2002:a05:6830:3495:: with SMTP id c21mr24550583otu.97.1615306952107;
        Tue, 09 Mar 2021 08:22:32 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Stephen Long <steplong@quicinc.com>
Subject: [PATCH v4 69/78] target/arm: Implement SVE2 FCVTLT
Date: Tue,  9 Mar 2021 08:20:32 -0800
Message-Id: <20210309162041.23124-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: oRimZ+4FGtPL

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428174332.17162-3-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 23 +++++++++++++++++++++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index eedb70eb50..8569d384b9 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2739,3 +2739,8 @@ DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_fcvtlt_hs, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_fcvtlt_sd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 2c38fe4691..d152193e89 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1576,4 +1576,6 @@ RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
 
 ### SVE2 floating-point convert precision odd elements
 FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
+FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
+FCVTLT_sd       01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b719a3aacf..3b3f1eca5d 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7620,3 +7620,26 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
 
 DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
 DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t, H1_4, H1_2, float64_to_float32)
+
+#define DO_FCVTLT(NAME, TYPEW, TYPEN, HW, HN, OP)                             \
+void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
+{                                                                             \
+    intptr_t i = simd_oprsz(desc);                                            \
+    uint64_t *g = vg;                                                         \
+    do {                                                                      \
+        uint64_t pg = g[(i - 1) >> 6];                                        \
+        do {                                                                  \
+            i -= sizeof(TYPEW);                                               \
+            if (likely((pg >> (i & 63)) & 1)) {                               \
+                TYPEN nn = *(TYPEN *)(vn + HN(i + sizeof(TYPEN)));            \
+                *(TYPEW *)(vd + HW(i)) = OP(nn, status);                      \
+            }                                                                 \
+        } while (i & 63);                                                     \
+    } while (i != 0);                                                         \
+}
+
+DO_FCVTLT(sve2_fcvtlt_hs, uint32_t, uint16_t, H1_4, H1_2, sve_f16_to_f32)
+DO_FCVTLT(sve2_fcvtlt_sd, uint64_t, uint32_t, H1_4, H1_2, float32_to_float64)
+
+#undef DO_FCVTLT
+#undef DO_FCVTNT
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 83fab9a6fc..c29984d244 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8237,3 +8237,19 @@ static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
     }
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_ds);
 }
+
+static bool trans_FCVTLT_hs(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_hs);
+}
+
+static bool trans_FCVTLT_sd(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_sd);
+}
-- 
2.25.1
