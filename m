Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207557wrv;
        Fri, 26 Jul 2019 10:51:30 -0700 (PDT)
X-Received: by 2002:a17:902:788f:: with SMTP id q15mr99214827pll.236.1564163490828;
        Fri, 26 Jul 2019 10:51:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163490; cv=none;
        d=google.com; s=arc-20160816;
        b=uuvHRLbqkea+uraduI/upcQi+foBfjPdd7QNzzPytINUI5RZZExmEe6A+4PiC1o6P/
         d6DuYK8K6b5ivF3dIYbHp30SNCO7tRw0CiIVk42npYJkcEKTokTDGar5PAJe7Tuc2d/B
         bJCSl7rGOojGp/OUvy9rtS2cgmpBtsFpURS5AzKyqYY3BEQl2RLdW65c1MQBBN8BwbYD
         tR8uTdxyBnRwq6kUd4EE0Mkx/FvaaLXQ5mjan4zHHsyOQi07/JlNpnzbLtHfVbOGtgFo
         l3ycQtvey0z/rgRE5F+rnGtrYVz/o9JUvdarpUheTMhrf6yIck4NwogJeMxrbIfDZmN9
         Sy9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=rYLqZpflL8enArleH0yr8+1WjHV+ohzdNCLhPhFauU8=;
        b=sucei2RZFVncH8jU5VYvFKzuBB01BD/GOh5wJiLERzbSElMMQ11cneSJP4cixliiEC
         lRSqHA35ID7fb8OOJ83E7pkSP1o8ewoEz8zyDJT17BrLud3xRwN8O/+YxwQ2+CbroZ+p
         A6LKg4r64E4B/Tkpt1AYbFL3znLq5S/E9xN3X1cdj37nUckdgZPNs6Fh+KMaOkEj3GA9
         rbqvg7gr4VwWA7EgO9SM+XSs1FztPQLUhLDG+oHw/rfiPEVHCAROCMmfeafoSQxhfy6J
         +4ktbET68y3B2y/iwWwFRV3B3Xa5lYnRn2DrK42JR8+WujKK7HVBipAtNaRjfnZ8+NzM
         EzUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vUuFxnGZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p187sor24959714pga.43.2019.07.26.10.51.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vUuFxnGZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rYLqZpflL8enArleH0yr8+1WjHV+ohzdNCLhPhFauU8=;
        b=vUuFxnGZfQO+eydHDnu89G4IdZjWb7HlKZY0QaHpGWE2BItOyaXMRIyVdYMQ5FlbEM
         Yim3sn4LSJI+5S27aQP1J2C2gp1832rmmjn9LZEPvvc6vHBj15SNzxQnSTccj6It2Qu6
         cS6QTKFPWIY1IProfCj0G52h3yThcb54AOYaoXea967IO0U7De6pKTx3WjHAbiwNNoQW
         Pv2eBFF0vGE0C8m5ue1r55cJDh1mazO5ejuFcwKyH0XSM6zu9//T4NI/KhOvRakQY0bv
         LIsUPxvbl/VsMzZRVQY/gHNa2DNFyrVkYn/6y36PZCjMoYP7ouD3kNNyjtf9KLKQhUlg
         STGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rYLqZpflL8enArleH0yr8+1WjHV+ohzdNCLhPhFauU8=;
        b=TllmvxPWbgiofgtRgZKh93l1x8Qn3G7SWQlVRBfRRQFlYu7r+VBkDyQ1uIo3aD9G5d
         x5tFiRtnBIq3VLAb/9wZGq8+e/7lQ8yzQ61ZxBvWRW62kTtkA6/Dl6fKZqyBod6Jr+8x
         OLjVfRCYzoHZZqZeKiJ7TJJ0krN8eBIHkqf+q0LFO/gYYCp1FOHJSXYQZWRuRUAVDXDF
         ySLPYKDrHyBNPyBAY4huTie2gwrTw1xu0YFK8Q7fCTu42p70AE4Q8DRmnmAtqlyExEjs
         Fwzu7yVQJKCNXFDQqTBmdhrG13dry8+Ytjpqm46iSoY0K/bNjfq91vRlyIDxTd589xsE
         0O/A==
X-Gm-Message-State: APjAAAVAhNrxFdqVY6PJfZQad3Ffs2tgzrFEH1LCMwPdS0uHfCHhTASS
	kVS5qAbX3iNlLUabo6DuhjvCF+3+
X-Google-Smtp-Source: APXvYqznLqbjQE4G5DtbsMbfZhR3WNUcUn1+ZBUIdYGBmr2MQX1yzZmDouKWrzWZUYSZkV66yVC+hw==
X-Received: by 2002:a63:7e1d:: with SMTP id z29mr92318259pgc.346.1564163490363;
        Fri, 26 Jul 2019 10:51:30 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 46/67] target/arm: Convert T16 load/store (immediate offset)
Date: Fri, 26 Jul 2019 10:50:11 -0700
Message-Id: <20190726175032.6769-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: AL8bCl66/MIT

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 94 +++---------------------------------------
 target/arm/t16.decode  | 33 +++++++++++++++
 2 files changed, 38 insertions(+), 89 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7b87621315..28f274ca7c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10753,97 +10753,13 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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
index 567c5005d6..797e4e7068 100644
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
