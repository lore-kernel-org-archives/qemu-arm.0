Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3207522wrs;
        Mon, 19 Aug 2019 15:27:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLOy/vI30hrIDqJ23jf6RvPD9GZFOInvEu2XH/aELr5yIqfjTYD8AjtIICqm9maOJO36tS
X-Received: by 2002:aa7:c552:: with SMTP id s18mr15185510edr.0.1566253620212;
        Mon, 19 Aug 2019 15:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566253620; cv=none;
        d=google.com; s=arc-20160816;
        b=ym62uZc7PfDa/pLlJckvKixb+IlrDwS+N2uxp04nAFmgCLIQ/ZhqOhaCMEhQdMfh8r
         QNmKVA0Zd4d2mslZwwmFkwXpE/aT7JW8A21qZeC44DCL823Bvnwdr0aH6X36pFpIy6+h
         0itjN4gEHCCBFeBoTAt5Zw/LV9FvRcF49sIrdTfI08uEdTcRza+jn9RtYAMGUXVRNxx6
         R8GYozjxwZkj7lKCPGNsfUoZ/f10A1zzJVn+Qvq/Gby8v734TUhwgm0txE5RKdHwWa1m
         fDNxB7+ecY0lFQyr0bdzeXAsHIHhjM0815gjXGEkfnKUHvJPC0jm8VKdsDjMgRWOilR1
         rLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=A/kxiGsWb33X0BCIForTFk+4xWAxXqSlHmM910wf6kg=;
        b=nKmP2/79ci3zGEbwOPvQeujCk6anSaGtLKnMjbNQ9fBqDAqahaoTciUDj+XN5J0s/9
         hGeAdMyI7kiaObrbRXKgSKW1cw34UNk/G+WSUqev39Xv0/suYMuOTa8DDztNNc8xVdRp
         UHqMO1ka4FlHfhHchixZ+jVWoqLnlDCNiAlTsTcxeEcJKkYYNHk33DoIuItxQoZsAJau
         pImcRLf5OSZ20CxKvgM1GeoDtvTF1MazJElimBAYBedW4XXZqa05VrJBWkq6xX5wnsYj
         oGa1UOKxh0jmlf0E2sml703PDK2ruIZdntziYBvihhYiNrdt9ILFYf1tc09MuSK66FcD
         GK8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x9ssxPL8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s41si9437732eda.207.2019.08.19.15.27.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 15:27:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x9ssxPL8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzq79-0001rw-8e
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 18:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMm-0002cJ-Ei
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzpMl-0006lD-BL
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:04 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38542)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzpMl-0006kY-5P
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 17:39:03 -0400
Received: by mail-pf1-x441.google.com with SMTP id o70so1949487pfg.5
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 14:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=A/kxiGsWb33X0BCIForTFk+4xWAxXqSlHmM910wf6kg=;
 b=x9ssxPL87BlkTXhaz2s9f10VQLKxuH3fZVfv+qFjGSWUwCho1+Vd6gZw85my0aUcM4
 QeV4aX2/ZvXJL7x8lKoStAOfyA0diBQ2NOo2dPULSAGByv5Z3SaGpuJNRCkV/njnLjk/
 3m6mRcocMnvo89bOs/D/l7Gwrbo8FbiFP5grumenlGslPdfqC2/1PaJxKr/ySdFughgb
 O/xkaXwGyICV0FEfRySl/y0HE1ABu8WzXQ91WPrZZIFojMZf4u8iaKIxxrJG4o3y3dnQ
 t+BYMHriU7cvVZmKWxXhumoVx1p4wRE5mPRDk1z1JSUQG7wNfKbi+FMDOWpr1w7B51Fh
 E0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=A/kxiGsWb33X0BCIForTFk+4xWAxXqSlHmM910wf6kg=;
 b=tSaGCEZAU4D9GhQHtcm08gFwa60XyzUU4qc7gexgc83dDVr+3/OL+KBawRTWiiBnIj
 ed+uRgXyPQPZzHeNXiSB4SeEBXHyzpgG4mgHfHN4CSRZYiyVgtJJqLIkwDTMXUh9ZPZH
 JR6MQKDyeQ+G4LzapYOMgTgJzS1bLybynLqt6jKHGC7HoXlWy2lpzWo8Ak+Rqz++xHoC
 n8m/d1RcxOrWKZ1ZASG9r51uxOuFmurn5WfwS+BN67xfz1oEoB/WFXhnWx9CjAdgz1tj
 f+Z1/ZosJPgFikBj1JZ0LMWHQpswHl3hOYLAfT+Eb0jkyijGyUomJX7Su45naPq4g2g0
 2eLg==
X-Gm-Message-State: APjAAAXN31BcdREympGLgXR4r/wXHo2/RlrlJevuGwY477+6g0lgtjjR
 f2RTfwkrap+BDaPMHX8BYEt1aA==
X-Received: by 2002:a17:90a:fa82:: with SMTP id
 cu2mr23548752pjb.85.1566250742275; 
 Mon, 19 Aug 2019 14:39:02 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d2sm13446951pjs.21.2019.08.19.14.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 14:39:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 19 Aug 2019 14:37:40 -0700
Message-Id: <20190819213755.26175-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819213755.26175-1-richard.henderson@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v2 53/68] target/arm: Convert T16 add, compare,
 move (two high registers)
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
X-TUID: lLYCLC3nnXqD

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 49 ++----------------------------------------
 target/arm/t16.decode  | 10 +++++++++
 2 files changed, 12 insertions(+), 47 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 60bfc943a3..e639059a5a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10620,55 +10620,10 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
             store_reg(s, rd, tmp);
             break;
         }
-        if (insn & (1 << 10)) {
-            /* 0b0100_01xx_xxxx_xxxx
-             * - data processing extended, branch and exchange
-             */
-            rd = (insn & 7) | ((insn >> 4) & 8);
-            rm = (insn >> 3) & 0xf;
-            op = (insn >> 8) & 3;
-            switch (op) {
-            case 0: /* add */
-                tmp = load_reg(s, rd);
-                tmp2 = load_reg(s, rm);
-                tcg_gen_add_i32(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                if (rd == 13) {
-                    /* ADD SP, SP, reg */
-                    store_sp_checked(s, tmp);
-                } else {
-                    store_reg(s, rd, tmp);
-                }
-                break;
-            case 1: /* cmp */
-                tmp = load_reg(s, rd);
-                tmp2 = load_reg(s, rm);
-                gen_sub_CC(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                tcg_temp_free_i32(tmp);
-                break;
-            case 2: /* mov/cpy */
-                tmp = load_reg(s, rm);
-                if (rd == 13) {
-                    /* MOV SP, reg */
-                    store_sp_checked(s, tmp);
-                } else {
-                    store_reg(s, rd, tmp);
-                }
-                break;
-            case 3:
-                /* 0b0100_0111_xxxx_xxxx
-                 * - branch [and link] exchange thumb register
-                 * In decodetree
-                 */
-                goto illegal_op;
-            }
-            break;
-        }
 
         /*
-         * 0b0100_00xx_xxxx_xxxx
-         *  - Data-processing (two low registers), in decodetree
+         * - Data-processing (two low registers), in decodetree
+         * - data processing extended, branch and exchange, in decodetree
          */
         goto illegal_op;
 
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index edddbfb9b8..5a570484e3 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -146,6 +146,16 @@ CMP_xri         00101 ... ........              @arith_1i s=1
 ADD_rri         00110 ... ........              @arith_1i %s
 SUB_rri         00111 ... ........              @arith_1i %s
 
+# Add, compare, move (two high registers)
+
+%reg_0_7        7:1 0:3
+@addsub_2h      .... .... . rm:4 ... \
+                &s_rrr_shi rd=%reg_0_7 rn=%reg_0_7 shim=0 shty=0
+
+ADD_rrri        0100 0100 . .... ...            @addsub_2h s=0
+CMP_xrri        0100 0101 . .... ...            @addsub_2h s=1
+MOV_rxri        0100 0110 . .... ...            @addsub_2h s=0
+
 # Branch and exchange
 
 @branchr        .... .... . rm:4 ...            &r
-- 
2.17.1

