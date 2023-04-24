Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2601839ejm;
        Sun, 23 Apr 2023 22:56:49 -0700 (PDT)
X-Google-Smtp-Source: AKy350a2GAvC2FY353CazcuTPE4x1qM6gxpu6jo0fb8FbtKh1P34P3jZ9fR8bnYsuYN/tvb6g7fg
X-Received: by 2002:a05:622a:64a:b0:3e4:edf4:d6e7 with SMTP id a10-20020a05622a064a00b003e4edf4d6e7mr21172909qtb.11.1682315809517;
        Sun, 23 Apr 2023 22:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682315809; cv=none;
        d=google.com; s=arc-20160816;
        b=whJ9dqIktp+VsX4janYqmZBSifWhn3JEwNE8slwPjYy48HhZ/DnoXCF1PA/42UuKjy
         xvH5Mkm4NstLbqfWdF7RvkHcsakiteUs3CI0ixV9UsiCQ9PF311RHS2tVDPSIzOOj7aa
         mIVS31k+CVDnbpri6/pZ8XAXp6AWKnbke3ZzyQl+QZWzUlNku4MSX5rkPkjBJRxQqvi2
         pCcZ+yR+qdpKMGHqUYBmAvMwN9UYuVJrHf5zJCJXcZleLtzC5jwnEHUAmUr2Lwz23CWb
         vx2Dn4JUf/iY1dASyQKi38nJ4LUbUCJxVLuxEp1R2yAxj581yia5aQXMt5caZWtCirfP
         9ZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=h+hQGAfxVGFgcw51jDi1fjFbmaS4u/aJWSe3Wo6FlWM=;
        b=q7JTRRN/BKuTzg9DCblxXuGc68rhP2p8zmf9hI87pk2FaUjJX6Ki7p1XxYmcq/KHXu
         ML0+/9cZHZPzPBVyE9Sw3pkiAhKUKqfD4AmPmPgeE6SKGZaP20EHp+GJ6SJW9Uu+ZZ3O
         lqlQYTAjHueb1O8SdOFidBBJIRKE1GP3/74tBmfmhgrTixBHt9gonH6YbUpUR1DpnmFP
         UYqREHC7AiXn5dyYcBPgGGbBBzpk4c2/XwhAVbvUQVzrmoqyGErzVhAvnJuBim49cTzN
         KNBcit4mBUJW/cwoFUDNjUADg55Ze73fZhz26A9CkogejPyfEy8PrTxNytJODDFdEH4z
         IaXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ACtyLrak;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1-20020a05620a404100b0074df1d28aadsi6898090qko.688.2023.04.23.22.56.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:56:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ACtyLrak;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqp01-0005WA-DK; Mon, 24 Apr 2023 01:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoxn-00060b-LU
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:24 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox3-0004Qm-Df
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 01:42:11 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso16816315e9.2
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 22:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314883; x=1684906883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h+hQGAfxVGFgcw51jDi1fjFbmaS4u/aJWSe3Wo6FlWM=;
 b=ACtyLrakakBQmEc6asqDpJkdPZTAGr1J5eljdp295ly5H/RWmIPUgI5Ege3+C721E9
 WlHCD8XPmsjBSa7LO4vdwk5BfUGHa1oJLwCts1k+Fl0pGACdeyjXFpA7+ljkYE2m2jmS
 MSpyJe438/NqKngZlj2UGPk3drV+Ym1e6togpesPdOWvgRlkSLHtqvK8LeB1YoOisWTT
 jHM6hVh7fhIj3PYrLy4SFhNETPDq5vWUeuRV9vF6yiJgzn8kFs6siaor4wtTpQeU7K7x
 x9aumxO1SRB9cf+P7QmKQY3zu06MRFRwFWJ0T3Qs1/hRlYAG1wT1jvRieC1pgF/Wditx
 u2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314883; x=1684906883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h+hQGAfxVGFgcw51jDi1fjFbmaS4u/aJWSe3Wo6FlWM=;
 b=ABC2L+5xFj3ewSJt9jxktMv35PApXkIFqPwQPzBTK0PyxMdCHzvtiOKVJuxr7uGJrK
 6Hxq2t2twJYc+w2qzbQqFx1tARIIzZQYtyrHIjcEUXMyzqf6Om0C/i4ylLWbo3k+/Wff
 95XOr4BEJJEfmA3BtA+AxMbULRgWookyqdLuIuGvfT6xLYAeBw2JVzF4B/tdNmKKATdD
 cQnlAbII/epZUnzNZP9271Ceuo5Ed/qngo/N7AHRXBknYQayS8YTuZh8NpBZmlI2uDCy
 mL7w2Pw+ZJfqBYYWw0kuDvqmFrGLT2W72GTToOvdUCuOyjbX7+rmLpUgXQPKhfisZagF
 ca9A==
X-Gm-Message-State: AAQBX9eWXPUYk9FjtubEo11mJvkBJEk78npP9MBemMPZWrw81S/CZr7q
 BzmxQNIGjU6fQZToZwUxVGO9JpWoyEwufBTcZ59aaQ==
X-Received: by 2002:adf:cd82:0:b0:2cf:eb86:bd90 with SMTP id
 q2-20020adfcd82000000b002cfeb86bd90mr8763061wrj.63.1682314883017; 
 Sun, 23 Apr 2023 22:41:23 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 29/57] tcg/s390x: Pass TCGType to tcg_out_qemu_{ld,st}
Date: Mon, 24 Apr 2023 06:40:37 +0100
Message-Id: <20230424054105.1579315-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: YAphzYSbuS/k

We need to set this in TCGLabelQemuLdst, so plumb this
all the way through from tcg_out_op.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index b399798664..e931f0cde4 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1770,13 +1770,14 @@ static TCGReg tcg_out_tlb_read(TCGContext *s, TCGReg addr_reg, MemOp opc,
 }
 
 static void add_qemu_ldst_label(TCGContext *s, bool is_ld, MemOpIdx oi,
-                                TCGReg data, TCGReg addr,
+                                TCGType type, TCGReg data, TCGReg addr,
                                 tcg_insn_unit *raddr, tcg_insn_unit *label_ptr)
 {
     TCGLabelQemuLdst *label = new_ldst_label(s);
 
     label->is_ld = is_ld;
     label->oi = oi;
+    label->type = type;
     label->datalo_reg = data;
     label->addrlo_reg = addr;
     label->raddr = tcg_splitwx_to_rx(raddr);
@@ -1900,7 +1901,7 @@ static void tcg_prepare_user_ldst(TCGContext *s, TCGReg *addr_reg,
 #endif /* CONFIG_SOFTMMU */
 
 static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
 #ifdef CONFIG_SOFTMMU
@@ -1916,7 +1917,8 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 
     tcg_out_qemu_ld_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
 
-    add_qemu_ldst_label(s, 1, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else
     TCGReg index_reg;
     tcg_target_long disp;
@@ -1931,7 +1933,7 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 }
 
 static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
 #ifdef CONFIG_SOFTMMU
@@ -1947,7 +1949,8 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 
     tcg_out_qemu_st_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
 
-    add_qemu_ldst_label(s, 0, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else
     TCGReg index_reg;
     tcg_target_long disp;
@@ -2307,13 +2310,16 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        /* ??? Technically we can use a non-extending instruction.  */
+        tcg_out_qemu_ld(s, args[0], args[1], args[2], TCG_TYPE_I32);
+        break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, args[0], args[1], args[2]);
+        tcg_out_qemu_ld(s, args[0], args[1], args[2], TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
+        tcg_out_qemu_st(s, args[0], args[1], args[2], TCG_TYPE_I32);
+        break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, args[0], args[1], args[2]);
+        tcg_out_qemu_st(s, args[0], args[1], args[2], TCG_TYPE_I64);
         break;
 
     case INDEX_op_ld16s_i64:
-- 
2.34.1

