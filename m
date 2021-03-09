Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2955377lfg;
        Tue, 9 Mar 2021 08:21:24 -0800 (PST)
X-Received: by 2002:aca:309:: with SMTP id 9mr3418657oid.85.1615306884799;
        Tue, 09 Mar 2021 08:21:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306884; cv=none;
        d=google.com; s=arc-20160816;
        b=QX/bd2BRgOh064hq9OIZgkkbq7+EVW2mUgiYHOPPhngT61iqoJqe6O2z66WUJe/N6i
         bbb+dWROgoL2y5CfX5OyxkbrIu9QMcD/LU+DLy32dnGMbjWRdwhD1wSFptp8+2Q5uYqd
         m/wDWwhB/5qYCz9VDHMkQkrNXRCJSOMbqp+7zE6WOvplXO36PJ5CgzU75bDUUVx0BMVr
         tob0nvJO2vf4/8XonssgGumASKbWU4A/bagvSQcL66xBjB6e3hF7TpIfD+dFfp3tftdG
         oMXA8UcQJcasKR9HKGcJ7hl2whelr4xlVpph8Hc0iQBJymTsWzU5LEafAEhatLayIXUC
         Gu1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MSMseqklTx5XGInPbltkyfVEXNwiNbXjqnPSDdzuxDo=;
        b=aihzdn8a96IUH3TSXuAjZt/6rhzBtwCAi1t2e1hxWKeXG1APNtcKtoE/4beaB5myek
         BnoNRp2/d/33+A26xTH0o5HibuByvksk3K3/vQ/SzgxEjQ4eK4Gh+R1mwp1TFCfp4G9q
         OnJ0CO4SRrMF5UCw/3FN8awK+y7j2KxwitZVcn7zZQqRgJNCaXeqdz5zZZnb4Z0KXHUR
         uhx4FR3axKyEuyPXmgzN9wxYjvu8b/kRzGU7NFN2gowUeBcUdEb6ZoIhIjhhnT6x9dwB
         7uFMjRpmD8U4+ItJHM/sXdeo3Fu111daMQjn7F8t1Jc8FwZgRuMmdRskj1vX98jC7Qza
         7Osg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TgkozMef;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s3sor1440598oij.12.2021.03.09.08.21.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:21:24 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TgkozMef;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MSMseqklTx5XGInPbltkyfVEXNwiNbXjqnPSDdzuxDo=;
        b=TgkozMefSqZ+GhCKjKxmVoP9sOUMytnoBHBk/KDSlyJkdrpzRzuOsFikQ7Mr/W2L5U
         i7IbZqO8JdRo0wjfRW+KyVzEjfncqLuYrZ68wobXnsieO/A2NjI6iFztm2sAvDVhc8sJ
         FSx19wYUT5S5sCRywRWDdTxxzto2ANfYokd/WbNRE4139+pew7sO/f1IwCtdwppFXgxS
         ZmSTgUVDaJy1p0LpxazzvSR4LLl1mHO9gcNrYb6EC+R6WTw1qv1tq+H6XiA/+jT5UrDa
         OR9NUvemvTRTBzHwrX9RuHxcRO1VKLLfOz1ookGatjPUQNiEs1QzUCpNgvLnGD3eSMs3
         vncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MSMseqklTx5XGInPbltkyfVEXNwiNbXjqnPSDdzuxDo=;
        b=DrzI0nfUG72jp9UKiaTbTdC5OHPHnsEnVHypKqu2mMbV7k13rHGX/zNF/9KXNhOz8J
         9FXcJvP63ew4eQa9Zyy5Fjoq0fXkg0IBgmsY3wmz1gK22aEiQZ1s7HhSA+MrBOY7D+W2
         zoQB0zhxXhhXzA2/NmTAude5393p0ZJsd7rfoGlW624Y5gYIbcm9fSpYnjhaOAPKRi3k
         RqvK851VjKbKlFlNrm+IO/+Z6HHZvv6pXiiNenOLAT5LPik111LPMjvqM3Pi2nmPueyk
         DQaPgbRalNA+nLLqhAf7JZxwoNrbFgf8CP/Wjfvbqq9ntPT6yVNlKRcdKTnW5iBsf0cE
         7Nhg==
X-Gm-Message-State: AOAM532oEyQNxZOMf8/7hQveq/XgM+SsggrciI5jJmXOEEebb3nq3oMF
	WeRCfl9dwG7veYImOSZARHVHewvs
X-Google-Smtp-Source: ABdhPJx7PjRedCAxtUf0qoH220oGFzzmeCe8f+lSjxtuUQB5xdsR1VLUvWv6hWHQwQtmjhf8V903HA==
X-Received: by 2002:a54:488b:: with SMTP id r11mr3637344oic.166.1615306884402;
        Tue, 09 Mar 2021 08:21:24 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:21:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 36/78] target/arm: Implement SVE2 integer multiply-add long
Date: Tue,  9 Mar 2021 08:19:59 -0800
Message-Id: <20210309162041.23124-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PRDJKB0hyPPj

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 28 ++++++++++++++
 target/arm/sve.decode      | 11 ++++++
 target/arm/sve_helper.c    | 18 +++++++++
 target/arm/translate-sve.c | 76 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index d8f390617c..457a421455 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2573,3 +2573,31 @@ DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_smlal_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlal_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlal_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_umlal_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlal_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlal_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_smlsl_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlsl_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlsl_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_umlsl_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlsl_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlsl_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 8308c9238a..b28b50e05c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1351,3 +1351,14 @@ SQDMLSLBT       01000100 .. 0 ..... 00001 1 ..... .....  @rda_rn_rm
 
 SQRDMLAH_zzzz   01000100 .. 0 ..... 01110 0 ..... .....  @rda_rn_rm
 SQRDMLSH_zzzz   01000100 .. 0 ..... 01110 1 ..... .....  @rda_rn_rm
+
+## SVE2 integer multiply-add long
+
+SMLALB_zzzw     01000100 .. 0 ..... 010 000 ..... .....  @rda_rn_rm
+SMLALT_zzzw     01000100 .. 0 ..... 010 001 ..... .....  @rda_rn_rm
+UMLALB_zzzw     01000100 .. 0 ..... 010 010 ..... .....  @rda_rn_rm
+UMLALT_zzzw     01000100 .. 0 ..... 010 011 ..... .....  @rda_rn_rm
+SMLSLB_zzzw     01000100 .. 0 ..... 010 100 ..... .....  @rda_rn_rm
+SMLSLT_zzzw     01000100 .. 0 ..... 010 101 ..... .....  @rda_rn_rm
+UMLSLB_zzzw     01000100 .. 0 ..... 010 110 ..... .....  @rda_rn_rm
+UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index bd7332be43..61903cded6 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1308,6 +1308,24 @@ DO_ZZZW_ACC(sve2_uabal_h, uint16_t, uint8_t, H1_2, H1, DO_ABD)
 DO_ZZZW_ACC(sve2_uabal_s, uint32_t, uint16_t, H1_4, H1_2, DO_ABD)
 DO_ZZZW_ACC(sve2_uabal_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
 
+DO_ZZZW_ACC(sve2_smlal_zzzw_h, int16_t, int8_t, H1_2, H1, DO_MUL)
+DO_ZZZW_ACC(sve2_smlal_zzzw_s, int32_t, int16_t, H1_4, H1_2, DO_MUL)
+DO_ZZZW_ACC(sve2_smlal_zzzw_d, int64_t, int32_t,     , H1_4, DO_MUL)
+
+DO_ZZZW_ACC(sve2_umlal_zzzw_h, uint16_t, uint8_t, H1_2, H1, DO_MUL)
+DO_ZZZW_ACC(sve2_umlal_zzzw_s, uint32_t, uint16_t, H1_4, H1_2, DO_MUL)
+DO_ZZZW_ACC(sve2_umlal_zzzw_d, uint64_t, uint32_t,     , H1_4, DO_MUL)
+
+#define DO_NMUL(N, M)  -(N * M)
+
+DO_ZZZW_ACC(sve2_smlsl_zzzw_h, int16_t, int8_t, H1_2, H1, DO_NMUL)
+DO_ZZZW_ACC(sve2_smlsl_zzzw_s, int32_t, int16_t, H1_4, H1_2, DO_NMUL)
+DO_ZZZW_ACC(sve2_smlsl_zzzw_d, int64_t, int32_t,     , H1_4, DO_NMUL)
+
+DO_ZZZW_ACC(sve2_umlsl_zzzw_h, uint16_t, uint8_t, H1_2, H1, DO_NMUL)
+DO_ZZZW_ACC(sve2_umlsl_zzzw_s, uint32_t, uint16_t, H1_4, H1_2, DO_NMUL)
+DO_ZZZW_ACC(sve2_umlsl_zzzw_d, uint64_t, uint32_t,     , H1_4, DO_NMUL)
+
 #undef DO_ZZZW_ACC
 
 #define DO_XTNB(NAME, TYPE, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f6eea9554b..c112548db4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7581,3 +7581,79 @@ static bool trans_SQRDMLSH_zzzz(DisasContext *s, arg_rrrr_esz *a)
     };
     return do_sve2_zzzz_ool(s, a, fns[a->esz], 0);
 }
+
+static bool do_smlal_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                         gen_helper_sve2_smlal_zzzw_h,
+        gen_helper_sve2_smlal_zzzw_s, gen_helper_sve2_smlal_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
+}
+
+static bool trans_SMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_smlal_zzzw(s, a, false);
+}
+
+static bool trans_SMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_smlal_zzzw(s, a, true);
+}
+
+static bool do_umlal_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                         gen_helper_sve2_umlal_zzzw_h,
+        gen_helper_sve2_umlal_zzzw_s, gen_helper_sve2_umlal_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
+}
+
+static bool trans_UMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_umlal_zzzw(s, a, false);
+}
+
+static bool trans_UMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_umlal_zzzw(s, a, true);
+}
+
+static bool do_smlsl_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                         gen_helper_sve2_smlsl_zzzw_h,
+        gen_helper_sve2_smlsl_zzzw_s, gen_helper_sve2_smlsl_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
+}
+
+static bool trans_SMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_smlsl_zzzw(s, a, false);
+}
+
+static bool trans_SMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_smlsl_zzzw(s, a, true);
+}
+
+static bool do_umlsl_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sel)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                         gen_helper_sve2_umlsl_zzzw_h,
+        gen_helper_sve2_umlsl_zzzw_s, gen_helper_sve2_umlsl_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], sel);
+}
+
+static bool trans_UMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_umlsl_zzzw(s, a, false);
+}
+
+static bool trans_UMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_umlsl_zzzw(s, a, true);
+}
-- 
2.25.1
