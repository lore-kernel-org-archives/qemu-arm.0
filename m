Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4040658lfm;
        Mon, 24 May 2021 18:49:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoC+V8FCthjri7eT2gmWDF40G4nk9nozrjI6oDZFdprAhf7l7zrNq1vp0Dis1sP2sSakuc
X-Received: by 2002:a05:6902:70c:: with SMTP id k12mr42252604ybt.64.1621907371340;
        Mon, 24 May 2021 18:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621907371; cv=none;
        d=google.com; s=arc-20160816;
        b=SXbMvoJuRu2ZoXNKVhIKWfKokuziQ3ArKvlzJDTL/ZhUJ3SN/QewXd2vhT16Olhbzv
         bXWRnMJUmgMdw6s8pK+1cPgIWYyLbs4bIeYZ3za4beuFiPRKfvLXoWQofIZq0xUlE1+6
         K0CnygFQhvYRcaICuvNH4bRvgFxkXkc5VAPYGAIkBAn1Svxztc6CmXh/qEwgddew5eKx
         1oGTLjWv1o3jEcnhRBOVeLxl/9dRFjv6XGZLF2Iru6N9B1tGlQSwr+Y9GxXKlH23RDIE
         xkMsbdLEBMEd+AUyculJ8HOV89Kw172fKS6DmkKAi8gEv5M6izzppO0fuHpeu4jccfyX
         ukoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XxyJoHFLZ6IEaEoSZY3UlLt3WrNUJc/LLzbZKvHo7/o=;
        b=mXz5BUlZLcUE1mNA5bwjmDXl1iL1y4IBdGjBlrpBY7wIx5qVxFV8Rd4lyG1LE/3hoW
         xgM8mzosP/vWx8ek/XwrU7kXEfewTa8xsTemuwQk5XWA0gZc5HE/YluQIZI+M1cEqd3v
         k3uHcwiW9yIwEZ+9x45WjWkglQC03xXLQszt4Iev3cmUagFzf5RMXAfl/dBD15gEF4dH
         skpCAwkxRGEVsFzzl/yI8XfeDCegyzhhJ3o1r5fhMHuXgfTwF/UcDLrUo4fxn1qSetUL
         QMaJitZBcwddFATtX+qlpFF1A6JCi07Dr6HE37bKpBkG46oVLNbUXcvBQBDdw82HiKOj
         2izQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m0I0Ix3P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si16877888ybe.44.2021.05.24.18.49.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:49:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m0I0Ix3P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMCI-0003vE-L8
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:49:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYM-0000Kq-H4
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:14 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:47099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXr-00045J-VW
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:14 -0400
Received: by mail-pg1-x535.google.com with SMTP id m124so21384821pgm.13
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XxyJoHFLZ6IEaEoSZY3UlLt3WrNUJc/LLzbZKvHo7/o=;
 b=m0I0Ix3PUGxTJ9A4r9zv0GnGDoZUeNOPHHblWSfq7wf+iHxAecA/5IlX03dSmN5+lQ
 xwAWPHfiAALtFbZqYvc4mDXmrhZhNoUypgWmJ2hfNTryX+bNWi7smVmriQnO5FIiRQe1
 A2vjHAKKcDsHhVbGFP4L0bd2XEgC1qIs3OPMTkO4zKat+LpeyEG1FMO+tT84B3VjvhHT
 Stjoiub0xMn6lJp7Rjb+8/NNHHGKzn7CmfinFFUjUTXHnA9wCx6jgUTZgsTe8R/lKw/L
 n4rbRNpChq3yASczl4FV4faZdbSg9gI5JKdkf5cvDkWvNIG+uCSMpvE/hkTnicAyPhYL
 3qJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XxyJoHFLZ6IEaEoSZY3UlLt3WrNUJc/LLzbZKvHo7/o=;
 b=qzir2065G0yuvEolUvhTZlVkbqP3xHUd9R3ZM/kAOMZG2tWSrXWdf9jhL7g3e5Uoiv
 0cOsdX40FpENkEzrOiFBs/KVXD36p0/PuIS8N+duPta0qqFjTBoPPDdyRp3G/BFKs3Kv
 jJ9lsigo4CcK/141pJiApliBpU5zW5kr+ZLXhkzFJBP2xNS9qbKTpwBFNCKr3Hs+cX4j
 DOqlnlT5zH4EHxCBiH2sVytG+6T8DyuI/D5b6FCG7SlNxM9y1dJX1hafO4A23BCj12u/
 MuyS1Pb6Aueiyx4ViIiN8c3E0a20916Sm7Ysrk9QwP0RcP0+FfKyrlX/SYXTFmGnoLrM
 qHjg==
X-Gm-Message-State: AOAM533TYY/Ur7mbUYJpsvcFr1KafShBwbcZgjFTIB4mLWR2xodEgunh
 Tj5qm3BrdzqzIYyAqIcbh8KQQloNML9ezw==
X-Received: by 2002:a63:5158:: with SMTP id r24mr16324643pgl.41.1621904856574; 
 Mon, 24 May 2021 18:07:36 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 60/92] target/arm: Implement SVE2 multiply-add long
 (indexed)
Date: Mon, 24 May 2021 18:03:26 -0700
Message-Id: <20210525010358.152808-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wHGqbOCqeRlK

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Rebasing dropped from v6.
---
 target/arm/helper-sve.h    | 17 +++++++++++++++++
 target/arm/sve.decode      | 18 ++++++++++++++++++
 target/arm/sve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-sve.c | 20 ++++++++++++++++++++
 4 files changed, 71 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 0be0d90bee..4a0e70ee91 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2693,3 +2693,20 @@ DEF_HELPER_FLAGS_4(sve2_sqdmull_idx_s, TCG_CALL_NO_RWG,
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
index 35010d755f..dd50b9b5c0 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -823,6 +823,24 @@ SQDMLSLB_zzxw_d 01000100 11 1 ..... 0011.0 ..... .....   @rrxr_2a esz=3
 SQDMLSLT_zzxw_s 01000100 10 1 ..... 0011.1 ..... .....   @rrxr_3a esz=2
 SQDMLSLT_zzxw_d 01000100 11 1 ..... 0011.1 ..... .....   @rrxr_2a esz=3
 
+# SVE2 multiply-add long (indexed)
+SMLALB_zzxw_s   01000100 10 1 ..... 1000.0 ..... .....   @rrxr_3a esz=2
+SMLALB_zzxw_d   01000100 11 1 ..... 1000.0 ..... .....   @rrxr_2a esz=3
+SMLALT_zzxw_s   01000100 10 1 ..... 1000.1 ..... .....   @rrxr_3a esz=2
+SMLALT_zzxw_d   01000100 11 1 ..... 1000.1 ..... .....   @rrxr_2a esz=3
+UMLALB_zzxw_s   01000100 10 1 ..... 1001.0 ..... .....   @rrxr_3a esz=2
+UMLALB_zzxw_d   01000100 11 1 ..... 1001.0 ..... .....   @rrxr_2a esz=3
+UMLALT_zzxw_s   01000100 10 1 ..... 1001.1 ..... .....   @rrxr_3a esz=2
+UMLALT_zzxw_d   01000100 11 1 ..... 1001.1 ..... .....   @rrxr_2a esz=3
+SMLSLB_zzxw_s   01000100 10 1 ..... 1010.0 ..... .....   @rrxr_3a esz=2
+SMLSLB_zzxw_d   01000100 11 1 ..... 1010.0 ..... .....   @rrxr_2a esz=3
+SMLSLT_zzxw_s   01000100 10 1 ..... 1010.1 ..... .....   @rrxr_3a esz=2
+SMLSLT_zzxw_d   01000100 11 1 ..... 1010.1 ..... .....   @rrxr_2a esz=3
+UMLSLB_zzxw_s   01000100 10 1 ..... 1011.0 ..... .....   @rrxr_3a esz=2
+UMLSLB_zzxw_d   01000100 11 1 ..... 1011.0 ..... .....   @rrxr_2a esz=3
+UMLSLT_zzxw_s   01000100 10 1 ..... 1011.1 ..... .....   @rrxr_3a esz=2
+UMLSLT_zzxw_d   01000100 11 1 ..... 1011.1 ..... .....   @rrxr_2a esz=3
+
 # SVE2 saturating multiply (indexed)
 SQDMULLB_zzx_s  01000100 10 1 ..... 1110.0 ..... .....   @rrx_3a esz=2
 SQDMULLB_zzx_d  01000100 11 1 ..... 1110.0 ..... .....   @rrx_2a esz=3
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3953e2f502..2ec936a8b1 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1551,6 +1551,20 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
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
 
@@ -1563,6 +1577,8 @@ DO_ZZXW(sve2_sqdmlal_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLAL_D)
 DO_ZZXW(sve2_sqdmlsl_idx_s, int32_t, int16_t, H1_4, H1_2, DO_SQDMLSL_S)
 DO_ZZXW(sve2_sqdmlsl_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLSL_D)
 
+#undef DO_MLA
+#undef DO_MLS
 #undef DO_ZZXW
 
 #define DO_ZZX(NAME, TYPEW, TYPEN, HW, HN, OP) \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a03fce003e..1f6a61bf55 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3944,6 +3944,26 @@ DO_SVE2_RRXR_TB(trans_SQDMLSLB_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, false)
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

