Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3203466wrs;
        Mon, 19 Aug 2019 15:21:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxwm/W6WE3HjOdOu4ZNMNvukUEjkH9odVOp859Ds4MNfn5OXPY8KuawVz+qOqGht7rnznUD
X-Received: by 2002:a37:c206:: with SMTP id i6mr15911052qkm.384.1566253283287;
        Mon, 19 Aug 2019 15:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566253283; cv=none;
        d=google.com; s=arc-20160816;
        b=kPXVK9ShJ2WsN2VFQEcfo0vrB4Pi1gATH4ir909V2tUVWNzWCDxws1jWWANhs9/W6z
         s5w5WGRT+mYSH0CmQoW+EmCuiMednVp5sil0Hl2yVgxArNLls3yI60+fjQx83pUKoe0I
         mA35rklxn9VrQL8t8uN0UgKIep4f61kyBi7OWFjhSmpCNyhkE0FcE12XVZaK1yrwFvHF
         LUADbUeRyiLmsoEQUyP/UDRR7+dA4E2vl2RM2xtZa6IJiZ3I4uOEbVpg5xNamLbgGo8Y
         Ww3Xtdp8RW7v7zIk0O/8C7Dmy24IjpxWKh/+emAedYeTwS9rbPL2XraE0/8eVu8TgPlc
         eZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=M247+waxxQ2hFTPZWsca/mTPO3c20Nu5WDueYuMimjE=;
        b=ctLzRnAPBe2RgqVo2+ySQPbdfm1lmQw0zxPmYeyZoB6IP5AdRIlFZed1r0cOwGCNt6
         u72khxMDcW41bqv/5mcYMSJHmI9Zoav6QoCgQuKJhiHSbPL0Iv9Y0wgW/579nA5fctHm
         2re9ip2kLQYYWh1/wnt1d/zlNQLFyr/trqVw/P3wfzWtvYKsEqpTK83vWbevLvBcAbZK
         0s5tSTzNwphe8XfqGKO7e8orWIp/xxyFElkYwDCu47qzV3tnRQgm2lzx+MPD62X/CYL/
         D31FG2zb/8JZmBjpOvcB8i+J6Vy5nSRxJHOvBiRr3s7G8Lo7wSTME5U7OWwYiMBTrvVr
         m48w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AandmyT7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si9025208qkn.31.2019.08.19.15.21.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:21:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AandmyT7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzq1i-0001PR-5l
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60062)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMw-0002we-Up
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMv-0006v8-Kx
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:14 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41909)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMv-0006um-FV
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:13 -0400
Received: by mail-pg1-x542.google.com with SMTP id x15so1927946pgg.8
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=M247+waxxQ2hFTPZWsca/mTPO3c20Nu5WDueYuMimjE=;
 b=AandmyT7HPMjVSMaMH89CbOA7ivydNTRJGV69ZnPB33Knv3spsaObO9fJHxCyJ7/l1
 nV/hSRmFRr+WSoSW387d3RH0+qzzajBgZe+/CddOlZDTi6T2UZSynWAyz+abBVI95SiY
 +ODJY9wy0XQzWLpabMjRwckvUoRM+5neoq++vttpBJxaq8yM2kPDED2xhcpTEwnccX+M
 ag3VIICw0fgSpHe4W3RqlBdJqhaO6lZ9SsgJOg3GT/77PDKm8zkQWyzN7Q2iwt22sin8
 3Mt6Q6K9uvytPrWa3dr5ld6jz8VaFzFMBtshg1dW6h7iUnQlO+K6PCZOIVIOQlJd0hWV
 SSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=M247+waxxQ2hFTPZWsca/mTPO3c20Nu5WDueYuMimjE=;
 b=bAbJTYWTlMBf5rDIiLcfP+4wb2tu1Gz3QJ9hOKJkxuDyLD60UClih9wa+AGD5s9KNI
 /mCoYto7CW0ma0bkqwFLAd6cMTgY9NWpVWdQAEaRKsUxIiL9CWG++Tq8xiTHs8Upq7Qg
 0yu14ClrLBF6mTL+gcGXVh8d4rdWi8HwIL+jrKeTBhxSKL+iK6cXNEzd7ZBWbgYSt+cq
 qXuKSXfvEm3h0p5xwIKNZ99r+Myh85eyb34e09oGXPuGTA/sBjPaOwyDNNyVhR9QouB2
 S30pXARXft1xO11BptrIqjtwnzqzNH9BhhjJku8mjwc4uDr16gaxFDQvdKQClAkDylT3
 uOig==
X-Gm-Message-State: APjAAAUwMduiqLjE0FOBu57y60D+FPv2BGO74aCWAjJ1MQJm+biCeSsu
 sI6tbLdEgNQGQkVGHVtEBlZc3A==
X-Received: by 2002:a63:3203:: with SMTP id y3mr22153883pgy.191.1566250752576; 
 Mon, 19 Aug 2019 14:39:12 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:39:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:48 -0700
Message-Id: <20190819213755.26175-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: [Qemu-arm] [PATCH v2 61/68] target/arm: Convert T16,
 Conditional branches, Supervisor call
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
X-TUID: fVgfG539fGK3

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 +++-----------------------
 target/arm/t16.decode  | 12 ++++++++++++
 2 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5f876290ba..941266df14 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10599,7 +10599,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val, op, rm, rd, shift, cond;
+    uint32_t val, op, rm, rd, shift;
     int32_t offset;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
@@ -10738,28 +10738,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         }
         break;
 
-    case 13:
-        /* conditional branch or swi */
-        cond = (insn >> 8) & 0xf;
-        if (cond == 0xe)
-            goto undef;
-
-        if (cond == 0xf) {
-            /* swi */
-            gen_set_pc_im(s, s->base.pc_next);
-            s->svc_imm = extract32(insn, 0, 8);
-            s->base.is_jmp = DISAS_SWI;
-            break;
-        }
-        /* generate a conditional jump to next instruction */
-        arm_skip_unless(s, cond);
-
-        /* jump to the offset */
-        val = read_pc(s);
-        offset = ((int32_t)insn << 24) >> 24;
-        val += offset << 1;
-        gen_jmp(s, val);
-        break;
+    case 13: /* conditional branch or swi, in decodetree */
+        goto illegal_op;
 
     case 14:
         if (insn & (1 << 11)) {
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index d731402036..98d60952a1 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -28,11 +28,13 @@
 &rr              !extern rd rm
 &ri              !extern rd imm
 &r               !extern rm
+&i               !extern imm
 &ldst_rr         !extern p w u rn rt rm shimm shtype
 &ldst_ri         !extern p w u rn rt imm
 &ldst_block      !extern rn i b u w list
 &setend          !extern E
 &cps             !extern mode imod M A I F
+&ci              !extern cond imm
 
 # Set S if the instruction is outside of an IT block.
 %s               !function=t16_setflags
@@ -231,3 +233,13 @@ STM             1011 010 ......... \
                 &ldst_block i=0 b=1 u=0 w=1 rn=13 list=%push_list
 LDM_t16         1011 110 ......... \
                 &ldst_block i=1 b=0 u=0 w=1 rn=13 list=%pop_list
+
+# Conditional branches, Supervisor call
+
+%imm8_0x2       0:s8 !function=times_2
+
+{
+  UDF           1101 1110 ---- ----
+  SVC           1101 1111 imm:8                 &i
+  B_cond_thumb  1101 cond:4 ........            &ci imm=%imm8_0x2
+}
-- 
2.17.1

