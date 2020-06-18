Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1291855lfm;
        Wed, 17 Jun 2020 22:21:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlSxO6rnKvZudyeYO91G4yLpZZNRS5ApfIlEOi+dW6QvzFrlP3CCwpcDUUQW8WbXbCcsq1
X-Received: by 2002:a25:afcd:: with SMTP id d13mr3768428ybj.413.1592457690861;
        Wed, 17 Jun 2020 22:21:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592457690; cv=none;
        d=google.com; s=arc-20160816;
        b=Mnn/VyxIR6h1Q0fd46QQvwZzHddJkEDmGTOGJ6rxhJbmt+MCJlbpBcFVwo5dVSJFn9
         SgJn8j5wh3e6SeuJ2KnTT5eAgRX6Py1JXW7xdZwN8OVJPsQTky8UrOmVLATJ4oqaxd7z
         lbhlAnrkk6poczzT4REFO1ugE47/c3YHu/lW1YXFoeRlYR/YNYqdWu7uZLkjyxotN9B8
         CSZvNQOct3LyT1OWPbvbSArv8FBGdbdu06RscTQPa12uBM9YHnS9TWcuRJI4diGI0oMD
         MkOrEtc0FvllLJOtXwIs9mLferN9HOvmOYel1+2QWoQISmGLGSlaPxlNr4YU+XKM0ChA
         Vc9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Efm85+zVd1gYFDJl2olxHq63yBCcpM1uls9PwlaZR6I=;
        b=FQIwQfD3rUyPJ3SNRqtzvTKvxUGhKH+YO8h1etgDdGf3564o/SiHJ8lDoydbRUz0IO
         UMm6dHT8tjCHWDWXC3GmyMu03WQ6AX0K8zNf2m4/5Y/qs6gu7m/qDPZ06Dcudl6eLpMP
         /OdpbLr5r/SlqXESHbUJbAAVO2D7Yi5fWpjn8qol4qLTCiObz8lc+VC6NayiJ8igl5P6
         5e5rlp6m2EL1zBDJwZrg2MAE+tjHMRUr6UnAalTKgRA9b/6n55ZXnQqAD74EyBPwSnL6
         M8guZgqB2/vZ+oAXbqxL6XR+MYjtw48TKB9d9bJnkTyaoj/E6fTGiY8Q1YjprMXQLV8G
         nuEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wCNOEghX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f76si1792636ybg.468.2020.06.17.22.21.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:21:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wCNOEghX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmzS-0006Ys-8F
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEy-00077z-Lf
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:33:28 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEw-0003fE-QJ
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:33:28 -0400
Received: by mail-pg1-x533.google.com with SMTP id e18so2338020pgn.7
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Efm85+zVd1gYFDJl2olxHq63yBCcpM1uls9PwlaZR6I=;
 b=wCNOEghXOFx9BfJbkWbGCXDU9qK69oUaC8HAKTTXi9XhMHioeMjfOhGI3vCfdL9eg0
 0sq0+hcRGIvBWQThmw7F6gqFmOyQdEGeCbuSNWpq+HaNI3wrYzozc5iToU1vau7tpazm
 I7m/Mhl6reg8yyDSV4TQ31Tz6BrFrdXYXh+EVII2rMWODqi6ymVXJ90pMFj5XDOoRKoE
 g7bl2Bnvypug90okoxlm9xKNbu+VI0jjEVVPdkoscOCRmbNH5fZ32DsG3n1MkdzjG5VR
 i5KrmOLmx7ks8vlWmfavyMrwbuPb2OunZCZINpC5kr2Iu5xOnfUTMV5oX0x9j86zH9B1
 /2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Efm85+zVd1gYFDJl2olxHq63yBCcpM1uls9PwlaZR6I=;
 b=T3gcWACGdydQBHMHIxyCfS73154Y8fpQsk+ZSv2kIRdSFBgNIevIijOwRPZq5HDG0d
 DKXkGE03HUN5+iwFxOPyvXQ61t4G1ZfBCrJHe0FC4PLOZs7GPv54H6RANgv0cSyOmdhx
 BP6ZcTL0MsdtmfbTjxR7iu4wm9ajBXm2UnLQbi9XHJFT0pUEkyoZH97/ytws5bxStyAx
 tEpqiA4ast2N0Z2Pfo6YzPNcTofhEKgUbkgNECspp2E5r3x0vr3gSrKsC4V2tumjLK3h
 syQ5HCFNFRDuWKa1aOl03ukdutj0uuGBxoXqCYK9CCT9Iat0+NQAO/+F4u/KjCkAkJBv
 7TxQ==
X-Gm-Message-State: AOAM530j9kjLUOba7IxgnQEsoFy4ntYnp18bb31G1visGtXmF/pNELPf
 Gjkc3OoU3JVgrIn/vdc7D7sfZWRQv/g=
X-Received: by 2002:aa7:8813:: with SMTP id c19mr2065933pfo.220.1592454805501; 
 Wed, 17 Jun 2020 21:33:25 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id q22sm1288212pfg.192.2020.06.17.21.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:33:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 092/100] target/arm: Implement SVE2 FCVTXNT, FCVTX
Date: Wed, 17 Jun 2020 21:26:36 -0700
Message-Id: <20200618042644.1685561-93-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /KyklhAIEQ2W

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428174332.17162-4-steplong@quicinc.com>
[rth: Use do_frint_mode, which avoids a specific runtime helper.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  2 ++
 target/arm/translate-sve.c | 49 ++++++++++++++++++++++++++++++--------
 2 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index abe26f2424..6c0e39d553 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1575,6 +1575,8 @@ SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
 RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
 
 ### SVE2 floating-point convert precision odd elements
+FCVTXNT_ds      01100100 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
+FCVTX_ds        01100101 00 0010 10 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
 FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7b20c65778..0232381500 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4773,11 +4773,9 @@ static bool trans_FRINTX(DisasContext *s, arg_rpr_esz *a)
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16, fns[a->esz - 1]);
 }
 
-static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
+static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
+                          int mode, gen_helper_gvec_3_ptr *fn)
 {
-    if (a->esz == 0) {
-        return false;
-    }
     if (sve_access_check(s)) {
         unsigned vsz = vec_full_reg_size(s);
         TCGv_i32 tmode = tcg_const_i32(mode);
@@ -4788,7 +4786,7 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
         tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
                            vec_full_reg_offset(s, a->rn),
                            pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, 0, frint_fns[a->esz - 1]);
+                           status, vsz, vsz, 0, fn);
 
         gen_helper_set_rmode(tmode, tmode, status);
         tcg_temp_free_i32(tmode);
@@ -4799,27 +4797,42 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
 
 static bool trans_FRINTN(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_nearest_even);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_nearest_even, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_up);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_up, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_down);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_down, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_to_zero);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_to_zero, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
 {
-    return do_frint_mode(s, a, float_round_ties_away);
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz - 1]);
 }
 
 static bool trans_FRECPX(DisasContext *s, arg_rpr_esz *a)
@@ -7812,3 +7825,19 @@ static bool trans_FCVTLT_sd(DisasContext *s, arg_rpr_esz *a)
     }
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_sd);
 }
+
+static bool trans_FCVTX_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_to_odd, gen_helper_sve_fcvt_ds);
+}
+
+static bool trans_FCVTXNT_ds(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_frint_mode(s, a, float_round_to_odd, gen_helper_sve2_fcvtnt_ds);
+}
-- 
2.25.1

