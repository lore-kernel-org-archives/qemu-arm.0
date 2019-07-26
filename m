Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207883wrv;
        Fri, 26 Jul 2019 10:51:51 -0700 (PDT)
X-Received: by 2002:a17:902:2865:: with SMTP id e92mr58051743plb.264.1564163511043;
        Fri, 26 Jul 2019 10:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163511; cv=none;
        d=google.com; s=arc-20160816;
        b=iwA7Bj0Pm159Ut4opwpeIS0LKdBrXAkdfw5pjFWKQS5/oeNyC3jhfK57kkoSVRwzZj
         UdLhndJgcJZlfS9lG/EbvZSArG8CHQ9QlJeHo6J4VbcYEmPd0k5z+JoMUrMi7s29LW3a
         QfSd9v/0GLvjvKB8Qr+m2HfjCSZNT0CfjnCgqP9rHrXxMBp4I9oJL6T4sucyVEux3787
         2BSFCy3eBuC1spnB6/bO8FX3ckf7YjTgMCRy/agg2j4VEKNGbLFVNOxK/ARlflmjQJOe
         a4XGUtEmLfCm6lCNm89nui9w85XSxjulKHvJSxC+/NDh78RGNu0pqjsBDp9B4o1SLlFn
         7vMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=3dOWwe1vKbsdIWS0nSZCwW1yYPHjDGBihHkemS/ZoSY=;
        b=wrvqtU1aH367Z14Os8LNksrnFKL8gD86odgyg5AoBCKLayPyY5Bw3jZM0OIzluq4tq
         WnS5oIKIb+5hpKV+iwgFmXj4MgkD57xYhwYfP7vXgX6sur+aIdyDytBYyr8E+8KjMAp9
         Wq2om+akoeV+bAO9ni1GZw9GKF76zWWMrSOy9K5XGRNRKmM2KM/d9b7b1TI+9J/vPBM3
         bj8E8dHpPJHPIWJQ6kb3FAYz1x4xL0E3KP/WQfQlZaHJH1h3Gg6KR5JjXcGnuvv/MHSC
         cvDLvfNMZYu1ct/2jts6ZyL73nnrI+KNhm16N6TmEQLPaNNSkAJn08XLb2l70LCueRyR
         S3xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dyjxBfl6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r69sor64479907pjb.8.2019.07.26.10.51.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dyjxBfl6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3dOWwe1vKbsdIWS0nSZCwW1yYPHjDGBihHkemS/ZoSY=;
        b=dyjxBfl6BToPNY6VUCaToZdn+s3aAJ3ikTyADQR8Az2DKnYBVnzU2dQphCMsyF9HG/
         r0Z9VBcJ5us5CMliebrRm1mSwNgv25a+PiwxJD3uostHSQCLPEKqk3SHbX0wGx188awC
         W4Du//iD6wHfG4KEhfBsK9bijFmA7SYGsG4znsMUEaG0STRCRroeH7ayMz/nD7GQ64Cw
         7mmypMsmAQfjwo46JrX8LU6DR3ojdQ+fDiC5P0z7E/Rcl13GQWkKAWue+OK8N4amtoye
         4j4V3eIG4ka4mnct1ctgZVybj8rCZ0f0Gsf7DbCNT5xgzjOusEs5SFiy4gQCvMCnglAj
         cZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3dOWwe1vKbsdIWS0nSZCwW1yYPHjDGBihHkemS/ZoSY=;
        b=PU5kqeHI6u+avF2Kbm6mxJq4vEwlFkGgBsZO4WBPapoXyNmDVxlHFlZW61hbVtsNcQ
         eBrXYm3GmWHuZPQvT4L7Rk+SY9CGMQJBkAVRkyy1RHaeweIQGKOeF68JgFUPVtEU1Rvj
         XkNYxHMeqHpy64RlNbVXv4QQV9i9IKFNY3PCyzToKDjkoZS6hKq0anRhIbrWGZrOydur
         vywCFhp5wASn9GT4mupyiQw8a2mtvLZ31uViYXZGIkYMrkq4Ymyd/vz0av4LpJL32QO/
         5SVXL7q0cPzzfHKEj0VWwnDERjjuiuX658Slw/aBsvB8fwd3jK/QQwzAHg03I1VATS0u
         g4ow==
X-Gm-Message-State: APjAAAWOiUGN6h8Twtm6GgM7XYh2gFzt2TonJx7GAj+KCUXIbdqyLPIK
	RGN6+HRgZlypBgurWOCErQkpo6da
X-Google-Smtp-Source: APXvYqwrgH57aatk/3onnC93pqHwwPgK+EsFQMEBnq8iAE4QrWKCr+KF9gzL7xiEyfHH3uwulqeu+A==
X-Received: by 2002:a17:90a:37ac:: with SMTP id v41mr94950125pjb.6.1564163510598;
        Fri, 26 Jul 2019 10:51:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 64/67] target/arm: Convert T16, long branches
Date: Fri, 26 Jul 2019 10:50:29 -0700
Message-Id: <20190726175032.6769-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: irtD4VoIG4Cj

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 89 +++++++++++++++++++-----------------------
 target/arm/t16.decode  |  3 ++
 2 files changed, 43 insertions(+), 49 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 480515a0a9..a8db6e9280 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10055,6 +10055,44 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     return true;
 }
 
+static bool trans_BL_BLX_prefix(DisasContext *s, arg_BL_BLX_prefix *a)
+{
+    /*
+     * thumb_insn_is_16bit() ensures we can't get here for
+     * a Thumb2 CPU, so this must be a thumb1 split BL/BLX.
+     */
+    assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
+    tcg_gen_movi_i32(cpu_R[14], s->pc_read + (a->imm << 12));
+    return true;
+}
+
+static bool trans_BL_suffix(DisasContext *s, arg_BL_suffix *a)
+{
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
+    tcg_gen_addi_i32(tmp, cpu_R[14], (a->imm << 1) | 1);
+    tcg_gen_movi_i32(cpu_R[14], s->pc | 1);
+    gen_bx(s, tmp);
+    return true;
+}
+
+static bool trans_BLX_suffix(DisasContext *s, arg_BLX_suffix *a)
+{
+    TCGv_i32 tmp;
+
+    assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
+    if (!ENABLE_ARCH_5) {
+        return false;
+    }
+    tmp = tcg_temp_new_i32();
+    tcg_gen_addi_i32(tmp, cpu_R[14], a->imm << 1);
+    tcg_gen_andi_i32(tmp, tmp, -4);
+    tcg_gen_movi_i32(cpu_R[14], s->pc | 1);
+    gen_bx(s, tmp);
+    return true;
+}
+
 static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
 {
     TCGv_i32 addr, tmp;
@@ -10639,10 +10677,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    int32_t offset;
-    TCGv_i32 tmp;
-    TCGv_i32 tmp2;
-
     if (disas_t16(s, insn)) {
         return;
     }
@@ -10661,53 +10695,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     case 11: /* misc, in decodetree */
     case 12: /* load/store multiple, in decodetree */
     case 13: /* conditional branch or swi, in decodetree */
-        goto illegal_op;
-
     case 14:
-        if (insn & (1 << 11)) {
-            /* thumb_insn_is_16bit() ensures we can't get here for
-             * a Thumb2 CPU, so this must be a thumb1 split BL/BLX:
-             * 0b1110_1xxx_xxxx_xxxx : BLX suffix (or UNDEF)
-             */
-            assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
-            ARCH(5);
-            offset = ((insn & 0x7ff) << 1);
-            tmp = load_reg(s, 14);
-            tcg_gen_addi_i32(tmp, tmp, offset);
-            tcg_gen_andi_i32(tmp, tmp, 0xfffffffc);
-
-            tmp2 = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp2, s->pc | 1);
-            store_reg(s, 14, tmp2);
-            gen_bx(s, tmp);
-            break;
-        }
-        /* unconditional branch, in decodetree */
-        goto illegal_op;
-
     case 15:
-        /* thumb_insn_is_16bit() ensures we can't get here for
-         * a Thumb2 CPU, so this must be a thumb1 split BL/BLX.
-         */
-        assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
-
-        if (insn & (1 << 11)) {
-            /* 0b1111_1xxx_xxxx_xxxx : BL suffix */
-            offset = ((insn & 0x7ff) << 1) | 1;
-            tmp = load_reg(s, 14);
-            tcg_gen_addi_i32(tmp, tmp, offset);
-
-            tmp2 = tcg_temp_new_i32();
-            tcg_gen_movi_i32(tmp2, s->pc | 1);
-            store_reg(s, 14, tmp2);
-            gen_bx(s, tmp);
-        } else {
-            /* 0b1111_0xxx_xxxx_xxxx : BL/BLX prefix */
-            uint32_t uoffset = ((int32_t)insn << 21) >> 9;
-
-            tcg_gen_movi_i32(cpu_R[14], s->pc_read + uoffset);
-        }
-        break;
+        /* branches, in decodetree */
+        goto illegal_op;
     }
     return;
 illegal_op:
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 457f2f4178..105218882a 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -274,3 +274,6 @@ LDM             1011 110 ......... \
 %imm11_0x2      0:s11 !function=times_2
 
 B               11100 ...........               &i imm=%imm11_0x2
+BLX_suffix      11101 imm:11                    &i
+BL_BLX_prefix   11110 imm:s11                   &i
+BL_suffix       11111 imm:11                    &i
-- 
2.17.1
