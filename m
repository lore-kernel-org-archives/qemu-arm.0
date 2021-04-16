Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp729368lfr;
        Fri, 16 Apr 2021 14:08:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0yf6XhRbcq4p5ngzx/59IowPMCwZQyXFSzZKmbgjpTAeIPBKIa29zGyPEtb59VVxvsJEU
X-Received: by 2002:a92:6e0e:: with SMTP id j14mr8434913ilc.90.1618607318108;
        Fri, 16 Apr 2021 14:08:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618607318; cv=none;
        d=google.com; s=arc-20160816;
        b=A22fSGRiMg9YdnMsY6Kh/hm+/lpd9gFIDY6bJvg8NgOSmo4M3pPNCQ4dBz90d06MB8
         fj86aYqsfKc2QyJRyl1KnLpxsQli4vBFmVXBd/msHk6xC47A2UsZ+TE+limENvBB0DNl
         VbBPy2BHRcrQfMh6CXEEXvL/7WsEcC3u4Y4xlg9pIIeDWR+CHHoZyoQ6ZiAgxxBgw1M/
         +ZNEGn5KSznEaXC2BRirJh1xwzlLO2Rhg/96HbPFlrubcI8BeaDX/bZQ95/DWLJFeBYz
         4Jk3a2roXt1w8xxEE0HpfV6h++/MkIKGfwkt+zxNhBqT5W69sRQAuJIq0aBuPVyzuODI
         LRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nkSSxMkXeoKQp4t8tpIye6M1xfm+ZviLl0PQ26Xf9wU=;
        b=MxbMSodbWTqPTcBMi3jO3dy9yQY28EfW8qXalJEiU85cvfVRapvx+s9ZqIoJ8fs/Hc
         jvvRdl/rUhf6ygvvmGs/iktHfuh0vBygkd2rriz41Gvc+/A0Ig/7MahEH2oJAtyNu+Pg
         iQEz4LRnmbmBxoDCOsDMHGqw84rBv0wGJal6MTB3HShyv+VSWRM1YgiDmGu50gOHckMq
         8Kvwr1t4wn7+ZBDDwAgeEAPaEpJxDeH2+E45E1nkml4sCyjrYMarrY9bbgtqUvKCrIYn
         kZy+FtdpMPk/ZJNhmbrf6m4g61YY73UYplzkMXbathnOj/f7fdGqGVlRbdW9crk90fwR
         Y3/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y0UcVowD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z6si3483561ilb.14.2021.04.16.14.08.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:08:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y0UcVowD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXVhd-00039z-7D
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcB-0004A9-QL
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:01 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVc5-00013Y-SV
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:02:59 -0400
Received: by mail-pl1-x62a.google.com with SMTP id t22so14309211ply.1
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nkSSxMkXeoKQp4t8tpIye6M1xfm+ZviLl0PQ26Xf9wU=;
 b=Y0UcVowDlNdXri7y+xydfZi5Hm6ch+5uVmwCNL4k34yX47IpQYPMJpIVDjt3jdV6Fc
 tPvYC/6Vv4xZf+fgp21Rfw7OdKSE5iWfY/kkBVXTVNd9PV+F8hWLhgs63EFta1Iup9f3
 7BOHqqJVw/TGeA2YAZa0R2i8nzFvyP2kdhZhLRekO6WcbrSKJNQiUHjokmrTO4nYwc/M
 DTeA87A68YfSe4ajX75Tg8w27vmUTXdhBLYOSwRVn8IsiQGy1+3GsxlGmUxLda2dmKQM
 p2vtpanhoXW1RSZuNFtGVUqXZ14zH090rRyHTop63hgFqQCut4ftPIvRfEb0g0QhDUUb
 vs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nkSSxMkXeoKQp4t8tpIye6M1xfm+ZviLl0PQ26Xf9wU=;
 b=UJXVfKP7FqL4d8TtgA9HrGRz3oAfU/BYlp63UdcmlPeCiPtWcKZSSmiZ0YCjaBmjQW
 eR/hRqUtEARkNb4i+3ZgYHla2zbnETZ+si/Rz1yPRyW5zC3eLAtwbfQZOjKVAgNEJQmB
 g8/fajNmFANjHyzzHyzeHdPHeKSzx60G0n4jpoIWhKiEa+8Vm5USFEQ8croyUFV0OT4F
 2zmEc1g+IHkTP7kRhdTmrGu9+/n7o0n7nXVOTT/rNrxTgW6fzmEDg5TcSBnJjwnv5R10
 528TkQ/kBi1dmKdbGP1qidelkQNfTdAk7HfAPsK/nr5dgTeF9VURj2SINqerFhEwhZVZ
 7WzA==
X-Gm-Message-State: AOAM5331Sy8lOEbaxxVpwz+mjP4C7QDT0Tj6q8I25I+p87r3UvjJaF01
 CqXOi1wSFvpKidyD1ncSLb8Vhw==
X-Received: by 2002:a17:90b:1118:: with SMTP id
 gi24mr11315423pjb.30.1618606972262; 
 Fri, 16 Apr 2021 14:02:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:02:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/81] target/arm: Implement SVE2 saturating add/subtract
 (predicated)
Date: Fri, 16 Apr 2021 14:01:28 -0700
Message-Id: <20210416210240.1591291-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: 3fOn6KYno8c0

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  54 +++++++++++
 target/arm/sve.decode      |  11 +++
 target/arm/sve_helper.c    | 194 ++++++++++++++++++++++++++-----------
 target/arm/translate-sve.c |   7 ++
 4 files changed, 210 insertions(+), 56 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 09bc067dd4..37461c9927 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -371,6 +371,60 @@ DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_sqadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uqadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqsub_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqsub_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqsub_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqsub_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uqsub_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqsub_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqsub_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uqsub_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_suqadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_suqadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_suqadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_suqadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_usqadd_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_usqadd_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_usqadd_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_usqadd_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 61a3321325..cd4f73265f 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1148,3 +1148,14 @@ SMAXP           01000100 .. 010 100 101 ... ..... .....  @rdn_pg_rm
 UMAXP           01000100 .. 010 101 101 ... ..... .....  @rdn_pg_rm
 SMINP           01000100 .. 010 110 101 ... ..... .....  @rdn_pg_rm
 UMINP           01000100 .. 010 111 101 ... ..... .....  @rdn_pg_rm
+
+### SVE2 saturating add/subtract (predicated)
+
+SQADD_zpzz      01000100 .. 011 000 100 ... ..... .....  @rdn_pg_rm
+UQADD_zpzz      01000100 .. 011 001 100 ... ..... .....  @rdn_pg_rm
+SQSUB_zpzz      01000100 .. 011 010 100 ... ..... .....  @rdn_pg_rm
+UQSUB_zpzz      01000100 .. 011 011 100 ... ..... .....  @rdn_pg_rm
+SUQADD          01000100 .. 011 100 100 ... ..... .....  @rdn_pg_rm
+USQADD          01000100 .. 011 101 100 ... ..... .....  @rdn_pg_rm
+SQSUB_zpzz      01000100 .. 011 110 100 ... ..... .....  @rdm_pg_rn # SQSUBR
+UQSUB_zpzz      01000100 .. 011 111 100 ... ..... .....  @rdm_pg_rn # UQSUBR
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7cc559d950..12a2078edb 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -678,6 +678,135 @@ DO_ZPZZ(sve2_uhsub_zpzz_h, uint16_t, H1_2, DO_HSUB_BHS)
 DO_ZPZZ(sve2_uhsub_zpzz_s, uint32_t, H1_4, DO_HSUB_BHS)
 DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
 
+static inline int32_t do_sat_bhs(int64_t val, int64_t min, int64_t max)
+{
+    return val >= max ? max : val <= min ? min : val;
+}
+
+#define DO_SQADD_B(n, m) do_sat_bhs((int64_t)n + m, INT8_MIN, INT8_MAX)
+#define DO_SQADD_H(n, m) do_sat_bhs((int64_t)n + m, INT16_MIN, INT16_MAX)
+#define DO_SQADD_S(n, m) do_sat_bhs((int64_t)n + m, INT32_MIN, INT32_MAX)
+
+static inline int64_t do_sqadd_d(int64_t n, int64_t m)
+{
+    int64_t r = n + m;
+    if (((r ^ n) & ~(n ^ m)) < 0) {
+        /* Signed overflow.  */
+        return r < 0 ? INT64_MAX : INT64_MIN;
+    }
+    return r;
+}
+
+DO_ZPZZ(sve2_sqadd_zpzz_b, int8_t, H1_2, DO_SQADD_B)
+DO_ZPZZ(sve2_sqadd_zpzz_h, int16_t, H1_2, DO_SQADD_H)
+DO_ZPZZ(sve2_sqadd_zpzz_s, int32_t, H1_4, DO_SQADD_S)
+DO_ZPZZ_D(sve2_sqadd_zpzz_d, int64_t, do_sqadd_d)
+
+#define DO_UQADD_B(n, m) do_sat_bhs((int64_t)n + m, 0, UINT8_MAX)
+#define DO_UQADD_H(n, m) do_sat_bhs((int64_t)n + m, 0, UINT16_MAX)
+#define DO_UQADD_S(n, m) do_sat_bhs((int64_t)n + m, 0, UINT32_MAX)
+
+static inline uint64_t do_uqadd_d(uint64_t n, uint64_t m)
+{
+    uint64_t r = n + m;
+    return r < n ? UINT64_MAX : r;
+}
+
+DO_ZPZZ(sve2_uqadd_zpzz_b, uint8_t, H1_2, DO_UQADD_B)
+DO_ZPZZ(sve2_uqadd_zpzz_h, uint16_t, H1_2, DO_UQADD_H)
+DO_ZPZZ(sve2_uqadd_zpzz_s, uint32_t, H1_4, DO_UQADD_S)
+DO_ZPZZ_D(sve2_uqadd_zpzz_d, uint64_t, do_uqadd_d)
+
+#define DO_SQSUB_B(n, m) do_sat_bhs((int64_t)n - m, INT8_MIN, INT8_MAX)
+#define DO_SQSUB_H(n, m) do_sat_bhs((int64_t)n - m, INT16_MIN, INT16_MAX)
+#define DO_SQSUB_S(n, m) do_sat_bhs((int64_t)n - m, INT32_MIN, INT32_MAX)
+
+static inline int64_t do_sqsub_d(int64_t n, int64_t m)
+{
+    int64_t r = n - m;
+    if (((r ^ n) & (n ^ m)) < 0) {
+        /* Signed overflow.  */
+        return r < 0 ? INT64_MAX : INT64_MIN;
+    }
+    return r;
+}
+
+DO_ZPZZ(sve2_sqsub_zpzz_b, int8_t, H1_2, DO_SQSUB_B)
+DO_ZPZZ(sve2_sqsub_zpzz_h, int16_t, H1_2, DO_SQSUB_H)
+DO_ZPZZ(sve2_sqsub_zpzz_s, int32_t, H1_4, DO_SQSUB_S)
+DO_ZPZZ_D(sve2_sqsub_zpzz_d, int64_t, do_sqsub_d)
+
+#define DO_UQSUB_B(n, m) do_sat_bhs((int64_t)n - m, 0, UINT8_MAX)
+#define DO_UQSUB_H(n, m) do_sat_bhs((int64_t)n - m, 0, UINT16_MAX)
+#define DO_UQSUB_S(n, m) do_sat_bhs((int64_t)n - m, 0, UINT32_MAX)
+
+static inline uint64_t do_uqsub_d(uint64_t n, uint64_t m)
+{
+    return n > m ? n - m : 0;
+}
+
+DO_ZPZZ(sve2_uqsub_zpzz_b, uint8_t, H1_2, DO_UQSUB_B)
+DO_ZPZZ(sve2_uqsub_zpzz_h, uint16_t, H1_2, DO_UQSUB_H)
+DO_ZPZZ(sve2_uqsub_zpzz_s, uint32_t, H1_4, DO_UQSUB_S)
+DO_ZPZZ_D(sve2_uqsub_zpzz_d, uint64_t, do_uqsub_d)
+
+#define DO_SUQADD_B(n, m) \
+    do_sat_bhs((int64_t)(int8_t)n + m, INT8_MIN, INT8_MAX)
+#define DO_SUQADD_H(n, m) \
+    do_sat_bhs((int64_t)(int16_t)n + m, INT16_MIN, INT16_MAX)
+#define DO_SUQADD_S(n, m) \
+    do_sat_bhs((int64_t)(int32_t)n + m, INT32_MIN, INT32_MAX)
+
+static inline int64_t do_suqadd_d(int64_t n, uint64_t m)
+{
+    uint64_t r = n + m;
+
+    if (n < 0) {
+        /* Note that m - abs(n) cannot underflow. */
+        if (r > INT64_MAX) {
+            /* Result is either very large positive or negative. */
+            if (m > -n) {
+                /* m > abs(n), so r is a very large positive. */
+                return INT64_MAX;
+            }
+            /* Result is negative. */
+        }
+    } else {
+        /* Both inputs are positive: check for overflow.  */
+        if (r < m || r > INT64_MAX) {
+            return INT64_MAX;
+        }
+    }
+    return r;
+}
+
+DO_ZPZZ(sve2_suqadd_zpzz_b, uint8_t, H1_2, DO_SUQADD_B)
+DO_ZPZZ(sve2_suqadd_zpzz_h, uint16_t, H1_2, DO_SUQADD_H)
+DO_ZPZZ(sve2_suqadd_zpzz_s, uint32_t, H1_4, DO_SUQADD_S)
+DO_ZPZZ_D(sve2_suqadd_zpzz_d, uint64_t, do_suqadd_d)
+
+#define DO_USQADD_B(n, m) \
+    do_sat_bhs((int64_t)n + (int8_t)m, 0, UINT8_MAX)
+#define DO_USQADD_H(n, m) \
+    do_sat_bhs((int64_t)n + (int16_t)m, 0, UINT16_MAX)
+#define DO_USQADD_S(n, m) \
+    do_sat_bhs((int64_t)n + (int32_t)m, 0, UINT32_MAX)
+
+static inline uint64_t do_usqadd_d(uint64_t n, int64_t m)
+{
+    uint64_t r = n + m;
+
+    if (m < 0) {
+        return n < -m ? 0 : r;
+    }
+    return r < n ? UINT64_MAX : r;
+}
+
+DO_ZPZZ(sve2_usqadd_zpzz_b, uint8_t, H1_2, DO_USQADD_B)
+DO_ZPZZ(sve2_usqadd_zpzz_h, uint16_t, H1_2, DO_USQADD_H)
+DO_ZPZZ(sve2_usqadd_zpzz_s, uint32_t, H1_4, DO_USQADD_S)
+DO_ZPZZ_D(sve2_usqadd_zpzz_d, uint64_t, do_usqadd_d)
+
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
@@ -1614,13 +1743,7 @@ void HELPER(sve_sqaddi_b)(void *d, void *a, int32_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(int8_t)) {
-        int r = *(int8_t *)(a + i) + b;
-        if (r > INT8_MAX) {
-            r = INT8_MAX;
-        } else if (r < INT8_MIN) {
-            r = INT8_MIN;
-        }
-        *(int8_t *)(d + i) = r;
+        *(int8_t *)(d + i) = DO_SQADD_B(b, *(int8_t *)(a + i));
     }
 }
 
@@ -1629,13 +1752,7 @@ void HELPER(sve_sqaddi_h)(void *d, void *a, int32_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(int16_t)) {
-        int r = *(int16_t *)(a + i) + b;
-        if (r > INT16_MAX) {
-            r = INT16_MAX;
-        } else if (r < INT16_MIN) {
-            r = INT16_MIN;
-        }
-        *(int16_t *)(d + i) = r;
+        *(int16_t *)(d + i) = DO_SQADD_H(b, *(int16_t *)(a + i));
     }
 }
 
@@ -1644,13 +1761,7 @@ void HELPER(sve_sqaddi_s)(void *d, void *a, int64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(int32_t)) {
-        int64_t r = *(int32_t *)(a + i) + b;
-        if (r > INT32_MAX) {
-            r = INT32_MAX;
-        } else if (r < INT32_MIN) {
-            r = INT32_MIN;
-        }
-        *(int32_t *)(d + i) = r;
+        *(int32_t *)(d + i) = DO_SQADD_S(b, *(int32_t *)(a + i));
     }
 }
 
@@ -1659,13 +1770,7 @@ void HELPER(sve_sqaddi_d)(void *d, void *a, int64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(int64_t)) {
-        int64_t ai = *(int64_t *)(a + i);
-        int64_t r = ai + b;
-        if (((r ^ ai) & ~(ai ^ b)) < 0) {
-            /* Signed overflow.  */
-            r = (r < 0 ? INT64_MAX : INT64_MIN);
-        }
-        *(int64_t *)(d + i) = r;
+        *(int64_t *)(d + i) = do_sqadd_d(b, *(int64_t *)(a + i));
     }
 }
 
@@ -1678,13 +1783,7 @@ void HELPER(sve_uqaddi_b)(void *d, void *a, int32_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint8_t)) {
-        int r = *(uint8_t *)(a + i) + b;
-        if (r > UINT8_MAX) {
-            r = UINT8_MAX;
-        } else if (r < 0) {
-            r = 0;
-        }
-        *(uint8_t *)(d + i) = r;
+        *(uint8_t *)(d + i) = DO_UQADD_B(b, *(uint8_t *)(a + i));
     }
 }
 
@@ -1693,13 +1792,7 @@ void HELPER(sve_uqaddi_h)(void *d, void *a, int32_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint16_t)) {
-        int r = *(uint16_t *)(a + i) + b;
-        if (r > UINT16_MAX) {
-            r = UINT16_MAX;
-        } else if (r < 0) {
-            r = 0;
-        }
-        *(uint16_t *)(d + i) = r;
+        *(uint16_t *)(d + i) = DO_UQADD_H(b, *(uint16_t *)(a + i));
     }
 }
 
@@ -1708,13 +1801,7 @@ void HELPER(sve_uqaddi_s)(void *d, void *a, int64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint32_t)) {
-        int64_t r = *(uint32_t *)(a + i) + b;
-        if (r > UINT32_MAX) {
-            r = UINT32_MAX;
-        } else if (r < 0) {
-            r = 0;
-        }
-        *(uint32_t *)(d + i) = r;
+        *(uint32_t *)(d + i) = DO_UQADD_S(b, *(uint32_t *)(a + i));
     }
 }
 
@@ -1723,11 +1810,7 @@ void HELPER(sve_uqaddi_d)(void *d, void *a, uint64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
-        uint64_t r = *(uint64_t *)(a + i) + b;
-        if (r < b) {
-            r = UINT64_MAX;
-        }
-        *(uint64_t *)(d + i) = r;
+        *(uint64_t *)(d + i) = do_uqadd_d(b, *(uint64_t *)(a + i));
     }
 }
 
@@ -1736,8 +1819,7 @@ void HELPER(sve_uqsubi_d)(void *d, void *a, uint64_t b, uint32_t desc)
     intptr_t i, oprsz = simd_oprsz(desc);
 
     for (i = 0; i < oprsz; i += sizeof(uint64_t)) {
-        uint64_t ai = *(uint64_t *)(a + i);
-        *(uint64_t *)(d + i) = (ai < b ? 0 : ai - b);
+        *(uint64_t *)(d + i) = do_uqsub_d(*(uint64_t *)(a + i), b);
     }
 }
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2d449c9b57..609d5ae7b7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5963,3 +5963,10 @@ DO_SVE2_ZPZZ(SMAXP, smaxp)
 DO_SVE2_ZPZZ(UMAXP, umaxp)
 DO_SVE2_ZPZZ(SMINP, sminp)
 DO_SVE2_ZPZZ(UMINP, uminp)
+
+DO_SVE2_ZPZZ(SQADD_zpzz, sqadd)
+DO_SVE2_ZPZZ(UQADD_zpzz, uqadd)
+DO_SVE2_ZPZZ(SQSUB_zpzz, sqsub)
+DO_SVE2_ZPZZ(UQSUB_zpzz, uqsub)
+DO_SVE2_ZPZZ(SUQADD, suqadd)
+DO_SVE2_ZPZZ(USQADD, usqadd)
-- 
2.25.1

