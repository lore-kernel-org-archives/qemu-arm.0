Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3204157wrs;
        Mon, 19 Aug 2019 15:22:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyDUN8o6BN5KvKUNvuY0G2LXTh4dr65/GLjJv9UCKW5EyBxKFTH5CtmcYEf6w55E4kR9X5X
X-Received: by 2002:aa7:c35a:: with SMTP id j26mr24023868edr.270.1566253335543;
        Mon, 19 Aug 2019 15:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566253335; cv=none;
        d=google.com; s=arc-20160816;
        b=KCbLnKwj4Bs3D1LM231zxVE6TfCd+YdnDo0JL2WjUMlCF06sQSRQS3hRCBLjm1YsVZ
         pqm6LU0H99DC3CnPJcYB2/UBoL9FPeiM3utiSX0Oes79+blEOtotIJieNi/SnWdfsGOg
         M3PYlbSLDG0CqITSbKjMPaG6SnMHTctfOOMXud/zdGFIA7UDhhv9+iWXSIGhAVGb1csi
         cS9QjjPrTjet7FGDnzwdl8+12NyEPWRhWCGDNg7kds/OFj3DRcY1b9hSquzQk2MBdurx
         SvL4+bR18wFnyOsOQvEiAop6TL8rfeJltT7fL7KcvmasVtVmx5JUVF2uRAQIm7AtgFWM
         yJ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VFBU7xB1tZeQF9Ur7x5GUr3vG1VIlCf7jhvfNaK9tC0=;
        b=T2yUTGy36hWbX3qwYN1zouDFvBfgXUvO7M7uygCqI5ZrCt4s/BXd8n7Yf1CmNsqr9n
         /GF5zPL+du4HDGADyuWT4R6JE3f9CYsrDuoFzB9+Lqp23mk5RbpDunX3pjNuIG26G6Hk
         C2Ims9o0hn5R48xewZP5h91ibyyHSMf7WzbxztL/vl+MInnWbNBpasIx4KIm8Gi0DX8C
         7DuZGRjxfaggfbsNGfL7/XqOvK51fbwpdCOvaO3ts65mZrUCHQ/W7fk1Ur7gmSG8j2Mb
         26I7vCudK+k45sShuOIYnljNCZnLG6pAVCqergti+AydRCYjnGPCeyVLUnJENCUIBcie
         8lFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l6E8rkRC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20si7570483ejw.378.2019.08.19.15.22.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:22:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=l6E8rkRC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzq2Y-0003CW-9k
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59713)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMj-0002Vd-0N
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMh-0006gf-89
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:00 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:36036)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMd-0006cL-BG
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:38:57 -0400
Received: by mail-pf1-x444.google.com with SMTP id w2so1951279pfi.3
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VFBU7xB1tZeQF9Ur7x5GUr3vG1VIlCf7jhvfNaK9tC0=;
 b=l6E8rkRCcCq9NjGdgmdCaOfUp1hUCk8OnzveXy+ovospNVBusw/ZuE+U6GsDHVqN6/
 OLvheKhhduzX8D9Vc7rE05wC5yDgFDmtW/prE85Kt+Ol8YWCuMlweacUfbk93gmdARES
 k/fiVLxdDn6zqswtTVtrEzfo7A/TgiOyD9Qj4zGdGLSIbnrBnGImCbkpShNEehNpmyYO
 x6+fU07BTW2Azevcoo6ufxAhxEdEdNcMrCbFY/0PxGHW+jaNPq6hZJuRmLcT5HWWhN/Z
 b4KNKJDjg4CuawJjv6ANQLaWuIWhQ5FGa2997h8R4iBwgwI3k2mLx1e/l6ni+iOh8v63
 PyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VFBU7xB1tZeQF9Ur7x5GUr3vG1VIlCf7jhvfNaK9tC0=;
 b=tqq/yPAJTZb0eNH7O0DRfuH3xKA7t6ZaPqf8zXaTFv4di02wOQHVYnz8J0vdCXKmAa
 y73lg0fEGSufMWjMFnoHU1UOc4EAwKzit4b6q+z5tHzMAjPlaBRggmPl1XydCkMns6Y1
 sjlQ9zFMuMgc7d1OrTgnSg4lt3BGSIeuRM9IPsHqsdDFwenXnncF+bq4ytRLY+CnI7fm
 B49z3NFDKhYGgxC6k/UFpEK2FNVY69dV8BUFMuiWKot8hU0mzl/CStmYK63XdXQJkSyg
 3NgeNdDGc9pvnk8zFMscOjpus0Z6l00w/2DKMoFrK0qhJvFUP+dEd9NL1WowhPGAluG0
 9UqA==
X-Gm-Message-State: APjAAAWiBazgIDwKtpul6x4cQ4Fr/+UiSvjso/CzZWP41fuooIeMt9lr
 l6+I6A5zmAghLmvY+EUqX6uG6g==
X-Received: by 2002:a62:584:: with SMTP id 126mr26624406pff.73.1566250734445; 
 Mon, 19 Aug 2019 14:38:54 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:38:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:34 -0700
Message-Id: <20190819213755.26175-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v2 47/68] target/arm: Convert T16 load/store
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
X-TUID: Qgyqibe0Pvvc

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 94 +++---------------------------------------
 target/arm/t16.decode  | 33 +++++++++++++++
 2 files changed, 38 insertions(+), 89 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e19961fb6c..24537fc107 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10744,97 +10744,13 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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

