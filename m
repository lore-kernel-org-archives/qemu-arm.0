Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1258074ejv;
        Thu, 28 Mar 2024 09:39:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWg9Feogl89tFLM3OizJDsyTCkMWtaUb3/ehld1AGTjhldmQo5cZ5LRmlFo4UowPD0SlujMw2EaqjI5EvLoNsXiWJM+0FYI
X-Google-Smtp-Source: AGHT+IG40AGO9GOGJ067T8Fouinp/hHHVMzGC6EtRefdDoQZcH9X9yvKrlUDeB3Ce2CTorPbetJw
X-Received: by 2002:a05:620a:24c4:b0:78a:34be:655e with SMTP id m4-20020a05620a24c400b0078a34be655emr3964223qkn.36.1711643982430;
        Thu, 28 Mar 2024 09:39:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643982; cv=none;
        d=google.com; s=arc-20160816;
        b=sWGdkJrBXbOmOPVexEhtTptRHY0LR4u3kQgi3jp0H/FPDNCkxfNwfSehn7eexYbsB7
         B8WoGQKmMO83rXDyZiI0zRkCdYrI+jDgm9SBN3fWlOi0U5sCsyC7F+rE+uMDEI7DTo6l
         vNy+Te8Fvusnarh0XIO1wMSOunlGojrNnSgJdtcKJkG6hGDeySph7OyYtrY/Fwx6JPu8
         66go3MTIBD2hR0jdtfpLTmwBijjo4grh2DpR06OCWucGi7sJYwDkW4t/bJV1CuSBlqZ/
         YWs8IoMMm5NdY4CxfxEDefQxObtHyde1RN23ilAxnbX9JAgvNRDkFiYhJg4Wi1asDvxM
         id3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=vTfoCqm8IVvO3K0QLln0b2QSZ9galsk6SsAbcDclhmE=;
        fh=mEZyouRtxfiyfuPooUBunR13dbh3J4hBhCqVSpYjthI=;
        b=in7JffLkfUXbl62NL9PeRXtCI2M5DXfLWYs8VxlClmPhx810kAvQwnOOeYUNu/3otx
         gHX1bwnTHfR4LWgNap83DyTdCi9pFyIrBK2uG/EOq10nMDucmlay0SgA9T4pSzmUxEnv
         w+cqzLWvTZAz/kpWIA+7ZZj4jHPjpV7tPiD0eSIICr5ve7LWIcmjAU0kd9Ch3vqAzUju
         2GLKBbGMckGKD7Vp8mzR1E9FZMoz22dXUUeZ8AfcHTcgJcruqfqY24N37j7JYrz/O166
         l4q1TDUaSvJrMEIMpBiEnYOEFXpyqyVvAeyJLxONxLH0wdS/GJRKUHkLK5qkRNjp4anV
         7qjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z16-20020a05620a08d000b0078bc201504csi880831qkz.774.2024.03.28.09.39.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 09:39:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpsmT-0006av-3D; Thu, 28 Mar 2024 12:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rpsmR-0006aR-U2; Thu, 28 Mar 2024 12:39:07 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rpsmQ-0003JZ-1E; Thu, 28 Mar 2024 12:39:07 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id F30CB260836;
 Thu, 28 Mar 2024 17:39:01 +0100 (CET)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id TWqNmQbt-Rtw; Thu, 28 Mar 2024 17:38:59 +0100 (CET)
Received: from applejack.lan (83.11.22.169.ipv4.supernova.orange.pl
 [83.11.22.169])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 60F1A2600D1;
 Thu, 28 Mar 2024 17:38:59 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 1/1] docs: sbsa: update specs, add dt note
Date: Thu, 28 Mar 2024 17:38:51 +0100
Message-ID: <20240328163851.1386176-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
X-TUID: eg0n29+Gsd+l

Hardware of sbsa-ref board is nowadays defined by both BSA and SBSA
specifications. Then BBR defines firmware interface.

Added note about DeviceTree data passed from QEMU to firmware. It is
very minimal and provides only data we use in firmware.

Added NUMA information to list of things reported by DeviceTree.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 docs/system/arm/sbsa.rst | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
index bca61608ff..2bf22a1d0b 100644
--- a/docs/system/arm/sbsa.rst
+++ b/docs/system/arm/sbsa.rst
@@ -1,12 +1,16 @@
 Arm Server Base System Architecture Reference board (``sbsa-ref``)
 ==================================================================
 
-While the ``virt`` board is a generic board platform that doesn't match
-any real hardware the ``sbsa-ref`` board intends to look like real
-hardware. The `Server Base System Architecture
-<https://developer.arm.com/documentation/den0029/latest>`_ defines a
-minimum base line of hardware support and importantly how the firmware
-reports that to any operating system.
+The ``sbsa-ref`` board intends to look like real hardware (while the ``virt``
+board is a generic board platform that doesn't match any real hardware).
+
+The hardware part is defined by two specifications:
+
+  - `Base System Architecture <https://developer.arm.com/documentation/den0094/>`__ (BSA)
+  - `Server Base System Architecture <https://developer.arm.com/documentation/den0029/>`__ (SBSA)
+
+The `Arm Base Boot Requirements <https://developer.arm.com/documentation/den0044/>`__ (BBR)
+specification defines how the firmware reports that to any operating system.
 
 It is intended to be a machine for developing firmware and testing
 standards compliance with operating systems.
@@ -35,16 +39,29 @@ includes both internal hardware and parts affected by the qemu command line
 (i.e. CPUs and memory). As a result it must have a firmware specifically built
 to expect a certain hardware layout (as you would in a real machine).
 
+Note
+''''
+
+QEMU provides the guest EL3 firmware with minimal information about hardware
+platform using minimalistic devicetree. This is not a Linux devicetree. It is
+not even a firmware devicetree.
+
+It is information passed from QEMU to describe the information a hardware
+platform would have other mechanisms to discover at runtime, that are affected
+by the QEMU command line.
+
+Ultimately this devicetree may be replaced by IPC calls to an emulated SCP.
+
 DeviceTree information
 ''''''''''''''''''''''
 
-The devicetree provided by the board model to the firmware is not intended
-to be a complete compliant DT. It currently reports:
+The devicetree reports:
 
    - CPUs
    - memory
    - platform version
    - GIC addresses
+   - NUMA node id for CPUs and memory
 
 Platform version
 ''''''''''''''''
@@ -70,4 +87,4 @@ Platform version changes:
   GIC ITS information is present in devicetree.
 
 0.3
-  The USB controller is an XHCI device, not EHCI
+  The USB controller is an XHCI device, not EHCI.
-- 
2.44.0

