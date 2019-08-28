Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1211793wrs;
        Wed, 28 Aug 2019 13:06:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxF2hbvg8QwNM4oZTBtXB/B5HcLcu/UyMxjDZlGt6M9IAll05vskNBZBQKx8vh3jF7Ss5NK
X-Received: by 2002:a17:906:4b15:: with SMTP id y21mr4980965eju.57.1567022776349;
        Wed, 28 Aug 2019 13:06:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567022776; cv=none;
        d=google.com; s=arc-20160816;
        b=euJ/T8d16EFabxY5xlDixCdrMXfFRrV2Jlxdgyib45wFFitvPb83Fe4+etUzgyhZBd
         XOon0MqAJ9Sa9RyisNKpO+nFY0nQw1wRiPd91X2MTA+N0qYNVi+AGNMn2IhdaYIwbMzA
         vuvATerP3K6OETmBRLYxymq5H2sDXGUzzZhTWCUjeMY1i7n46TzmOPcOAzfc8Ib3H6p8
         tM7BHKlnn0OgM8bqdbj7NM5H6Rx3gwaSK+R8CLS3mW/r59b5mN5rDhZEVaBB0Np0Ml96
         P2FVNbuOrlt4yw7Ffk/DN5AyFpUoObjxa0Shsix3halVbMf6reIIv12NXQ7/AyZ1cPlj
         Iprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=6MCGFTmei0/LomQ5kSqH0JJCmj9qk8EmtY5FJ9APNto=;
        b=h1uU8FHV2xDcUoyLj2W3iDwVYETbfkP7OKngAhlAChxj116vzMNjAYKMw+rD6jG5UL
         nXUJ3SnD513WMjcYsuzu/2mIdVnsl44r2kZJ+lguWlnb8hlGGkN+ID3J7S9xwO6Oeu9y
         bwa1MTnqAInWaC3oekoNz9VGDTGLaFvPuZeMp7f2WduOoGGY5tDUXGehs+FBuG/abbNw
         q5YEiIMEgJ27AnTCxCndIG3LqNLASIqUwz2+lCde6Tuod3/pJ3OQKphh+norW4Rb5gI2
         r+T+rPdijmfI679nFRvbVU2LOpmBcc41l8ROi+iiNqJlJFtsZF1zxGahvA/3h0mnjXLe
         9MDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=erxTp27y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q54si1898240eda.168.2019.08.28.13.06.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 13:06:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=erxTp27y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i34Cs-0005RO-Qk
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 16:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38597)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gl-0003tz-5h
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gj-0000bk-Ij
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:10 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:33125)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Gi-0000XL-Bz
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:08 -0400
Received: by mail-pg1-x541.google.com with SMTP id n190so238979pgn.0
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6MCGFTmei0/LomQ5kSqH0JJCmj9qk8EmtY5FJ9APNto=;
 b=erxTp27yilKFTy0BE4fI3n4xYC6VEA9GgNc62jBB4wz8rvfhJVisEGTZkdKL4yWr04
 IRf0W6tJaeTvppRPHulBluNwX9LsstOyDoZtKmhFOpa4RQvJ6NFULZIJKPXnHhw+wHyw
 iNhLwG0HbndKrWSpeYork+qk4vMDYhvcIHvz59A7b+DPHuHSsn79DIxyCC9CYOfDHT97
 mDo7JTIW3P22xKkBo/LSVgGcgTM4+vzntLqaPVT48LAGKRxtgzAblbWSrQj0gzrHazWN
 +jM14njb5N3s1DNHUv/tKc9UNQSEVzVTLyYFK5SFGjxeRLKkN9Niyf2UBuXZ24awk72Y
 LDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6MCGFTmei0/LomQ5kSqH0JJCmj9qk8EmtY5FJ9APNto=;
 b=KhGSpwtpmtnzxA4bdhUCxqtdyvzhxwLPCfdsPjZtgVP69/6NiDfmejXxsrqZw3xPsv
 BQBSgGmKwm1Zuncg+rVlggNfVqse5ul7fQAjeajmRYjmtB+SgQ+9/7ppvaL68Hfx9Uvq
 3Pm5+ce9NMR5TXfJ0csxuiUOIlcHH9n3XTf0d1oCpAw/nt2ZkSc/I3W7s6hYnGUjsi4w
 qiSm5BgJgenGOxXwuOmDjmVvLq5E+oCGg7qLml60mzFtCgX9FiN+0I668vLn86xMwu1I
 8CshlGitHNEGHzaEfkvOBP5WI3AJkldcWI4zhQydlmJjuwwK9EfZCBmqTkpv65/zP4HN
 PeuA==
X-Gm-Message-State: APjAAAVb2vOgXkjIzfUg8XXGspICaceTSlVe/5kMaqJm5+GhXcaAzr1o
 2F/KYOQeR2a2hPtyR6GGZbcp9kyC9pc=
X-Received: by 2002:a63:de4c:: with SMTP id y12mr4873135pgi.264.1567019163712; 
 Wed, 28 Aug 2019 12:06:03 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:37 -0700
Message-Id: <20190828190456.30315-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v3 50/69] target/arm: Convert T16 load/store
 multiple
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
X-TUID: FqUtvCxQR3+A

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 48 ++++++++----------------------------------
 target/arm/t16.decode  |  8 +++++++
 2 files changed, 17 insertions(+), 39 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d8dfddaea3..b6ee123bf5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10059,6 +10059,14 @@ static bool trans_LDM_t32(DisasContext *s, arg_ldst_block *a)
     return do_ldm(s, a, 2);
 }
 
+static bool trans_LDM_t16(DisasContext *s, arg_ldst_block *a)
+{
+    /* Writeback is conditional on the base register not being loaded.  */
+    a->w = !(a->list & (1 << a->rn));
+    /* BitCount(list) < 1 is UNPREDICTABLE */
+    return do_ldm(s, a, 1);
+}
+
 /*
  * Branch, branch with link
  */
@@ -10846,6 +10854,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     case 8: /* load/store halfword immediate offset, in decodetree */
     case 9: /* load/store from stack, in decodetree */
     case 10: /* add PC/SP (immediate), in decodetree */
+    case 12: /* load/store multiple, in decodetree */
         goto illegal_op;
 
     case 11:
@@ -11069,45 +11078,6 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         }
         break;
 
-    case 12:
-    {
-        /* load/store multiple */
-        TCGv_i32 loaded_var = NULL;
-        rn = (insn >> 8) & 0x7;
-        addr = load_reg(s, rn);
-        for (i = 0; i < 8; i++) {
-            if (insn & (1 << i)) {
-                if (insn & (1 << 11)) {
-                    /* load */
-                    tmp = tcg_temp_new_i32();
-                    gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
-                    if (i == rn) {
-                        loaded_var = tmp;
-                    } else {
-                        store_reg(s, i, tmp);
-                    }
-                } else {
-                    /* store */
-                    tmp = load_reg(s, i);
-                    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
-                    tcg_temp_free_i32(tmp);
-                }
-                /* advance to the next address */
-                tcg_gen_addi_i32(addr, addr, 4);
-            }
-        }
-        if ((insn & (1 << rn)) == 0) {
-            /* base reg not in list: base register writeback */
-            store_reg(s, rn, addr);
-        } else {
-            /* base reg in list: if load, complete it now */
-            if (insn & (1 << 11)) {
-                store_reg(s, rn, loaded_var);
-            }
-            tcg_temp_free_i32(addr);
-        }
-        break;
-    }
     case 13:
         /* conditional branch or swi */
         cond = (insn >> 8) & 0xf;
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 71b3e8f02e..a7a437f930 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -26,6 +26,7 @@
 &ri              !extern rd imm
 &ldst_rr         !extern p w u rn rt rm shimm shtype
 &ldst_ri         !extern p w u rn rt imm
+&ldst_block      !extern rn i b u w list
 
 # Set S if the instruction is outside of an IT block.
 %s               !function=t16_setflags
@@ -109,3 +110,10 @@ LDR_ri          10011 ... ........              @ldst_spec_i rn=13
 ADR             10100 rd:3 ........             imm=%imm8_0x4
 ADD_rri         10101 rd:3 ........ \
                 &s_rri_rot rn=13 s=0 rot=0 imm=%imm8_0x4  # SP
+
+# Load/store multiple
+
+@ldstm          ..... rn:3 list:8               &ldst_block i=1 b=0 u=0 w=1
+
+STM             11000 ... ........              @ldstm
+LDM_t16         11001 ... ........              @ldstm
-- 
2.17.1

