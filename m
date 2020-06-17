Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp370782lfm;
        Wed, 17 Jun 2020 00:25:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMkoyRESQ5kydQSFetEYwIASs8iMty1waY2b/nTu/qjm2f8lS5Hc3gdKuJuozWO/zB0qrD
X-Received: by 2002:a25:d354:: with SMTP id e81mr11211306ybf.398.1592378756036;
        Wed, 17 Jun 2020 00:25:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592378756; cv=none;
        d=google.com; s=arc-20160816;
        b=TvZWQni1V8AnyQ1GbetDkGYU23sGPRG+odRSrUEOgA9+HoU7uMK1SE6mz0msGSIpT4
         pG8y50KJMeDoLn6c3+qleb2ppRQQyxCNSYuYdCMoV+z3QTy9b7sp7mnHXBG+0zs7Bccm
         j1YJOwXBpTimDPK0wZZomZvLodHw11MblEv4Yr4BBKiibEf33EKUO8xMyyHHbfnS6iIl
         PkL+WtxoF0WAaS1DVYZmqBi+xeqi7u+XK6+yV0AbsGQGA1DY6esLCcPLP9PstEJKEsrs
         wgnoK7U0Zf2IH0JJKKJDNraNb1/bAkPuPqzxBwW3DdH8x03dEzQ5C1rHD9SimaMEJeKr
         qTOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BVuLqYtrt8uBmV3Fe5GFgsc46Ji8iMLXSf7RHd88kek=;
        b=xtnWf//8p8Ztt1YEQYBfNVVVEg4yMh4K1k7wT/+rLyrGr997lmGuzFWmGSxrfQFQnN
         WIn+9O0Pyz+yjvptSKNCoW867t9ZfgYzAnN2DQzkSyb9SSSamGl8AdbIalmhY+PUCNWf
         5+do5H15VvLZzK5EkQ9gptJfG1sx9iFQPXU1ZYs7lP5cxaT3AJaRrRc0vtqT41bMLH6e
         AEmAw/w4R/v7Cc4HhCIE9K+FiKhhK5gWOnu6ML5RRDTwAGyBbF/7AMHC/HDmcAZvYPW/
         ovk9BZcuLCHW1a+RF6yUnAIgA780jw6Fp8FcAprzx1HNKcZ9lJvA+n2cMp259WcCqFop
         trkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GPlx6IzH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5si19526462ybg.170.2020.06.17.00.25.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 00:25:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GPlx6IzH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:53246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlSSJ-0004T9-A4
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 03:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlSSA-0004RM-Cy; Wed, 17 Jun 2020 03:25:46 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jlSS8-0002Y6-TJ; Wed, 17 Jun 2020 03:25:46 -0400
Received: by mail-wm1-x343.google.com with SMTP id g10so794389wmh.4;
 Wed, 17 Jun 2020 00:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BVuLqYtrt8uBmV3Fe5GFgsc46Ji8iMLXSf7RHd88kek=;
 b=GPlx6IzHGYH3NeCHlM+gcHWjqm7pIIwQRisVevA6wjEEhj44wSMsiJDOnuktCyfA64
 7xWdBBZQyMCKMb92x1a9lPgTeHQGHNvKavsQ2LZTxygOoRy/G0WSaKlsBV82oe18Dwf5
 GHB3gr8N5/LEH4xr5pBE0eNsrzt/C2chjn55F1naJjwhxAI3nwFAfvJ/+BaqidH7O4xZ
 GcHC3v9uAY5phUBmIQ43SiGRij6ah0fGgtblb28ta3uqZhfSI941BymVV0OTSpD/KWD9
 /UxNBtr5z4FOOmlJlwBTDm7RIniQGEVvF18KjvVLc2UfCrBfvAEiQY+Rw1J52/lttwv8
 BkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BVuLqYtrt8uBmV3Fe5GFgsc46Ji8iMLXSf7RHd88kek=;
 b=nwYl/ZPouKJjcbgiIBnUBOZh5HxLZBAKGTlrQ6bAye92bHiR2hcLnRB6KBXTYWN4Jm
 zobIPCbqF8qhesFGyHQZZyEA0quMzth/vYUjwbfMiw9nAdD+sb29UTjwKwqG9o5402r4
 X0uqdsvo5VeOAPFdQ0SY5N3wJLejdfm9EeZrSjgtZW/+Cnr04mgbPf0oIw20LYgzdqhn
 y071nyjV0VIg/e622Y3ugonwOSDd/DBiO9AKeBR8T/maQ2aIcN3YjtWC+wUOgSNLlUJQ
 XjoyRJh8WFDUXl6wHdPfF88qrjuHkpq3P8kSg/x2bO2/MUedMT666s2AsfUa25GaZZU3
 PwtA==
X-Gm-Message-State: AOAM532eQbIZVvPJAQmR9hecURaUEqIYW/C2i8asWtoRJBsc05o+nSZ8
 uHKTKnaG5Z+nghehyuMulAhVC4Kn
X-Received: by 2002:a1c:bd84:: with SMTP id n126mr6660098wmf.149.1592378743056; 
 Wed, 17 Jun 2020 00:25:43 -0700 (PDT)
Received: from localhost.localdomain (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id j5sm32894781wrq.39.2020.06.17.00.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 00:25:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/14] hw/watchdog/cmsdk-apb-watchdog: Add trace event for
 lock status
Date: Wed, 17 Jun 2020 09:25:26 +0200
Message-Id: <20200617072539.32686-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200617072539.32686-1-f4bug@amsat.org>
References: <20200617072539.32686-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DJv+kTnmxLQ2

Add a trace event to see when a guest disable/enable the watchdog.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/watchdog/cmsdk-apb-watchdog.c | 1 +
 hw/watchdog/trace-events         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
index 1541365914..5bbadadfa6 100644
--- a/hw/watchdog/cmsdk-apb-watchdog.c
+++ b/hw/watchdog/cmsdk-apb-watchdog.c
@@ -225,6 +225,7 @@ static void cmsdk_apb_watchdog_write(void *opaque, hwaddr offset,
         break;
     case A_WDOGLOCK:
         s->lock = (value != WDOG_UNLOCK_VALUE);
+        trace_cmsdk_apb_watchdog_lock(s->lock);
         break;
     case A_WDOGITCR:
         if (s->is_luminary) {
diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
index ab94d7df50..3124ca1f1b 100644
--- a/hw/watchdog/trace-events
+++ b/hw/watchdog/trace-events
@@ -4,3 +4,4 @@
 cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB watchdog read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_watchdog_reset(void) "CMSDK APB watchdog: reset"
+cmsdk_apb_watchdog_lock(uint32_t lock) "CMSDK APB watchdog: lock %" PRIu32
-- 
2.21.3

