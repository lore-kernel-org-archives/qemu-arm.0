Received: by 2002:a05:7108:5790:0:0:0:0 with SMTP id cd16csp5208508gdb;
        Wed, 14 Sep 2022 06:06:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5jWgBz33GkrRkMj7noPpGAc7b+NSRO4FpoWZz897ClNh4VTlggDTKLu6mLm/XdKJvtNuub
X-Received: by 2002:ad4:5cc8:0:b0:4ac:a890:a01a with SMTP id iu8-20020ad45cc8000000b004aca890a01amr15680079qvb.18.1663160801990;
        Wed, 14 Sep 2022 06:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663160801; cv=none;
        d=google.com; s=arc-20160816;
        b=ucPrOfH49CTcy28OUOKJzO3l3f4i32dkPMWsaJxdzWvvY9sCXyyYvWxWcgT1oo/717
         O8+DoHX0hU1xxkmmpLMOLKRRjlGQSLRw1Fv5bl/UQW/xrO5d5kOEHsWeRE08enHo3R0b
         Xng+6W0o5Z9qIPWZAkqBSrahFEOjVq/+3CG6XvAUkL55shXdVwSIkS1JtorYogDoL1Im
         MD+UMEOAjLc5FLrmso24bZxRslwl6N64KBX8lUXQ7FzSkXJkFmetdUTwMjw+8JY/nB7p
         t+IRg3qnDhEEzbYTsP9nTp+1GubRbmEH2ULlK8lde3R4Uoz0zgAUU8ZIICZ3iyyMXe4t
         R1Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cWtVxLGk2Gz3c0rqKUOonGO/yrqOCOPVcHSSu/486Rw=;
        b=SvW0rjEJ0iHHQdX/xhr/wABy6J34d+btzx2O8NEecbSQZYGs/mX2Rm2e9RVmKHKbWk
         crA2SQrcMBj1cxXOrwZrJGrvoi0FRz0Pr3rC7sB4jNKEdlGKsD/+7lBjZTDkNaDzoMtY
         lRRkYP5qJlSAbtMK64rjboRczAawREIerbKpZgOuaRYrd0vcISOw2H9CAoGnPSG7IK0y
         gHSUq9IHAcx3kNAtby8ONvpOrw6jYSzoodLxWyPzzV81H+4zXqYFH3Nx9LLAuuuJ7uBN
         ayAcei1Un+tD7CRS0/wdU60C1+BGA333fVbmT2h/QmfBWJmzcgju7KUBqH4l6vxv2yf6
         vxUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ja/yRueS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk3-20020ad45d43000000b0049704423a76si1470016qvb.267.2022.09.14.06.06.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 06:06:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ja/yRueS";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYS6D-00027B-HJ
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 09:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwc-0000Xw-W2
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:43 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:54838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwU-00006c-G1
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:42 -0400
Received: by mail-wm1-x331.google.com with SMTP id az6so11431506wmb.4
 for <qemu-arm@nongnu.org>; Wed, 14 Sep 2022 04:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cWtVxLGk2Gz3c0rqKUOonGO/yrqOCOPVcHSSu/486Rw=;
 b=ja/yRueSVKZ7ylhmIRANZaQgPgwiigr1YqdumzoV0IUKLOUD8vSrqjM21hwdwaP9Mt
 SpROa/N7SjCJQ9C9jI/exZtUv9/1c/rk979uZepwP0OkGGpdYeGbp1BEIA9R1gJZG8N2
 cwRg6GFDQmUNXKTtmulr40XfMIZI4xxOa2W2AUiWbS8nVKuQD5LzphEnyRDMDzwiLVwd
 0OHzLP6x8dxYyh1rRVTCHTNPwVd4rHa8sGLMFjF9MQ/LZhmV3624p3cNtT7NhHEotCCw
 Q2fRjaQlUGlclcZDzzGgzUSTfSXrttYgpZms2hoYbllKS7VxzWqYZSPvJWKAaLrwnHyx
 Pzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cWtVxLGk2Gz3c0rqKUOonGO/yrqOCOPVcHSSu/486Rw=;
 b=I4FnapufFNoLD57Ix/7aT0rYgDFXdRPDrU37vmDNWsDGM1ZtOHacTfKlj1fsQD8qxz
 3xpi6ieJHVTwt1A/JLD73i3hRAp6snHg4YzLrR802yEPpbtCWCe88JRslcoNuqavFLc5
 Njx0ks9MGHNKGX10T3qubgWD2o15WYMGuMQ+EhWpEO6box8xdVST3usMlloIAHG3lz9y
 R/Q9GxEqijelxriEMDzHBKNr/h8lgLc8eAEbHYcb9RSKBJUvUGOTrq/559d4DXLMngO5
 nG3b1K0K6lAXqspMZwSQkrUFUSW9mOu5cTWKZVKKzKty4WMCpodmU1bkhP4+7wjO1c/F
 Ra4A==
X-Gm-Message-State: ACgBeo2p+5616U+wBXH07qW6OgF8iyVc7F4VSLAq+nre0oUJTG8uwoCl
 /EwBuLv2r6gB887CZa1pC9io9g==
X-Received: by 2002:a05:600c:414b:b0:3b4:a655:720f with SMTP id
 h11-20020a05600c414b00b003b4a655720fmr955500wmm.92.1663156352920; 
 Wed, 14 Sep 2022 04:52:32 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 14/20] target/arm: Detect overflow when calculating next PMU
 interrupt
Date: Wed, 14 Sep 2022 12:52:11 +0100
Message-Id: <20220914115217.117532-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: 8pI3Wtek9ixc

From: Peter Maydell <peter.maydell@linaro.org>

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822132358.3524971-7-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b792694df0..11a7a57710 100644
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
+                                 overflow_in, &overflow_at)) {
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
2.34.1

