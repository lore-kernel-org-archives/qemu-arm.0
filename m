Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1156373wrp;
        Wed, 4 Sep 2019 13:19:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwRAWiW2QZpcsFB/zmOBofMViBREspJqjDXQcuDhmYY8lQ8uepI6JjHvaxQSn960rg4CmQo
X-Received: by 2002:a50:d556:: with SMTP id f22mr64482edj.263.1567628368637;
        Wed, 04 Sep 2019 13:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628368; cv=none;
        d=google.com; s=arc-20160816;
        b=r2O1nLYF0kNrupszSXzs3jdP2XqXGGvC18rj2dgHInv/yWZve16eVUwwiIU5kXac0a
         6MQE0THK4eE1rutTZWJQyqrVzcMgrI8H5RSdToU4cleUcl/wuNJv79HIutptXB3mHVM3
         PKA9zTQeMlKaIHrp7lAONPZb5CbcZK2IRg9VjVUyMZvq5scMpawVOanNCtteVAOH64RR
         Aq5UKZW/fCCnwPxwA2o3JOSHiUe2Y9S5e8k1vO68tqGTFTNKA6IviywmukUcbLvd6LX+
         iIeLbxr26G/hUjVaizGWn72WAdeM/Cw8afoH70gmI/pIVdET8Rz90oYj9BPc0h7Z0KRR
         kUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=GTpzfRqA1Z7CTTR4kjGQDvZeJQsqYpR7KKBaZOTKQX8=;
        b=q2MKH0D3pM5JHdKaJ7Csfoh0S/PBAUuBSFVCnfnrQ3ekZiu6P8AVzJwe9mzpD+B5hT
         TZFhZbr4Rhn1McdcnayCyg3NwSUq52AW2lAlWXCjjEFbL1TN0IchQw5KuIGeir5fCvag
         H2pKF0pToo8m0g6aQMVUsVvXLnLjxZBY8ETF9V0ALV9JEhI/fqBHTeBQ/7xSiOVWvie3
         6xq9AUBo+BagHBeFhix2IHi14TCItZbkTOjvwzBKJTpqJlSbNxd/OxR5VgTB7UvVHVOh
         2y2HkotWikRAUzhAclPEtE23S2FRwCOcEnGy+2qP/3m6gPjJoxPVVfvaNcYbc/SIL2OY
         Pa7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xBr3jDB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x21si72638ejs.66.2019.09.04.13.19.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:19:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xBr3jDB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bkV-0004Yn-4B
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41151)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0s-0005Ti-Rf
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0r-00037v-38
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:18 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44458)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0n-000307-7V
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:15 -0400
Received: by mail-pf1-x443.google.com with SMTP id q21so8879894pfn.11
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GTpzfRqA1Z7CTTR4kjGQDvZeJQsqYpR7KKBaZOTKQX8=;
 b=xBr3jDB+VGXTWDyJtijhac1nLdzJw0dR9/idz0hu1xY62fYMdAqnpwxvJT5mP76+xC
 5GtUs8+hfRtJ6q4YZxWFsSW1rbvBHLFvizZPdrRCAEDEUw/FbEylHgNZJEMURJ8SlnkQ
 65HA6LJFKtgMlJpDPJORWkGXjrlIRYHgroIAHN7m65QvRD4Adzd27TD/kJ0rva2HN2/i
 fwosAVB8e9Ph9G0b1+ZTQDKg/MzXAc9HwVPIQLbxsSfqn5jkaY1lrsv26EF8P5n+Iefg
 facNsKao72OMYvDwYrtbAddx+bUzAiFv27Ds6xZD8w6UrwaerIhS7oKI5BxnrT+c2hAB
 YRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GTpzfRqA1Z7CTTR4kjGQDvZeJQsqYpR7KKBaZOTKQX8=;
 b=cWzdL5NQlsTY/9Mdl7N5tYWvuqKpeUZJMreTBlWJNOdTlmCej+B0aaEEeMjIRKJHU7
 Qsbh6Jwq7pvjD1ZQdyGntHtLSbN8mY97BNrtYHjj1coqLQKCNQz9ffKwnkbyhRjeth09
 UVSp+/lMzh5p54tkgCI4w+W+h38OFUNQoHjJdWEGrxtOcRNGUBvYty2qUJgvPyI52OEA
 l94A2tfEGNewlmf1abRcSN9boSQfYK0X8qfOUMDKr4Za3KzKl7BIP3yqOXFmLm4NLfz/
 4AKaYjrRUCMG5rEeqMH0npiYfk811OGp1YdqsgJGGo06xX9HeTGnMLoNL3hR3tPzHfX5
 esEw==
X-Gm-Message-State: APjAAAX1iKQRCLX9CTRP111CNGus23dWAZzjiz7PWZIxKy8YmN23HdZE
 x1QgQ6PdyV8ZG70rPMHI6TXnYj32Vlo=
X-Received: by 2002:a63:5c1a:: with SMTP id q26mr19300441pgb.19.1567625527220; 
 Wed, 04 Sep 2019 12:32:07 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:42 -0700
Message-Id: <20190904193059.26202-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH v4 52/69] target/arm: Convert T16 one low
 register and immediate
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mosr1jdnC75Y

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 44 ++----------------------------------------
 target/arm/t16.decode  | 11 +++++++++++
 2 files changed, 13 insertions(+), 42 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 45d617a2d3..405176527c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10705,48 +10705,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             store_reg(s, rd, tmp);
         }
         break;
-    case 2: case 3:
-        /*
-         * 0b001x_xxxx_xxxx_xxxx
-         *  - Add, subtract, compare, move (one low register and immediate)
-         */
-        op = (insn >> 11) & 3;
-        rd = (insn >> 8) & 0x7;
-        if (op == 0) { /* mov */
-            tmp = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp, insn & 0xff);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp);
-            store_reg(s, rd, tmp);
-        } else {
-            tmp = load_reg(s, rd);
-            tmp2 = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp2, insn & 0xff);
-            switch (op) {
-            case 1: /* cmp */
-                gen_sub_CC(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp);
-                tcg_temp_free_i32(tmp2);
-                break;
-            case 2: /* add */
-                if (s->condexec_mask)
-                    tcg_gen_add_i32(tmp, tmp, tmp2);
-                else
-                    gen_add_CC(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                store_reg(s, rd, tmp);
-                break;
-            case 3: /* sub */
-                if (s->condexec_mask)
-                    tcg_gen_sub_i32(tmp, tmp, tmp2);
-                else
-                    gen_sub_CC(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                store_reg(s, rd, tmp);
-                break;
-            }
-        }
-        break;
+    case 2: case 3: /* add, sub, cmp, mov (reg, imm), in decodetree */
+        goto illegal_op;
     case 4:
         if (insn & (1 << 11)) {
             rd = (insn >> 8) & 7;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 2b5f368d31..0654275e68 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -133,3 +133,14 @@ SUB_rrri        0001101 ... ... ...             @addsub_3
 
 ADD_rri         0001 110 ... ... ...            @addsub_2i
 SUB_rri         0001 111 ... ... ...            @addsub_2i
+
+# Add, subtract, compare, move (one low register and immediate)
+
+%reg_8          8:3
+@arith_1i       ..... rd:3 imm:8 \
+                &s_rri_rot rot=0 rn=%reg_8
+
+MOV_rxi         00100 ... ........              @arith_1i %s
+CMP_xri         00101 ... ........              @arith_1i s=1
+ADD_rri         00110 ... ........              @arith_1i %s
+SUB_rri         00111 ... ........              @arith_1i %s
-- 
2.17.1

