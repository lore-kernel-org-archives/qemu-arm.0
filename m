Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9C8CD4851
	for <qemu-arm@archiver.kernel.org>; Tue, 12 May 2026 13:48:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMnSs-0002ap-E4; Tue, 12 May 2026 09:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMnSq-0002a4-NP
 for qemu-arm@nongnu.org; Tue, 12 May 2026 09:48:00 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMnSj-0000LB-SP
 for qemu-arm@nongnu.org; Tue, 12 May 2026 09:48:00 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4896c22fcbaso48961105e9.0
 for <qemu-arm@nongnu.org>; Tue, 12 May 2026 06:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778593672; x=1779198472; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wtlir2d27CqnUEFc37Jq3x9lDPJ+PuPEk9b4VuJO7ZY=;
 b=DipskvZyhbb5AlerMRODUGuQei9WL1jR63LbfpO2YlNJ+VZSgf4iSfqmOq2k7tjHUy
 c4Rt3QfpXmTmZr6dBMM2Aoom8U72NyaJtEoGUv68ibcLi2v5oaOO9EdiCDosxxxTzUH3
 CYgXo7n3ck4xkLC6AdlhOpmgQpMrctUagatIYDpova8Ik9t2Fzogmz6t4MFrhXjKfhG2
 Eaih+dbuZ4s9xj0r/WOvaeM4M4xTMckJrr3WBQRGUKh5jef4JswSh6CXnyG56KFaDkaT
 ZUP2RL661wBWJpdzKkSy8B4UHFpD5jhf4jcFatQZLt1oj/me47ws8w8qGCLHY5WZuTjI
 oX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778593672; x=1779198472;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wtlir2d27CqnUEFc37Jq3x9lDPJ+PuPEk9b4VuJO7ZY=;
 b=hfOJXg+V4If3b8iORGJ2+KbZB2va0MnIuHYuszSji0o1uInC6ayxVInxYHJBNk2yJa
 p0GjKkikw6kO8UO4GO7ygILbzM9NhZnrqPrqxCqyOjxUegtNghKAl9tS8fdwqxMgP9Tz
 ig+blK+7t4rVMJOXVSGseapfbhNCwl2FqnbTnS5NUsVSlOh97Ye78sAVm/67+c+BrUok
 pVwO9pk53i+YaoCPRCWOoKZSMYU91bL75SBy0m7351Sb87+nwADsw5/MIwB45+mlj/Hc
 Zs+RRT8xylDx39JleNWlspfOGuWBPfEJxMkmxK3wre+TLdmLvFfuToCLoFt2EmGpwrsB
 FqxQ==
X-Gm-Message-State: AOJu0YzmdpS5Kl23bc/r5ciyIR5/QAndR7Lf6/T7kUQ0mv3tdDgiWJBg
 0VPA9qs/pDBy2ZOlvWhXGkcdSOELRfOxF7kKYmqB3AlKynFyekyaa/pcjth9PMiwvEBzqbktLam
 LTz0P
X-Gm-Gg: Acq92OEWMlXj0UoSr/6XyWdcaMLNdshloiSONg/bboY7VgpakPunL5hT8bGBe4xTW+7
 uxJw+TczSjnupe4giu8blWgOPfkmqVa+sin4ihsWBn+dJUVP0eQQntWns5YOhIVhVyHzBHsm7k0
 0DmZtWQD5MRxE540HM1+1HVQSWn7amzYWG4Ao611ZEAu6BBtwyRFxwkdoI5wsjgZdiI2WI+em7c
 YfP74rYi/7ElXkQ6JvyLGgVX4nj/1um34pNC/KSdDFOhJRxPZVGaJFA3NdgS0+tGX6C7piNGkpZ
 YQrHBTllxt8wTjILytpNArrJFwsEbp2jFIDO4WnxaRIJpYW7+9Y8Yf5DHqkYUbcHmuBWNRzwgJl
 bZ+nExK0AgF8kMWOs0ZOlZ8hACVj9W3ta7fP0qAVjjrD7ZWyS3/nPYRo2BxqRRJg6pEPTl1K/F0
 aA7LM7uZuEtbM+aEwkUyJ6DHUM1uXjZ4rm/SfW47MTHXk4Im3eMeRT0XA9qMyDotfI6q3mORMMV
 MAaq0NwcSlbY0pPiEa0stgwOqolhTE=
X-Received: by 2002:a05:600c:698d:b0:489:1ba8:5be9 with SMTP id
 5b1f17b1804b1-48e706f0e53mr235890965e9.29.1778593672016; 
 Tue, 12 May 2026 06:47:52 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e906ae8b5sm80737515e9.6.2026.05.12.06.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2026 06:47:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Subject: [PATCH] hw/timer/mss_timer: Remove dead code in timer_write()
Date: Tue, 12 May 2026 14:47:50 +0100
Message-ID: <20260512134750.3543639-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

In timer_write(), we switch() on the address offset to handle
registers that need special-casing, with a default case that handles
both "unsupported (64-bit mode) register" and "can just write value
to st->regs[]".  However, as Coverity points out, every register is
covered by the special-casing, so the "write to st->regs[]" code path
is dead.  (timer_read() has a similar structure but there several
registers do go through the default code path.)

Replace the dead code with an assertion.

CID: 1613905
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/mss-timer.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
index bd3f3e845f..25fcf42aa0 100644
--- a/hw/timer/mss-timer.c
+++ b/hw/timer/mss-timer.c
@@ -189,14 +189,11 @@ timer_write(void *opaque, hwaddr offset,
         break;
 
     default:
-        if (addr < R_TIM1_MAX) {
-            st->regs[addr] = value;
-        } else {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
-            return;
-        }
-        break;
+        /* All non-64-bit regs covered by the switch cases */
+        assert(addr >= R_TIM1_MAX);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      TYPE_MSS_TIMER": 64-bit mode not supported\n");
+        return;
     }
     timer_update_irq(st);
 }
-- 
2.43.0


