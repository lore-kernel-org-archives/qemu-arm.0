Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D06CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:06:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXYe-0002Wo-M9; Thu, 14 Aug 2025 08:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXYB-0001up-Pr
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:26 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXY4-0004Ky-QF
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-32326e5a623so839939a91.3
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176352; x=1755781152; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NR3W5du9ZFi4qPy6YJwkknWURFd+s6CJ6eRMr5OXqWE=;
 b=nncKknFeoKGtKUk/uqhRJ4h0wnXToyjQs3NkF4qJRGD5vX2FITHUC5rnK1O0NTR/Il
 q+0dNnWQC39bZj3xin+SK4MpnEPZkLGVz+AU+/6xf483SEwCX8QYnvuEwxfS3jrOHwMf
 Odf0IeMJ/MvLTaIYC6QLZzSZxhb2nIxOMF9GhuPqY3yAVqWW7vDYCcYRbIytXNOXo4IX
 GmpZsHFjPANh+lDMSTHoygXQnRFgx8ha3xHekZBoouI5AcAO9EfksVldYciXefuzu7mQ
 boxBStOJ3p274WrEayliHeCWF8cyT07dLvX2vr8gCbPvIDscwqRDj2Qxgy0ouXrr337Z
 HdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176352; x=1755781152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NR3W5du9ZFi4qPy6YJwkknWURFd+s6CJ6eRMr5OXqWE=;
 b=eeKz4G9x9r4r3jslW3FurbA0kIJHknuTRg+pH6LUaWHtngkojv/0ZcM8UR6w4Dfy6H
 7r6D0eRQx2hQQ1c0Y2WGqGW7bKE34yDD346Ts+ArGRsAGD29X8fPA5SnOjvL7tLrmI3a
 p/bAcpXcxkqvpX+lebxeiOlQG+hFmWrsDzqyCiV3k2u2e+7ou1MACN64EUXjNUS4EHJm
 ey4S3tiqpa5sXhVTK1mZjriW9MfUyKVAiOF4+BYJaXCBCyCphKDTb+16ygyydPjgcMEP
 8TORtvDWY4CPeXN9HphyRVoU8KgEmBETU1ckDDnYUrDW7cuoBdzHdYgK86S/whUhG2Ah
 khxA==
X-Gm-Message-State: AOJu0Yyh2tUwOGlDCRsGmddg5XNilSNYlE2YBt3x9773kq1+ToWUGwnK
 5qkw7vLK+U3kXrm7kF8fF6LHbtnlXXm4e3nZrmZbQxvAHhC+cZd1eCE/vQQwFYyRa30=
X-Gm-Gg: ASbGncvxyWPPHEtig/WVvxrrSzECeCJ7VHUP0QktUl4gsLJlmqQ4+FeLKKJSWXG4YIS
 v3mukqSojN/CZ1AJf8yucFFX/4nJ3bXcwpXtSMUKucOinX00WVNI8I0es/+ruVzEyDbfcQEm4B4
 2iyXt60pyqqmJiIFU0d3n03Wwt3i4q+0wggWCW7/4w2KKoPrX/y5zx/2kc40bOEYLmyADRfGpON
 MKB6sbI7bUViCd9bm/FMVnW5xGVIfayiHtL037aBROG+W+tJ/Y4bzRH0olEvabjHBIGVZMFS2/a
 b3zZhdgOWzzIzp4pGn3QbTkayyRMooH05S3J5aYVbs8y75NeKqA/gNzk3iFkQAG7zTszuTZwPNq
 kStwFLuDkjSOBU915GJYwf7RG51eTrSykFS12pFqvOg1tC9c=
X-Google-Smtp-Source: AGHT+IE16wTyEHV4JHno6gXkn6uhGWf7om6i/p+FiFSpzgamHVtEGX9G807pNxxqiOacP8NPU84E9Q==
X-Received: by 2002:a17:90b:3f85:b0:31e:9cdb:32df with SMTP id
 98e67ed59e1d1-32327ab3dfdmr5237021a91.10.1755176352072; 
 Thu, 14 Aug 2025 05:59:12 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:59:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 22/85] target/arm: Expand CPUARMState.exception.syndrome to
 64 bits
Date: Thu, 14 Aug 2025 22:56:49 +1000
Message-ID: <20250814125752.164107-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index fb87fcc3e6..4940bd6a45 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -644,13 +644,10 @@ typedef struct CPUArchState {
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
index 168557b08f..9447d7ba59 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9438,7 +9438,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
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


