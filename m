Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1202388wrs;
        Wed, 28 Aug 2019 12:57:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMd4CRlOpjy/UlXJMM/v3wN+073iGXqigOS6hgRFBJK3y8ReSIJJ61q92q7hP75AftdMGa
X-Received: by 2002:aa7:c899:: with SMTP id p25mr5927326eds.41.1567022262958;
        Wed, 28 Aug 2019 12:57:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567022262; cv=none;
        d=google.com; s=arc-20160816;
        b=XKbg6jaiceqyfiPLH0GqBj2PetVyEPUByg0MsrUj9XhQ+gtABslkoskMSvtS4+PLMl
         liPHnY8gJXNgAEEVMj2QOgAUiywKpSVLcXW3vm0qmiZhjJMA1DTMxDpIlftDMsezfJRI
         HwUz0DovA7zCnuAikbnsNj9i3FkL/lpNFpdsiC8hgYnR63LOY7KPWDff5Blc7C8j0Hyc
         tk3ztELKFjYU92NwnDoRkl+Oe8DJ6tdC6WxNg4yp5OOVYUBuq0q1gIPaOuvGhBl+3Pch
         KVerbc54g4KiL3TgcVoKFmJt+KAcYWRNXrinDENaY1ygM2ob3MlskRyIE4zecHad12rY
         mwTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=xx52JC6MANGMEBBAfqEp/mRO3ZRBD9ucqNlmZ54oyt8=;
        b=SpV/0dTLGROoZUQdtwpS93nChlDhvlTA7meYBQ2nFjShc1hk6had2RFcrOe1rHGCIY
         uqUlw/mnyNQa/+3v1a2d0na1/0T0nDj9a0OlsEozUAP4X8zq2qs8QNkA6Ip/sbDJquut
         ii6jtLN0rwyMxMq+9XIrk7s/eRKDVgUXD5PAXbjb6DaTIiYcEvMhOV8ur43dxZnD/j/d
         NyXaV8McMfR5wmLmoqCjKjXrQalHBzQRrXZ070h304tlbImN6bykq7poEkn3rlec4AhU
         xwQxt8f+UR7ts0cjEtBp0R+dvIEJ3cEL/veP2ZMKGMYwGoOmoELyBq8UJMyhlgHgvNQL
         Imhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CgZsatjT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ot4si9009ejb.269.2019.08.28.12.57.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:57:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CgZsatjT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i344b-00060M-Eu
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38793)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gs-0003xc-B3
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gr-0000iU-3v
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:18 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:35583)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Go-0000g2-W3
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:15 -0400
Received: by mail-pf1-x42c.google.com with SMTP id d85so406139pfd.2
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xx52JC6MANGMEBBAfqEp/mRO3ZRBD9ucqNlmZ54oyt8=;
 b=CgZsatjTMnGY6El4ng2xbpq1IVLnbLN6zm0b5U6wzXR5EQY5ssnXPpWI747kkrLX9r
 yKtJGuMsEa/8ecuZnRM3c569t7zNqKpDLKW/uSjZ7TRWVAlDpULv1Q7sKsqUPxGRKfq4
 blvTw2xX+7rxfuNExyoYiJ8eE+DmnSYu9RzYax8Vk2G/2XR4vrxdIuYC4XYflmi3DEqc
 e4+fE2Ksq0/LdITyOrxrrJY53PJDakVzJeAJwQfoJJxWJlpLeVjWo87BWer8U7THUW0l
 OqDK6EFMseTIYS4rYEF3epvZgPTYwBOLK1NiW9LVDHHV9Vr/kxM4Ghjt7HrIOrnGZDsT
 +xCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xx52JC6MANGMEBBAfqEp/mRO3ZRBD9ucqNlmZ54oyt8=;
 b=Z5C2EyuQ507NHusE/qmQsRdLkmEI6ZFePCSY56t0qSl9RrjcGErs9G6VqirvKQnxMV
 nfk6Ui/JrHLn0WM9A10+Bc43MwiiIh1yaVCkwbZUpUXxwyw/RI7biL+0GLj7CVF/HgYC
 10RNvtPUhcRMWODODQSQb+EmQkex8b5/fZFJtqxmMN4Vl6gZ0hn5HmkIHYLu1aN2eHnm
 80jLpxv/7N/AXRcCS4lqRki6GSfF7g3o/ZXHvkkrRiNsPBMZE5/3SLGsfTaQ3SLROfHg
 lVUlR+1/3a8FVtiutmGGiSq6q5fNjjZ/5rkHvlI/52sI5YL1rp7/0BFMZiCWX4/lol0F
 3OMQ==
X-Gm-Message-State: APjAAAUbzeyk0rsJhdBitWJHyXPG4dtSJfPbfczQ3DPGcyDlUWF3C5mp
 K1CJ11mz0bPIh47jUYb8aLAT7A==
X-Received: by 2002:a65:6846:: with SMTP id q6mr4827170pgt.150.1567019173561; 
 Wed, 28 Aug 2019 12:06:13 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:45 -0700
Message-Id: <20190828190456.30315-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42c
Subject: [Qemu-arm] [PATCH v3 58/69] target/arm: Convert T16, Reverse bytes
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
X-TUID: 5cv84vxZyOxg

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 18 +++---------------
 target/arm/t16.decode  |  9 +++++++++
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1dacae1a5b..ec5b095bd1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10707,7 +10707,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val, op, rm, rn, rd, shift, cond;
+    uint32_t val, op, rm, rd, shift, cond;
     int32_t offset;
     int i;
     TCGv_i32 tmp;
@@ -10904,20 +10904,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
                 break;
             }
 
-            /* Otherwise this is rev */
-            ARCH(6);
-            rn = (insn >> 3) & 0x7;
-            rd = insn & 0x7;
-            tmp = load_reg(s, rn);
-            switch (op1) {
-            case 0: tcg_gen_bswap32_i32(tmp, tmp); break;
-            case 1: gen_rev16(tmp, tmp); break;
-            case 3: gen_revsh(tmp, tmp); break;
-            default:
-                g_assert_not_reached();
-            }
-            store_reg(s, rd, tmp);
-            break;
+            /* Otherwise this is rev, in decodetree */
+            goto illegal_op;
         }
 
         case 6: /* setend, cps; in decodetree */
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 032902a1f4..19a442b894 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -24,6 +24,7 @@
 &s_rri_rot       !extern s rn rd imm rot
 &s_rrrr          !extern s rd rn rm ra
 &rrr_rot         !extern rd rn rm rot
+&rr              !extern rd rm
 &ri              !extern rd imm
 &r               !extern rm
 &ldst_rr         !extern p w u rn rt rm shimm shtype
@@ -195,3 +196,11 @@ SETEND          1011 0110 010 1 E:1 000         &setend
   CPS           1011 0110 011 . 0 A:1 I:1 F:1   &cps mode=0 M=0 %imod
   CPS_v7m       1011 0110 011 im:1 00 I:1 F:1
 }
+
+# Reverse bytes
+
+@rdm            .... .... .. rm:3 rd:3          &rr
+
+REV             1011 1010 00 ... ...            @rdm
+REV16           1011 1010 01 ... ...            @rdm
+REVSH           1011 1010 11 ... ...            @rdm
-- 
2.17.1

