Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FD1D6100B
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 11:35:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlQJ8-0002Q3-37; Thu, 29 Jan 2026 06:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlQIn-0002Cc-Oi
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:35:12 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlQIh-0007lP-TS
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 06:35:08 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48068ed1eccso8143825e9.2
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 03:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769686501; x=1770291301; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=onHeNG6L+Cp0GwsmRC8UYqSZ2ksrcTcnPWdFnALo+iQ=;
 b=yw/Ygh6McKOFyBUy10ahKuKTVXde3utXD+DxJTepEmS8wzSe1TpHnLoNlZAXxCI5+D
 OG/Rr16EKKarBYjphRfz/mmf3CByvpOWxyi/U0DNic7xb14pRsF4PNIYsWGtRYftngBb
 A77r7V3VhdYZwQcXpBLeOWz51SHCpTr9uubaD/TFGBKKKWZMpb/kuGMyFA7h0k/A4+d8
 fAugIasuVYSm642XOkk6mfuJVD6oX46kCF9YiePedulC7fTDHhs0JR/NjKuTuLUdsBBm
 EMdUGRtX6RgYPcquvfqBLhGkI6TLgumkLdq/fUs5xlk6MLa3m9M3cQKoj/77HYw5K90c
 KRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769686501; x=1770291301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=onHeNG6L+Cp0GwsmRC8UYqSZ2ksrcTcnPWdFnALo+iQ=;
 b=j7bEFfuSjWRlrcW3T5Kt+HlU1aEDtsKTMXGC8xNBy5NVdI7AQ98YIhASL2pgyar0qU
 cie8WGHpujHgtXG2yLmntRzgPsuBQql17BfsJeMQQADfsMDm08L0w+dlgnkNj0ANJpLj
 qhvft+0EQmtTAyfCvtB8NcbH8x41o5RBWP2qbUiOa48LyUXjnF8Cewtk/EmiBEZpt8MT
 S2+vo6fFbgrEwHMknwWGE1VEPCRYooVlKFWb7iulr9I4VYglpMDKhHpdLtbRKOS1zbdP
 f10vqkd9dCqFYDn7LrHAi0EJ7rS0KInBZWN69OdTOxdlMEgbPIYo6nKwQvaHdGqErLje
 4vvQ==
X-Gm-Message-State: AOJu0YxzIZXbDccjr0xl5lun40kAz/7Lg/iVUS7hf6Q8yozl7Eq8ykwa
 un5iexJWHNkdhHJNMsZmEcPdI1Zyfw0kbZIClq4dWLrIv7g+rIxKuovKRDHWWGBK2Xn1GvOsX0w
 ogNar+xE=
X-Gm-Gg: AZuq6aJDsdIVl9zaarR7dQNpb3/UKCi0U7f2P6QcUrZ3zYZ5pCfXAFrpEH/NEIggsEk
 OxIt3VFCR1X6fHvJSeyTfP0zSLOUSvfzZslWBohgw929p+gGxwJ4K0pSz2MQX/4OeBGkpO76u8F
 wH2YiNrFrKT/cNZPk2V5RuV90r+MBhJoOeEbQj+aF9wagMP0ufWeN2QTO0owpwcTHW6RAj8yLVL
 FyVIC9Ncwv10oZ5L91QzCk5s2fpGBW7h279jHKRwX+e9LswZZiJSzCLt8H6c5nR5lkejvhvkQQW
 Sq5OzDeanL3yMxXW0dTSpEyJgBtNXFtXO+iUaHlkKBCpedP/xyaqjygVeuBkhCGnu6zIeZOLJow
 QVlZ6/IxrEQyXnuKDAHGh8BfmLYKtzraDVzfk9VMFgAGNNPqaMoBCz8BwZ5N6SSKGDDRYR0Vaqk
 nDxRi5OtmPLpDZSQ7Fn3BsH+ygvt2IP7qOklbDydjV
X-Received: by 2002:a05:600c:458a:b0:46f:c55a:5a8d with SMTP id
 5b1f17b1804b1-48069c0fdafmr95011665e9.4.1769686501580; 
 Thu, 29 Jan 2026 03:35:01 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c42895sm196311075e9.14.2026.01.29.03.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 03:35:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v2 3/6] target/arm: Handle SME-only CPUs in
 sve_vqm1_for_el_sm()
Date: Thu, 29 Jan 2026 11:34:52 +0000
Message-ID: <20260129113455.1283266-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129113455.1283266-1-peter.maydell@linaro.org>
References: <20260129113455.1283266-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

In sve_vqm1_for_el_sm(), we implicitly assume that the CPU has SVE:
if called with sm == false for non-streaming mode, we try to return a
vector length from svq_vq.  This hits the "assert(sm)" at the bettom
of the function in an SME-only CPU where sve_vq.map is zero.

Add code to handle the "SME-only CPU not in streaming mode" case: we
report an effective VL of 128 bits, which is what the architecture
rule R_KXKNK says should be used when SVE instructions are disabled
or trapped but floating point instructions are enabled.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7ceab0b503..732c3a9eba 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4763,7 +4763,7 @@ int sme_exception_el(CPUARMState *env, int el)
 }
 
 /*
- * Given that SVE is enabled, return the vector length for EL.
+ * Given that SVE or SME is enabled, return the vector length for EL.
  */
 uint32_t sve_vqm1_for_el_sm(CPUARMState *env, int el, bool sm)
 {
@@ -4775,6 +4775,12 @@ uint32_t sve_vqm1_for_el_sm(CPUARMState *env, int el, bool sm)
     if (sm) {
         cr = env->vfp.smcr_el;
         map = cpu->sme_vq.map;
+    } else if (map == 0) {
+        /*
+         * SME-only CPU not in streaming mode: effective VL
+         * is 128 bits, per R_KXKNK.
+         */
+        return 0;
     }
 
     if (el <= 1 && !el_is_in_host(env, el)) {
-- 
2.43.0


