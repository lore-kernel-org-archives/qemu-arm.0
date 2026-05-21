Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AD7CD4F5E
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 12:30:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ2X2-00010U-UK; Thu, 21 May 2026 08:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ2Wi-0000y9-5i
 for qemu-arm@nongnu.org; Thu, 21 May 2026 08:29:29 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ2Wg-0001dJ-F9
 for qemu-arm@nongnu.org; Thu, 21 May 2026 08:29:23 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-490229aa522so26725065e9.3
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779366561; x=1779971361; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pryi5TKCDpB8CFidgAdyXB10hiTus4CQlxwL4fbFbdo=;
 b=wNBbZy6UK44dmLcQnDZxIHTNJ4Q+eyhVdOLwGiatWNjmijH5MnylNFcJc8g1oa9eR2
 4+30eg+od6xtCcfY1kMRk0+4AMguvLNM2dV5gg+K9+vTRajCxHa43qoSSa2u7HSaWog/
 Jia1YoXOF7xT8+kCo2dQREI4Cyktg46nscfY519MDuUdXdXErHMGd1f/ZdTVxHzeja9+
 iqbnxgzk3bKCkWZDzAwL1RjI9GZE5FvkEVYzKAsGMT/xL9ZYBbwZpRfRgnSFT7XsTPaV
 ZhJQj7u9HIkSt0CYHZXw+7iN86JpxzLKjEYOafCn4umT2IL5QOAScd4RnzCGmreB4Ihj
 2oXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779366561; x=1779971361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Pryi5TKCDpB8CFidgAdyXB10hiTus4CQlxwL4fbFbdo=;
 b=lLazIAVbmVp58ERPiR0BTeprXvrzkOcdzapg2vmjrf7BpDqXstdV3zV0pXptqnB8Pi
 BW8T0O18DEdcQpj9pY3ZBWi96a02XquO0eJTZZRIa7EzFl4ccsLN+eKhgnhHzmTefJ9M
 kZ9ndnDnPEAHqwcBMpbr0/2wRMGFBMMViPV0d1zNE4UZ3Co0dgcwAUQvwMBMKg4vwUsW
 F3KuXdnVMQjt6HGSBx43E4JyxJOoPa72vdMumLCDT9Trd7kZPUKmTk7j8JkjxDWoM/Vs
 Ij+Qp5L1lSuRmY953YHxn8M8G7Q0eiOtoeU+BeY1BG8YlNahxuThoUEAhmrbInlEWsR/
 sfdw==
X-Gm-Message-State: AOJu0Yy8izZnPrurskdJAj6nC/aaat5mncH7GCmbddF+yQ0y0leDcnfX
 /PY7UZh/zdPLEfoDFuy2zUAKXaifVD3rBF4TNopyBMH18IFSuBAx3cFONXILzG2OG3l6xzXMFre
 lKqoF
X-Gm-Gg: Acq92OGIPoiTZwqbVWAbQMHhHYkcCdoBNlXXc/TtN+N/RWjqOoERxfOPfAsnENTsWIH
 eXuwvByV/6hKtfxM3jH78B3TMQ6uEb+5d5w3H86QskUMvRgUsNg5zleMDFWEbagdtm6q9R+O5Np
 4oy9KD6K8XMhqpS04fOYCftv0sX7+SVgMeg6q9jvF14ib7BUv8I/RwVzxzckQf3p87FCQKL7kIy
 vCFlRCbvn/oq1OExFg9RSCo9heSJAFBgufAhpn5iNrMNvD50ZGY6FVpgm+yjDv9IWrhPOozcAx/
 /D/m8EmqYyFFt/fFhtnYpWP9yEZ2sDBQ4o+dVRXBPLeh15xX2jcI9uz0gCObo4QUcYIimhGg1es
 8bx3utH5FNqOF3+atgBSawVhBJSuUdaymG6xrztW6imqln20VoiViDZuqgYOTPW0gRlYWvsLcgZ
 6ao7MjIRSAh4kHEAddPSLloy504BURYm+D8H/9MB5iugZE36F9n+l1U5GSZ3VqQTN2he+kN2LaW
 5cZ91843lnTpHqdrWqNuejPVXFIjPIzEhN5nsqKng==
X-Received: by 2002:a05:600c:1f89:b0:48a:8905:a500 with SMTP id
 5b1f17b1804b1-49036080e18mr36554365e9.12.1779366560954; 
 Thu, 21 May 2026 05:29:20 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49035c72c78sm22054245e9.3.2026.05.21.05.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 05:29:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 3/3] target/arm: Set correct fp flags for FLOGB when FPCR.AH =
 1
Date: Thu, 21 May 2026 13:29:13 +0100
Message-ID: <20260521122913.1565011-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521122913.1565011-1-peter.maydell@linaro.org>
References: <20260521122913.1565011-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

Our implementation of the FLOGB insn does the operations entirely
in the helper function, without needing to use fpu functions.
This means it needs to handle all the fp status flags itself.
We aren't setting float_flag_input_denormal_used when we
use (i.e. do not flush to zero) an input denormal, which means
that FPCR.IDC isn't set when it should be for FPCR.AH=1.
We missed this when we added float_flag_input_denormal_used
and made the fpu/ code set it.

Add the missing float_raise().

Cc: qemu-stable@nongnu.org
Fixes: d38a57a3f ("target/arm: Enable FEAT_AFP for '-cpu max'")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/sve_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 179cbd74fb..d884ba474f 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -5036,6 +5036,7 @@ static int16_t do_float16_logb_as_int(float16 a, float_status *s)
         if (frac != 0) {
             if (!get_flush_inputs_to_zero(s)) {
                 /* denormal: bias - fractional_zeros */
+                float_raise(float_flag_input_denormal_used, s);
                 return -15 - clz32(frac);
             }
             /* flush to zero */
@@ -5064,6 +5065,7 @@ static int32_t do_float32_logb_as_int(float32 a, float_status *s)
         if (frac != 0) {
             if (!get_flush_inputs_to_zero(s)) {
                 /* denormal: bias - fractional_zeros */
+                float_raise(float_flag_input_denormal_used, s);
                 return -127 - clz32(frac);
             }
             /* flush to zero */
@@ -5092,6 +5094,7 @@ static int64_t do_float64_logb_as_int(float64 a, float_status *s)
         if (frac != 0) {
             if (!get_flush_inputs_to_zero(s)) {
                 /* denormal: bias - fractional_zeros */
+                float_raise(float_flag_input_denormal_used, s);
                 return -1023 - clz64(frac);
             }
             /* flush to zero */
-- 
2.43.0


