Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1230312ejj;
        Tue, 26 Mar 2024 02:59:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjennsOeS+RY0a/H3GcnwSAuJ+cWIrmkabADzrvF2OIiX+LKBG8naWB56AirmhjjM3ZYgpVFSM4/w9E4GmbnrmHB9YAoqZ
X-Google-Smtp-Source: AGHT+IGzUGKb+SrqSTTjo/cYgq2XigAa3AEKqivU8KPslXRXt3uSTIuSjqzKMWUDqDbXQoka8Olv
X-Received: by 2002:a05:6102:a54:b0:478:224b:5aae with SMTP id i20-20020a0561020a5400b00478224b5aaemr3909718vss.11.1711447142072;
        Tue, 26 Mar 2024 02:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711447142; cv=none;
        d=google.com; s=arc-20160816;
        b=rYdUtGMJ/XDXw0kd6qR0GfSYO2GJMh+AsT5oZ0aK9WtPUeUPSV5MMx+qYjyjN3ksiM
         Gth8J9HCGBaHO4ecoPNalGjBT+yflOvbeQryzBYttLuImR7NFmrIV4t7xk8xpQoZDI7M
         GRwxAzod3xmCi/RTvmjjFfiuscdG2tQcF1BaO33DRlektToUW2QvykDFXqTISz7mWMxU
         izZtQWaFCzXRwTFXasWp7Sxyx611JQxxQiPPv1LOBgLLKnlxMaeuHUZBl3eMR0w+Huel
         b7yj/JHpS76IddWFqQ1va1QBGzSeBSxI8WDzALU0QIlUhGEBq8dfTxAJ+kyiyJfHgohx
         AiZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=0mxtlu97/XgQPtt7r5KlRECWH3AR6iva2FvmAF+pzuc=;
        fh=mEZyouRtxfiyfuPooUBunR13dbh3J4hBhCqVSpYjthI=;
        b=Y2HcBczslHaK15FCk3TWn6Ec14oZ2wIKp7fjkce49uoatwBXRFeCFvPpFskXw62CCs
         hLhC/J6JDPRpOvWrQq484cxuLPJgx6FsHw4i1C3155MXBxmmvfkYjKVTI1sFO3lgDWDq
         rPRHsmPM8TAJJLjwbzZIdm++s+lefaBLocrL3crzwvVtUHijtM/rU7MvzQH86DcwcQKR
         dTJafKb05Njj3CtQ5DZW5bouKWdLpQQKtmOWktRd3o71AlgIGiXrPP+8PmSnhqOmlRpl
         dZw0MO9BDfNXI2TyGO3cfpwIh2bHlQhD9jEU/VZR/MhoYqrUDilQWabpqgLbRZwnJYdy
         UBWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oq31-20020a05620a611f00b00789e28bd8b7si6973324qkn.728.2024.03.26.02.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 02:59:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rp3a2-00039m-H6; Tue, 26 Mar 2024 05:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rp3Zl-0002xa-3l; Tue, 26 Mar 2024 05:58:38 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1rp3Zj-0007R0-CV; Tue, 26 Mar 2024 05:58:36 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 4E0AD2610DF;
 Tue, 26 Mar 2024 10:58:31 +0100 (CET)
X-Virus-Scanned: Debian amavis at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavis, port 10024)
 with ESMTP id gEVyC9WYKWfv; Tue, 26 Mar 2024 10:58:29 +0100 (CET)
Received: from applejack.lan (83.11.22.169.ipv4.supernova.orange.pl
 [83.11.22.169])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 8144A260259;
 Tue, 26 Mar 2024 10:58:27 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 1/1] docs: sbsa: update specs, add dt note
Date: Tue, 26 Mar 2024 10:58:19 +0100
Message-ID: <20240326095819.1268062-1-marcin.juszkiewicz@linaro.org>
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
X-TUID: 93zzReB4sVAI

Hardware of sbsa-ref board is nowadays defined by both BSA and SBSA
specifications. Then BBR defines firmware interface.

Added note about DeviceTree data passed from QEMU to firmware. It is
very minimal and provides only data we use in firmware.

Added NUMA information to list of things reported by DeviceTree.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 docs/system/arm/sbsa.rst | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
index bca61608ff..d4d1f2efe3 100644
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
@@ -35,16 +39,31 @@ includes both internal hardware and parts affected by the qemu command line
 (i.e. CPUs and memory). As a result it must have a firmware specifically built
 to expect a certain hardware layout (as you would in a real machine).
 
+Note
+''''
+
+QEMU provides us with minimal information about hardware platform using
+minimalistic devicetree. This is not a Linux devicetree. It is not even a
+firmware devicetree.
+
+It is information passed from QEMU to describe the information a hardware
+platform would have other mechanisms to discover at runtime, that are affected
+by the QEMU command line.
+
+Ultimately this devicetree will be replaced by IPC calls to an emulated SCP.
+And when we do that, we won't then have to rewrite Normal world firmware to
+cope.
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
@@ -70,4 +89,4 @@ Platform version changes:
   GIC ITS information is present in devicetree.
 
 0.3
-  The USB controller is an XHCI device, not EHCI
+  The USB controller is an XHCI device, not EHCI.
-- 
2.44.0

