Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207801wrv;
        Fri, 26 Jul 2019 10:51:45 -0700 (PDT)
X-Received: by 2002:a63:1:: with SMTP id 1mr27860203pga.162.1564163505278;
        Fri, 26 Jul 2019 10:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163505; cv=none;
        d=google.com; s=arc-20160816;
        b=VADP9wgZqu4OFi8fMkY80A+W7VF4MbhmLrBZH0k1P3iA45UmHoWHfbpLSLR3tmgwwf
         fKHW2Yu2VG1ngGdtwrU8ihFlgrc8mgTsoPIl/D7TwaB7JlCcB7KRiJkv9ggBVg8NzaqP
         H6i/yNjg+QHAz3k28ZFabAYTx8z0dFImu1DPcbEZErQXvgWZlRmwa3ZhFitpJ+ygJT9l
         +8DxzLHruYUKWhltZIBpIl65YBOYNnw1EyfTWKSczQ0bcp5iP65AagYbflB7vpfNuKNN
         fmyXBHrVcSv5cL0wcPvRZefYg671TqjZpsTJ/ZBJOVSsQJCFxJv8XM4UH6DnO2ndaYk5
         WklQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=kW5KBD6wPpayXUHizYdiz+TBRbqx6bgCGmxteuVYILs=;
        b=CnmHupu6rJ7wEnO9BHZWRQ2Ba5at7i33es+40XAd0CDkLIRxj9Ue9D8J3K2Y+pTO3y
         dS9i4YJd++8MxJlvc31tl/URefEuBtzXgxuujz7i1d4W+hQY64Te5V9aCONZNbDyUPl8
         EgKf59vQT4kaWiU/fOZtMT0R4Gv/kuAZxfuqJkcCzkBqNvf+b4A7S2DLQfGHMRrccxLU
         s5ySrfWI8elrcUJMmT3vLKxSkMO0laUkC9hBbACq30kP8NTr3pBWHDHfBQ8QxP8XFrCv
         7SObyPKVspHZMuUpf5xXapmHwyTlfBLfhpNzf2tDrxwJtDvFmoIjcbE49GCAGVjUESVv
         0qEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P/NyunXc";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y13sor14439719pgs.85.2019.07.26.10.51.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P/NyunXc";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kW5KBD6wPpayXUHizYdiz+TBRbqx6bgCGmxteuVYILs=;
        b=P/NyunXcP/IxoRd21r8LFlzNsCYrAu6YIymG9KavT2DR7sxxz19uDsHBFb1qt8XIi7
         jpvFuIoGGINF0D06C9w/2gEtGWiIowCQxwB7c07LvT6OxWKsK7L4SKmiuHbcPnSkyDLD
         EqE0WLtr5WEWfxBIs9ZYHX8UhXUCTGubbR8A50e47WmstEN55Ln5Zs+xsELxUcPalCdJ
         kwkzTuTPnjIxo43G7SCZ0lrjtNv2s8kGe4Aq3fo+hX+4EecyK4nflkk41qrzLyH2PlZP
         WTLnB451CMQivPVPQaUJqASpW34JWUD6e/b5P3qI/H/CvSzhplNDzOBHEssqkeKj4Zsq
         DB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kW5KBD6wPpayXUHizYdiz+TBRbqx6bgCGmxteuVYILs=;
        b=UOtRkz+XrhtH3PcvJ1wmy8p+Pjep288xh66+8aqK6ufBhHZjc6hdOjYmGty5OBjj9k
         6vEfbu98PxLhV4o5T6+2R3JlWNou1MN7ysVy3hey82xbTi/1nREyWrrYJoOkSSbNiaqr
         zmb3YEbN9Ttehf/QwHk3mEG+oTOL9A0LZQLYq/LhZa3aUWQswxCMQtSDDuKUE+Lpsut6
         LN8TD4f28wY+HMrqTVnzIhq/xNcLS5ESD7DVHtNrxefbrJqmsNH/fNf+CQ0ofmgkKmrC
         4okpgUV8zMVMt0DEYcyiNr437dRVKp9mimysHC6lUgbqSyC9o/bk2yt6ewbw+/u6Fq2m
         MKqw==
X-Gm-Message-State: APjAAAVavRE7lDzB5MXfPyB8dHXMFAjiKYOY8p/+F+CbHwDt/tlVTGFz
	vijhGBT7hrTSnXWDFKyBViLKnLHr
X-Google-Smtp-Source: APXvYqwCHY7DHVEOhzrT5JP5/duzgDe6SkCg5mQuQ4fu0HzD+iEFYkZMadgK2cLvAC9CfTqeMPHMkw==
X-Received: by 2002:a65:5c4b:: with SMTP id v11mr49756112pgr.62.1564163504727;
        Fri, 26 Jul 2019 10:51:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 59/67] target/arm: Convert T16, Conditional branches, Supervisor call
Date: Fri, 26 Jul 2019 10:50:24 -0700
Message-Id: <20190726175032.6769-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: KtcWHYJLBtAM

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 +++-----------------------
 target/arm/t16.decode  | 12 ++++++++++++
 2 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5d0d0779c8..97c472c8f7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10626,7 +10626,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val, op, rm, rd, shift, cond;
+    uint32_t val, op, rm, rd, shift;
     int32_t offset;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
@@ -10767,28 +10767,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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
-            gen_set_pc_im(s, s->pc);
-            s->svc_imm = extract32(insn, 0, 8);
-            s->base.is_jmp = DISAS_SWI;
-            break;
-        }
-        /* generate a conditional jump to next instruction */
-        arm_skip_unless(s, cond);
-
-        /* jump to the offset */
-        val = s->pc_read;
-        offset = ((int32_t)insn << 24) >> 24;
-        val += offset << 1;
-        gen_jmp(s, val);
-        break;
+    case 13: /* conditional branch or swi, in decodetree */
+        goto illegal_op;
 
     case 14:
         if (insn & (1 << 11)) {
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 10cdca1fbb..f4091c812d 100644
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
 LDM             1011 110 ......... \
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
