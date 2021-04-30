Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp487156lfg;
        Fri, 30 Apr 2021 13:56:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzXoq+4sidVN8o1sR21PQ5NJVJSQpp+P4ctAbbPRjD1oGza4yVCH2GeZ1xMBEhJ9SFMIuS
X-Received: by 2002:a05:6638:3387:: with SMTP id h7mr6772736jav.96.1619816217585;
        Fri, 30 Apr 2021 13:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619816217; cv=none;
        d=google.com; s=arc-20160816;
        b=LvTjX06CqMC82kqYIEF6Q9uTJVr9xp7gppMjq45bmNVp8v+BpjxvGC0mGTTQX8/Uxx
         Kc7ufMUwc50uwfMwW88+puFmqvhuwPPQSi2LSvdtOFsd4Q4F+3P8SwOexT3b2iSiDLEP
         Mi/uGJd0sYJfkkIA2iSAtEmDWhCvmc7l+zrvM1VbWl/VPcJ3aBf6GkqsN+fzlzwKwBtF
         93e+ueGVfRWJwBVRqjXbAsOZ3dompj8rrxLV6FwHBPP0/FdVQQRyCXb9v6xBZLNpoYqo
         Xbg9V0wh11SBH3oGUOMPkN/qQ+rX+QEXDQm+DEhRkn5snLYW51pQmPaR78+U11uc5h+1
         XYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nJ0tUraTJVmXKzlkMts/F1yRCYj8V5rL50FUHOT1wnQ=;
        b=cPgZSWFcF5NFGIrklroGYnfmewtBW05P1WBfk1aAsW4a1xFz0W2Z23iDTn/Bnh/121
         6fAemFD7FOrjBc6Yg2jDjPCje4ZYnNmX/vQCpnXUGaK1oAk71EfqjPGVExGrEMTf+9D9
         joutk5TAnC6JD3rskJtWj0v+ZkjQHZ1YCsiEHyG3wcfFBe/oA9MN2vnMSE00FJBPKykw
         Cvy7jXssQy13gyNlBFdqVSgodfsrBcuCbBFOg7B9POi9hCbHMUViSs+DKsVT2ro8InVv
         2Zsg8KIwAftaFk1XbY6MuoGZMdF3IT/Q5f/bwmM3esdZXMeDAzZ2fnMboIYt8tYS3YcS
         zLBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hi1ISgHx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si3675976ild.11.2021.04.30.13.56.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:56:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hi1ISgHx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaC0-0004RI-Qz
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:56:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZj5-0000ok-Tf
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:27:05 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZid-0006Cf-M6
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:59 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so2378582pjv.1
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nJ0tUraTJVmXKzlkMts/F1yRCYj8V5rL50FUHOT1wnQ=;
 b=Hi1ISgHxIpIls2WC21PNtPV9r5HgjagDikNVbLVwZ2X3OjlRvBGfgi6E5OxXoQLrro
 Mdc5SkGTVp/KRRdzobyd24EgrI8uGl3hLO6rH1brrmgAB5OMtfFoEyrk1gMkO3+1UvUG
 tNChIN2ZLOuW2IAQyFdcqsyx2Q1z64nnqi9qE/etqtdEEZEZoL//9iW5bXNqj9MB9xVL
 219TLn59L1v1937kvPJH9eTlLaQ4Q5II1oKPZZWlPT/vrK04an1nA7X9ot5SyshoME9o
 ImX+O6XPglDdfd73qdsb7Xpi0Z8/d1hULPtXKMErpgx+xovR641CqnDgPg8C6OCsDTAq
 qLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nJ0tUraTJVmXKzlkMts/F1yRCYj8V5rL50FUHOT1wnQ=;
 b=lk1gtMCEYGhq0oQHrByjsfU3Ox/ze6ith4Ed8vYrWimAMddOg5Ta6+8ZtVXWNdtuMB
 7hkXJuW6X6i0nVJ/dwbWg+elvbkZtkkL6L+QLeW/8dq6dR3itRHriN61jQJjrE5p8CqN
 Wu1JpKA1SjFMebilaJQp5+q0bGxTEuY71xWNam9mSut2OdbUTv75mAzq3p1Db7+nIXii
 3LMyI0iF6eSi3O3qF/ts5etMkrqLrYytfhX2CC3vFSw//4z57P3H+5SGG6+Z5V/2LQEk
 a8o1vZS/FFPKC+buFg8TT3tXBAWN3qyOYL+wWxEQ1KmVHYBBwQX9BYea1IiSW1Vr8XvP
 GLwA==
X-Gm-Message-State: AOAM530QqPYgJpaUr5VLApD0H7U1CXj0j12Va7ahc2M/ACJ6AvsaDaAj
 ZVuAlFYnEcN3AEtEQM2Vm6B3cWDvPAxb/w==
X-Received: by 2002:a17:90a:b292:: with SMTP id
 c18mr17544325pjr.179.1619814393505; 
 Fri, 30 Apr 2021 13:26:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 36/82] target/arm: Implement SVE2 integer multiply-add long
Date: Fri, 30 Apr 2021 13:25:24 -0700
Message-Id: <20210430202610.1136687-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pyygi1LO4Z5N

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
index 859091b7cf..8b86e7ecd6 100644
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
index 4326b597e6..0fdfd1e9e0 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7580,3 +7580,79 @@ static bool trans_SQRDMLSH_zzzz(DisasContext *s, arg_rrrr_esz *a)
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

