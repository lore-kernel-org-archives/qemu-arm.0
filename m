Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2501916lfi;
        Thu, 26 Mar 2020 16:09:02 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvbi0o2380OR+UTja379HBXjnprZPm2RylIXKWiSi0TYdNTVqzQ1an4h5iEKLMAPna1BrqC
X-Received: by 2002:aed:3244:: with SMTP id y62mr11439444qtd.242.1585264142118;
        Thu, 26 Mar 2020 16:09:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585264142; cv=none;
        d=google.com; s=arc-20160816;
        b=TIvj5546upjX8m7DcQUTK5pbeaMbObgItx0rr/O7ys4mh8IUiev6W2YDlMIHeFFaoD
         z9grD+ESstFozzxFuKY26RtC1WZwRibGa0Z8LHuoHDbjFbC2Ag6oG2AI2kk1rKSGJ5Fj
         18Uw3W3pcNSvcY0xjTEOI0BVMgPrcAc9pLpL9gQ5n1B0QCKD5tF8CoKOseRmJ3KyW/2q
         n/vzVD+iw7SsQ19D8h/yXj8h6sy9wCGZvjjWBgnw0ZpF7pFYQ6n7CjlaGeYRrYZrjbOJ
         4xzydXeOwqIvGdjPKG0VgljZb+ZMEIw3yBOM9qDiBNPe+A8feR6l7jSQfwuCGvCsYvt5
         LheQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1a/74RtZJl65FwDaRqFWJWhWsV/XH0AS+LKjeLcIuFE=;
        b=vbaP+Z8RNcfwdiOcRFXjSdZ48Z8aeT6E43VS8J9QcU1B7nppW1jQJKpXLUV+z9aoQs
         b+uoh6E/ZVRcK14PcnJ1Cek8kmc5r1YrTPD3UXbmWxj6lp2zLxla2IElIaJDA0WysnZC
         hj4DB/i57od7ojZXjDks9x20XVO2NCuYYKjJsi1YLzNxImIrSRz6GUgctNLvE2XLt87d
         rnf0G6Xdl24uxopSLGfbGS5BHNCHq3O41FQJR56NjluCZ5vfRaLNwEz6HxsLWjh1MFd4
         bXG3NTawnacR4lIk+5X4TlI9Ewa5xegAOuXIGaScMLYgMf1CFs4diKPhO1xzpqunhcgC
         b7sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qz0ewG13;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18si2439717qkc.346.2020.03.26.16.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 16:09:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Qz0ewG13;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHbcT-00025m-DE
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 19:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57923)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcI-0001yi-CM
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHbcF-0001IG-O2
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:50 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41253)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHbcF-0001Ht-Hw
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 19:08:47 -0400
Received: by mail-pf1-x441.google.com with SMTP id z65so3544537pfz.8
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 16:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1a/74RtZJl65FwDaRqFWJWhWsV/XH0AS+LKjeLcIuFE=;
 b=Qz0ewG13NTs2zcsq5z35cW116x7yv5X9PevHtCa0PiThUIaXkg053Wb+w3nOSnUdDE
 2Ryev4Aqz41K268MlINa9PBxEJHsNKX/yI9RuEfAWnhryv20RvXh6y2Y1vUb2Vx4qOHS
 pzRJuHJnRN8ov2cqV/IHW0et7KAwaqPZ2d3xENNcHdI/1S8r8RzzcfG3xeMgmcF3yyvc
 H9OtAO+BC/P48eQHCejTOG4mK/gBXcgMLWtVX7+6d8jzpvRhoz1KE4DGnpI5zwx1htBW
 h0kA7W5FfmizD6LIFASo3usTpKDwCdZwgq2Y+8fUyg/+HZGPY+8YBuW/ysgQEIYo8gNO
 h1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1a/74RtZJl65FwDaRqFWJWhWsV/XH0AS+LKjeLcIuFE=;
 b=BOCK+GbqpY682q68MkVN6IH7vC+KAHolTLJddaUUemph0BMfYwWNTiLmJ4Lbid8nnE
 3FEuw7HUvOe5FDh5AHY9hdzOFFuAoI1IhY8zzAMPZkl7H8NkaPcfHqovExDeJWnP2tKU
 mFbNK0FrvJHl3lD5taJP5pHAhRm7eRCI3gS+P9bkoinKLyOzrqOEPQfGZO0ydK41KtzW
 zuaSn7qzSS5kxmvtqT3ETgeMVETxfLl+M1LzAx8ZJzDPjVDCNACDlB+s5er8abnpMwp3
 9wWygq+MqPdZ9vXZlYQBX9d90ISDRvGF2d6amqXbUWoV2EcD56eBwaqQvVZAx5S7bxDk
 xIng==
X-Gm-Message-State: ANhLgQ3xXhT12VVNf+q0minz5AGf3VH9lsxwZ/ezMDMT1iP/TxotaUSF
 z7InVFUgYv3VvdpuEgHOeZupiA==
X-Received: by 2002:a62:1dcd:: with SMTP id
 d196mr11633461pfd.296.1585264126502; 
 Thu, 26 Mar 2020 16:08:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-138-234.tukw.qwest.net.
 [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i187sm2530037pfg.33.2020.03.26.16.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 16:08:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/31] target/arm: Implement SVE2 integer unary operations
 (predicated)
Date: Thu, 26 Mar 2020 16:08:12 -0700
Message-Id: <20200326230838.31112-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326230838.31112-1-richard.henderson@linaro.org>
References: <20200326230838.31112-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
X-TUID: 5RRyx149g0uo

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 13 +++++++++++
 target/arm/sve.decode      |  7 ++++++
 target/arm/sve_helper.c    | 25 ++++++++++++++++----
 target/arm/translate-sve.c | 47 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 854cd97fdf..d3b7c3bd12 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -507,6 +507,19 @@ DEF_HELPER_FLAGS_4(sve_rbit_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_rbit_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqabs_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqabs_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqabs_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqabs_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqneg_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqneg_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqneg_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqneg_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_urecpe_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_ursqrte_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_splice, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(sve_cmpeq_ppzz_b, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 6691145854..95a9c65451 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1107,3 +1107,10 @@ PMUL_zzz        00000100 00 1 ..... 0110 01 ..... .....  @rd_rn_rm_e0
 
 SADALP_zpzz     01000100 .. 000 100 101 ... ..... .....  @rdm_pg_rn
 UADALP_zpzz     01000100 .. 000 101 101 ... ..... .....  @rdm_pg_rn
+
+### SVE2 integer unary operations (predicated)
+
+URECPE          01000100 .. 000 000 101 ... ..... .....  @rd_pg_rn
+URSQRTE         01000100 .. 000 001 101 ... ..... .....  @rd_pg_rn
+SQABS           01000100 .. 001 000 101 ... ..... .....  @rd_pg_rn
+SQNEG           01000100 .. 001 001 101 ... ..... .....  @rd_pg_rn
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7dc17421e9..16606331fc 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -535,8 +535,8 @@ static inline uint64_t do_sadalp_d(uint64_t n, uint64_t m)
     return m + n1 + n2;
 }
 
-DO_ZPZZ(sve2_sadalp_zpzz_h, int16_t, H1_2, do_sadalp_h)
-DO_ZPZZ(sve2_sadalp_zpzz_s, int32_t, H1_4, do_sadalp_s)
+DO_ZPZZ(sve2_sadalp_zpzz_h, uint16_t, H1_2, do_sadalp_h)
+DO_ZPZZ(sve2_sadalp_zpzz_s, uint32_t, H1_4, do_sadalp_s)
 DO_ZPZZ_D(sve2_sadalp_zpzz_d, uint64_t, do_sadalp_d)
 
 static inline uint16_t do_uadalp_h(uint16_t n, uint16_t m)
@@ -557,8 +557,8 @@ static inline uint64_t do_uadalp_d(uint64_t n, uint64_t m)
     return m + n1 + n2;
 }
 
-DO_ZPZZ(sve2_uadalp_zpzz_h, int16_t, H1_2, do_uadalp_h)
-DO_ZPZZ(sve2_uadalp_zpzz_s, int32_t, H1_4, do_uadalp_s)
+DO_ZPZZ(sve2_uadalp_zpzz_h, uint16_t, H1_2, do_uadalp_h)
+DO_ZPZZ(sve2_uadalp_zpzz_s, uint32_t, H1_4, do_uadalp_s)
 DO_ZPZZ_D(sve2_uadalp_zpzz_d, uint64_t, do_uadalp_d)
 
 #undef DO_ZPZZ
@@ -728,6 +728,23 @@ DO_ZPZ(sve_rbit_h, uint16_t, H1_2, revbit16)
 DO_ZPZ(sve_rbit_s, uint32_t, H1_4, revbit32)
 DO_ZPZ_D(sve_rbit_d, uint64_t, revbit64)
 
+#define DO_SQABS(N)  (N == -N ? N - 1 : N < 0 ? -N : N)
+
+DO_ZPZ(sve2_sqabs_b, int8_t, H1, DO_SQABS)
+DO_ZPZ(sve2_sqabs_h, int16_t, H1_2, DO_SQABS)
+DO_ZPZ(sve2_sqabs_s, int32_t, H1_4, DO_SQABS)
+DO_ZPZ_D(sve2_sqabs_d, int64_t, DO_SQABS)
+
+#define DO_SQNEG(N)  (N == -N ? N - 1 : -N)
+
+DO_ZPZ(sve2_sqneg_b, uint8_t, H1, DO_SQNEG)
+DO_ZPZ(sve2_sqneg_h, uint16_t, H1_2, DO_SQNEG)
+DO_ZPZ(sve2_sqneg_s, uint32_t, H1_4, DO_SQNEG)
+DO_ZPZ_D(sve2_sqneg_d, uint64_t, DO_SQNEG)
+
+DO_ZPZ(sve2_urecpe_s, uint32_t, H1_4, helper_recpe_u32)
+DO_ZPZ(sve2_ursqrte_s, uint32_t, H1_4, helper_rsqrte_u32)
+
 /* Three-operand expander, unpredicated, in which the third operand is "wide".
  */
 #define DO_ZZW(NAME, TYPE, TYPEW, H, OP)                       \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bc8321f7cd..938ec08673 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5919,3 +5919,50 @@ static bool trans_UADALP_zpzz(DisasContext *s, arg_rprr_esz *a)
     }
     return do_sve2_zpzz_ool(s, a, fns[a->esz - 1]);
 }
+
+/*
+ * SVE2 integer unary operations (predicated)
+ */
+
+static bool do_sve2_zpz_ool(DisasContext *s, arg_rpr_esz *a,
+                            gen_helper_gvec_3 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ool(s, a, fn);
+}
+
+static bool trans_URECPE(DisasContext *s, arg_rpr_esz *a)
+{
+    if (a->esz != 2) {
+        return false;
+    }
+    return do_sve2_zpz_ool(s, a, gen_helper_sve2_urecpe_s);
+}
+
+static bool trans_URSQRTE(DisasContext *s, arg_rpr_esz *a)
+{
+    if (a->esz != 2) {
+        return false;
+    }
+    return do_sve2_zpz_ool(s, a, gen_helper_sve2_ursqrte_s);
+}
+
+static bool trans_SQABS(DisasContext *s, arg_rpr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqabs_b, gen_helper_sve2_sqabs_h,
+        gen_helper_sve2_sqabs_s, gen_helper_sve2_sqabs_d,
+    };
+    return do_sve2_zpz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SQNEG(DisasContext *s, arg_rpr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqneg_b, gen_helper_sve2_sqneg_h,
+        gen_helper_sve2_sqneg_s, gen_helper_sve2_sqneg_d,
+    };
+    return do_sve2_zpz_ool(s, a, fns[a->esz]);
+}
-- 
2.20.1

