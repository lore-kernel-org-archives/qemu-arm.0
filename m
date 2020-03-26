Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2508948lfi;
        Thu, 26 Mar 2020 16:16:28 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt75oKkoLltUCLqhacecy2eilJ8CfILoQCjCR3xVU1Z3B4cUDkk3TxnTKhZtkAIGBJ1PvRU
X-Received: by 2002:ad4:49b2:: with SMTP id u18mr11260755qvx.102.1585264587952;
        Thu, 26 Mar 2020 16:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585264587; cv=none;
        d=google.com; s=arc-20160816;
        b=PsdMvwf8eAMMJC6mfER/JelhI7ha50UcMd6FFRS/h+jA80/yDzQ03eXwj8DbX6k8O9
         Ad4j8mIksWCkuY4AaYlpEMoW3ZuPKYut3uPSHSKrta/NreYwVaeB1q0ZDGN5CssE2MLz
         Hgbb0mwDBbp6cH7hcJL7VlfHzhXTgv/N/UhAnKHtjYCTT8GFI2IEBVRfRTlm5wgB/xfb
         /Ya4eWy2I0FY1vIXZ57kwcdglBw4j1e7ZDVOElvxcOw/bUiMx+Q2D5cQP/ZQ8VFShBxO
         sjKvvJ6U1/DD9mpPXKHFSZA0R+6qusE77+Ykjbchtc0ralhFXToEUegfol4rq+n/8iva
         U7mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0Qn92PslIMK9Z7a8YCtRKYyKEHx9UY3I2q6Qw3BgsLw=;
        b=A+RKzcxgMqr6wBXBOI8+CGNRDuoMTZnytv3OvA5lTHD2FLgvz0Bvist/eBwECat46a
         7eGkioKinS8F6I/cG/1SY9ot7Cw9ybpccWE1vkJw5lS57q8CNkUmx9rVU7Kw+e3td5IS
         In0MlVJ8zrLZmMR2PP9bZ0TEn+607tCpGdUy82iMLu/y8DNF6XEfLcWctkRt02NWP/I7
         584zPSZ+ilbmuQkH1sqRPA+sY26mmRWLtgubwfFkk54fVTbTfawduU5nk0QOXlIz2LrW
         eLg6xkMXuhzDtZCd0aLOIFK4fU7qzcP3DluPDiULKWTwWHOHSbADlJIR6AQfZ6qmVTRk
         BO9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hLbAw9Gk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x78si2504117qkb.145.2020.03.26.16.16.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:16:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hLbAw9Gk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHbjf-0005pC-Ao
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58124)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcM-00029S-Or
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcK-0001MR-Tp
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:54 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:40871)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbcK-0001LL-NF
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:52 -0400
Received: by mail-pg1-x541.google.com with SMTP id t24so3649687pgj.7
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 16:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Qn92PslIMK9Z7a8YCtRKYyKEHx9UY3I2q6Qw3BgsLw=;
 b=hLbAw9GkJTfLGztqk+Vwl/Cib3bAvHo/CfCnwH3dvGqK06hKyTu8n8klONtfC0kVgt
 HADSW5TxCM8XxDK9MKlTT28IUjujqPPBb+qiu6KqZudjr73B+EWR0PlTB5mqy4dLxz8U
 uFh1rrc3PE9e+pR/wdpfTcO31ZZXmyNso299OF1xfmp8cFjDx9t8T2L5OVMJQYYR609O
 gOdetXG7E3pQjJ9CLoonydRkL+8XqfiRmzhh8AK4o/0GpJ29FsV+yLl9NgzywHuAYkV9
 OWX7kbjWMYk6WadWh0mMsrVPArO9TnBqJBkUduKxuZsTjCGdlj8SwrJTzwv/98yHmJ9v
 uCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Qn92PslIMK9Z7a8YCtRKYyKEHx9UY3I2q6Qw3BgsLw=;
 b=pHxqCJDcnFIrCzqczj6QEI7Bt1AczPR49zWLV7RB9OreYtwdIfqFjQeXA91Ob/Msl9
 q2VE18l7KhXlx7Gy1nHxJIvapWQiUCKaXLwZmb+Fe48z6N8oBmmbUTzxi9lgqFt/GPOm
 9wKsIOgIVzJfcC37gVevBmo0toDOoStUKFkEMe76zfoZL7AhqfdtnUhF9vctverLEvqE
 R837E2CGLlGLVYBaIdiCd+AbFCdVs+PCYmWtGn+FDPkzLjWYfYNtI1ouuxdfTrjoiMax
 ZTpKlRZr577MlL/MTO03idKubW2HdJqV+sAg6HtWIf6BoZhnOTEW6bsHRO/CnEhgNdRs
 7wHA==
X-Gm-Message-State: ANhLgQ0l4DYTY//7u7qH3Lxw8Dr9iDor5f6IY+9Od/ZDYkqK7d6qTlMb
 H8uuB6KG4JzvP87533rgQN7j1Q==
X-Received: by 2002:a63:a91a:: with SMTP id u26mr3677060pge.236.1585264131657; 
 Thu, 26 Mar 2020 16:08:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:08:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/31] target/arm: Implement SVE2 integer pairwise arithmetic
Date: Thu, 26 Mar 2020 16:08:16 -0700
Message-Id: <20200326230838.31112-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: rajav@quicinc.com, qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d6vWA6XZ966e

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 45 +++++++++++++++++++++++++
 target/arm/sve.decode      |  8 +++++
 target/arm/sve_helper.c    | 67 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c |  6 ++++
 4 files changed, 126 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 149fff1fae..028c3b85a8 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -326,6 +326,51 @@ DEF_HELPER_FLAGS_5(sve_sel_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_sel_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_addp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_smaxp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_umaxp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sminp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_uminp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_asr_zpzw_h, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 54076bb607..86a6bf7088 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1142,3 +1142,11 @@ SRHADD          01000100 .. 010 100 100 ... ..... .....  @rdn_pg_rm
 URHADD          01000100 .. 010 101 100 ... ..... .....  @rdn_pg_rm
 SHSUB           01000100 .. 010 110 100 ... ..... .....  @rdm_pg_rn # SHSUBR
 UHSUB           01000100 .. 010 111 100 ... ..... .....  @rdm_pg_rn # UHSUBR
+
+### SVE2 integer pairwise arithmetic
+
+ADDP            01000100 .. 010 001 101 ... ..... .....  @rdn_pg_rm
+SMAXP           01000100 .. 010 100 101 ... ..... .....  @rdn_pg_rm
+UMAXP           01000100 .. 010 101 101 ... ..... .....  @rdn_pg_rm
+SMINP           01000100 .. 010 110 101 ... ..... .....  @rdn_pg_rm
+UMINP           01000100 .. 010 111 101 ... ..... .....  @rdn_pg_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 5d75aed7b7..d7c181ddb8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -681,6 +681,73 @@ DO_ZPZZ_D(sve2_uhsub_zpzz_d, uint64_t, DO_HSUB_D)
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
+/*
+ * Three operand expander, operating on element pairs.
+ * If the slot I is even, the elements from from VN {I, I+1}.
+ * If the slot I is odd, the elements from from VM {I-1, I}.
+ */
+#define DO_ZPZZ_PAIR(NAME, TYPE, H, OP)                                 \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    for (i = 0; i < opr_sz; ) {                                         \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
+        do {                                                            \
+            if (pg & 1) {                                               \
+                void *p = (i & 1 ? vm : vn);                            \
+                TYPE nn = *(TYPE *)(p + H(i & ~1));                     \
+                TYPE mm = *(TYPE *)(p + H(i | 1));                      \
+                *(TYPE *)(vd + H(i)) = OP(nn, mm);                      \
+            }                                                           \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);                     \
+        } while (i & 15);                                               \
+    }                                                                   \
+}
+
+/* Similarly, specialized for 64-bit operands.  */
+#define DO_ZPZZ_PAIR_D(NAME, TYPE, OP)                                  \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;                  \
+    TYPE *d = vd, *n = vn, *m = vm;                             \
+    uint8_t *pg = vg;                                           \
+    for (i = 0; i < opr_sz; i += 1) {                           \
+        if (pg[H1(i)] & 1) {                                    \
+            TYPE *p = (i & 1 ? m : n) + (i & ~1);               \
+            TYPE nn = p[0], mm = p[1];                          \
+            d[i] = OP(nn, mm);                                  \
+        }                                                       \
+    }                                                           \
+}
+
+DO_ZPZZ_PAIR(sve2_addp_zpzz_b, uint8_t, H1_2, DO_ADD)
+DO_ZPZZ_PAIR(sve2_addp_zpzz_h, uint16_t, H1_2, DO_ADD)
+DO_ZPZZ_PAIR(sve2_addp_zpzz_s, uint32_t, H1_4, DO_ADD)
+DO_ZPZZ_PAIR_D(sve2_addp_zpzz_d, uint64_t, DO_ADD)
+
+DO_ZPZZ_PAIR(sve2_umaxp_zpzz_b, uint8_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_umaxp_zpzz_h, uint16_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_umaxp_zpzz_s, uint32_t, H1_4, DO_MAX)
+DO_ZPZZ_PAIR_D(sve2_umaxp_zpzz_d, uint64_t, DO_MAX)
+
+DO_ZPZZ_PAIR(sve2_uminp_zpzz_b, uint8_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_uminp_zpzz_h, uint16_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_uminp_zpzz_s, uint32_t, H1_4, DO_MIN)
+DO_ZPZZ_PAIR_D(sve2_uminp_zpzz_d, uint64_t, DO_MIN)
+
+DO_ZPZZ_PAIR(sve2_smaxp_zpzz_b, int8_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_smaxp_zpzz_h, int16_t, H1_2, DO_MAX)
+DO_ZPZZ_PAIR(sve2_smaxp_zpzz_s, int32_t, H1_4, DO_MAX)
+DO_ZPZZ_PAIR_D(sve2_smaxp_zpzz_d, int64_t, DO_MAX)
+
+DO_ZPZZ_PAIR(sve2_sminp_zpzz_b, int8_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_sminp_zpzz_h, int16_t, H1_2, DO_MIN)
+DO_ZPZZ_PAIR(sve2_sminp_zpzz_s, int32_t, H1_4, DO_MIN)
+DO_ZPZZ_PAIR_D(sve2_sminp_zpzz_d, int64_t, DO_MIN)
+
+#undef DO_ZPZZ_PAIR
+#undef DO_ZPZZ_PAIR_D
+
 /* Three-operand expander, controlled by a predicate, in which the
  * third operand is "wide".  That is, for D = N op M, the same 64-bit
  * value of M is used with all of the narrower values of N.
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7d619d7ad4..5f137c0e92 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5992,3 +5992,9 @@ DO_SVE2_ZPZZ(SHSUB, shsub)
 DO_SVE2_ZPZZ(UHADD, uhadd)
 DO_SVE2_ZPZZ(URHADD, urhadd)
 DO_SVE2_ZPZZ(UHSUB, uhsub)
+
+DO_SVE2_ZPZZ(ADDP, addp)
+DO_SVE2_ZPZZ(SMAXP, smaxp)
+DO_SVE2_ZPZZ(UMAXP, umaxp)
+DO_SVE2_ZPZZ(SMINP, sminp)
+DO_SVE2_ZPZZ(UMINP, uminp)
-- 
2.20.1

