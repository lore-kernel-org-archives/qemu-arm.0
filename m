Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp369294njb;
        Thu, 27 Feb 2025 09:05:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU0FOQBXtnePs8i43DMs4sFVslt7ErB/tfiejaW+T8wCl1hhvRcjK8pNSWYN3lH6/I/EnDe0ZY0hJWhwA==@linaro.org
X-Google-Smtp-Source: AGHT+IHMR9BxyLsTMvB5LFcR+nLnMDfIIr/muQLbULzVcz+GFDFvZZwscvU1YTpVo6IYkIt6Oj77
X-Received: by 2002:a05:600c:1546:b0:439:6b57:c68 with SMTP id 5b1f17b1804b1-43ab8fe7687mr75126855e9.17.1740675914716;
        Thu, 27 Feb 2025 09:05:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740675914; cv=none;
        d=google.com; s=arc-20240605;
        b=Anv2a3hUx5k9PP/cQf6ZNjuW/0W5TQk1uBP/UEStJq98Ck9WD94FTpMusNi0H9yX76
         ERXQcJiDo5KeJ/LuRptWdPtJRhMrH8Oz5aHmIL0pi7VAfjb5UXGjN6I+0wIfqDQwZ5bo
         OPfRtfJ+MjWt+DMx2tMzCSQVqSbBFi0DFnuuq3H5cSMSkm3dYbSp9d1p7ZWpRTVCAS0a
         VShpNKegcdd1z1zFOwvzLFfl3KfLC0HUEE6RmHwubQk92Si2J1/S3P5rWEZhVL41kxtS
         kXOGN3jk2i6lysN2Ye4FSTQGhjr66X/bTPBAxCG8vjBdKgrcDdk+rWfFNIHev/zpC6fH
         MU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UF02YER6LE6cA8Ff3jhsAUNNOFSeF4BeX3fGvUwDcr8=;
        fh=kMV9Gf03Gytdui1wNFIYiPtWHZ5s+jsuC1BVPpLEkys=;
        b=EyIf23GZbH0Ed1gm4IYAzdO52FQDFREd2yUP0u+rm3i3dPNQZSl3EUJuDrR74437qh
         IUGH3RHCh8moYZ2q45O/lmv3QlVzg+js8zwQ1QHYL3TfyuVdsj2yCu/ZXDTybvH/xw+U
         M1pF3dHpUjgFvbimFQ9XUHSrkbk4ZWMzAKLOl0mV2du+abndJ7i4CBFBw9idMTE50PNR
         ZP+EkdNfLBjpdqwdfa3k8seHSe6BEm830bzWISIzpmNmuWYXSqK3zkriVUlZMbzl9UbJ
         EGHYqUVOhxBKpsCppsVo52mrHa1isyB1WPTZivv33Em7s506eYg5rffPS0uB8fgs/fme
         EO8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMnlzyQm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-43aba52b930si28962735e9.72.2025.02.27.09.05.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 09:05:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMnlzyQm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tnhId-0007RF-0m; Thu, 27 Feb 2025 12:03:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnhGV-0005Ce-AC
 for qemu-devel@nongnu.org; Thu, 27 Feb 2025 12:01:44 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnhGQ-0002LP-Vs
 for qemu-devel@nongnu.org; Thu, 27 Feb 2025 12:01:37 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-439a331d981so11384095e9.3
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2025 09:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740675684; x=1741280484; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UF02YER6LE6cA8Ff3jhsAUNNOFSeF4BeX3fGvUwDcr8=;
 b=IMnlzyQmRu9NFTY2Qpxd0zuu5otFx63Qt4HenisymcW7FIyvbVQUOWr4wic1qWWFxe
 kY6CW9ux/1BQWMQoAhICh/6HgT7cBEtOelUI5WrER+JULyC0AnxhSrODcntPCRsLinJ+
 Sz3P7EiPeIDnudxqQTx7OHH1sYJc3ENu7S2mmBhLMtpHL7reRQ7ZWODKFzcxl28/0vXN
 8mxEv7CLeMwercJvcs2ulZ6MX/973iZ7/S9dVZmoULkKK+DV6XkY7KeScd0i6jhqCyzC
 o4UWMk0nvU+ZdQbHVctf36aDa+XWBJE9ZWIWKKXNV2iYfkuoAVVfKx9Vt0vDi5X8fM6g
 mNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740675684; x=1741280484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UF02YER6LE6cA8Ff3jhsAUNNOFSeF4BeX3fGvUwDcr8=;
 b=F94BnXMC6sRDA9PRhYPHee+zTAr7T4YPRCBC2ivwyorN/arMVWbEhsCfnjcBG0p3jP
 ySOGdVPfj+eLXP36GabLqpoOf6J9WUcchy4Q2thUjRnEQB5iC6Sqm8uy8akwJAlPdru0
 3ov56S9PyqWCKQ3LazFd5bwGo08jAjaKiXwdlw5TAzQBcJC9P6K5PoTRBhwJ3VvFavF4
 ZFvYasqN3CaJIwaO4OhOu2Y2OJn4fRNlKlo6W6+hGpJ0U/mhlvKcmdWL+dHqRTDHKFqO
 xJMa1OMWY1lXego+KUOmFre+99TLMWfmdD//YA+Gky0vjQJzwZdNanuI0bHkiQ36QbNh
 iZUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrSnFdmIPDbeZmoRzpYYs/krwiXTwGOs97IdRZZugdqNvvnyGl1Zq4Q46ODhbq8uuqf0PcUmAv+Cff@nongnu.org
X-Gm-Message-State: AOJu0YzN+zxaGCI6TI1PXsH4S8GcOFKV7EaWyR1ENPeFJ5VA6Sq/tSH3
 DQJ8uuDUHFpfGzhHfYbl4Yz8niYOEyga2FHfm2oCm0HIbpREFycn+t5VNK14ZiKAYEm4uyjfpPn
 o
X-Gm-Gg: ASbGnctzSWf/UlgPA6P9JAjp/EmCSHRNP6H5EhGThiR7JvB9qwpQPIxLAvGQKqwEF48
 iFUUdLcgBiLgSdM80wTkyUhIDsqWTVLFVKVuI6l7o6PDhcaZdWzyzbCwW73a3Kl9xw4RKC02C6L
 o2+Cs2F7nUgbcf16Rey+O0ao9Q5O4AgM4cx0kUYoApsJW72Bm3SoRQfUQsC/Pln6C1v8ZNrogY9
 cILrZI9fPGMKWV7Z8fhCGNWtlXKzpNu65SvsQUuGv5LGX0Icm82279N0k6zjZYT9kdLlbNpGkT4
 WtWhwoYz0VApUg+kiLGTCjxUu9DOlRHl
X-Received: by 2002:a05:600c:5103:b0:439:5da7:8e0 with SMTP id
 5b1f17b1804b1-43ab8fe2fe9mr83751495e9.16.1740675682878; 
 Thu, 27 Feb 2025 09:01:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5871f4sm62747565e9.39.2025.02.27.09.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 09:01:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/5] hw/arm/omap1: Drop ALMDEBUG ifdeffed out code
Date: Thu, 27 Feb 2025 17:01:14 +0000
Message-ID: <20250227170117.1726895-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227170117.1726895-1-peter.maydell@linaro.org>
References: <20250227170117.1726895-1-peter.maydell@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R+j4Nj/e0RYd

In omap1.c, there are some debug printfs in the omap_rtc_write()
function that are guardad by ifdef ALMDEBUG. ALMDEBUG is never
set, so this is all dead code.

It's not worth the effort of converting all of these to tracepoints;
a modern tracepoint approach would probably have a single tracepoint
covering all the register writes anyway. Just delete the printf()s.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/omap1.c | 51 --------------------------------------------------
 1 file changed, 51 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 3c0ce5e0979..8f5bb81c96a 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -2660,25 +2660,16 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
 
     switch (offset) {
     case 0x00:	/* SECONDS_REG */
-#ifdef ALMDEBUG
-        printf("RTC SEC_REG <-- %02x\n", value);
-#endif
         s->ti -= s->current_tm.tm_sec;
         s->ti += from_bcd(value);
         return;
 
     case 0x04:	/* MINUTES_REG */
-#ifdef ALMDEBUG
-        printf("RTC MIN_REG <-- %02x\n", value);
-#endif
         s->ti -= s->current_tm.tm_min * 60;
         s->ti += from_bcd(value) * 60;
         return;
 
     case 0x08:	/* HOURS_REG */
-#ifdef ALMDEBUG
-        printf("RTC HRS_REG <-- %02x\n", value);
-#endif
         s->ti -= s->current_tm.tm_hour * 3600;
         if (s->pm_am) {
             s->ti += (from_bcd(value & 0x3f) & 12) * 3600;
@@ -2688,17 +2679,11 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         return;
 
     case 0x0c:	/* DAYS_REG */
-#ifdef ALMDEBUG
-        printf("RTC DAY_REG <-- %02x\n", value);
-#endif
         s->ti -= s->current_tm.tm_mday * 86400;
         s->ti += from_bcd(value) * 86400;
         return;
 
     case 0x10:	/* MONTHS_REG */
-#ifdef ALMDEBUG
-        printf("RTC MTH_REG <-- %02x\n", value);
-#endif
         memcpy(&new_tm, &s->current_tm, sizeof(new_tm));
         new_tm.tm_mon = from_bcd(value);
         ti[0] = mktimegm(&s->current_tm);
@@ -2715,9 +2700,6 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         return;
 
     case 0x14:	/* YEARS_REG */
-#ifdef ALMDEBUG
-        printf("RTC YRS_REG <-- %02x\n", value);
-#endif
         memcpy(&new_tm, &s->current_tm, sizeof(new_tm));
         new_tm.tm_year += from_bcd(value) - (new_tm.tm_year % 100);
         ti[0] = mktimegm(&s->current_tm);
@@ -2737,25 +2719,16 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         return;	/* Ignored */
 
     case 0x20:	/* ALARM_SECONDS_REG */
-#ifdef ALMDEBUG
-        printf("ALM SEC_REG <-- %02x\n", value);
-#endif
         s->alarm_tm.tm_sec = from_bcd(value);
         omap_rtc_alarm_update(s);
         return;
 
     case 0x24:	/* ALARM_MINUTES_REG */
-#ifdef ALMDEBUG
-        printf("ALM MIN_REG <-- %02x\n", value);
-#endif
         s->alarm_tm.tm_min = from_bcd(value);
         omap_rtc_alarm_update(s);
         return;
 
     case 0x28:	/* ALARM_HOURS_REG */
-#ifdef ALMDEBUG
-        printf("ALM HRS_REG <-- %02x\n", value);
-#endif
         if (s->pm_am)
             s->alarm_tm.tm_hour =
                     ((from_bcd(value & 0x3f)) % 12) +
@@ -2766,33 +2739,21 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         return;
 
     case 0x2c:	/* ALARM_DAYS_REG */
-#ifdef ALMDEBUG
-        printf("ALM DAY_REG <-- %02x\n", value);
-#endif
         s->alarm_tm.tm_mday = from_bcd(value);
         omap_rtc_alarm_update(s);
         return;
 
     case 0x30:	/* ALARM_MONTHS_REG */
-#ifdef ALMDEBUG
-        printf("ALM MON_REG <-- %02x\n", value);
-#endif
         s->alarm_tm.tm_mon = from_bcd(value);
         omap_rtc_alarm_update(s);
         return;
 
     case 0x34:	/* ALARM_YEARS_REG */
-#ifdef ALMDEBUG
-        printf("ALM YRS_REG <-- %02x\n", value);
-#endif
         s->alarm_tm.tm_year = from_bcd(value);
         omap_rtc_alarm_update(s);
         return;
 
     case 0x40:	/* RTC_CTRL_REG */
-#ifdef ALMDEBUG
-        printf("RTC CONTROL <-- %02x\n", value);
-#endif
         s->pm_am = (value >> 3) & 1;
         s->auto_comp = (value >> 2) & 1;
         s->round = (value >> 1) & 1;
@@ -2802,32 +2763,20 @@ static void omap_rtc_write(void *opaque, hwaddr addr,
         return;
 
     case 0x44:	/* RTC_STATUS_REG */
-#ifdef ALMDEBUG
-        printf("RTC STATUSL <-- %02x\n", value);
-#endif
         s->status &= ~((value & 0xc0) ^ 0x80);
         omap_rtc_interrupts_update(s);
         return;
 
     case 0x48:	/* RTC_INTERRUPTS_REG */
-#ifdef ALMDEBUG
-        printf("RTC INTRS <-- %02x\n", value);
-#endif
         s->interrupts = value;
         return;
 
     case 0x4c:	/* RTC_COMP_LSB_REG */
-#ifdef ALMDEBUG
-        printf("RTC COMPLSB <-- %02x\n", value);
-#endif
         s->comp_reg &= 0xff00;
         s->comp_reg |= 0x00ff & value;
         return;
 
     case 0x50:	/* RTC_COMP_MSB_REG */
-#ifdef ALMDEBUG
-        printf("RTC COMPMSB <-- %02x\n", value);
-#endif
         s->comp_reg &= 0x00ff;
         s->comp_reg |= 0xff00 & (value << 8);
         return;
-- 
2.43.0

