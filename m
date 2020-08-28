Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1690339lfc;
        Fri, 28 Aug 2020 11:37:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8dlfvtjZvX0WcPD4hT9wXWqMDv3FEIm3ngictUpVq/U7+BOZbHBIJqqWXzbrTuTtz4eli
X-Received: by 2002:a25:6f85:: with SMTP id k127mr4267379ybc.12.1598639874249;
        Fri, 28 Aug 2020 11:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598639874; cv=none;
        d=google.com; s=arc-20160816;
        b=YFAvamm5HQKxf3mNQ57X1OZgGURdpwr+NT8syMeILYX0onBZi6gv9dbjk7q+3KHGcu
         9zmyQ6AnOoAXMs3OeCaLb/9VAl6fAjCF/9uuxnhMQPS+KQy5bJ24iCVaEia3RHq/h0rA
         u9/ap3J3mw4wBujH32oD16A0FwwmA4+Rl5eCFQ2UlZre7kJlImeVJB1IpYMvGLJZluN1
         g+wZcWsXPgQp5o42fdxFamNda+KqmF9ISiTS7hp5Iw1bsTevv7CKv10fHFhq/JnTA16n
         v55LByN5KdUDu+b+iFySq9In8B2c7x7nkGGMrXJDoWHfylHqhrqktZdfkGaY9gwKUBzo
         pMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DVP2Mp73QOLPJah3nvK3hrNS6x+FIiMTtRkRR6OwSkc=;
        b=onl+j5ZbiWmhcma5vRs+UOfVYN/VOhx0aU9PH9zmZge1uyQRFc3WMQrw3EmdoAd/P5
         k4fjZUpbcFPPL+lEFNYPR2WuZ5OQ7DNXkTwt716eu0KUqqvT70R8zSmKuK1b6IEkD+LO
         +KwnvX3fKMmnfpPuSJeJ84w36erOg6fZ8fL9cn37080YqoCv8Wge/UwPiOvMETuxj9Cz
         +qBOn353jxJtY6qSjgGETX4SvHnNhn+Hpy2A4gQxO9irBwao7g5ru1qbMFMjNzdreOcc
         9VzRDSnIEkefwh9pAPwEO6UAxRYp1FxTkIvT7yuQY4rTpxuWeVGW++AgVzbmcq8kP2VQ
         Dn+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xpwmA76D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si68929ybm.276.2020.08.28.11.37.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:37:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xpwmA76D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjG5-0007v4-K1
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:37:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCh-0002RF-3A
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:23 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCa-0005y8-W4
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:22 -0400
Received: by mail-wr1-x42c.google.com with SMTP id w13so59521wrk.5
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DVP2Mp73QOLPJah3nvK3hrNS6x+FIiMTtRkRR6OwSkc=;
 b=xpwmA76DG9nNRd8h2DW9PXEIJzQnocVVd0JXPJLuAgA7elvPCogwZysrmA1Is3mfYZ
 eVHDrjohVUPR+BmrD6sfyPa1ctY6ZeUMEJYxCH652RGPIKsxOg7oDNdkv/XxDlBRz5a9
 3M4rJkkgVsl4WTnW/zmFmdW+pReNCas8M1n7cke2EnqaocPmbjAPE8vx+vlMAwG7fRmj
 HGvYDAo/17/vCEbIGkGkTyfkWju9DAEp/5IVISyRjfxtaT12td9q+AWQuJEKeKigZg+P
 XyqwB1L/8bCbLf7oFv+KtDRscEkGQoPLZN/GFuyqj2FWXiUyqPFAwEjBWtzFQg1yHHUt
 FZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DVP2Mp73QOLPJah3nvK3hrNS6x+FIiMTtRkRR6OwSkc=;
 b=mIA1l93zaP2lkKmhi6ds2tLa6mtV8nLD/pdH7fkA81+VeD8snVZG4tABHblfHtlcJH
 ChJ1qClMCnS7WH1XUAHvjta5c/rbYJfmWmiTVzn0nVHy/imtEHzkhnQmz/DbOPfY8XQz
 8Vsf7gq8VlhCtDY0kQ+SED5uFCfj1WrAuzbIsh3nFreRvG4xbhB51RBiZ6hAuO5pRsvV
 SfEg4nL563tHhGJAbOAdDj8v6jBxJ2O1VwA0N9ivSu6VlUw13SyCJESKB7A9lp43HhSI
 wzPcc307bfDQYuf2gi5BogmrEcjc31lD8YNpGJjluGzSyEHiL4VMfsrzCPBSUxdzF1c1
 9YzQ==
X-Gm-Message-State: AOAM533X7qD1joggB77+4BnZyUXaH7p5KPOu+P72mhjsNNIDgeXeAELj
 MtXSZ7bFesh/aiukHXkJkaTw6pmKuE1nngEj
X-Received: by 2002:a5d:5651:: with SMTP id j17mr283414wrw.149.1598639655125; 
 Fri, 28 Aug 2020 11:34:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 15/45] target/arm: Implement VFP fp16 VCVT between float
 and fixed-point
Date: Fri, 28 Aug 2020 19:33:24 +0100
Message-Id: <20200828183354.27913-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BAA6qtLrcuMy

Implement the fp16 versions of the VFP VCVT instruction forms which
convert between floating point and fixed-point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vfp.decode          |  2 ++
 target/arm/translate-vfp.c.inc | 59 ++++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 642ec039e3c..a8f1137be1e 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -225,6 +225,8 @@ VJCVT        ---- 1110 1.11 1001 .... 1011 11.0 ....        @vfp_dm_sd
 # We assemble bits 18 (op), 16 (u) and 7 (sx) into a single opc field
 # for the convenience of the trans_VCVT_fix functions.
 %vcvt_fix_op 18:1 16:1 7:1
+VCVT_fix_hp  ---- 1110 1.11 1.1. .... 1001 .1.0 .... \
+             vd=%vd_sp imm=%vm_sp opc=%vcvt_fix_op
 VCVT_fix_sp  ---- 1110 1.11 1.1. .... 1010 .1.0 .... \
              vd=%vd_sp imm=%vm_sp opc=%vcvt_fix_op
 VCVT_fix_dp  ---- 1110 1.11 1.1. .... 1011 .1.0 .... \
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 0140822d183..fdf486b7c15 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -2972,6 +2972,65 @@ static bool trans_VJCVT(DisasContext *s, arg_VJCVT *a)
     return true;
 }
 
+static bool trans_VCVT_fix_hp(DisasContext *s, arg_VCVT_fix_sp *a)
+{
+    TCGv_i32 vd, shift;
+    TCGv_ptr fpst;
+    int frac_bits;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    frac_bits = (a->opc & 1) ? (32 - a->imm) : (16 - a->imm);
+
+    vd = tcg_temp_new_i32();
+    neon_load_reg32(vd, a->vd);
+
+    fpst = fpstatus_ptr(FPST_FPCR_F16);
+    shift = tcg_const_i32(frac_bits);
+
+    /* Switch on op:U:sx bits */
+    switch (a->opc) {
+    case 0:
+        gen_helper_vfp_shtoh(vd, vd, shift, fpst);
+        break;
+    case 1:
+        gen_helper_vfp_sltoh(vd, vd, shift, fpst);
+        break;
+    case 2:
+        gen_helper_vfp_uhtoh(vd, vd, shift, fpst);
+        break;
+    case 3:
+        gen_helper_vfp_ultoh(vd, vd, shift, fpst);
+        break;
+    case 4:
+        gen_helper_vfp_toshh_round_to_zero(vd, vd, shift, fpst);
+        break;
+    case 5:
+        gen_helper_vfp_toslh_round_to_zero(vd, vd, shift, fpst);
+        break;
+    case 6:
+        gen_helper_vfp_touhh_round_to_zero(vd, vd, shift, fpst);
+        break;
+    case 7:
+        gen_helper_vfp_toulh_round_to_zero(vd, vd, shift, fpst);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    neon_store_reg32(vd, a->vd);
+    tcg_temp_free_i32(vd);
+    tcg_temp_free_i32(shift);
+    tcg_temp_free_ptr(fpst);
+    return true;
+}
+
 static bool trans_VCVT_fix_sp(DisasContext *s, arg_VCVT_fix_sp *a)
 {
     TCGv_i32 vd, shift;
-- 
2.20.1

