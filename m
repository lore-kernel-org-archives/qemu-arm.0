Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp649162ejb;
        Fri, 7 Apr 2023 19:44:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y/UXUEhiyFAbuFwab1sZWcNEfnpuJRc7Uxh4vI7qla2g454xlbb/A16EYWkb8CdJJSfBzA
X-Received: by 2002:a05:6214:5294:b0:5b6:eef9:b8f7 with SMTP id kj20-20020a056214529400b005b6eef9b8f7mr6922499qvb.6.1680921892357;
        Fri, 07 Apr 2023 19:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680921892; cv=none;
        d=google.com; s=arc-20160816;
        b=V0GXixzh/CNgwDIWkN1GV5VGncNdbf2TLyRrE/yc1ofvmDg+foe0OOFgXZNbNnAm8W
         tGgrud2lu642yJkEIcujU1GLK5VXTy11W9XhXJy8EwUN3cgpmemytDtZ9izgTfHbVzdt
         AeKXTWB5x4XFFaw/qq6rjgYISvb1wotPQBFG4UpYlKowsysjxyFC9dNMF7FtqyMpO5lu
         Y3L3Zo5dH7IczmtoM6sDPVxLes7R2DCzhxfHqk0xE4L5C+932nZ9G3zUQht0FTnCKNVn
         QsnANdUFIyUeFLV4KW5GNT8HrE356UvccEqNzN6Tq7qDqkvK547cg5WlNdjVQKn0pb8n
         7h4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=v1FKEPnLDJAj/yYVllIJiIXirCKiRcnvS7tDELskOLA=;
        b=JThJ6bEC7oQoAn4mSTDUPY5YfdaaN3fRy7kmrLQIDNGuoYXkZCF1VZ/JQrUUw9HJTW
         ECIh0pqtmAPGR+S20jvZToLZhBHJX8Ez+00aXo8QACXYGsFovSrih2sArYOq8kH2hRyY
         /rNvihjgUijFYgGjYxtJ7IQkUG4HnhIppBc2qk7mN+VSD90QBaHy8unaiEjKWMnlxnKO
         I0aI0vsjDPish3e4waOm83161bOv019nYzFxvB33nLIjHfaD7lYY9k2ZI2th5R9KIOhO
         LsRYQ/5yYCTeqrUAoZGFv2T1FeZ9m1U5CXkAFEB+jvJx1h22kd+JgRa9UOwL5yv7Di1R
         YhzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DHujcaH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1-20020ad45dc1000000b0056ec2d9f293si3692055qvh.344.2023.04.07.19.44.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Apr 2023 19:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DHujcaH3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pkyYl-0007yC-RU; Fri, 07 Apr 2023 22:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYi-0007uN-Hg
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:08 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyYG-0005m9-QL
 for qemu-arm@nongnu.org; Fri, 07 Apr 2023 22:44:08 -0400
Received: by mail-pl1-x629.google.com with SMTP id e13so57124plc.12
 for <qemu-arm@nongnu.org>; Fri, 07 Apr 2023 19:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1FKEPnLDJAj/yYVllIJiIXirCKiRcnvS7tDELskOLA=;
 b=DHujcaH32y4Zna1dz1MkOyyv60Bg2NPIiAmQwTOSqaG7Pxbg7U1TjILh0iD0xt5Y5x
 cEwwRReqyIEt3rgWzw0iPhMEpb1LgSQp9mflVoRvY9j0B8M13zv6ZQWdJEG33UWE0y9A
 yGniyV8PORKD8TKFNhr5ZDQWE2IhFTQVH8u10+17MDdIYTI8it2l6eb5j4rqgAjidndq
 mSNnOwiMhL77omghATzozmADNTa6pMYIoaClcmVlxgWhByDTlMfB056P2LHxk0SlsD6O
 WigdbRwFa5+poGkgSvne7Rx6ulDwQfbmzz1s2xHI8smtaAnMBFVe+Q6iUJfEs/SDf0cK
 tr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1FKEPnLDJAj/yYVllIJiIXirCKiRcnvS7tDELskOLA=;
 b=gcajzFFL5AQUzqRp32TT994C8qwqV1KES5kZz5/gf3Py4DL6N/Zpziak9Nmld6NVQr
 9gBcuKZqM9ue8GODVBbGk7EhpOn5C19fQFa95ZUPTClHStd4Qs1twnaeRH1NtvgdfTHd
 ie5c91x9vwa+T09db4hrFDhlo9yyfKDxxrEtptfC2myhDU9kd3xfZEyV5F6X8IUrIqgR
 B+rufku9mBPsebaiLgNqigs/5hrMUoFlHvIZrq6izv+DTSu/XoUggN1nFGUHo2PE0cAJ
 bo9WuMDDjfMQwhbB8tiMfbQz+VyzecOLjlhofv1HkT2D216vusaW8sRnlOjN4AG9+3YN
 FZMA==
X-Gm-Message-State: AAQBX9c17U4RkdAB2R6zk6R2U0wEXUHCPgGpY6MvTiCVANWhyTfNm45+
 wbjs1g/RCTwBU0TPfLINmVJAHA==
X-Received: by 2002:a17:902:da8a:b0:1a0:5524:eb8e with SMTP id
 j10-20020a170902da8a00b001a05524eb8emr5964539plx.68.1680921819421; 
 Fri, 07 Apr 2023 19:43:39 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 26/42] tcg/s390x: Pass TCGType to tcg_out_qemu_{ld,st}
Date: Fri,  7 Apr 2023 19:42:58 -0700
Message-Id: <20230408024314.3357414-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: 1U9bXZN2LrQ5

We need to set this in TCGLabelQemuLdst, so plumb this
all the way through from tcg_out_op.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index b399798664..77dcdd7c0f 100644
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
+                            MemOpIdx oi, TCGType d_type)
 {
     MemOp opc = get_memop(oi);
 #ifdef CONFIG_SOFTMMU
@@ -1916,7 +1917,8 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 
     tcg_out_qemu_ld_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
 
-    add_qemu_ldst_label(s, 1, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, 1, oi, d_type, data_reg, addr_reg,
+                        s->code_ptr, label_ptr);
 #else
     TCGReg index_reg;
     tcg_target_long disp;
@@ -1931,7 +1933,7 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 }
 
 static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
-                            MemOpIdx oi)
+                            MemOpIdx oi, TCGType d_type)
 {
     MemOp opc = get_memop(oi);
 #ifdef CONFIG_SOFTMMU
@@ -1947,7 +1949,8 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
 
     tcg_out_qemu_st_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
 
-    add_qemu_ldst_label(s, 0, oi, data_reg, addr_reg, s->code_ptr, label_ptr);
+    add_qemu_ldst_label(s, 0, oi, d_type, data_reg, addr_reg,
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

