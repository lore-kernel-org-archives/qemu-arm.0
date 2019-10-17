Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1007139wrm;
        Thu, 17 Oct 2019 07:12:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzy2DOb8rEYG1ycyYGJd2nxKRoDNS/nZMUIIjW3z1pVzKDZ/HmjY5Up9S/TQzUGp47Jarn
X-Received: by 2002:a37:4fd1:: with SMTP id d200mr3429803qkb.413.1571321575207;
        Thu, 17 Oct 2019 07:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571321575; cv=none;
        d=google.com; s=arc-20160816;
        b=NtEmqa+MJBg6pjmm8rxotgUgrHKcZyxUaVI3JmCsq1N2N3tf6GFusQb4MydLQCTu3L
         BIugZR0NvCLUUBs6AvX7oZuzN91poXDHwuZJ+8xHCywpvPe550NrHejJCxe6cKNlvnTZ
         dHPrT1y0PfReecTQ3o4u3VqGm8imPrvWFtsD1sRESZ+Q+UbErd42UZm+X6I2pbse1Y58
         ZXVXC+jq2Sypiwvqb25KjfRAz+2S9DU9JmLcOvLRYkLK+FXqDz6vPmLAXnp4Ezrue96B
         can7c05SH5d8J1VRZ33lYqZCfHmdyRRcpjJuNgIUe8u35Jze07QvQZzsPIEjZkCloToV
         qelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=FQ/H1UToQ0yQenkMqC8Bhi/SSkQ/gTM/lhOzcdKaVnQ=;
        b=gy7D1KcTUx7BlDa+18vHAyACFvaeH5SU3iLqJ5ZDnjHMYnA0TtY3KpB05Vsgf2oWMV
         CzVMn8igDWZJ2xbCGcNd7M5IUX13lga2yrqVOAap3DSHHtDjcLtcFJpS+p8bNXqiyvj4
         MHk6stx5rAisLlcE7k1Aqz9ZjfD6DldvzZwrSOVW/2hyVNIk/vbOjP2smVdbzTU1Tc5o
         JZf4b2EBl80Wq6zvzW6o4+OUhUrMXDuyiNSqIa0UPEZqR/ord7rR3GcPqY2AmV1RLYhg
         DWEut8rDhIE0sU9vmYuPZ26BAkyD6ZcmJULTz6Wy0d4c+HdNiD7NMyksrrmDlFwp/Le9
         u7Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gP9ZxiW4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19si2058202qkj.25.2019.10.17.07.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 07:12:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gP9ZxiW4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL6WM-0007lN-K5
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 10:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37264)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5uP-0003XE-B9
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:33:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5uM-00042I-34
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:33:40 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51674)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL5uJ-00041l-8q
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:33:36 -0400
Received: by mail-wm1-x341.google.com with SMTP id 7so2615124wme.1
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 06:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FQ/H1UToQ0yQenkMqC8Bhi/SSkQ/gTM/lhOzcdKaVnQ=;
 b=gP9ZxiW4J+8v67ocp0R9PcMzYhhr0ftaInx8VwZvo0sUtcaQbM9jPJEibW3E7KZ05a
 QH8eb3bgZvR+chh9ZAW5Tdldewq3PLKtFEiVB9IWptAufzc0JuVHKY8St4TUTDe/kETM
 T+APKcGUtjryN1Mlte1rWVhy/V7Vlvh48TEcRBzid36t+N/hGQVfjNl6o+J/jatChzzs
 CJlJbbNJ06BCH8oKD5pwYya0H385xM6Fnwj1e0xGBNh4nZrz63xp32pTudPym9mWLen0
 6IbrbRDIRJzjdh7f4gOW+VL5HdJbIgIPMyNwdI7DqDcYTSasJC7C7aUqWv6NJHADWeT5
 qGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FQ/H1UToQ0yQenkMqC8Bhi/SSkQ/gTM/lhOzcdKaVnQ=;
 b=RxSfSgxj3V8mCiqK3+vdr/zGXtFVxbLMA47m0a+C6sP7ySFDDyo7SZspcwT+ykkCTv
 AEHO0Fa8OofgADBGaV7+WP9UWWxoEAgOeV4eJ8absI9IQwbpnHA3N0Xe2ngmSUcJEbEd
 VBmELUKN+rIMh4mUcpZZMpRUTL0L3iBEeCssJWKdMN+hpNC5w/zAv5TbnxEZU8Mm73sd
 fKrClDZR+YzHjPnJLUMcMOtDko9rbCqieaafeeEi8r6iX9AWNUCIhIzJRONlgys+djoB
 PCVYn2eYj+YSN3FjPYiJ2hkb+M67FgwI4hZG4zHp4SwG09aaBDjvlRuAEF9IwVPvgtIv
 8VKA==
X-Gm-Message-State: APjAAAXjmnylEL/pByiaNWybInHTWyDSL/SsNCKZxSZE9ED2vZsaO1Va
 iDNPdhLziVuemAUcHa3s2cjYWQ==
X-Received: by 2002:a7b:cc01:: with SMTP id f1mr3117397wmh.113.1571319213561; 
 Thu, 17 Oct 2019 06:33:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o22sm2530991wra.96.2019.10.17.06.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 06:33:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/timer/arm_mptimer.c: Undo accidental rename of
 arm_mptimer_init()
Date: Thu, 17 Oct 2019 14:33:31 +0100
Message-Id: <20191017133331.5901-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 27/5E/bRcrHi

In commit b01422622b we did an automated rename of the ptimer_init()
function to ptimer_init_with_bh().  Unfortunately this caught the
unrelated arm_mptimer_init() function.  Undo that accidental
renaming.

Fixes: b01422622b7c7293196fdaf1dbb4f495af44ecf9
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/arm_mptimer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index fdf97d1800f..2bf11f788c3 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -237,7 +237,7 @@ static void arm_mptimer_reset(DeviceState *dev)
     }
 }
 
-static void arm_mptimer_init_with_bh(Object *obj)
+static void arm_mptimer_init(Object *obj)
 {
     ARMMPTimerState *s = ARM_MPTIMER(obj);
 
@@ -319,7 +319,7 @@ static const TypeInfo arm_mptimer_info = {
     .name          = TYPE_ARM_MPTIMER,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(ARMMPTimerState),
-    .instance_init = arm_mptimer_init_with_bh,
+    .instance_init = arm_mptimer_init,
     .class_init    = arm_mptimer_class_init,
 };
 
-- 
2.20.1

