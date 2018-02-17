Received: by 10.28.71.27 with SMTP id u27csp2080358wma;
        Sat, 17 Feb 2018 10:37:56 -0800 (PST)
X-Google-Smtp-Source: AH8x226yFV8fq1oJdYzFlF5RoGnxd6LfejqiveUA9jougZmL3mLI6lvGeDSvsRo0uhhao4nEPsSo
X-Received: by 10.37.55.69 with SMTP id e66mr7261178yba.110.1518892676549;
        Sat, 17 Feb 2018 10:37:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892676; cv=none;
        d=google.com; s=arc-20160816;
        b=cDwCmhda7wqP2zJ0i4yKPL9AKUOqj3PFTLf/MZj0zpuC0epcAmBYyjj0ZQqP6g0AbG
         o0aYK9I5r8VCgYhKyaKbYAFmzQ6RKsfIPOyU3JrufmI9RI7pYj+9mQvpb7OpfZIkh5cp
         JEj5J/IU+mYXymskhxa2bo8GLcVhu9GeZZ+Whg119Ts1XSZOq9B5oARG03071VcSeij4
         SxJ5jrNjllQWHm0LtUXElSA1FFyLkwCUWAjG0g5XwgCxj5HVtKKok48Gipi8fO5aI+gB
         6neQoHXZ14KQijSUVuHbu0dvRz/kCLqUtAC4l4xW8hyV7ySLMXWQ1a5MqiRDjBpcRjV2
         SH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=z2zyjf9WQFOCWG11hDLk8qhZRQx78/ZLD2//zJu/aqw=;
        b=LcGf9LhOVw3qDFIOwEPnqkfcIdklZIW+ytdGpiUlr+sKMDtPTLHQOBEQJkvTedJpzo
         pv7NahLXugJEBLaUQykegAVqmc5PCAAcRLdiVfV0Kc9AM0KHaPCCO+1wyDUjIQZhmeTJ
         rKGKcokSeeL5TW5vqP5G9MQXoKXGWQmzIuDNMTfwTR0z4Yt5Zyub4c8+Wx/TO80w3OHJ
         9NeClE9bvWnYnbcTCZgTtrLqp1+0gkE4tAkmd06hOfqVb6qqtIFh8yGiNZAfnygLq1cH
         hCt22Uzz4v7l5LqsE9sLbTFevrMfg+XDYBwcxyrf3RX5YjnRdMnKWq4VHvAOMxdvIaA1
         rNMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MDZ/nNY3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l18si3610950ywm.397.2018.02.17.10.37.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:37:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MDZ/nNY3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7Mx-0003S4-Uw
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:37:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79K-0000OG-HI
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:23:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79J-0001bs-18
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:23:50 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:45873)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79I-0001bL-PS
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:23:48 -0500
Received: by mail-pf0-x242.google.com with SMTP id w83so592216pfi.12
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z2zyjf9WQFOCWG11hDLk8qhZRQx78/ZLD2//zJu/aqw=;
	b=MDZ/nNY3d7UY3Rqv3OzI6wHTPQrdSS2AHfFpYOCxaZ7aC5dBBT59v74eFDUv9UlyL2
	agfuO9mokB0vjNCgitmWN1+w9z8Xo4sMLdzGrxg7fjyTp8KKOdvAL6YgsWVeavJgcTHX
	H2pTEOk7lJ3hnWehZPCUTtpu/oGkfAl+XlRQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z2zyjf9WQFOCWG11hDLk8qhZRQx78/ZLD2//zJu/aqw=;
	b=kB9aNAn53lUGD6RIfmSrCIc68JJyrwB4lYOzDUlF7kcNIfpftcfQpvGc3OopWj46aO
	9pprlBT9MEkIC0baOz8sByXQAH+XTjlZ+ceFxQlM4d5jsYjiwJa/ucWNn/9zTbeAtcnS
	Q0sK455LyvQpEB6My190WtzHbzmjbnniCrrcNabgH1QnWNTa0sxgMRDgYG9Bh/DL27Ru
	YdxZHDmjXuEJZzgoXfEJC+cgyUMdfyoWVjkFtgJ0cSakIePZ8KR9vXvNXJvvSsz2KLOj
	J7ZE5pF2fyBDTiJQg8t68YTneIM6bJ+AiUm4hIe34cGMETbO2/p966fIHHYvYjhZlFOg
	vptA==
X-Gm-Message-State: APf1xPAB5sB/AoD6u1P2vS5UUxmQSxpmr8NYd0WgqAGcGKcIxofJhNxf
	BQmP7X+0jqoW8hW2OTSrKJ+fkcdGS20=
X-Received: by 10.167.130.193 with SMTP id f1mr9609038pfn.241.1518891827522;
	Sat, 17 Feb 2018 10:23:47 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:29 -0800
Message-Id: <20180217182323.25885-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-devel] [PATCH v2 13/67] target/arm: Implement SVE bitwise
 shift by wide elements (predicated)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pDQ/UXuHWOvb

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 21 +++++++++++++++++++++
 target/arm/sve_helper.c    | 35 +++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 25 +++++++++++++++++++++++++
 target/arm/sve.decode      |  6 ++++++
 4 files changed, 87 insertions(+)

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
index 6ea806d12b..3054b3cc99 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -464,6 +464,41 @@ DO_ZPZZ_D(sve_lsl_zpzz_d, uint64_t, DO_LSL)
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
index 08c56e55a0..35bcd9229d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -473,6 +473,31 @@ static void trans_ASRD(DisasContext *s, arg_rpri_esz *a, uint32_t insn)
     }
 }
 
+/*
+ *** SVE Bitwise Shift - Predicated Group
+ */
+
+#define DO_ZPZW(NAME, name) \
+static void trans_##NAME##_zpzw(DisasContext *s, arg_rprr_esz *a,         \
+                                uint32_t insn)                            \
+{                                                                         \
+    static gen_helper_gvec_4 * const fns[3] = {                           \
+        gen_helper_sve_##name##_zpzw_b, gen_helper_sve_##name##_zpzw_h,   \
+        gen_helper_sve_##name##_zpzw_s,                                   \
+    };                                                                    \
+    if (a->esz >= 0 && a->esz < 3) {                                      \
+        do_zpzz_ool(s, a, fns[a->esz]);                                   \
+    } else {                                                              \
+        unallocated_encoding(s);                                          \
+    }                                                                     \
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
index 7ddff8e6bb..177f338fed 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -159,6 +159,12 @@ ASR_zpzz	00000100 .. 010 100 100 ... ..... .....   @rdm_pg_rn # ASRR
 LSR_zpzz	00000100 .. 010 101 100 ... ..... .....   @rdm_pg_rn # LSRR
 LSL_zpzz	00000100 .. 010 111 100 ... ..... .....   @rdm_pg_rn # LSLR
 
+# SVE bitwise shift by wide elements (predicated)
+# Note these require size != 3.
+ASR_zpzw	00000100 .. 011 000 100 ... ..... .....		@rdn_pg_rm
+LSR_zpzw	00000100 .. 011 001 100 ... ..... .....		@rdn_pg_rm
+LSL_zpzw	00000100 .. 011 011 100 ... ..... .....		@rdn_pg_rm
+
 ### SVE Logical - Unpredicated Group
 
 # SVE bitwise logical operations (unpredicated)
-- 
2.14.3

