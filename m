Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4020679lfm;
        Mon, 24 May 2021 18:12:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5FzNOZf3DXWj8nLH5aHfqREVHF8Fr3ugk3VxhBc9ftVMPafyDIT9UaxqtqYKOvOv4gz+H
X-Received: by 2002:a05:6602:3281:: with SMTP id d1mr14218663ioz.87.1621905135569;
        Mon, 24 May 2021 18:12:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621905135; cv=none;
        d=google.com; s=arc-20160816;
        b=dTj+Efe+bCuNKh6fhiZReNkXKSzUJH4Lrlcxxop+QLt36wG9KLTQzyGJ0+U4fT7y6m
         O1+BNR+6iT4UMLlW/QXVrj/1w8+KdhFF3kasWZXaVGdyzQdfo9eisyrR/QOTgtJf5gWh
         3xJAhakyfmU/aYaGsTiDShdUWvboEc5oi1fDfdE/Wfdn7Cm0iRfql3MGHhDuDNPlYqlU
         GCrbY5WUvHVLPZJ4NvU/SfPNMglVkCANJZdBazP48XuILfgYjkdJd1oBpyOithcLF+vL
         UiJbKhEo8yPbqQh7JHrNmEpOlocZ2rKMbWfXMQpMfC1ONpiVUfZZYe5Ryus6ENU/vCJZ
         W6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+zYjL/8UBwWwCIOfTLsN3pMU5qz0QJffUTrpndpZaQA=;
        b=CP1rXOdzfvMZTNUKRfPC+aPMaTVFMwT2YzAoermKa/TX8OvlHMLF9k9dnwMw2uw4gG
         WfvxndAaQmq8J9QngriIMCS5AtIm2a2i3tcVlTlixrXyBSSVorpOfGO0djAKl+O6lN0h
         OdQ3iMPwpklq6+0U6IAv3o47LuEs9H3w+IATKZTb1bbIGRrD/oZQLzCNnMIzZwE7bCuz
         HznNveMBbYjX8qBChlj+8nz3ytcRAjMyfVXwnzBzaHt5UEeInEZNcLKWK2WPrbzlOEz0
         j6LtIZmd8eJKwmnzBmavoyVGwOkXKlRoK3xix9kdsu4zQm0nDU+KBhRMqAe6mnczWDp/
         jRKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s0nxnI6l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15si16844947jat.59.2021.05.24.18.12.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:12:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s0nxnI6l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llLcE-0008Lx-B4
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUa-0001gt-4k
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:21 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLUP-0001ia-AM
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:04:19 -0400
Received: by mail-pg1-x52c.google.com with SMTP id f22so20461990pgb.9
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+zYjL/8UBwWwCIOfTLsN3pMU5qz0QJffUTrpndpZaQA=;
 b=s0nxnI6lO7rAnIR/EWmqyj++JArqaP1yw2IlMFz72Nu3xGP9G0EaAIAB2FVMwm/oii
 ltRS3tObi7Qp/3U701+mfGDrZsgDf3yqt6ssSaTakJGOcW33+DXzie4dpa9/S2ELCoNe
 AM+Ge19q64/t38cX7GUtdp312DCe6Du8kIWILH68tK8bRSHUp5+n+YFgtB8/PTgwcJid
 fz7HmW7Wz3cY77plL7+9oZ90O3RSILGEI3WW9B35T6BJ4/mTEkj9DuEKRutA1Kgjopcb
 QKLD07fkZ4qnAErslBPEGLbozoDGV1Qn9h50Hk4so9RslrLvOGfzLJ/WL7eGmgBfwmQn
 Ei/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+zYjL/8UBwWwCIOfTLsN3pMU5qz0QJffUTrpndpZaQA=;
 b=i+3tpGrrbbeB9+I1LRDdtU1DBfrLWyTLLdS3Keh3pR/JrQCAkuvx26ScRntlpRib+j
 VGvEJ/fcmKgGv9iXXIMRURW12JW52RkiDNweTjXXVQA14EMI0FlYaZlHb862Q6aml7Ov
 RurnwcA4gnv42LLA0xQtSl49p3UppowikXKFc3g0AKdP4zHFB7RgWRWj01rjnMIzsQG9
 7R93HDgD/M+TMb3xOrSJxIOfLaf1LSgCBf39jQ43rZzXy78hngt+nvvQuYiHAZsn4tNw
 5DYQ9+dM5ZdfzR/1wmFC0IqoA1pWw5KO5IKEj9ZoSr1i95ooP+L3YvrZrX7Zf4c6haYo
 IXlQ==
X-Gm-Message-State: AOAM532atL00ZDVDihPcvsEer3UiQ+zcq1XGU3707O6Y1seibmzT7u91
 HqkWS01w/qk9LAXI+D56BdKxVw==
X-Received: by 2002:a05:6a00:248e:b029:28e:bca9:5985 with SMTP id
 c14-20020a056a00248eb029028ebca95985mr27892463pfv.10.1621904647672; 
 Mon, 24 May 2021 18:04:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b1sm13742645pgf.84.2021.05.24.18.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:04:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 13/92] target/arm: Implement SVE2 integer multiply long
Date: Mon, 24 May 2021 18:02:39 -0700
Message-Id: <20210525010358.152808-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
X-TUID: f4FgQ61PYuf1

Exclude PMULL from this category for the moment.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 15 +++++++++++++++
 target/arm/sve.decode      |  9 +++++++++
 target/arm/sve_helper.c    | 31 +++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  9 +++++++++
 4 files changed, 64 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 3286a9c205..ad8121eec6 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2347,4 +2347,19 @@ DEF_HELPER_FLAGS_6(sve_stdd_le_zd_mte, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_6(sve_stdd_be_zd_mte, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmull_zzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_smull_zzz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_smull_zzz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_smull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_umull_zzz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_zzz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_umull_zzz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve2_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index f6f21426ef..d9a72b7661 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1196,3 +1196,12 @@ SSUBWB          01000101 .. 0 ..... 010 100 ..... .....  @rd_rn_rm
 SSUBWT          01000101 .. 0 ..... 010 101 ..... .....  @rd_rn_rm
 USUBWB          01000101 .. 0 ..... 010 110 ..... .....  @rd_rn_rm
 USUBWT          01000101 .. 0 ..... 010 111 ..... .....  @rd_rn_rm
+
+## SVE2 integer multiply long
+
+SQDMULLB_zzz    01000101 .. 0 ..... 011 000 ..... .....  @rd_rn_rm
+SQDMULLT_zzz    01000101 .. 0 ..... 011 001 ..... .....  @rd_rn_rm
+SMULLB_zzz      01000101 .. 0 ..... 011 100 ..... .....  @rd_rn_rm
+SMULLT_zzz      01000101 .. 0 ..... 011 101 ..... .....  @rd_rn_rm
+UMULLB_zzz      01000101 .. 0 ..... 011 110 ..... .....  @rd_rn_rm
+UMULLT_zzz      01000101 .. 0 ..... 011 111 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 374e02dbf8..cfd1a7cb49 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1163,6 +1163,37 @@ DO_ZZZ_TB(sve2_uabdl_h, uint16_t, uint8_t, H1_2, H1, DO_ABD)
 DO_ZZZ_TB(sve2_uabdl_s, uint32_t, uint16_t, H1_4, H1_2, DO_ABD)
 DO_ZZZ_TB(sve2_uabdl_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
 
+DO_ZZZ_TB(sve2_smull_zzz_h, int16_t, int8_t, H1_2, H1, DO_MUL)
+DO_ZZZ_TB(sve2_smull_zzz_s, int32_t, int16_t, H1_4, H1_2, DO_MUL)
+DO_ZZZ_TB(sve2_smull_zzz_d, int64_t, int32_t,     , H1_4, DO_MUL)
+
+DO_ZZZ_TB(sve2_umull_zzz_h, uint16_t, uint8_t, H1_2, H1, DO_MUL)
+DO_ZZZ_TB(sve2_umull_zzz_s, uint32_t, uint16_t, H1_4, H1_2, DO_MUL)
+DO_ZZZ_TB(sve2_umull_zzz_d, uint64_t, uint32_t,     , H1_4, DO_MUL)
+
+/* Note that the multiply cannot overflow, but the doubling can. */
+static inline int16_t do_sqdmull_h(int16_t n, int16_t m)
+{
+    int16_t val = n * m;
+    return DO_SQADD_H(val, val);
+}
+
+static inline int32_t do_sqdmull_s(int32_t n, int32_t m)
+{
+    int32_t val = n * m;
+    return DO_SQADD_S(val, val);
+}
+
+static inline int64_t do_sqdmull_d(int64_t n, int64_t m)
+{
+    int64_t val = n * m;
+    return do_sqadd_d(val, val);
+}
+
+DO_ZZZ_TB(sve2_sqdmull_zzz_h, int16_t, int8_t, H1_2, H1, do_sqdmull_h)
+DO_ZZZ_TB(sve2_sqdmull_zzz_s, int32_t, int16_t, H1_4, H1_2, do_sqdmull_s)
+DO_ZZZ_TB(sve2_sqdmull_zzz_d, int64_t, int32_t,     , H1_4, do_sqdmull_d)
+
 #undef DO_ZZZ_TB
 
 #define DO_ZZZ_WTB(NAME, TYPEW, TYPEN, HW, HN, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 70900c122f..19a1f289d8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6021,6 +6021,15 @@ DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
 
+DO_SVE2_ZZZ_TB(SQDMULLB_zzz, sqdmull_zzz, false, false)
+DO_SVE2_ZZZ_TB(SQDMULLT_zzz, sqdmull_zzz, true, true)
+
+DO_SVE2_ZZZ_TB(SMULLB_zzz, smull_zzz, false, false)
+DO_SVE2_ZZZ_TB(SMULLT_zzz, smull_zzz, true, true)
+
+DO_SVE2_ZZZ_TB(UMULLB_zzz, umull_zzz, false, false)
+DO_SVE2_ZZZ_TB(UMULLT_zzz, umull_zzz, true, true)
+
 #define DO_SVE2_ZZZ_WTB(NAME, name, SEL2) \
 static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)       \
 {                                                               \
-- 
2.25.1

