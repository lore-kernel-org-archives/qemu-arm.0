Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp484912lfg;
        Fri, 30 Apr 2021 13:53:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBDNrPm1yD66OmkGrc6lUwhQy1pAHK6eBw+je/2sCS56f+GnGUBH42UK5riXaZHeuwzeT1
X-Received: by 2002:a05:6e02:214d:: with SMTP id d13mr5458576ilv.65.1619815994624;
        Fri, 30 Apr 2021 13:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619815994; cv=none;
        d=google.com; s=arc-20160816;
        b=VxJCOoGzfTwT20hqs2CSWUOZRmyqMHRe6HPSxUz1brP+ieWaOZKNf8TDkPFdWuBBnb
         0YMbfq9fFJMlHQy55sxb4tnEkfYAofYhXZXP6nBqzjphzxnYAH5WFOJ4LEUNqTkhVS8B
         UGd5wXnejtvzm2Rtbw20qkijjWEjv53KEfkbSP4PXcB9vrEVanhH7UJxIrncwwm2FcGD
         uFrsilrckkpFrmb1K0xpTw8xMGUKNNbYb/pJzvz7V8kBeL1ZFVdOys0I+UHMJUp3wt3F
         XVpE8r5zsAjoNseN3oYGyfS+5e6JTC6Oaxc8lP4hMPWCPVmwRG2pF5zxEFoEJOR3hGe0
         SdEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wuE0clopIn5KrUkuJnJm6l7c50sb3LTx2vbdW9i3iBQ=;
        b=Q3cwItDsj/TdmKP+oyfYgwEWSy2f820VuJ43v8k+vwgYlyP+hIDlPovTko/2HnlsSe
         rF42TLXfk5Im5YS0M5BTxfRCP5gvQq84KN4eekwLv7cHNYL7TdtLMAZ8EUgQ8UuiUhrN
         qEacCoTz5OJKVC5aHH0Rykn+pm4mDAXdK5UF3hlWk5WN+OG7ga8gW1E4TE2QVV9EsGvm
         TGZfEgfHcaM1sBoO6TEIeBzhm6uEZIO30XBlmS1CMneFC6UKYRrfdpCQn4HK/ai+MVa+
         4c/yKLpogjYu4zsjFJJK4mZ8aszc9tAbHhNHsiG3QumPfqB0fNoomWz14JbcOGhe1bGB
         viWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ab+xHsrm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6si3930503jat.121.2021.04.30.13.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:53:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ab+xHsrm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lca8P-00075n-S3
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiy-0000k0-Ip
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:56 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:41613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZib-0006Bw-Mq
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:56 -0400
Received: by mail-pl1-x62e.google.com with SMTP id e2so32910321plh.8
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wuE0clopIn5KrUkuJnJm6l7c50sb3LTx2vbdW9i3iBQ=;
 b=Ab+xHsrmulAkSF7LMLGh+7zTQ6hCYhSFU5yfCr/3mk6RDEypqH36Jhi+Xvme+bO14q
 Br9ghWJSGfCe1H6IinP2Zz0DHXc2TA+5c6uP54rWB2Pt79wufUmZSD3+AmmxwQm4H+ZM
 PP/BOz9tZmJi4VkSdQTohYmb/F+bVrAyBxjTszM27JvlQaVYMXrf41oivzPOEt0NQAiP
 9HnxmzFPMQQ2Z+Uv/o3uz6QAIDeaq1gnfnnTzKZe5sA4LYgAtj2bng69Grklho/MGWSy
 zeMWN/LpI8IBtGA1kbRFq9bs+EJC0bvn+CiFl0+Jvoq/yxSmVLq5IkjQB5mWou/HR5Gv
 p+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wuE0clopIn5KrUkuJnJm6l7c50sb3LTx2vbdW9i3iBQ=;
 b=bGgeM1O5h6qm1ePCrF7FoD4j6WD9DTnruwxUdQOkSO2beOdOmqg0lTXugEac2tHxSy
 0+jvxPxaXnwUsV4Y4X8AlwhAOiky4ZeGDAaFIoFDGF57yWpUgYp5tA14nVZyvcrZCfgj
 pdjMo3AfsZ5Mc62mmL+93bAG5j9RrbrjdCwlpQCu+O0ZVL1OGk3cS3zA+tx0sNQwTrhh
 LvXF2GrBkxNNzjmRbx+WrE2Y8PxUylMpJo5GICssg0JHbOSXnzhDZPmpKuO0IxYS9GJE
 g4R92IP4Rj4TYQlLsokVbB+Bc7ouS8Dcyw2Ioh9nI6l5vulFgoFaKW6iRLqGmzN9CPl+
 3/0w==
X-Gm-Message-State: AOAM533yWPuPgsRF1ThBzKAuFZiqfXtDNwQ31jd9rxLrPoE+aDxyELFr
 659snjT4El2NG0mzjktaZ4tTD9uu2cEsaw==
X-Received: by 2002:a17:902:f548:b029:ee:8f40:ecc2 with SMTP id
 h8-20020a170902f548b02900ee8f40ecc2mr7067210plf.6.1619814392333; 
 Fri, 30 Apr 2021 13:26:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 34/82] target/arm: Implement SVE2 saturating multiply-add
 long
Date: Fri, 30 Apr 2021 13:25:22 -0700
Message-Id: <20210430202610.1136687-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: sB06SlYAsaZW

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 ++++++++++
 target/arm/sve.decode      | 14 ++++++++++
 target/arm/sve_helper.c    | 30 +++++++++++++++++++++
 target/arm/translate-sve.c | 54 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 112 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 11dc6870de..d8f390617c 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2559,3 +2559,17 @@ DEF_HELPER_FLAGS_5(sve2_bcax, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_bsl1n, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_bsl2n, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_nbsl, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 47fca5e12d..52f615b39e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1332,3 +1332,17 @@ FMAXNMP         01100100 .. 010 10 0 100 ... ..... ..... @rdn_pg_rm
 FMINNMP         01100100 .. 010 10 1 100 ... ..... ..... @rdn_pg_rm
 FMAXP           01100100 .. 010 11 0 100 ... ..... ..... @rdn_pg_rm
 FMINP           01100100 .. 010 11 1 100 ... ..... ..... @rdn_pg_rm
+
+#### SVE Integer Multiply-Add (unpredicated)
+
+## SVE2 saturating multiply-add long
+
+SQDMLALB_zzzw   01000100 .. 0 ..... 0110 00 ..... .....  @rda_rn_rm
+SQDMLALT_zzzw   01000100 .. 0 ..... 0110 01 ..... .....  @rda_rn_rm
+SQDMLSLB_zzzw   01000100 .. 0 ..... 0110 10 ..... .....  @rda_rn_rm
+SQDMLSLT_zzzw   01000100 .. 0 ..... 0110 11 ..... .....  @rda_rn_rm
+
+## SVE2 saturating multiply-add interleaved long
+
+SQDMLALBT       01000100 .. 0 ..... 00001 0 ..... .....  @rda_rn_rm
+SQDMLSLBT       01000100 .. 0 ..... 00001 1 ..... .....  @rda_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 010d8b260a..859091b7cf 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1400,6 +1400,36 @@ void HELPER(sve2_adcl_d)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
     }
 }
 
+#define DO_SQDMLAL(NAME, TYPEW, TYPEN, HW, HN, DMUL_OP, SUM_OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    int sel1 = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);     \
+    int sel2 = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(TYPEN); \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                       \
+        TYPEW nn = *(TYPEN *)(vn + HN(i + sel1));                       \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + sel2));                       \
+        TYPEW aa = *(TYPEW *)(va + HW(i));                              \
+        *(TYPEW *)(vd + HW(i)) = SUM_OP(aa, DMUL_OP(nn, mm));           \
+    }                                                                   \
+}
+
+DO_SQDMLAL(sve2_sqdmlal_zzzw_h, int16_t, int8_t, H1_2, H1,
+           do_sqdmull_h, DO_SQADD_H)
+DO_SQDMLAL(sve2_sqdmlal_zzzw_s, int32_t, int16_t, H1_4, H1_2,
+           do_sqdmull_s, DO_SQADD_S)
+DO_SQDMLAL(sve2_sqdmlal_zzzw_d, int64_t, int32_t,     , H1_4,
+           do_sqdmull_d, do_sqadd_d)
+
+DO_SQDMLAL(sve2_sqdmlsl_zzzw_h, int16_t, int8_t, H1_2, H1,
+           do_sqdmull_h, DO_SQSUB_H)
+DO_SQDMLAL(sve2_sqdmlsl_zzzw_s, int32_t, int16_t, H1_4, H1_2,
+           do_sqdmull_s, DO_SQSUB_S)
+DO_SQDMLAL(sve2_sqdmlsl_zzzw_d, int64_t, int32_t,     , H1_4,
+           do_sqdmull_d, do_sqsub_d)
+
+#undef DO_SQDMLAL
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bdf1da8424..27f9cdb891 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7508,3 +7508,57 @@ DO_SVE2_ZPZZ_FP(FMAXNMP, fmaxnmp)
 DO_SVE2_ZPZZ_FP(FMINNMP, fminnmp)
 DO_SVE2_ZPZZ_FP(FMAXP, fmaxp)
 DO_SVE2_ZPZZ_FP(FMINP, fminp)
+
+/*
+ * SVE Integer Multiply-Add (unpredicated)
+ */
+
+static bool do_sqdmlal_zzzw(DisasContext *s, arg_rrrr_esz *a,
+                            bool sel1, bool sel2)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
+        gen_helper_sve2_sqdmlal_zzzw_s, gen_helper_sve2_sqdmlal_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], (sel2 << 1) | sel1);
+}
+
+static bool do_sqdmlsl_zzzw(DisasContext *s, arg_rrrr_esz *a,
+                            bool sel1, bool sel2)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                           gen_helper_sve2_sqdmlsl_zzzw_h,
+        gen_helper_sve2_sqdmlsl_zzzw_s, gen_helper_sve2_sqdmlsl_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], (sel2 << 1) | sel1);
+}
+
+static bool trans_SQDMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlal_zzzw(s, a, false, false);
+}
+
+static bool trans_SQDMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlal_zzzw(s, a, true, true);
+}
+
+static bool trans_SQDMLALBT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlal_zzzw(s, a, false, true);
+}
+
+static bool trans_SQDMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlsl_zzzw(s, a, false, false);
+}
+
+static bool trans_SQDMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlsl_zzzw(s, a, true, true);
+}
+
+static bool trans_SQDMLSLBT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlsl_zzzw(s, a, false, true);
+}
-- 
2.25.1

