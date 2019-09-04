Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1156734wrp;
        Wed, 4 Sep 2019 13:19:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwCd4WnWh53dBGa6j9Ux4NoXzTZ0rtjtQSS7ndfvyD3oQWZbVP54N8h6CoPEtFhPTuh67Xc
X-Received: by 2002:a17:906:959:: with SMTP id j25mr11521264ejd.51.1567628395071;
        Wed, 04 Sep 2019 13:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628395; cv=none;
        d=google.com; s=arc-20160816;
        b=vjB+qVYMKG7Kfho2Lipq8s41UmRR9CfXyKIxFsOEZRnki8dxqkTAc6e7e3LVaUU3ew
         XpwyZnVFwSWWw81mf26/KswrHelYKbrydItcKYeH+ADiZnTsoR2bGZNpk+UHH+GcAb82
         P6GUEmY4W1LZvHEUjD8EOrWkZu1l4TcJ7D+pT8Jt5NngJdweOLA/G6gbUWLdnwsqbJsr
         f5qrnLgAxNo6xEDWdt78pNqL5Ibe+jEhFACc4lqn8Y273/qXEfiWVf3kGQVUMgh/cJ09
         noNq5AeuU29yhTURN12zODGBNCtcLlFvmCCbC7Kf66HeUEm415wtslP/5gThptibBTOt
         j+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=852c/awIgTh3C7GCCijbpsvu4SQYTMvdpB+Gb73lAXI=;
        b=vUKf00vxI7rvBlTTYGcVuhZ+rVohxiEkoe+bI9qKKZys3iRZKMUbbaPvz3RkFGsX6T
         gruWdiXbPW6L5qDPtS86S4ZHJ8mVBvWNdLS5VVUUlZk0pXNsGRxNKFE5mNAshUGsw52V
         LDhGmyjnLcbXD/Ng2j9CICNLossqe8bMfhvJVtb1LHnVCBs3uALHXVKYwVv52DiZ8qCp
         Qag0HN8D8eaunloOq5wjovjs8xTw5nuY7sKpzQZ4moF36lbFB4dg6C2DX4T0vGbdKlmi
         DbRS8cb8mLwOTm3b0N+I2MKPjtdYxtS8jJxtdmsdNF7DGoExYn4R0//KBPsIuNYBi5lO
         9QAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PleWZl9q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10si6943035eda.293.2019.09.04.13.19.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:19:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PleWZl9q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bkv-0005Hv-Kv
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41352)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0z-0005Zm-23
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0v-0003DP-04
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:24 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35057)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0u-0003CH-Gr
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:20 -0400
Received: by mail-pf1-x444.google.com with SMTP id 205so11460321pfw.2
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=852c/awIgTh3C7GCCijbpsvu4SQYTMvdpB+Gb73lAXI=;
 b=PleWZl9qI/5fL2wLcpKqsJ8ESef2Xs/+UqLlIYlBv486L85cjw0mwEhgUe5LivT+kB
 fzqBmsfz+wd9FNF0sOFv7nEB9TT4wfoNJu5W+18J5bQuD/Z6FuyUUde7BoalePU1pePs
 u4EOBOevVKvmam3MZc0W1Z4yg9sdGrwKwW9F7GZqc76AivWZDZsZP4skAcZDP8XXi3yS
 gZKqUQCifRb0usqtCeQvZOfYvvUXk3aqJS7UacBKUYFQ1CuPWMLUlhlHDgpBPd5MJSZu
 PO7kMYKoFOC8TpFoum7iRm4OAAQ/9aN1fscqP2SyfpuY6FPmpvc4dMW4AFBtw0UTTqUO
 OnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=852c/awIgTh3C7GCCijbpsvu4SQYTMvdpB+Gb73lAXI=;
 b=VplrvaeevTBsK34PKg+VZ0CUBSAqTopukYv6tw/RgnS/IKkT3m85/25Gg27b5/soy/
 Pk0w/3xPnA6dst/1blHtLsQYnubHUuMgvIBpuF1peVHM/86PzBO8QBuwX1pDToA2SL0s
 fVJJRLqxl9OQo3e8gAISzHPfBRKBuLNERswEOLCNqkh0XrvGavExuViMlkpHMRCCVCWE
 +aIqO1M6vtKBsspz3m/UlFzpzjjWRBfQTrUThVKetyM2SqTA+g8aDV3HYTqdKqt8CCSU
 OoP944ypTSmYgUrCmUnb2MSTiER9djp35bmfa5osTTi48H81z/YCsnxJgKzXV3O+QsSk
 WRWQ==
X-Gm-Message-State: APjAAAW8k0XinHQ68aUPvIr8baRXB55ccdBqmamQ9ddeDJ79R5OAWoGi
 wpg/m6ZOAm5mox8vH2y9JZjkNvdvJhw=
X-Received: by 2002:aa7:9508:: with SMTP id b8mr31575939pfp.36.1567625539480; 
 Wed, 04 Sep 2019 12:32:19 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:52 -0700
Message-Id: <20190904193059.26202-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v4 62/69] target/arm: Convert T16,
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
X-TUID: ViBvR8ZQi2Ql

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 +++-----------------------
 target/arm/t16.decode  | 12 ++++++++++++
 2 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ed52018c17..a4844992d5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10721,7 +10721,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val, op, rm, rd, shift, cond;
+    uint32_t val, op, rm, rd, shift;
     int32_t offset;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
@@ -10860,28 +10860,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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
index 55fadce223..cbc64f4e48 100644
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

