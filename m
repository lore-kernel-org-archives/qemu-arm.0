Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80313CCFA05
	for <qemu-arm@archiver.kernel.org>; Fri,  7 Nov 2025 15:41:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vHOaY-00044I-QP; Fri, 07 Nov 2025 10:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vHOaY-00043P-5B
 for qemu-arm@nongnu.org; Fri, 07 Nov 2025 10:41:22 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vHOaW-0006Z6-Bn
 for qemu-arm@nongnu.org; Fri, 07 Nov 2025 10:41:21 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso7291065e9.0
 for <qemu-arm@nongnu.org>; Fri, 07 Nov 2025 07:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762530078; x=1763134878; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=nuGfmGIOi/f93VH0xYyt82y1wWGEqtuylmuk5z+5d64=;
 b=IrItroRrJMM7W2q2porC04zJ1Ee6kz/aHhjS5JQyxEQF5KrWBl0693Md9ypaNMdUw5
 HCvxqtQmRfkhdtSavC6Fd9863YKyNdJktsKaFUIBIYDuN66qjcmV43BjC62zebz90LNb
 2MHoA/DhGwVdnFV9ycJm71pXhgHOzl6EmO0v2jIRo8k2jdEPEdOHEhVdPuNlZWBNL/av
 s0IALFucNydMoT+svaPsnyJQdhlCqERSqU4YobrKqG946lcSwcsXYd2ok6OkqJWoN6Fj
 owcPis8JS1VngxIlaXyzIxrHChL3MdS4ijxMylsZFvBK8R4DUswuqpSHNFGrvZW+qf3L
 7GkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762530079; x=1763134879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nuGfmGIOi/f93VH0xYyt82y1wWGEqtuylmuk5z+5d64=;
 b=qZiOMARXX/YeFtaauJMAszP5BKm2bOGyu+AMKRHwMx1xhqYbudnImOLmwjiwUFnEes
 zP8ZyEpkVHEeBXeFAG2VC+dZMd6qZrstihcID0I54C31GF0KoEC8tQ/bgqP5EYw5NXxz
 6l8mjj3WIt7ZKNk5o4LInOiw/PJTI519RR7H0VTXoRSvPt90qnO1zvmEBguZh3fCd3OA
 Yc1rvYLrKhknQRPOY+uuRtTb4Q68CLK81c5CVbY3si8en/O1XCG/ASGTNEmDpOLRDFPO
 WX9DdvZlD+0Omd8bTQhKzYhHjDtT46qHmnQZTtTehAzih5pm+/iQAR6F/9YR0AYtPiL/
 1nNw==
X-Gm-Message-State: AOJu0YyQUUi9QJzRerfa+RcGz5KkiUe8J1wO0IJ4prTWhqk3zSXb7Akx
 WKrHjM6JtPejfp82MaIdVXRMVHoNczxbr21tmcoRomstriJ0H4/X4vR6Y30oQdZ1sSXNpK2zvoT
 1CJaW
X-Gm-Gg: ASbGnctJjzJoENLmLjRUz4/jCmtaRSKVnQZ8LVwpZRwD2Dnzk/kt/3IhUbWjSLmbub+
 EwCO+zwPcUzmAgHXrhvXJ+sGZJDnHb5nUGRKe3nJtw556INem/qQai4QbEsuiIX56Ge7tc5/nC5
 M8udQzSGg3pJq7rPr7UZ/FyMcg/noOsIugV9mAtLDK+2PX+u+iG/ICINvZ+3N9Lk/kDHLTY9phM
 cIaUvPe1HPsyXohUgWmtQgJ6NysNv44f9S6OAsWvudBMKJd0qgMUK5Qcj485oAwvVrdz5CPkSu6
 UiMZuGh6uRM1GVv8jI1W2k3MFCdOzlmzg1p+YFr2cGqh/RGmixQ/xGQM3hUIaWc1UVYmmMX5AN5
 jaYW/w/Tt3QMkUIjIwlCzAvKUlb0xhWTMdNZoy4/XL7vFzVv3Pod8TSdi7hUMxEXK3iEDaasEMd
 DHseGfNA==
X-Google-Smtp-Source: AGHT+IGTO6MM+4/pcJXcmdcWMDyIfir1doeK09Gqd5ZqunId5b2R7YiLxJKTNeC50LXvXnrNXcAcHg==
X-Received: by 2002:a05:600c:4fcb:b0:477:59e8:507d with SMTP id
 5b1f17b1804b1-4776bcc537amr30259395e9.31.1762530078536; 
 Fri, 07 Nov 2025 07:41:18 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac67845ccsm5779183f8f.36.2025.11.07.07.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 07:41:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/audio/lm4549: Don't try to open a zero-frequency audio
 voice
Date: Fri,  7 Nov 2025 15:41:16 +0000
Message-ID: <20251107154116.1396769-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

If the guest incorrectly programs the lm4549 audio chip with a zero
frequency, we will pass this to AUD_open_out(), which will complain:

   A bug was just triggered in AUD_open_out
   Save all your work and restart without audio
   I am sorry
   Context:
   audio: frequency=0 nchannels=2 fmt=S16 endianness=little

The datasheet doesn't say what we should do here, only that the valid
range for the freqency is 8000 to 48000 Hz; we choose to log the
guest error and ignore an attempt to change the DAC rate to something
outside the valid range.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/410
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This bug has been around for so long and is a weird edge case whose
only effect is to print a debug message, so it doesn't really seem
worth cc'ing stable on.
---
 hw/audio/lm4549.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/audio/lm4549.c b/hw/audio/lm4549.c
index 745441bd790..bf711c49c04 100644
--- a/hw/audio/lm4549.c
+++ b/hw/audio/lm4549.c
@@ -15,6 +15,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/hw.h"
+#include "qemu/log.h"
 #include "qemu/audio.h"
 #include "lm4549.h"
 #include "migration/vmstate.h"
@@ -179,9 +180,23 @@ void lm4549_write(lm4549_state *s,
         break;
 
     case LM4549_PCM_Front_DAC_Rate:
-        regfile[LM4549_PCM_Front_DAC_Rate] = value;
         DPRINTF("DAC rate change = %i\n", value);
 
+        /*
+         * Valid sample rates are 4kHz to 48kHz.
+         * The datasheet doesn't say what happens if you try to
+         * set the frequency to zero. AUD_open_out() will print
+         * a bug message if we pass it a zero frequency, so just
+         * ignore attempts to set the DAC frequency to zero.
+         */
+        if (value < 4000 || value > 48000) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: DAC sample rate %d Hz is invalid, ignoring it\n",
+                          __func__, value);
+            break;
+        }
+        regfile[LM4549_PCM_Front_DAC_Rate] = value;
+
         /* Re-open a voice with the new sample rate */
         struct audsettings as;
         as.freq = value;
-- 
2.43.0


