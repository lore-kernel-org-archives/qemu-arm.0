Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6567978ejq;
        Mon, 15 May 2023 07:53:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+9zal32FKRKmjMtAl/qQlLrSLJTXJRQIYHgU5YMMUZfzJaQWeEL1Sqnyhpd93oYxUuKqL
X-Received: by 2002:a05:622a:1999:b0:3e6:4fab:478e with SMTP id u25-20020a05622a199900b003e64fab478emr61666919qtc.33.1684162413571;
        Mon, 15 May 2023 07:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684162413; cv=none;
        d=google.com; s=arc-20160816;
        b=bNjjJgZKt5gA5QHJcUzYI6PTT3AdlJAds+zDJF895fY85sEw/465S6csUSnYgHN9pd
         5HGCBo4lfj7agF0ZlKp6iDVl8DwyIXMe5anTzqNkjq41uA0EEVvOIIEAIlw6tV81YhlF
         OvmYLXpRz5N/cm0map0S+GO/os5sdy3aWC+p9hkhAIKqwTp4HHtBNedB3OqSgEDyngvz
         KNMnUAc869a9R4lIdML/qusRH/ifx6LjuUxKTJPTVaOGNPgoSrMpyF/HJ3kSRiJq/0A8
         LTbxKVIMwHZwcx7HtBQUet4Mt3ipr6Hok1mohH07QBobSzG4DrNWrkMjJMl4vnJThrU2
         SnfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=e3K+79nBiSc5crGCl8vbMQJ8GibyAa5XexENyD2+9r4=;
        b=oUY0oJMTqFrl+dFTtUqJxaFfbGmtN0sgALi2602qzFX6/d7BGbU1Wz6NNCqOA3HEiL
         sP1QG+Fz9+yV6R5d1i311/4+GlvacMPphA4LLBg+30z1Yk/D4dLBpBoCxcSZySHyvmm6
         Cw6U9zDQB7SEDP8g41xc5QiBUTVVqixUM9AeRP020ZBO179RsAAcC9Q++gBVdnzT5kow
         TNg+oscvocWCfsh+voB+ZPI12sxwLixabNlzxe9BwGFa8uz7IxUXUwI1vdbsOBZJLnYH
         JGMBG9+8tpz+tTWkeuaOnVUYP2DPIWkwPrB1Zib4STCc1PwRarGeik+4h18E20vtPzOk
         sogg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rpmgzLPJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15-20020ac85acf000000b003ee8a016d4fsi9739197qtd.30.2023.05.15.07.53.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:53:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rpmgzLPJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZKl-0006vH-Lt; Mon, 15 May 2023 10:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZK1-0005W5-0O
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:09 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZJp-00061B-Kf
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:37:08 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1ab01bf474aso97689105ad.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161416; x=1686753416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e3K+79nBiSc5crGCl8vbMQJ8GibyAa5XexENyD2+9r4=;
 b=rpmgzLPJ+aNecBK2ne+VOKKD3v0+ZT+GFbRBOAFL9T8r02IirH6DCbLLgGAxPYoc28
 UjocEzLn/ygh5Hdnn4beN4rvFd/hU/BcgFkzktsQFYkNsDSDTx0hl7XkWWBmMcMqMZXD
 jfz/zBCjyGNhVWFkG3u6tDwhzfbtGeJule+WySA6Zc0QB0JRddXjeMRAAUa673cbBl7e
 8a+TxqRaPt8gbJTQ3baHa0Jllc1dKU6I5OPSHw/CUPIUI1kaiZoGsukWmorfeMOtxvgM
 O39tXRtRHx42OYJqQ+TytDWZGxS9MFkGDk/L9/+RKsDK75jJZfRoNCmjXQQ7dazKQ9/w
 iHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161416; x=1686753416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e3K+79nBiSc5crGCl8vbMQJ8GibyAa5XexENyD2+9r4=;
 b=AHbOw7lO+Ubic854uApqgiiEemYtprBKxcfTfQWI+P+l2RiK9qRdsjm8Cnkt4CSxe9
 93PzI4ZO7hajOWwfgBG0L3IgUVTauPBlcvhPkpHgVQv5rMIwQq+6i4YZxwT+MkQoDPOk
 rSNWAGE6NvoX7+6K/lCDK1elt4hSyAhX7bv3hvVt0ZrTo899lu6FDwClxgl5QQwYRMRa
 xrE0si5PP4p3muoSlBmViCcOyJRspQvYSXshAjTsshuLOWlwN9hvLg4kAWD02YLXQlpu
 Ufe3I+xTPSQfU6SXFq/5fNB9/qLSRPuF33aJP90j7t88T/CSKJ64ymdXEZzI1vX+fJxA
 11vw==
X-Gm-Message-State: AC+VfDyH79z5/Vbeq8x2yuSKMs1YzUhJvyrKlN1Cl3HqL+HvngxPew2Y
 syonLVhKqRQVngmIzh6qGBcJ7DLGZJAON7x0Gtg=
X-Received: by 2002:a17:902:ee89:b0:1a6:74f6:fa92 with SMTP id
 a9-20020a170902ee8900b001a674f6fa92mr36566171pld.19.1684161416415; 
 Mon, 15 May 2023 07:36:56 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a1709026ac600b001aadfdfcd06sm8942735plt.299.2023.05.15.07.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:36:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 49/54] tcg/i386: Honor 64-bit atomicity in 32-bit mode
Date: Mon, 15 May 2023 07:33:08 -0700
Message-Id: <20230515143313.734053-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9NzcF/sMhdGm

Use the fpu to perform 64-bit loads and stores.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 44 +++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 3b8528e332..0415ca2a4c 100644
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
@@ -2086,7 +2090,20 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
             datalo = datahi;
             datahi = t;
         }
-        if (h.base == datalo || h.index == datalo) {
+        if (h.aa.atom == MO_64) {
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
@@ -2156,12 +2173,27 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
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
+        if (h.aa.atom == MO_64) {
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

