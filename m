Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D56CCFA18
	for <qemu-arm@archiver.kernel.org>; Fri,  7 Nov 2025 15:02:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vHNyW-0000RY-OH; Fri, 07 Nov 2025 10:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vHNyM-0000NW-Tk
 for qemu-arm@nongnu.org; Fri, 07 Nov 2025 10:01:55 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vHNyJ-0003eE-Io
 for qemu-arm@nongnu.org; Fri, 07 Nov 2025 10:01:54 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so9790455e9.1
 for <qemu-arm@nongnu.org>; Fri, 07 Nov 2025 07:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762527709; x=1763132509; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JsPXanOwycMd+Uo8/scp5eUByokzkxKqyckKoyuUOUU=;
 b=YHAwaf0/0YbqIjJeasScvztE3mKxn6/uRFKxFvuI3HMSzGer7A7/gkfa6VZIMivaKL
 W1ShoQu/8yPhOAGsEbWODD3JPDhzn/CnaW9zG0ugtPIzl4Ivy4mG0BpsCA/w85Mp6A3W
 sLjGC6jnE+BszBSCbfOkVCnlp8ovsBYfhTJS8OTc78rG/lGn/4TykhVfjuGlMxbKt+tq
 145vKhYyGZgQFGivJgeSqOTsPlCBqnLOdVFzNFroe5DTL+h/h1jtcAkVsYKHWoiUHq6h
 iHS9wuL5m+06JpOKInByCQtU8toePsYxv3p8HypTdYjcZrPQ07iqbJeUehCMheRi0Vbs
 XCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762527709; x=1763132509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JsPXanOwycMd+Uo8/scp5eUByokzkxKqyckKoyuUOUU=;
 b=VB/uW5L3oV0Iv6bbLCgXkC0dum4GFLs6+bi7VjlacFNPMw/4oCK80KIp53nnjD4JG8
 WuJ9++NSHJVg2m8J0yA0Zocu4D5J/WYi1wlkVRPtNDB/WHCklXL91BFW/hF+nI7SJ3WM
 ReXXSlM54iCljsEv/AXgWrvi0w0O5ZVCxKTpGbNN+qdYDU+0X8JlwNDhRMN0sr0k1Q0Z
 D6uT9Y8iNQWADeaFbWnA3jb+ALwHl1s2d9RyObl12FafdSZPUjZRZw/Aa9b4iBfzv5g2
 UR01EsT5Lmew/+61aQdCZ4s2MqxGCk59/maIs74WpnkElYx/Oxo0ncYizaCx+S+sndK2
 M+KA==
X-Gm-Message-State: AOJu0Yy6o9NojoTCxtBcPcmqLq+mXNj4wtM3LTfyfIlU1c+pHtUrtEF5
 vBN3N3eTvdxVsV6y1TWqpUi5zxoo1/oQlcfSetfm6BuV04JnujusayOPc40fkyE2S5K66tmjlaO
 pwbqv
X-Gm-Gg: ASbGncsFOeFfW7R6Ucc+92PVtpz1wtHl2Fi4hVdqFou7OQfPffC0VEpun8EJiGFZdEN
 uXSHt76FAet4/UqFeLmLCXgCFHFeuQJew9r3EXg8FNx/i3A3CZEon2fL6J+x9yNEanXJYDXjIeJ
 a2e2E6J+j1WfWGqu1p1+azel4JekYFqKuB4cpJA0SWa4MDXGCPmy6r66lJ1YKE8Da/r5gUaeKyZ
 RL2dXUATV7eQ2n8SXwc8xN4OiLgEhvXDThOG1dvzp4gQ5Xah9i4RoRCm7kQ6U/GhNWdzRI+w1iR
 2+gYXqHC0odpz06KDIAIVn2zp2Xgw/+bcVfzoB4wUiNMDA7GL2DPycVFXjthWFAfCYjKFZs3zZ4
 Ir+LJ/GPLEMPkt7nowAK4Y9HEdJ+3Bj79mARY7UhlebNM1HapEFVsq+BtAJTr7Wr+zn0Nz7Q9jZ
 9oZ7iF+kbZi+lNAkqt
X-Google-Smtp-Source: AGHT+IF6WqeitVxy78B0zzlLzVCq7C354pTOimGANN5r9APaHnVC7D10CTJbWt6OyjZLq25qFTXWvA==
X-Received: by 2002:a05:600c:c4a3:b0:46e:436c:2191 with SMTP id
 5b1f17b1804b1-4776bcb9cbdmr27706775e9.25.1762527707959; 
 Fri, 07 Nov 2025 07:01:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ac679607esm5794652f8f.43.2025.11.07.07.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 07:01:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>,
	Hao Wu <wuhaotsh@google.com>
Subject: [PATCH] hw/misc/npcm_clk: Don't divide by zero when calculating
 frequency
Date: Fri,  7 Nov 2025 15:01:37 +0000
Message-ID: <20251107150137.1353532-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

If the guest misprograms the PLL registers to request a zero
divisor, we currently fall over with a division by zero:

../../hw/misc/npcm_clk.c:221:14: runtime error: division by zero
SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../../hw/misc/npcm_clk.c:221:14

Thread 1 "qemu-system-aar" received signal SIGFPE, Arithmetic exception.
0x00005555584d8f6d in npcm7xx_clk_update_pll (opaque=0x7fffed159a20) at ../../hw/misc/npcm_clk.c:221
221             freq /= PLLCON_INDV(con) * PLLCON_OTDV1(con) * PLLCON_OTDV2(con);

Avoid this by treating this invalid setting like a stopped clock
(setting freq to 0).

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/549
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/npcm_clk.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/misc/npcm_clk.c b/hw/misc/npcm_clk.c
index c48d40b4468..e202a8a2998 100644
--- a/hw/misc/npcm_clk.c
+++ b/hw/misc/npcm_clk.c
@@ -212,13 +212,14 @@ static void npcm7xx_clk_update_pll(void *opaque)
 {
     NPCM7xxClockPLLState *s = opaque;
     uint32_t con = s->clk->regs[s->reg];
-    uint64_t freq;
+    uint64_t freq, freq_div;
 
     /* The PLL is grounded if it is not locked yet. */
     if (con & PLLCON_LOKI) {
         freq = clock_get_hz(s->clock_in);
         freq *= PLLCON_FBDV(con);
-        freq /= PLLCON_INDV(con) * PLLCON_OTDV1(con) * PLLCON_OTDV2(con);
+        freq_div = PLLCON_INDV(con) * PLLCON_OTDV1(con) * PLLCON_OTDV2(con);
+        freq = freq_div ? freq / freq_div : 0;
     } else {
         freq = 0;
     }
-- 
2.43.0


