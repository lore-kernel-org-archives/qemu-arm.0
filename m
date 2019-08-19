Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3210681wrs;
        Mon, 19 Aug 2019 15:31:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxU7knHocc4xF84SrgtefAFyav92poxEeasiB3NGBC5pM52gdk9Vm1RrQd3jTS16PIfuV0E
X-Received: by 2002:a17:906:bceb:: with SMTP id op11mr23711077ejb.2.1566253870001;
        Mon, 19 Aug 2019 15:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566253869; cv=none;
        d=google.com; s=arc-20160816;
        b=AdotLNNEbJyqCmB4mEiIwqvNbzIVSyQ+d5+iC3fCptBZy+kWWyvT+RbwLwSmEy/SJZ
         HPE1ESg+XK+8ZKTSFjJHnyI5tp15hMT5LuHLPOoY2DODJyJsGsdFNeSnb+CagpbArKp6
         yCBYtEXXiUEcEFJNuE3gGWAPBL23tli9mCIBX8NhmektgK+hO6SQoXhymviHalmJmMMo
         HcuCM8XJz355hFCdkgh9Pg/Csf1chmRWxed05OpEgyIEq+Z8nxpkZFcujlXUgcyVyHCa
         Na2NK9rLXelthK9/UPp59Ta6eMbJtMtRLoN8RVHRD7MCAUiyuCjMd5winjCQEya5Z5ba
         xgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=CE2MOpYeaURMh2McMQcADxkv9nuiol4iRofGvabxWa4=;
        b=E0Gi3f+ntepnEygEJte3I2w6UBDOHvsjywwlstVGIZC6Y71AgJ4MzTFp8HZdt+SBdw
         Mka5m1EnzTnx5mWjxpcvcgp3NL/F9+0qOpYADw8fKkgU23jwFdQ0cV75Ta222g2Sl4Y/
         3hPGKzPYmj/4FrxTtUPhZyUefgW8Y556DTwSGbGolmra5BWNWM7It6PMQzspqS1XulRh
         lYaHqNDxdn28APqGEtmWPg+LRKvwWSYxqb6fofi80jXAHztCzwHpP6++tSf38GzEjMEK
         KlFSKw1NKL+HsMD+s9usrVtTYphHvj6CXl6r85EA1ixeR7Pd3G2SMNdPcgFFYVH3bHbM
         mO8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bHPuMY7A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t35si8337121eda.160.2019.08.19.15.31.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:31:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bHPuMY7A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzqBA-0007fR-Ve
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60196)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpN3-000381-9I
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpN1-00070T-Vb
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:21 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:40545)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpN1-0006zF-Pf
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:19 -0400
Received: by mail-pg1-x52f.google.com with SMTP id w10so1928617pgj.7
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CE2MOpYeaURMh2McMQcADxkv9nuiol4iRofGvabxWa4=;
 b=bHPuMY7AdYlyafexynlB/HZikO0mKlbdgJFNk15y7TjKMMC1G3aISNOKnFA0wi0nIx
 tmysV2g7ohX3GwfAYUJ3cjEBxifX7GVN/OQsfYcVW31Arh4bTxOisGwDaN9A/DVlpI4g
 wog512+IqdFpBhkT6qDB9n7y/sl6eFXqtYKghc429RFBY/7FRR+gF2QmBuJ1Bo5D3S3a
 sH/nOtI9FYsbRS+RqRTpqNKpC8dW060TwaaQSkCp9P3Q0zobi/cdkcHQC2nsolGVGH8w
 e5rQKR7u2JnzpGRLk8QdNQUF6vz+PWGYLQeHbw+Yaz88AQJYvdMd5jSkfI6XRwAd8hj0
 BOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CE2MOpYeaURMh2McMQcADxkv9nuiol4iRofGvabxWa4=;
 b=TvVnL3t3+l3BwIasx69b31ZmpR055T+QFIC8BXTGeSKq/gPe9kXhcZnVCPLYLF6FVl
 E8Z6KkZO4L3rJBF26RdGVfelxT1YiPZI/dQAxKHDGdjg99p0UBhi5lhmkXFYyDe8g37G
 MBYIlTmOyAiiJp4CCi1GLgcxzO8s6uzwakPz7EA1voS92j4pu3Az8zHctwhKEOh9cmwE
 WLjoySYdZFJpG06FeB46ZUhRlMPvelVTyE68WKPg4/+h2xM/mosQeib7zoZBGk+6xrkz
 8KPUjLxL/cghEMWKxA3kYo2wJyyLJfYsZ8r/QqsdkHhCQZbSqLl9l2Pins1mcom7vUGM
 hpdA==
X-Gm-Message-State: APjAAAUWIRzuR3/gZHUwS7XdW1oVdB4svPEllzAb+zUsw3QYt2zuUlz5
 VXlgppnI9HmoR2sAPom6TAsjQA==
X-Received: by 2002:a17:90a:3465:: with SMTP id
 o92mr22412655pjb.20.1566250758891; 
 Mon, 19 Aug 2019 14:39:18 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:39:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:53 -0700
Message-Id: <20190819213755.26175-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::52f
Subject: [Qemu-arm] [PATCH v2 66/68] target/arm: Convert T16, long branches
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
X-TUID: JcxEsuo/DPsh

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 89 +++++++++++++++++++-----------------------
 target/arm/t16.decode  |  3 ++
 2 files changed, 43 insertions(+), 49 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 51b14d409f..f8997a8424 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10025,6 +10025,44 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     return true;
 }
 
+static bool trans_BL_BLX_prefix(DisasContext *s, arg_BL_BLX_prefix *a)
+{
+    /*
+     * thumb_insn_is_16bit() ensures we can't get here for
+     * a Thumb2 CPU, so this must be a thumb1 split BL/BLX.
+     */
+    assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
+    tcg_gen_movi_i32(cpu_R[14], read_pc(s) + (a->imm << 12));
+    return true;
+}
+
+static bool trans_BL_suffix(DisasContext *s, arg_BL_suffix *a)
+{
+    TCGv_i32 tmp = tcg_temp_new_i32();
+
+    assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
+    tcg_gen_addi_i32(tmp, cpu_R[14], (a->imm << 1) | 1);
+    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
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
+    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
+    gen_bx(s, tmp);
+    return true;
+}
+
 static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
 {
     TCGv_i32 addr, tmp;
@@ -10612,10 +10650,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    int32_t offset;
-    TCGv_i32 tmp;
-    TCGv_i32 tmp2;
-
     if (disas_t16(s, insn)) {
         return;
     }
@@ -10634,53 +10668,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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
-            tcg_gen_movi_i32(tmp2, s->base.pc_next | 1);
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
-            tcg_gen_movi_i32(tmp2, s->base.pc_next | 1);
-            store_reg(s, 14, tmp2);
-            gen_bx(s, tmp);
-        } else {
-            /* 0b1111_0xxx_xxxx_xxxx : BL/BLX prefix */
-            uint32_t uoffset = ((int32_t)insn << 21) >> 9;
-
-            tcg_gen_movi_i32(cpu_R[14], read_pc(s) + uoffset);
-        }
-        break;
+        /* branches, in decodetree */
+        goto illegal_op;
     }
     return;
 illegal_op:
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 35a5b03118..5ee8457efb 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -274,3 +274,6 @@ LDM_t16         1011 110 ......... \
 %imm11_0x2      0:s11 !function=times_2
 
 B               11100 ...........               &i imm=%imm11_0x2
+BLX_suffix      11101 imm:11                    &i
+BL_BLX_prefix   11110 imm:s11                   &i
+BL_suffix       11111 imm:11                    &i
-- 
2.17.1

