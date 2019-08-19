Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3201382wrs;
        Mon, 19 Aug 2019 15:18:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzS6KM8cpHPD36Sp93TbHLjWF+3ch4plh6Nl2Nnr5ShrWRrTVC5xk4FCId9aXNKPoG44sW+
X-Received: by 2002:a0c:fcd2:: with SMTP id i18mr11932268qvq.223.1566253110950;
        Mon, 19 Aug 2019 15:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566253110; cv=none;
        d=google.com; s=arc-20160816;
        b=arjXtwa40MNfgbVqWza95kL9EyjibSSVYPnyPC07KJB7GkrCF0m3gqAPuweWD199cG
         Z8zP30aq1022I9kAvpqqrNEg1ATn7lrpe36mACkzeY2qXxZwDl3GGMGsUp21Lq+yJxor
         1b9BLz16bDRS57YQBH6RDxT1h67c+uMqALEgQvH6j7LfLfEaxG+rp3QT6vZdZIt4TbLW
         +bbjeVzOwcK/2lQ8eWsqVBx/0O685Co2Y2dtU9CWpp/uQZCeX6I3s9ZeSiiKiEW1W7Ng
         Wxw9VFovwABkDWpnQQ1OkwzsSJkEDZBazPd3amtHzL7sNmj1BHtKxOG6T8R8deBBsa1k
         +IHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Ltc+Iekt5p0qb7H2sxDb1ZsirxTTtPcO/0Q5mx5ZDAc=;
        b=fMyXB4nbsRiKnhjh3Eu9fobIY7Azx89PuQWgs7+HB+SIcbv4/7yAUNhERN4CVWWWzC
         pADlHXxH61xqdKGLgCWgiTeY32Elo6LGPN+bL7QnzdIqD1wY/KE9jjQkJfz2uvUfjm/v
         62koMAxiPpqtEWWKYlau9NuETUlHUeB+k06JfN9gOrJhA2HLLO2/1lWvXeKSQe1ukjUr
         onSnRAt1uqeJy/Xkt+/EDiIFyisejDfCtZMKthVexmaEPc6kkvjHoyfORCIahILBW+4D
         hhzZV48meJLJ9degAn2cJhRwfMt/WlMGkfnWxAYWUynTCuKbAFkvSaS0tpoFEDqyA53N
         5o/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AOqI2pBL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e127si9323611qkb.291.2019.08.19.15.18.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:18:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AOqI2pBL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpyv-00057p-Kt
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60034)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMv-0002tl-LF
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMu-0006uT-DF
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:13 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:40544)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMu-0006u7-7U
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:12 -0400
Received: by mail-pg1-x52e.google.com with SMTP id w10so1928449pgj.7
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ltc+Iekt5p0qb7H2sxDb1ZsirxTTtPcO/0Q5mx5ZDAc=;
 b=AOqI2pBLdPKE0yz8n1aVZ3uJqwZsJXfmxB/GOdPSA/hBZ4ZHHvS3ufqQp5UkDrECfg
 V0wGtku8vdSUuJptbaxjBG8OKwdpMBgOPRfShbsDFWKxScdP13IGHiwmts4mS8w3+tZt
 gENOINsYfXjz/h6CSYnxye/xwOm5Ei5n1hPrjlWAqEsbjWaPyI61DSg9tN4ti48MfAxS
 FRMmQjfYNlWoqSYSwC1oxY/Zaht33blLwN+yrHPStfsZ8jjcktDBXQ/TVYFoWetq6ziF
 ELawQecE5FboJXxauR+kHY5tdZG7lCg7cUaZ/GEjS3qfk2+pjqab+jabXBRy+YxzMYNC
 KX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ltc+Iekt5p0qb7H2sxDb1ZsirxTTtPcO/0Q5mx5ZDAc=;
 b=ON+1G0jSP0QYdTvISkXzHWguH3yNqxFKZXRqcB/x6XrMoBql0G+c8tr+rkAKWxVgoH
 mRpc6d7u/cRMWXL0NaLbgwTVsTJYZdPhR/ewrdpdtGq7MMNnzSO35Oz6/Ua127yW51WT
 hzSSkben0Q4uQC0SCARu19AFdeGFcEawK54hE2C8DyGMMobIzbIDX2ag6lJUTMzcUhMs
 tkRcw/k8f85vPHJFI0tSY5kUTG1e5OGx+h3ocyRLBtX/VMmtItc+CKnef5RIwz2y+c9Q
 pIEzci8C7wjC6Kzk6DQoLe88rxxHHLp+jocweY9eIQLH3dUjIwW07pxc/xlykVd++Mcf
 XX+w==
X-Gm-Message-State: APjAAAX+g62ZPkHaqMhVlK8sS9kPtiOGP0lK0hIWs6berijjHmp86r5K
 m/YkcjGGzOQjbg0EiOAO++2vxw==
X-Received: by 2002:a17:90a:8a11:: with SMTP id
 w17mr11126377pjn.139.1566250751227; 
 Mon, 19 Aug 2019 14:39:11 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:39:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:47 -0700
Message-Id: <20190819213755.26175-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52e
Subject: [Qemu-arm] [PATCH v2 60/68] target/arm: Convert T16, push and pop
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
X-TUID: +2SF+/kGPC9p

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 83 ++++++------------------------------------
 target/arm/t16.decode  | 10 +++++
 2 files changed, 22 insertions(+), 71 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9e0345adf7..5f876290ba 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7494,6 +7494,16 @@ static int t16_setflags(DisasContext *s)
     return s->condexec_mask == 0;
 }
 
+static int t16_push_list(DisasContext *s, int x)
+{
+    return (x & 0xff) | (x & 0x100) << (14 - 8);
+}
+
+static int t16_pop_list(DisasContext *s, int x)
+{
+    return (x & 0xff) | (x & 0x100) << (15 - 8);
+}
+
 /*
  * Include the generated decoders.
  */
@@ -10591,7 +10601,6 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
     uint32_t val, op, rm, rd, shift, cond;
     int32_t offset;
-    int i;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
     TCGv_i32 addr;
@@ -10664,76 +10673,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             goto illegal_op;
 
         case 4: case 5: case 0xc: case 0xd:
-            /*
-             * 0b1011_x10x_xxxx_xxxx
-             *  - push/pop
-             */
-            addr = load_reg(s, 13);
-            if (insn & (1 << 8))
-                offset = 4;
-            else
-                offset = 0;
-            for (i = 0; i < 8; i++) {
-                if (insn & (1 << i))
-                    offset += 4;
-            }
-            if ((insn & (1 << 11)) == 0) {
-                tcg_gen_addi_i32(addr, addr, -offset);
-            }
-
-            if (s->v8m_stackcheck) {
-                /*
-                 * Here 'addr' is the lower of "old SP" and "new SP";
-                 * if this is a pop that starts below the limit and ends
-                 * above it, it is UNKNOWN whether the limit check triggers;
-                 * we choose to trigger.
-                 */
-                gen_helper_v8m_stackcheck(cpu_env, addr);
-            }
-
-            for (i = 0; i < 8; i++) {
-                if (insn & (1 << i)) {
-                    if (insn & (1 << 11)) {
-                        /* pop */
-                        tmp = tcg_temp_new_i32();
-                        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-                        store_reg(s, i, tmp);
-                    } else {
-                        /* push */
-                        tmp = load_reg(s, i);
-                        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
-                        tcg_temp_free_i32(tmp);
-                    }
-                    /* advance to the next address.  */
-                    tcg_gen_addi_i32(addr, addr, 4);
-                }
-            }
-            tmp = NULL;
-            if (insn & (1 << 8)) {
-                if (insn & (1 << 11)) {
-                    /* pop pc */
-                    tmp = tcg_temp_new_i32();
-                    gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-                    /* don't set the pc until the rest of the instruction
-                       has completed */
-                } else {
-                    /* push lr */
-                    tmp = load_reg(s, 14);
-                    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
-                    tcg_temp_free_i32(tmp);
-                }
-                tcg_gen_addi_i32(addr, addr, 4);
-            }
-            if ((insn & (1 << 11)) == 0) {
-                tcg_gen_addi_i32(addr, addr, -offset);
-            }
-            /* write back the new stack pointer */
-            store_reg(s, 13, addr);
-            /* set the new PC value */
-            if ((insn & 0x0900) == 0x0900) {
-                store_reg_from_load(s, 15, tmp);
-            }
-            break;
+            /* push/pop, in decodetree */
+            goto illegal_op;
 
         case 1: case 3: case 9: case 11: /* czb */
             rm = insn & 7;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index d5b046d105..d731402036 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -221,3 +221,13 @@ REVSH           1011 1010 11 ... ...            @rdm
   # rest of the space is a reserved hint, behaves as nop.
   NOP           1011 1111 ---- 0000
 }
+
+# Push and Pop
+
+%push_list      0:9 !function=t16_push_list
+%pop_list       0:9 !function=t16_pop_list
+
+STM             1011 010 ......... \
+                &ldst_block i=0 b=1 u=0 w=1 rn=13 list=%push_list
+LDM_t16         1011 110 ......... \
+                &ldst_block i=1 b=0 u=0 w=1 rn=13 list=%pop_list
-- 
2.17.1

