Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp655099ejf;
        Thu, 11 Aug 2022 10:24:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4EdIlr2jnU80lPOoAvMzyKuWsgEE9cQgwkIyvjMLfLZO/fYGdZKDODdaQaRiGMdapRHzge
X-Received: by 2002:a05:6214:e62:b0:477:274f:3e24 with SMTP id jz2-20020a0562140e6200b00477274f3e24mr142061qvb.129.1660238682954;
        Thu, 11 Aug 2022 10:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660238682; cv=none;
        d=google.com; s=arc-20160816;
        b=brNEFlwx5CfVOcC38Cf5muS5WEdQVh6gxI8SO4XoPe/YRSQVr3vJJn1WnBRXrbzBsR
         ITJzuswQQpSsSC1/Opw1xtFQ4hZciV0Qf4oCfSWmnuJaHBIQJsjao7Fzx3oxLK52ofr5
         ZWMb0tYB20sjibZMLE7l9f9wpwfvZDZVpemloTPS+xHoK8FESFg61UwrEVRebZabEesr
         vvSIsSKPjip6qHQlEJaQTgDdu1T+xZflaJxpME/sJhRJzXdVVWjHoG68ZTorkWJH4f3i
         U9CsFz9kYungANuZ+0xiiNg8dqo2SihXADDiAvgLu41qexsKQBbO06IaCm8N45RZV9GA
         ZPmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7JOOvNmtI1acCNeUuTnyvZig9bTiBz+pPJfNeB7v0uo=;
        b=szuBwOt0BKZBRDzT/Pxuu9zSh6xu4nWD9c6uM29SCcDojy4qFecioO3doDSuGoL6JY
         VDSFAl/olllnO8yzkwqcjnPm1OhoPvxmVsLac52VjeK8szz8mW3ukMnkGEXXY52mgXgM
         +HsCNaCFesYJDMLl64iLhT09+YMcEHvHm6gKZqhIBEiezJd7tUE+9fwgtvwOTTTl7Ksl
         Y3cqulzTsn+vU0NfDUvWI2vEwcFqpBTMlPUDnNurIt5rwiAmmS9t++nO4nINcE/PE5wM
         dw+QctDR94QWw+jeL1xAar15Q0Ofj6inuuN7o9d15iRhjAhtKj1eaLvAjdoBwKbdxTS8
         oR+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCQaMIR1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10-20020a05620a44ca00b006b619c54ac0si2322148qkp.717.2022.08.11.10.24.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:24:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCQaMIR1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMBvF-0006se-GI
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnK-0006rL-0V
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:30 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnI-0000uu-0h
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:29 -0400
Received: by mail-wr1-x430.google.com with SMTP id p10so22027202wru.8
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 10:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=7JOOvNmtI1acCNeUuTnyvZig9bTiBz+pPJfNeB7v0uo=;
 b=gCQaMIR1nw1BU1oWukn9ljVoNP6sS45rgkDjS5xN/khnizeQDFQUx+gvSqoIYjE+fi
 XoK5/OjTEjObUCDEm1r3wZ17sfs6Xr0yciNKjFf5ZPwXPdfOvAMx5fg7jdfYP/UIa63q
 Pb9P68PyIzXBG25/64Nym/D7y1sKxyfkUIlvxQ1Ggw8+LSDAuDwMTtnR7i3kaEjC7ISi
 GEkFUVFUTsNwIkGk9KRfcL0C2qjb9WvyJs+Fi3hG0GbnFnJfq8VcCAxWegTp9ortwhCL
 rWv6Kn+qyZyDffZh+GT5ZNC7CZnd5i6JYVGMNZrptt4Fk740QQ3kbUCc5FnmKOmz8uzo
 ZgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=7JOOvNmtI1acCNeUuTnyvZig9bTiBz+pPJfNeB7v0uo=;
 b=1kVOlglf5/LAoT7xk0kSaMEuPVjm+Yk1bIlpOfdz825mdb3DxLw0WNIPaE7PRbzvJv
 uQtmR368bLdkLPl9pv8+sk0yxoAy4aE85ADLRfh9yuP9DL0IwowyOstjshbGOAy0aatm
 EDNjbXedy77+WubjOwY+y+Y4nnChMZ0gpI0lLER1jSB+UQkY3fBZsNVs228ijUqNoPx+
 03lE+kU9iiv9W6nuodnXnZB1/Bbc7sNNWxiMn3oxVyxhKvQ/fYB2Cb1MfY6tGHVe0fbn
 yTDUT+YPKAzq6TATsFC79D/HDBajigzHjB9LIMAbahjUo5zZJd5Qu4nxIWbw/9laym6+
 vNWg==
X-Gm-Message-State: ACgBeo1A5OCRhWeib2U0P++gODOBA+YUPZgMofyXZOkMG3Kto7Pzq0sF
 M32YFBWzOZyPQiPXQx4BOz3Xjas5UhBucA==
X-Received: by 2002:a5d:6102:0:b0:220:6382:eab1 with SMTP id
 v2-20020a5d6102000000b002206382eab1mr2932wrt.539.1660238186480; 
 Thu, 11 Aug 2022 10:16:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/10] target/arm: Detect overflow when calculating next PMU
 interrupt
Date: Thu, 11 Aug 2022 18:16:15 +0100
Message-Id: <20220811171619.1154755-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kquc5Wtl2Npe

In pmccntr_op_finish() and pmevcntr_op_finish() we calculate the next
point at which we will get an overflow and need to fire the PMU
interrupt or set the overflow flag.  We do this by calculating the
number of nanoseconds to the overflow event and then adding it to
qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL).  However, we don't check
whether that signed addition overflows, which can happen if the next
PMU interrupt would happen massively far in the future (250 years or
more).

Since QEMU assumes that "when the QEMU_CLOCK_VIRTUAL rolls over" is
"never", the sensible behaviour in this situation is simply to not
try to set the timer if it would be beyond that point.  Detect the
overflow, and skip setting the timer in that case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 434885d024a..b7a420981f8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1227,10 +1227,13 @@ static void pmccntr_op_finish(CPUARMState *env)
         int64_t overflow_in = cycles_ns_per(remaining_cycles);
 
         if (overflow_in > 0) {
-            int64_t overflow_at = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                overflow_in;
-            ARMCPU *cpu = env_archcpu(env);
-            timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+            int64_t overflow_at;
+
+            if (!sadd64_overflow(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                                overflow_in, &overflow_at)) {
+                ARMCPU *cpu = env_archcpu(env);
+                timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+            }
         }
 #endif
 
@@ -1275,10 +1278,13 @@ static void pmevcntr_op_finish(CPUARMState *env, uint8_t counter)
         int64_t overflow_in = pm_events[event_idx].ns_per_count(delta);
 
         if (overflow_in > 0) {
-            int64_t overflow_at = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-                overflow_in;
-            ARMCPU *cpu = env_archcpu(env);
-            timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+            int64_t overflow_at;
+
+            if (!sadd64_overflow(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                                 overflow_in, &overflow_at)) {
+                ARMCPU *cpu = env_archcpu(env);
+                timer_mod_anticipate_ns(cpu->pmu_timer, overflow_at);
+            }
         }
 #endif
 
-- 
2.25.1

