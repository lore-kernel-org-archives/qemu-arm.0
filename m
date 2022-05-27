Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1219581lfh;
        Fri, 27 May 2022 11:49:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5vernuAbpgadM5f9Zv3NsEkSuMIB7nFZN/VPiCTXTBTGZIx8S3TkfFDaEofPTTXVERHRI
X-Received: by 2002:ac8:580f:0:b0:2fb:f608:b211 with SMTP id g15-20020ac8580f000000b002fbf608b211mr9184306qtg.565.1653677370319;
        Fri, 27 May 2022 11:49:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653677370; cv=none;
        d=google.com; s=arc-20160816;
        b=GDTWqM4R4g72FSwsvJTB3R2XLgHKRp/edx+cPHKO5EXTaNpzwqRZEvwg/awwGf9LUv
         UsJiqoX8n7SSbCiYPcXBoVICEzCG+Ea8l/NIiLFfiHN1mJdn+MsJWLcRTtqrUM7sa3yU
         ao81eGjPiNlgEIBlm+Umtjezg9OBRKTJ7m3Bj+mYXwdxUdmVf5/avHnF4umAcEtTCOju
         rmwrH+S7PyfKpL8hGHcsi49umWl1GW7iOqcR5SBgn6ijtdNovp3z2l88h8cro8/Qww7M
         GxaXpJrjXygtd5drRUCvl+TBbIIkDD9EmtwuG/tQ9H/CiTeG/lOjkOTMsfGCAxpU4qF0
         XIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pJbfIGqTZ66+1Ti9OasPCKgtko0rJwGBfZR9RfDjbag=;
        b=eFdBReG4AMowY8iPRiecHj84g4ka0B1WKcaKnQwoyyQPE6sirxmfgaXNSFDlDhIR5k
         v/NOzWTETmhcAmnPrYC+pyuciLn2M5Ju94JKn6XKf24fKgKbsp+WqFyRdYkRVWSZS7XI
         u/EjQLdALvBOm3aajF0TgOHcZUrukyX/e0OVz9bbo6K5lJz1vbQ/ieECbW1va22L08Jp
         n6ersiLnrXLV8FgzCXcMmUsCOFaTpwCLgsUwmmdZ+4a0Ik7ncwyltC+7h8hDrvguxI9V
         7lDwLmOSI2P6xZbV1g0LMbIyXJtJPslbn3AQW3c9QfWjORMV9VLw7bclMxq9+y4NzH5S
         WTtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+6A8GIS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9-20020ac84e49000000b002f3c52360efsi3656019qtw.80.2022.05.27.11.49.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:49:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+6A8GIS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuf1d-0006Nb-Qo
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYX-0006g6-JQ
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:25 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:55253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYV-0003Zt-E2
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:25 -0400
Received: by mail-pj1-x102e.google.com with SMTP id cv10so5257345pjb.4
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pJbfIGqTZ66+1Ti9OasPCKgtko0rJwGBfZR9RfDjbag=;
 b=i+6A8GISP8T6zAfvaOqJidbbXxF2SDVNllMdCw/8f2X0RmZfn795WU9psdDMcfkm+S
 zCTd7IUBS+zzd0j9bT3x5AN6xnx1nPkJnaJmFfkDYKvOhOyoCcrG9zijgVW6/Tsm2dn9
 dH2q77Rdv609xOaPNylaXAmHrv1cFlXLTRFBp3uUwdiYDMWaf+gDFGdxW6w2+rSXf8lD
 86c3xbQppcr9imTRNuLWnHzU4HEJb8NybS+1f854Tc4S1A7d4PFLq2dkASEHq6w9aPya
 KIjvqetIlJEXiqD1aVcMiIcziy3LE4He8hvzpv9kuCMG8RPPbdKye28fPQUjEOiJ90eM
 fe5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pJbfIGqTZ66+1Ti9OasPCKgtko0rJwGBfZR9RfDjbag=;
 b=7aF0GSnkPDWEQKLgeLPsTL4MK4I5hZdFaKAFN4wN7s3IERGjKoSuiOWs8seUOqScas
 YYnIoBUgj6EGSAcViDH6fuDtyvgUAbzf6y5RrgWDxuZ0tSp6HTpzpqJibz2KnN1oTgAn
 tUTbsyRCaaRbg+5R6vsGtDySJKwiE8ZQq4zGgQZbOlPhYIdpu3jyOIe6xldN9zFuFD74
 4e++6pm65p9JjuQRx+xSAGYkRKiKMhprNcVVs1vB9Idk2cN4jngZ6m+STSSA/1FTP542
 c6Ez3YXh50Ud2vcKwua0U6631u/hhTYaPNZLyfYZ23NE4khsSciDgqmcSF4JTKXlDp4B
 e2GQ==
X-Gm-Message-State: AOAM5324lpvt/ldGiIUpyOsFADepNJyjjSAYDPx0BbW68bMpcaO5HnAu
 XVLbZrj9/AvaQueFndbjpXPVptxO1V3+NA==
X-Received: by 2002:a17:90b:350d:b0:1e0:436a:d553 with SMTP id
 ls13-20020a17090b350d00b001e0436ad553mr9556742pjb.147.1653675562128; 
 Fri, 27 May 2022 11:19:22 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 014/114] target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzxz
Date: Fri, 27 May 2022 11:17:27 -0700
Message-Id: <20220527181907.189259-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U7nFznudkyez

Convert SVE translation functions directly using
gen_gvec_ool_arg_zzxz to TRANS_FEAT.  Also include
BFDOT_zzxz, which was using gen_gvec_ool_zzzz.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 48 +++++++++++---------------------------
 1 file changed, 14 insertions(+), 34 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b42df76c69..b097b44d9f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3826,32 +3826,19 @@ TRANS_FEAT(DOT_zzzz, aa64_sve, gen_gvec_ool_zzzz,
  * SVE Multiply - Indexed
  */
 
-#define DO_RRXR(NAME, FUNC) \
-    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
-    { return gen_gvec_ool_arg_zzxz(s, FUNC, a); }
+TRANS_FEAT(SDOT_zzxw_s, aa64_sve, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_sdot_idx_b, a)
+TRANS_FEAT(SDOT_zzxw_d, aa64_sve, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_sdot_idx_h, a)
+TRANS_FEAT(UDOT_zzxw_s, aa64_sve, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_udot_idx_b, a)
+TRANS_FEAT(UDOT_zzxw_d, aa64_sve, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_udot_idx_h, a)
 
-DO_RRXR(trans_SDOT_zzxw_s, gen_helper_gvec_sdot_idx_b)
-DO_RRXR(trans_SDOT_zzxw_d, gen_helper_gvec_sdot_idx_h)
-DO_RRXR(trans_UDOT_zzxw_s, gen_helper_gvec_udot_idx_b)
-DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
-
-static bool trans_SUDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_i8mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzxz(s, gen_helper_gvec_sudot_idx_b, a);
-}
-
-static bool trans_USDOT_zzxw_s(DisasContext *s, arg_rrxr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_i8mm, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zzxz(s, gen_helper_gvec_usdot_idx_b, a);
-}
-
-#undef DO_RRXR
+TRANS_FEAT(SUDOT_zzxw_s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_sudot_idx_b, a)
+TRANS_FEAT(USDOT_zzxw_s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_usdot_idx_b, a)
 
 static bool do_sve2_zzz_data(DisasContext *s, int rd, int rn, int rm, int data,
                              gen_helper_gvec_3 *fn)
@@ -8311,15 +8298,8 @@ TRANS_FEAT(UMMLA, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
 
 TRANS_FEAT(BFDOT_zzzz, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
            gen_helper_gvec_bfdot, a, 0)
-
-static bool trans_BFDOT_zzxz(DisasContext *s, arg_rrxr_esz *a)
-{
-    if (!dc_isar_feature(aa64_sve_bf16, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot_idx,
-                             a->rd, a->rn, a->rm, a->ra, a->index);
-}
+TRANS_FEAT(BFDOT_zzxz, aa64_sve_bf16, gen_gvec_ool_arg_zzxz,
+           gen_helper_gvec_bfdot_idx, a)
 
 TRANS_FEAT(BFMMLA, aa64_sve_bf16, gen_gvec_ool_arg_zzzz,
            gen_helper_gvec_bfmmla, a, 0)
-- 
2.34.1

