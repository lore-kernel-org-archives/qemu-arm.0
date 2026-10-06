Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495CBCA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:11:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEMiI-0000i3-0n; Wed, 07 Oct 2026 04:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xEGV3-0004CD-3s
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:31:40 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xEGUn-0007XM-DH
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:31:09 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6a601ba6870so5923454a12.0
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 18:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791336516; x=1791941316; darn=nongnu.org;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=jdzfazKBDl41kEYsQiuUPHfelqpsDS1ycyL8waKcjvw=;
 b=hM1npXOAXThqAHyVubkugytet3h4rHbDKHUuzFOwyw2NXhd+94EaYiZvas5ar9lc+f
 WVMJk/HK3b1EmmtrOBgrJjZ5AzyC26XYUuSOjjfxby9LEs5d5Xc4JspVDtxyFVGoo2nI
 dj4dFWmBMgOIXZPoXcbZG8U7tvste7Rl4AU43yWPIAIJs6JmN3Rl9urU6uhhHSRegoWO
 UMFTrMpoQNX9Y9V9+qjOb6wAa4lQIFmxk55rB2of/6QfFEmoz9GtGqMDAd9dWxhxCYkw
 JSQgQUOt3s7sDZX/14RrjnAFZOwKGFLwPWUZGQkz77xpcGWbPeBkOqkzJ/qSl5fNTXb2
 BOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791336516; x=1791941316;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=jdzfazKBDl41kEYsQiuUPHfelqpsDS1ycyL8waKcjvw=;
 b=qKqjeR81erpyZJWgrlXqtoKn/T2Wj7HMdxuLfEV+1EqbwLxJLIrUQWuk2IDU6dtkmM
 OkEue6Jlp2tOsxszRMsLrQEQZDlM+dQQY5mll69MVPG5qkkQJGE7//YyGjEc7DlTjg8b
 ibFSYNAHKi10yC4biKNacpyjfXLmryk8yfAdLsQhz42RHXC+DtbI0mkF/nErSJPAAZZb
 iGaZx3NeRo/qyF7dIEkxDuDtgFpguGKARah2iAdwVqaGjgnjLN1ueSTVAnPotjAfvxA6
 ccRB9+snZk8zVd9NyGIo8y3KQkMrG3izjNXPoMlujENCvqFCtjEvWXbA4Z4hKnWzisVF
 eJYQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByXahM1YG2LvHI5tvkDoXyQrvtBoYvwXgnoNVBV2Gn2ZWl3aRby3R+d+jbMiJA8UjLyRXDzo76VXA==@nongnu.org
X-Gm-Message-State: AFq9FYLwpSG+Osi4iOY5iBrzUPGl5BWiYx80goIH/E+K50Cbc85FpLc8
 iaGuhQkLDER61NYeEgneWS9mhnWzu2hAc2P8zwd5qpCXRQHaicegZsqSGUyN0OD03za4doLVzMv
 mpxMKB/4=
X-Gm-Gg: AYBFou15XnKn5Tdh2bQix/pdimVnYZKw5GFE6Pf/Dr2sXV+ui7toFBFNhbc3jeh1nXY
 MTa/sk8oRcqRlLkjtA2ZgG8vWXADrycfMVEQ5W8vxI/sLUf5t9cKKAi9kec6TB4QeM21RQAZlW9
 kRupRh1RyNRWBa5bpSM08YCwgANjZqy9Niczy4ENfe50Ln9uJTSaZzsvpv7mD9BHeObgxKJWRAT
 v6S6Ef5LAIwNvTDF9DIMhIYMNas02HqRVRFTnYNVNcG7mT6X8E/JOnXrOpuXZKs94USLXgzh3rj
 2mQ8TRL7Hm8wvanu9ZT+dpunccWWh2rFLbBkUSQQMYnBLPs6TwjxhPDQBf4GIivXSMeMMztITc1
 JtGZ4QxfKLwFk07FBlNfQlNhjeucF656PuE3Vzgj3DVz78C4AlKOBosXhH8FaTPWl3wKw31rEdY
 aXz2SJ3qBTQGldEVt9os+9AgQzbXMQoZTnmD1rusJSYu21wmb9s/Dh73s7EF0WyoQDR22xL53a0
 dU=
X-Received: by 2002:a05:6000:2210:b0:488:641b:2dfa with SMTP id
 ffacd0b85a97d-48c726f4887mr880037f8f.2.1791318021381; 
 Tue, 06 Oct 2026 13:20:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:7318:ac57:7d1a:6aa9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71bd7644sm1535709f8f.7.2026.10.06.13.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 13:20:20 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Tue, 06 Oct 2026 21:19:12 +0100
Subject: [PATCH] tcg/aarch64/tcg-target.c.inc: Correct register MIN/MAX
 instuctions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-jmac-4609-cssc-fixes-v1-1-798505d4a4a5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAL9XxWoC/x3LQQqEMAxA0atI1gbSotXOVcRFrVEzMDo0IIL07
 haXj8+/QTkJK3yqGxKfonLsBaauIG5hXxllLgZL1hkih99fiNg48hhVIy5ysaINkzdk2fddC2X
 9J35DOYcx5weI06ZvZgAAAA==
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 qemu-stable@nongnu.org, Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=jim.macarthur@linaro.org; helo=mail-ed1-x52b.google.com
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

Some digits for these were one position off.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4609
Reported-by: Ayoub Bourjilat <https://gitlab.com/Bourjilat>
Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 4ebdef7e07..273462ca61 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -549,10 +549,10 @@ typedef enum {
     Irrr_UMULH         = 0x9bc07c00,
     Irrr_UDIV          = 0x1ac00800,
     Irrr_SDIV          = 0x1ac00c00,
-    Irrr_SMAX          = 0x1ac00600,
-    Irrr_UMAX          = 0x1ac00640,
-    Irrr_SMIN          = 0x1ac00680,
-    Irrr_UMIN          = 0x1ac006c0,
+    Irrr_SMAX          = 0x1ac06000,
+    Irrr_UMAX          = 0x1ac06400,
+    Irrr_SMIN          = 0x1ac06800,
+    Irrr_UMIN          = 0x1ac06c00,
 
     /* Data-processing (3 source) instructions.  */
     Irrrr_MADD         = 0x1b000000,

---
base-commit: 8e021b85cc06caec24a24302aa68f040a0970c12
change-id: 20261006-jmac-4609-cssc-fixes-2ab9102e9875

Best regards,
-- 
Jim MacArthur <jim.macarthur@linaro.org>


