Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3192197lfq;
        Sat, 10 Oct 2020 07:06:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPxMMJ1o8vd29uNFPXdwQOKmQB5nn/Oyj308lbvbJGsKAf83ExgBdt+9PxUAAO+mBMgHg6
X-Received: by 2002:a25:55c6:: with SMTP id j189mr25397570ybb.253.1602338780326;
        Sat, 10 Oct 2020 07:06:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f2si10001898ybn.87.2020.10.10.07.06.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 10 Oct 2020 07:06:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b="Sm5K/mex";
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:48694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRFVr-0005Ub-MZ
	for alex.bennee@linaro.org; Sat, 10 Oct 2020 10:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1kRFNP-00020x-2v; Sat, 10 Oct 2020 09:57:35 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:43628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1kRFNN-0004L5-CI; Sat, 10 Oct 2020 09:57:34 -0400
Received: from sekoia-pc.home.lmichel.fr (sekoia-pc.home.lmichel.fr
 [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPS id 4AA9DC60447;
 Sat, 10 Oct 2020 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1602338225;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DcI48tCMxlodkMmJI8399CoSnp6maJFtviK5ZRNd7kI=;
 b=Sm5K/mexEYr8xWulPXGUjMrLUxAftP4ifXvOWHit+d0b11JHn/Doivgr2pWKfBXLFctL79
 OhCE21oOVwfrwi9N4+AvpxUNO8UOTESinpauW7542kRTIqcOiojUPP6kOiq8crGRNk9ctk
 k9PZXQc7JbciVUhQejtrAb9TnulwUQPegxYyo7k2W2dRGpPODBFwYdd7Wk0Mwr0MsZJHwr
 8lBppzjT3vJwEGTCZjiiUNELIIZuLX6gmMsg9cDHxKAg6oFt/ZyN9u9+/gH9oxC1CQVaYb
 CBC+2wsD0IMkbk7/vBvp4FJjJkwTDus2rn3+EPXXa5279dBg0KCnb+1mK8DvKg==
From: Luc Michel <luc@lmichel.fr>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/15] hw/arm/bcm2835_peripherals: connect the UART clock
Date: Sat, 10 Oct 2020 15:57:59 +0200
Message-Id: <20201010135759.437903-16-luc@lmichel.fr>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201010135759.437903-1-luc@lmichel.fr>
References: <20201010135759.437903-1-luc@lmichel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr;
 s=pharaoh; t=1602338225;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DcI48tCMxlodkMmJI8399CoSnp6maJFtviK5ZRNd7kI=;
 b=fe72YsBJe7iz6xeZqCwZzrAmfB8JAEM+dOskjC9mTJiWs4yXe5BCTlpo+hJrA1Ah5ZAo+T
 867DPsT9Qi+TZUhPH17SeNbgLVs2BXJkZpTFRk2DxcAH6pkpZ8+THAUOGbKuu7ET0OIZE+
 u5PbqkEAl7WG4CDIq0gdvVarB9DEgUtRBAHzdkwa+F32rXJ6mQ/3frC972lohOvSZRhvR1
 8knOEXwjr5WxQede0zQvJZRW7L48/UiXCpnM09QaX4u5tBoPxPisUKwUWF2lqSTjrhAuLi
 tzTkPrC/uCPsOsNIfIwnQxNQLBglgRxXLt9CutDljFRBvYDZZoVLkWub+AnKkw==
ARC-Seal: i=1; s=pharaoh; d=lmichel.fr; t=1602338225; a=rsa-sha256; cv=none;
 b=UM0+mCKZAd5Z3kNP6q/6exY2SanAwGVOP/X+C2WGBpnWL2eahlx6CuWCArQTYGO9Z1Dt+9XIKeNPHjDMZbJHKGLgWoOPYueOm5eZDVohfQ671+IVcAkl5qe3ce+062RA1GqVZJfHRte72fGZyIW5CHX9AWzanLY4JFt0NuN5jyMZIg1Po8jvI9WuWnKt7WoOCHnh+oAG8twobddC23tO0IQzGZ72rJMSAXkaEJkvZ69oiXdvDpVng2I3d1pKWVxitesPxY63juHlsBoFKCugVbreE2jlDYGV4cwIPl6DLlHRA8J6VCxOQgWzrp9w+2OydrZT6IzgcdMImqutJKSb4A==
ARC-Authentication-Results: i=1;
	pharaoh.lmichel.fr
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/10 07:32:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hfQrt6S6z5VV

Connect the 'uart-out' clock from the CPRMAN to the PL011 instance.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Luc Michel <luc@lmichel.fr>
---
 hw/arm/bcm2835_peripherals.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 9d6190042d..d8f28b1ae2 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -167,10 +167,12 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->cprman), errp)) {
         return;
     }
     memory_region_add_subregion(&s->peri_mr, CPRMAN_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->cprman), 0));
+    qdev_connect_clock_in(DEVICE(&s->uart0), "clk",
+                          qdev_get_clock_out(DEVICE(&s->cprman), "uart-out"));
 
     memory_region_add_subregion(&s->peri_mr, ARMCTRL_IC_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ic), 0));
     sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
 
-- 
2.28.0

