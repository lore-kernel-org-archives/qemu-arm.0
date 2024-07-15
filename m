Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2061680nji;
        Sun, 14 Jul 2024 22:59:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOEjAcfmsILWXXR+zz9sWAYegAqk/RbFTdNLFAY3/mu78fSkq+PPCsfEt618ljutyHRxUF/Cmq77p1FlqzLCOAWidLdV6P
X-Google-Smtp-Source: AGHT+IFQ1HXPh2RORTrw8akqxLJaS4kCP6EO9ELdF3EorvJBfcI0Jddl81ZllZbc/AVjkgtQjrtD
X-Received: by 2002:a05:690c:64ca:b0:64b:4219:768a with SMTP id 00721157ae682-658ef249d54mr192974437b3.24.1721023149202;
        Sun, 14 Jul 2024 22:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721023149; cv=none;
        d=google.com; s=arc-20160816;
        b=uCYOqEtARFc6QF6WaErTka9yXGopB1H7N44plRyGTDPkkQglBcJ2apSG1E+YM+f2W9
         phSlbVvzp/rASdvhi5o8NNkBpg0WXrXNKVESj9gTShtEMHqu1GBnTG8QMTFfHHZyGfDu
         4mLcysZerK8wzNIwlLze1IJC8AQAZHqhe/vshMkfyMUX0s7jzbl3CKBECe+oJXxEZ4xX
         uA3rv1hD+QAPSkq76s10f5vUolsKfivDl+JA+L+sxHArallEySFN3Xg6r39A4871qpn7
         xIXS0bptGws3O/ktZYbvsxyixGY7IZTe91Eg6dX5lkX+ips7E8fyWPFu26KuX+qxPcEu
         UTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bo/AQ8LDzk/AOqWq7VGMP1dwGD9Dmy3wpy1bY1Rsljs=;
        fh=NWGQ7fZR3zVEVi2WAz7PRCM0UoPYD55CyBanUzcPfOE=;
        b=nFfftFi70MCH37gMPoqp+g4TdDKQcnxq0D8vh6Cymw3n53qmAdk6SGDByzD22jlYtS
         1H+HDUqwi7vQe691APw/H6BrP/Usk66FN3jeFcEbw4dxYG1AJS/3QC0ohq7JCfR05G8i
         /oR0ogxseGN6NNdHuljTS1i1gyAO5JxHEBi1TcnnXIPORYPIZbR5CErlc2yhjwMnKqyy
         lVu6SG5VUqNe7yMvkYZ2Ss9niSLmQeDs4v174ad1rDrNy6PTVoyTyx9G5nYppuEFL8nx
         V7QZfXu1sCNmNHosMDRLJXKnhRLQ5ukjo6cml33Tk9SinhbXAmr9plGMvtPsqHvMagnC
         3f4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vvn3SVcx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b8068aesi45774001cf.470.2024.07.14.22.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jul 2024 22:59:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vvn3SVcx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sTEjQ-00050m-0Y; Mon, 15 Jul 2024 01:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTEjO-0004wH-WC
 for qemu-devel@nongnu.org; Mon, 15 Jul 2024 01:58:39 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTEjL-0008TI-W7
 for qemu-devel@nongnu.org; Mon, 15 Jul 2024 01:58:38 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2c8517aab46so3165118a91.1
 for <qemu-devel@nongnu.org>; Sun, 14 Jul 2024 22:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721023114; x=1721627914; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bo/AQ8LDzk/AOqWq7VGMP1dwGD9Dmy3wpy1bY1Rsljs=;
 b=Vvn3SVcxf53+Z3MHgiNQ8grXR8g3kafkpD215q2n3iPwukg//Fx4nL3BIsr4cxxgfo
 vQqCCANYkrhcNWtEx5N874voAGWJ+1EbHVJCOhdKrhpRbZvW5P8PAQ/TXjZ4yC5nVTDG
 oxZx+OeOrGWj6DyBW2oQtmP+fmA3YuJ6bGmFiT3HG5fNelcup/H1RKw59tHl3IuxD19M
 WJZiuq0CWHcNHbdx3yepB6ewFewmgrHzGjXaR3MdvaUmdQ+wlUrvBAb3Y0f+jqx/SKdR
 gpEWpx/svQemta7f/NdU0JCL5XeM/bf+nnJIBJg1zfi44E9LE8Cvw7tfjZdlRZYnZp0D
 ZSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721023114; x=1721627914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bo/AQ8LDzk/AOqWq7VGMP1dwGD9Dmy3wpy1bY1Rsljs=;
 b=eOjaNwSS5y5hh4FGFQ5aXhoSUbHv2nHGIOfHFhsmwQJ1qlyUU0fNZ1Tt3TwNTF/ImI
 ps+X/1zbzTYVHjmDuPLtHvz5tn2+B0JxaR6CdDt66LcrictOTINCufoeQ1lifvg38nHm
 grvCRwRC7pUllqwN2/Fwagu//rCWznA7cCQe6nv79zOh7c67g0dR7JynNFX+2Sl0R195
 jpLN/jpIsc/xq0bANm7rGv70U09mVROXkiZzDXE7j2R/oFyAXPPclfgeaA/+ksrBnMaX
 JBhy0s61sAmGLdl6KrGW2TvJONvGwtxasCCoZ2/KBxce8sAi6Wv0c6p5FFgzL7SxYL8i
 eHDA==
X-Gm-Message-State: AOJu0YyQzBNZvamkeG0+gGBMyR1P4RQgtq+wjaC0rjfFh/Iz0K15YGv+
 qfMDLNeafiULu1x/9MD7V7hy5MjsIPtd/0prX6pr4blesMUCW5MYayFzEzINjHNxPgMjNTczv9C
 duhJ5yw==
X-Received: by 2002:a17:90a:ca87:b0:2c9:7ae1:8f62 with SMTP id
 98e67ed59e1d1-2ca35d599e0mr13652395a91.46.1721023114241; 
 Sun, 14 Jul 2024 22:58:34 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cacd419af7sm5463589a91.25.2024.07.14.22.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jul 2024 22:58:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: danikhan632@git.sr.ht, qemu-arm@nongnu.org, qemu-stable@nongnu.org,
 Daniyal Khan <danikhan632@gmail.com>
Subject: [PATCH 2/3] target/arm: Use FPST_F16 for SME FMOPA (widening)
Date: Mon, 15 Jul 2024 15:58:19 +1000
Message-ID: <20240715055820.319035-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715055820.319035-1-richard.henderson@linaro.org>
References: <20240715055820.319035-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sZ/9pZt4RVOl

This operation has float16 inputs and thus must use
the FZ16 control not the FZ control.

Cc: qemu-stable@nongnu.org
Reported-by: Daniyal Khan <danikhan632@gmail.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2374
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 46c7fce8b4..185a8a917b 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -304,6 +304,7 @@ static bool do_outprod(DisasContext *s, arg_op *a, MemOp esz,
 }
 
 static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
+                            ARMFPStatusFlavour e_fpst,
                             gen_helper_gvec_5_ptr *fn)
 {
     int svl = streaming_vec_reg_size(s);
@@ -319,15 +320,18 @@ static bool do_outprod_fpst(DisasContext *s, arg_op *a, MemOp esz,
     zm = vec_full_reg_ptr(s, a->zm);
     pn = pred_full_reg_ptr(s, a->pn);
     pm = pred_full_reg_ptr(s, a->pm);
-    fpst = fpstatus_ptr(FPST_FPCR);
+    fpst = fpstatus_ptr(e_fpst);
 
     fn(za, zn, zm, pn, pm, fpst, tcg_constant_i32(desc));
     return true;
 }
 
-TRANS_FEAT(FMOPA_h, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_h)
-TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a, MO_32, gen_helper_sme_fmopa_s)
-TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a, MO_64, gen_helper_sme_fmopa_d)
+TRANS_FEAT(FMOPA_h, aa64_sme, do_outprod_fpst, a,
+           MO_32, FPST_FPCR_F16, gen_helper_sme_fmopa_h)
+TRANS_FEAT(FMOPA_s, aa64_sme, do_outprod_fpst, a,
+           MO_32, FPST_FPCR, gen_helper_sme_fmopa_s)
+TRANS_FEAT(FMOPA_d, aa64_sme_f64f64, do_outprod_fpst, a,
+           MO_64, FPST_FPCR, gen_helper_sme_fmopa_d)
 
 /* TODO: FEAT_EBF16 */
 TRANS_FEAT(BFMOPA, aa64_sme, do_outprod, a, MO_32, gen_helper_sme_bfmopa)
-- 
2.43.0

