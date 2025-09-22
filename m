Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC61CA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:52:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lbj-0004k8-S6; Mon, 22 Sep 2025 14:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbf-0004gd-Mo
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:47 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbZ-000465-GX
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:49:47 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-77da29413acso5013819b3a.1
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566978; x=1759171778; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qtUZ/Uu6kwNI+zAAOhv8j6MlV2cWVEsAAEi36fFJ9wU=;
 b=OjDWBZMBLjnpJc7x6Aa4QgdSzygtjvRhUpowCykKcdF/9fRqJ4sdQHV3eIb7F+GsVn
 q3Fg0i+yttFksUw28ORI69sG4/BYFqBpzhc8M1cD3WAz8z7ZzFcsXlc0bK6q7pRbw+SZ
 jDaSKX7iYBwvfzcIF3joFtQd5I1mfrgpvBCtI7AdidzrweaUAP8vJMIASv0VOXFwWM/b
 j8sDrLwx6qcZVyWKcY0snGv71L8POmLLXzw6F9t8nt39i1B2+TwVaSsUl9wsjAGYLRlX
 87VhMpDtAfC5Kda5jEMxT5nNJS2M6N043X+paHsK2pIfGXwBlmQD8HwjC5b094PtvFT5
 RYEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566978; x=1759171778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qtUZ/Uu6kwNI+zAAOhv8j6MlV2cWVEsAAEi36fFJ9wU=;
 b=olQmn0N/G39KvidpLicEByULjCyWXOtcNaZZBTJAoqR4RPJgQQG8/Zr7ZeWREUqUD+
 qu8DGY14kxC02mJVOi59qdwjuuSdjGZYwQwOo2x0+7+bbC3pjfak22ouulngkP+ohkNy
 YUUlPgWOlNyM1ZVE3nU3eo3eocSnViRimO0LYSi3isdkDgGSJbwj73oqd3oQDi/WmRFi
 n6OqFkxnzYFjzP78+EJbD8+hxz6h6Br38jLvTXFGvPFeWpKBPxSGEmEcvpGqNykBR3GJ
 NsX+0kM6kIVwzl2VPC+IlzZqgtKC0WqKF1XjUNuINKjam+s8Q9QzB7pyXObcnevjyld6
 g+8A==
X-Gm-Message-State: AOJu0YxQd28wr7BRWmk5gYprpgF+UQw0/GPJEttZiVWGfVksnxFvq5Bi
 c4YMDKh+Q40xoZP1i97KLAsvyl4wPGPvF0g0O+zQeT6tXySmAF3plF4jzykOj5Ec6iNmTw1/H3z
 zj8jr
X-Gm-Gg: ASbGncvq/igDPL96QAkns5aaAasWSU7mUi/ggaelU0Qrgd4dDw6HqMpfnEjoWJjfVTc
 FC/i7ePr95HdV2pR5uu7mKtrV0O3Mr0piJEoss0sMD2kl3J4W+ZNZtNSPzo0kpLOMkzAq4FISIq
 eW/GTXkoU9N03pqcIz+4dGt/DyD6DKEn1hECUOn/jMVYP5VAHT4scASkKSPSxuAv8QIroXRKb+a
 6KKhXgKGymN0NEPYo08sYv/M0cRNdpVgjp6DlRcFlBDmbK3GaLNDgcIaLnEOSj/zCt53hJp9nno
 G68BAvVG6A6ia5eDVaeuHlfEznHMo+HkiwcKyF61epvXFwsOLqedTPo9ZhNh2QOzll4N4rb1QFL
 aOIXZCaiSrNxFn/kuqH0nellPkjIe
X-Google-Smtp-Source: AGHT+IESM/forMLR2F+S29Rci4k5HQuQ8p3sORu0O/CLXi5/n/5F+jspnyzO2DfHSPetAMQXPz4UMw==
X-Received: by 2002:a05:6a00:230a:b0:77f:3e56:c1c0 with SMTP id
 d2e1a72fcca58-77f3e56d116mr5522665b3a.32.1758566977707; 
 Mon, 22 Sep 2025 11:49:37 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 09/76] target/arm: Expand CPUARMState.exception.syndrome to
 64 bits
Date: Mon, 22 Sep 2025 11:48:17 -0700
Message-ID: <20250922184924.2754205-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This will be used for storing the ISS2 portion of the
ESR_ELx registers in aarch64 state.  Re-order the fsr
member to eliminate two structure holes.

Drop the comment about "if we implement EL2" since we
have already done so.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |  7 ++-----
 target/arm/helper.c  |  2 +-
 target/arm/machine.c | 32 +++++++++++++++++++++++++++++++-
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d17252f734..4dd4c6d4bf 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -633,13 +633,10 @@ typedef struct CPUArchState {
      * entry process.
      */
     struct {
-        uint32_t syndrome; /* AArch64 format syndrome register */
-        uint32_t fsr; /* AArch32 format fault status register info */
+        uint64_t syndrome; /* AArch64 format syndrome register */
         uint64_t vaddress; /* virtual addr associated with exception, if any */
+        uint32_t fsr; /* AArch32 format fault status register info */
         uint32_t target_el; /* EL the exception should be targeted for */
-        /* If we implement EL2 we will also need to store information
-         * about the intermediate physical address for stage 2 faults.
-         */
     } exception;
 
     /* Information associated with an SError */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1111a16330..f66868f9ef 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9182,7 +9182,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
                   new_el);
     if (qemu_loglevel_mask(CPU_LOG_INT)
         && !excp_is_internal(cs->exception_index)) {
-        qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%x/0x%" PRIx32 "\n",
+        qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%x/0x%" PRIx64 "\n",
                       syn_get_ec(env->exception.syndrome),
                       env->exception.syndrome);
     }
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 6666a0c50c..ce20b46f50 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -848,6 +848,23 @@ static const VMStateInfo vmstate_powered_off = {
     .put = put_power,
 };
 
+static bool syndrome64_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+    return cpu->env.exception.syndrome > UINT32_MAX;
+}
+
+static const VMStateDescription vmstate_syndrome64 = {
+    .name = "cpu/syndrome64",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = syndrome64_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT64(env.exception.syndrome, ARMCPU),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
@@ -1065,7 +1082,19 @@ const VMStateDescription vmstate_arm_cpu = {
         VMSTATE_UINT64(env.exclusive_val, ARMCPU),
         VMSTATE_UINT64(env.exclusive_high, ARMCPU),
         VMSTATE_UNUSED(sizeof(uint64_t)),
-        VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
+        /*
+         * If any bits are set in the upper 32 bits of syndrome,
+         * then the cpu/syndrome64 subsection will override this
+         * with the full 64 bit state.
+         */
+        {
+            .name = "env.exception.syndrome",
+            .version_id = 0,
+            .size = sizeof(uint32_t),
+            .info = &vmstate_info_uint32,
+            .flags = VMS_SINGLE,
+            .offset = offsetoflow32(ARMCPU, env.exception.syndrome),
+        },
         VMSTATE_UINT32(env.exception.fsr, ARMCPU),
         VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
@@ -1098,6 +1127,7 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_serror,
         &vmstate_irq_line_state,
         &vmstate_wfxt_timer,
+        &vmstate_syndrome64,
         NULL
     }
 };
-- 
2.43.0


