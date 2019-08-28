Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1203003wrs;
        Wed, 28 Aug 2019 12:58:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMHdZ2NXxZRbw9NHCnsl1aBi7GVJZoWbQsi2pcaS5LxkeylDzNEwipuaMa/77yQFXoIk+F
X-Received: by 2002:a0c:f706:: with SMTP id w6mr4066812qvn.98.1567022303312;
        Wed, 28 Aug 2019 12:58:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567022303; cv=none;
        d=google.com; s=arc-20160816;
        b=vxMX28P82Cyjs2l/hlno5XmJmMs4TTboLQVGCSedLpwRfbxy8ClgsS81pLu8pn1ADv
         iwLq/NYvoopuqIv9SXXbgJrBjSRTygAOARqt2PNncbQA0hEDVUmZQ82Agk9F4o3VIdSb
         zhLpcHgqOXKJ1c3NPqIB19ww1oJYi5Ci6QpftSgRXw1RWnwGcqhLqGgJSd3TkP0vLeCq
         sX+xcqCLIZgGHJssp1V8F/Wh8Vp0N28qjcNCoz5eQjx1ukUu5iTetqX1+n+AB10gWqWN
         bXFKI14dqzaxsYzRh2MxCGF5gh/JXcpfXKRBlk5oaCseKoLbG7zrWMYZN7rqSoaBdCvB
         RH+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=IEMQLOaKN2FBc7/rDBTq236Bhoug8XTI5v8qdQW1ulM=;
        b=K6JWt6mraMnskvENj4JYFVtM0C95ky1IK1D1OesKT6OGzhFBnj9KQJrISuMyyoWmjs
         pawz/G1Re2BWB1sPWm7vprzjAOisWVXWZPuJbTke3ggSMfuNKB7EaACwHu92WA4esSrC
         WTzx1TNfn1A+eFv6UqsC1SGZHDLLAobyL60JB5zj2PReMymfLYZonZzV7vwgxwx0vxgS
         ru32W8BQXdu0Y62yzw2iBpsq6roeZZAhyMeLJi2QDILdkM7SjDjGtl5GBpDK22OB5DI2
         OimD8UjgS0sSWbFcpVjIoJYAKCIyb8KVLV8SebMpOtMSzFy0uXP+0Z0odFfRtzfg/JKE
         1s6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bau2tH0s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i44si276989qvh.1.2019.08.28.12.58.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:58:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bau2tH0s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i345G-0006eW-7W
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38928)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33H0-00041k-FD
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Gx-0000mZ-NW
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:25 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:36257)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Gw-0000lH-F2
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:06:22 -0400
Received: by mail-pl1-x641.google.com with SMTP id f19so405338plr.3
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IEMQLOaKN2FBc7/rDBTq236Bhoug8XTI5v8qdQW1ulM=;
 b=Bau2tH0sgRmJmMrxQX33xbTNfgwGWPIY6F7XcW8sVRUtQoFNXcWT2fX9jSQe0P9Jad
 6Um4+++ulRRwwNtw5qfb185UIrCyq88uDQNbs86+CKKbiyW7qDaofXy3qdMSS6QtFL9X
 E3kCiNJgL5j64aW/bvvMx0/S8kFrsY2bXYzv+KAv2iesEogPyqL4nLGhZN4oOSVqcC20
 KuaJ9/4AspeOwmk3uvTGmCPsW1zDcotFy86fn7YDcZU532mA+t7f7fBQbF8d0Q9rXdkY
 pnuysbbh86SyfV/K8+YydRoqojIaAITtmIXc9sXf3qKuFOJyFnWovuJuwRLE40PB28I4
 3DZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IEMQLOaKN2FBc7/rDBTq236Bhoug8XTI5v8qdQW1ulM=;
 b=QQaK9KsI5Otlzdf1EpyoIlftBsm81lakmpp9FPEg4gZz3n0SG7GE836jYLxA2EGgba
 awmdis0GK7WF8Fo2Qj1JlwENFwwrKgC2Xu6hpuxHi19XEqBdBc/Feju/59WPAuCuXLHp
 m7ISBoKDeebCqiYAk5a5FvGwKnuSuFZNXG4y7CiLwq9eqpgYzC6jZT4md0Rb6d3V0qkB
 zxu8/+SfFR0lyAWEWb9jxOUdbbQjG0H3sFr77sqfgqe6NLWzyqLvlBkNLFZ/VXGwJLFM
 yO4e32ftiiOD4oAeJogupInFoya93uVZNTixVBffbOh/Z/XJVW6M9eAIkWWtdp3oiyRU
 Zt8A==
X-Gm-Message-State: APjAAAVHlGewmDYyr/wBVBXRmqwvGyBN8HSrT2NN1T71d9X7dLGihQ+A
 6vtlavxuumneOF/3Hf/23eISEtXp0fg=
X-Received: by 2002:a17:902:bcc2:: with SMTP id
 o2mr5894669pls.127.1567019180860; 
 Wed, 28 Aug 2019 12:06:20 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:06:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:04:51 -0700
Message-Id: <20190828190456.30315-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-arm] [PATCH v3 64/69] target/arm: Convert T16, shift immediate
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
X-TUID: 3giGV7KgkIK0

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 ++------------------------
 target/arm/t16.decode  |  8 ++++++++
 2 files changed, 10 insertions(+), 24 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5fb0e2066b..dd292b3042 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10731,7 +10731,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val, op, rm, rd, shift;
+    uint32_t val, rd;
     int32_t offset;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
@@ -10743,29 +10743,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
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

