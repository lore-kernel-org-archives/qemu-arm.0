Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp184290ejc;
        Mon, 10 Apr 2023 18:09:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zz9N090VHEbTaYaaSrLmzf8ZnAhytxrIU5dNQwC0pjYmo2RfYPNhBLTIW6pz45XGqddlUj
X-Received: by 2002:ac8:5e49:0:b0:3e3:86d0:4ef8 with SMTP id i9-20020ac85e49000000b003e386d04ef8mr35555664qtx.28.1681175367431;
        Mon, 10 Apr 2023 18:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175367; cv=none;
        d=google.com; s=arc-20160816;
        b=RaxdHvkmnGW2nAud7bzAoGh93pqGfvoThI+JOd6yOIz6x2diXj0NsYuYgVMf0KHx0V
         4+DavOBYfOAydhs3WrgL/wHphYs4J4HGvh+rd5vHeuav2C2a50UsdlwJboNFu804Bpi+
         CxFby9SW0h48y0YF0/b5FsHLSjWxhJk0KJ5Z+KR54I3oq0wYFwSnHTCU0pJ8a7dkIjRz
         ng0sU4RJSpB5x5rd1qJtiqxPLiX/BtglrWfmP7GUBTbGf2OwpqfrgCvf7YSGlNwLBb4X
         HZwpz6UYOL83PD8mwIjcfBavbjkE4HIruR6UyrivTvAjcqmMW/xGQ9CVMcUz0+7HBFnZ
         khyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P00Nt+KeWeWNDZD/WYZHk0mydxgmnXGCysO1QPGCtNE=;
        b=B7L761KaMMdFr8+gCXsebDSWU5X92Ga77j/QFxfqn54OM75jVcW3cbQLLmbqzvU9jG
         lP64cwQ12g4Qum7a+CdFAbQWZd05UfBWIXWAk1yurdjsI1DxQLPQCtrx1L/lBXqgD+SM
         7NTZKOSgPaxCHCDfZLZ/4wU6UYSf719VP4c8dLkPj0vhxmo+PSIRU3+71h+RtWbGoAOX
         Yeaw6M+qIgBdXI/08RUfiJ+YwkKJT7rIvl18CPm4D95CwckrKJuNxchMJT9X7wxXk/Nr
         gedsmesTmY1067XUUnKQIQMZR7QX4sisVk278sDPCPABGAr9Sy6jBiXY4inorgcGR7ys
         r2Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PRhj7ohX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020a05620a245200b007468b186a1fsi8997239qkn.86.2023.04.10.18.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:09:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PRhj7ohX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2T8-00065H-Tw; Mon, 10 Apr 2023 21:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sy-0005eC-69
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:36 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Sq-0000V4-Kn
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:06:34 -0400
Received: by mail-pl1-x62f.google.com with SMTP id w11so6262918plp.13
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P00Nt+KeWeWNDZD/WYZHk0mydxgmnXGCysO1QPGCtNE=;
 b=PRhj7ohXwj3kkdfx0to3IrE0vuH4JPfgEmN4r+Fkz7QaC90R9Jx036qqxlphxq5ozp
 coTqVhY13VVSYX4eh+/U+Plq6weilrvhuZa3roeDWRZDhe/raol4nnMXKSY77LaZgVOc
 0sg0yVQDIE1gZ/SzP1NVQO/YI8elWzWhRUz80URkkGvcsMGD11v3l33fTl9hk0qKqS/c
 KQxwuzJIm5KB4cm9nb1pcPbDL/OuUgYosn1+y9oq40kSj0wh1tg0d7AhZeWPRmkumLs9
 DsZ4Im+IrfFolL43TUtlcAOKK3P6cbs8Q/2EfMssXaUd8VBzzyqywiyQJZ/0UZwpL6r3
 f+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P00Nt+KeWeWNDZD/WYZHk0mydxgmnXGCysO1QPGCtNE=;
 b=onchpx57JhYG6CVcsz7PzAFdd7T1juYbj1LdyccCyzmhYVM5YCVoD5ybmyZxTa76RZ
 /YcpT4+v4K5Q0AVk779u0zcR7svC/QLb97I7gvyJc4ONyidhacDC2G/Q5E3P+OqL9lNp
 FSPKk1E/euJWm1dcZyyICgIx4glqgPaoFt2JS23CBnLB82KdarWnwXuJFUB2sUA0a12U
 cQYCIpzx74G5khDAgHxz/k2XTXc7NoREPjuzK2/BtDv/yeWfv4BIMV9l3BMI7iEqFj8D
 2IfbMETJOmjFhRGrPjxLkq/zSIHud5zs2vO6p6Zpl3Dykk1FkuUX48ru+KOCUFQFiUB0
 CkpQ==
X-Gm-Message-State: AAQBX9dDjUkWtlYzR9+Bmex+B4mrmgPAirooNPtKhaNjQ8rxn/iklpiU
 M1fKAHaGhe7dVeZCNdmzvUaKzw==
X-Received: by 2002:a05:6a20:8f02:b0:e9:14e9:46ee with SMTP id
 b2-20020a056a208f0200b000e914e946eemr12514650pzk.28.1681175187664; 
 Mon, 10 Apr 2023 18:06:27 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 26/54] tcg/s390x: Pass TCGType to tcg_out_qemu_{ld,st}
Date: Mon, 10 Apr 2023 18:04:44 -0700
Message-Id: <20230411010512.5375-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: 2eUDGOVpTT68

We need to set this in TCGLabelQemuLdst, so plumb this
all the way through from tcg_out_op.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index b399798664..d610fe4fbb 100644
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
+    add_qemu_ldst_label(s, 1, oi, data_type, data_reg, addr_reg,
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
+    add_qemu_ldst_label(s, 0, oi, data_type, data_reg, addr_reg,
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

