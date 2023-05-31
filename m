Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp114846ejb;
        Wed, 31 May 2023 10:19:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4VDe6jEAAhIy0wjY7wYGgqeW+SgeNtxlMWp/rbya/Kz42DmI3TJrgphfWgNnPdVFEOQYr2
X-Received: by 2002:a05:620a:271a:b0:75b:23a0:e7e4 with SMTP id b26-20020a05620a271a00b0075b23a0e7e4mr6291446qkp.69.1685553540238;
        Wed, 31 May 2023 10:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685553540; cv=none;
        d=google.com; s=arc-20160816;
        b=j9CyZskTTowfYcYHEDLZ34sX1QRx7rxWM4VJtzNf2i78kvFE3iePpXawL2596a8guz
         XM8UVuCUGqUuHsmRuirxrdbl/uA7mFBcR1eEuhxUccqyQqnbiRs+RXMpnq+QSo+4p3tk
         jspkT1f/b2iuJXpcMtzIKpqqTdz93EElY5m8CEKB4euH0r0pk5ws0b1fkOss9lw5QNCp
         AhqgUDUkYFwRznRg5C6cECfWoETyGiXuXU7mJ8+gNBIUhhs1ZtXkkdvbnEckIf5tZk81
         d/h97WL1d15Q1/BFFaI+5SaAbqvHJmXr+kl7pZ5ZxvjG2PKFk2ABjY1EYcsbKtw843vk
         6Jww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=snbbRB4ema03X4hq1n+2qKekRsjOk1/KvEUZ5OyV9WY=;
        b=05I1/Isa5yOoSreIkrSAzbhjMoUS1sTjRsFxQvo1fsJHiaRnVmJOSuOPZxOORutdbm
         1HeUH/+xjSblbfDorgE9RQww+Fv0eLeGe82mPxEanJ6oE5N42BvU2ceHL+4WwNNIBSYO
         qvt4vjLfH5KuvvZLUiol8hyPnpyD+RsWeNz0de+yAoltsGcXPKbj7+cSRhb8mdNVIj9m
         FWmTXsHqGuAWrQIy7BupYznsUjMSYnwh1rhQLxTa9BBGQ4jOZHoiKCb8pPhzCh4szu0e
         2WXZhdcq5JjoklIHc/VAjTAsQ5wuUQk92dyJmvLNkenHR6knRF/+8JaSQqnqlv86JZPR
         c5Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi20-20020a05620a379400b0075ba62aa25fsi8508997qkn.616.2023.05.31.10.19.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 10:19:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4PTK-0007fR-Ke; Wed, 31 May 2023 13:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q4PTJ-0007ez-7a; Wed, 31 May 2023 13:18:53 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q4PTG-0006we-LO; Wed, 31 May 2023 13:18:52 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id B892A260B95;
 Wed, 31 May 2023 19:18:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wpi0D7Bo9RB0; Wed, 31 May 2023 19:18:44 +0200 (CEST)
Received: from applejack.lan (83.21.93.182.ipv4.supernova.orange.pl
 [83.21.93.182])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 949E7260078;
 Wed, 31 May 2023 19:18:43 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/1] docs: sbsa: document board to firmware interface
Date: Wed, 31 May 2023 19:18:34 +0200
Message-Id: <20230531171834.236569-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=no autolearn_force=no
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
X-TUID: xekpY+HL9od6

We plan to add more hardware information into DeviceTree to limit amount
of hardcoded values in firmware.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 docs/system/arm/sbsa.rst | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
index 016776aed8..c5b3342b52 100644
--- a/docs/system/arm/sbsa.rst
+++ b/docs/system/arm/sbsa.rst
@@ -6,12 +6,7 @@ any real hardware the ``sbsa-ref`` board intends to look like real
 hardware. The `Server Base System Architecture
 <https://developer.arm.com/documentation/den0029/latest>`_ defines a
 minimum base line of hardware support and importantly how the firmware
-reports that to any operating system. It is a static system that
-reports a very minimal DT to the firmware for non-discoverable
-information about components affected by the qemu command line (i.e.
-cpus and memory). As a result it must have a firmware specifically
-built to expect a certain hardware layout (as you would in a real
-machine).
+reports that to any operating system.
 
 It is intended to be a machine for developing firmware and testing
 standards compliance with operating systems.
@@ -19,7 +14,7 @@ standards compliance with operating systems.
 Supported devices
 """""""""""""""""
 
-The sbsa-ref board supports:
+The ``sbsa-ref`` board supports:
 
   - A configurable number of AArch64 CPUs
   - GIC version 3
@@ -30,3 +25,22 @@ The sbsa-ref board supports:
   - Bochs display adapter on PCIe bus
   - A generic SBSA watchdog device
 
+
+Board to firmware interface
+"""""""""""""""""""""""""""
+``sbsa-ref`` is a static system that reports a very minimal DeviceTree to the
+firmware for non-discoverable information about system components. This
+includes both internal hardware and parts affected by the qemu command line
+(i.e. cpus and memory). As a result it must have a firmware specifically built
+to expect a certain hardware layout (as you would in a real machine).
+
+DeviceTree information
+'''''''''''''''''''''''
+
+Provided DeviceTree is not intended to be a complete compliant DT. Only
+minimal subset is provided:
+
+   - cpus
+   - memory
+   - platform version
+   - GIC addresses
-- 
2.40.1

