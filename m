Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp474698lfg;
        Fri, 30 Apr 2021 13:38:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx398l/RIfXTHbYej0smsrgQvN9on7k6F1xmdGhvzwaj2/kJNWQVCWm3NOGHcARW8ZmVY35
X-Received: by 2002:a02:8308:: with SMTP id v8mr6765868jag.143.1619815097863;
        Fri, 30 Apr 2021 13:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619815097; cv=none;
        d=google.com; s=arc-20160816;
        b=au5bpyLeN5eHusQ9b3z0mjGugAHEul+Hf67U6DDFVxOUgoB5Geq0YMNVpvKcUbC2zj
         I/O+WaG7N0b0+hK6v1sYnrHV3O6b3qB0XgnF+GZS/zMwCh0Av+7/z/xaQmwbFEANaqNw
         hE4Qj6Rf0/6E+oj8LTG8tSsLs0eIHUnU0asJh8mf7+dAJbEuycUOJnCcy1JFPcR3lPnA
         mx2Nx4iSnMgre8v5QDFlLKBYI46FXZZ12Y9MYAOEdlc6WyfGh+EZgRuZrvjghnLqgyp+
         7I8fBvwia9DF+3fnR7XShGfivIkKEzu9Iz2hZCuHHGOOD36Vg9UGy+5zQMOWPuw0/Iid
         PFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZS2f7fEpsE5PZphfky/IIrJKblfMHybmN+wC38aYIj8=;
        b=N0lyRP+DpGf1ih3IBw2YvTTg4XWF5bJJ4rdhFX6vrQGgYZoziUo7KZSRIYgEcOpS7X
         AGjH6/7BGxJDKM0OixaGEI2HWy2DaN40KrMkhGqffiqv9uiENyiki19Xx4X2wGWkrM3B
         ndy03viM2uOqbMsBTvvR9RLNccNZ25FPTlToJgdQrREm1bNf+H8UdPDgQOBAf5qXiccX
         H7W233I3zf8zOeItW05PnI6LDmFJsbM2zR+1q/WNDjUjLM0EdOv/cclkPkJygu++ZzG9
         yAU9zP/LS07LM4hrxdT8yiURFsOx+vq4qNvNKlCgEntj+0Y++zXjJnRwdqLgC7fh9sQ/
         +dDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ldJ7Q+V0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w13si3268262ilm.57.2021.04.30.13.38.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 13:38:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ldJ7Q+V0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcZtx-0004uW-1h
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 16:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiY-0008QA-EA
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:31 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiO-00060K-0a
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:30 -0400
Received: by mail-pj1-x102c.google.com with SMTP id lp8so6987725pjb.1
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZS2f7fEpsE5PZphfky/IIrJKblfMHybmN+wC38aYIj8=;
 b=ldJ7Q+V0ypVZOubAKKrDEP7QeCQKfzxfN0cjC6XRiajaLEkyPqP6vyTRaurJuPIKEj
 Gv7P7oXXzW2gBq1Vs9mwAtMdsIquzY/j5AdGOramEqe2rlleJqBWtFjRvY+tgaJu8On0
 Gy09RiAn/kBgzVQKc9I7pJEUygC9yhNJeEoOzyZs5k/0dQR2vayltTCqfL63M+Lw5s3x
 Zq/xwTtE+jzJb3nbPiouBJK4mfCSkI1jZQn4wCXW5K80XW6Yy/6on+nUYwab6VvtWp+c
 aZrmSoMP29gQQ53vhLCKOqBdCZO4QIytsdNnXD49VjnNXPQSBbchhyTDrJL5cpjalPI1
 wV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZS2f7fEpsE5PZphfky/IIrJKblfMHybmN+wC38aYIj8=;
 b=cTrM8X5PlQvF6Le/hFV3LLYNgl67uNQp/6RhCe7oHkYxN6/PTdhFiR5SqUVwxyA/P3
 xZb9an8077ysvdHdUS43DORmiwNVN0VZFFjDGBaaQsa6l72VWTMguYoMJB1PtWrKGpcV
 hA8AXuaUUL2/VClOcC9uc905sGVMXrVYJlaNAW9cH3xRxWiosrYtcGnaGhR6QBELtu6b
 JKmbvhES+KRR8QlcDAAlNuG2prvNmFwm9+532DVUWlk7zTT5LPAwpEC838G3zqhtwwgm
 nEVD1y/qNtpc/E0vLSMHuiaFDRk2jfFuSb8lRFLK2RbXw/dbm2xV46nUpwH3t+YYLXE6
 t37w==
X-Gm-Message-State: AOAM533YoIRap6ffle8cng8+4JHJwE5O+fk6P0SuABjluZTbF55bjS9q
 RLnwUWIcik5IPWIqBd+aMnMrlYTGniIFjA==
X-Received: by 2002:a17:90a:f2ce:: with SMTP id
 gt14mr7297754pjb.177.1619814378620; 
 Fri, 30 Apr 2021 13:26:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/82] target/arm: Implement SVE2 integer add/subtract wide
Date: Fri, 30 Apr 2021 13:25:00 -0700
Message-Id: <20210430202610.1136687-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u9SdAbR425Ah

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix select offsets (laurent desnogues).
---
 target/arm/helper-sve.h    | 16 ++++++++++++++++
 target/arm/sve.decode      | 12 ++++++++++++
 target/arm/sve_helper.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 20 ++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index a81297b387..3286a9c205 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1391,6 +1391,22 @@ DEF_HELPER_FLAGS_4(sve2_uabdl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_uabdl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve2_uabdl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_saddw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_saddw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_saddw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_ssubw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_ssubw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_ssubw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_uaddw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uaddw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_uaddw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_usubw_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_usubw_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_usubw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_ld1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld2bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld3bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 12be0584a8..f6f21426ef 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1184,3 +1184,15 @@ UABDLT          01000101 .. 0 ..... 00 1111 ..... .....  @rd_rn_rm
 SADDLBT         01000101 .. 0 ..... 1000 00 ..... .....  @rd_rn_rm
 SSUBLBT         01000101 .. 0 ..... 1000 10 ..... .....  @rd_rn_rm
 SSUBLTB         01000101 .. 0 ..... 1000 11 ..... .....  @rd_rn_rm
+
+## SVE2 integer add/subtract wide
+
+SADDWB          01000101 .. 0 ..... 010 000 ..... .....  @rd_rn_rm
+SADDWT          01000101 .. 0 ..... 010 001 ..... .....  @rd_rn_rm
+UADDWB          01000101 .. 0 ..... 010 010 ..... .....  @rd_rn_rm
+UADDWT          01000101 .. 0 ..... 010 011 ..... .....  @rd_rn_rm
+
+SSUBWB          01000101 .. 0 ..... 010 100 ..... .....  @rd_rn_rm
+SSUBWT          01000101 .. 0 ..... 010 101 ..... .....  @rd_rn_rm
+USUBWB          01000101 .. 0 ..... 010 110 ..... .....  @rd_rn_rm
+USUBWT          01000101 .. 0 ..... 010 111 ..... .....  @rd_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 3d0ee76411..cf0dbb3987 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1156,6 +1156,36 @@ DO_ZZZ_TB(sve2_uabdl_d, uint64_t, uint32_t,     , H1_4, DO_ABD)
 
 #undef DO_ZZZ_TB
 
+#define DO_ZZZ_WTB(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
+{                                                              \
+    intptr_t i, opr_sz = simd_oprsz(desc);                     \
+    int sel2 = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN); \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {              \
+        TYPEW nn = *(TYPEW *)(vn + HW(i));                     \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + sel2));              \
+        *(TYPEW *)(vd + HW(i)) = OP(nn, mm);                   \
+    }                                                          \
+}
+
+DO_ZZZ_WTB(sve2_saddw_h, int16_t, int8_t, H1_2, H1, DO_ADD)
+DO_ZZZ_WTB(sve2_saddw_s, int32_t, int16_t, H1_4, H1_2, DO_ADD)
+DO_ZZZ_WTB(sve2_saddw_d, int64_t, int32_t,     , H1_4, DO_ADD)
+
+DO_ZZZ_WTB(sve2_ssubw_h, int16_t, int8_t, H1_2, H1, DO_SUB)
+DO_ZZZ_WTB(sve2_ssubw_s, int32_t, int16_t, H1_4, H1_2, DO_SUB)
+DO_ZZZ_WTB(sve2_ssubw_d, int64_t, int32_t,     , H1_4, DO_SUB)
+
+DO_ZZZ_WTB(sve2_uaddw_h, uint16_t, uint8_t, H1_2, H1, DO_ADD)
+DO_ZZZ_WTB(sve2_uaddw_s, uint32_t, uint16_t, H1_4, H1_2, DO_ADD)
+DO_ZZZ_WTB(sve2_uaddw_d, uint64_t, uint32_t,     , H1_4, DO_ADD)
+
+DO_ZZZ_WTB(sve2_usubw_h, uint16_t, uint8_t, H1_2, H1, DO_SUB)
+DO_ZZZ_WTB(sve2_usubw_s, uint32_t, uint16_t, H1_4, H1_2, DO_SUB)
+DO_ZZZ_WTB(sve2_usubw_d, uint64_t, uint32_t,     , H1_4, DO_SUB)
+
+#undef DO_ZZZ_WTB
+
 /* Two-operand reduction expander, controlled by a predicate.
  * The difference between TYPERED and TYPERET has to do with
  * sign-extension.  E.g. for SMAX, TYPERED must be signed,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ae8323adb7..70900c122f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6020,3 +6020,23 @@ DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
 DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
 DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
+
+#define DO_SVE2_ZZZ_WTB(NAME, name, SEL2) \
+static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)       \
+{                                                               \
+    static gen_helper_gvec_3 * const fns[4] = {                 \
+        NULL,                       gen_helper_sve2_##name##_h, \
+        gen_helper_sve2_##name##_s, gen_helper_sve2_##name##_d, \
+    };                                                          \
+    return do_sve2_zzw_ool(s, a, fns[a->esz], SEL2);            \
+}
+
+DO_SVE2_ZZZ_WTB(SADDWB, saddw, false)
+DO_SVE2_ZZZ_WTB(SADDWT, saddw, true)
+DO_SVE2_ZZZ_WTB(SSUBWB, ssubw, false)
+DO_SVE2_ZZZ_WTB(SSUBWT, ssubw, true)
+
+DO_SVE2_ZZZ_WTB(UADDWB, uaddw, false)
+DO_SVE2_ZZZ_WTB(UADDWT, uaddw, true)
+DO_SVE2_ZZZ_WTB(USUBWB, usubw, false)
+DO_SVE2_ZZZ_WTB(USUBWT, usubw, true)
-- 
2.25.1

