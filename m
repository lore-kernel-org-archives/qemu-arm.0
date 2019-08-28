Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1189544wrs;
        Wed, 28 Aug 2019 12:44:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBvICsUbDffp2GEKpdpvIlxMegkecRYpizR1AVLHYiGkPfMYyUrxsgHGt8pvnxnRKc4dgc
X-Received: by 2002:a37:4a88:: with SMTP id x130mr5878046qka.501.1567021440147;
        Wed, 28 Aug 2019 12:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567021440; cv=none;
        d=google.com; s=arc-20160816;
        b=nnTfEDfoZMKtf7vMKZczRPijdrawnfDLwwabEpePwxMe/lcJUZMXLY+7/6/UBoAURP
         Zc/SvMI8VwLHz60cbJeDY+Vaeu4IBttdi5n/Ze6K2AHYkqR5THrqvrkCcfxsGN0uyeS8
         x6oYXIjUee565ueMC0Z/esd5LXuDZCsBTZIh7UBtyoO0lpidckD7riedZcwtfrAsxhuG
         M89EDJwmIefE27skKCaDGe1EfX29E8+KkxHRDGNIR/qcyifj5ByrWnglDbMn1qjiray/
         tgZQZYe0PWzx2PfMRmBYzkproBgtO7OoqirE2B3ZFxPnH+041doqQNPeoLweIdT4S3xi
         KPiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=kwRo4zZzHNj2f8dsvm1cnawVi86AhDJJQQALYH4bbvo=;
        b=tgOgNMjFY5lcftg4r7itm2yD0NMowl1kYm/6PFekaaM5vR6YJ4lI20dAoQJPAn4wCb
         R5uJNQou5OKbCG40xYpbxEFKJgAgmVUXNfLQel7ccJoTjNIs4avA+43SDOEGlOdeOkUC
         qu+hPw8N/wH0E3qynNvNO9zhycY5vNmVka21dRTbvovNdAdnKyBb6YD4Z0SS8nrI1m1Z
         4XNT4TmFq368BJ77ZEar4TnDdjlh6QiLLyiWPanwk+CrXYGlRd2ZVLlnjTDEeX2f+55+
         8CYO2YjCWXYZu6LNb2yrLaKs9b+rIHKMlBJfoPhS5gxoOpR0jeVpCvJTCNdV88TJkdLH
         C45A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RxbwHwda;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1si79026qtj.361.2019.08.28.12.44.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:44:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RxbwHwda;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41547 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33rL-00075r-1w
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gi-0003t8-Qc
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gg-0000YT-4C
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:07 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:40507)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Ge-0000WA-SP
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:05 -0400
Received: by mail-pl1-x644.google.com with SMTP id h3so393783pls.7
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kwRo4zZzHNj2f8dsvm1cnawVi86AhDJJQQALYH4bbvo=;
 b=RxbwHwdaNXVghcwQxxv2AhEAgUCdq06Zam78cjeGv2zovSoZTyCduTZGZyddgatOxY
 VZ6kGBKtsdCi44JXVAjf87ZODnUcyCX2wQ/pxR5aDWWWiApvgdDnfy+GZlqrbDzyWMrE
 dMl/VpkBOEkNNpma9HfeRWofcBWkJ9aaqTpcz1xkN0Ym/OP6e+1PykGBbfJ/H/17uFSn
 fAWBbadEzT3QI1rifD48scQMgVQQjiixIUsaKYw1dHWE4eKoGJXfuRQisKf3s+UfblYC
 lGUMThWP4Diwkrl1ZjIMdjQHz0IAJH5YluVfJ3wNrG8I7T7g/JHcl7dKWPYL4hB6iOXZ
 1qGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kwRo4zZzHNj2f8dsvm1cnawVi86AhDJJQQALYH4bbvo=;
 b=qNU7vFRJsHICcfdktbZ/XngUwNLAbVx9FZRuPgpzN5dVprJjB16bDp5f1BPsCGue0c
 W0zoVAU5pObhwNk6+FVSA6P2arILLZR07EEziEbdgcdYedU/ZaFkCuAMBIsKctCoOsQA
 LNaZ5YoNgGwJXqYBVioxcv9fQcBX0s+iQl5fCr/Vp2uA9OqrbA8u+lozdv0MhBNAPhkx
 9cjN3zwabO0HLQdFGeM3zXbbP3/Vgf2e+le8+mMtV9Sj5Xu2puySUJbD/iR4TQmqfUD0
 WzRPaE6zEQLpE8xjzzyaIM17C0QWH0l4gujprXk6QW8NLft3Sscb6bOw5HtoM4CzjW0G
 3v1g==
X-Gm-Message-State: APjAAAVJOzP5zirpXUOOScbG++OY1CQ/NasSQqqOXjNcsRtt0wX6oYdF
 6Pe3qwqIzhaK5gnvPvYDprdYxBoateM=
X-Received: by 2002:a17:902:e407:: with SMTP id
 ci7mr5967774plb.326.1567019161183; 
 Wed, 28 Aug 2019 12:06:01 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:35 -0700
Message-Id: <20190828190456.30315-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH v3 48/69] target/arm: Convert T16 load/store
 (immediate offset)
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
X-TUID: EDfLZ4cKXVE+

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 94 +++---------------------------------------
 target/arm/t16.decode  | 33 +++++++++++++++
 2 files changed, 38 insertions(+), 89 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 73b4ac8efb..8e182f338c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10840,97 +10840,13 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
          */
         goto illegal_op;
 
-    case 5:
-        /* load/store register offset, in decodetree */
+    case 5: /* load/store register offset, in decodetree */
+    case 6: /* load/store word immediate offset, in decodetree */
+    case 7: /* load/store byte immediate offset, in decodetree */
+    case 8: /* load/store halfword immediate offset, in decodetree */
+    case 9: /* load/store from stack, in decodetree */
         goto illegal_op;
 
-    case 6:
-        /* load/store word immediate offset */
-        rd = insn & 7;
-        rn = (insn >> 3) & 7;
-        addr = load_reg(s, rn);
-        val = (insn >> 4) & 0x7c;
-        tcg_gen_addi_i32(addr, addr, val);
-
-        if (insn & (1 << 11)) {
-            /* load */
-            tmp = tcg_temp_new_i32();
-            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-            store_reg(s, rd, tmp);
-        } else {
-            /* store */
-            tmp = load_reg(s, rd);
-            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
-            tcg_temp_free_i32(tmp);
-        }
-        tcg_temp_free_i32(addr);
-        break;
-
-    case 7:
-        /* load/store byte immediate offset */
-        rd = insn & 7;
-        rn = (insn >> 3) & 7;
-        addr = load_reg(s, rn);
-        val = (insn >> 6) & 0x1f;
-        tcg_gen_addi_i32(addr, addr, val);
-
-        if (insn & (1 << 11)) {
-            /* load */
-            tmp = tcg_temp_new_i32();
-            gen_aa32_ld8u_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            store_reg(s, rd, tmp);
-        } else {
-            /* store */
-            tmp = load_reg(s, rd);
-            gen_aa32_st8_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            tcg_temp_free_i32(tmp);
-        }
-        tcg_temp_free_i32(addr);
-        break;
-
-    case 8:
-        /* load/store halfword immediate offset */
-        rd = insn & 7;
-        rn = (insn >> 3) & 7;
-        addr = load_reg(s, rn);
-        val = (insn >> 5) & 0x3e;
-        tcg_gen_addi_i32(addr, addr, val);
-
-        if (insn & (1 << 11)) {
-            /* load */
-            tmp = tcg_temp_new_i32();
-            gen_aa32_ld16u_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            store_reg(s, rd, tmp);
-        } else {
-            /* store */
-            tmp = load_reg(s, rd);
-            gen_aa32_st16_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            tcg_temp_free_i32(tmp);
-        }
-        tcg_temp_free_i32(addr);
-        break;
-
-    case 9:
-        /* load/store from stack */
-        rd = (insn >> 8) & 7;
-        addr = load_reg(s, 13);
-        val = (insn & 0xff) * 4;
-        tcg_gen_addi_i32(addr, addr, val);
-
-        if (insn & (1 << 11)) {
-            /* load */
-            tmp = tcg_temp_new_i32();
-            gen_aa32_ld32u_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            store_reg(s, rd, tmp);
-        } else {
-            /* store */
-            tmp = load_reg(s, rd);
-            gen_aa32_st32_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            tcg_temp_free_i32(tmp);
-        }
-        tcg_temp_free_i32(addr);
-        break;
-
     case 10:
         /*
          * 0b1010_xxxx_xxxx_xxxx
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 83fe4363c7..1cf79789ac 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -24,6 +24,7 @@
 &s_rri_rot       !extern s rn rd imm rot
 &s_rrrr          !extern s rd rn rm ra
 &ldst_rr         !extern p w u rn rt rm shimm shtype
+&ldst_ri         !extern p w u rn rt imm
 
 # Set S if the instruction is outside of an IT block.
 %s               !function=t16_setflags
@@ -69,3 +70,35 @@ LDR_rr           0101 100 ... ... ...           @ldst_rr
 LDRH_rr          0101 101 ... ... ...           @ldst_rr
 LDRB_rr          0101 110 ... ... ...           @ldst_rr
 LDRSH_rr         0101 111 ... ... ...           @ldst_rr
+
+# Load/store word/byte (immediate offset)
+
+%imm5_6x4       6:5 !function=times_4
+
+@ldst_ri_1      ..... imm:5 rn:3 rt:3 \
+                &ldst_ri p=1 w=0 u=1
+@ldst_ri_4      ..... ..... rn:3 rt:3 \
+                &ldst_ri p=1 w=0 u=1 imm=%imm5_6x4
+
+STR_ri          01100 ..... ... ...             @ldst_ri_4
+LDR_ri          01101 ..... ... ...             @ldst_ri_4
+STRB_ri         01110 ..... ... ...             @ldst_ri_1
+LDRB_ri         01111 ..... ... ...             @ldst_ri_1
+
+# Load/store halfword (immediate offset)
+
+%imm5_6x2       6:5 !function=times_2
+@ldst_ri_2      ..... ..... rn:3 rt:3 \
+                &ldst_ri p=1 w=0 u=1 imm=%imm5_6x2
+
+STRH_ri         10000 ..... ... ...             @ldst_ri_2
+LDRH_ri         10001 ..... ... ...             @ldst_ri_2
+
+# Load/store (SP-relative)
+
+%imm8_0x4       0:8 !function=times_4
+@ldst_spec_i    ..... rt:3 ........ \
+                &ldst_ri p=1 w=0 u=1 imm=%imm8_0x4
+
+STR_ri          10010 ... ........              @ldst_spec_i rn=13
+LDR_ri          10011 ... ........              @ldst_spec_i rn=13
-- 
2.17.1

