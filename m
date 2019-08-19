Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3205485wrs;
        Mon, 19 Aug 2019 15:24:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwmmmJREYpBT3BOU9xRCsOhnHIZk1scJsVAVXblPQA2dnqWN0uxzTTFGZokesX1pQPDkdVI
X-Received: by 2002:a50:94ad:: with SMTP id s42mr28446223eda.283.1566253448237;
        Mon, 19 Aug 2019 15:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566253448; cv=none;
        d=google.com; s=arc-20160816;
        b=VJfMWJ4YMkz59vPOvABV7dJrDzDW8um/MCQnZT4yI+T0TQRT1UQVNWXofrVkC1cQ0l
         CMtWuq0Nfn4BxGA6UV9F6WOtMNpoDd1sqZWu/QZr1LktDDpw9dqyJFQaHYfqhHknkT3E
         ybrk5SzWPXlSPP8Zb8OuHeoys+qX6prFe/kdQpWZt35TkF9Q4DHIvobeaYsY9L0vr/MJ
         2oS8cLQatvfeh4p8T0rWvW2ik1DwHuGHNrLO/BUZ6ahY+SxHAPrpliqcUGGHE5D4IPAP
         GdJmcylFMSyfGOAHfvu2cfzBwkdrfC0n6ayKbefXi7exkxkzL2mYud3gTcmsqykWANTd
         tF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=t3Sk/E++ZxrnmWMmhTr25Xzz1GIdoAzJpID10oiImmY=;
        b=T6Z+lIXSGKKQopslmkkPxCuE/TZq57e445681fjw38E4Ed3DrTa3QWdrXq4WbxD0ap
         nIm9nNnsW8gUM26QEnkGVzcA/XS8Kgswsaauh2phAoG78VYqvDQFJcFFyGwJz2JiKG1q
         8xOqC7srj59N3xA0fIBt8qeFMPwBLqR9htDL/HK9UllvXH+ci1EcGD76SAPoNZ8nNWBe
         9rALqbqUKGGx+BPhO5o+i3Jhuk38bB/7E42iJCtWfNeKWb4nmptSlvgM2T9i9MmEgBla
         9/QcZ31zfJQylI4LnrKCBXAUnc1WV+0VkJpaxLD1YEyS5paIBeAL3H9qR6Q+CzsGKPgg
         Pzbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ok3UFEdR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l52si8338092edc.248.2019.08.19.15.24.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:24:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ok3UFEdR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzq4N-00063p-9W
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:24:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMj-0002XE-SK
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMi-0006i3-B0
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:01 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:44546)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMi-0006hm-4r
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:00 -0400
Received: by mail-pf1-x442.google.com with SMTP id c81so1937229pfc.11
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=t3Sk/E++ZxrnmWMmhTr25Xzz1GIdoAzJpID10oiImmY=;
 b=ok3UFEdRGD0YJd50WuI90ajBk8TNZGyW8QH/1774NdQnLoVOk0cW+80VXhPKHOm0Bj
 Pr3bjHt/4LTtedHVGCkro5MdQQzYzyRMRFiwdbKaGmc1TDEwCYKToWdFxLpf5jX0IgMd
 qwoCY2aEVfCAo2e4KotWxk+LohIDwv0yRTm9qF+kPjtHsZtZ6IPTbQWmOgLYueK0RnZP
 nLtOoVdiaxe7ialYgoI+h4Kc2W3ICzdaac47K/GGJqm/dPyC3sK3T0y2Hao5TUUid7W5
 4Izauc/CShQ9Vqlr/8rvpsoxgGMIEZB8lWXcx2/+vLI4i3BJlNhYE+Vwpw1ZfCTe6mjQ
 QKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=t3Sk/E++ZxrnmWMmhTr25Xzz1GIdoAzJpID10oiImmY=;
 b=ePsFK+DBKzFGbCGNYwlJNirrLJLxAR9eeIoATn97IyO0MfXFRzAey9EvaGwV8V3u9S
 9b0WF1u+6WRQ3PlFxTJFakfwPyiRwmEEbNOC5waMi03bZgFSb8/J0+rNj+waO0UyPHJ+
 k8hOq2jWIKikJn2s1b/aTWqTUWa55p+nQyjCbvew5gF8N/Op8wtMFYzOC0RZwiqmOu8A
 9l7Eu5APvbHW7p/XfI7lqA71iQCOYGG0GVo1JFv6t/RZBjlbo29XfbBt5o4vxzAKFe39
 4+kn/+g3eZ1oI6iMtUvm2zQI6prUqW2DslcgBESWN98A+v1U84/o2H9aeCpeeDEe5hGE
 zhpQ==
X-Gm-Message-State: APjAAAXTfLD8ZLq/JflUNwif2RMKu6x0syYHEzxY6rL8X35uUI1363hp
 p3SiEsDLs19+4gkkaZlsclSmCw==
X-Received: by 2002:a17:90a:4485:: with SMTP id
 t5mr22658907pjg.65.1566250739222; 
 Mon, 19 Aug 2019 14:38:59 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:38 -0700
Message-Id: <20190819213755.26175-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-arm] [PATCH v2 51/68] target/arm: Convert T16 one low
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
X-TUID: 2Msr+EsWXEb/

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 44 ++----------------------------------------
 target/arm/t16.decode  | 11 +++++++++++
 2 files changed, 13 insertions(+), 42 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6f30415371..3a3b113822 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10586,48 +10586,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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

