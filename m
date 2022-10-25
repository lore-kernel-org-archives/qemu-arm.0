Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp614926ejc;
        Sun, 30 Oct 2022 19:18:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4hYPeB4rcT+lkfMTKlnmfLNy857SKZ3AoSgrPzPgQ5/I/fjMo2bWVTNwpiNsQ+tEWyrsYt
X-Received: by 2002:a05:6214:21c5:b0:4bb:d7c3:1789 with SMTP id d5-20020a05621421c500b004bbd7c31789mr6194429qvh.116.1667182731143;
        Sun, 30 Oct 2022 19:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667182731; cv=none;
        d=google.com; s=arc-20160816;
        b=F/sqrlJCu0K4KK6j0YtgX7bXHHbqf0b6jFFVsbVqac/dftN5oWsjve0rsJMrEFT/bF
         oLDffV4iLUXZ1hyRkJHlSp9qJt7uWmyRsUqQFRobSnADajLbOHvIiP9aZMuM6WwAr2c0
         hd8TgfdTZd1K8yz18LpelvTnvaSNeBIGEm4enhputhXgHWyLgUOeVBM3rP2OrXs9Mtyz
         /WT86rL//fLdNZ5blne0Pt37ZV0U1FrH7X9l01Z7a2mGUHkwRWwHYU4zlfeMyP8CJ9GG
         belRDi72yQJDEW6vGTNQ//3j3461A96yT9HTE108xxBS6HqOr7Zt7ETM6UlUSkMWBPUb
         /YcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:in-reply-to:message-id:subject:date
         :from;
        bh=ER9N8qDYhZZXVK/riUMcvlTu3H8jpBcLRgmCk1xK7tE=;
        b=kdJm8CbHffm0P6neFOTSjIdUqtAgettVi2Rb3NSIGalN9/u4bj9NoCqNjMxmOUjhgP
         GyUCNhq4RqXXUNY5OHmyGa0O3iMexBy46SLMagkVqk6xhlRaMpHDDHJe/msEcssSJqh+
         Z7TRwtGVmgp+VhXbsDakuCbcfkq+c5N1CsCkg62OF2O3L7Soe1fJJSEmGq8X97n54EDc
         IL73WV98ZXOeUGwLcn9I1MiRtEv7VwD3qUrevkkYe1DgOqnvmeFR1/nZhBWpNaG2myoD
         S73HWrzsK0CqTkLIOjhK2PbjqRPfaQpM29dbNEkZB5IMbzNTKJQ4yyZVNRqfxjAurAcq
         r3Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc7-20020a05622a59c700b003983e8e62e7si3026107qtb.721.2022.10.30.19.18.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Oct 2022 19:18:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opKLE-0001Au-JM; Sun, 30 Oct 2022 22:15:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL9-00015f-07; Sun, 30 Oct 2022 22:15:51 -0400
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1opKL7-00035m-J9; Sun, 30 Oct 2022 22:15:50 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 6B8F011F266;
 Mon, 31 Oct 2022 02:15:46 +0000 (UTC)
From: ~axelheider <axelheider@git.sr.ht>
Date: Tue, 25 Oct 2022 20:32:30 +0200
Subject: [PATCH qemu.git 06/11] hw/timer/imx_epit: software reset clears the
 interrupt
Message-ID: <166718254546.5893.5075929684621857903-6@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <166718254546.5893.5075929684621857903-0@git.sr.ht>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 36
X-Spam_score: 3.6
X-Spam_bar: +++
X-Spam_report: (3.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: ~axelheider <axelheider@gmx.de>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nWOMnHpegK2o

From: Axel Heider <axel.heider@hensoldt.net>

---
 hw/timer/imx_epit.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index d21cbf16f6..2e4ff89613 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -97,6 +97,9 @@ static void imx_epit_reset(DeviceState *dev)
     s->sr = 0;
     s->lr = EPIT_TIMER_MAX;
     s->cmp = 0;
+    /* clear the interrupt */
+    qemu_irq_lower(s->irq);
+
     ptimer_transaction_begin(s->timer_cmp);
     ptimer_transaction_begin(s->timer_reload);
     /* stop both timers */
-- 
2.34.5

