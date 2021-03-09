Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956168lfg;
        Tue, 9 Mar 2021 08:22:22 -0800 (PST)
X-Received: by 2002:aca:4717:: with SMTP id u23mr3494554oia.115.1615306942087;
        Tue, 09 Mar 2021 08:22:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306942; cv=none;
        d=google.com; s=arc-20160816;
        b=wBGuV2svCHYplqauv5KeC8iJKZeBnuaObKHM9EpGmTKL+oEzJcywj8gsUEWPpKqhdk
         yHv3EIExWDk1kUtCqh260NVCDCifExEu4rqO1woznQqLQ199PJWBSsjAwI0CnSYoL6a0
         380PS/Cu3SX4pMmmY9J5Y1/u6jdfbEmkZzyA5pXwsURNFMyicUdFmsctN2dYjufZ+MC4
         51JFnk2SkuraExXhgjmjplx4p7M02mSvOzUSpkLOUfaF3HJB7WdV1FMWt+30iOuz06NR
         M+uuVOVTRhfIa019XPDnPvbVNRqeupTFKMp0GGRwF2TXDvnrlf4lTJhIMAWTuRmzjZF8
         8lfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6ScXgfjow8dkwDZFECjUC9yhYbtEGzBMTrAi5glL4G8=;
        b=pi0FTp5LNvtUMUnJHk9Ge5VEbTLTNF3D3vyG0bs/vMGKGkhdhruOMMxEcdHgqKPciH
         VTN7OgZLGF41OY/O4bHmfOimWDYssiLR6W33piglje9JeuVo/6y/s6vUtI7Kw+bZIdIW
         +EATJ/HykcUqlvsfi82VHEErjZ7Db8f9YBHaaO8OPLtW1TVODHYg84G6lNAjq7W80+ri
         nZzcdpdV+f/aOAPl7LRW6LwvNwC6mIlSYuxnxwFp7iA35A9l5POwu7e0hKR+DQbGEIPK
         h/2GCxt+E8sHwQewD5BWes/ouUnaikwCzLM4WH7ROFBTcj/7412+LkLvBjcyJhDTQCAi
         AL8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F8Mkuk7H;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j26sor3215172otl.12.2021.03.09.08.22.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:22 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F8Mkuk7H;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ScXgfjow8dkwDZFECjUC9yhYbtEGzBMTrAi5glL4G8=;
        b=F8Mkuk7H34IIvSWZDvKeivpUmA0wlmpMkB0iqM1VtDP53QBS4z37R4uFHSueCKIYRL
         lXg1YNE30t5yFDvEACjXdYgxj6O0eJQ2PwZukHi+ngu1zWXrgsXHDm9zjqs47XWlSC6h
         7iISZQuwtxSj10zDfkH919Dozu7vk1Y2AYjvLE7xZ3zMYVE5AiM9dQJKHrG6kdB7aCOE
         Fpr1sch1WbCXjogH4Jq+DYb956faPY1VEH6On7wnLiQPbdg6a15PDdr7H98cPI8jrIU8
         q39MpWZRSxnDfkUtJpG/s0lIaEkqXv0H7EorI8XC+Z7NXd1pipW1e6dCJiA2PrAvJNaV
         J1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ScXgfjow8dkwDZFECjUC9yhYbtEGzBMTrAi5glL4G8=;
        b=mGQtxfgWYMi2Vd4dh7mvZexDRxx7i1/TSQQtKzOmEkfCMBkaDV9RRnZiYUBUPPjyQc
         lJHYY3oSRO9lHIb6lzEt4o2HCZnVhUgFZeOq3n3Msw68z8txjW4oVCJBcG4ylAEwTinF
         sTqYwC8LN/ovh+esp8IKacXQu7j56URfOXQriDzwjZyUeCY4ic6kZPk9iEdmDKb9m0dj
         zbFwuyTd3jxmVYoirZzIJ7EQQ05BpPbizyJ04zWsZYAfmoqhj1xFD5tYQjSr6F1bNKy9
         hiaJHJaj71bAJ8tlHDa7cLySlvzgoFcTvxHdSDiSQbISSRMFG8CVIMdE9hZ/0Epkhygj
         PWTQ==
X-Gm-Message-State: AOAM532FguYGIrivKkuQaNk6XgZU1JwpY/SvvyQ4kg9Dix5dGLlWmmoE
	dLXLTCVYaeKXYqseFwSekrGzQ2U5
X-Google-Smtp-Source: ABdhPJz59nGT9XUzdZOOFDdc4kzpG8led2QlRUhcB+X2iidqWhz6DalMNtNEY+nyjd3imbaiIkOHNQ==
X-Received: by 2002:a05:6830:24a1:: with SMTP id v1mr3877097ots.119.1615306941726;
        Tue, 09 Mar 2021 08:22:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 60/78] target/arm: Implement SVE2 multiply-add long (indexed)
Date: Tue,  9 Mar 2021 08:20:23 -0800
Message-Id: <20210309162041.23124-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: DfkEj/v1jxpR

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 17 +++++++++++++++++
 target/arm/sve.decode      | 18 ++++++++++++++++++
 target/arm/sve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-sve.c | 20 ++++++++++++++++++++
 4 files changed, 71 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 548dedf24c..5e3a2922c8 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2698,3 +2698,20 @@ DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_smlal_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlal_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlsl_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smlsl_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlal_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlal_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlsl_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umlsl_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 31a3d909f3..c77adf8ca6 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -825,6 +825,24 @@ SQDMLSLB_zzxw_d 01000100 .. 1 ..... 0011.0 ..... .....          @rrxw_d
 SQDMLSLT_zzxw_s 01000100 .. 1 ..... 0011.1 ..... .....          @rrxw_s
 SQDMLSLT_zzxw_d 01000100 .. 1 ..... 0011.1 ..... .....          @rrxw_d
 
+# SVE2 multiply-add long (indexed)
+SMLALB_zzxw_s   01000100 .. 1 ..... 1000.0 ..... .....          @rrxw_s
+SMLALB_zzxw_d   01000100 .. 1 ..... 1000.0 ..... .....          @rrxw_d
+SMLALT_zzxw_s   01000100 .. 1 ..... 1000.1 ..... .....          @rrxw_s
+SMLALT_zzxw_d   01000100 .. 1 ..... 1000.1 ..... .....          @rrxw_d
+UMLALB_zzxw_s   01000100 .. 1 ..... 1001.0 ..... .....          @rrxw_s
+UMLALB_zzxw_d   01000100 .. 1 ..... 1001.0 ..... .....          @rrxw_d
+UMLALT_zzxw_s   01000100 .. 1 ..... 1001.1 ..... .....          @rrxw_s
+UMLALT_zzxw_d   01000100 .. 1 ..... 1001.1 ..... .....          @rrxw_d
+SMLSLB_zzxw_s   01000100 .. 1 ..... 1010.0 ..... .....          @rrxw_s
+SMLSLB_zzxw_d   01000100 .. 1 ..... 1010.0 ..... .....          @rrxw_d
+SMLSLT_zzxw_s   01000100 .. 1 ..... 1010.1 ..... .....          @rrxw_s
+SMLSLT_zzxw_d   01000100 .. 1 ..... 1010.1 ..... .....          @rrxw_d
+UMLSLB_zzxw_s   01000100 .. 1 ..... 1011.0 ..... .....          @rrxw_s
+UMLSLB_zzxw_d   01000100 .. 1 ..... 1011.0 ..... .....          @rrxw_d
+UMLSLT_zzxw_s   01000100 .. 1 ..... 1011.1 ..... .....          @rrxw_s
+UMLSLT_zzxw_d   01000100 .. 1 ..... 1011.1 ..... .....          @rrxw_d
+
 # SVE2 integer multiply long (indexed)
 SMULLB_zzx_s    01000100 .. 1 ..... 1100.0 ..... .....          @rrxl_s
 SMULLB_zzx_d    01000100 .. 1 ..... 1100.0 ..... .....          @rrxl_d
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 95bda0ae38..c64321368f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1546,6 +1546,20 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
     }                                                                     \
 }
 
+#define DO_MLA(N, M, A)  (A + N * M)
+
+DO_ZZXW(sve2_smlal_idx_s, int32_t, int16_t, H1_4, H1_2, DO_MLA)
+DO_ZZXW(sve2_smlal_idx_d, int64_t, int32_t,     , H1_4, DO_MLA)
+DO_ZZXW(sve2_umlal_idx_s, uint32_t, uint16_t, H1_4, H1_2, DO_MLA)
+DO_ZZXW(sve2_umlal_idx_d, uint64_t, uint32_t,     , H1_4, DO_MLA)
+
+#define DO_MLS(N, M, A)  (A - N * M)
+
+DO_ZZXW(sve2_smlsl_idx_s, int32_t, int16_t, H1_4, H1_2, DO_MLS)
+DO_ZZXW(sve2_smlsl_idx_d, int64_t, int32_t,     , H1_4, DO_MLS)
+DO_ZZXW(sve2_umlsl_idx_s, uint32_t, uint16_t, H1_4, H1_2, DO_MLS)
+DO_ZZXW(sve2_umlsl_idx_d, uint64_t, uint32_t,     , H1_4, DO_MLS)
+
 #define DO_SQDMLAL_S(N, M, A)  DO_SQADD_S(A, do_sqdmull_s(N, M))
 #define DO_SQDMLAL_D(N, M, A)  do_sqadd_d(A, do_sqdmull_d(N, M))
 
@@ -1558,6 +1572,8 @@ DO_ZZXW(sve2_sqdmlal_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLAL_D)
 DO_ZZXW(sve2_sqdmlsl_idx_s, int32_t, int16_t, H1_4, H1_2, DO_SQDMLSL_S)
 DO_ZZXW(sve2_sqdmlsl_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLSL_D)
 
+#undef DO_MLA
+#undef DO_MLS
 #undef DO_ZZXW
 
 #define DO_ZZX(NAME, TYPEW, TYPEN, HW, HN, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a3e7d4f38f..6a6698bfe9 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3940,6 +3940,26 @@ DO_SVE2_RRXR_TB(trans_SQDMLSLB_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, false)
 DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, true)
 DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, true)
 
+DO_SVE2_RRXR_TB(trans_SMLALB_zzxw_s, gen_helper_sve2_smlal_idx_s, false)
+DO_SVE2_RRXR_TB(trans_SMLALB_zzxw_d, gen_helper_sve2_smlal_idx_d, false)
+DO_SVE2_RRXR_TB(trans_SMLALT_zzxw_s, gen_helper_sve2_smlal_idx_s, true)
+DO_SVE2_RRXR_TB(trans_SMLALT_zzxw_d, gen_helper_sve2_smlal_idx_d, true)
+
+DO_SVE2_RRXR_TB(trans_UMLALB_zzxw_s, gen_helper_sve2_umlal_idx_s, false)
+DO_SVE2_RRXR_TB(trans_UMLALB_zzxw_d, gen_helper_sve2_umlal_idx_d, false)
+DO_SVE2_RRXR_TB(trans_UMLALT_zzxw_s, gen_helper_sve2_umlal_idx_s, true)
+DO_SVE2_RRXR_TB(trans_UMLALT_zzxw_d, gen_helper_sve2_umlal_idx_d, true)
+
+DO_SVE2_RRXR_TB(trans_SMLSLB_zzxw_s, gen_helper_sve2_smlsl_idx_s, false)
+DO_SVE2_RRXR_TB(trans_SMLSLB_zzxw_d, gen_helper_sve2_smlsl_idx_d, false)
+DO_SVE2_RRXR_TB(trans_SMLSLT_zzxw_s, gen_helper_sve2_smlsl_idx_s, true)
+DO_SVE2_RRXR_TB(trans_SMLSLT_zzxw_d, gen_helper_sve2_smlsl_idx_d, true)
+
+DO_SVE2_RRXR_TB(trans_UMLSLB_zzxw_s, gen_helper_sve2_umlsl_idx_s, false)
+DO_SVE2_RRXR_TB(trans_UMLSLB_zzxw_d, gen_helper_sve2_umlsl_idx_d, false)
+DO_SVE2_RRXR_TB(trans_UMLSLT_zzxw_s, gen_helper_sve2_umlsl_idx_s, true)
+DO_SVE2_RRXR_TB(trans_UMLSLT_zzxw_d, gen_helper_sve2_umlsl_idx_d, true)
+
 #undef DO_SVE2_RRXR_TB
 
 /*
-- 
2.25.1
