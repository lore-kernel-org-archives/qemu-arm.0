Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2655177ejm;
        Wed, 3 May 2023 00:14:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7nYokbT8tx3AnFPZBMoC9lPA//Slivkytwpt05n3IqdzSUB6ojRPzGkVTpWHT7Nqn3YtMm
X-Received: by 2002:a05:6214:628:b0:61a:197b:60b with SMTP id a8-20020a056214062800b0061a197b060bmr8144336qvx.39.1683098077155;
        Wed, 03 May 2023 00:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683098077; cv=none;
        d=google.com; s=arc-20160816;
        b=QFDiK4VEAzfC3BjC4vkwpbQMFua9L01bbXD51UaXS1trDVz0f61qwNDYP7mP1r/9Rb
         EeC26Z/BO0HbFqxYiWzJjzhAJQNIacyxUiycKc2o+X5SWZnoxpemxIsrkRprsdXDQCCp
         fEIgdQPSaTmveN0F5+EaCNjmvdH9/9y6+R6XR+GwoVa1+KGEHLAWYjaVAP2vKaMqEJEe
         cxW2X27lcr4kTsSDMxtXc9bT7+/DShTRiLO7ePaDcvj9PCsXT/+nR7Lrq6wEzPvPaeq6
         jnCrQMo+96MW2N+AjD8zYcvWhZIQoM0z5uorB30R/zOVjEGYnWNBYMx7bgIrYT5L74KT
         a/sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tw0I+ADtSsoTUZP6PXChoGX/kwSbfoaMV4Di5FGXG0I=;
        b=YwsMLg1/OcEtcoQP6zeoYPN7sJb6+zAhfAOXAXaNAvAAWfglquWTMjpx0uPx/iJP2A
         rBGRF5a8PJdfOsFnWHLluiITu0f737k+eVGSQC2YL25PZ/SEYt7/S/ortHk9OhDxu/Bv
         5T4/YAorOXncmSQofVJQGz9iUua6939ymmHrpeR6XnAAwwmry47HAaSJvXRKXQn7DKgU
         Lg99loKDE16qsMdhALCtcadWemEjNZBFhcPIQUQorpPwqd7jmXYYGFUqQCdGMK5corO0
         I/KU73GVlT4z0o4wupAfOnFFEqLgTcapJmTUwmh2uqFYPYNpJbQ3fAjU90TUowc1rUwx
         3zUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fwc9zbfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gs4-20020a056214226400b006194232aa85si2968159qvb.528.2023.05.03.00.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:14:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fwc9zbfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pu6dp-0004XZ-L9; Wed, 03 May 2023 03:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dN-0002qk-7u
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:10:46 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dH-000731-Uo
 for qemu-arm@nongnu.org; Wed, 03 May 2023 03:10:39 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so49087675e9.1
 for <qemu-arm@nongnu.org>; Wed, 03 May 2023 00:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097831; x=1685689831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tw0I+ADtSsoTUZP6PXChoGX/kwSbfoaMV4Di5FGXG0I=;
 b=fwc9zbfEUwtfnGlWwuG+P6ZbcQaKq1wfCvN+bjePFqM7/htQPSXRa9UuF0FwCkttDO
 NG4c6Ft3DcBwmfwJoWaVnzFv/3AU1SgIsIfHSSm95lO/q7AQbV1WPJ0c2H11rbhcbHog
 S6DMjopqMkugCz7wr//9HJZ78I3sBKWUqodXNrJ9/MKO2NsV8ldxO/iRCmcJnqJC6Sen
 9vliFiQRHqMWdoWqZ+SHmw8yvIHFW/HA76WCPaVzxgpldPNDIfAwTnIS/5d5MwajQKk5
 Juwcg+Yya+7ZZ/19vnZ/O1s7jj9qa/AfF6x35MRF0U2XxTbo84sSCutLf2U8q8/DTOB8
 /+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097831; x=1685689831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tw0I+ADtSsoTUZP6PXChoGX/kwSbfoaMV4Di5FGXG0I=;
 b=G/FY0q9agtlpa5W0VEOaRgI9xmOpym3/A3jRJlNhEEpUm52M74tn9T2NrDOxDBt6Rs
 HURSNidWEIpKV20pzdkLjoyGJXAfKwd18rOHMk3Pf2KxNcLGqtA3+YpbCS8XlTisdEby
 jTNIU2TiHabAFO2ZPkFPTWUvh6KRC7bpjVIjqOmoJSidEGrBM8QuDasHqEoigJYMUL5v
 +JzP13AHzNfci3OujQR4It+skon1g/l9Q2OHD0UXLFYsP0aFU3jwRK4wQN1hjsuKtyEP
 xpXRoXDdn/qHwXMqgXQ7Tkv7P6zDH8lLCauBcx/DnPOH7vsMBbxAD1/uiLm4D6lkktzR
 8nYQ==
X-Gm-Message-State: AC+VfDwdkgrZ+gfPHCWGFnH2J2CTnsL7PBOThJjL0XYoQUfL/s6Kya/6
 9HQSQF2CiNIelp2ahGBMgbT0bQ==
X-Received: by 2002:a7b:cd82:0:b0:3f3:3cba:2f1e with SMTP id
 y2-20020a7bcd82000000b003f33cba2f1emr6261301wmj.23.1683097831328; 
 Wed, 03 May 2023 00:10:31 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 44/57] tcg/aarch64: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:43 +0100
Message-Id: <20230503070656.1746170-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: TUtlZ20n5y5s

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 38 +++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 8e5f3d3688..1d6d382edd 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1593,6 +1593,8 @@ typedef struct {
     TCGReg base;
     TCGReg index;
     TCGType index_ext;
+    MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1646,8 +1648,14 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
-    unsigned a_mask = (1u << a_bits) - 1;
+    MemOp atom_u;
+    unsigned a_mask;
+
+    h->align = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                      have_lse2 ? MO_ATOM_WITHIN16
+                                                : MO_ATOM_IFALIGN,
+                                      false);
+    a_mask = (1 << h->align) - 1;
 
 #ifdef CONFIG_SOFTMMU
     unsigned s_bits = opc & MO_SIZE;
@@ -1693,7 +1701,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
      * bits within the address.  For unaligned access, we check that we don't
      * cross pages using the address of the last byte of the access.
      */
-    if (a_bits >= s_bits) {
+    if (a_mask >= s_mask) {
         x3 = addr_reg;
     } else {
         tcg_out_insn(s, 3401, ADDI, TARGET_LONG_BITS == 64,
@@ -1713,11 +1721,9 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     ldst->label_ptr[0] = s->code_ptr;
     tcg_out_insn(s, 3202, B_C, TCG_COND_NE, 0);
 
-    *h = (HostAddress){
-        .base = TCG_REG_X1,
-        .index = addr_reg,
-        .index_ext = addr_type
-    };
+    h->base = TCG_REG_X1,
+    h->index = addr_reg;
+    h->index_ext = addr_type;
 #else
     if (a_mask) {
         ldst = new_ldst_label(s);
@@ -1735,17 +1741,13 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     }
 
     if (USE_GUEST_BASE) {
-        *h = (HostAddress){
-            .base = TCG_REG_GUEST_BASE,
-            .index = addr_reg,
-            .index_ext = addr_type
-        };
+        h->base = TCG_REG_GUEST_BASE;
+        h->index = addr_reg;
+        h->index_ext = addr_type;
     } else {
-        *h = (HostAddress){
-            .base = addr_reg,
-            .index = TCG_REG_XZR,
-            .index_ext = TCG_TYPE_I64
-        };
+        h->base = addr_reg;
+        h->index = TCG_REG_XZR;
+        h->index_ext = TCG_TYPE_I64;
     }
 #endif
 
-- 
2.34.1

