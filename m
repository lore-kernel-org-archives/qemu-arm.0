Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A408DCD342F
	for <qemu-arm@archiver.kernel.org>; Tue,  5 May 2026 10:38:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKD9h-0001Y3-NR; Tue, 05 May 2026 06:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wKD9g-0001Ww-DV
 for qemu-arm@nongnu.org; Tue, 05 May 2026 06:37:32 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wKD9e-0008Fq-4V
 for qemu-arm@nongnu.org; Tue, 05 May 2026 06:37:32 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso44881025e9.2
 for <qemu-arm@nongnu.org>; Tue, 05 May 2026 03:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777977449; x=1778582249; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0+VNM6tTV/nZT8ORsfGVd8wLoMc82NM31B45S3duO08=;
 b=gDKh7KYjsE/l9+BGUqvvA0NTuMGZwXRNDPNREvvzZ793rfXIz3dNwprmYJJqa6iC26
 ASSnh4kJxUlA7gEpY7SpTCDIWc14UOjSUIryTsopgWqqlahdY7ndCq9h0p6AzxXPdOkp
 hSsfX7RorZEPjYp5W9DvP3cFIwHAzHiRNXewYjX0Ny9yg32zuhVa83i7dffg3hU7u110
 L1/+h67Rp6zk3FrI9fwUL/h9wTlfFQuu34MHNPHss15QXx49gTrWfVoaRn0MY0HoYbn8
 5dPeET8MB1MCWRXM2hEok8KZf3rTR5WZKZqLzpGj5waFmdqoueRV3ms8+u1tL8hvz5cm
 NdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777977449; x=1778582249;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0+VNM6tTV/nZT8ORsfGVd8wLoMc82NM31B45S3duO08=;
 b=eM0hhCQBsZcUTWy+da6bMYqKpevfbPZWUWhmHMmGgbo6l2ljQTxH0YmDw7Vv9BwkoK
 J82UnQo0+bcncAo402A2OC0qf1W0HTj9tYfuz8xp0uWhm8uNMlmd5GVcMIWdpNvwK0/Y
 JGNUQCzY2VsEfbKFBNtjcPqzKTpB+iaJC9JBQ3zi/Ru552aVPHEBZTtwLrRj6FvXwIpT
 f1bacAQpL871LMX7FgJ6Qq+d0M5KST/LrYsigOuFhD2B3ZUHJriHJhXT0gsAzSBv59T9
 zKhLeLBEEASFviDVWRrtBkcTo/Sr4aGzsK9yo49Ab+jRBi+g1NgOhN2nmaejWw5dnD2X
 KQRQ==
X-Gm-Message-State: AOJu0YwUBFjJjKhsJnZonkAlhQnGMOSpJMCTrlgTHU8TFTDn5eQbKCHh
 W2KJbnJ7IV8O4pt4IkXiWkAuOAgJJSLD9rVROXJFTO8PgIiiH7BdM26zEMbXuHX4cxp3ghFslTA
 NCD2g
X-Gm-Gg: AeBDieuCQrLKqrXQJyHp3GvXazL8Z8aPnl1AS5gFowX3pnh2Ki4qV4SWZ5vjH+Z+bhC
 KPS38lSmC5S7/y1Fh3zQbMzBi2WNUhlCED8EyHZkoTEK1GjLMZkgQkX5Wy+WeWq7wuikrcqZf44
 dxLzJDSUjAoI1E4XZo/UF4dySpCzyOJ0EbxDYxt2lq+zNGb2OgTnC7k74ZwRpo+dS4q6c+e0MBW
 ZC10qYEkgWXcdSZs2KWN3Mhnisb++B1x/aab8d5i7Q0/nYstCSkQFMp7/PdoNP2w07TB4zlLYK5
 O4ChI9C9XkRTtTXLBWO2EJ6PGupFsgacT8+WGWhU03JZ5bVlyCbHghz8NQf9iHOtZTVwXB6+T2u
 h3u1lM00+8Yc/yeLnu+aP8iOCg0aUQhXw/7q3C07wZlaIP4JS1rkmkZohITvGvdkEoDzkRw+WwS
 /LndJm1g5TjUcqHgb9IU9Xp1NNnlNVSxFaR1yAOt6J94FamJXsSv2xX8FxtfXHKwpZssdzb9Vet
 EZzsffwMSddqX5N8bzq2bAL7psvpA3QRJhQJISYlSHm0N0BECdF
X-Received: by 2002:a05:600c:83c3:b0:488:c078:bfda with SMTP id
 5b1f17b1804b1-48a986713e7mr228011395e9.26.1777977448721; 
 Tue, 05 May 2026 03:37:28 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48d14781f43sm33183005e9.0.2026.05.05.03.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 03:37:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Report IL=0 for Thumb 16-bit BKPT insn
Date: Tue,  5 May 2026 11:37:26 +0100
Message-ID: <20260505103726.419195-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
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

The Thumb BKPT insn is 16-bit, and the ESR_ELx syndrome register
definition requires that we set the IL bit to 0 for this, and 1 for
the 32-bit A32 and A64 BKPT/BRK.

We used to do this correctly, but accidentally lost it in the
conversion to decodetree, because we converted the A32 BKPT first,
and then when we converted the T16 BKPT we forgot that trans_BKPT()
was unconditionally setting IL=1.

Pass the right value for syn_aa32_bkpt()'s is_16bit argument.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3474
Fixes: 43f7e42c7d515f ("target/arm: Convert T16, Miscellaneous 16-bit instructions")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index ce427c5a3c..7f76a57653 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -3580,7 +3580,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
         (a->imm == 0xab)) {
         gen_exception_internal_insn(s, EXCP_SEMIHOST);
     } else {
-        gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, false));
+        gen_exception_bkpt_insn(s, syn_aa32_bkpt(a->imm, s->thumb));
     }
     return true;
 }
-- 
2.43.0


