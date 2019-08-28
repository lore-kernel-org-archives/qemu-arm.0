Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1190387wrs;
        Wed, 28 Aug 2019 12:44:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0ujuXqM/aKtM0lnjyvWtfBhQ0HCcuenoQWJ5ln1tJrcDPn5LNiF0B5Aobjz5pqnAZZSsu
X-Received: by 2002:a17:906:b78e:: with SMTP id dt14mr4846550ejb.147.1567021489228;
        Wed, 28 Aug 2019 12:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567021489; cv=none;
        d=google.com; s=arc-20160816;
        b=mR1l/ucCSpM41PLqd5MBtiMok6yd39DzfDvjO1cOZuMB4PMJY/zBDbQ2HZs2s0Q5U6
         f2CmUSwJek+spvgai3cV253bak7hpHFecSZop5SAF8YtoZJvMvoAbnXColcJBxPlImDU
         GOAm3M3rT+151me4uhouRd4JOmkr3YFmDbAjlZdMqaEPbgNmDHZRDpHj77b1zPNcuGpZ
         ZyBrsmt+uFFGsiIXFzS3DUK9yjWtwQz1Jkrs+TYT9iSY4GYFAATUANVpKCO+OX96Xj5Y
         L7eOUsyvAJTyGefVyYkpvQctEQFQefRhRLCgXEHqpmpTU+IOUpHxetQbfYVt4GVnPH4x
         Fq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=kPR1JZrIaEB+BsbI73Fszb6T54V+9F/FGo5zTSmXHS0=;
        b=0NTZUSUzLygjBJhOzPvhn1mjH6dXUW8QKQdtrUaSXFujz4mPIalirBAsYJ7H6n5MxJ
         srrlfUKr1nwph+LPpxKtf428910YTsFrOzmD4BbykwwxlXrXL1eMEA+E07MOg7SeuRdr
         b9ZCIgUwjbjEc4cvz8P8/rLxEt5F28Qxn3QqWO4/N+M11wRx6VuOzWOkwZ8vZ+vUhMAr
         P8yrEBm42pr7LDYGRtIsaKNuAkTKOU2pPd/6vFt0KYnHBts0xqUybnRKQUZu56wZK66h
         qXHUfPoZUudiVOeqtJSuvroVbOIrRussJjbl6u92JLKY+XZa7bRgbM8GnFDX//9hZg/H
         vR6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GKH+sTqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rh1si1772034ejb.283.2019.08.28.12.44.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:44:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GKH+sTqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33s6-0007mv-Jq
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38714)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gp-0003wM-1a
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gn-0000f1-24
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:14 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:36256)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Gl-0000c2-QZ
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:12 -0400
Received: by mail-pl1-x641.google.com with SMTP id f19so405162plr.3
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kPR1JZrIaEB+BsbI73Fszb6T54V+9F/FGo5zTSmXHS0=;
 b=GKH+sTqS1LkwzkoPmwBjTfcQjHuO5EnBQ47PEUjUG1h6Z5MeS06ilHdYA0dnouacph
 sDOSn8/+suzG2qxNGgc9XqtVFRvrk92bCQ/Dz7HgI0XSbdgbRp1AITAVTNdgJ9Jr/NuI
 wvStruOUnlRwK7D5MxVrF25hGaZsy47Z94U8KaxYSzM9ooSSksNLfBVpvDLe27Hlzwz1
 fbfgQbRm41QYm+CA3QHpMAzwIpno0UIUU9KM4crW1q1iBAfAfVA2HiSy0U61joiDFrh6
 jjYnnyFAA29umgEjl2K5VHXeNXmLIC958BJCO6mFqp+XW5CajfUQWvYTdRuaCuFIo/n4
 /gsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kPR1JZrIaEB+BsbI73Fszb6T54V+9F/FGo5zTSmXHS0=;
 b=M5JzDDSjZrfJZWN5LG8AlTUFIvwQ6l5aciD52suSRrk1Xr+6JPtR5aBSLF/AGqC8D3
 2raqVFe6pIJkQ6e4yPxRmEFF4yXisqhC0kB1odaF6ulcY0wZKDldf1qg631nOZaXAe/j
 SuTWsSQpFb3ewLwWFzNINVVa4kRfG0JF9IPBJGyKc/4cn7SefCsXKJWaLN5X0w2+6r1p
 hTzvGVmQyXbK7TezKqHYvfRDsxl2PFQJhFYG0FipIEbIrGp4t3jTB423GFi9+I4lKElK
 ZWJamYHHUxQVQtJkRIMnJc7DEskrmM7UmZYfzrxW2XYK7qdN+ek42T3sDOW8rVqHcWs4
 OG4Q==
X-Gm-Message-State: APjAAAUBNt+3InsdX/JcrbaUas3U/dOzZnIZKAKWNxOP8CUstJBCuPZp
 ZXpsKXntAPDYyByRoJ6bPi5Xl0AIdYw=
X-Received: by 2002:a17:902:20e3:: with SMTP id
 v32mr5596520plg.142.1567019169701; 
 Wed, 28 Aug 2019 12:06:09 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:42 -0700
Message-Id: <20190828190456.30315-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-arm] [PATCH v3 55/69] target/arm: Convert T16 adjust sp
 (immediate)
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
X-TUID: BSiTm3oNlQnA

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 15 ++-------------
 target/arm/t16.decode  |  9 +++++++++
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index cf19f1f777..b7e2c72f35 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10742,19 +10742,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         /* misc */
         op = (insn >> 8) & 0xf;
         switch (op) {
-        case 0:
-            /*
-             * 0b1011_0000_xxxx_xxxx
-             *  - ADD (SP plus immediate)
-             *  - SUB (SP minus immediate)
-             */
-            tmp = load_reg(s, 13);
-            val = (insn & 0x7f) * 4;
-            if (insn & (1 << 7))
-                val = -(int32_t)val;
-            tcg_gen_addi_i32(tmp, tmp, val);
-            store_sp_checked(s, tmp);
-            break;
+        case 0: /* add/sub (sp, immediate), in decodetree */
+            goto illegal_op;
 
         case 2: /* sign/zero extend.  */
             ARCH(6);
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 5a570484e3..b425b86795 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -156,6 +156,15 @@ ADD_rrri        0100 0100 . .... ...            @addsub_2h s=0
 CMP_xrri        0100 0101 . .... ...            @addsub_2h s=1
 MOV_rxri        0100 0110 . .... ...            @addsub_2h s=0
 
+# Adjust SP (immediate)
+
+%imm7_0x4       0:7 !function=times_4
+@addsub_sp_i    .... .... . ....... \
+                &s_rri_rot s=0 rd=13 rn=13 rot=0 imm=%imm7_0x4
+
+ADD_rri         1011 0000 0 .......             @addsub_sp_i
+SUB_rri         1011 0000 1 .......             @addsub_sp_i
+
 # Branch and exchange
 
 @branchr        .... .... . rm:4 ...            &r
-- 
2.17.1

