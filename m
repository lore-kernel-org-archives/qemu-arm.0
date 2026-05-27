Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B80CD4F54
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 11:44:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSCfZ-0005LM-W4; Wed, 27 May 2026 07:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSCfY-0005KI-SY
 for qemu-arm@nongnu.org; Wed, 27 May 2026 07:43:28 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSCfW-0008Vf-8H
 for qemu-arm@nongnu.org; Wed, 27 May 2026 07:43:28 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4891b0786beso77781775e9.1
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 04:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779882204; x=1780487004; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJonqsC661AicUoZ3WXf5dOPD/EyukyFdYhNbfWENfY=;
 b=Bdwi5i8YkT07kA5l7QiSdckCarbeG9BMmi0JFpaGiRxrOabKEVA9+A60WTQeCVL0F/
 dI4r/txCPitjy/vFM7Pd8SiibC7Nerc3V7ZCxVYsH4dU7CHLtxaNCuPD2YBIGMjaBB+E
 lIEGyzI5LXI/Be78moHR5HzlgqHNUDtP0ZiTUXL08dL1Rpjna8byUa2aCkZofq/7+1Mw
 HgOJbAHO6I1CL8WT4+eNL3AIc77fGvx+CkSB1B3xpr6fBbNPOw5FImZCenZZAioPIBub
 ryI1J45bHv3nb0uZkv/n1hPhFHCfcb3Ve8C8AbOORZGFFzI54jAPQgFWdiKMLmhwlOWX
 ikCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779882204; x=1780487004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AJonqsC661AicUoZ3WXf5dOPD/EyukyFdYhNbfWENfY=;
 b=aG0zPyFl+jbijk3vKzlfu6diuwhKvAZJz/x90rFyjBk7UZbxp1zpWqxfJeuK05ossN
 vBHTaOjR1hz1xafgFWbPPRlzsf1UmjEJ4E3827pd8RtrQd2DL+3PCCnjJxsais8tbiLZ
 ubKb4k71XGvVlCleZFcAHkd4zHhWRTEMqdGmz+bVDKFnWg7uRp+XMPedcvMjHyJVji6e
 KEMbO0P76Okz+cr5RMqnj5G/ZeEOUDAvP9EbfK+GUltwoNIF5i+Oy1M52+sFzhUwxQMv
 qR5zUrjAis4GZWaFN6db/o5q2xUutA6Z35lIVSSIZI7u1aoOhgAksyxwKhm6V3IvYq5E
 SPiw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/riLgRyW8kLDoTPxwY5skJvi9buAGx5yBt4jvRBitDkc1xZ1FWV7X1zqf3h/pAlT3aY2lS/9/DYQ==@nongnu.org
X-Gm-Message-State: AOJu0YyPc8XIsTjPJQzvpuKjCWfh/r8tRtpz8dHrb14MVtCO6I4COZzM
 tn9lsh7bBsqyw81FZHOZlPxotsgvCRZ7KrhJDBrNw5visVvzku7fKri0i23wJKx6w70=
X-Gm-Gg: Acq92OEhVtVPtmDA6Suinnq4ohqL0gVN12TH9P0coc/EbUGYpyCrArQll7vECcKdJbU
 5OcwtBB41lZrZ1mac6uctrSIJzvFRMKQN8JQ/TS5a95wwDWaFW7olpJvq23pNsWLY+DmY6lYU26
 WDd+RVMR965VECvNJRY77wb1T9Fc1YIhBTLdrgskfHDmtbg3Wyn2UDhUktRLSWaxhny6hUvGsMI
 ngDxNrwhpXzXjYBcjfPHvzyo3ngI9ndsLnTuKfyFo+M8YhLMPR7aOsZB0au1g6rs1YUbEVljhmG
 ZdRfRNrHwzOHSwguML+lo8Ys7lIfCDPbL3o/ljA+Q1b2QyfRt5cL80dxJ5xUdLwciRQuV14Y31/
 ockEO25uEFQ1amEa6/xuZacTpso87qMYNoslv3vTsQvOfCexpkKSWnyssJ+0aCJrslVXVIkleeC
 HCS4UH3vAd1b+tm3V7ieWDtrM=
X-Received: by 2002:a05:600c:45ce:b0:490:59cc:998e with SMTP id
 5b1f17b1804b1-49059cc99famr238489835e9.3.1779882204321; 
 Wed, 27 May 2026 04:43:24 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb557679sm9410757f8f.10.2026.05.27.04.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 04:43:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 396A95FBBF;
 Wed, 27 May 2026 12:43:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v6 4/8] target/arm: ensure aarch64 DISAS_WFE will exit
Date: Wed, 27 May 2026 12:43:16 +0100
Message-ID: <20260527114320.1581552-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260527114320.1581552-1-alex.bennee@linaro.org>
References: <20260527114320.1581552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

This mirrors the logic for DISAS_WFE in 32 bit world. As the WFE/WFI
have similar behaviours shuffle the case statements around a little
and update the commentary to cover both.

Fixes: 252ec405768 (target-arm: implement WFE/YIELD as a yield for AArch64)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v4
  - shuffle case statements, unify the comments.
---
 target/arm/tcg/translate-a64.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 3e3971db3fb..d057241e9df 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10913,25 +10913,25 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_NORETURN:
         case DISAS_SWI:
             break;
-        case DISAS_WFE:
-            gen_a64_update_pc(dc, 4);
-            gen_helper_wfe(tcg_env);
-            break;
         case DISAS_YIELD:
             gen_a64_update_pc(dc, 4);
             gen_helper_yield(tcg_env);
             break;
+        /*
+         * Both WFE/WFI can cause exceptions or exit the loop to
+         * halt so we have to make sure we have rectified the PC.
+         * However they can also return directly if they don't
+         * enter a wait state so we must add an exit block so we exit
+         * the loop and check for interrupts.
+         */
+        case DISAS_WFE:
+            gen_a64_update_pc(dc, 4);
+            gen_helper_wfe(tcg_env);
+            tcg_gen_exit_tb(NULL, 0);
+            break;
         case DISAS_WFI:
-            /*
-             * This is a special case because we don't want to just halt
-             * the CPU if trying to debug across a WFI.
-             */
             gen_a64_update_pc(dc, 4);
             gen_helper_wfi(tcg_env, tcg_constant_i32(4));
-            /*
-             * The helper doesn't necessarily throw an exception, but we
-             * must go back to the main loop to check for interrupts anyway.
-             */
             tcg_gen_exit_tb(NULL, 0);
             break;
         }
-- 
2.47.3


