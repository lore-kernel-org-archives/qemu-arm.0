Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32AFCA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 18:16:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNvv-0007js-Dq; Sat, 30 Aug 2025 11:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMJ-00063E-HB
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:40 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMH-0004Cv-Vw
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:42:39 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-771facea122so1364326b3a.1
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532557; x=1757137357; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9qdzdzmqkJ1XgfZtAa367u2Lrhe3gNI4FuUAtbTsqDg=;
 b=mr2VXj+PKSvypeunLdLvJuRQ3r/3dVPLSiZ/6IGqcEIG236kQswG4rygSlADP313Tf
 jRZOYp2Wnm4Tiei1z8ute7IdClaQKQegqT1LxSgGDoJTctqgyQTrERos/Hl6XvfOwoFr
 8g9uZt0Kx5BCk/zAiSa0YCrcYtxU11Igxi/GB575QkasOfOs1iwdKFGpYBAGvlL1qQ//
 goUR0EuqRRg36e9NwI74z4EaWQvTcANrHWIrSbDl75tnRqvDu0g9Ylt0rO5G9f/t7H0+
 aFl93s1a3qAQ4wrAuKXDXwbZUHOAqBDvbEnEiPMBGZ7LqUUeZeIkMXeV75eu2qxxdNUy
 8emQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532557; x=1757137357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9qdzdzmqkJ1XgfZtAa367u2Lrhe3gNI4FuUAtbTsqDg=;
 b=aRu63HWRryvc4aUvtyTwG2574cA/Mu29AAFcu4fgesv9KX9RObxwcjcgaUUk5ZlBH+
 RMygtVj1anLgRrsH86NVlvpquQgAG16MNEBxM7V66nPv2L5L/0rcIX+zuhNjdXIJO0uy
 yq0WBDRfJ0fsb8g7D5eQNocmQeUYtYvHLgZynSYZNdezDaxMsLaT4N/OXWPsm8F6IzVf
 dMsXpDc3ROD8jSTjOYxfaljG5ap8fLwnxU4AD6rCO93av0e5Ane8dmnr6L5h510SqUey
 p15Navv94PFW+S6QU+O5AV3PL8aDhSlfR4JLCWExCtunuHob9idWsp3VGi4EdsjBgX3L
 gdGQ==
X-Gm-Message-State: AOJu0YwePp/exxmIHgKd+IEL0f9H86H4rMsYQv77IWWt3uS1aa/coUBV
 t/BOTkDYZwgg+DpoDKrLHDKjFlxNgsm0G525hUKrIAWDfxBGPQMqz0QpLrSFRiMB300=
X-Gm-Gg: ASbGncvC20JmuAnZaxDUN10cjw4t12/TvZtvlVi9RQTdNa2dGWOInZEVCOH5C8KRHCE
 KNIwPryKxLoVT2E3jRkMKck6ej2/eChVTr3i6Tl/INddiLBO4j1CzAtlK9SZp7M60g4dsBaUFdD
 GNkSpUh4wcRuawiruDDpOW5TFCZjZsNtSVQyLpc/So0wmVtccseV7d8EQ5DRAxi7JFSdKhacZCb
 iDsw5+tkp3s9Wmyrfj0xL29YhAPVjgA+ljqIZ1XXUbjfZkSL5Ay/2sJhlkd3zg2kiYanv/VBGgS
 i2x2z7ZIU6NBcckCq29cIiyBw+jd82Lr/2MPlDecnljDDaFlvgS8yj/OMLubhJVmpV26bTjw080
 pYD2ADfuj1v2gUGtl8uyKe97idHDYgQfnbYLCpBYv+nqwpGcaqbVyyODuIRZUJX+llTXzX/ZcE0
 bMDOkheA==
X-Google-Smtp-Source: AGHT+IH++p8QS+Cu88lU8VED/a6OpKEdFJx6DzNNKJ0jlW8z6UK5mDVhjCxwHaUp82twp17j/H7gfg==
X-Received: by 2002:a05:6a20:3d07:b0:243:b190:d139 with SMTP id
 adf61e73a8af0-243d6f1003cmr1642746637.39.1756532556633; 
 Fri, 29 Aug 2025 22:42:36 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:42:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 22/84] target/arm: Expand CPUARMState.exception.syndrome to
 64 bits
Date: Sat, 30 Aug 2025 15:40:26 +1000
Message-ID: <20250830054128.448363-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
 target/arm/cpu.h    | 7 ++-----
 target/arm/helper.c | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9eeecd45a3..fff2195138 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -635,13 +635,10 @@ typedef struct CPUArchState {
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
index ab801e2704..fc95010727 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9332,7 +9332,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
                   new_el);
     if (qemu_loglevel_mask(CPU_LOG_INT)
         && !excp_is_internal(cs->exception_index)) {
-        qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%x/0x%" PRIx32 "\n",
+        qemu_log_mask(CPU_LOG_INT, "...with ESR 0x%x/0x%" PRIx64 "\n",
                       syn_get_ec(env->exception.syndrome),
                       env->exception.syndrome);
     }
-- 
2.43.0


