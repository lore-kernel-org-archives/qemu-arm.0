Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp489933lfg;
        Fri, 30 Apr 2021 14:00:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywtcHVfwdcNqIwmXdChqBLSdmvN97WPiUCne9uXoHFCeI9M42pMm9WcpOZxGIBdYChfmlj
X-Received: by 2002:a17:906:b315:: with SMTP id n21mr6461658ejz.219.1619816454118;
        Fri, 30 Apr 2021 14:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619816454; cv=none;
        d=google.com; s=arc-20160816;
        b=S+ABwcgSIcy0kg4wJPUhAb5y7q4y6N9Bi/RI9g/GKmgM0MBmu9M/OvA3o1RkWUEAAP
         gPgH/o9HsTDWNju5DmPs6lAfby9GjcZ4SaMPO5MhwDq4FzV+HmweoYPBdvD8px6E92nK
         bxQZ36uvu+9O+Yr++fwJ+5lVea8GV8mwr0l96lazHEAPSYEb5xOYJbCNhgGwHPlElvsl
         iGmrWoIwdwP3qQgs6f1HG0EYYKRSY/dSrZ2ZJ566TwexxXaKtjkpZ21ZdIeRk2CUDF0T
         JWCeoL+dNBjj8ZzVxs95zry8KUjKdoQoR2TpkitSgQtP+fxT5qkk2HWVWZY+9fhzFz78
         uZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jc6bISAZEf9j9mwCzGsWa+M8kmkHcY8KolYL9qX1dMs=;
        b=oeIwMVuyun5/SjyGo2NHjdjmY5FBW6OKbAAWyLmqnUplrHwcxuUbhokMxXrT7wCxvi
         dNEix/7zZJuiv7wYOHntTgfhIi/Gk3ZUD4mEuT5DRgaahLWOFYZOKaUoGVIfkJ9mZVN+
         abEywyI0RA5JUv/3e2gN6pT7gOEoRBh6gnX5TgQm5xxs61lnVQpSV13W5RV8Pr+f5+vt
         PKKKs/WHwgRBr59mT9rL0eqHe2E0Op7X3Pt+naGp+nJfFNhVmbfY520sdK1zZq/o9HV8
         Rdt28PZX7lTeNjgh1VMKpAMWcUoroXScuhMJayrxOYG+D8h8ZK4lbH6YphQp5FYPASvq
         52Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qBTulA+a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13si3228122ede.383.2021.04.30.14.00.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:00:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qBTulA+a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaFo-0000uY-TR
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZjD-0000s7-MY
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:27:11 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:51975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZie-0006DX-Kz
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:27:10 -0400
Received: by mail-pj1-x1035.google.com with SMTP id lp8so6988077pjb.1
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jc6bISAZEf9j9mwCzGsWa+M8kmkHcY8KolYL9qX1dMs=;
 b=qBTulA+aRJKW7hzHeYeYSBh0+YjgZQB9xA+UgGuMtOJJqFQKvRgNLyexhtH0xYE++3
 8imcXTUrOtckRHsWyG0Oz5pDa1I+lWX8UxOZQCWjrGzyilHjTz2PEs5MmLG/8TMrR+ky
 KuhyC0NyCL0HlUPJ8xir2kVx9AjuNt2FwkOswmzpfT88guyT+vWjmJzV8z2TlypqiEp6
 7X1NavU8UZw6/rNgfP+1oUI/Q8kbJn1R2UqxUdPSHDfS7eryjnqjqf6Yrq8jc6e3AUvb
 GO1f+7uRQ67qvshWJwAjUyUlydQeWFqoPk8iVE8DRx3DU08ED1a1I/jPLsh3MXLSAfyT
 tGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jc6bISAZEf9j9mwCzGsWa+M8kmkHcY8KolYL9qX1dMs=;
 b=IHDU2gTPNwIo0i9JsUhz4d/cu7+wJsVki0qBSX84HFKBt/+GHhzooiG7bIrClSUHma
 XBnBaNwYfjBKbWOWOwynZJ9bhm3IUe7KI+LHv4BPFKE0lBAisxxwiZS7ywPjiUDBp6eg
 xJ9NYkcBxwajOzag50JjBrnnZAcXd2gX2+6lNOhxhEIlZ2q+OwkNT/JO3/nmUwDfeUs/
 /vvv79d7jz1exfxmNQO7aHEVNMC2DTuyJCOSbvmeidSMicBD3FRpI8Ybfj8NCX66+4EN
 eB/cGhXk/7skfblg4VSrTeU6a0LM8Ay/UBldkR0Zyt+IJvv6zykivbfGTvkWc9byXlyX
 vkPw==
X-Gm-Message-State: AOAM5309BrE3sQ6FOtougqABa6DinGoIl8Cpm+OlyNzRVI27e4wJv8sz
 8Q1QguRHK3eNlKe4ufhW1kdP4eyW6l0VHw==
X-Received: by 2002:a17:902:e8c1:b029:e9:3c98:2dd2 with SMTP id
 v1-20020a170902e8c1b02900e93c982dd2mr6926732plg.17.1619814394676; 
 Fri, 30 Apr 2021 13:26:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 38/82] target/arm: Implement SVE2 ADDHNB, ADDHNT
Date: Fri, 30 Apr 2021 13:25:26 -0700
Message-Id: <20210430202610.1136687-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NLdqBHcMNK44

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200417162231.10374-2-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  8 ++++++++
 target/arm/sve.decode      |  5 +++++
 target/arm/sve_helper.c    | 36 ++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 13 +++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index d154218452..a369fd2391 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2509,6 +2509,14 @@ DEF_HELPER_FLAGS_3(sve2_uqrshrnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve2_uqrshrnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_addhnb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_addhnt_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnt_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_addhnt_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_b, TCG_CALL_NO_RWG,
                    i32, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_match_ppzz_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 936977eacb..72dd36a5c8 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1320,6 +1320,11 @@ UQSHRNT         01000101 .. 1 ..... 00 1101 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNB        01000101 .. 1 ..... 00 1110 ..... .....  @rd_rn_tszimm_shr
 UQRSHRNT        01000101 .. 1 ..... 00 1111 ..... .....  @rd_rn_tszimm_shr
 
+## SVE2 integer add/subtract narrow high part
+
+ADDHNB          01000101 .. 1 ..... 011 000 ..... .....  @rd_rn_rm
+ADDHNT          01000101 .. 1 ..... 011 001 ..... .....  @rd_rn_rm
+
 ### SVE2 Character Match
 
 MATCH           01000101 .. 1 ..... 100 ... ..... 0 .... @pd_pg_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 572d41a26c..2dead1f056 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2112,6 +2112,42 @@ DO_SHRNT(sve2_uqrshrnt_d, uint64_t, uint32_t,     , H1_4, DO_UQRSHRN_D)
 #undef DO_SHRNB
 #undef DO_SHRNT
 
+#define DO_BINOPNB(NAME, TYPEW, TYPEN, SHIFT, OP)                           \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
+{                                                                           \
+    intptr_t i, opr_sz = simd_oprsz(desc);                                  \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                           \
+        TYPEW nn = *(TYPEW *)(vn + i);                                      \
+        TYPEW mm = *(TYPEW *)(vm + i);                                      \
+        *(TYPEW *)(vd + i) = (TYPEN)OP(nn, mm, SHIFT);                      \
+    }                                                                       \
+}
+
+#define DO_BINOPNT(NAME, TYPEW, TYPEN, SHIFT, HW, HN, OP)                   \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
+{                                                                           \
+    intptr_t i, opr_sz = simd_oprsz(desc);                                  \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                           \
+        TYPEW nn = *(TYPEW *)(vn + HW(i));                                  \
+        TYPEW mm = *(TYPEW *)(vm + HW(i));                                  \
+        *(TYPEN *)(vd + HN(i + sizeof(TYPEN))) = OP(nn, mm, SHIFT);         \
+    }                                                                       \
+}
+
+#define DO_ADDHN(N, M, SH)  ((N + M) >> SH)
+
+DO_BINOPNB(sve2_addhnb_h, uint16_t, uint8_t, 8, DO_ADDHN)
+DO_BINOPNB(sve2_addhnb_s, uint32_t, uint16_t, 16, DO_ADDHN)
+DO_BINOPNB(sve2_addhnb_d, uint64_t, uint32_t, 32, DO_ADDHN)
+
+DO_BINOPNT(sve2_addhnt_h, uint16_t, uint8_t, 8, H1_2, H1, DO_ADDHN)
+DO_BINOPNT(sve2_addhnt_s, uint32_t, uint16_t, 16, H1_4, H1_2, DO_ADDHN)
+DO_BINOPNT(sve2_addhnt_d, uint64_t, uint32_t, 32,     , H1_4, DO_ADDHN)
+
+#undef DO_ADDHN
+
+#undef DO_BINOPNB
+
 /* Fully general four-operand expander, controlled by a predicate.
  */
 #define DO_ZPZZZ(NAME, TYPE, H, OP)                           \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6e92abbd8f..86f8a24b5b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7462,6 +7462,19 @@ static bool trans_UQRSHRNT(DisasContext *s, arg_rri_esz *a)
     return do_sve2_shr_narrow(s, a, ops);
 }
 
+#define DO_SVE2_ZZZ_NARROW(NAME, name)                                    \
+static bool trans_##NAME(DisasContext *s, arg_rrr_esz *a)                 \
+{                                                                         \
+    static gen_helper_gvec_3 * const fns[4] = {                           \
+        NULL,                       gen_helper_sve2_##name##_h,           \
+        gen_helper_sve2_##name##_s, gen_helper_sve2_##name##_d,           \
+    };                                                                    \
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);                            \
+}
+
+DO_SVE2_ZZZ_NARROW(ADDHNB, addhnb)
+DO_SVE2_ZZZ_NARROW(ADDHNT, addhnt)
+
 static bool do_sve2_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
                                gen_helper_gvec_flags_4 *fn)
 {
-- 
2.25.1

