Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1193357wrs;
        Wed, 28 Aug 2019 12:47:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwS9sr/f3Eti7cTAxQG28yd+jacmZ7Lk+zH0PP2orruEy2F3JUqgEsRimC6FLMLMCCxxmCe
X-Received: by 2002:a50:ee89:: with SMTP id f9mr5975831edr.65.1567021672135;
        Wed, 28 Aug 2019 12:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567021672; cv=none;
        d=google.com; s=arc-20160816;
        b=OR06xXsijgXZ47CP7ew7Ycm4H1TESz8RO7G2lj+ZsVO9xLODNVoBIzzEOUuVTn5Gjt
         g0+xFIexbTmirdfQCoKwtb/IrBM9JTf0V09rLGOPs+en5Sf2oW2tvseLKswCp1rZLGkE
         hY5Z9QVsQRDhJeLfp1RzVIhJoy+KP6rwri2TZlc7l91xqtp/xdFPxMZRNRqr0lYLcNMz
         G4CNwi8rh5H1cvgdXV9GQT48e/T1A+XYvn3c2l90eFmcRSpQpjcu4xL9Y9Z4H3cD41o2
         iSE+jtUHyG79er813puCatJNvfWWkOB8gy6wWTJGyZgUamPDCEF26l7YM1DGDIzuQOHw
         TsKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=l58FUNN+MerXiKJ010yMrqx8XR2Kx9uSnwDhJ/Yfh7g=;
        b=b6RXZyr82dPJZYWVdIqKFNyfk2LXrccrXRpIOGj9ei/DFY1ONUjW2LpvUpypQzQTdO
         tMXUYlEX6x28kGwkM6/37OUmfKqvUrMPCQzpc/R0ze+HxbxjeZRIL2up7ipo/eVEeCXH
         Y2gP2fJIA6x4txz3BBDNtjFhtnzXk8P6/K5uadscWxfPENCw1V0cn7QTZftiEBMqBuRn
         vZ6XcVQFgGEN2iWcZHRsDVvzBdEgV1twXItBc2rGRotYJdNvPH27sKnX6GdZUfSVYUa/
         im4xPadYJ5Epab2dwlrtRSxIQizowrSBgJhvu+4UbdpC0VIjVN5dtBQpPWF1/U+o9u2k
         mZIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vhWsf6ZY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e35si1704411eda.401.2019.08.28.12.47.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vhWsf6ZY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33v4-00020s-CR
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38189)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GS-0003lH-KK
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GO-0000MP-Fh
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:52 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45027)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GK-0000Ic-JS
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:46 -0400
Received: by mail-pl1-x642.google.com with SMTP id t14so383815plr.11
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l58FUNN+MerXiKJ010yMrqx8XR2Kx9uSnwDhJ/Yfh7g=;
 b=vhWsf6ZYPt12s0Om+XQwtwmO5xZsu0M6Fj/Sa2yvivWAemIFS5lEwrNu7jA6HMvDf5
 DDm08yS76M24Y83HXBJw0lBC5MJJBGssLgoP/DWXfofzVyiij7eg4rWBX4gU6q3FxXKG
 OkMV6phlUKBKkF93N2gp9sxVWleHT/SAyLGlr/tzd/+B/8/nlsQ9hdH9CSQ7QFzLnYsT
 s5TH/cefXfq/tS9zo9CDM1KViHjvbxWvMuCj2F+rXlEfpJI8Pr4w9gwEIdif30k908at
 P5XZSpfCExWcGxGvzlpiW/fqUrBx1irPosC6i/UpYD2uJu9p5zojNP0iYsNxgSQVW930
 U3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l58FUNN+MerXiKJ010yMrqx8XR2Kx9uSnwDhJ/Yfh7g=;
 b=YDUo4+PGbxBHNn7xJn8K5fK33+8Je1APfJUOQhlxllY1254rOo1LOM02NHFsCCDGra
 U4cQLjtnnMBsnK+lBIqtDM65XgkMNCCZKBh9o/mGoXCd8oG84BpN6wZOLIxpHc8Wba9B
 WiMtFYTlfCxDrbRn9yqWvXKewE5bodyP53dMLc9mL0kMOpa0ArinAJ0/Kc9DlQJR2Z0M
 mOrJ85IPydjFjgym8KfYvi27gLFWtIczR8MiyMzLj/2/ZX4MLd8DZ/gdq7KP5bXfFP6A
 UuSIx7mZJJpj7KYl91N9rSYwyMWwZIN1tDKOBLQfW2R8vDDxcN/WvI2Y5hatCQj6ab3F
 FoOg==
X-Gm-Message-State: APjAAAXKRBd5FZYxPhhpSAtlAva4JzRROHq7FrhveY3rpaYyyaVsPTfl
 FUK4XsPTHKS/bGVU7dhPMtQyhw==
X-Received: by 2002:a17:902:b704:: with SMTP id
 d4mr6022572pls.261.1567019142379; 
 Wed, 28 Aug 2019 12:05:42 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:20 -0700
Message-Id: <20190828190456.30315-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v3 33/69] target/arm: Convert SVC
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
X-TUID: NVkUoqRymAeX

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 19 +++++++++++++------
 target/arm/a32.decode  |  4 ++++
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index fb0e875917..eb4384618c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10048,6 +10048,18 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     return true;
 }
 
+/*
+ * Supervisor call
+ */
+
+static bool trans_SVC(DisasContext *s, arg_SVC *a)
+{
+    gen_set_pc_im(s, s->base.pc_next);
+    s->svc_imm = a->imm;
+    s->base.is_jmp = DISAS_SWI;
+    return true;
+}
+
 /*
  * Legacy decoder.
  */
@@ -10315,6 +10327,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         case 0x09:
         case 0xa:
         case 0xb:
+        case 0xf:
             /* All done in decodetree.  Reach here for illegal ops.  */
             goto illegal_op;
         case 0xc:
@@ -10330,12 +10343,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 goto illegal_op;
             }
             break;
-        case 0xf:
-            /* swi */
-            gen_set_pc_im(s, s->base.pc_next);
-            s->svc_imm = extract32(insn, 0, 24);
-            s->base.is_jmp = DISAS_SWI;
-            break;
         default:
         illegal_op:
             unallocated_encoding(s);
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 62c6f8562e..0bd952c069 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -528,3 +528,7 @@ LDM_a32          ---- 100 b:1 i:1 u:1 w:1 1 rn:4 list:16   &ldst_block
 
 B                .... 1010 ........................           @branch
 BL               .... 1011 ........................           @branch
+
+# Supervisor call
+
+SVC              ---- 1111 imm:24                             &i
-- 
2.17.1

