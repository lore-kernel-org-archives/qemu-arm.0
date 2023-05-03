Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2660904ejm;
        Wed, 3 May 2023 00:28:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4egZI6f4jTNVFMUM3kGf0U+0ikeVGGGgDyBDaGsSMAZGNchQov6cj0GpBOfA+RJaTcLV9i
X-Received: by 2002:a05:6214:c47:b0:5f1:606b:a9c8 with SMTP id r7-20020a0562140c4700b005f1606ba9c8mr8312674qvj.22.1683098910226;
        Wed, 03 May 2023 00:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683098910; cv=none;
        d=google.com; s=arc-20160816;
        b=HRI+1likg1QdlwOg1SpGzY7NCXU+H8EC10VA5AYUyoGtwLjdpwdeI/zW5YNYCH8cOE
         RAgu6sCG9Eq/ETnMZu8WPfYmxWX994LEPBxcAZHV7lsalBNDpGK1cB9j8XXvgzCqic8U
         ukb5WptRye2/A6bLBmT6Dq0e+U/6iMrmLuVrt0jKInzxGvnlp8tGQ5QWLOka6T1fmyfg
         60VgntY0L/dhYd2xgrPsdQe+EL2wh+EadPpWmOW9AqOEY0xaryGCylxanEX/Da1dxQaP
         Pn0OTHiZOlB2m1gpZvAxJxMxM4Lmgej+bsx9ewpVKzspMkcrE0QIDMOO7W9MCCDqYDFx
         QL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wieZHyAasr1N3tLh9UlWK+BlLvLaFAxyqWZefWKXIaw=;
        b=Yd50Tg75tN1nCKsFCdhS4piIEJFnNcDmHRgRSN9M8FQErTr8fa5eiI/jQjr2bK+MPh
         wGv3CYSy6+IC9Jkji3Tdok0eGsmPtb9pwO7QeFEzdnXVG6SIKYgKBe60mNrwWKZQ3KQO
         xkKS1nNzJG6IkSDcmEcHG/hlurYgHEu6aywP0DcV7xlJ+nKbnSEGLiRN/FA6Y/wzo6c3
         hvA946L16w2l4FuwJLNw/Mm0b61blF1qu0snzMi8jRYMthudY65lC19LUp4V1B05q9ns
         7g6i7Rk6lcxdGvId8qWCGo1Qae2X+z6FvR1X+dl9gcgg4rNaHUtz3tYgo5X3vclvCvjK
         sqYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pfi9xVFy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo27-20020a056214501b00b005a225f9142fsi18863659qvb.39.2023.05.03.00.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:28:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pfi9xVFy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6RX-0008NW-8P; Wed, 03 May 2023 02:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6RV-0008Kd-7y
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:58:25 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qy-0001iF-4S
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:58:24 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fd8so28939995e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097071; x=1685689071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wieZHyAasr1N3tLh9UlWK+BlLvLaFAxyqWZefWKXIaw=;
 b=Pfi9xVFyrMKTQg3EiZvhlLosZHAZtgqRISZpfeGDPsbczHhMK+63axZ7HL42X5GyJK
 uXIh+x9XwyHh0IOIl1pPMQjTt/3UD89jW225iWz7ZBO1AruYzvpffwsgIO+25ay1mmyV
 E0GY0x8f/1F6FebPJT4Z9a47vPB3s4r2TM6hec8eRR+B5r4J48qSVD1KWhG5EbUcrdNM
 7+GabP1wbpSrEs0o1sfMn16ImW6xKoXdpI54AJ50DQic0Wi+TRtY2opxktGlI3PI3noc
 pr4oHXJNRbRKmk1g0yMRViDBcNF5ekYDV4tzC5lN3CuIA7XnoiZl91aSo5g45KVX8oQf
 h4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097071; x=1685689071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wieZHyAasr1N3tLh9UlWK+BlLvLaFAxyqWZefWKXIaw=;
 b=hRnLq8rEACPQ885OzXOKgj7LTS+A4LLoSD2LqAG3i21LW4naJPhmboLgBb48aw8Fpo
 91ymfV+yt7deu1QKf91+AYlqsdORhV+RsoefgKagqwNKI41MqBWqdH9KMpZVtozYHNrR
 onC4jFmB19A8sv+7+L+bq/1EmQNHwZsfy7J3o5ubdDO9gDQugckWAd3p2wtQw31IVULO
 kYb+L8DPpCVHLHREmU1EnYslPfPGIUFTlfKjOw5LBzkG3jxl62KNXpHyRFiL6a3RQG3F
 TO72fFPBezH4zUJUbYXYK7Cm14zFOUuS5qVrmyiYk/2Czk2r9WHix+drDt/wlaWOHzuS
 6AHA==
X-Gm-Message-State: AC+VfDyJF5iGxvssArdakZS2ketPDPNBfkeBwuhwt9mz1E992VHUHitj
 YyrvIWjTeCszKnVp2Lqor2DfgfNiVQ+4awzbVkMSkQ==
X-Received: by 2002:a5d:42c5:0:b0:2f7:a333:8cab with SMTP id
 t5-20020a5d42c5000000b002f7a3338cabmr13325454wrr.71.1683097070971; 
 Tue, 02 May 2023 23:57:50 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 26/54] tcg/s390x: Introduce HostAddress
Date: Wed,  3 May 2023 07:57:01 +0100
Message-Id: <20230503065729.1745843-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: hkxNlvI0+kzU

Collect the 3 potential parts of the host address into a struct.
Reorg tcg_out_qemu_{ld,st}_direct to use it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 109 ++++++++++++++++++++-----------------
 1 file changed, 60 insertions(+), 49 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index e931f0cde4..da7ee5b085 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1606,58 +1606,64 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *dest,
     tcg_out_call_int(s, dest);
 }
 
+typedef struct {
+    TCGReg base;
+    TCGReg index;
+    int disp;
+} HostAddress;
+
 static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
-                                   TCGReg base, TCGReg index, int disp)
+                                   HostAddress h)
 {
     switch (opc & (MO_SSIZE | MO_BSWAP)) {
     case MO_UB:
-        tcg_out_insn(s, RXY, LLGC, data, base, index, disp);
+        tcg_out_insn(s, RXY, LLGC, data, h.base, h.index, h.disp);
         break;
     case MO_SB:
-        tcg_out_insn(s, RXY, LGB, data, base, index, disp);
+        tcg_out_insn(s, RXY, LGB, data, h.base, h.index, h.disp);
         break;
 
     case MO_UW | MO_BSWAP:
         /* swapped unsigned halfword load with upper bits zeroed */
-        tcg_out_insn(s, RXY, LRVH, data, base, index, disp);
+        tcg_out_insn(s, RXY, LRVH, data, h.base, h.index, h.disp);
         tcg_out_ext16u(s, data, data);
         break;
     case MO_UW:
-        tcg_out_insn(s, RXY, LLGH, data, base, index, disp);
+        tcg_out_insn(s, RXY, LLGH, data, h.base, h.index, h.disp);
         break;
 
     case MO_SW | MO_BSWAP:
         /* swapped sign-extended halfword load */
-        tcg_out_insn(s, RXY, LRVH, data, base, index, disp);
+        tcg_out_insn(s, RXY, LRVH, data, h.base, h.index, h.disp);
         tcg_out_ext16s(s, TCG_TYPE_REG, data, data);
         break;
     case MO_SW:
-        tcg_out_insn(s, RXY, LGH, data, base, index, disp);
+        tcg_out_insn(s, RXY, LGH, data, h.base, h.index, h.disp);
         break;
 
     case MO_UL | MO_BSWAP:
         /* swapped unsigned int load with upper bits zeroed */
-        tcg_out_insn(s, RXY, LRV, data, base, index, disp);
+        tcg_out_insn(s, RXY, LRV, data, h.base, h.index, h.disp);
         tcg_out_ext32u(s, data, data);
         break;
     case MO_UL:
-        tcg_out_insn(s, RXY, LLGF, data, base, index, disp);
+        tcg_out_insn(s, RXY, LLGF, data, h.base, h.index, h.disp);
         break;
 
     case MO_SL | MO_BSWAP:
         /* swapped sign-extended int load */
-        tcg_out_insn(s, RXY, LRV, data, base, index, disp);
+        tcg_out_insn(s, RXY, LRV, data, h.base, h.index, h.disp);
         tcg_out_ext32s(s, data, data);
         break;
     case MO_SL:
-        tcg_out_insn(s, RXY, LGF, data, base, index, disp);
+        tcg_out_insn(s, RXY, LGF, data, h.base, h.index, h.disp);
         break;
 
     case MO_UQ | MO_BSWAP:
-        tcg_out_insn(s, RXY, LRVG, data, base, index, disp);
+        tcg_out_insn(s, RXY, LRVG, data, h.base, h.index, h.disp);
         break;
     case MO_UQ:
-        tcg_out_insn(s, RXY, LG, data, base, index, disp);
+        tcg_out_insn(s, RXY, LG, data, h.base, h.index, h.disp);
         break;
 
     default:
@@ -1666,44 +1672,44 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, MemOp opc, TCGReg data,
 }
 
 static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
-                                   TCGReg base, TCGReg index, int disp)
+                                   HostAddress h)
 {
     switch (opc & (MO_SIZE | MO_BSWAP)) {
     case MO_UB:
-        if (disp >= 0 && disp < 0x1000) {
-            tcg_out_insn(s, RX, STC, data, base, index, disp);
+        if (h.disp >= 0 && h.disp < 0x1000) {
+            tcg_out_insn(s, RX, STC, data, h.base, h.index, h.disp);
         } else {
-            tcg_out_insn(s, RXY, STCY, data, base, index, disp);
+            tcg_out_insn(s, RXY, STCY, data, h.base, h.index, h.disp);
         }
         break;
 
     case MO_UW | MO_BSWAP:
-        tcg_out_insn(s, RXY, STRVH, data, base, index, disp);
+        tcg_out_insn(s, RXY, STRVH, data, h.base, h.index, h.disp);
         break;
     case MO_UW:
-        if (disp >= 0 && disp < 0x1000) {
-            tcg_out_insn(s, RX, STH, data, base, index, disp);
+        if (h.disp >= 0 && h.disp < 0x1000) {
+            tcg_out_insn(s, RX, STH, data, h.base, h.index, h.disp);
         } else {
-            tcg_out_insn(s, RXY, STHY, data, base, index, disp);
+            tcg_out_insn(s, RXY, STHY, data, h.base, h.index, h.disp);
         }
         break;
 
     case MO_UL | MO_BSWAP:
-        tcg_out_insn(s, RXY, STRV, data, base, index, disp);
+        tcg_out_insn(s, RXY, STRV, data, h.base, h.index, h.disp);
         break;
     case MO_UL:
-        if (disp >= 0 && disp < 0x1000) {
-            tcg_out_insn(s, RX, ST, data, base, index, disp);
+        if (h.disp >= 0 && h.disp < 0x1000) {
+            tcg_out_insn(s, RX, ST, data, h.base, h.index, h.disp);
         } else {
-            tcg_out_insn(s, RXY, STY, data, base, index, disp);
+            tcg_out_insn(s, RXY, STY, data, h.base, h.index, h.disp);
         }
         break;
 
     case MO_UQ | MO_BSWAP:
-        tcg_out_insn(s, RXY, STRVG, data, base, index, disp);
+        tcg_out_insn(s, RXY, STRVG, data, h.base, h.index, h.disp);
         break;
     case MO_UQ:
-        tcg_out_insn(s, RXY, STG, data, base, index, disp);
+        tcg_out_insn(s, RXY, STG, data, h.base, h.index, h.disp);
         break;
 
     default:
@@ -1883,20 +1889,23 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     return tcg_out_fail_alignment(s, l);
 }
 
-static void tcg_prepare_user_ldst(TCGContext *s, TCGReg *addr_reg,
-                                  TCGReg *index_reg, tcg_target_long *disp)
+static HostAddress tcg_prepare_user_ldst(TCGContext *s, TCGReg addr_reg)
 {
+    TCGReg index;
+    int disp;
+
     if (TARGET_LONG_BITS == 32) {
-        tcg_out_ext32u(s, TCG_TMP0, *addr_reg);
-        *addr_reg = TCG_TMP0;
+        tcg_out_ext32u(s, TCG_TMP0, addr_reg);
+        addr_reg = TCG_TMP0;
     }
     if (guest_base < 0x80000) {
-        *index_reg = TCG_REG_NONE;
-        *disp = guest_base;
+        index = TCG_REG_NONE;
+        disp = guest_base;
     } else {
-        *index_reg = TCG_GUEST_BASE_REG;
-        *disp = 0;
+        index = TCG_GUEST_BASE_REG;
+        disp = 0;
     }
+    return (HostAddress){ .base = addr_reg, .index = index, .disp = disp };
 }
 #endif /* CONFIG_SOFTMMU */
 
@@ -1904,31 +1913,32 @@ static void tcg_out_qemu_ld(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    HostAddress h;
+
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
-    TCGReg base_reg;
 
-    base_reg = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 1);
+    h.base = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 1);
+    h.index = TCG_REG_R2;
+    h.disp = 0;
 
     tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
     label_ptr = s->code_ptr;
     s->code_ptr += 1;
 
-    tcg_out_qemu_ld_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
+    tcg_out_qemu_ld_direct(s, opc, data_reg, h);
 
     add_qemu_ldst_label(s, true, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else
-    TCGReg index_reg;
-    tcg_target_long disp;
     unsigned a_bits = get_alignment_bits(opc);
 
     if (a_bits) {
         tcg_out_test_alignment(s, true, addr_reg, a_bits);
     }
-    tcg_prepare_user_ldst(s, &addr_reg, &index_reg, &disp);
-    tcg_out_qemu_ld_direct(s, opc, data_reg, addr_reg, index_reg, disp);
+    h = tcg_prepare_user_ldst(s, addr_reg);
+    tcg_out_qemu_ld_direct(s, opc, data_reg, h);
 #endif
 }
 
@@ -1936,31 +1946,32 @@ static void tcg_out_qemu_st(TCGContext* s, TCGReg data_reg, TCGReg addr_reg,
                             MemOpIdx oi, TCGType data_type)
 {
     MemOp opc = get_memop(oi);
+    HostAddress h;
+
 #ifdef CONFIG_SOFTMMU
     unsigned mem_index = get_mmuidx(oi);
     tcg_insn_unit *label_ptr;
-    TCGReg base_reg;
 
-    base_reg = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 0);
+    h.base = tcg_out_tlb_read(s, addr_reg, opc, mem_index, 0);
+    h.index = TCG_REG_R2;
+    h.disp = 0;
 
     tcg_out16(s, RI_BRC | (S390_CC_NE << 4));
     label_ptr = s->code_ptr;
     s->code_ptr += 1;
 
-    tcg_out_qemu_st_direct(s, opc, data_reg, base_reg, TCG_REG_R2, 0);
+    tcg_out_qemu_st_direct(s, opc, data_reg, h);
 
     add_qemu_ldst_label(s, false, oi, data_type, data_reg, addr_reg,
                         s->code_ptr, label_ptr);
 #else
-    TCGReg index_reg;
-    tcg_target_long disp;
     unsigned a_bits = get_alignment_bits(opc);
 
     if (a_bits) {
         tcg_out_test_alignment(s, false, addr_reg, a_bits);
     }
-    tcg_prepare_user_ldst(s, &addr_reg, &index_reg, &disp);
-    tcg_out_qemu_st_direct(s, opc, data_reg, addr_reg, index_reg, disp);
+    h = tcg_prepare_user_ldst(s, addr_reg);
+    tcg_out_qemu_st_direct(s, opc, data_reg, h);
 #endif
 }
 
-- 
2.34.1

