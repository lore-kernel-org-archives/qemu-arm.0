Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5448362wrm;
        Tue, 8 Oct 2019 10:33:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyi27QR1MSqOf0iqFlyUPbPjvCOVjuDdvg600cBtgugCU8BVqJIyUiOQypJ8GoDX86kXxem
X-Received: by 2002:a17:906:1007:: with SMTP id 7mr4244488ejm.149.1570556023543;
        Tue, 08 Oct 2019 10:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570556023; cv=none;
        d=google.com; s=arc-20160816;
        b=ylmIxcYKsSq/fNnMTLYXCifodd+iokAwDJd/ZDURZL3PzcsJc8Q0nZBEdxR59MkpIh
         aTjMqlI3B7hhQoJJJHrrAC8G0W43K98ropzd674sMkDdvB66WGeTN7zSrlmxkd6/1SrI
         XN72osCU70+d5Zarv+Rbn6jtIlQG6o9/6teFjua7nbFduG3NLW7mMpBTfdXsHCGvtP8I
         WcErDYGPk7Y44F2d+QvtMCHENA2ja3Qt1AXb6rAA+4C9nkdpJMfTRQ7DZbwgMtqDXIsn
         Y/TILfYCqomwnbEDw3Si9IYxFJ1GD/ytCiSWavonq+u0/YGdotMQWhLU67G4RxxX7GOa
         Lq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=PYOd0vFS/gYS2A8DyTJAHBtn1FfEmdBSCZ1qScpfiwA=;
        b=a77aGTRTorr5zrDnhN4qhfoiAhsIk8lM9ozXmJiPfwpEKyzQFJ+aIIkk7XnY89cnW5
         d8sRM2AGRHcCa3w9S22OXeDJJ/RM+r1Z812rDohTLtu8k4/j2LmlDElvTC8U7OtK35wU
         KcVgYChGfLz5VNFjUbe5um1l6r2a4ye9F9bpaWG6LjiHMh3UGxmySl33+rsp1m195hQo
         gSwG5/2Etgie/XMRdSqcQI99pOzFf2OqEtUN0xRJqM5pnDK33XcFDE5o0EWoauJF9vsU
         kvaTO4aDxofxhuc8isSAjzrpooz7X7g/XPdo4ZqrTl+vrF2ptHGGuoQcV3DWNRGUkpI9
         7Hug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sw+8Rwp+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b27si10693669ede.233.2019.10.08.10.33.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 10:33:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sw+8Rwp+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHtMj-0004Ul-Fw
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 13:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49067)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7e-0006oV-GM
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7d-0002Oq-2h
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:06 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46972)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iHt7c-0002NO-PH
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:04 -0400
Received: by mail-wr1-x442.google.com with SMTP id o18so20290612wrv.13
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 10:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PYOd0vFS/gYS2A8DyTJAHBtn1FfEmdBSCZ1qScpfiwA=;
 b=Sw+8Rwp+JVvkoGA81kds513BxAOtOGzaAYuqHSmvsuztgpfgmpNCOn0rsBjvQel+Ha
 QfDWKdx6SgqNzO2TRtPGXIdSAp3RmtGda+Q9zK5Nny6b6YzE2ELsQ2WZyVEh92yz6Qso
 whK8ZlzCIhKJX9I+mrynZ9/0eoMcm3zFcNq4hYmxXTbYCa5GMSVZlbj8hl7ZeLtQC+Nl
 WybL2bsTPMCrYVDoz8buGXfd1qgo3Aw8nJTDha5T7hJVlquEC/JyOpwGBOB1Kq4mMDZf
 q9Bhc7Ad9v85DCyZqjtokVwZZF2EQqcv0D91GLjkzcsT9BlGZb7gblDTSkVcxpznQKrj
 QVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PYOd0vFS/gYS2A8DyTJAHBtn1FfEmdBSCZ1qScpfiwA=;
 b=g9rbYpwmixn6BM1eT7xwOrQhSlTg1kMTOe7CH/wOZseP6xB8dKK8/eE3f2r7CWy8Ck
 aNxVZ74Wh/d3ZeC6SOumUWWYMyIJCMPYC6eTK+99mL5l6Kko3QLH3QYpc4vai7JUgmDF
 ADce+dCgMAcfSH0BoI4BFGdV3jYDBsXdWb9pFucmlPVe97UC1p+CsdWoz6AueIBuJaqL
 1Qg8XIMKS9V/Bk/GlhEepvjJW0K/Xs56YU3TVvYouHM3+jxqKfQYs803fUPDvYMoadWC
 9hhKjavuUCBRMDKK991xznOQirRfepNLmFq6102JM95bWIrRElgo10vXQV35y9Eh+TvL
 AKLg==
X-Gm-Message-State: APjAAAUtlXClYWx1Lub8nYCRgwMhQrQM8wtCSExFb+Hr4SZM+Ny67pgF
 NKWz9zb90t+42rS5MfguR1C5vDPwGB7w8g==
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr3844941wrq.165.1570555082655; 
 Tue, 08 Oct 2019 10:18:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z9sm19135541wrl.35.2019.10.08.10.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 10:18:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 15/21] hw/timer/exynos4210_rtc.c: Switch 1Hz ptimer to
 transaction-based API
Date: Tue,  8 Oct 2019 18:17:34 +0100
Message-Id: <20191008171740.9679-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008171740.9679-1-peter.maydell@linaro.org>
References: <20191008171740.9679-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +2onNwWtJOwC

Switch the exynos41210_rtc 1Hz ptimer over to the transaction-based
API. (We will switch the other ptimer used by this device in a
separate commit.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/exynos4210_rtc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/timer/exynos4210_rtc.c b/hw/timer/exynos4210_rtc.c
index d5d7c91fb15..b7ae99e9aa7 100644
--- a/hw/timer/exynos4210_rtc.c
+++ b/hw/timer/exynos4210_rtc.c
@@ -401,6 +401,7 @@ static void exynos4210_rtc_write(void *opaque, hwaddr offset,
         }
         break;
     case RTCCON:
+        ptimer_transaction_begin(s->ptimer_1Hz);
         if (value & RTC_ENABLE) {
             exynos4210_rtc_update_freq(s, value);
         }
@@ -430,6 +431,7 @@ static void exynos4210_rtc_write(void *opaque, hwaddr offset,
                 ptimer_stop(s->ptimer);
             }
         }
+        ptimer_transaction_commit(s->ptimer_1Hz);
         s->reg_rtccon = value;
         break;
     case TICCNT:
@@ -539,7 +541,9 @@ static void exynos4210_rtc_reset(DeviceState *d)
 
     exynos4210_rtc_update_freq(s, s->reg_rtccon);
     ptimer_stop(s->ptimer);
+    ptimer_transaction_begin(s->ptimer_1Hz);
     ptimer_stop(s->ptimer_1Hz);
+    ptimer_transaction_commit(s->ptimer_1Hz);
 }
 
 static const MemoryRegionOps exynos4210_rtc_ops = {
@@ -562,9 +566,11 @@ static void exynos4210_rtc_init(Object *obj)
     ptimer_set_freq(s->ptimer, RTC_BASE_FREQ);
     exynos4210_rtc_update_freq(s, 0);
 
-    bh = qemu_bh_new(exynos4210_rtc_1Hz_tick, s);
-    s->ptimer_1Hz = ptimer_init_with_bh(bh, PTIMER_POLICY_DEFAULT);
+    s->ptimer_1Hz = ptimer_init(exynos4210_rtc_1Hz_tick,
+                                s, PTIMER_POLICY_DEFAULT);
+    ptimer_transaction_begin(s->ptimer_1Hz);
     ptimer_set_freq(s->ptimer_1Hz, RTC_BASE_FREQ);
+    ptimer_transaction_commit(s->ptimer_1Hz);
 
     sysbus_init_irq(dev, &s->alm_irq);
     sysbus_init_irq(dev, &s->tick_irq);
-- 
2.20.1

