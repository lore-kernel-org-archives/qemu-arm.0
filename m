Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1206003wrs;
        Wed, 28 Aug 2019 13:01:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyiBq3mJXW56U4GC2+/Y9LVR6d6AQM+FsCniVXKdHqwwxqfBjQFNdMGFtPzj3ccio3crKwZ
X-Received: by 2002:ae9:e91a:: with SMTP id x26mr5879611qkf.305.1567022481961;
        Wed, 28 Aug 2019 13:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567022481; cv=none;
        d=google.com; s=arc-20160816;
        b=gfin/+hcP2+27wFFvWyKgOzGUj3m/HJSMAelIaSFJk1tuWiDlxAP/C8Fo/0mvDeufw
         XnvUTTIF3pkenpu0vH/T8lQSmyvS3eiHQLj9kSZuz85+dg407u3ovNQ9ycsys6tmV7TZ
         r1CD8JO3cOG/gWAAcXSHXgAlF7iJSIa5LtzLcaESV4hX0n9H+YwUuvBmLT7m4bIo4Zll
         3RK7R/T9DSCqE812jxeAEl9JiUmRuRuODSEnjFUPLcm8ZZp0jsJ+Ym+YDfzvmP4WtBj6
         1tl02uPYk1J9FYxCWrtZKf2sFZxW6bxL5v81DnWu+reUH+Q381IGEyhhxHWEIId6ldkZ
         ZW2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=G4RFBC/bjFBDl9Ozu5vssYifGaa+CV/ji6uZKewPJ78=;
        b=vTetx34YHTS+B4es0mgVJPSILfUFXWzJGCi3LT/Lhcpv4HeX2mzJDMU8ERVouAZZBD
         TuhsKsdV9NVYfWNhDK45/AKN4fSixbrGuyawQiyU2gg+AfRNukW2GmnGQnFT7mCRWE9m
         4U9q51lkfEp8No+ZyaOMTjjUTn04m1Pz2rCpRa1zNy6qMzIeck8ZX6/YYsqTQypxklac
         WBnwrQtfI8/xbUYckULZzwGRkZJ++J0Q8RjxC9pCKQY0qN2//cV9bnTAHdRPF7T4gWEV
         9eu3e319SsfD5lgke5nQprMKWMZNrpYVi+wh2uOCjcsZreQWAIX7hN962kb3x6aqBwgO
         Uhjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UJ9snoqA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 26si268524qkb.191.2019.08.28.13.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 13:01:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UJ9snoqA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3488-0001Do-Mt
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 16:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38530)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gg-0003sL-3s
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gd-0000X1-OZ
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:05 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33124)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Ga-0000VG-TZ
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:01 -0400
Received: by mail-pg1-x541.google.com with SMTP id n190so238898pgn.0
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=G4RFBC/bjFBDl9Ozu5vssYifGaa+CV/ji6uZKewPJ78=;
 b=UJ9snoqAXyCXoSI+hR4I1xLL8HHu491cpDZ0V7rRC1766NyduW4amydZzNQD/WZILx
 FGeoYJYerNcWhKRl/mB5QfVjgMBVEW8HamoSLnq5II2G165oegubS1PcsayCw+GHrgTa
 L/QPQZX9/vQzBSfkKjREFAg6XTiVOJWH4z00l+QChSrpLOyLvCN1pjCrm2D/eHHQEpZV
 itCOox16LC3B6dzqjSyq+3yI1fxVwHFaY3zdzA/vkrpX41x9FTOwBR7gdJUIYBm8KO+j
 MFMFdh6PBiawV3W7qbOinHoazG3XZ3OQqijEcx5qkVO5T8dzYJSnlyNEpIzXONcNIeAU
 q4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=G4RFBC/bjFBDl9Ozu5vssYifGaa+CV/ji6uZKewPJ78=;
 b=JxScPN9B/qtGhR3vUbi7rJBECrP7rQJPhb0M3EBVSmcE8mzJlT7RS81QU5C97rMMZ4
 coYQbZ3QQK7QnkEKOR/G2TOAai7UYMWi9NHiaSo2DRCYHYNwCCOZAw7Xoe+wC/bsow5B
 8VxcubQTP3fxDOtUANbySZC6Q5xJbNjGM6/L5jmz82FsZSTx2THGwnKHlYzlywBamodI
 /PTShY4wWyVNCoK87JjBerzuKxIXvI2nmnm0N2HoAJUCzj5UMFhKUTbyBD5DB9RACM1i
 QSQ4jDNlOKZTUihQAQx297Jl05O+j9t69D59B4ixDKEi3QyoQJ8iNdyBLl6YUa7j+W72
 g5pQ==
X-Gm-Message-State: APjAAAX2KpDy1GghptCHbVHicJlrCEehlPdGtnUp+yQmIXJzTdtpSlHq
 4cmkqBRRdNzvdOldDz+4lY2Yk/1FzL0=
X-Received: by 2002:a62:ed10:: with SMTP id u16mr6442673pfh.179.1567019159891; 
 Wed, 28 Aug 2019 12:05:59 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:34 -0700
Message-Id: <20190828190456.30315-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v3 47/69] target/arm: Convert T16 load/store
 (register offset)
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
X-TUID: qWuDow2Vbm0H

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 51 ++----------------------------------------
 target/arm/t16.decode  | 15 +++++++++++++
 2 files changed, 17 insertions(+), 49 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6e841c346f..73b4ac8efb 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10841,55 +10841,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         goto illegal_op;
 
     case 5:
-        /* load/store register offset.  */
-        rd = insn & 7;
-        rn = (insn >> 3) & 7;
-        rm = (insn >> 6) & 7;
-        op = (insn >> 9) & 7;
-        addr = load_reg(s, rn);
-        tmp = load_reg(s, rm);
-        tcg_gen_add_i32(addr, addr, tmp);
-        tcg_temp_free_i32(tmp);
-
-        if (op < 3) { /* store */
-            tmp = load_reg(s, rd);
-        } else {
-            tmp = tcg_temp_new_i32();
-        }
-
-        switch (op) {
-        case 0: /* str */
-            gen_aa32_st32_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 1: /* strh */
-            gen_aa32_st16_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 2: /* strb */
-            gen_aa32_st8_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 3: /* ldrsb */
-            gen_aa32_ld8s_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 4: /* ldr */
-            gen_aa32_ld32u_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 5: /* ldrh */
-            gen_aa32_ld16u_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 6: /* ldrb */
-            gen_aa32_ld8u_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        case 7: /* ldrsh */
-            gen_aa32_ld16s_iss(s, tmp, addr, get_mem_index(s), rd | ISSIs16Bit);
-            break;
-        }
-        if (op >= 3) { /* load */
-            store_reg(s, rd, tmp);
-        } else {
-            tcg_temp_free_i32(tmp);
-        }
-        tcg_temp_free_i32(addr);
-        break;
+        /* load/store register offset, in decodetree */
+        goto illegal_op;
 
     case 6:
         /* load/store word immediate offset */
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 44e7250c55..83fe4363c7 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -23,6 +23,7 @@
 &s_rrr_shr       !extern s rn rd rm rs shty
 &s_rri_rot       !extern s rn rd imm rot
 &s_rrrr          !extern s rd rn rm ra
+&ldst_rr         !extern p w u rn rt rm shimm shtype
 
 # Set S if the instruction is outside of an IT block.
 %s               !function=t16_setflags
@@ -54,3 +55,17 @@ ORR_rrri         010000 1100 ... ...            @lll_noshr
 MUL              010000 1101 rn:3 rd:3          &s_rrrr %s rm=%reg_0 ra=0
 BIC_rrri         010000 1110 ... ...            @lll_noshr
 MVN_rxri         010000 1111 ... ...            @lll_noshr
+
+# Load/store (register offset)
+
+@ldst_rr         ....... rm:3 rn:3 rt:3 \
+                 &ldst_rr p=1 w=0 u=1 shimm=0 shtype=0
+
+STR_rr           0101 000 ... ... ...           @ldst_rr
+STRH_rr          0101 001 ... ... ...           @ldst_rr
+STRB_rr          0101 010 ... ... ...           @ldst_rr
+LDRSB_rr         0101 011 ... ... ...           @ldst_rr
+LDR_rr           0101 100 ... ... ...           @ldst_rr
+LDRH_rr          0101 101 ... ... ...           @ldst_rr
+LDRB_rr          0101 110 ... ... ...           @ldst_rr
+LDRSH_rr         0101 111 ... ... ...           @ldst_rr
-- 
2.17.1

