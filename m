Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3203650wrs;
        Mon, 19 Aug 2019 15:21:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxz9bQZKJx16hEMa4FD8J59A1IgusVdFsI+82KInECjyOdqFN6xAi0ADWyoSP1wA60FM75L
X-Received: by 2002:a37:a585:: with SMTP id o127mr23630009qke.348.1566253295881;
        Mon, 19 Aug 2019 15:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566253295; cv=none;
        d=google.com; s=arc-20160816;
        b=kaPWRjmk7tacUNoT+4BEYzZPPJ15wJxH7nJ0j+nYM/76A6rtg2ATkjdTkpUs/BNfx5
         jh3nnw7G7CVNlxv4UAo6wtmi/zHzUWdyoqWLa50teOMJKSRCNhJlO9i95GKeC+PnrGpP
         3VeaQvyG/0XLkGzDYFF3Lbj3BArdeeR2uFRDBtNPhNKZk+F9dCB4V5p2YKzHoavU+7L9
         PphYIS/ZFLQtu+A30ZF7zRjhRduNt540HjEPcw2kdLEWpn6UtSmscikuax5avIzXX3/o
         4n2obIjZLCCfvb2vUEdhmj/dDOaHbfxQ4d6PMHxD6eIL7GULwsF2wVUT2RARnDpsA51+
         SyXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=5Xh6zbX+N9ttY9MdN7vquKBp46pmYyv37TGDy5UrKa0=;
        b=yZb7qrkS9VRKDwxrHHgyvU/QdhWGCTVsPn8LYtugWqgLXgNoaDsowLa7sEDl0w0kRs
         CUP7hvIG442SwTlqgY07Gh34YrpEbbwZ9EE9c5nxJxLiCsqHRVi618o4Jj4tE8v9IT34
         nBZBZa7xNVnE5lO72YVhbwJ2LyQWsJPUm9qAC0+K90oxvdcB/HLZ5mOyKCraSq2qCRVQ
         4mcE5kcg16L/Qj5L10gcfFM81aF1+4t5nouGqzH2KbMQWZFJdISPe4jgz4C8temfHElJ
         /qDqHURjfS4FFj1B+P/ZeOmF04u5sLtVbTa05BUvDyDty1dvVtL0XDf8gCS2QEbT9BOj
         b4Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GEauZHcm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u29si8965601qtj.91.2019.08.19.15.21.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:21:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GEauZHcm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzq1u-0001z9-Qm
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60105)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMz-00030t-6e
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMy-0006wl-3e
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:17 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:46045)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMx-0006wS-UQ
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:16 -0400
Received: by mail-pg1-x541.google.com with SMTP id o13so1921777pgp.12
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5Xh6zbX+N9ttY9MdN7vquKBp46pmYyv37TGDy5UrKa0=;
 b=GEauZHcmeYZyYb7r0mtCqhm7fEgMEQr7ln33eZAolSBWsVQIW2vrWi9MsyV6MO0nuy
 maE5eUhj8CdPEf5/8mYnq1Pd0hx0xe7PTnZgBlyxLaTRbCYIraHcv1ON8rArq/Fa5KQp
 VEgOys8hsO6GeLmjs2iY9e+MVqgVmSdXynB0PFf4g/YgqafiHuVPjyKI1zaD9e0akV7i
 2nktUOkpludSh3/dB79fB6Mrd1k4liQVNvJf54E3zUmv+ut6v+C1Pkvh0ApTx2kQTPtv
 FY2VQQxLPA3RV7e1vmXcM7ZiUacUfwzOWZcobk6UaAXJVIlnRQqgQFD0Do5VklrFlHmY
 /gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5Xh6zbX+N9ttY9MdN7vquKBp46pmYyv37TGDy5UrKa0=;
 b=GLbzTnC8XbGN4EyMhjxDgbxB3TZJHcTiqIGX6+ZoXoUN4F6SpZqAmonltVIrsDdacs
 6WvI5LmAmoFIU7S6jjh5b9eMdqAdnbvdAWjNa5myuv1yLzDkmANnnU2Ib2iL0SxFMyEJ
 +iOhoq82Xcm5FhHexDyImc4ZXzhYW+WR7lUjN7JruEq9EaOROC2CTS6b6W+vyh6/+ZJT
 KmG5d8+FZtvsvgg5n6t8e/8eBg7R2MAUZZdVayFwOP+y8+K9HzFvtqrqPfJySg708xpg
 1RFT0U4cp/fMY2UrKDKTT/r0UYTwjC6sMFi8RanZrZEoK+xMLBm3cokRM7p2j/NejTkr
 LUYA==
X-Gm-Message-State: APjAAAWu1NfDrA771+lX7SQsfaGvBxp4ufkUo0Eo32w9qrBz0mtRU+p3
 w0Vw2inU/ZEnMrzMtd152d4WXg==
X-Received: by 2002:a63:1f03:: with SMTP id f3mr21525885pgf.249.1566250754989; 
 Mon, 19 Aug 2019 14:39:14 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:39:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:50 -0700
Message-Id: <20190819213755.26175-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v2 63/68] target/arm: Convert T16, shift immediate
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
X-TUID: jqc5UlKb5Mi4

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 ++------------------------
 target/arm/t16.decode  |  8 ++++++++
 2 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index dc670c9724..dc3c9049cd 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10630,7 +10630,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val, op, rm, rd, shift;
+    uint32_t val, rd;
     int32_t offset;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
@@ -10642,29 +10642,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     /* fall back to legacy decoder */
 
     switch (insn >> 12) {
-    case 0: case 1:
-
-        rd = insn & 7;
-        op = (insn >> 11) & 3;
-        if (op == 3) {
-            /*
-             * 0b0001_1xxx_xxxx_xxxx
-             *  - Add, subtract (three low registers)
-             *  - Add, subtract (two low registers and immediate)
-             * In decodetree.
-             */
-            goto illegal_op;
-        } else {
-            /* shift immediate */
-            rm = (insn >> 3) & 7;
-            shift = (insn >> 6) & 0x1f;
-            tmp = load_reg(s, rm);
-            gen_arm_shift_im(tmp, op, shift, s->condexec_mask == 0);
-            if (!s->condexec_mask)
-                gen_logic_CC(tmp);
-            store_reg(s, rd, tmp);
-        }
-        break;
+    case 0: case 1: /* add/sub (3reg, 2reg imm), shift imm; in decodetree */
     case 2: case 3: /* add, sub, cmp, mov (reg, imm), in decodetree */
         goto illegal_op;
     case 4:
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index 4ecbabd364..1adad20804 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -126,6 +126,14 @@ ADD_rri         10101 rd:3 ........ \
 STM             11000 ... ........              @ldstm
 LDM_t16         11001 ... ........              @ldstm
 
+# Shift (immediate)
+
+@shift_i        ..... shim:5 rm:3 rd:3          &s_rrr_shi %s rn=%reg_0
+
+MOV_rxri        000 00 ..... ... ...            @shift_i shty=0  # LSL
+MOV_rxri        000 01 ..... ... ...            @shift_i shty=1  # LSR
+MOV_rxri        000 10 ..... ... ...            @shift_i shty=2  # ASR
+
 # Add/subtract (three low registers)
 
 @addsub_3       ....... rm:3 rn:3 rd:3 \
-- 
2.17.1

