Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1146482wrp;
        Wed, 4 Sep 2019 13:08:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzUg1j4tvJr+vmTEYsbIsfv1eATCfto6jHTd85L9fo2MQVhs89QGOxZu/eOL5igXKule/gP
X-Received: by 2002:a37:7941:: with SMTP id u62mr38981311qkc.179.1567627721700;
        Wed, 04 Sep 2019 13:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567627721; cv=none;
        d=google.com; s=arc-20160816;
        b=shC7bbtaRgHRxaNxQN7yUlggwmDu2wgsisPERiGSO2/laGnYzT0KjAyjkpTILcj5yt
         qwb8ceX+vLgh+zQQicrQq1bi2tX2KWi1twE3x0MT0+TbByLcQIYPqKZcqWgRQzIV49cx
         6l3efCEDODOssk+wvamoIqKnyEnRcdeWIK6bxgy8ILIEp7i5d5v9ThXYx/9w0ujnLdpi
         Qg9CNDMew/zMl1GuMBrvja4C3JtRjRVRPVO7Ym4DgjdkqBmLLIh9OneURBWppb97/yZZ
         DGrJeYhozLEvy8ol+SwFr8PD6JwEFfSR/0BxyI3DFDN2vaMQPqPDrSg+ARCfMXcGPBcj
         c2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=y24DH+dfPzSm0CIJ0hS1ndxYRi7AmLs36MuqiaHVKW0=;
        b=WssNwvcKlyVHOoMxI1a1Hwkj8w/U4y9ZV7d0JNueruahS/q+mhGHHFJL1Zzc50q9ov
         zt4B9Vm4c6tSoVQO1csLTWnOsqS/Sbyj2XkN8sI7cnDcBT+SL48MXb8QFm0sxEeQJ8Vf
         Y306mU/bipHFqDJ6sRZb2rwQQBk7HFDNkUfPjifJ71VBGSSOKj4gP3wjcSb/2sRloTMy
         W5Zpg/LQxKxGk5wYC3oIDuIFq+H+dyfH5WotY/RkjbiM4K5y2yQ4XyA6J61Tr8gTRXu7
         1Qr016Q/dtme7Nmrl+046DgJGjNZoo0FJ7e0gSOxfirHE4CSRrFhZSC6OlMp2i5j0Cjd
         uHCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y7nwXhcY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u58si11007957qta.392.2019.09.04.13.08.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:08:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y7nwXhcY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5ba4-0002v1-E3
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40997)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0k-0005MF-GV
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0h-00030I-Mq
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:09 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:37431)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0d-0002wU-Pb
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:05 -0400
Received: by mail-pf1-x443.google.com with SMTP id y9so13912098pfl.4
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y24DH+dfPzSm0CIJ0hS1ndxYRi7AmLs36MuqiaHVKW0=;
 b=y7nwXhcYbYYItad8Zi5A56g22WB1irnfP9RSiQCKHlq3ni2vrbwfwOxh/324jMO7g3
 GRbNF7PgrIUtsy6Xl1mdaZlefTkSbPYYLKQnQ8XzFg2BvrQThaNFxtV2i1/0UARrOJT8
 oWi2h/Vn2b0yayFskzJ+uwFoAh87lq1zc8kZ5WV44tQtfkcePJz1RZ77e8Frv/rE5jdB
 x/kQTWtH2aVdKpnamJdREXCscxhCLDC/FRe8+bkVBbQYcYHJ8L91rs7QSPqrA6VQvgPe
 uKpVsWszRBnx5liELDDplswq4kTEgd9+zPG3l/kjHLkBBvVnZVvs/1rmRJ9QeG0sLpDz
 Qe3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y24DH+dfPzSm0CIJ0hS1ndxYRi7AmLs36MuqiaHVKW0=;
 b=oLF2+ZCGm3BpsgoFW26eJBnCxFE97Stoqi4BMKbtY2iIEC1BR6kdwaYJEjsVqIsqrn
 zGdZHCoiyxG10qObNGXU58NiMvqKex/XFQ8kHYGOhnKAjd+uf2Tm57rNYp/hSvtKYuuW
 Pgef3J+VExBuxwuIVrv6KTmpbGYP2ERl4FHPUSYPd7E7DE2LmQlduaUX8IounD0VszZ0
 pjdzAeAMrQEQy/+Nx9vYCHACo+mqaABwD8nw+cp9edBxFCHDp7R6Jw1WwA/nFVn1LAGF
 FcT+ulLUUBmes1GCdRxobHkGoXRo0ATWNXuSDPu85gKGBlEnYFC9yDY/jMGdYQAUevjy
 MgXg==
X-Gm-Message-State: APjAAAUnM+49FaDoSnsfSFuVfm2Cc+1+p5iRm7cRzAM1+w7Zm/doDY37
 Y11ocHzzmhGSH1VLoAV8nroT2w==
X-Received: by 2002:a17:90a:bc06:: with SMTP id
 w6mr6882814pjr.45.1567625522086; 
 Wed, 04 Sep 2019 12:32:02 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:38 -0700
Message-Id: <20190904193059.26202-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH v4 48/69] target/arm: Convert T16 load/store
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
X-TUID: rCSO2B8VsoqO

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 94 +++---------------------------------------
 target/arm/t16.decode  | 33 +++++++++++++++
 2 files changed, 38 insertions(+), 89 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 789abe9b87..4ae73d1c92 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10863,97 +10863,13 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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

