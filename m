Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4044449lfm;
        Mon, 24 May 2021 18:56:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMN1nS8WqtbpicpYFDtHSkG2cwZlh6XO0PHnamaheXMTC1l1na0zuY6Rdn8q+Qo6nDiuBD
X-Received: by 2002:a05:6602:2d8d:: with SMTP id k13mr18109369iow.121.1621907769346;
        Mon, 24 May 2021 18:56:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621907769; cv=none;
        d=google.com; s=arc-20160816;
        b=Ubtf87EQKsIyt8PG8Z33lsfUF7WN1v+Uvgpe88xHY1crYNbJdBK7GfBWcO5EAk94S4
         wA3ryPS5TMcUcLUmObD54zW4srdyqWI1yVtzTz79paaliTWjsPC6KsLbW3ngYOb1if1v
         f/59CyAKz5TKkELXB2T7PWBeW+jMD1VUDeobKrocUHPShaOAGdeH9QB20TMXrpsSDfII
         25Wnii6f09Q9oRxfaKVsbO7LgX63pQGCIpDA3sKsoX8KZf069SvmEpb0UR0A+D/XBo1O
         74LHQRAHBFr9aXWT3PGUi2yByVBf2Clo/MxiW7y2h9OF25umeNwTcGGex8eCWOYKk2Uo
         9C7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4DkLdzGeRLcffpsdPeSt6njaGGwt+9skrRZyw6tOeco=;
        b=kWJUmis6Ab/NMVbdB+7fxGlJjpa7AVhuWCIe+Aos7uIO/10x4/USBN0jAa/aMNj5zp
         Bd4Hcmwyweg0ifQamLJjB/dGpn9E2COyeNqam7LRjLwM1+bxJcD6Z9SNG4ElVHLEk+JG
         uo0BI+SwzxfwoyB+1qjv7+VY1Fy3FKs4T6ky2rII04byLFxSA/JvQHTrgxRvEL/mmJEd
         B+78nqmYpQ9kvAi5Z8ZHP5/B4PhXPMmsJm4LBcmlgYiyjP+Lg7eb1MRqYouqZBqqsSe4
         3/EPJXypWif15+ty3GamM0WsyK3BlcLZcSG3NU50PoA9tEupdrt8nEG4I7pilZPikwds
         LyYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SqiWIIZK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b4si13935082ioz.1.2021.05.24.18.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:56:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SqiWIIZK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMIi-0003FP-Jj
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYX-00016q-9R
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:25 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXt-000499-Rm
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:24 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso12203747pji.0
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4DkLdzGeRLcffpsdPeSt6njaGGwt+9skrRZyw6tOeco=;
 b=SqiWIIZKCKmPoER09CeOoQshexGWYnBV3zir+cjSV6/VYsBZTrTQe8GcoSd5Vs1HxO
 ZgoMZfJvKLzPXkac+f4hfmIrwdrsOrZqjTBL2ZRSc3cn1lO5iXrcPDEUjNsQFrXtseuS
 f6qFF5sHYPThzf6URNDnoqi6aDfMyx5P7ZiH5j7skgKEpQXJAwADV/DZQxRdXsdGOGBr
 BCeVEEimbniJZsTyzCR7TseQ9En6XvZCb1Yd7TfH8gzdZt5mofMbgJS1rp1fwBHvHTJu
 DNgPnnyGgV8QEaA7cr49E1VKW0VhbQFnLdgKIpfMo1C8+wU8DmDHGLoHtEbonUgCa9kw
 306A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4DkLdzGeRLcffpsdPeSt6njaGGwt+9skrRZyw6tOeco=;
 b=OCo+FLLaKOiqZBz7lrDEsLHiixUXheIfwb3+TbJa5IXng9JMzAeFaURLYmUb18uoOl
 7ZNYGZ256XEbBd6bgtyDw0rdpaiVIOC/0SAJ7LUfiwz5j1rblPK5ewY17r8YD4DPWGrK
 Njl0VzKwxltQBPiz1F3E/QohOcVMlYAAXPvLt2i5eXrCAzg7wcOdCQLm3hSfSb5LprSe
 B5Bu6nVTY0sFhjg5RmpLICLMKmu3dbRJe6kM2oN2nOQEHtWiLgSS6Tk8RC9cnKoBLFLU
 UuanUkknFSa6OHdc0BfkkyPtwaCfxKFp/5c4moHBs5OkjfPtO21Q3jy8fdhUtX13DDYB
 xRXg==
X-Gm-Message-State: AOAM5327djgkzHtSatNQ2Yh3BjIUmfmkSmR+6mMLnqN74BWrNT0x1wyl
 dfOeS5FCcmXgm64G9Fe3oLeQtQ==
X-Received: by 2002:a17:90a:ba07:: with SMTP id
 s7mr27786875pjr.129.1621904864593; 
 Mon, 24 May 2021 18:07:44 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 73/92] target/arm: Implement SVE2 FCVTLT
Date: Mon, 24 May 2021 18:03:39 -0700
Message-Id: <20210525010358.152808-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ko5ELOvsaHiI

From: Stephen Long <steplong@quicinc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428174332.17162-3-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Fix big-endian indexing.
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 23 +++++++++++++++++++++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 7aa365d565..be4b17f1c2 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2749,3 +2749,8 @@ DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_fcvtlt_hs, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_fcvtlt_sd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 94cdc6ff15..1be3515470 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1583,4 +1583,6 @@ RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
 
 ### SVE2 floating-point convert precision odd elements
 FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
+FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
+FCVTLT_sd       01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index d44bcfa44a..8882393515 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7622,3 +7622,26 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
 
 DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
 DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t,     , H1_4, float64_to_float32)
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
+DO_FCVTLT(sve2_fcvtlt_sd, uint64_t, uint32_t,     , H1_4, float32_to_float64)
+
+#undef DO_FCVTLT
+#undef DO_FCVTNT
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 700b02814c..7490094d17 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8262,3 +8262,19 @@ static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
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

