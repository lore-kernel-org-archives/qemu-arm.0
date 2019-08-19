Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3189056wrs;
        Mon, 19 Aug 2019 15:03:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx7tXMCswhYswcin1FE3QsD+f6Z0K1pu5KE6oCuxhRtf4BQ3QQiVI5zjbYn6+cPgKMuzVnI
X-Received: by 2002:a05:620a:1f0:: with SMTP id x16mr23443081qkn.11.1566252216426;
        Mon, 19 Aug 2019 15:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252216; cv=none;
        d=google.com; s=arc-20160816;
        b=x7iDUj/OiESDDZPRln+HlzqWS9pKiz0wKFccksgWoU4TyxGlK1wEH3L/IRlqEdYysL
         nO1wOMKqaHXgkf4Z5WxgcczIn6w090Iz+0eGz3pKuCOa0OvjwARC+xpZ6b6aaRDuuTlD
         Ju+F0V31BhN+mNukhUWAupoZJU2FL2BKzMacyKiTvPisU4WDhHGXQcxKyMoIbEKJeF3T
         IKDz/sHOgb15Vknz2Z6+AnUHzd9/gIi1FTtFp3aFTcwqhrt+7cOfndxOURoMI/kJueWA
         uTNJIsdF47SxsDX46eAa9wXM4VP4dr2YZTgRW/yhpFTNrpUHygKufr71dw8ObPzspMAc
         GqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=4oWyeRO7VGSUxbfq5SQ/Ttd5DuqgQfk+9PyV2J/44KI=;
        b=zzfV51xEhinYZAypxaosGspYm7bQRJWCEZQ9fWiN15Fr9DXi0SyfOLCHii9Po0Cmyh
         zGOleQGhRXNbueRQUkznxTeFNDF3NdBImXenPokadO+4IopQOTFd/zxKGZJNGPT91d+T
         qHwl03OIk/ohyerkrGqCLxeF7l4mW6HNf8azZQD8MnaqYheFRPhn++76VqcUMOHpo0Xq
         SnNgEOqh+lSyWWuR0mfIfOM1P0B4w2vNXpdw92jQ9UVlh6v4/5haEqTxIgG4i9J5OyLM
         7JFw6452mv++Esm00/RtPB4ll86JRvX53N6Q+qe46+cT0Ndb5GnJrRKeTjPKMB4Hiifd
         BthA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Drn5lIP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z35si9947686qve.206.2019.08.19.15.03.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:03:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Drn5lIP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpkV-0001A9-An
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59475)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMX-0002No-CI
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMU-0006Vj-LV
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:49 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:40161)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMU-0006Ut-Fy
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:46 -0400
Received: by mail-pl1-x632.google.com with SMTP id h3so1585487pls.7
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4oWyeRO7VGSUxbfq5SQ/Ttd5DuqgQfk+9PyV2J/44KI=;
 b=Drn5lIP0XEn3UHgMzXP+UrnGrtO4PcM2S5eHx1MB/XvLft3S26wpbgY6YWxiEZU47P
 j/WsmtsegP82//AY+U5OjxHLXJumJCU4BAXOTWV3/vApTXI1xg/wVX+wFcGmbsAnBIRj
 qT+wdPJuEI+AX6lRr4H/Gz15yOZqTHWjqYw+bI3hvd/u6CBFCbd5ovtlXJwcff6tZp8c
 eUWd+ZBUUn+YcmG/pXqjM7BaBb5c4/HhFIeOY1RqOrgWyLkQNxKOWXS0mvY06Bg7/pte
 ToYvZmioZHUtDvQnAcvnnpq7i4zLdj8CQ/QnLts8YfDV68V1PwmuuI36/fl+Jh8cEybQ
 AZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4oWyeRO7VGSUxbfq5SQ/Ttd5DuqgQfk+9PyV2J/44KI=;
 b=tI6p4pwDpl+wcv0IdEuNeCl9o6cHRuEr5d/bEMcejJ943EmqzOEJLsrZl8B7xJLHOf
 zg2X+ChiaC2lFhJRR0WG3IjtqheEp+Pn58PBmYeGR1e0Js4uv0ihCEV3TEsG2uwk30BB
 l+vDSPetJ7uIEmJjyfKrpusb6iF2u6/HGXOkGqkOA7Q4bYQG2s6TCqWi4tFsahDbliL6
 7fHjz8n4OK/DOE8zZ/0JSknR0TzC51gRiTte5JnfBGmi7HeELLpLpfiazdq4b7jgHYCI
 Q9YUcIrsJfCJz/e/x3RyPsF36irXMOwAZuAy1TV/3trbMTC4ONuRxK/p84bi7WsqPcaB
 jkzw==
X-Gm-Message-State: APjAAAVKX+TbSQgPhyEDW/z4spo0h5mIhN0B5P0mibkymUZXzI7W3gCj
 AI4oz1vULRDsDQmvSTVDLR10gA==
X-Received: by 2002:a17:902:a509:: with SMTP id
 s9mr25303891plq.310.1566250725114; 
 Mon, 19 Aug 2019 14:38:45 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:26 -0700
Message-Id: <20190819213755.26175-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::632
Subject: [Qemu-arm] [PATCH v2 39/68] target/arm: Convert Table Branch
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
X-TUID: 4lYuw66en995

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 57 +++++++++++++++++++++++++-----------------
 target/arm/t32.decode  |  8 +++++-
 2 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9ec6b25c03..7c05e7006e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9968,6 +9968,37 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     return true;
 }
 
+static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
+{
+    TCGv_i32 addr, tmp;
+
+    tmp = load_reg(s, a->rm);
+    if (half) {
+        tcg_gen_add_i32(tmp, tmp, tmp);
+    }
+    addr = load_reg(s, a->rn);
+    tcg_gen_add_i32(addr, addr, tmp);
+
+    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
+                    half ? MO_UW | s->be_data : MO_UB);
+    tcg_temp_free_i32(addr);
+
+    tcg_gen_add_i32(tmp, tmp, tmp);
+    tcg_gen_addi_i32(tmp, tmp, read_pc(s));
+    store_reg(s, 15, tmp);
+    return true;
+}
+
+static bool trans_TBB(DisasContext *s, arg_tbranch *a)
+{
+    return op_tbranch(s, a, false);
+}
+
+static bool trans_TBH(DisasContext *s, arg_tbranch *a)
+{
+    return op_tbranch(s, a, true);
+}
+
 /*
  * Supervisor call
  */
@@ -10350,9 +10381,7 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t pc, uint32_t insn)
 /* Translate a 32-bit thumb instruction. */
 static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t rd, rn, rm, rs;
-    TCGv_i32 tmp;
-    TCGv_i32 addr;
+    uint32_t rd, rn, rs;
     int op;
 
     /*
@@ -10398,7 +10427,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     rn = (insn >> 16) & 0xf;
     rs = (insn >> 12) & 0xf;
     rd = (insn >> 8) & 0xf;
-    rm = insn & 0xf;
     switch ((insn >> 25) & 0xf) {
     case 0: case 1: case 2: case 3:
         /* 16-bit instructions.  Should never happen.  */
@@ -10471,25 +10499,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 /* Load/store exclusive, in decodetree */
                 goto illegal_op;
             } else if ((insn & (7 << 5)) == 0) {
-                /* Table Branch.  */
-                addr = load_reg(s, rn);
-                tmp = load_reg(s, rm);
-                tcg_gen_add_i32(addr, addr, tmp);
-                if (insn & (1 << 4)) {
-                    /* tbh */
-                    tcg_gen_add_i32(addr, addr, tmp);
-                    tcg_temp_free_i32(tmp);
-                    tmp = tcg_temp_new_i32();
-                    gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
-                } else { /* tbb */
-                    tcg_temp_free_i32(tmp);
-                    tmp = tcg_temp_new_i32();
-                    gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
-                }
-                tcg_temp_free_i32(addr);
-                tcg_gen_shli_i32(tmp, tmp, 1);
-                tcg_gen_addi_i32(tmp, tmp, read_pc(s));
-                store_reg(s, 15, tmp);
+                /* Table Branch, in decodetree */
+                goto illegal_op;
             } else {
                 /* Load/store exclusive, load-acq/store-rel, in decodetree */
                 goto illegal_op;
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 354ad77fe6..0cc0808c05 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -487,7 +487,7 @@ LDRD_ri_t32      1110 1001 .101 .... .... .... ........    @ldstd_ri8 w=0 p=1
 STRD_ri_t32      1110 1001 .110 .... .... .... ........    @ldstd_ri8 w=1 p=1
 LDRD_ri_t32      1110 1001 .111 .... .... .... ........    @ldstd_ri8 w=1 p=1
 
-# Load/Store Exclusive and Load-Acquire/Store-Release
+# Load/Store Exclusive, Load-Acquire/Store-Release, and Table Branch
 
 @strex_i         .... .... .... rn:4 rt:4 rd:4 .... .... \
                  &strex rt2=15 imm=%imm8x4
@@ -531,6 +531,12 @@ LDA              1110 1000 1101 .... .... 1111 1010 1111      @ldrex_0
 LDAB             1110 1000 1101 .... .... 1111 1000 1111      @ldrex_0
 LDAH             1110 1000 1101 .... .... 1111 1001 1111      @ldrex_0
 
+&tbranch         rn rm
+@tbranch         .... .... .... rn:4 .... .... .... rm:4      &tbranch
+
+TBB              1110 1000 1101 .... 1111 0000 0000 ....      @tbranch
+TBH              1110 1000 1101 .... 1111 0000 0001 ....      @tbranch
+
 # Parallel addition and subtraction
 
 SADD8            1111 1010 1000 .... 1111 .... 0000 ....      @rndm
-- 
2.17.1

