Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1877032ejb;
        Mon, 7 Aug 2023 20:13:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwyPW2tWqykkyhO3ZFURfv0DuzCrBT25TTIvAnEUgohtWRTi5ESdRo8cWqPsoKWcEx1b32
X-Received: by 2002:a05:620a:667:b0:76c:b4a0:e545 with SMTP id a7-20020a05620a066700b0076cb4a0e545mr10131232qkh.19.1691464406254;
        Mon, 07 Aug 2023 20:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691464406; cv=none;
        d=google.com; s=arc-20160816;
        b=aZmXbtc55qaBEGy0XiQoe7Gtw0kKQO7K2B12qOqyvEBLIpOBU/7sdOuqhAZaAUMNNy
         QbGJO5JDqA3Q2S4pa0P2hruaGNAFtb8jonCUB19dVEn8rmFns0jkjCfa6bjQjFjY2VCt
         kSkmUvC7BHsvSyB0DETt+9jJYOahGcFhLI2fCdMum7hnKMC1QgWDruPoDuTpIxda+WME
         eZwkAXpthQQHldbPyy9j1GyLTDPbJ1lWp8yRa58ycQkg57TFpPns8JjEUhsT7uOzMbp8
         7UYDaOk/qCMR5pVzPl8ImKmSUITHAAO085dd0o1aTed8lqUUGfLnFlplU3XfXFJE63Ot
         NfcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tmotEscJTq84Ab7ZtBPgGyq95MOlwaj6T0nGog5dLQg=;
        fh=hqs26moy805PsHbwd88lUczy2QdlfF59ojSMxj/DeWg=;
        b=xb1gvODUKWzmxM24bu68Bq8wVnTExfp3XKage1Idjof2AZ4zIpDo/Lkes6R3H6XMha
         EDcZvXWGisTUE5RQh/mniAc3nl7BSxhuhRU1fyx8eS2hX3oGW75oMyki6vrrNBidSytH
         s9hDXwpXXFE16fHvrluKgUevo1mWUkEYwKmEbHbKI/5L9l+XbsF41IZf8cmIPLyCuwx7
         /D/e2jjEjA+WehwYqd3wUomeeJgZjsbEayLxlW5K5Jkvy2gl8CKIrMumyxyQO+LxfKxJ
         vNuAhurSxWuEd4rv25AOW1VU8M7Ygb6+mgkaELWl0bO7m7xWMH88NhjxBcAhtvwVUcAY
         Oj/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ei4t0Zwi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a0ce30d000000b0063cf8faca54si5503353qvl.88.2023.08.07.20.13.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 20:13:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ei4t0Zwi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qTD9H-0002ud-F0; Mon, 07 Aug 2023 23:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8u-0001fJ-Mp
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:12:23 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qTD8e-0000Kw-3a
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 23:12:20 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6bcd4b5ebbaso3104016a34.1
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 20:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691464323; x=1692069123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tmotEscJTq84Ab7ZtBPgGyq95MOlwaj6T0nGog5dLQg=;
 b=ei4t0ZwicPFQzScsHhMe8LIs28nac0bRAwtBskP7xnTQ+Qwjf7r4r3Uhd539TsP9yu
 XP/RUJiYVMgZihgX9pR9BA0UnKoB7mML4g3sieJiyD1gW9oc7rgqH1DGYJRujtcYpTs9
 a1YPZ7o6KCzz2S0VPB2Yv9YtOWkaRe02sYOj/piIc6uOSHvji+/ENO/EFwLgVGEyIY5a
 WdyZ+KhOpn5YrFJ3HpV14c70yRo22Xck7COEn7fUAuDLLiGa9cRYBv+r6SATyJlZRVbF
 9kTBDu4t5XCe1ehp6xrtGJ8K5KJ99cLdVCJ/o+7KGk5vWH9aRqPfsDi1paaElgS8uncf
 zzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691464323; x=1692069123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tmotEscJTq84Ab7ZtBPgGyq95MOlwaj6T0nGog5dLQg=;
 b=EJ7CnJQVpejeRhETrcIN2+FY3F1aPC6heQnH2q+uwVlD+1z6vhvDxig7MFgXBl7qAC
 lfSNLti5ur49dBEEgtmJ3uyj/1TlC6HWUutLvIal5UuBZa+yqD6ikev4Hv+5rrlpHzjo
 cLThVfQgor0HrtStoaURnK4XkN/Coo2LC6oWEuOxC94vsZeEKwcN/iQvHVZNgnsMUMnq
 dMA9GF79UckuHdgGoDQRpPVgdWl3Ekzm/L5TL4ZuXSUhgDaOWkM18CYVxslQcV0nao66
 U+UTh8rULhniGFHKg5XnqYPqiCEt6OR3lUA8F/Ed9C8fcuDtKzcARjIickkT8MUlpxPy
 OJfQ==
X-Gm-Message-State: AOJu0Yzs/VMbgah4fFDD9Y76AlmU0V1ld1LyOKr27zZU3MeUy1tvsz4d
 1GZpa4Rcn18BBLaar7AoAOtsqA==
X-Received: by 2002:a05:6358:2920:b0:134:c1eb:8744 with SMTP id
 y32-20020a056358292000b00134c1eb8744mr7904903rwb.9.1691464322492; 
 Mon, 07 Aug 2023 20:12:02 -0700 (PDT)
Received: from stoup.. ([2602:47:d490:6901:e306:567a:e0a1:341])
 by smtp.gmail.com with ESMTPSA id
 g64-20020a636b43000000b0055bf96b11d9sm5639087pgc.89.2023.08.07.20.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 20:12:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 20/24] tcg/i386: Add cf parameter to tcg_out_cmp
Date: Mon,  7 Aug 2023 20:11:39 -0700
Message-Id: <20230808031143.50925-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808031143.50925-1-richard.henderson@linaro.org>
References: <20230808031143.50925-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
X-TUID: dddVwFckiE+k

Add the parameter to avoid TEST and pass along to tgen_arithi.
All current users pass false.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index b88fc14afd..56549ff2a0 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1418,15 +1418,15 @@ static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, bool small)
     }
 }
 
-static void tcg_out_cmp(TCGContext *s, TCGArg arg1, TCGArg arg2,
-                        int const_arg2, int rexw)
+static void tcg_out_cmp(TCGContext *s, int rexw, TCGArg arg1, TCGArg arg2,
+                        int const_arg2, bool cf)
 {
     if (const_arg2) {
-        if (arg2 == 0) {
+        if (arg2 == 0 && !cf) {
             /* test r, r */
             tcg_out_modrm(s, OPC_TESTL + rexw, arg1, arg1);
         } else {
-            tgen_arithi(s, ARITH_CMP + rexw, arg1, arg2, 0);
+            tgen_arithi(s, ARITH_CMP + rexw, arg1, arg2, cf);
         }
     } else {
         tgen_arithr(s, ARITH_CMP + rexw, arg1, arg2);
@@ -1437,7 +1437,7 @@ static void tcg_out_brcond(TCGContext *s, int rexw, TCGCond cond,
                            TCGArg arg1, TCGArg arg2, int const_arg2,
                            TCGLabel *label, bool small)
 {
-    tcg_out_cmp(s, arg1, arg2, const_arg2, rexw);
+    tcg_out_cmp(s, rexw, arg1, arg2, const_arg2, false);
     tcg_out_jxx(s, tcg_cond_to_jcc[cond], label, small);
 }
 
@@ -1528,7 +1528,7 @@ static void tcg_out_setcond(TCGContext *s, int rexw, TCGCond cond,
                             TCGArg dest, TCGArg arg1, TCGArg arg2,
                             int const_arg2)
 {
-    tcg_out_cmp(s, arg1, arg2, const_arg2, rexw);
+    tcg_out_cmp(s, rexw, arg1, arg2, const_arg2, false);
     tcg_out_modrm(s, OPC_SETCC | tcg_cond_to_jcc[cond], 0, dest);
     tcg_out_ext8u(s, dest, dest);
 }
@@ -1594,7 +1594,7 @@ static void tcg_out_movcond(TCGContext *s, int rexw, TCGCond cond,
                             TCGReg dest, TCGReg c1, TCGArg c2, int const_c2,
                             TCGReg v1)
 {
-    tcg_out_cmp(s, c1, c2, const_c2, rexw);
+    tcg_out_cmp(s, rexw, c1, c2, const_c2, false);
     tcg_out_cmov(s, cond, rexw, dest, v1);
 }
 
@@ -1637,7 +1637,7 @@ static void tcg_out_clz(TCGContext *s, int rexw, TCGReg dest, TCGReg arg1,
         tgen_arithi(s, ARITH_XOR + rexw, dest, rexw ? 63 : 31, 0);
 
         /* Since we have destroyed the flags from BSR, we have to re-test.  */
-        tcg_out_cmp(s, arg1, 0, 1, rexw);
+        tcg_out_cmp(s, rexw, arg1, 0, 1, false);
         tcg_out_cmov(s, TCG_COND_EQ, rexw, dest, arg2);
     }
 }
-- 
2.34.1

