Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3196393wrs;
        Mon, 19 Aug 2019 15:12:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzR3JLwnPW7EgCfyCd8CxdyGD/k2VC4v59yXSquNlLRgLxdwo9drPQByOiie55bgfkQlkaD
X-Received: by 2002:a05:6402:1846:: with SMTP id v6mr24353763edy.31.1566252722819;
        Mon, 19 Aug 2019 15:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566252722; cv=none;
        d=google.com; s=arc-20160816;
        b=DP3YD7Oe7lq3ndC7Hy07jgZmUDltT9ab2DHs3GujGM75S/Pp6fJLNN2V2wFDQJfX6j
         ZHfDCpCbTdml7Lm8oVq1mqWdnW3/eK4rMF3lHAC3OtdOHxx7dysiSMag3X3pUlshos1e
         SLprCub7cFdZdTcdAYxdy4PZbLbBM9l5I/1IqKazYQh4iHPui+UyDcLJN/nQhMCLY8u1
         zplbY+AcFok3970mw75B5cDE6t5rkE//09HtuiE5plyppq8ZBxR4oIbxwmOAVS+9OqJI
         RjrXW512rcuauWzlnv77F6Ei9ZF8VIhPxJF18bPEVcvc2BxXvGAY6jCVegx9iEouIX/r
         8Okw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=QRvE4bPnAygv+cSuTTykDcVWK0tGfB+nP3/t4TESwEQ=;
        b=UKOg1Aq4oxOlZ+2Q8rZM01KIBFGmnG7Pdz8YADiAM2MBO6z+EsVza8+itj4YfIDaeY
         tK4ywCAxy1M/PwYPevVIXgDCpnB4fCqSTmMm3zmmOFuOENnVE1JRN4SRUIcdtd+D7g4S
         00jmi2y3G5kzClpiEyyezGGUk9GdPgLvVDwf24xRd557BMktrZENVbbwxAn46VgFcMbN
         sHvfPc0r6hYmuXO2JmK70771y3BRNPhl1BGrAQ0DqYPXQnWTYu0DLxgaXuGQjSWjX5YS
         sq5ZFZBEssAM9SE68wJGUnhTAy+KD+IPce2+O+PrfEFKYuCnetBr7VxSggzm9cmDmiQb
         YHgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aGlqZbDF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id mv5si7712447ejb.396.2019.08.19.15.12.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:12:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aGlqZbDF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzpsf-0005Il-HZ
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMn-0002fd-VO
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMm-0006my-Q5
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:05 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42089)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMm-0006ls-KP
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:04 -0400
Received: by mail-pf1-x443.google.com with SMTP id i30so1943207pfk.9
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QRvE4bPnAygv+cSuTTykDcVWK0tGfB+nP3/t4TESwEQ=;
 b=aGlqZbDFxybV4P2d9J24RQQdDpkbqfnLL4iI4CN+Fq7lduLYhOpmGM3DQbHzICYjSY
 3BjzaGj0ObmBarpaF03V8Xq0xnlZj0nk4YtqMqFL2a+X1bBVFz/Np4YFZ24v3plrCb+4
 yYrRwbhBopexLLggm+tk778AIAnD2Kgpn8ImVaulgnxhigCuIo0aZAI55zikfh5+qPhq
 yFIw6u3F5DWdR0GcylBFl4ChPyUzy56+rb83rZBy3RTT905EkNVyP3X4PrBf4dAOnzs/
 6CjSZONx2L9mKDvE3gCYjfqQJmmCroGAQnbwoURPL/YppLDtuaBlmXu51zzAu9niL2ha
 kfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QRvE4bPnAygv+cSuTTykDcVWK0tGfB+nP3/t4TESwEQ=;
 b=fLT8k5nCOoxmczFbMLFYt6jXS9kTSBJb3271q4O1TLyAlx0IhdGkRWlRCJIFV7evq7
 Qf/4/MbM+uOdkVJM6w208itZm4iIUEzQItCICAF4EmCyGGnvSws2IDLmi9MC+guF3jkh
 /aTrz23r5ruxqjTxvEXnICbmWwv0J/DsHFuTbKFrOTXx+r8Y4jwK0kNByY2KDVakq1y9
 NKD98RDSHkXPw1QLqHPZIr0gjeVEcw/zgNyBXpT6+pxR0zpZtZi5kKClceBjreR1w/p/
 RyC1f9p9g/OfhAlqQgcotV4tSPPXEPoKtL5eJC6wUoATgZTX9SUcc/hqM5Y3ebWUzRuI
 0rvQ==
X-Gm-Message-State: APjAAAUJIPUnlcj7dsqwA6apgbfSJeeLZyqN2mSGsEwhcGrOpA05yPc4
 uGasbXykBJam6AX2dPFMMwnVMSNcFe4=
X-Received: by 2002:a65:6458:: with SMTP id s24mr21623711pgv.158.1566250743538; 
 Mon, 19 Aug 2019 14:39:03 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:39:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:41 -0700
Message-Id: <20190819213755.26175-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
Subject: [Qemu-arm] [PATCH v2 54/68] target/arm: Convert T16 adjust sp
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
X-TUID: s/uPniP+oWo0

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 15 ++-------------
 target/arm/t16.decode  |  9 +++++++++
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e639059a5a..cac3893386 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10640,19 +10640,8 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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

