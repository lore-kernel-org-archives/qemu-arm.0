Received: by 10.28.71.27 with SMTP id u27csp2107296wma;
        Sat, 17 Feb 2018 11:17:10 -0800 (PST)
X-Google-Smtp-Source: AH8x224+j91tHiS0px20gKUXO4wNhFR87efu6UTCfBVmMcqHVtSXPpuLBL9kge+w0ZQuzFh7qSpH
X-Received: by 10.13.192.129 with SMTP id b123mr7431620ywd.415.1518895030747;
        Sat, 17 Feb 2018 11:17:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518895030; cv=none;
        d=google.com; s=arc-20160816;
        b=xh3vtf05BCCWFGhXa8p5HdenFSuD+ntR32724S2n6W7fKW04nKhqAas95Z1w+8ltHa
         t19P8sYZCwgib3tWQRnnzwaDPO/8X/AbsAumYhsHuV6UuD8tnXHuS7WCgzn71iwadBL/
         bwxnWnnbnoYOZnaT2KsH56adkO7pimZ3WUL6hNQTKIbg7xCtjt17tPxZkl0T6r3h+Ctf
         gIZUNs3KiUuTP8cOm/hWLaKRBRbLp4a0zylRPGCGPhZgeuxbuJCPuvRAmZclVn53mjsE
         GChJ5P4Sa3iGodaIWPtV8qxobLyC8CspqJH0Kn+vcYoSoz5gLK8q/bBcqTxqBE0kTljl
         85Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Uw3Coayj2BZrW4P8dkcsk/ENJVJ6Su3WMdNeRaiLH4w=;
        b=KNoGXHquL7k2sq6oq7YmBI8tJJIxYqsNbbNTte1MAoP/t5XCRaN4dQWnopvKR+30tp
         c+DxPvXukRGGG87+rzRb4BS0dq30E8X2nARTBoNfTkN7yF6zcGlU3+FTd+W7xVhO/OXd
         sOJkivpmXtv2eai5p/q3uh85F+BqqCnw6VoifStnBKhdVp/P9pe60VwOFnZaqDkZ8G+Q
         pMwqqmFhQS7KvP7q8fA1oVYR04TpQQkzuxnz3aqvuo6ZVPWMCaTN0OiVbg8DQ+96y7FT
         307UTYBLdAppSEIdDOHTbAHZ8SysTw7Ee+l2AaxaNdwtXJI3Xfe1qRLsyWmjVwBUTJ9r
         00AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aAw6kcee;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y8si3507720ybg.158.2018.02.17.11.17.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:17:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aAw6kcee;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48615 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7yw-000458-3c
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:17:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41118)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7Ag-00024K-Ph
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:25:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7Af-0002N5-2m
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:25:14 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:43389)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7Ae-0002MA-D9
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:25:12 -0500
Received: by mail-pf0-x242.google.com with SMTP id c63so592735pfa.10
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Uw3Coayj2BZrW4P8dkcsk/ENJVJ6Su3WMdNeRaiLH4w=;
	b=aAw6kceenL51GdB5XgS8nMwyre4AoWxIRVivFI0Ab7mJWqoJTE1ShcX6pAXyMx9iO2
	Zd8bearhCeaCnT585r9GoAQyknaf/PNKRv4s/N53Mmr/xxfgCVVSavQ5XS+PuBMbVVpN
	CNDRSWXljqo+ZQaWm1/pDGx80Yjzg8ws8Fp3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Uw3Coayj2BZrW4P8dkcsk/ENJVJ6Su3WMdNeRaiLH4w=;
	b=QMb6uCS1/l+w2Mp2wRaPSVN0pMgvKgH/4zy/RgkJo9ak2X02m78r0VogVUGEi1OtOe
	85qPzWirpya+Y7iiuT5TqP2ygSEE56bQS397H1mHRvM+HSLRMQzUiobPR6DfIwe5QnZG
	eem55VaW31zdy9087TjwR1zhmG8zmGGTPYLtDo82DYJyWe8V5YSeOqz9HcBX4Um3KD00
	5S8I/FM0UbDCkKya60LrupdswpbevgHRQVVQTeIwA8vWlhk07su6vkVNehNzuCzTHzqB
	1osy2NW9Z6lu4SN3zQldFyHzaAmbmMS18EU0nwbkazxUk7xSXHIBRlTQokZKoE6GFD8l
	H+RQ==
X-Gm-Message-State: APf1xPAa7sLGVs7xejVOSs3GS5+eQKpkEql0a/9iwwsqmYnrCZN3FDI3
	Fd/zIzhUGbxOgEJwkQ8oHyQ+Pw==
X-Received: by 10.99.63.9 with SMTP id m9mr8512676pga.247.1518891911466;
	Sat, 17 Feb 2018 10:25:11 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.25.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:25:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:21 -0800
Message-Id: <20180217182323.25885-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [PATCH v2 65/67] target/arm: Implement SVE
 floating-point convert to integer
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F8jp0BdTCc7w

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 30 ++++++++++++++++++++
 target/arm/sve_helper.c    | 16 +++++++++++
 target/arm/translate-sve.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 16 +++++++++++
 4 files changed, 132 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index bac4bfdc60..0f5fea9045 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -955,6 +955,36 @@ DEF_HELPER_FLAGS_5(sve_fcvt_hd, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_fcvt_sd, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_fcvtzs_hh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzs_hs, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzs_ss, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzs_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzs_hd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzs_sd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzs_dd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_fcvtzu_hh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzu_hs, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzu_ss, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzu_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzu_hd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzu_sd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzu_dd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_scvt_hh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_scvt_sh, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 9db01ac2f2..09f5c77254 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3184,6 +3184,22 @@ DO_ZPZ_FP_D(sve_fcvt_hd, uint64_t, float16_to_float64_ieee)
 DO_ZPZ_FP_D(sve_fcvt_ds, uint64_t, float64_to_float32)
 DO_ZPZ_FP_D(sve_fcvt_sd, uint64_t, float32_to_float64)
 
+DO_ZPZ_FP(sve_fcvtzs_hh, uint16_t, H1_2, float16_to_int16_round_to_zero)
+DO_ZPZ_FP(sve_fcvtzs_hs, uint32_t, H1_4, float16_to_int32_round_to_zero)
+DO_ZPZ_FP(sve_fcvtzs_ss, uint32_t, H1_4, float32_to_int32_round_to_zero)
+DO_ZPZ_FP_D(sve_fcvtzs_hd, uint64_t, float16_to_int64_round_to_zero)
+DO_ZPZ_FP_D(sve_fcvtzs_sd, uint64_t, float32_to_int64_round_to_zero)
+DO_ZPZ_FP_D(sve_fcvtzs_ds, uint64_t, float64_to_int32_round_to_zero)
+DO_ZPZ_FP_D(sve_fcvtzs_dd, uint64_t, float64_to_int64_round_to_zero)
+
+DO_ZPZ_FP(sve_fcvtzu_hh, uint16_t, H1_2, float16_to_uint16_round_to_zero)
+DO_ZPZ_FP(sve_fcvtzu_hs, uint32_t, H1_4, float16_to_uint32_round_to_zero)
+DO_ZPZ_FP(sve_fcvtzu_ss, uint32_t, H1_4, float32_to_uint32_round_to_zero)
+DO_ZPZ_FP_D(sve_fcvtzu_hd, uint64_t, float16_to_uint64_round_to_zero)
+DO_ZPZ_FP_D(sve_fcvtzu_sd, uint64_t, float32_to_uint64_round_to_zero)
+DO_ZPZ_FP_D(sve_fcvtzu_ds, uint64_t, float64_to_uint32_round_to_zero)
+DO_ZPZ_FP_D(sve_fcvtzu_dd, uint64_t, float64_to_uint64_round_to_zero)
+
 DO_ZPZ_FP(sve_scvt_hh, uint16_t, H1_2, int16_to_float16)
 DO_ZPZ_FP(sve_scvt_sh, uint32_t, H1_4, int32_to_float16)
 DO_ZPZ_FP(sve_scvt_ss, uint32_t, H1_4, int32_to_float32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 361d545965..bc865dfd15 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3681,6 +3681,76 @@ static void trans_FCVT_sd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
     do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_sd);
 }
 
+static void trans_FCVTZS_hh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzs_hh);
+}
+
+static void trans_FCVTZU_hh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzu_hh);
+}
+
+static void trans_FCVTZS_hs(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzs_hs);
+}
+
+static void trans_FCVTZU_hs(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzu_hs);
+}
+
+static void trans_FCVTZS_hd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzs_hd);
+}
+
+static void trans_FCVTZU_hd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzu_hd);
+}
+
+static void trans_FCVTZS_ss(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_ss);
+}
+
+static void trans_FCVTZU_ss(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_ss);
+}
+
+static void trans_FCVTZS_sd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_sd);
+}
+
+static void trans_FCVTZU_sd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_sd);
+}
+
+static void trans_FCVTZS_ds(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_ds);
+}
+
+static void trans_FCVTZU_ds(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_ds);
+}
+
+static void trans_FCVTZS_dd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_dd);
+}
+
+static void trans_FCVTZU_dd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_dd);
+}
+
 static void trans_SCVTF_hh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
 {
     do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_hh);
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index d44cf17fc8..92dda3a241 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -832,6 +832,22 @@ FCVT_hd		01100101 11 0010 01 101 ... ..... .....		@rd_pg_rn_e0
 FCVT_ds		01100101 11 0010 10 101 ... ..... .....		@rd_pg_rn_e0
 FCVT_sd		01100101 11 0010 11 101 ... ..... .....		@rd_pg_rn_e0
 
+# SVE floating-point convert to integer
+FCVTZS_hh	01100101 01 011 01 0 101 ... ..... .....	@rd_pg_rn_e0
+FCVTZU_hh	01100101 01 011 01 1 101 ... ..... .....	@rd_pg_rn_e0
+FCVTZS_hs	01100101 01 011 10 0 101 ... ..... .....	@rd_pg_rn_e0
+FCVTZU_hs	01100101 01 011 10 1 101 ... ..... .....	@rd_pg_rn_e0
+FCVTZS_hd	01100101 01 011 11 0 101 ... ..... .....	@rd_pg_rn_e0
+FCVTZU_hd	01100101 01 011 11 1 101 ... ..... .....	@rd_pg_rn_e0
+FCVTZS_ss	01100101 10 011 10 0 101 ... ..... .....	@rd_pg_rn_e0
+FCVTZU_ss	01100101 10 011 10 1 101 ... ..... .....	@rd_pg_rn_e0
+FCVTZS_ds	01100101 11 011 00 0 101 ... ..... .....	@rd_pg_rn_e0
+FCVTZU_ds	01100101 11 011 00 1 101 ... ..... .....	@rd_pg_rn_e0
+FCVTZS_sd	01100101 11 011 10 0 101 ... ..... .....	@rd_pg_rn_e0
+FCVTZU_sd	01100101 11 011 10 1 101 ... ..... .....	@rd_pg_rn_e0
+FCVTZS_dd	01100101 11 011 11 0 101 ... ..... .....	@rd_pg_rn_e0
+FCVTZU_dd	01100101 11 011 11 1 101 ... ..... .....	@rd_pg_rn_e0
+
 # SVE integer convert to floating-point
 SCVTF_hh	01100101 01 010 01 0 101 ... ..... .....	@rd_pg_rn_e0
 SCVTF_sh	01100101 01 010 10 0 101 ... ..... .....	@rd_pg_rn_e0
-- 
2.14.3

