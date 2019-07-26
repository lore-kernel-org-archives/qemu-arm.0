Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207719wrv;
        Fri, 26 Jul 2019 10:51:39 -0700 (PDT)
X-Received: by 2002:a63:2cc7:: with SMTP id s190mr80137387pgs.236.1564163499734;
        Fri, 26 Jul 2019 10:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163499; cv=none;
        d=google.com; s=arc-20160816;
        b=r+eZOoNwyUYuVXtefVhp95WHepcPy+P+JjTenfD88W8tkF9m6ShQPNhgRf2UEya7nR
         mDNAI31Te+frxKxspjEsve0uryznJimmeh9Q/KLOwSAQEJ94JgFRPCcUlWHBY1GjJdqc
         EtAJfiGd0nyXmglNoglTI4C8QKVM7wqKhAFOTgiwVbKimoltl6Qo/74ADXL6XK3gLMmb
         dXRHm3xhaT0x/TeXlkvbx9BYXStmjGB5dSLceqaMjRJnpvlWSjYKeHlag86O2yttj+i5
         9stU5jpvDlBQUMhfIW7w38OP72YG464mEp/VamWXyb42X6bb2T/rbkx3+5PE59nvNIZX
         29mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=zTUDYR2hU4ZALOUVF4vngOslrJ4X/C4rxl23t5JZO3Q=;
        b=1JepsNdaM6KUkB6Ie/D4HUh/0rQ1FHhuvRuq8Q9HsCyJr5anA8PSzaDBF+JfoSyenr
         f+ELulr8n5TaGXMsECrUcNGd7jMrkLIlJDEh/hPVPx5YGxrqdRPeXGrYjX4Vn3v/JyNX
         3tVE/9Qu+sfjDqeUa7E7EYbVXzVeF1r3hfi2CKJvdBrhUn+ElE6qQZOv2pe33+PVnzeA
         hytjEL0pmmwJqshE/KWs+4HOC1puykzagZP4aEKu2BuGPg9d4tfZSGaluNIgcr6vopwb
         sBS0T2lYDSAOfxpTaRSypAkPqORaVMRe63w8E3Q286sHM38JYurHeenCuCTjyMOi3xfY
         abhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IBcpfWh5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l6sor7841865pgt.33.2019.07.26.10.51.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IBcpfWh5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zTUDYR2hU4ZALOUVF4vngOslrJ4X/C4rxl23t5JZO3Q=;
        b=IBcpfWh5F6SICO8ZNgo7HTWDEj65hPbOmjwpHDMPOSCTbQdQto+AG5lDVWE1kScYkY
         rEsUNeJv4bBFCbT66tWGHDNt+d0xjQ/OB9MQdoTN+F/1CPHGwOBZ3boZbOttYIDTYNsh
         PTmM0DBzE0+7rqSNGOfyl8V5z6oueULbw4QzVAOk+njVXlGr6WsSRMS16e8bi46V+NgY
         od0S5QvWjed+z6Qr/bSITXm52QCaEWcF4h1c92XYLvDWqCm8zaDNUmo+kP4TJvAyWXTL
         wZL411752OUL9vsnDENcfUJhWQ4PLhmiKZxUrZYiGTzCycnozF00YUPxnAXEFN0wttuH
         9Ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zTUDYR2hU4ZALOUVF4vngOslrJ4X/C4rxl23t5JZO3Q=;
        b=WBakQWPKbweIt9bHKFx0oh9KnCxYzhkFeu+BIjQk9WYzI7RVVIxfQhxsV529Q+3/Kr
         gYdbBHFkXjL8Vt3yPgExArBHmuCr9h10zLUzSZZoYH/xIxwJXJAmwvcv9BTqr39BKRcw
         aUJZnuGdzK5PS+A3weQPWbPS+YKEuMMQvkvkls3hLqsMy5dEbg555QU501CHsbASO14W
         QsVJN/dtvpgxCg8P3ugtFCxEdO39TgbPBgCXzzb0jITJuheC1DZMtU4xH99eFmD2RGvv
         Scgc/fCU6lGKwtXv5+JulzWjwIsw+e9TI1j2Ssfk7SYxNjHK8YW2XfPjJqROQwaLqdnZ
         of/Q==
X-Gm-Message-State: APjAAAWTfD3oZ1rcJjQdm0nMSa3ScWmjgt+l3cseFAlAtdQV3mNTwh4d
	nyO1EHKeJxUz8dj0MsmusDKxMFq0
X-Google-Smtp-Source: APXvYqxGhPvm+WZGEC1hSI13KU6gkOPJ8HlBJZ3M4shCforb+njAXOXRIP8u16W8+u2xKiUypO1cmw==
X-Received: by 2002:a63:5c7:: with SMTP id 190mr90711195pgf.67.1564163499284;
        Fri, 26 Jul 2019 10:51:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 54/67] target/arm: Convert T16, extract
Date: Fri, 26 Jul 2019 10:50:19 -0700
Message-Id: <20190726175032.6769-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: +sUZGZiB6qUd

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 14 +-------------
 target/arm/t16.decode  | 10 ++++++++++
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 8dd88419fe..9c8e11bd3a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10649,21 +10649,9 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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
index ddf12ada11..1b47e804bf 100644
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
