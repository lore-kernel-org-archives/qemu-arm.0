Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2596231ejm;
        Sun, 23 Apr 2023 22:43:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZX0UKUM7CvvCq5oxiTitDXbKD4ZxvmVfp7FmFvo4L7qEnnt0nS0IFEfKkIPCuElXWt9FA4
X-Received: by 2002:a05:6214:d0c:b0:5ef:843e:4e87 with SMTP id 12-20020a0562140d0c00b005ef843e4e87mr22301718qvh.43.1682314997996;
        Sun, 23 Apr 2023 22:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682314997; cv=none;
        d=google.com; s=arc-20160816;
        b=kghNHP0C+5uXAI/aRSot6+IpWrXmSzOYnRdKdHrySWBl01k/85vcBEJ1FWf36JN1JN
         vwpyjVUkaT+lTfMjq142xOgLxPk5T3XEuqEMgVlt8RAZkidFS9tp81orpajB8uIykNqZ
         t7JM9UNE/X7uQmxLz8gPX0+AaQrzBNoKajUsz8Cn89hONzODX6rxSqvrfIS4T5Kf0vzv
         IXYSWMY/OZZqag8qrMP5q7p5NSNW2+b8nPu4oegiKIOAKy2fq+kW3x9z4TO5ZvNnCcgn
         CxGKehrCWTwhMaHFgOV2C1VQe3HSVphYgaKDJ6u6Z7ekuOOqIplRZwD3Fp5xSb/f7KGW
         rDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DrJzjH8IZNJFUh651D62ccr1sIbRumHAtxHaJjoHMgY=;
        b=rbGFTUTAr+wPLk+O07qhJs6DdYy3VlYsovi+Eg353qLoVGr3PIln+Ppatkx+Yhf+oF
         sSxWCN/mxMV6zDG7x2boLfbHRjLdJeR3un6M2U83hAEtKGdz8iYZHVNc/u80Ne8BZufj
         Ors4W2rXEz5XTMxxIUzGuOzWmH4oIPF4wdX4WXTpTTfwuyXTe6zS3PefnUjv8uT53C78
         xkU1+ePJtSdRei45iiBgLjqGAanM7F/6Q294IsU/sxy3gIBChZ/13P5XVA2TjFGqmKrE
         gApMQmFAv82kyLsDFxihIIoa5gMJkxzwEx6hCnNtDAJQJMBGKiSQxchOLBCaa3WjJvnk
         5TwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c85MFEtH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a0562140d6400b005ef85b53a54si7102914qvs.4.2023.04.23.22.43.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 22:43:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c85MFEtH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqoxA-0005Og-5F; Mon, 24 Apr 2023 01:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox5-0005Js-Bw
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:27 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqows-0004GY-Gg
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:41:26 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f4214b430aso2317577f8f.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314871; x=1684906871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DrJzjH8IZNJFUh651D62ccr1sIbRumHAtxHaJjoHMgY=;
 b=c85MFEtHFsWLIv+UlVFh5F6GA6w/hwnShW05tlZT+8XoQNQbzuQfASnbbalo83pLAf
 Ih5tXA4h5ObhOxSZrUXqZFbvEuXn0K6IRcnuOFBfHEThOfRtBFhmQSrytGztXJZGMJ9+
 N538PvO/7Bvo2Luldu1epSsRhf1HmPwQhRfTMSb/5MzhzXHYRuZlzE5XwNG2E6T3EdrJ
 aBkoZn1fIZ0YE+tu1KQMljBMIruZ8iCgLz8vHrnxXc2BrsT68hG8OH8r1fe8A/GPJleP
 6qzFgoTGIs4JGjDj78bvyxBvOJP9pBXbxNjbJJuzVGQw2NSYqqAO/7K5haN838iqmeVM
 BUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314871; x=1684906871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DrJzjH8IZNJFUh651D62ccr1sIbRumHAtxHaJjoHMgY=;
 b=XJmUIYGOY2uRXvSfJfzUbpex0IGOXNTP2G7OoUsGP4i4YQybwequMi9mgTbwwmr9J0
 Ne6XOX5oIuxhlpBVgxl8tK9oJNoaPk7Uy8x4qjIsSmgOJ65A38GAjDyPqIDISjmQWmLK
 KgI/n5pSd38Y4SMnQfXMgbdi3zp/kF4pRkyK9uhxsHT86D/H59swenKOEDMbwltLms3I
 IKmtx7aJeoF3C2KwZtPJyY0+hfwmY9z+MUPlFwH4qZbvxr7xN/gdw5VB7ZfhCcSih26x
 6WOFYmBIZurIo5TXVPgvgIqTuGwFTAECYJmjQzAMZRHFZdKvugnH3yUcFF5gYVYdYWkj
 lK8w==
X-Gm-Message-State: AAQBX9ccU8eVmyH6S+s6diwv/bGCdnyKbuLw2pHlzQTNZxuKwx6/J153
 Chr6V1TyAaFiEROzLgFgsCF5gPggaQoVCNW/j1qHVA==
X-Received: by 2002:a5d:6445:0:b0:2ff:3f47:1e99 with SMTP id
 d5-20020a5d6445000000b002ff3f471e99mr8412256wrw.41.1682314870982; 
 Sun, 23 Apr 2023 22:41:10 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
Subject: [PATCH v3 08/57] tcg/i386: Drop r0+r1 local variables from
 tcg_out_tlb_load
Date: Mon, 24 Apr 2023 06:40:16 +0100
Message-Id: <20230424054105.1579315-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: pMlh8xI/pmGe

Use TCG_REG_L[01] constants directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index b6750c364a..7a02f79f1b 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1812,8 +1812,6 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
                                     int mem_index, MemOp opc,
                                     tcg_insn_unit **label_ptr, int which)
 {
-    const TCGReg r0 = TCG_REG_L0;
-    const TCGReg r1 = TCG_REG_L1;
     TCGType ttype = TCG_TYPE_I32;
     TCGType tlbtype = TCG_TYPE_I32;
     int trexw = 0, hrexw = 0, tlbrexw = 0;
@@ -1837,15 +1835,15 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
         }
     }
 
-    tcg_out_mov(s, tlbtype, r0, addrlo);
-    tcg_out_shifti(s, SHIFT_SHR + tlbrexw, r0,
+    tcg_out_mov(s, tlbtype, TCG_REG_L0, addrlo);
+    tcg_out_shifti(s, SHIFT_SHR + tlbrexw, TCG_REG_L0,
                    TARGET_PAGE_BITS - CPU_TLB_ENTRY_BITS);
 
-    tcg_out_modrm_offset(s, OPC_AND_GvEv + trexw, r0, TCG_AREG0,
+    tcg_out_modrm_offset(s, OPC_AND_GvEv + trexw, TCG_REG_L0, TCG_AREG0,
                          TLB_MASK_TABLE_OFS(mem_index) +
                          offsetof(CPUTLBDescFast, mask));
 
-    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, r0, TCG_AREG0,
+    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, TCG_REG_L0, TCG_AREG0,
                          TLB_MASK_TABLE_OFS(mem_index) +
                          offsetof(CPUTLBDescFast, table));
 
@@ -1853,19 +1851,21 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
        copy the address and mask.  For lesser alignments, check that we don't
        cross pages for the complete access.  */
     if (a_bits >= s_bits) {
-        tcg_out_mov(s, ttype, r1, addrlo);
+        tcg_out_mov(s, ttype, TCG_REG_L1, addrlo);
     } else {
-        tcg_out_modrm_offset(s, OPC_LEA + trexw, r1, addrlo, s_mask - a_mask);
+        tcg_out_modrm_offset(s, OPC_LEA + trexw, TCG_REG_L1,
+                             addrlo, s_mask - a_mask);
     }
     tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
-    tgen_arithi(s, ARITH_AND + trexw, r1, tlb_mask, 0);
+    tgen_arithi(s, ARITH_AND + trexw, TCG_REG_L1, tlb_mask, 0);
 
-    /* cmp 0(r0), r1 */
-    tcg_out_modrm_offset(s, OPC_CMP_GvEv + trexw, r1, r0, which);
+    /* cmp 0(TCG_REG_L0), TCG_REG_L1 */
+    tcg_out_modrm_offset(s, OPC_CMP_GvEv + trexw,
+                         TCG_REG_L1, TCG_REG_L0, which);
 
     /* Prepare for both the fast path add of the tlb addend, and the slow
        path function argument setup.  */
-    tcg_out_mov(s, ttype, r1, addrlo);
+    tcg_out_mov(s, ttype, TCG_REG_L1, addrlo);
 
     /* jne slow_path */
     tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
@@ -1873,8 +1873,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
     s->code_ptr += 4;
 
     if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-        /* cmp 4(r0), addrhi */
-        tcg_out_modrm_offset(s, OPC_CMP_GvEv, addrhi, r0, which + 4);
+        /* cmp 4(TCG_REG_L0), addrhi */
+        tcg_out_modrm_offset(s, OPC_CMP_GvEv, addrhi, TCG_REG_L0, which + 4);
 
         /* jne slow_path */
         tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
@@ -1884,8 +1884,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
 
     /* TLB Hit.  */
 
-    /* add addend(r0), r1 */
-    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, r1, r0,
+    /* add addend(TCG_REG_L0), TCG_REG_L1 */
+    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, TCG_REG_L1, TCG_REG_L0,
                          offsetof(CPUTLBEntry, addend));
 }
 
-- 
2.34.1

