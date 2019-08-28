Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1226466wrs;
        Wed, 28 Aug 2019 13:21:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzP/PZtnxxy1FIURwIZY13RTjlhU8CdrPPIk1xZ9J6KvC5FQX33OnX+5XmM7wtF/f9gJfas
X-Received: by 2002:a17:906:b211:: with SMTP id p17mr4862856ejz.11.1567023675781;
        Wed, 28 Aug 2019 13:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567023675; cv=none;
        d=google.com; s=arc-20160816;
        b=FTb2GLHlFou1Xt5chkCiLlZxR6vqiRqkwZKTgwchm1/VyHmBaSg4rL0BxkWZT7kDAY
         mB9/INDvO5FW/mXPiORDUMgw5qGDw1MNpSbkpeaWNOgeFXfje2/O0WFAZUWD2Bn64bIo
         4wgGO+4G40GcSW9yidsa8VT0FJn3Lqa75AJSRQYvQa2l0uhz8K0r1p+4TFP1xy0m/TFE
         B3aYg+gd3BolZ2aHXf9I37jOj8+NpmOz31nxxRrqq/2Ui4baHiYuYUFrZN2rI6Tm6y2a
         +McaM3ALV4uRU69LobeV3KlYW9oJhJs8+nJUo4AKoj6rXtyQwsHmhhcwAClFJwkaHuGb
         k5Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=q6ZBPK/r46XKCIwGfPMSrv2j4FjJhwF0lhuCFM2qD0g=;
        b=Fvk9nWEAmHe9L7y6bPSF9EolbWMV1pbta994m0cLEkE1LhnSwOc91fVUnp/DCqqHyZ
         CXhOsdT2S7p4RUh1FgRjM8PQ9bnT4ZeNbkF9Hb0fxaX4K7Ik2mVNHMTeI7Cx+hRD6RdU
         UuOnoaYLdv22YB6tYRWFRMtxvydByhztnlCn6SnpXaYv4P24fdRQVewtOIQ6H+MSG/76
         Yfvi74GSAcjlFUlavW03kl2ngDfB+5DMI/apoDzyJqSpaY26igPcx3pSyLzyhucPzXYC
         Mw71j/xqfrkHd1XtwM03azeLuU/BhU26xDeu72waxB/EcjFnoGKGNUQrZsp3GgVXQEXJ
         YPaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k7kCCIS7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si34018ejx.363.2019.08.28.13.21.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 13:21:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k7kCCIS7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i34RO-0004Ps-Au
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 16:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38787)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gs-0003xQ-9J
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gp-0000hI-9X
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:17 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:45363)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Go-0000dD-2o
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:06:14 -0400
Received: by mail-pl1-x644.google.com with SMTP id y8so379891plr.12
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 12:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=q6ZBPK/r46XKCIwGfPMSrv2j4FjJhwF0lhuCFM2qD0g=;
 b=k7kCCIS7vEOzkHCTGD2WO4hMI8GfkWXqtLwck4aKUq0RgcgPhPhUU+k+Pp4NHn7WGE
 Ugjr/t0+UFtJ6d9qUm2GY5F8kxxBrmy1m7E0j8b95yRvnlLIZD2ezxzT4ygfXq8szAzd
 oint15XZvtVhNXNlPqidLPfHKmHPE9hv4rmhfWQkRLtVLoQyGO6Ru6RqE0IPzkGFJ5OO
 Yfwsi3c5xxozhog1nHJ3O9Iouj/rh2hw+Ju199z0OeES4KCygpGQ67fFHNvZA/ZPN/dI
 mSYEJL9tkorg/8vem2Gh/vuyOBe6F6wcM4WfHq6vxfRLUVA6PGDKRhHLQy8MEcaSPTMv
 Phfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=q6ZBPK/r46XKCIwGfPMSrv2j4FjJhwF0lhuCFM2qD0g=;
 b=V0Bd5Q3C+VywAPz1LSSjVj0nTNJzwLP117ZjPB84wHZgyCrh9ZFDwVK3jiloRjzBtq
 KrVM7KstAMbXVcIZC42zCkAIeK6Lv93ka61rDvLNZe1IBTVrwReQHPIt8aXJ5GdPthAD
 ddMLKtAvaM/nXIfhDyiESUh+vbaAycPS7uYJ2UX2LTaliT9R65oeIXypcveit4rEBYYe
 cTho4hH+IlCyohRDl9h3n1R8DIqVEt2l+MfaoHYa4CWHJU4sx5ksBXuc9UiuNGhCtrck
 EfCLKEYHL7vC37B/DM48+MMnOCiXZn/thjahLOC0s77mYazlE6VOYG1aZMnE+3SHMBwp
 Ii7Q==
X-Gm-Message-State: APjAAAVC+VQsphv2lediNj5ESW9TZM52ssVBDOvxzDKrKbs0mnXW3hD4
 xk81R51o5Ek4QeLnFwkGRKIj+8zn+mg=
X-Received: by 2002:a17:902:1a6:: with SMTP id
 b35mr5655285plb.228.1567019170976; 
 Wed, 28 Aug 2019 12:06:10 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:43 -0700
Message-Id: <20190828190456.30315-57-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-devel] [PATCH v3 56/69] target/arm: Convert T16, extract
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
X-TUID: OHd5DpoxG4cT

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 14 +-------------
 target/arm/t16.decode  | 10 ++++++++++
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b7e2c72f35..d06ec48ab9 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10743,21 +10743,9 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
         op = (insn >> 8) & 0xf;
         switch (op) {
         case 0: /* add/sub (sp, immediate), in decodetree */
+        case 2: /* sign/zero extend, in decodetree */
             goto illegal_op;
 
-        case 2: /* sign/zero extend.  */
-            ARCH(6);
-            rd = insn & 7;
-            rm = (insn >> 3) & 7;
-            tmp = load_reg(s, rm);
-            switch ((insn >> 6) & 3) {
-            case 0: gen_sxth(tmp); break;
-            case 1: gen_sxtb(tmp); break;
-            case 2: gen_uxth(tmp); break;
-            case 3: gen_uxtb(tmp); break;
-            }
-            store_reg(s, rd, tmp);
-            break;
         case 4: case 5: case 0xc: case 0xd:
             /*
              * 0b1011_x10x_xxxx_xxxx
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index b425b86795..b5b5086e8a 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -23,6 +23,7 @@
 &s_rrr_shr       !extern s rn rd rm rs shty
 &s_rri_rot       !extern s rn rd imm rot
 &s_rrrr          !extern s rd rn rm ra
+&rrr_rot         !extern rd rn rm rot
 &ri              !extern rd imm
 &r               !extern rm
 &ldst_rr         !extern p w u rn rt rm shimm shtype
@@ -173,3 +174,12 @@ BX              0100 0111 0 .... 000            @branchr
 BLX_r           0100 0111 1 .... 000            @branchr
 BXNS            0100 0111 0 .... 100            @branchr
 BLXNS           0100 0111 1 .... 100            @branchr
+
+# Extend
+
+@extend         .... .... .. rm:3 rd:3          &rrr_rot rn=15 rot=0
+
+SXTAH           1011 0010 00 ... ...            @extend
+SXTAB           1011 0010 01 ... ...            @extend
+UXTAH           1011 0010 10 ... ...            @extend
+UXTAB           1011 0010 11 ... ...            @extend
-- 
2.17.1

