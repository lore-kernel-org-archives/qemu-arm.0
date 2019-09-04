Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1160549wrp;
        Wed, 4 Sep 2019 13:24:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzR7Ct4gPt17A5s5wV1Rm9S1rzxtZBoJDxhyiVzJX/j1endJB0uZqUvppZJNjcFc6hzSw8H
X-Received: by 2002:a50:d6db:: with SMTP id l27mr146794edj.164.1567628669623;
        Wed, 04 Sep 2019 13:24:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567628669; cv=none;
        d=google.com; s=arc-20160816;
        b=n0qNGH/bSPr3BTD2uPgABOs627EXB99JUfSpPRhIDdeZnccuUsu2O+rlqOIo9eZ736
         AZGc5k21By2lNUcOIvRwnHHQUsuOnTpspN55tuN1FKpfhrAa9PZrX7hit7TCoxzAFh67
         CVq/hjLUSTeO2JtEVaRlwN1tCRetxKK5CSwNZTpfWChiPtswjStcqhGS5eGnUhcIm3W2
         GhX42saFVQTpeMJ8PfApBagMlYWHdXY7755Eu9uopDyE1CdK3oyBVGmOeG8DObcRJuiy
         fzeLPEmaHfeu9DKgZd3eg9zUlgseJoGyJ09Bj7TuRGt84J4IgngY7Qqb4fCEDCutYkYA
         TBPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=yenO3oE4SSaYXrdcFyWSo2Ub5XpLvK6VEnhxFO59r04=;
        b=lhDhSLbrN9woJPge0XsSW/lDhdDIvQsad84X8khBLAnvfiioYeUvGWw7X6GANnLWKY
         rLHiDZI3HaUJEY9YY5AG5VB4g8j6Xjyonp+lhLWkB2keoHHzEtZMbYL/VYZU6PlB5Kv2
         Tm/I49gQPbCuL6CiKvIES4n3Vqh9IbkLNtPS7elz1QWtXcj6xeGbIZawVjP83VR6cTVT
         fTag2s3SZeBswaKC5Fx+Vx3YwtVVVQChkKmO+h47eJQ8oBOzHYG00tLvPYRPWppT8tME
         G4qq5c3vkUBqlFXHK4YINJxRNf4oPCuHHvEfyPQcm6gtFnKeWbciSjFv7AWuwNPA7F9t
         tbBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sOneeAFE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s26si7795120edb.178.2019.09.04.13.24.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:24:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sOneeAFE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bpL-00024v-VW
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41416)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b11-0005b9-80
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0x-0003Gi-Bu
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:26 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41614)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0x-0003FT-2u
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:32:23 -0400
Received: by mail-pf1-x441.google.com with SMTP id b13so7278757pfo.8
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yenO3oE4SSaYXrdcFyWSo2Ub5XpLvK6VEnhxFO59r04=;
 b=sOneeAFEQVgGvPkBjDxeEb9He06PDg8B6Brizk84ZzVO6ZbgHla3sOdmDQogtjU+RS
 WW4o3b8dxgQJgPDz2njww3KR4wu6QIggogNmy9l2HKzhlB7YuuGnPQMfmU80B6j22bac
 583kRFfrjlFxUFdP93Yg4jhtZykMsklJaMzuAwiQvNcxHvxFJMoACjx7zeymYzhRhDpF
 3uLAOjqZdX6EVQk07cLkyPU0E1HoAAQgkfWp9GK1aeb9Z4zlY5KPjz+9Ig0poAa2Ezja
 KGuLx7pR19bawgYULliWQ4tzF88EcC5mbApH5wyMl/GtYVsmDFE7vsSWD4f/Xrql+uQn
 REzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yenO3oE4SSaYXrdcFyWSo2Ub5XpLvK6VEnhxFO59r04=;
 b=JT7jMmAADSoPNdXeqG5/4bj9R3fqPjuERId9cfk/e7OOpVi7ex842shEWg70+ZQmAW
 yiFKkSREzVgCcwAgeI9N98CspW5Dr94ErcPIJyIxTwTSggIxA6UfUD9MNIw13KNSrrkA
 2ftUDOSF9bwuBBExxccOmeC2yHBQYCX5NmTt0KwLBiky9xh2enOVxeZkkmmxy5/1TXOZ
 9KR8sPmGjXAO707+EZXPpye9W0uFhZnAu48vRR0c+ieZF1E850VhkZFddUOiJzyxYKmc
 wA5GcuP8jVWTtbw4SccfYJEny+dcVnmKugHC8e8jRbhGfyuS7NSrvPqCZwPAPpOXrdNY
 V37w==
X-Gm-Message-State: APjAAAWXlyw6Hl+8Z/xMjmQOpvYrXbnW7WP/0uY5MjBZp2q8CbSjpr/s
 FU/JoF+IlwdvSLoOXm1GQ+WqZg==
X-Received: by 2002:aa7:9117:: with SMTP id 23mr24820154pfh.94.1567625541967; 
 Wed, 04 Sep 2019 12:32:21 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:32:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:54 -0700
Message-Id: <20190904193059.26202-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v4 64/69] target/arm: Convert T16, shift immediate
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
X-TUID: 5W5Rk+NzO0Ru

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 ++------------------------
 target/arm/t16.decode  |  8 ++++++++
 2 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 48ed6f6b5d..d409afd55f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10754,7 +10754,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val, op, rm, rd, shift;
+    uint32_t val, rd;
     int32_t offset;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
@@ -10766,29 +10766,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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
index f128110dee..79a1d66d6c 100644
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

