Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp204072wme;
        Wed, 16 May 2018 15:35:05 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZokW+YSKGvJu7hde71vzLOZyi2MlVp6TFPWtaWAmgdzZHS41DADPm6XzKja0AQQTK2G7vpr
X-Received: by 2002:aed:3bae:: with SMTP id r43-v6mr3041218qte.362.1526510105264;
        Wed, 16 May 2018 15:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526510105; cv=none;
        d=google.com; s=arc-20160816;
        b=MQYVmmP2N4PD7eouv7zOfLZOfq4x72exRwlYegOGo8YGppoxLJAKhzHU2GBpU+Kent
         kbCz+SiBx+CE3WFUj5TuPHACb9EUkHZViLiBklbJYcT8QVAnZCqPtflb6gVvURZrAyqY
         XumDE1YElCeqME0FAQ2k9p32hBFg5RaJRADJ96+puEbH3fSmLM/Ko2deUyRYCs6sAuzI
         9w7JUZHIeBNW50RHA9NWRTDQEGyBBmW4nPUiA5IZ/kqIMunFilhFrEmvETsJtOzo2qt9
         LmjpeW43i/eftxEjEzFbbHuS0Pq36AyGHKOZc+OJouZ+I0JU/OpJmgh0hXJR+XpLZKO2
         5rRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=jn7iQEcALvVjdLYSB5FiKkJpuIIKitvxbTtwkOopkaE=;
        b=vIQC3iidAUXgpx9M+lPk9kIEgFDGYlYgrOs1uAxBbO05+7hPNcnshElMMC+HvvGMnB
         sqkD1wD1yPtOKOjuDVLNo4sHOtVDggIRUPdxy5/xOXcOe2fS5IcFW/her+pv2R/oYUam
         xiEWTDnWxSpUBOj05PPEEQ7ytGkg1L0r2/PGpRvCdOdn0DoNn7spJ9XrwQs/CmCGYXNw
         Z2DWX4PObfeUHfZvUKwAkf7/8WFssDaFiwV3el4pJqH4FjEPgz6HPH/xV93JhOd/w0Hj
         sFSmFeX/ue1zyycomnubsgKE3bJv1fqDZwOGoKhCzj7hNIMXShSP0j9ubLkPBhAlyt8W
         4kOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X7R1dc1J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p10-v6si1904122qvn.220.2018.05.16.15.35.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:35:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X7R1dc1J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ50i-0002Za-O7
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:35:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wI-0007gP-9N
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wG-0007TY-JJ
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:30 -0400
Received: from mail-pg0-x232.google.com ([2607:f8b0:400e:c05::232]:37354)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4wG-0007T8-5i
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:28 -0400
Received: by mail-pg0-x232.google.com with SMTP id a13-v6so897545pgu.4
	for <qemu-arm@nongnu.org>; Wed, 16 May 2018 15:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jn7iQEcALvVjdLYSB5FiKkJpuIIKitvxbTtwkOopkaE=;
	b=X7R1dc1JIY3Vvh6awzmE88YMEnBUWWDWR/5Ptbo2PQKxHvsbKwfbnEW/Zky55VVAjr
	E8/mDG1iRyvjYggS4sbQaY5WKtL1tXV+AqMrsM27TQzuyNAFazjHUl2VZxjThqkOOrJt
	TH4uBqYusWTfY7FkZENryiSEW/bOjM0AaSjWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jn7iQEcALvVjdLYSB5FiKkJpuIIKitvxbTtwkOopkaE=;
	b=hc12pMBuRi+VyWcHsbPhWsMPyLld+cwFs+deshJxsYGSc/VTxwKQwAuJDlIvogKls2
	hlPRGYmdkvImM8vgmDL05rDnB49yatVDUl4CLz2RaCEu6CcIoyj+a3/a1x6I0C3gAfUI
	ToQTDZihrmFHNSrUq2SHJg2f/8sTd/saqgOFRxDKT0XYqBSJY7lUEZo8h8kmefXbRLO+
	EBXcilcT9UWx3lmsIIziXB87P5156Y97RVKpfIwYepgH14B2ScwQy+/JkJbewDC0vKZO
	7bYOH/wcwZ1WsvjnCThDF/KedPjlJmwPzmBCGpxQcS/smEBLy4/dZzVCq/APO9oQkZH5
	edFw==
X-Gm-Message-State: ALKqPweobyKriiimZdLCX+10bMpIdl98tsPQEY/5h7XpabTaalsjhLoe
	Goa/+RtE6GNAtvj8n4z4x/3KTA==
X-Received: by 2002:a62:78c:: with SMTP id 12-v6mr2751850pfh.178.1526509826989;
	Wed, 16 May 2018 15:30:26 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:29:52 -0700
Message-Id: <20180516223007.10256-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::232
Subject: [Qemu-arm] [PATCH v3-a 12/27] target/arm: Implement SVE bitwise
 shift by wide elements (predicated)
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +5NXVJmLXxlG

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 21 +++++++++++++++++++++
 target/arm/sve_helper.c    | 35 +++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 24 ++++++++++++++++++++++++
 target/arm/sve.decode      |  6 ++++++
 4 files changed, 86 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 0cc02ee59e..d516580134 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -195,6 +195,27 @@ DEF_HELPER_FLAGS_5(sve_lsl_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_lsl_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_asr_zpzw_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_asr_zpzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_asr_zpzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_lsr_zpzw_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsr_zpzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsr_zpzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_lsl_zpzw_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsl_zpzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_lsl_zpzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(sve_orv_b, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_orv_h, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_orv_s, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index ece3a81ad3..a5d12603e5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -465,6 +465,41 @@ DO_ZPZZ_D(sve_lsl_zpzz_d, uint64_t, DO_LSL)
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
+/* Three-operand expander, controlled by a predicate, in which the
+ * third operand is "wide".  That is, for D = N op M, the same 64-bit
+ * value of M is used with all of the narrower values of N.
+ */
+#define DO_ZPZW(NAME, TYPE, TYPEW, H, OP)                               \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    for (i = 0; i < opr_sz; ) {                                         \
+        uint8_t pg = *(uint8_t *)(vg + H1(i >> 3));                     \
+        TYPEW mm = *(TYPEW *)(vm + i);                                  \
+        do {                                                            \
+            if (pg & 1) {                                               \
+                TYPE nn = *(TYPE *)(vn + H(i));                         \
+                *(TYPE *)(vd + H(i)) = OP(nn, mm);                      \
+            }                                                           \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);                     \
+        } while (i & 7);                                                \
+    }                                                                   \
+}
+
+DO_ZPZW(sve_asr_zpzw_b, int8_t, uint64_t, H1, DO_ASR)
+DO_ZPZW(sve_lsr_zpzw_b, uint8_t, uint64_t, H1, DO_LSR)
+DO_ZPZW(sve_lsl_zpzw_b, uint8_t, uint64_t, H1, DO_LSL)
+
+DO_ZPZW(sve_asr_zpzw_h, int16_t, uint64_t, H1_2, DO_ASR)
+DO_ZPZW(sve_lsr_zpzw_h, uint16_t, uint64_t, H1_2, DO_LSR)
+DO_ZPZW(sve_lsl_zpzw_h, uint16_t, uint64_t, H1_2, DO_LSL)
+
+DO_ZPZW(sve_asr_zpzw_s, int32_t, uint64_t, H1_4, DO_ASR)
+DO_ZPZW(sve_lsr_zpzw_s, uint32_t, uint64_t, H1_4, DO_LSR)
+DO_ZPZW(sve_lsl_zpzw_s, uint32_t, uint64_t, H1_4, DO_LSL)
+
+#undef DO_ZPZW
+
 /* Two-operand reduction expander, controlled by a predicate.
  * The difference between TYPERED and TYPERET has to do with
  * sign-extension.  E.g. for SMAX, TYPERED must be signed,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index f0400e35d9..438df6359e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -497,6 +497,30 @@ static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a, uint32_t insn)
     }
 }
 
+/*
+ *** SVE Bitwise Shift - Predicated Group
+ */
+
+#define DO_ZPZW(NAME, name) \
+static bool trans_##NAME##_zpzw(DisasContext *s, arg_rprr_esz *a,         \
+                                uint32_t insn)                            \
+{                                                                         \
+    static gen_helper_gvec_4 * const fns[3] = {                           \
+        gen_helper_sve_##name##_zpzw_b, gen_helper_sve_##name##_zpzw_h,   \
+        gen_helper_sve_##name##_zpzw_s,                                   \
+    };                                                                    \
+    if (a->esz < 0 || a->esz >= 3) {                                      \
+        return false;                                                     \
+    }                                                                     \
+    return do_zpzz_ool(s, a, fns[a->esz]);                                \
+}
+
+DO_ZPZW(ASR, asr)
+DO_ZPZW(LSR, lsr)
+DO_ZPZW(LSL, lsl)
+
+#undef DO_ZPZW
+
 /*
  *** SVE Predicate Logical Operations Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 8267963b6b..1de289e55d 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -157,6 +157,12 @@ ASR_zpzz        00000100 .. 010 100 100 ... ..... .....   @rdm_pg_rn # ASRR
 LSR_zpzz        00000100 .. 010 101 100 ... ..... .....   @rdm_pg_rn # LSRR
 LSL_zpzz        00000100 .. 010 111 100 ... ..... .....   @rdm_pg_rn # LSLR
 
+# SVE bitwise shift by wide elements (predicated)
+# Note these require size != 3.
+ASR_zpzw        00000100 .. 011 000 100 ... ..... .....         @rdn_pg_rm
+LSR_zpzw        00000100 .. 011 001 100 ... ..... .....         @rdn_pg_rm
+LSL_zpzw        00000100 .. 011 011 100 ... ..... .....         @rdn_pg_rm
+
 ### SVE Logical - Unpredicated Group
 
 # SVE bitwise logical operations (unpredicated)
-- 
2.17.0

