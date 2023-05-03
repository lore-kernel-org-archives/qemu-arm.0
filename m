Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2648578ejm;
        Wed, 3 May 2023 00:00:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ689aqVOGkk7286qEem/gwGYNUVMdlSdu4GNAlBzrPMycY84obGyi6TIkIjaWGPmv9VuTVS
X-Received: by 2002:a05:622a:489:b0:3ea:8224:b5b4 with SMTP id p9-20020a05622a048900b003ea8224b5b4mr32297914qtx.9.1683097238082;
        Wed, 03 May 2023 00:00:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683097238; cv=none;
        d=google.com; s=arc-20160816;
        b=UbFjVR2mj/zwfqWUOsxnc0rTdIhZl5HztAKudx+tqqCoZmXjAwQbWDUKm2H3X8lmUf
         +QJcV+cE/YE7gQNrTF0t2d/rwoQ4xqwPotdxaL6fT75fKeR07cHB3K/WVEDpKsMg8NDP
         vkfuybEmLg0MahNAzw1LEMGLwyAAMsSTGFP1+fvluPeVjJZjNg+K6TVOvP8wyQ7YSvKE
         4WWdqeqEmQxejR1TQx/ZWA53iq6aCBSGO3Oz6YaVhlinT6dvu7IFljkIXGvFiHAzUlhk
         1XCDv58uwtV8aubK2GGz7j6mXRXB4xGMNKnjahMSujQFIStF5ReD/0E4wbMZhal681Tb
         PAwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x6nk5/t6hIQSKL184WGvYaEyCfzzvv964RsZWo7l2GI=;
        b=wyao8aaNUG6k+E/wOM49XsjThbzz7DAqKlnRApBLvtbSmz6RuOrpF8tHVxG25YV3Dg
         E5U4e7PBg5yXRoM5vhmB7aZqSq3TK1qV6bzNFHcX16xXYdYxU8hJK3ljK9PhpfJ+igUU
         40uQ4OTGxbtT5ksr05L23QzNeAp3C3G4RqD5NsqMeGPmjdf3OGGVDbhFH8JZUM/WzHbP
         jw71G7qdI60X1QmGwpf4ETzES2J57fANtUIqsQcL7hJ8Qhi8yX21uzyF0JT1YzS3Qybd
         dSfHn6G+XBdddowuUDxegIaEbWf5TACgh0svDUkoydQwst6eLQuArdmY1xuQBWqz1VMB
         WEpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gIciM5J0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17-20020a05620a0c1100b00746ba8f91a8si17674878qki.498.2023.05.03.00.00.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 May 2023 00:00:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gIciM5J0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6Qq-0007Uc-08; Wed, 03 May 2023 02:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qn-0007SY-OW
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:57:41 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6Qg-0001fg-Tu
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:57:41 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3063433fa66so1510363f8f.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097053; x=1685689053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6nk5/t6hIQSKL184WGvYaEyCfzzvv964RsZWo7l2GI=;
 b=gIciM5J03PdLz7MhEvap20sQyTL/otIv3RCAYdOHK3Co7Hf8IdxXkmy5HsfwaiGt33
 BhIAjoRLgrxHqozlUhi6emTsXAbhdVJpNgUuL90YAFIBTW6/OLPEMg8y+aHuYGWP4Fws
 maYzuihHHeNPaJoHLnyqgSAHJrlrnix2BvEh5J+BCBhTelbtp1NzpkoxpCudyZW/eyQU
 5jaExLa4Ii6BYdkgEdod3b1E5ieSjMsZcQp+/G5mAwEvlmF9C3VE03H6jqoJrceiK5nt
 BLwKMU7bP8+5fFPE5aI5WsyzS/MUISLT2LQB1ekDW5rwoaXxyHLu/6iQviVmutXCi2BJ
 fYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097053; x=1685689053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x6nk5/t6hIQSKL184WGvYaEyCfzzvv964RsZWo7l2GI=;
 b=WczB4iPP3aAXZ9DD740WFy2N3MTXCa5ApwfzjX+ys8UDFDktYz+9v8lAmVkHzEyg/a
 2N+QHPFcLteZJNgofMeA1N0FHnUJt6tC6WV77VR5PmWOWH5Ga6CKWMdgP+ePU9r/li+o
 ZGTG9RuQtRqMWuvEwCpffbnNHDlbrZe5xKh20WiWt1Nk66WFSoUQROU6FuF/tM57RcMM
 SMm8INjskrMnBXlRIfZ4EO034HPTdHvYDanVUMHpa1ds7ViuYyIIH0qHTLwxkI0zPmgF
 lpPynWeY318kTXUZ5ResSYCzx6nm0LM5H4fvtaafe9CHjlY8yJztgKitc+beqG6+YDcp
 l9/g==
X-Gm-Message-State: AC+VfDwWxcqnm0mZP/cNYcx9N7JEqjcfXrpGA82ldOqsVEs6t7U+ozAZ
 WI9Jc41RNBKFRcRKNOlibM0YIWv5LqJxRCoAQ55KNw==
X-Received: by 2002:adf:dd52:0:b0:306:3bf0:f1ec with SMTP id
 u18-20020adfdd52000000b003063bf0f1ecmr1996327wrm.7.1683097053202; 
 Tue, 02 May 2023 23:57:33 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a5d6646000000b002f6dafef040sm32796617wrw.12.2023.05.02.23.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 23:57:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 04/54] tcg/i386: Drop r0+r1 local variables from
 tcg_out_tlb_load
Date: Wed,  3 May 2023 07:56:39 +0100
Message-Id: <20230503065729.1745843-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503065729.1745843-1-richard.henderson@linaro.org>
References: <20230503065729.1745843-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: if07pmytOwCQ

Use TCG_REG_L[01] constants directly.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 909eecd4a3..78160f453b 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1810,8 +1810,6 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
                                     int mem_index, MemOp opc,
                                     tcg_insn_unit **label_ptr, int which)
 {
-    const TCGReg r0 = TCG_REG_L0;
-    const TCGReg r1 = TCG_REG_L1;
     TCGType ttype = TCG_TYPE_I32;
     TCGType tlbtype = TCG_TYPE_I32;
     int trexw = 0, hrexw = 0, tlbrexw = 0;
@@ -1835,15 +1833,15 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
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
 
@@ -1851,19 +1849,21 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
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
@@ -1871,8 +1871,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
     s->code_ptr += 4;
 
     if (TARGET_LONG_BITS > TCG_TARGET_REG_BITS) {
-        /* cmp 4(r0), addrhi */
-        tcg_out_modrm_offset(s, OPC_CMP_GvEv, addrhi, r0, which + 4);
+        /* cmp 4(TCG_REG_L0), addrhi */
+        tcg_out_modrm_offset(s, OPC_CMP_GvEv, addrhi, TCG_REG_L0, which + 4);
 
         /* jne slow_path */
         tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
@@ -1882,8 +1882,8 @@ static inline void tcg_out_tlb_load(TCGContext *s, TCGReg addrlo, TCGReg addrhi,
 
     /* TLB Hit.  */
 
-    /* add addend(r0), r1 */
-    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, r1, r0,
+    /* add addend(TCG_REG_L0), TCG_REG_L1 */
+    tcg_out_modrm_offset(s, OPC_ADD_GvEv + hrexw, TCG_REG_L1, TCG_REG_L0,
                          offsetof(CPUTLBEntry, addend));
 }
 
-- 
2.34.1

