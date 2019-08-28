Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1219605wrs;
        Wed, 28 Aug 2019 13:13:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyUJOSkH3uA42zPokChqaG6i2FIKYFKkuODmJ8Bdsa1MwpEcU+3eqvHyMMgI0vb4GUkMZSF
X-Received: by 2002:a37:9ec6:: with SMTP id h189mr5771727qke.280.1567023220246;
        Wed, 28 Aug 2019 13:13:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567023220; cv=none;
        d=google.com; s=arc-20160816;
        b=xrtXsveTYgXfJelYCTG9846t+HO46yLDpZPkY7ZoN6wxYcK0nIVI97bzJqm9kaW6pT
         nKaywzLpe2q4eyD6rX76+u7Ghh9OtRWprMq0XB0eCuuzZIryJw8BROTPdR08yoIc6x6B
         VkL875bCvmiIIVd0oDCHv5wpepURrP1MPd6Exa+j0ZQWSkvD3PknoMh9fHtl8ykk2mXP
         XtHysOt7Ga/LnOQPe0h8p6pKVGA7ors6p97VUhVYF6Nus2Uh9JC/Eqlw6xjjPXYcC96n
         a5vGloHJCnbYZIJhVs4w3kacFPX1uaP++QCqgT0h05MandibZWA1VPzt0iCHjOc1fJ6V
         9yQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=Lx+8GdSOm4AFV3gPcXa/Gz1WHaL2tglqVzn+6pptTZA=;
        b=XUt/tx2+k/nqUmyA8CjJjZmHkTRN+XsnZ4svexR2YVS7XBEPAjjKRRvWzld1gPO2A1
         xZ0PnCj4TJ3T21xjJLaMp3+94jz91CgUw5uNX+4/mZIhFQysJyj8R4lqDrrfJ+ee7E0i
         RoedEbH56qciqPZV8w9HH3jtrGDy1aUHHFNQxtXZhJDD9IngVBTArCnSr4p4S3B+Bp/L
         /E+eQqy52hMx9KmRmtz3dh9kDlMj8wa9/iAwdGl50duBOh9R5p93bnrYHWsDS99rSQDn
         d9XuRktpKO47YfSadURQ4cg965A/64s/U/50CYP++rtBs5+wgDz6D1kT6UsoMhoMPXXI
         jsGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EwFti39e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20si144623qta.392.2019.08.28.13.13.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 13:13:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EwFti39e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i34K3-0004P6-G3
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 16:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39034)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33H3-00044u-7f
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33H0-0000pC-TA
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:28 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39459)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33H0-0000mv-Dt
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:26 -0400
Received: by mail-pf1-x435.google.com with SMTP id y200so391139pfb.6
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 12:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Lx+8GdSOm4AFV3gPcXa/Gz1WHaL2tglqVzn+6pptTZA=;
 b=EwFti39eQXHd8pj+7tYzrtWdwD06ZkjllFuQS6SE/1jq89J3rlwXZBViLNyNVTSfx+
 rnMNhskIAtiyZKBufQMiCXj6GD2OXMqNybObMG4TZNpxyPc9Byd/KB+WBLHY9uBil2xv
 Pnvpp39xJym8N5egXpnaKYRfvHx3EchvNodm0YseCXClxud0tX2fKiz7wcOOYLQF4s0u
 4f8wg06d/XSddypNw0DSpLGhALIF4FR6JwBMrQCFVBadlmnzV459sNklCekm+oeZKaLC
 iVbNtDNXpXKf8SHnYMdwm17bnCISmmYDm2RxVFfPXnsZfhQRPY52ZrtX8HAc+uZ97e6f
 bXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Lx+8GdSOm4AFV3gPcXa/Gz1WHaL2tglqVzn+6pptTZA=;
 b=Rozzib62CIyEDPWx5WHRGD8dvfRuTxvctBVmpTkErUouMDtzvpG8+ss0DpmWq0kdun
 GecgYQ3a0LV2KZVNU9CLBS5uMhgm60NvpEgSDwfZYjy2AucdvfxyKVoCvvjMc/O0mGgK
 JL47GcSPyDPn50i/XoIQFcLl0zAAomy1+NH0xrKoe5GF2uiMtjyZNRX/GUItLg9S7Dni
 e8pz8gsTfY37Zc5lroMH4j0dqU+bB4GeqWd2Hj5WN8ThV8tbhqY8Vv9synvEtoUAJrjJ
 Unvdhpfc1HkvbGcHp88IzQu76eiiJ/J/Lp2+bu6Is6ShSZmhq2ZRrnkmhfSP3oCTyEWN
 D/jQ==
X-Gm-Message-State: APjAAAVvy1dTLtQNeRXJkKl6vDjBfaSKDrMWBgrpl36LMYFumJe4+WDr
 Et0mM6JY0Ic+JwYatYVIFWqxHTOdNhw=
X-Received: by 2002:a62:1858:: with SMTP id 85mr6656045pfy.120.1567019183524; 
 Wed, 28 Aug 2019 12:06:23 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:53 -0700
Message-Id: <20190828190456.30315-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::435
Subject: [Qemu-devel] [PATCH v3 66/69] target/arm: Convert T16,
 Unconditional branch
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o8fuKU8rWoGo

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 9 ++-------
 target/arm/t16.decode  | 6 ++++++
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fe9f7e4f42..574a791461 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10713,7 +10713,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val;
     int32_t offset;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
@@ -10757,12 +10756,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             gen_bx(s, tmp);
             break;
         }
-        /* unconditional branch */
-        val = read_pc(s);
-        offset = ((int32_t)insn << 21) >> 21;
-        val += offset << 1;
-        gen_jmp(s, val);
-        break;
+        /* unconditional branch, in decodetree */
+        goto illegal_op;
 
     case 15:
         /* thumb_insn_is_16bit() ensures we can't get here for
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 0b4da411e0..a4c89dba61 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -266,3 +266,9 @@ LDM_t16         1011 110 ......... \
   SVC           1101 1111 imm:8                 &i
   B_cond_thumb  1101 cond:4 ........            &ci imm=%imm8_0x2
 }
+
+# Unconditional Branch
+
+%imm11_0x2      0:s11 !function=times_2
+
+B               11100 ...........               &i imm=%imm11_0x2
-- 
2.17.1

