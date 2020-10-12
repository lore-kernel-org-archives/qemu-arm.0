Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1158799lfa;
        Mon, 12 Oct 2020 08:49:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8yyF2N0B5/5TfST0lAobi1WcR9NoaLcLPHOGNg6cgOsHInOzF0ExOoJbuf6xNRS3bFgxo
X-Received: by 2002:a25:dbcf:: with SMTP id g198mr33731118ybf.354.1602517790339;
        Mon, 12 Oct 2020 08:49:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517790; cv=none;
        d=google.com; s=arc-20160816;
        b=c01DDFCUvYThTdnFcDmWBLMHfPZbsLFlzoeXXn2mGwIX1JvfPseLvSRCKXX4tMLXB7
         UMoSzRislVyeh3Rj7DSQBjGt+uTdGcum6yoxawIjUAjjZKYCFx1F4NhSFwwsU9Xh7szJ
         vdpEF/xxiN0inJRoZ6Z40Jpg5YtsckUaD3YSMnNSPyJF2c5Vm2BVT8WqIDMSgqZ4LXNR
         x9t62FE5M49+K949N0FC02Z49SQVIaD9w9mc096UoSiRdGhgPPoKlvlXKitiCDgu/He3
         UyIsEGNXvmrAUTCrxiM3MQxPvohVJ7qepgPjCbvsRvIgCedtTmN+NKsKRBi1ciD+ngLg
         wBTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NE3BHoZcVo5rUaArzOLXnKqyeyPe9cLG2NZvnHPubpg=;
        b=Pu+G8F9RohzyX0sj6jU0ySFjUzq07f+dTpa1vJ+GnsT07sDk8fzMXN/cM5c2+aHT7R
         e32fN9ZBdBnJr0V4Cd8VZkz1uNHRwN0AV523zUTaagLCVUSe9wOpknxXSm1j7m2w5MEi
         o3I0+AWO1mfYcWJFrnTkmHMIq6AmcP2JYL9PqmP1dxivQlme8hknwPp59fc/5NsOkwy9
         yt09p56PJkU2KXLqULHR3Ydg8G8bNRMnRaFyUHKYmkXEBXdp5h9Y4eE0YY/U6fCrPpOB
         z4ndVrZ7uIYBfmRgh5m4JTog/X0yxYdAwIat4ml7vwWMlgGf5W8kONboDa6tO1kbvYlM
         yLsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F0P5DqSR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16si4101258ybs.328.2020.10.12.08.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:49:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F0P5DqSR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS057-0001py-IQ
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqG-0006qa-OC
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:34:28 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqE-0007IN-R7
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 11:34:28 -0400
Received: by mail-wr1-x441.google.com with SMTP id n6so19391282wrm.13
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 08:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NE3BHoZcVo5rUaArzOLXnKqyeyPe9cLG2NZvnHPubpg=;
 b=F0P5DqSRbWzz8LAZgY3uK7HBoazadBF6IlWYEaqn1g0simBrisdG45SWpVgDBnrJYD
 W6rwu6CQCGPbENBwQu9NGBUnFrtValWsVAss410TC9hJrS+1y6bMG1VaYrY7co18lvy7
 jXjy/wZnKlg0J5MaAg/MvYhuQ3eOjxSSYKD7a6+a6U2EjYufIpGZ7CeIDa4RbyScd1ry
 wFF3v5mMRGow0DdJVctXs087rluuEwFeJiMqMrbvJLqKjStuhc4CuWGwseRWwk+lmz7H
 yC7n8wkKaJiyJ2PMpcOM61FPUkdM2FXadGDQe1yZfoVA9+QNoRGX8iOj+nQFVvp6iCPl
 Z9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NE3BHoZcVo5rUaArzOLXnKqyeyPe9cLG2NZvnHPubpg=;
 b=gNzpN/75b5cD8lxdIYw28TQZgtTOOHF/dEBQjlKxjFLLvJe8P2DFXynt0VsiBj7szO
 Ae9MQEWeShqJKrBiQRL2BiI865vA1guTpUKHRxJzmSgE2bb+JLhAu4F38/j6J2fAbNsy
 K83IvDJcoYw0/krf+7kHA73yuTYabIVcuJFmsHzNux3IXLrZnZiRHoE/0IQcb2rR0OXK
 KTjZ6UWAhfy7BuLitIilfBXOcOZEqHrUDfNjlsx8HE2iAZkHdj7KwLWWOceTb+hfHJaY
 FY81impLaTKnd1N5X1x+i7xmuJ/elOiscO3ID+tLenBn2g6lHqJnAw+qa9SJcijiHHCf
 AcHA==
X-Gm-Message-State: AOAM531OOeSb51y6RAAGnS3HjzY9tvxefVmqERXJBLjWzWPUFpFsD7+n
 XOPN0hSGQPyuWDzZwONDF0yUfAPcm+3KetF2
X-Received: by 2002:adf:e38f:: with SMTP id e15mr30571623wrm.294.1602516865536; 
 Mon, 12 Oct 2020 08:34:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1] hw/arm/nrf51_soc: Set system_clock_scale
Date: Mon, 12 Oct 2020 16:33:36 +0100
Message-Id: <20201012153408.9747-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: stpbBKGJpwHU

The nrf51 SoC model wasn't setting the system_clock_scale
global.which meant that if guest code used the systick timer in "use
the processor clock" mode it would hang because time never advances.

Set the global to match the documented CPU clock speed for this SoC.

This SoC in fact doesn't have a SysTick timer (which is the only thing
currently that cares about the system_clock_scale), because it's
a configurable option in the Cortex-M0. However our Cortex-M0 and
thus our nrf51 and our micro:bit board do provide a SysTick, so
we ought to provide a functional one rather than a broken one.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Tested with 'make check'/'make check-acceptance' only.

 hw/arm/nrf51_soc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 45e6cc97d70..e15981e019f 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -32,6 +32,9 @@
 
 #define BASE_TO_IRQ(base) ((base >> 12) & 0x1F)
 
+/* HCLK (the main CPU clock) on this SoC is always 16MHz */
+#define HCLK_FRQ 16000000
+
 static uint64_t clock_read(void *opaque, hwaddr addr, unsigned int size)
 {
     qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
@@ -65,6 +68,8 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
         return;
     }
 
+    system_clock_scale = NANOSECONDS_PER_SECOND / HCLK_FRQ;
+
     object_property_set_link(OBJECT(&s->cpu), "memory", OBJECT(&s->container),
                              &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->cpu), errp)) {
-- 
2.20.1

