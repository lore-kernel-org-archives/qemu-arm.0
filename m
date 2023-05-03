Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2656800ejm;
        Wed, 3 May 2023 00:18:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Z0LBiXNt0r/AHuSZwlxC+FMk+l8Nsw1BP7zgd+FnLjat1s76b8o+0+7vjl0Oe3Qp+1bQf
X-Received: by 2002:a05:622a:612:b0:3e3:86cb:1b9b with SMTP id z18-20020a05622a061200b003e386cb1b9bmr29597004qta.13.1683098285118;
        Wed, 03 May 2023 00:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683098285; cv=none;
        d=google.com; s=arc-20160816;
        b=aiMJmutlQC/csBploe712qAPdDSoxsCOWzN2nAuJ+Dx5CNMdBajh+lP6P50YGlpju+
         ZJN3noKBSZeoHWQi92eznCvH9pAmRqrIZLpeh6//ybPt6tqAjCvRLfSbHNRhjXskDaqu
         ifiYjBtELidZBdcWy/eO1C2HsF+2OPDUq3XzjqoymtMU2V8HC/XeQRtSO3GqrXxyRDSJ
         iK144qAORDB6HE/Wwb5PGYaBzfdmaQQxcz3rR8mvq0aGNmusy+O6Ms2/wD5CU28KWW2g
         DQ1NrTmkjIzqpBINAUXsRI+qannwu2YH8EpgrkKQcXcFNkiJHNKH4boSUkoPEi4lJttK
         giUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EZO7SCJGqCS84y/GA95YftKK1byl/0ehMpYN3JvXR7I=;
        b=EMKE03gmXs7v9ufxMHHJKxBz+mTjUJBt5GC/ok6DG/0tspHG6tNK1EvSlA01s0b2u3
         xjNFsK5jOKEVa34UqgDnamBCp0I+Cx9a3yIel4ut0RkelywjTFc2qJ4RLWcgDc3tf/Vv
         mb+flHZTSFQTjrCIUhXi4QN93CAAs9qjOG5ws5QS45UlxaE2WBLR3/ntwtDiVaB4NdAw
         vQPBquIP635G35Whxoqoqdubn1A/4h/iGQpXCxxBqwolz/pucJ5NhDGxwk2ngjtiJ+WO
         XrxvMlj8cUFKoRPSvxAyID+rrjmM86XU20v1FQ/5CUyvV4oONpFu1a00dPiHhjJ7lDP5
         qYvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hEhSLcYy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18-20020ac85b92000000b003e395eaba9csi18388576qta.346.2023.05.03.00.18.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:18:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hEhSLcYy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6e8-0006Oh-1S; Wed, 03 May 2023 03:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dU-0002zO-Tt
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:52 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dL-00076U-5w
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:48 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso31705455e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097837; x=1685689837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZO7SCJGqCS84y/GA95YftKK1byl/0ehMpYN3JvXR7I=;
 b=hEhSLcYygoqsEbTL+lw+jbCnLzEl6y/CQ4QPoPtcNeHEBsukUvEbIR1pQcCZYeSztr
 We9Vl3whUaqGoMB7Si9cLm4FZCtbz1OcvTIsf7s/7S0ioJAxBZA0bhJ/XlPrr56dCfqu
 TYv888rq3eD+qp/EOrSJ8RD8RuH5OBBSAyQiWuwXlbdiBVu6jWarmmnfaSL/xnX9bd0D
 Aw5S/oW5qC4BNNJCLCDS6kMYPVu0dgHr7FkZehDZnkuS1/h5xBRtG304bNiDKUoYGXLX
 4g/Z+v2dGb6Fq0MGHyRiUF3tclFs01GDwh4zc/zfkYqw3BC5aqKHeulpA0/Z3Z33cHoQ
 ZStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097837; x=1685689837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZO7SCJGqCS84y/GA95YftKK1byl/0ehMpYN3JvXR7I=;
 b=hvUirzdIMGDnbmo+vfYI9KM7kJV1pxp3GbI3L5CnuRzE008498UkcvegrSBZR4sLYY
 HqD3JbN3UGLUBapm1PPb/Gvd0XnJsr6E5TCCw5KUgRObQUthAFQhjbCqYTynVU0Xzbq+
 1n4roiT/FCSCIES4EPUSjogJ1uGIYsR8MgWPP9A8DiZONxJ7oyfmUUxODVGytzW5g9lV
 b+ONyXZWOz8BZRFaRm5g2ChSmdqqEE27u/yMMwpLNperdhxO1UFvcqfyY9w/Z5nGMys+
 ie2IoKT8CiK1RhA3HT+dev13/6mpXd2SGV6GXQjBy0uocmGpZYYPiOWCrwn8dhweKc9i
 sJmA==
X-Gm-Message-State: AC+VfDwz2z8ymvKH6WHTZ+mPGybneuK2lMhbOXemEJLZFEAVezADoAuJ
 dqhSPcu27YEotDPlU/p4yQQVL/x1HwCzQakhgRPzkw==
X-Received: by 2002:a1c:7404:0:b0:3f1:92aa:4eb8 with SMTP id
 p4-20020a1c7404000000b003f192aa4eb8mr14667499wmc.16.1683097837035; 
 Wed, 03 May 2023 00:10:37 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 52/57] tcg/i386: Honor 64-bit atomicity in 32-bit mode
Date: Wed,  3 May 2023 08:06:51 +0100
Message-Id: <20230503070656.1746170-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: THlu7iIMdCza

Use the fpu to perform 64-bit loads and stores.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 44 +++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 3e21f067d6..5c6c64c48a 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -468,6 +468,10 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_GRP5        (0xff)
 #define OPC_GRP14       (0x73 | P_EXT | P_DATA16)
 
+#define OPC_ESCDF       (0xdf)
+#define ESCDF_FILD_m64  5
+#define ESCDF_FISTP_m64 7
+
 /* Group 1 opcode extensions for 0x80-0x83.
    These are also used as modifiers for OPC_ARITH.  */
 #define ARITH_ADD 0
@@ -2091,7 +2095,20 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
             datalo = datahi;
             datahi = t;
         }
-        if (h.base == datalo || h.index == datalo) {
+        if (h.atom == MO_64) {
+            /*
+             * Atomicity requires that we use use a single 8-byte load.
+             * For simplicity and code size, always use the FPU for this.
+             * Similar insns using SSE/AVX are merely larger.
+             * Load from memory in one go, then store back to the stack,
+             * from whence we can load into the correct integer regs.
+             */
+            tcg_out_modrm_sib_offset(s, OPC_ESCDF + h.seg, ESCDF_FILD_m64,
+                                     h.base, h.index, 0, h.ofs);
+            tcg_out_modrm_offset(s, OPC_ESCDF, ESCDF_FISTP_m64, TCG_REG_ESP, 0);
+            tcg_out_modrm_offset(s, movop, datalo, TCG_REG_ESP, 0);
+            tcg_out_modrm_offset(s, movop, datahi, TCG_REG_ESP, 4);
+        } else if (h.base == datalo || h.index == datalo) {
             tcg_out_modrm_sib_offset(s, OPC_LEA, datahi,
                                      h.base, h.index, 0, h.ofs);
             tcg_out_modrm_offset(s, movop + h.seg, datalo, datahi, 0);
@@ -2161,12 +2178,27 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
         if (TCG_TARGET_REG_BITS == 64) {
             tcg_out_modrm_sib_offset(s, movop + P_REXW + h.seg, datalo,
                                      h.base, h.index, 0, h.ofs);
+            break;
+        }
+        if (use_movbe) {
+            TCGReg t = datalo;
+            datalo = datahi;
+            datahi = t;
+        }
+        if (h.atom == MO_64) {
+            /*
+             * Atomicity requires that we use use one 8-byte store.
+             * For simplicity, and code size, always use the FPU for this.
+             * Similar insns using SSE/AVX are merely larger.
+             * Assemble the 8-byte quantity in required endianness
+             * on the stack, load to coproc unit, and store.
+             */
+            tcg_out_modrm_offset(s, movop, datalo, TCG_REG_ESP, 0);
+            tcg_out_modrm_offset(s, movop, datahi, TCG_REG_ESP, 4);
+            tcg_out_modrm_offset(s, OPC_ESCDF, ESCDF_FILD_m64, TCG_REG_ESP, 0);
+            tcg_out_modrm_sib_offset(s, OPC_ESCDF + h.seg, ESCDF_FISTP_m64,
+                                     h.base, h.index, 0, h.ofs);
         } else {
-            if (use_movbe) {
-                TCGReg t = datalo;
-                datalo = datahi;
-                datahi = t;
-            }
             tcg_out_modrm_sib_offset(s, movop + h.seg, datalo,
                                      h.base, h.index, 0, h.ofs);
             tcg_out_modrm_sib_offset(s, movop + h.seg, datahi,
-- 
2.34.1

