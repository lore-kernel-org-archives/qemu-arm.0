Received: by 2002:a17:906:cc9:b0:a28:7ef3:d049 with SMTP id l9csp622768ejh;
        Wed, 3 Jan 2024 09:28:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCIWs3/jGX+B6gmb+OnipQxgQ7v1HVOZJAN9C+36mlI6rlHSc/ufO8d8NWAlQrNhiuadi1
X-Received: by 2002:a05:6830:13c9:b0:6d9:e320:2316 with SMTP id e9-20020a05683013c900b006d9e3202316mr14813853otq.0.1704302928759;
        Wed, 03 Jan 2024 09:28:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704302928; cv=none;
        d=google.com; s=arc-20160816;
        b=IHqeVcDm7UGZu1cQkv7IMQkbUYPamMu3/iCln/Iz4VFW6Kaj7BlYxXLliAysL8w/rU
         IIPJ29P5OaMlGVSvZPr39L6fUER2d1icJV8SxtPJFGkSJ/7DvUxVRzX08Bi3e3a6l94Y
         ii1o4Km+0WIzI73wQzimKurbDYP9GPv4oPq1bgjGBT8sBDon2s6u3a9wA6BbbXnbYGUl
         OXtmPZbSQd3VIa2Egx5CtleHfBC20Q6I16KXTfIVFDmaJ8tk7PSGZcpyZxto76oz+VVh
         Mq/pspS2xvATBoHt+1AzNDmIYOB1+SgGHZ+cBgT9EOamoEp+NZ7BZ/d/GSDA4JV27Z8s
         G81w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=N6hb9mQzro5xMtBLrZrLT4hGAhhufdbiPXtbwSNiuCE=;
        fh=QNLEvrOw3mAjJFt6jW7FC2Bwi173pi9GOXb+vWcp/Fg=;
        b=bQg+W/CfjNVwiAkGmdfqAhRFpFJRlXOJ5yml0zPuaImQ7HrzTAAfuurN0eMdm2nbPn
         84PRpeeF2rSQ/MlXKxKaLywfcWkBt5AcbL5ENw4mWQXlGvjchmdmuerBLqfOSZEoOuKw
         67YJEq/BdklsepYjQSAmDMh9jW/aEzP/Mm9fL6djpzWPsjSVZnyuF0av7gvxPEtMjCVR
         uDdr2uSvDTlxv/mQrIIfIvfyaIQHdatIUpVBbpK4tlna7T03OJvwXFq6VNebWRQU0c9I
         uKnflMOmCBA6mlIDjVd0pr4g6ZhBv5POiYwIfkPp29ejYhCSpHh5LL8MEhP+qo/fDXKi
         p/Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020ac87d4b000000b004281e729016si7289894qtb.367.2024.01.03.09.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jan 2024 09:28:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rfc1149.net
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rL52Y-0000vn-Ga; Wed, 03 Jan 2024 12:28:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rL52X-0000v8-0d; Wed, 03 Jan 2024 12:28:25 -0500
Received: from zoidberg.rfc1149.net ([195.154.227.159])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sam@rfc1149.net>)
 id 1rL52U-0000WM-RU; Wed, 03 Jan 2024 12:28:24 -0500
Received: from buffy.. (buffy [192.168.147.6])
 by zoidberg.rfc1149.net (Postfix) with ESMTP id 3A59C80024;
 Wed,  3 Jan 2024 18:28:19 +0100 (CET)
Authentication-Results: zoidberg.rfc1149.net;
 dmarc=fail (p=none dis=none) header.from=rfc1149.net
Authentication-Results: zoidberg.rfc1149.net;
 spf=fail smtp.mailfrom=rfc1149.net
From: Samuel Tardieu <sam@rfc1149.net>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Vikram Garhwal <fnu.vikram@xilinx.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Peter Maydell <peter.maydell@linaro.org>, Samuel Tardieu <sam@rfc1149.net>
Subject: [PATCH] docs: use "buses" rather than "busses"
Date: Wed,  3 Jan 2024 18:28:17 +0100
Message-ID: <20240103172817.2197737-1-sam@rfc1149.net>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.154.227.159; envelope-from=sam@rfc1149.net;
 helo=zoidberg.rfc1149.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: X87bZg10YRws

If "busses" might be encountered as a plural of "bus" (5 instances),
the correct spelling is "buses" (26 instances). Fixing those 5
instances makes the doc more consistent.

Signed-off-by: Samuel Tardieu <sam@rfc1149.net>
---
 docs/system/arm/palm.rst    | 2 +-
 docs/system/arm/xscale.rst  | 2 +-
 docs/system/devices/can.rst | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/system/arm/palm.rst b/docs/system/arm/palm.rst
index 47ff9b36d4..61bc8d34f4 100644
--- a/docs/system/arm/palm.rst
+++ b/docs/system/arm/palm.rst
@@ -14,7 +14,7 @@ following elements:
 -  On-chip Real Time Clock
 
 -  TI TSC2102i touchscreen controller / analog-digital converter /
-   Audio CODEC, connected through MicroWire and |I2S| busses
+   Audio CODEC, connected through MicroWire and |I2S| buses
 
 -  GPIO-connected matrix keypad
 
diff --git a/docs/system/arm/xscale.rst b/docs/system/arm/xscale.rst
index d2d5949e10..e239136c3c 100644
--- a/docs/system/arm/xscale.rst
+++ b/docs/system/arm/xscale.rst
@@ -32,4 +32,4 @@ The clamshell PDA models emulation includes the following peripherals:
 
 -  Three on-chip UARTs
 
--  WM8750 audio CODEC on |I2C| and |I2S| busses
+-  WM8750 audio CODEC on |I2C| and |I2S| buses
diff --git a/docs/system/devices/can.rst b/docs/system/devices/can.rst
index 0af3d9912a..09121836fd 100644
--- a/docs/system/devices/can.rst
+++ b/docs/system/devices/can.rst
@@ -1,12 +1,12 @@
 CAN Bus Emulation Support
 =========================
 The CAN bus emulation provides mechanism to connect multiple
-emulated CAN controller chips together by one or multiple CAN busses
-(the controller device "canbus"  parameter). The individual busses
+emulated CAN controller chips together by one or multiple CAN buses
+(the controller device "canbus"  parameter). The individual buses
 can be connected to host system CAN API (at this time only Linux
 SocketCAN is supported).
 
-The concept of busses is generic and different CAN controllers
+The concept of buses is generic and different CAN controllers
 can be implemented.
 
 The initial submission implemented SJA1000 controller which
-- 
2.42.0

