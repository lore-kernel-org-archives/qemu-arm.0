Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp740827lfr;
        Fri, 16 Apr 2021 14:29:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgkvzBNAUE5l8VkrcRuVNVTrv10L6+EsMSnwy0D44zE3k0iZxSlbL23Eslrdl+6llAvqEm
X-Received: by 2002:a5b:912:: with SMTP id a18mr1552135ybq.247.1618608541876;
        Fri, 16 Apr 2021 14:29:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618608541; cv=none;
        d=google.com; s=arc-20160816;
        b=vUoSoly0p1Q9+Tg/TOlu0gDIrBcvlvOVQ4QVrO5F+LGriAKCggDLe3dCDArSsC2jez
         oyC0qTKR3DzRQu1tUJXBNIoWfaJqOl3RsP1/G8YApyVlVIo+nyyzk7BXHuJN92zPSyKZ
         D9zCN4dJya05nXPI41GqcvA9AK7zBdOJrn7m7n5ulW/MkjU88GshI/2dkQtBqHBPulxj
         r8yUqGna1h1HuQrPW6cb83FwNQ7ye9cYdLkUFH/y97iAkNpQnhAxV8mkVkKzcBL5NxI3
         77wsm9Yi8JY9rECMKYOUBR/DaxWNxmkHiQ+LQPUwtP2oTmWJZDhFYQl1R8uoAmRmm0IT
         FOrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jc6bISAZEf9j9mwCzGsWa+M8kmkHcY8KolYL9qX1dMs=;
        b=oA47Si2q2eLup8MM8ojQ+AnrMo4HfEOcAqm+J7t2pBsMgIKaOuBcOx7ZfuAJA4kJKP
         ZAlj3//LpUzXIamh6HQdUdgMZcwlTJNd2L1mIFqATVop2HmkZ6s4qTpF0OV3oSLd92u3
         M+h7ErKhnfUxxghohaUXlSNCu9s9S+Qd8Wga3cRfjJHu9x+xGy3yS3GMd+lOQMBH9u/U
         xEvwAkJ5HDwUY4D52keU+owg2RE8cnOCYHDZrQvaoQ3vIi+NszRaG7fb38p6txM2lz+w
         oX2ntxDbi6udR5b22p4GrY52u2zkPYHHctdeC0TagYMh7FdTnL09KveI9GjnT7fbY3tO
         pvVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YNVkii9d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si6243144ybn.248.2021.04.16.14.29.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:29:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YNVkii9d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXW1N-0004oo-73
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcr-00051U-0H
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:41 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcX-0001Ly-52
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:03:40 -0400
Received: by mail-pl1-x633.google.com with SMTP id u15so6083669plf.10
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jc6bISAZEf9j9mwCzGsWa+M8kmkHcY8KolYL9qX1dMs=;
 b=YNVkii9d1xslxbLWPnwNd9vnPDI/EiCRV0bUGtO/DfdVTsxGvv/9/9pS9U+KfWEQiN
 hUPUcBwIR8waNXM6nfIpm7ayUrxl5lXZYxYTo0t64ukSS3CANcUcNrB7C+xqADMEdXZJ
 X31SsqRgnW1Nt40LW7dWA2/59N3ePhmsEMCftIrx4o+KnxoNVppI632Jtov/PKAZbAxx
 b+sa3Wm3XmxAHfaEalD6STN+EtgDfYti2IMJ0qw52004ngkBtJsqxyFqR8pUaj/I0IHD
 jm3CZySUwD5489wqwx6qKoTdIVE3lgBmEhxcgLW3reBeZPvWryXHjWcfPxdfsz5giu7u
 O3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jc6bISAZEf9j9mwCzGsWa+M8kmkHcY8KolYL9qX1dMs=;
 b=PzZKKOUXi09l0Zx/V0vyBizd/DAsMixgnRyuBFtab4qVHtsKAf2N3dWBYLPWF9ze6M
 ricr0/WXoZRRN1nrFbJWhBVbGatFLYsa9OxrO1pArcbIA50hfSPCDc5e93GWiyZkUvPT
 xgbdHhLOhVoHsaaFmAe+DYL0Ee/JbBp82xyaOQqBreY2/8guSOD7dwf/lTYnuWoANEF7
 nBCvITXvks3592KagVzgsI1nfdiHSE4yqTHOtb9LQ5aBTtw6Eue2to3OKn7fIHRsyn0O
 ulXEb3ScJHKCsaTzYL0GX/SRSTIVk7puXB2rT4YsXQL/lDsMvLlnQg1mhoyi9Z6Gcuwq
 1xmQ==
X-Gm-Message-State: AOAM5310zFW0SmEd1P020xgtf0B8ROcbUNUpz60Zds1YTjVat0Isy3NU
 IJHqG0gTSi7YKkbgt0iGlMCKVpmYnq3ZmQ==
X-Received: by 2002:a17:90a:950c:: with SMTP id
 t12mr11384929pjo.135.1618606999866; 
 Fri, 16 Apr 2021 14:03:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 38/81] target/arm: Implement SVE2 ADDHNB, ADDHNT
Date: Fri, 16 Apr 2021 14:01:57 -0700
Message-Id: <20210416210240.1591291-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vu36Az7GSBDi

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

