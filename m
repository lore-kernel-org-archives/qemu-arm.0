Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206963wrv;
        Fri, 26 Jul 2019 10:50:54 -0700 (PDT)
X-Received: by 2002:a17:902:d715:: with SMTP id w21mr59145421ply.261.1564163454189;
        Fri, 26 Jul 2019 10:50:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163454; cv=none;
        d=google.com; s=arc-20160816;
        b=eV74C/blCgUUfYTPSJqyt/Wvi/X57aPZT3Cto7QuYPzik3oVJsOo91v85TJOrJ0nT7
         7YTNBOgydxl0RtUHYykufYAXgXafUs6xEQeq0N6Qzn5odSKRFmUC75qpgti5aZMZlJTv
         K4xXA71BgkEbGv6ogOQvakbt0JVTPZUFt5a/VVQzWSTKhDwfufzUU1IlexHXpV6guYsa
         tMSwYOEUZkfEpgvxIwjHQjy7dxc6fXRttRXq7aOStJtNWMX4liS+f+konNaD1W+Nl53E
         fqnttm2BkVC5MG3PAS4oW2T7OhIp8lOP0ygWvUioErEv01/uP9qSrxST8/Th/FNmVJQm
         ToBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=4ALWL+uoJUM+006aGewT3E/ArRPeObW9mCQYZxOKNhg=;
        b=BqWIyWcuQjXLZVbWv/9Q/yjw4hbEA79LxHYabU75zA1gpipA/vmAHOjCBwb4LIJO7I
         7gpLCvJBryufpfpEXLbk8uGiiBVG50r716bmZHMfWhZIjhKjyAauQCeRgqcZEQjHvgPp
         Ka+rapIAWxqQrK5N6Aihfq5MPm6lT0k0+/0v7eY98fGbMHA2F9HJTjakxBNhP09jEtIJ
         50WQUtf/Fc8BasOmGIBM5iUFH/8+sqOdGRLVpIZaP9N2guuXH1F9JPiqZhdCP0JA75w8
         zg30zgpkJrzA4elIhyoOcaklrCcZnkE2K0FZDB4uwdrCEAheq5IW8ceV+waMrhzMFLLu
         /ssQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ukzzjtgk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h26sor35068525pfo.20.2019.07.26.10.50.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ukzzjtgk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4ALWL+uoJUM+006aGewT3E/ArRPeObW9mCQYZxOKNhg=;
        b=UkzzjtgkD3XEQARx/R51cETEunwutE29JNVmjuiVAQYcmK/Xv3BwkhKofr9fDDyTct
         2gU575BmE1wSjA0Dgs40/lZleoJHxagmioyMn0e4pGsCwATXkZNp5jAdRWcFaipXFPJl
         RGyuR72Pv1d98IKUHAgJuV4L3C/QfG5KI05zsX/TaN+GUPJfPtkzCh8OCn70XHQZVY3H
         i469v3RIHnYEBajRgk1UxJx/O2vaFAVVAWQIEMQVCkezHHLyPoFrAaRTETYqcfYCpJew
         liA3mtdb+IOt5lpll76H9rFwo1Lpkxal0+jNcf52YcBnTsPZui5QIS354FMqqLG5+IN1
         SE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4ALWL+uoJUM+006aGewT3E/ArRPeObW9mCQYZxOKNhg=;
        b=T9dZSj9lMMF+4xP5Algc3U74RVmk3FA83rLlUMVFYrcNCQw5ARpwcTXXOaLN5Zy452
         8J6YbSOgHBy2ExJHSrkzs81Z+ONKyX9lzH3qzRWLwxg+2EMbal2Dn4aZo4RPRoiaDxEr
         HdiBKHyYJl2t7HMun/RSUZIoyohF9qu/aMY5VcU/gqKUN+7XThCJt1ydIVGJz2b7KisD
         FRQrKd2r3XEAZxIRmXFX4Q8poW5sPJTx/OZdrz0Y6X/p0bFySjcipSNCYrAu53H+FT56
         2hKagbCO1IgMnQvPf5fniRaFwtZkoPIAn9bRRhdK2l2/wxeYNZ9YJuUEBD0SAUaf4DaU
         M07A==
X-Gm-Message-State: APjAAAXcE+8mPvOqCyjloVPxA0FGvTqF7WRWZXE9mx3J73egL3yzwhoH
	fkTP0q3Uf00AQiYe/QZ3PlVxlooO
X-Google-Smtp-Source: APXvYqwca/sC2H39BeVHtUg87j3D7LIfq9XM2zSriG3K2ZAtpxlC6nunc0IQkYcNjZeBWO85V0ksrQ==
X-Received: by 2002:aa7:8218:: with SMTP id k24mr22624844pfi.221.1564163453745;
        Fri, 26 Jul 2019 10:50:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.52
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 17/67] target/arm: Convert MSR (immediate) and hints
Date: Fri, 26 Jul 2019 10:49:42 -0700
Message-Id: <20190726175032.6769-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: g2H+INHEt/rZ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 61 +++++++++++++++++++++++++++++-------------
 target/arm/a32.decode  | 25 +++++++++++++++++
 target/arm/t32.decode  | 17 ++++++++++++
 3 files changed, 84 insertions(+), 19 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2140671eb2..36c815caf3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8324,6 +8324,44 @@ DO_SMLAWX(SMLAWT, 1, 1)
 
 #undef DO_SMLAWX
 
+/*
+ * MSR (immediate) and hints
+ */
+
+static bool trans_YIELD(DisasContext *s, arg_YIELD *a)
+{
+    gen_nop_hint(s, 1);
+    return true;
+}
+
+static bool trans_WFE(DisasContext *s, arg_WFE *a)
+{
+    gen_nop_hint(s, 2);
+    return true;
+}
+
+static bool trans_WFI(DisasContext *s, arg_WFI *a)
+{
+    gen_nop_hint(s, 2);
+    return true;
+}
+
+static bool trans_NOP(DisasContext *s, arg_NOP *a)
+{
+    return true;
+}
+
+static bool trans_MSR_imm(DisasContext *s, arg_MSR_imm *a)
+{
+    uint32_t val = ror32(a->imm, a->rot * 2);
+    uint32_t mask = msr_mask(s, a->mask, a->r);
+
+    if (gen_set_psr_im(s, mask, a->r, val)) {
+        gen_illegal_op(s);
+    }
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -8594,22 +8632,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
             }
             store_reg(s, rd, tmp);
         } else {
-            if (((insn >> 12) & 0xf) != 0xf)
-                goto illegal_op;
-            if (((insn >> 16) & 0xf) == 0) {
-                gen_nop_hint(s, insn & 0xff);
-            } else {
-                /* CPSR = immediate */
-                val = insn & 0xff;
-                shift = ((insn >> 8) & 0xf) * 2;
-                if (shift)
-                    val = (val >> shift) | (val << (32 - shift));
-                i = ((insn & (1 << 22)) != 0);
-                if (gen_set_psr_im(s, msr_mask(s, (insn >> 16) & 0xf, i),
-                                   i, val)) {
-                    goto illegal_op;
-                }
-            }
+            /* MSR (immediate) and hints */
+            /* All done in decodetree.  Illegal ops already signalled.  */
+            g_assert_not_reached();
         }
     } else if ((insn & 0x0f900000) == 0x01000000
                && (insn & 0x00000090) != 0x00000090) {
@@ -10569,9 +10594,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                             goto illegal_op;
                         break;
                     case 2: /* cps, nop-hint.  */
-                        if (((insn >> 8) & 7) == 0) {
-                            gen_nop_hint(s, insn & 0xff);
-                        }
+                        /* nop hints in decodetree */
                         /* Implemented as NOP in user mode.  */
                         if (IS_USER(s))
                             break;
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 8dc74dfdb8..4cefba6f0e 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -22,6 +22,7 @@
 # All insns that have 0xf in insn[31:28] are in a32u.decode.
 #
 
+&empty
 &s_rrr_shi       s rd rn rm shim shty
 &s_rrr_shr       s rn rd rm rs shty
 &s_rri_rot       s rn rd imm rot
@@ -152,3 +153,27 @@ SMULBB           .... 0001 0110 .... 0000 .... 1000 ....      @rd0mn
 SMULBT           .... 0001 0110 .... 0000 .... 1100 ....      @rd0mn
 SMULTB           .... 0001 0110 .... 0000 .... 1010 ....      @rd0mn
 SMULTT           .... 0001 0110 .... 0000 .... 1110 ....      @rd0mn
+
+# MSR (immediate) and hints
+
+&msr_i           r mask rot imm
+@msr_i           ---- .... .... mask:4 .... rot:4 imm:8       &msr_i
+
+{
+  {
+    YIELD        ---- 0011 0010 0000 1111 ---- 0000 0001
+    WFE          ---- 0011 0010 0000 1111 ---- 0000 0010
+    WFI          ---- 0011 0010 0000 1111 ---- 0000 0011
+
+    # TODO: Implement SEV, SEVL; may help SMP performance.
+    # SEV        ---- 0011 0010 0000 1111 ---- 0000 0100
+    # SEVL       ---- 0011 0010 0000 1111 ---- 0000 0101
+
+    # The canonical nop ends in 00000000, but the whole of the
+    # rest of the space executes as nop if otherwise unsupported.
+    NOP          ---- 0011 0010 0000 1111 ---- ---- ----
+  }
+  # Note mask = 0 is covered by NOP
+  MSR_imm        .... 0011 0010 .... 1111 .... .... ....      @msr_i r=0
+}
+MSR_imm          .... 0011 0110 .... 1111 .... .... ....      @msr_i r=1
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index e611ac4969..b4f0a9632d 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -19,6 +19,7 @@
 # This file is processed by scripts/decodetree.py
 #
 
+&empty           !extern
 &s_rrr_shi       !extern s rd rn rm shim shty
 &s_rrr_shr       !extern s rn rd rm rs shty
 &s_rri_rot       !extern s rn rd imm rot
@@ -166,3 +167,19 @@ QADD             1111 1010 1000 .... 1111 .... 1000 ....      @rndm
 QSUB             1111 1010 1000 .... 1111 .... 1010 ....      @rndm
 QDADD            1111 1010 1000 .... 1111 .... 1001 ....      @rndm
 QDSUB            1111 1010 1000 .... 1111 .... 1011 ....      @rndm
+
+# Branches and miscellaneous control
+
+{
+  YIELD          1111 0011 1010 1111 1000 0000 0000 0001
+  WFE            1111 0011 1010 1111 1000 0000 0000 0010
+  WFI            1111 0011 1010 1111 1000 0000 0000 0011
+
+  # TODO: Implement SEV, SEVL; may help SMP performance.
+  # SEV          1111 0011 1010 1111 1000 0000 0000 0100
+  # SEVL         1111 0011 1010 1111 1000 0000 0000 0101
+
+  # The canonical nop ends in 0000 0000, but the whole rest
+  # of the space is "reserved hint, behaves as nop".
+  NOP            1111 0011 1010 1111 1000 0000 ---- ----
+}
-- 
2.17.1
