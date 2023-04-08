Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp650751ejb;
        Fri, 7 Apr 2023 19:50:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350YlEAk6uDFAzH1iaiWW+dMw8VDLfs5YiCktGgvjtyBL3KXSrgu54q6wNu6E6xY6cSBHcIpp
X-Received: by 2002:a05:622a:1103:b0:3bf:c9d1:4276 with SMTP id e3-20020a05622a110300b003bfc9d14276mr7159218qty.5.1680922214949;
        Fri, 07 Apr 2023 19:50:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680922214; cv=none;
        d=google.com; s=arc-20160816;
        b=Jo1VPVqTA+/+K6TqO7Aw70wSlV3AQYTdI6AxZUHShjDegPJZKaiKOhn/MI+iEh/9/i
         RK28hVX4GocZLGJW2yj4oTPfRcjynnYDyv2G09iHCY91op2qzzN9XSYE83EdENnLT7OY
         cJDpqA8UNvPnI9vXjJ8sDKQcBtEB7Z2QccXZl5Q4GJPl5MiCofa4hWE32O9ifvgo4EZ7
         CZwlMk0xpEcMTfrkpBqAjguFP5dKXoD9u/2SGa1XrPxJ8sRqrKKOJ8aNBAGAUhahffpO
         OPrPqKGzS5BoXkPbW2pr5oGKysSKIc3wPN7Vl0eTWMThdwrEKSZj9ssAmddt9u3souyu
         /VNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Gpvk0vsaxCF51jInYoDBgD+gUZ6vD6omZfVFJBugzXU=;
        b=Q8ddhS26rfAPmmcjustahkk8m9B/5Sa0NcM2JOXSMtaBPGswl4Hekbw3C08DY/RfDV
         TvQI1P/WXekzjn5m+mTmdR1DPgJAfJWpvQRX6ADGSWh1GXP9mVM6jzIo/IH3eQbT6ht6
         quEFaLnCIcV3fTTj8IoXP3NDiZ29QmByTzdUeydZubw7B83XTH4hWRyTo/dq0QIVOA+f
         jIuW1uYp2/ggHDQM2X4Xv5U/wVx13GvIhhXxSIHlkMa7gIwtKghKxEkedA3yZiHMSPvw
         n2upgrswmfmurOhuKyigGTdRHSC0rEYyoaGp/IY83B1OWM33dBDjIybyHGxYeKv93xz9
         UrpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vAT9yUpL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18-20020ac858d2000000b003b8458c31fdsi3915621qta.286.2023.04.07.19.50.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:50:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vAT9yUpL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkyYb-0007kf-Uj; Fri, 07 Apr 2023 22:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYa-0007hV-1y
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:00 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYB-0005iP-KN
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:43:59 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 b5-20020a17090a6e0500b0023f32869993so2836897pjk.1
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gpvk0vsaxCF51jInYoDBgD+gUZ6vD6omZfVFJBugzXU=;
 b=vAT9yUpLF0VuSKLFRmAGNRdlQdhsMd8MZvpbMRMdsbUtuUfbFVy+Tc3LHOLh8gbQRB
 XQ/cBkaB+RVXrKkvfKT6Oe37Eqik3nG/beSOrm6UyXIUi9d1hs/Ueg0Co+Dj++D6/emL
 LNRKW6w3n8BTRhvMoNpwPylEYxZE7jJ7PUGipy+Gp/h05MOoRSZBpNENgrC8iclEzNSb
 c5KXiXDa7Xg2SBMJ1VKk6wOiRdhrGCf888K1IrN46jqgeibgJ64tjMhlGQ8Jx6+BOtYw
 ILM5d+GwIDEnfJkQBkN7D3NDf7gblZEEX6b4+wv/31CCtqULDZQ7zA4R+6+DSuC6HnQD
 NRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gpvk0vsaxCF51jInYoDBgD+gUZ6vD6omZfVFJBugzXU=;
 b=H9JDe5JGqAXYWLYjxv1TpC3xkZ8HSxiSaTPxmBs6/wjKiaHhfOqlbpkLIDHJBq7EZy
 5vzukz6PJOinJZil+BdOTKjIlAChRnQ0Br+FuVR86GjYB8H/1TzFpk+6CjeGcyK003ps
 hzBo+MgZGkwELm7VlQGjuimcDVBQbroVpFOCqNogQyS6XgeFkUhk+UW6YxA7nwMJFfKZ
 DivoVPGrTaODUhxs99IduwX8i+RC2fueSTfVkQM1hQvMZPP8ZMDFS9UkruqeGj+aeVbm
 8BbPOyrPBDNWvzozG0Z1eYZreFTetYCm1WGFOZnGqKmLqqRGMfApfLbfJM92tsVBS2jv
 8IOA==
X-Gm-Message-State: AAQBX9cit/ajmOn3X8IFtLlikSSRIewmEY/P3ryqj3gfA1rg2DUQuA6I
 UnTN4rtjlsINs6YWIpGggDBFujUHzfsMw6OmiDA=
X-Received: by 2002:a17:902:e0d4:b0:1a1:d655:1ce4 with SMTP id
 e20-20020a170902e0d400b001a1d6551ce4mr3884467pla.38.1680921814194; 
 Fri, 07 Apr 2023 19:43:34 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 20/42] tcg/i386: Use TCGType not bool is_64 in
 tcg_out_qemu_{ld, st}
Date: Fri,  7 Apr 2023 19:42:52 -0700
Message-Id: <20230408024314.3357414-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: F0sTMSVjoyNx

There are several places where we already convert back from
bool to type.  Clean things up by using type throughout.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 35 +++++++++++++++++------------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 54465c7f46..ff4062ef54 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1886,8 +1886,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
  * Record the context of a call to the out of line helper code for the slow path
  * for a load or store, so that we can later generate the correct helper code
  */
-static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
-                                MemOpIdx oi,
+static void add_qemu_ldst_label(TCGContext *s, bool is_ld,
+                                TCGType type, MemOpIdx oi,
                                 TCGReg datalo, TCGReg datahi,
                                 TCGReg addrlo, TCGReg addrhi,
                                 tcg_insn_unit *raddr,
@@ -1897,7 +1897,7 @@ static void add_qemu_ldst_label(TCGContext *s, bool is_ld, bool is_64,
 
     label->is_ld = is_ld;
     label->oi = oi;
-    label->type = is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
+    label->type = type;
     label->datalo_reg = datalo;
     label->datahi_reg = datahi;
     label->addrlo_reg = addrlo;
@@ -2151,11 +2151,10 @@ static inline int setup_guest_base_seg(void)
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
                                    TCGReg base, int index, intptr_t ofs,
-                                   int seg, bool is64, MemOp memop)
+                                   int seg, TCGType type, MemOp memop)
 {
-    TCGType type = is64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
     bool use_movbe = false;
-    int rexw = is64 * P_REXW;
+    int rexw = (type == TCG_TYPE_I32 ? 0 : P_REXW);
     int movop = OPC_MOVL_GvEv;
 
     /* Do big-endian loads with movbe.  */
@@ -2248,7 +2247,7 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
 /* XXX: qemu_ld and qemu_st could be modified to clobber only EDX and
    EAX. It will be useful once fixed registers globals are less
    common. */
-static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, TCGType d_type)
 {
     TCGReg datalo, datahi, addrlo;
     TCGReg addrhi __attribute__((unused));
@@ -2262,7 +2261,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 #endif
 
     datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is64 ? *args++ : 0);
+    datahi = TCG_TARGET_REG_BITS == 64 || d_type == TCG_TYPE_I32 ? 0 : *args++;
     addrlo = *args++;
     addrhi = (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
     oi = *args++;
@@ -2275,10 +2274,10 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
                      label_ptr, offsetof(CPUTLBEntry, addr_read));
 
     /* TLB Hit.  */
-    tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, is64, opc);
+    tcg_out_qemu_ld_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, d_type, opc);
 
     /* Record the current context of a load into ldst label */
-    add_qemu_ldst_label(s, true, is64, oi, datalo, datahi, addrlo, addrhi,
+    add_qemu_ldst_label(s, true, d_type, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else
     a_bits = get_alignment_bits(opc);
@@ -2288,7 +2287,7 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 
     tcg_out_qemu_ld_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg,
-                           is64, opc);
+                           d_type, opc);
 #endif
 }
 
@@ -2344,7 +2343,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
     }
 }
 
-static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
+static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, TCGType d_type)
 {
     TCGReg datalo, datahi, addrlo;
     TCGReg addrhi __attribute__((unused));
@@ -2358,7 +2357,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 #endif
 
     datalo = *args++;
-    datahi = (TCG_TARGET_REG_BITS == 32 && is64 ? *args++ : 0);
+    datahi = TCG_TARGET_REG_BITS == 64 || d_type == TCG_TYPE_I32 ? 0 : *args++;
     addrlo = *args++;
     addrhi = (TARGET_LONG_BITS > TCG_TARGET_REG_BITS ? *args++ : 0);
     oi = *args++;
@@ -2374,7 +2373,7 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     tcg_out_qemu_st_direct(s, datalo, datahi, TCG_REG_L1, -1, 0, 0, opc);
 
     /* Record the current context of a store into ldst label */
-    add_qemu_ldst_label(s, false, is64, oi, datalo, datahi, addrlo, addrhi,
+    add_qemu_ldst_label(s, false, d_type, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else
     a_bits = get_alignment_bits(opc);
@@ -2672,17 +2671,17 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, args, 0);
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args, 1);
+        tcg_out_qemu_ld(s, args, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st8_i32:
-        tcg_out_qemu_st(s, args, 0);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args, 1);
+        tcg_out_qemu_st(s, args, TCG_TYPE_I64);
         break;
 
     OP_32_64(mulu2):
-- 
2.34.1

