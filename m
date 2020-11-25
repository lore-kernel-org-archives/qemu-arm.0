Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp155463lfb;
        Tue, 24 Nov 2020 20:10:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDLgDLxCvEEgowknsZmcU6R2ykpQGOlP3lmNQGUIqvdcUpUacdvTGRvLdThQ+8LkXkXCQ/
X-Received: by 2002:a25:d10f:: with SMTP id i15mr1758476ybg.21.1606277455703;
        Tue, 24 Nov 2020 20:10:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606277455; cv=none;
        d=google.com; s=arc-20160816;
        b=jYkiyMoyVExLT2lo6TEuYe/CKNHRMJ1pKZRnAbuHVYMMmeCPWtff3oFCJvuuj/0ypB
         WEagWm/FIGH9VpEFNaWmWYjTi8Goz4g4u39+dUMVKk27FK0kdANq+s5hAXC/Cj5Ek9Ey
         Y4CtW1u/YtvkoFw0h65cAa9QqEYFnW5d51QcHDC/ZjEGoBmt/pvlP6s3u5NoG0rk3beL
         4yC8Nf+tqH/aJ2ccohLhZ/ZaQibc0NebrSBBFpWMewTOduaVyShmnVQS93bGbBq5hq30
         CnxnQNn23z0+edcUozTjdfa3lwcxgsTmf6fKQ9+x+Swkfzb8tZ87kMkKjuzKYWc8HH1/
         k5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hIrGetngsQpn6DynYHLevrPArG00BLTGCrdQJNoe/Gs=;
        b=G3NZgA8n8z/cwnEaBXPlF38h3BCXAB4K2UFO3GEtUIWfPvJEtVA2+pBKZ5j+xHJsBb
         wNz77OZQJsqqi1fwWebcLGD86v1kiXMm16MROgXuU1AeowGNiO7ICcSuw47f+wrE7uDJ
         79tHJovZbJdxNVCgr3NKqDBcD9aCR35x5jiPKhpwp5sxzQUnfW/fPBr1wRxk3ESrA6gt
         IzHJiaCACgAmV3lEbIvXapOM/jdSSxKF1lt4v9DCItp+8QlxDmAkVYCVMI47QnAWuSjA
         j4rCgVfmQKdmXg++JwVN2/ofQ0H+WaUVWwb/MkJAeyGOmcXsd77enUIw9CBlKTbiCuA8
         Dn1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m64eETgy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9si886485ybt.449.2020.11.24.20.10.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 20:10:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m64eETgy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khm8s-0002Wm-U3
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 23:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm55-00052O-B8
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:06:59 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm53-00065P-KX
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:06:58 -0500
Received: by mail-pl1-x643.google.com with SMTP id u2so441161pls.10
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2020 20:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hIrGetngsQpn6DynYHLevrPArG00BLTGCrdQJNoe/Gs=;
 b=m64eETgyNScp2D+qMQhBNQ4Igs4QupOgTKQo148uBsW3wEN25ZggV4sibRp7O8R5gh
 prjXaZo9ntMfDLLB0lV9ym8t2zIj0mCRAitnxh/PWZcAPvB8xSwlLiurYWaJrqwnHnVU
 ELHefi7a4pxXwI1JLHleZMlxFFIxQxxVDlHxPDU7oeve/Brx50+mEOet/sJtwdbsTLH9
 ykEIo0v3X5niGp1a5+Hy3xCoTlvYrwwBXYZ8pFlAgwdGdmU3DGtZle9otB0jw9nRPH76
 S8D77zT7jdIG+L9zQQnJYK48bR8wi8Wg4zUemm5A8CKcuhv5VAFTl3eHmggLB57sZKkb
 hMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hIrGetngsQpn6DynYHLevrPArG00BLTGCrdQJNoe/Gs=;
 b=lGRe8H8zzVbViN8sBR7SfrU/PwSKLbNR3Jq2u1ikp8SsZ8wbgYLbpZyCqEvDd6qzhu
 /hrfZfp7mzPt++ZKd8xkBAyLVxhdSbXbA+UzOJyYjWJxvW4kiFjD6kRiomiUJ4unwEtF
 ty+tkvvR35EUoieM8osukli4t4Kd6Kr0yOhTk9E26ywOm5GGTV/wi8RHhFsEBPrqYPyr
 qnp4t0H6meXjrjMdBimSB9Tm5uIAyI72JjZCnZBFKytcQ2pa7B8HdLkc13MtOpjQtnrY
 DZyAfrHwLX4psbineMg3Qs6sWk/GBCnidCFt8hG9toMOhv13kxuMQYrleMuRAP4lfATo
 XSng==
X-Gm-Message-State: AOAM533zW+qzx0M15+8IXqYvnByt3v57qS8xnxULPnPI3vY5CVV14/On
 zP2Qews5iAyWKy1sftK8NrPLug==
X-Received: by 2002:a17:902:167:b029:d8:cfe5:bdee with SMTP id
 94-20020a1709020167b02900d8cfe5bdeemr1461916plb.11.1606277216434; 
 Tue, 24 Nov 2020 20:06:56 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/11] target/arm: Enforce alignment for VLDn/VSTn (multiple)
Date: Tue, 24 Nov 2020 20:06:40 -0800
Message-Id: <20201125040642.2339476-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1NjcYwpP+rQX

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 32e47331a5..c4be019d9c 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -427,9 +427,12 @@ static void gen_neon_ldst_base_update(DisasContext *s, int rm, int rn,
 
 static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
 {
+    static const MemOp mop_align[4] = {
+        0, MO_ALIGN_8, MO_ALIGN_16, MO_ALIGN_32
+    };
     /* Neon load/store multiple structures */
     int nregs, interleave, spacing, reg, n;
-    MemOp endian = s->be_data;
+    MemOp mop, endian = s->be_data;
     int mmu_idx = get_mem_index(s);
     int size = a->size;
     TCGv_i64 tmp64;
@@ -487,6 +490,10 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
     addr = tcg_temp_new_i32();
     tmp = tcg_const_i32(1 << size);
     load_reg_var(s, addr, a->rn);
+
+    /* Enforce the requested alignment for the first memory operation. */
+    mop = endian | size | mop_align[a->align];
+
     for (reg = 0; reg < nregs; reg++) {
         for (n = 0; n < 8 >> size; n++) {
             int xs;
@@ -494,13 +501,16 @@ static bool trans_VLDST_multiple(DisasContext *s, arg_VLDST_multiple *a)
                 int tt = a->vd + reg + spacing * xs;
 
                 if (a->l) {
-                    gen_aa32_ld_i64(s, tmp64, addr, mmu_idx, endian | size);
+                    gen_aa32_ld_i64(s, tmp64, addr, mmu_idx, mop);
                     neon_store_element64(tt, n, size, tmp64);
                 } else {
                     neon_load_element64(tmp64, tt, n, size);
-                    gen_aa32_st_i64(s, tmp64, addr, mmu_idx, endian | size);
+                    gen_aa32_st_i64(s, tmp64, addr, mmu_idx, mop);
                 }
                 tcg_gen_add_i32(addr, addr, tmp);
+
+                /* Subsequent memory operations inherit alignment */
+                mop &= ~MO_AMASK;
             }
         }
     }
-- 
2.25.1

