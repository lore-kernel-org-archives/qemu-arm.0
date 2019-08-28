Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1193583wrs;
        Wed, 28 Aug 2019 12:48:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzdEx2M5CmvOsrYk0H/33gJX4HCvYc5h7v8pvRGra3u7PwwynPC9wvmkkqQWZSgsQ285g+h
X-Received: by 2002:a50:90c4:: with SMTP id d4mr6042777eda.107.1567021689242;
        Wed, 28 Aug 2019 12:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567021689; cv=none;
        d=google.com; s=arc-20160816;
        b=DGbPGW1fmUpglkm3Kj4Ey0qP6VoGTH6xt1qIJO7MR5wjjxrVM3mk9Uk9t/5yGqbbsQ
         I2TNMORLLQUWa/Rz1KV1xDHRcuQPC6g3ospeZwrCe6KiHmnSlYxfxbOjJpc7qNUXkB7D
         4x0YK0nOCyFhh/cglBFlAZAkIVJuEX+zaGyKYCZAw9l69C8Ws2Pm+JVUJYOD5aNw8zgv
         pLsH4xF7JByfHkA9dMscy0U1zJ5WX1hpcAftbvVgBXe/E96iB06zzV7Yh6WMmxlwAGxh
         rR3JP8QLELvkZrM0QaFd/ygyZTbz9TXVvia6P1dpemyrFrm02l/fZdc7USdpDl/AkJZZ
         tk0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=wIySDhGsNWmiBe1mxSZk+IQzzrYDWNTA5+8A0wQT8Vc=;
        b=njvw5P7QuzhAyVkenrOEBTNYSx2Jnsh39dnPZK7Q+Ku047+dRNklm0uOinf4K/2Gte
         JCg6a0Fkwy+itydqrrRDL42reRDmUe8YKd9BQV+WoIO+Z4HqgW5Hz8zGNvtuxUCwRifg
         exJBE26712g5ioqY2r119w5ASUdwp9lnyJ14fd8n16vllQnr/yatzR0SsPdglotBSVX4
         6Kv5CpJhC7s+L9lweQL/YFSLXMIu2wuOA0a2vLJfawN4qK2cMVlQ8kocHrJILqOmaXTb
         cVYnmvG4e67qy/JgRbJM1kUdlFnUdqLbyAJ9yypGyyUS5/fGosKUG23YmIco0AHv8ll5
         iCvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gPvYayY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x52si1907829edb.126.2019.08.28.12.48.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:48:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gPvYayY6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33vK-0002OE-O8
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38268)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GV-0003oN-1S
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33GT-0000P9-1g
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:54 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33723)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33GS-0000O0-J6
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:52 -0400
Received: by mail-pl1-x636.google.com with SMTP id go14so410976plb.0
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wIySDhGsNWmiBe1mxSZk+IQzzrYDWNTA5+8A0wQT8Vc=;
 b=gPvYayY6eKCqOn1gIybOGYzSOEUhbEcFWyeUhcQZbLA642f4bJp+or/HNpe7+CtDU4
 3hFuNxEwK4dBV5dGADHN3A1UaUzM39Nzj7Clks0DDebgqp55KrjA0QWWw9MleF2Nn5w4
 CoFkfm4bEVE2HUCY5tgQslImqmLPADbpRHyA22oVmn0gmurk6OWGCjypi6UQctrfucVx
 zzRAeoaMGD0uSaaVCOO4dhyeNb8KhIRR+OIfJQ5THnsayQSRcU8oEd17DTcfbDSuuJkV
 IArw2QXR5zVGBB8bhKvftz1HA51OHWMySBpIxyLLG09/BnCV+YjwjNRlcuZNDOJVhPP2
 ADvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wIySDhGsNWmiBe1mxSZk+IQzzrYDWNTA5+8A0wQT8Vc=;
 b=SCz9EjcR6j85upbSVn4pbPKNqyAO6Ea9h6zm/F3lJLBsGGC1jGWi8qqqEiBxJeAG89
 Ui69RdrQtAIVRzip2tMc6evBYZbWTF7VwhOP34GNC+ucjWKc+MsHkq1u4pEYcK4+u/u/
 CnPHn3PCFcUiWml+hrYOg4R5VR0Rp6uOr31ioyzXlN8wTVUsNlN+j8QtOPIy1+XZMIiz
 3ApTPh+SeIF/R2QSfc3XtSvPo0nrGb/66QcDle/HkUkjIh5kznQENHGTiLm4YSLnDsdi
 IG9+i48u6ROOPJoo1A9jJzkGOzd9XOi7wBStHlZfFmEunRukVxSKCi1XDlX7tHYbV83I
 W18Q==
X-Gm-Message-State: APjAAAUnlUnpKkNXSwahQY5UffmjbSc/Qmqx6XXd9EJFelbPZZwjcKna
 8iuDFzo+2ugeqn9MXmY7/8TFJA==
X-Received: by 2002:a17:902:ff02:: with SMTP id
 f2mr5392599plj.99.1567019151318; 
 Wed, 28 Aug 2019 12:05:51 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:27 -0700
Message-Id: <20190828190456.30315-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::636
Subject: [Qemu-arm] [PATCH v3 40/69] target/arm: Convert Table Branch
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
X-TUID: J8+7xAjlqdBX

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 57 +++++++++++++++++++++++++-----------------
 target/arm/t32.decode  |  8 +++++-
 2 files changed, 41 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 07547f7b6c..92b3a66e05 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10048,6 +10048,37 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
     return true;
 }
 
+static bool op_tbranch(DisasContext *s, arg_tbranch *a, bool half)
+{
+    TCGv_i32 addr, tmp;
+
+    tmp = load_reg(s, a->rm);
+    if (half) {
+        tcg_gen_add_i32(tmp, tmp, tmp);
+    }
+    addr = load_reg(s, a->rn);
+    tcg_gen_add_i32(addr, addr, tmp);
+
+    gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
+                    half ? MO_UW | s->be_data : MO_UB);
+    tcg_temp_free_i32(addr);
+
+    tcg_gen_add_i32(tmp, tmp, tmp);
+    tcg_gen_addi_i32(tmp, tmp, read_pc(s));
+    store_reg(s, 15, tmp);
+    return true;
+}
+
+static bool trans_TBB(DisasContext *s, arg_tbranch *a)
+{
+    return op_tbranch(s, a, false);
+}
+
+static bool trans_TBH(DisasContext *s, arg_tbranch *a)
+{
+    return op_tbranch(s, a, true);
+}
+
 /*
  * Supervisor call
  */
@@ -10443,9 +10474,7 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t pc, uint32_t insn)
 /* Translate a 32-bit thumb instruction. */
 static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t rd, rn, rm, rs;
-    TCGv_i32 tmp;
-    TCGv_i32 addr;
+    uint32_t rd, rn, rs;
     int op;
 
     /*
@@ -10491,7 +10520,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     rn = (insn >> 16) & 0xf;
     rs = (insn >> 12) & 0xf;
     rd = (insn >> 8) & 0xf;
-    rm = insn & 0xf;
     switch ((insn >> 25) & 0xf) {
     case 0: case 1: case 2: case 3:
         /* 16-bit instructions.  Should never happen.  */
@@ -10564,25 +10592,8 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                 /* Load/store exclusive, in decodetree */
                 goto illegal_op;
             } else if ((insn & (7 << 5)) == 0) {
-                /* Table Branch.  */
-                addr = load_reg(s, rn);
-                tmp = load_reg(s, rm);
-                tcg_gen_add_i32(addr, addr, tmp);
-                if (insn & (1 << 4)) {
-                    /* tbh */
-                    tcg_gen_add_i32(addr, addr, tmp);
-                    tcg_temp_free_i32(tmp);
-                    tmp = tcg_temp_new_i32();
-                    gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
-                } else { /* tbb */
-                    tcg_temp_free_i32(tmp);
-                    tmp = tcg_temp_new_i32();
-                    gen_aa32_ld8u(s, tmp, addr, get_mem_index(s));
-                }
-                tcg_temp_free_i32(addr);
-                tcg_gen_shli_i32(tmp, tmp, 1);
-                tcg_gen_addi_i32(tmp, tmp, read_pc(s));
-                store_reg(s, 15, tmp);
+                /* Table Branch, in decodetree */
+                goto illegal_op;
             } else {
                 /* Load/store exclusive, load-acq/store-rel, in decodetree */
                 goto illegal_op;
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index fc3e7db4b5..24482e0eeb 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -489,7 +489,7 @@ LDRD_ri_t32      1110 1001 .101 .... .... .... ........    @ldstd_ri8 w=0 p=1
 STRD_ri_t32      1110 1001 .110 .... .... .... ........    @ldstd_ri8 w=1 p=1
 LDRD_ri_t32      1110 1001 .111 .... .... .... ........    @ldstd_ri8 w=1 p=1
 
-# Load/Store Exclusive and Load-Acquire/Store-Release
+# Load/Store Exclusive, Load-Acquire/Store-Release, and Table Branch
 
 @strex_i         .... .... .... rn:4 rt:4 rd:4 .... .... \
                  &strex rt2=15 imm=%imm8x4
@@ -533,6 +533,12 @@ LDA              1110 1000 1101 .... .... 1111 1010 1111      @ldrex_0
 LDAB             1110 1000 1101 .... .... 1111 1000 1111      @ldrex_0
 LDAH             1110 1000 1101 .... .... 1111 1001 1111      @ldrex_0
 
+&tbranch         rn rm
+@tbranch         .... .... .... rn:4 .... .... .... rm:4      &tbranch
+
+TBB              1110 1000 1101 .... 1111 0000 0000 ....      @tbranch
+TBH              1110 1000 1101 .... 1111 0000 0001 ....      @tbranch
+
 # Parallel addition and subtraction
 
 SADD8            1111 1010 1000 .... 1111 .... 0000 ....      @rndm
-- 
2.17.1

