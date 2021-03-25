Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp526570lfg;
        Thu, 25 Mar 2021 08:34:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytwhhxQr5Oh5iPri1GOfRVVu3X0m5rDin5ll60RQZPa4aGjz+4/DL7FQB0LVax5QTfPywn
X-Received: by 2002:a05:6e02:1e01:: with SMTP id g1mr7151856ila.192.1616686462382;
        Thu, 25 Mar 2021 08:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616686462; cv=none;
        d=google.com; s=arc-20160816;
        b=d4KzBHdR5cMamWN74RgPX8VQeM7aXbG4i7Pt6EV3BkeoBKrmI10N+bLj+12upGYwkr
         z9D+EJtFfljvgcCH1U2TmjVWiBxm9znDlnwSx+VrXy8DO0aOsYoXQInMlIxsVqckYeVr
         QzH1zC6WEOkrqB+WPskXe8aqKz03PoZbOeRaj5G0A9xFPa1Rbo+O1v7+yIPQmB/9jbMy
         rTN9zNGmJQqaJcnSbxAhU0m7yVAzEXJDjDh3V+PCVBTjwFiVExgcWg5SOBaWRsnX87kt
         HJzwKSjdDvRk3/FQ9uS0U52/eDStUYWr9ohBOgm8KFlmsilnRChsbISdgWqHW+rwLoD5
         eBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=IxDNo1Allqz7OOOia7vB67LRCL15GAaiRHjRAX0Tx7I=;
        b=omBz/S5cR2o7ktjNHqylXVQkHPcAS/lK3tRY368j0Ww0zJon4JvWJK+XlZmrqi1fa0
         KJTGqXG4kjxUBSfDSQPCO3jBPw0ArdhTtokLPNvYpCATkogOo4iQvDzFqd4Q4YvckGBz
         P3A3AKdoQQWzWx7V4yYFyfloffuJs6/JYJ7na8SMoHaJNUFcKAUwXUeo0ECQMz9ha2iL
         s2kkMuX4BUie74xn5ENFMcQNrAtEJ7fM0ZQDILz6M/he2n6B1bG99yTfIQflxNLZsoD3
         cf32Vy/C8lPZato3Cek+pjGRtDxfZzekKHFw4PyMs7vXmlOrTy4li3YDxp8kaLNYMqc/
         xFuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HuWgQT4d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4si722900ilo.99.2021.03.25.08.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 08:34:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HuWgQT4d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPS05-0005Ts-Mv
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 11:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRz9-0005Dy-CY
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 11:33:24 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRz0-00054U-S9
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 11:33:21 -0400
Received: by mail-wr1-x436.google.com with SMTP id b9so2706344wrt.8
 for <qemu-arm@nongnu.org>; Thu, 25 Mar 2021 08:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IxDNo1Allqz7OOOia7vB67LRCL15GAaiRHjRAX0Tx7I=;
 b=HuWgQT4dZMTapAWP00yWoc7NuPdw86WlZEU22A0VzI2aNpbTv9CoTM0zgyYvNsj4RE
 57he1t63r5RsNPu+LC9ojZyrAjZhyj8qIIfX2vA+1ae2GM2fxtPoDJ6Nf/MqqjEpRQbN
 2XyW3LBWKW3xlF08TG9XqqOa/1vNLl7UEiKHAXlSAx9jtd79TfLCzwclMCF10izhr+/j
 DEEtD2JPiy+uNCHNaJu8By+OKoaJU9GFvkN5BHkv2C+IrlhnNbh7JGm3sN98JnuoZurv
 w/ESQZAKFC8a1kyiM24xSYpY5sAepV7ez119ILf8sAcI5qlgL/VX/pKc2UalX308nyB7
 mBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IxDNo1Allqz7OOOia7vB67LRCL15GAaiRHjRAX0Tx7I=;
 b=t8xCsOPQVfJffBrstAl+txXanYF16EEUqBRDBvdg2IJsHeQaVzdI/Zb4p/dafPNMM3
 ifIpPScSFGrwr3LDapkFM2spRKe2PjS5wCrUAIh6a9rE28q4UD0goUJX/m996EhUr/PF
 8120Mf0dT9+zoi6e06roZbc9WfD2jakfWO2ZZjImw9EByAzpLCouMdQ1AKCUvHF+sxIf
 c1EHj/XxnP0rbUo/FaoRtweaL/FO6gxPwZHM6UQsZv7OQJ1Yv12s/tNSsSvdMu+VUlRE
 7aDVDL3GpzaGUYJuGDvXYfR08V3belIHX148FWKrpP5JcdyabLm/LxLBzmZM71BdYKcG
 86Qw==
X-Gm-Message-State: AOAM531cz+Km/xprwlIMBx/kttELaXXa6mejAYKlQ1MyZz6NpMMRJYDJ
 BiYBjBV5wwuV3W8slWqJ8Fkh5EuajFqyD55l
X-Received: by 2002:adf:a59a:: with SMTP id g26mr9652377wrc.271.1616686393076; 
 Thu, 25 Mar 2021 08:33:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g11sm8004580wrw.89.2021.03.25.08.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:33:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 0/4] Don't treat all sysbus devices as hotpluggable
Date: Thu, 25 Mar 2021 15:33:06 +0000
Message-Id: <20210325153310.9131-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DsrLeMYtyU5N

On the two machines which have the "platform bus" (ppc e500 and arm
virt) we currently treat all TYPE_SYS_BUS_DEVICE devices as being
hotpluggable in the device callbacks, and try to plug those devices
into the platform bus.  This is far too broad, because only a handful
of devices are actually valid to plug into the platform bus. 
Moreover, if a device which is pluggable for some other reason (like
a PCI device) happens to use a sysbus device internally as part of
its implementation, the hotplug callback will incorrectly grab that
sysbus device, probably resulting in an assertion failure.

Mostly PCI devices don't use sysbus devices internally, so the only
case we've encountered so far is the not-valid-anyway
 qemu-system-ppc64 -M ppce500 -device macio-oldworld
but we might create more in future.

This series restricts hotpluggability of sysbus devices on these
platforms to those devices which are on the dynamic sysbus whitelist
(which we were maintaining anyway).  With it, the above ppc
commandline stops asserting and instead fails cleanly with
  qemu-system-ppc64: Device heathrow is not supported by this machine yet.

Patch 1 is an API doc improvement while I was in the header file
anyway.

thanks
-- PMM

Peter Maydell (4):
  include/hw/boards.h: Document machine_class_allow_dynamic_sysbus_dev()
  machine: Provide a function to check the dynamic sysbus whitelist
  hw/arm/virt: Only try to add valid dynamic sysbus devices to platform
    bus
  hw/ppc/e500plat: Only try to add valid dynamic sysbus devices to
    platform bus

 include/hw/boards.h | 38 ++++++++++++++++++++++++++++++++++++++
 hw/arm/virt.c       |  8 ++++++--
 hw/core/machine.c   | 21 ++++++++++++++++-----
 hw/ppc/e500plat.c   |  8 ++++++--
 4 files changed, 66 insertions(+), 9 deletions(-)

-- 
2.20.1

