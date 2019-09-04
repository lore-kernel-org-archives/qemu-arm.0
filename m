Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1160439wrp;
        Wed, 4 Sep 2019 13:24:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzs/AVwxuvYlxL6eZWWmsfd+9e3pT864O/S6bEZiQN9oFdb7jqCR6bWhIuqX1d9CD8gNSSz
X-Received: by 2002:a50:ea8d:: with SMTP id d13mr115644edo.83.1567628659829;
        Wed, 04 Sep 2019 13:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628659; cv=none;
        d=google.com; s=arc-20160816;
        b=I7QBE4A8Qd/ZCtrUPGuPzOhdzZmBpWz6HW5cSQql+cwWC/rRRULAH+BmKkMJrROcqo
         jKgKjRgnBoX96RppAWT+fWj9fIKEMs81IPepnQYcjNgomvgmt84SfrTeRHNrDQMBP/3T
         aVHJLjzdK+aPQubHlCA09qcFEgMU9nFn+aMnwhdGIMTN0WU7BFTBtfsgcx6t0/J31I5b
         8vxkMO1SwKctMk2jAzQ0x6CGXWDBVDAgrVPJRSO2fqmhlPHix6vWA0t9gkSEqYbKV7Ah
         E5EqR1YB7Oa/zl7Pu97ZGi97A2riUNdtzOSvBLTEA2PQCNgjwiuSdGMkhMHuD0qb5H/s
         Af1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=2ZLJXIt+PxkZztXfn8SSMwPCXqB6/2ClBwSngJqOcn0=;
        b=spgSuekMYcwfu+GjBeD7A7jSjqXkLhZqwC+weKjQ6fDJT6MMtO9p0TjcMXTbfWih8e
         bXt/bmRNpPVAN3DPRmJE3fJiPyuTlSk1fBCuPWIgW9ZHMbOAvwvFoCVaI/L4Yu2Poze6
         7i3kXEDOHF1cSHtKyfbnpGRmC5H731EKnKWfmodfS2fODgrzrFSxUOXUgpVyV1ZNSSx3
         cKpq2e6WgopGXdB5NbYAeXzAzNymMDocvaUGrEB0NiAOVazthoG/jPv4blMS9WpHTx+5
         +F1dPmB5g1jn0aZNbBHfSUQIisuSTc5UYceg+YYbfenroDnuZciFB1ul3jSU151EJ+ug
         HwSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NaaG8ZLN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p4si57309eju.313.2019.09.04.13.24.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:24:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NaaG8ZLN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bpC-00013I-9A
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41164)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0t-0005Ue-Fz
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0r-00038C-6L
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:18 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41614)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0p-00032a-2Z
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 15:32:16 -0400
Received: by mail-pf1-x444.google.com with SMTP id b13so7278059pfo.8
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2ZLJXIt+PxkZztXfn8SSMwPCXqB6/2ClBwSngJqOcn0=;
 b=NaaG8ZLNhX8Qy2ol5roo4uPyavVNw2s6y1m3T9xd2N3wMDU/P596CPskjDAgFJmw3Q
 mCtHHONltqaXLZcA1TP8V+EQi4Fkiw/28RNF0WPYYtyuxsZwpLONazBFcGyim+V3dGgy
 B1XsGdEqXHrYMP3dTJv510w+5EkbpPakTdMHFnelX/qwEHl7C9ccYdMkneoOD2+moDx4
 hnyQFhhoRHF2f3HXoKu6G0I6dXwTsFtslsi57bek3IsFuV4oPGXOaTMYkuxT5jlmAiJn
 FHEkvaW+H7fbvN5aCUgRbXAODP83H/JjyqNR/YqWOMBUdErbQFdIa8JLLvjrxdNKe9Br
 HxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2ZLJXIt+PxkZztXfn8SSMwPCXqB6/2ClBwSngJqOcn0=;
 b=T4D8mSPpvYwgPUeL2KyvQlkJdZcJclXLgMJg0+WjF7VVoXMTpi+etoAoy+kliGnuzP
 AdYLK/nXNpprY6LzaUgJATR+IMDTZACrRueNP3Kuzuil3hGUhrNiS3ZaBOnLvsfwdUsx
 mXwJXtBZYNyf5Rtpu/XmT2MKph5HvL6ifWnqPMxm10pUFUKYtiwtM2PuIw2F4OkMuZ7C
 rxpQ1QyBR/qf2ELceRnqHThU/uGD+bdCg5FNJXAlmI8d/IlVfZODvmiRY+gnADz3RPG3
 GfQICeR0o1WsWdLuWTOwItP9LBqkcB+x4NpGXlGNDqbaYyN3czQV0H89ZTwFjmgcEC/x
 1VMg==
X-Gm-Message-State: APjAAAWd4qOU5ecB4fV0QaCd/0JBzG7tMiTzk5XOhZpPVlFBOVYbocwY
 cLCHWIwc8s9NPkHYoH5i+e1E17UrHag=
X-Received: by 2002:a63:e306:: with SMTP id f6mr35952958pgh.39.1567625529806; 
 Wed, 04 Sep 2019 12:32:09 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:44 -0700
Message-Id: <20190904193059.26202-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [PATCH v4 54/69] target/arm: Convert T16 add, compare,
 move (two high registers)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +qJ/qKnNjQP+

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 49 ++----------------------------------------
 target/arm/t16.decode  | 10 +++++++++
 2 files changed, 12 insertions(+), 47 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e6ef935247..73c8863134 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10745,55 +10745,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             store_reg(s, rd, tmp);
             break;
         }
-        if (insn & (1 << 10)) {
-            /* 0b0100_01xx_xxxx_xxxx
-             * - data processing extended, branch and exchange
-             */
-            rd = (insn & 7) | ((insn >> 4) & 8);
-            rm = (insn >> 3) & 0xf;
-            op = (insn >> 8) & 3;
-            switch (op) {
-            case 0: /* add */
-                tmp = load_reg(s, rd);
-                tmp2 = load_reg(s, rm);
-                tcg_gen_add_i32(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                if (rd == 13) {
-                    /* ADD SP, SP, reg */
-                    store_sp_checked(s, tmp);
-                } else {
-                    store_reg(s, rd, tmp);
-                }
-                break;
-            case 1: /* cmp */
-                tmp = load_reg(s, rd);
-                tmp2 = load_reg(s, rm);
-                gen_sub_CC(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                tcg_temp_free_i32(tmp);
-                break;
-            case 2: /* mov/cpy */
-                tmp = load_reg(s, rm);
-                if (rd == 13) {
-                    /* MOV SP, reg */
-                    store_sp_checked(s, tmp);
-                } else {
-                    store_reg(s, rd, tmp);
-                }
-                break;
-            case 3:
-                /* 0b0100_0111_xxxx_xxxx
-                 * - branch [and link] exchange thumb register
-                 * In decodetree
-                 */
-                goto illegal_op;
-            }
-            break;
-        }
 
         /*
-         * 0b0100_00xx_xxxx_xxxx
-         *  - Data-processing (two low registers), in decodetree
+         * - Data-processing (two low registers), in decodetree
+         * - data processing extended, branch and exchange, in decodetree
          */
         goto illegal_op;
 
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index edddbfb9b8..5a570484e3 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -146,6 +146,16 @@ CMP_xri         00101 ... ........              @arith_1i s=1
 ADD_rri         00110 ... ........              @arith_1i %s
 SUB_rri         00111 ... ........              @arith_1i %s
 
+# Add, compare, move (two high registers)
+
+%reg_0_7        7:1 0:3
+@addsub_2h      .... .... . rm:4 ... \
+                &s_rrr_shi rd=%reg_0_7 rn=%reg_0_7 shim=0 shty=0
+
+ADD_rrri        0100 0100 . .... ...            @addsub_2h s=0
+CMP_xrri        0100 0101 . .... ...            @addsub_2h s=1
+MOV_rxri        0100 0110 . .... ...            @addsub_2h s=0
+
 # Branch and exchange
 
 @branchr        .... .... . rm:4 ...            &r
-- 
2.17.1

