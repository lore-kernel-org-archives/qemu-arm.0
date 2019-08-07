Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6073293wrv;
        Tue, 6 Aug 2019 21:55:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzQ4BuiDm+uC8wCiWddjrkqM84si9CuBO1bo5cDItKuhU8jR98TmotKKPMZ8FFj5CfZjTGP
X-Received: by 2002:a50:982a:: with SMTP id g39mr7581075edb.88.1565153745593;
        Tue, 06 Aug 2019 21:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565153745; cv=none;
        d=google.com; s=arc-20160816;
        b=saPH86e2LvIL9wcLGeJEFNFCjI5KYYEMmoqvR9eak5++9wmmkyi5a/mAx09iLvD2sB
         CxHV6D9aEJyWjQRZzbEMW6zjlIfVOxco6HVbUFKTIor8IaV2o5/VGzl6pTktnC+0Ivok
         W55KCZtLP0kf45GbtaI+8To5c2ViG9A39N+9k7wqxJqQ2cknF1ZVkvAq4gIWcpXGE/Tu
         bU9gXRlDkfRFAqR0nYm/9Q1vBF4dVNJzY382KPf/DpX7eGbYD67TV8s918AUZmwRlIhH
         A4AOm8l2i/Qt7cIEpb2bHaRXsp/hOiKQCUB18GxjChYk7qnNNRTFClQj9MNiEFHxCh6w
         hIhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=4bDE+Hq+chnI8wPbuqNYe22C+ZJ9SH+TnuzWZSpaQbg=;
        b=Xia2+7ER+Vufjw+9kXV+Y9sk4fumA55o/rNyUVE7lr59xNTJoRpVrr3hDubIOakisV
         gJaALROhxLrZ+HsAPprWY8DVsaR4su+PtKJXODq7TZSjfHAfF6i2W/Zc4fnPAUo9Ve0V
         fw10kJzEq2xlO5PCWMJCTaOzkwv7aeNUP0q1l00D81qtfAoqS2Vhj9IQQ9Lce2bILzXW
         qCdFELteQ5W0bf0r69adxoWr44r3oSlGOqEXVAPns/oSpY0bRF3QKxyU89UOOcVjyhT3
         BeFw8nsIIn4pSOwdMJ41IPVAhAwvxTCqY6C0E9RcA/ka4lvW1JTHhiRGLtwJCYsFeSLN
         AF/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ua3pUkWX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si28002245ejo.207.2019.08.06.21.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 21:55:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ua3pUkWX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvDzE-0005Ew-Md
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 00:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40662)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxQ-0001DH-Dj
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvDxP-0004pB-An
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:52 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:40110)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvDxP-0004oi-59
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 00:53:51 -0400
Received: by mail-pf1-x444.google.com with SMTP id p184so42759539pfp.7
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2019 21:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4bDE+Hq+chnI8wPbuqNYe22C+ZJ9SH+TnuzWZSpaQbg=;
 b=Ua3pUkWXv2z/gC4cHUT+sHLFhoLP+71LGQbIIarkscRJMXHvRTz/AQqr1V8CKLbY/9
 ND6tXeih6OeGhS3myNqIEKDNKXKR+7R2EuBKQrVgzdClouFQ2i1OpDd4G/oeAI7ffcsY
 /l0JGZT/W8H6f1Pybp0itHvEUbpUVgUBzaW/tiFETrbU4SXjEwAfcb+U4wWQvpyFTdgq
 0J7wH6t0Co+Sgy3+iWkr6OQjbOHrmBZynzKSgrVa92L/B/tVPp0sPTv8Y+fb2Gz/3bQz
 +GihBac0ibkdWi2zOi6VQjp13rDC6BjjOs562PAxEuMf/RP5f9Kr2bAkKBtZlJf7k+jm
 zGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4bDE+Hq+chnI8wPbuqNYe22C+ZJ9SH+TnuzWZSpaQbg=;
 b=JDdAP6WviO9N6mWH9QoaQXrYJd4hl7+o+RawxU/yb6TVTDphopc0IIS/SAU71hCJkp
 eY5m3wF2KcbNrLIq4BWb0oYbQKsiheKX+a7rsVhWzviPNQLypE32sKhhIXGHow3TStej
 h7n67IlNP3GCrtW46Ic1nhA8jNMdFMuEnpGyaS0ov+s7Y+zi9v28IN0+9dNZ3aygrN22
 YIqNTm6etfb2XTRSJ3+Tiu6FwTQ4csnpoD6wlPxg1fgoCsHw2dx/FRf6fpit7eQGlI++
 dLkKvBzXNuQiyjQjOV17clOQgobmU5RZANBWTGENSHN2cbmDmPVahJLA8rJUMTPFEe3S
 kR3w==
X-Gm-Message-State: APjAAAVmbB9ZMwEgw3wdRF8wNgUXdnKTr+OYdTJ1KQxkc4eIee17xbv8
 J/v4oQYLfqSOWQOKtvkCWTBUGw==
X-Received: by 2002:a62:1444:: with SMTP id 65mr7297001pfu.145.1565153630212; 
 Tue, 06 Aug 2019 21:53:50 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id t9sm24347921pji.18.2019.08.06.21.53.48
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 21:53:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 21:53:29 -0700
Message-Id: <20190807045335.1361-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190807045335.1361-1-richard.henderson@linaro.org>
References: <20190807045335.1361-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH 05/11] target/arm: Remove redundant s->pc & ~1
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
X-TUID: 8mm6yIq7VbB9

The thumb bit has already been removed from s->pc, and is always even.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 71d94c053b..100f958e33 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1288,7 +1288,7 @@ static void gen_exception_bkpt_insn(DisasContext *s, int offset, uint32_t syn)
 /* Force a TB lookup after an instruction that changes the CPU state.  */
 static inline void gen_lookup_tb(DisasContext *s)
 {
-    tcg_gen_movi_i32(cpu_R[15], s->pc & ~1);
+    tcg_gen_movi_i32(cpu_R[15], s->pc);
     s->base.is_jmp = DISAS_EXIT;
 }
 
@@ -7819,7 +7819,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                  * self-modifying code correctly and also to take
                  * any pending interrupts immediately.
                  */
-                gen_goto_tb(s, 0, s->pc & ~1);
+                gen_goto_tb(s, 0, s->pc);
                 return;
             case 7: /* sb */
                 if ((insn & 0xf) || !dc_isar_feature(aa32_sb, s)) {
@@ -7830,7 +7830,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                  * for TCG; MB and end the TB instead.
                  */
                 tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-                gen_goto_tb(s, 0, s->pc & ~1);
+                gen_goto_tb(s, 0, s->pc);
                 return;
             default:
                 goto illegal_op;
@@ -10464,7 +10464,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                              * and also to take any pending interrupts
                              * immediately.
                              */
-                            gen_goto_tb(s, 0, s->pc & ~1);
+                            gen_goto_tb(s, 0, s->pc);
                             break;
                         case 7: /* sb */
                             if ((insn & 0xf) || !dc_isar_feature(aa32_sb, s)) {
@@ -10475,7 +10475,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
                              * for TCG; MB and end the TB instead.
                              */
                             tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
-                            gen_goto_tb(s, 0, s->pc & ~1);
+                            gen_goto_tb(s, 0, s->pc);
                             break;
                         default:
                             goto illegal_op;
-- 
2.17.1

