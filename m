Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1501010njf;
        Tue, 3 Sep 2024 09:11:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURV2nzYSHr3Y14c+oo18wVq9TzryO0rH5Dd2sQPW62l1FQRV8YOIgT87UKg/VP9jHSRBCTkCdPZ8fDgQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEcQFxJG0qIhrNPaZypIgB8bES6WFwWZacbDwD6M0iottLyUKLe2NdiwYPllZmCe/g+OoVH
X-Received: by 2002:a05:6358:52cd:b0:1b3:8960:9876 with SMTP id e5c5f4694b2df-1b7ef6c12bamr1561768955d.7.1725379866101;
        Tue, 03 Sep 2024 09:11:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725379866; cv=none;
        d=google.com; s=arc-20160816;
        b=vFGwVvYR8eiCJwwT0CD1azEcqgoEnZ8SpGSbvSn5uPF2dYVPcj+0/lY8lbUc8ORLsC
         UNxjgRjaBHFuZ4T/fGKwIemK+iyECnE9crInleOQ7sLkhZUmYH+VmDAnJo4v303Va9GO
         6DeXUHKdm6wlD+5gA7IdfYilawr9cRE4KcmATTLGTyPtqqvWl1AK3M/trlQblAklmbR6
         kP6aSigWv9gHIcflIzeHs4JNr0oWEBG2GFy+6KMgkQ1kO0ns+kQbFv5kxwQmSBsDGNVN
         +8uwlcB6QRILdpjQ1DXgVSlWE9pIoTgjcTArb+/el5b1gWqmy6P7evTONabIVt8JmAQh
         V1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=21yBip9fl+wPMp+SFGduDp3DVC3gklGR/2TSpnHcPxA=;
        fh=EFk4XB+JunPpFf6ZKkG3pjW7Xgy6Ho+VrvmX8/KfxGY=;
        b=fAjIu5rcLNLMMKrqUNghQ5uRsWEV2mp++ALzks183YhFCqbGB10Yo+6703URf719Kd
         qX9sUkX2UcPdmVlzY/gii67zK1NZcoJsYA52uNtCY9E+RyR2XrOt6xwwKeaQWnMs0nlq
         5gYZ5tWFINB6tUNGMiAu5t5Wo6nHo5Rw1rajYJKLB9ycA/g+yzhpi0NGF1LasQRIMRUO
         whPqPcWdlvFr1J+qJcA9XwD8lj1daRCElNIrUfkSxYP4lAhgfylZi6vK9m5txn1AkqrQ
         y8cXx53us4BCL8xP5bzwNs917lG42t2lDDsi/p++ONFZExnTDLxDJveqIn0SpGtvIRIZ
         OIFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hp8Z+nhk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806c18b1bsi1338452085a.107.2024.09.03.09.11.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:11:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hp8Z+nhk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1slW4r-0005ye-1B; Tue, 03 Sep 2024 12:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW4o-0005jw-Ie
 for qemu-devel@nongnu.org; Tue, 03 Sep 2024 12:08:18 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slW4l-0002kA-6H
 for qemu-devel@nongnu.org; Tue, 03 Sep 2024 12:08:17 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso62205415e9.1
 for <qemu-devel@nongnu.org>; Tue, 03 Sep 2024 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725379693; x=1725984493; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=21yBip9fl+wPMp+SFGduDp3DVC3gklGR/2TSpnHcPxA=;
 b=hp8Z+nhkwo6qQ1utnXlcQtToiiHZHss8pureEUUoXjbT69QDILKPlsATUNTVF0/Crr
 U5bJwudkySkVG5CdU3AFRWsT/QQhyeq+hx6D4p3coDo2m9/mn6fZHse0glnobpbf5Oe0
 wZiwbzhIxnLIrPXE43xf6/JvxW75nwda366KG2yUlKT77XYtY6TKyyQatwTD+NzOsUR2
 2AZ0kki2EpO7SkKdMoL4bpRJTFV4UjN94qzo06J0sQfnMJ0K4RNOr39Ok42fmq7uTk0Q
 erHhans0ADIjrYyM4l2H+xgfAY9hgEDkuskg+md1F9Bgie2nEcSmA92cz00/9gLDmW6s
 AtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725379693; x=1725984493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21yBip9fl+wPMp+SFGduDp3DVC3gklGR/2TSpnHcPxA=;
 b=Dor+yT0vBOEJd8INNjQKQBAYGq2i86Bn8CKHkYfTmc1IuDEOmFdA/9He1lWbpOx94A
 fPYTEzqIT7nDAx9x/coI+vazaff6zxCL8QGJZl0dCpIjYWUclr+F7Qlh6L9rhkIdDb2X
 7U4YWXL8F1EdF9uKOObDKK/rbwDt8crKJp9WZz+WXUSOUBFtOs4n+D2ZeHyApOu2V57n
 wK9N5KAmrYUc+IIjY4NOqH+jE+cUUd8vqPhOXhgJjU+TFyDrd/D6a8XxEqVabJvyRwDQ
 oIPZ1LHHHFWRJry88PgD/LimtsvR+N7lil41aRIpn2WRG/SwYFyoZd2tPOu0kWsIWkQS
 Fzow==
X-Forwarded-Encrypted: i=1;
 AJvYcCXW5MB7fmmjuOjyMrpZXRn2EnXGB0/AaPMaY0rMq4k4pPmW67zB3r4lK7CXQCXy3VjFEs90j5DyNPDk@nongnu.org
X-Gm-Message-State: AOJu0YwlY08W+B/K5KhAlxwGb8qT+Ie4MP9aMmX73LaVcGr/RFL1sjjp
 1kv88tbq+WKskENZX0ys7xii1PsvFw0xO2++jHCwkdOqA+KBMZIZk+zPgn1+Hyc=
X-Received: by 2002:a05:600c:cc3:b0:426:63f1:9a1b with SMTP id
 5b1f17b1804b1-42bb020ba4cmr141589045e9.33.1725379692944; 
 Tue, 03 Sep 2024 09:08:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df1066sm175123065e9.18.2024.09.03.09.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 09:08:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-9.2 13/53] hw/arm: Remove STRONGARM->PXA2XX dependency
Date: Tue,  3 Sep 2024 17:07:11 +0100
Message-Id: <20240903160751.4100218-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903160751.4100218-1-peter.maydell@linaro.org>
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: RRSosQPMEWw1

Currently the STRONGARM KConfig symbol pulls in PXA2XX. Since we've now
removed all the true uses of PXA2XX, we'd like to remove the PXA2XX
symbol too. To permit that, make STRONGARM directly select the things
it truly depends on:
 * pxa25x-timer
 * SSI

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig       | 4 +++-
 hw/timer/Kconfig     | 3 +++
 hw/timer/meson.build | 2 +-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index c2452bd7b91..8f6cbf94855 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -175,6 +175,7 @@ config PXA2XX
     select SSI
     select USB_OHCI_SYSBUS
     select PCMCIA
+    select PXA2XX_TIMER
 
 config REALVIEW
     bool
@@ -261,7 +262,8 @@ config STM32VLDISCOVERY
 
 config STRONGARM
     bool
-    select PXA2XX
+    select PXA2XX_TIMER
+    select SSI
 
 config COLLIE
     bool
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index 61fbb62b65c..c96fd5d97ae 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -21,6 +21,9 @@ config ALLWINNER_A10_PIT
     bool
     select PTIMER
 
+config PXA2XX_TIMER
+    bool
+
 config SIFIVE_PWM
     bool
 
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index 80427852e02..3a78636ab45 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -24,7 +24,7 @@ system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_timer.c'))
 system_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_timer.c'))
 system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_gptimer.c'))
 system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_synctimer.c'))
-system_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_timer.c'))
+system_ss.add(when: 'CONFIG_PXA2XX_TIMER', if_true: files('pxa2xx_timer.c'))
 system_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_systmr.c'))
 system_ss.add(when: 'CONFIG_SH_TIMER', if_true: files('sh_timer.c'))
 system_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_timer.c'))
-- 
2.34.1

