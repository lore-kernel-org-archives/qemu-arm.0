Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2060615lfb;
        Thu, 7 May 2020 08:18:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypK3XBnqcFZWBsGbFtjIG60oSBHxvLqVu8wvDKeASMgH3Wz9hDw9Lx/6+cjY+N+J5z/l2hNd
X-Received: by 2002:ac8:2a70:: with SMTP id l45mr15045755qtl.232.1588864722074;
        Thu, 07 May 2020 08:18:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588864722; cv=none;
        d=google.com; s=arc-20160816;
        b=OScfZ4iZko4yKQUiQ/6m13f59eNooKkPbJCvKep6mXZVPGu+rZ05THsvmvApAfvxwN
         wV39Zp7lt/siLq6ZaT8xUP+JMqLe01/UmANeDE06Rnuc57QXQ7ZnwGILZAJwEHpMWYpP
         nLY4m/W+PhIQ+dfO5XSEUCo+MnCpk6/QlqxbRM1Vbql+7QmmuRqTSIk+w7SXMRqT5dsI
         yMLTsbJTQBplmgXQd2V0onAO2vohR7Rm2eGXh0fSg66IIy/KZpSnxShFL3d4TVNnWX1S
         gVN+cMqE5+h78/v8nl/rz3t7h1BFvij+fKIFRBWEiU1QyvyVAeBjfyIfzHIiuINRCzTt
         rWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vioako13Dvzx/Jm/iy/nxXyf/pJdnFia47obSP+g2Vw=;
        b=j/QDVww4d1rYLvEmrSNxbClQlsP9IdTz6E0ZYK1nyC5urgrtJRoZJgeI2LvH8nyK5g
         YasDqf9WNB45ZMHfC4NsDPY/mjC5+yyD4WCTBKNbWCpsoU7x9B7OyT47tU/2efBNKf1y
         w2kO/SCll2RIwcHBFXzEfYbMci+K+lntjLJQiZ7Lc4TaJsyjgKdwHZMDIAv/CnVumauM
         WFNifhWBhReEHCJ0PxEXxvqOy7C9LByuY40iZi+dAwa2s9M/SweANBWenxG920iyAWKT
         QBXVzYJ4joRo/FYkM/Q9Frb8z3QSgCB9WVZMfxSRA2/3aXLiwqQNgGSajWVQ/xo4UF1I
         rH9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tA4kRQCA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id j184si2918832qkc.75.2020.05.07.08.18.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 08:18:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tA4kRQCA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWiIL-0006t8-74
	for alex.bennee@linaro.org; Thu, 07 May 2020 11:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWiI9-0006pm-1u
 for qemu-arm@nongnu.org; Thu, 07 May 2020 11:18:29 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWiI8-0002aC-6X
 for qemu-arm@nongnu.org; Thu, 07 May 2020 11:18:28 -0400
Received: by mail-wr1-x444.google.com with SMTP id y4so6842495wrm.11
 for <qemu-arm@nongnu.org>; Thu, 07 May 2020 08:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vioako13Dvzx/Jm/iy/nxXyf/pJdnFia47obSP+g2Vw=;
 b=tA4kRQCAuxDZeQ/ikR0O6QGZBanbZtMM9KaJjzSKpMlU2PD5pMJY39HtK8G66EnBD+
 2HZ7ncr8G9ZCcHwE1nrz/FA77U1fB+/FHXDZo3ukj3eJUtGyTc7N0b2IHRp6QIUPXMmx
 l6+rXcmMBM4nx7t0qtSzpex2zDuDgyxx/6tlOhfgAXvYOnpumNwv+lrcMOUCdOjNOtUa
 BwV3qbqkAL6lciNubpcgeO9R9VAZTuviy3R0wxnwm2OYRa2CJCKBVQ/j97BNM0DTvVjv
 mVSL6XMjbttHXFQOvShL29u6aOm7M5SzZ4AApCSxxRI6nRtcADJ+rus6MMP7FGJ4GBg/
 Jyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vioako13Dvzx/Jm/iy/nxXyf/pJdnFia47obSP+g2Vw=;
 b=F3ivQFKPH7uB6Z8iLtGRWobh2MWIGZY9kCGYznEqbbMMXMmz+kv6y4F7ulDrdlA1Sl
 jZmc6b+5z9abXTjfhEijFQ+vld5h7AahGMMxvoVKAVPT6sBcSkqQOggAfWNZNMbG2o+V
 e1FitsIUfOBF3f3vEFBbtPgYidzIn1QFdzxX4BP0tLS4mGkMobOppM1M1pbT58+Oj4XC
 hOQKpEsoPTD4Ha+M2DwJpTZMcUJSB1oRpT4/GRm+h+n1ZJSKeE5WYedC1ea+iBJQ9RV4
 j4IM56EUDfRSI2Gib74w0oSPZ9AUnxF2r5YT4SyC/uZGe8tXv9dEXQn/lSNO5Y9YqCM9
 z95w==
X-Gm-Message-State: AGi0PuYky7Y5sXp1eoPrvKdZnkhGtg+7zGjAyIrWnvQU5RG2E9Tpie7b
 EsM08L8XJKEaV4KfJhUqTlUzAixGg4OnZQ==
X-Received: by 2002:adf:f041:: with SMTP id t1mr15994767wro.346.1588864706413; 
 Thu, 07 May 2020 08:18:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q74sm961246wme.14.2020.05.07.08.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:18:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/5] docs/system: Document Arm Versatile Express boards
Date: Thu,  7 May 2020 16:18:17 +0100
Message-Id: <20200507151819.28444-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507151819.28444-1-peter.maydell@linaro.org>
References: <20200507151819.28444-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xf7gPDsdddNc

Provide a minimal documentation of the Versatile Express boards
(vexpress-a9, vexpress-a15).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/vexpress.rst | 60 ++++++++++++++++++++++++++++++++++++
 docs/system/target-arm.rst   |  1 +
 MAINTAINERS                  |  1 +
 3 files changed, 62 insertions(+)
 create mode 100644 docs/system/arm/vexpress.rst

diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.rst
new file mode 100644
index 00000000000..7f1bcbef078
--- /dev/null
+++ b/docs/system/arm/vexpress.rst
@@ -0,0 +1,60 @@
+Arm Versatile Express boards (``vexpress-a9``, ``vexpress-a15``)
+================================================================
+
+QEMU models two variants of the Arm Versatile Express development
+board family:
+
+- ``vexpress-a9`` models the combination of the Versatile Express
+  motherboard and the CoreTile Express A9x4 daughterboard
+- ``vexpress-a15`` models the combination of the Versatile Express
+  motherboard and the CoreTile Express A15x2 daughterboard
+
+Note that as this hardware does not have PCI, IDE or SCSI,
+the only available storage option is emulated SD card.
+
+Implemented devices:
+
+- PL041 audio
+- PL181 SD controller
+- PL050 keyboard and mouse
+- PL011 UARTs
+- SP804 timers
+- I2C controller
+- PL031 RTC
+- PL111 LCD display controller
+- Flash memory
+- LAN9118 ethernet
+
+Unimplemented devices:
+
+- SP810 system control block
+- PCI-express
+- USB controller (Philips ISP1761)
+- Local DAP ROM
+- CoreSight interfaces
+- PL301 AXI interconnect
+- SCC
+- System counter
+- HDLCD controller (``vexpress-a15``)
+- SP805 watchdog
+- PL341 dynamic memory controller
+- DMA330 DMA controller
+- PL354 static memory controller
+- BP147 TrustZone Protection Controller
+- TrustZone Address Space Controller
+
+Other differences between the hardware and the QEMU model:
+
+- QEMU will default to creating one CPU unless you pass a different
+  ``-smp`` argument
+- QEMU allows the amount of RAM provided to be specified with the
+  ``-m`` argument
+- QEMU defaults to providing a CPU which does not provide either
+  TrustZone or the Virtualization Extensions: if you want these you
+  must enable them with ``-machine secure=on`` and ``-machine
+  virtualization=on``
+- QEMU provides 4 virtio-mmio virtio transports; these start at
+  address ``0x10013000`` for ``vexpress-a9`` and at ``0x1c130000`` for
+  ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
+  provided on the command line then QEMU will edit it to include
+  suitable entries describing these transports for the guest.
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index d1196cbe01c..4779293d731 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -73,6 +73,7 @@ undocumented; you can get a complete list by running
    arm/integratorcp
    arm/realview
    arm/versatile
+   arm/vexpress
    arm/musicpal
    arm/nseries
    arm/orangepi
diff --git a/MAINTAINERS b/MAINTAINERS
index 1f84e3ae2c6..74cff1c3818 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -826,6 +826,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/vexpress.c
+F: docs/system/arm/vexpress.rst
 
 Versatile PB
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.20.1

