Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1979690ejb;
        Tue, 23 May 2023 08:57:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5BM+udjK44+z+36ClVw3xCg9x/oCFRIh1c8AbLsLQVrN7yVgN4cLwm3Flu8vphygMV+AqN
X-Received: by 2002:ac8:5b95:0:b0:3f6:a807:c9b1 with SMTP id a21-20020ac85b95000000b003f6a807c9b1mr16851759qta.6.1684857445095;
        Tue, 23 May 2023 08:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684857445; cv=none;
        d=google.com; s=arc-20160816;
        b=ixFDVY2IU62nWwJMKB9fcRGjUAD/dzwI5hFfZm9Awv5leTolSfa8BIEbwn5l40HyLz
         RCw5W26wClSmSS8FtG/i4sUV4pi4cNHTlp8hSLQ0AErfBrKCnUgWMh/aMS+ZHgaaTYRN
         81LeYGUP4OlJEu7xtinBSvsEgLB7SELshusjbmYrEbhmPESxOT/yEoEpUGr1NH/ta7Lp
         SnfsIqwxbKb0hSCFKLUlV7UBQ4DaCSxitchoaLS/0/Fjd6aJkaBcxzhRPeLttWWl/18V
         7nKGtfQANtkbw9+5vDuIRE5ftpSr6AGu+0fwaIvumBRnSesA0ujLKA9kreAiWcsCGE8H
         8pqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=oYowmK0zeCSFuURYOdqODiItqwuD9nee6XSbuiEzw2M=;
        b=Q1XMtIoczhfptBjfiMbrweDPaTaz0D8q8MPOmqt5fwh+D+7KmHmPAlqmKUQCVDkvQ1
         l8jVWhciZVwBOz0okMRbQoxkh8g2ZL29BvQxrjGSIf90YCsBl/AOaPHo28VRUJ8HdfVs
         jW6yFyxyD1KsF6WEiUJc/mjWCmfpY9ABP3rmB+OVH2tTR3sBVM0D3Z1YYL8R8tzCMTTZ
         CBM0aApU1/sptNUFhSSgiOaSCBnCQeYY7O2+V7YpDvyIeIdkPhZh48wpDzZhUM0sFwpH
         3lqQ3uKh/wzwS1v2byhLivFoeLhwaaLgSQ0XcuB0Rbt8sBy+4El/8oJeIVRAYPDq/2f+
         FyHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5-20020ac87f45000000b003adff1955edsi5409772qtk.662.2023.05.23.08.57.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 08:57:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1UNe-0005ck-Hq; Tue, 23 May 2023 11:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1UNd-0005cS-9V; Tue, 23 May 2023 11:56:57 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1UNb-0000YF-6L; Tue, 23 May 2023 11:56:56 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 76A6E260BC6;
 Tue, 23 May 2023 17:56:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xqiAijcehyI1; Tue, 23 May 2023 17:56:50 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 07777260B85;
 Tue, 23 May 2023 17:56:49 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 2/2] docs: sbsa: document platform version changes
Date: Tue, 23 May 2023 17:56:44 +0200
Message-Id: <20230523155644.678524-2-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523155644.678524-1-marcin.juszkiewicz@linaro.org>
References: <CAFEAcA9GamGybSzd8FKBtmZ2qMgjRFy6D=Vhu1y0dL8m9Sa80w@mail.gmail.com>
 <20230523155644.678524-1-marcin.juszkiewicz@linaro.org>
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
X-TUID: 2OsWH/HOg6jt

We plan to start using sbsa-ref platform version fields
in DT so firmware does not have to use hardcoded values.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 docs/system/arm/sbsa.rst | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
index fea4992df2..fb17744e95 100644
--- a/docs/system/arm/sbsa.rst
+++ b/docs/system/arm/sbsa.rst
@@ -6,16 +6,35 @@ any real hardware the ``sbsa-ref`` board intends to look like real
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
 
+Platform versions
+"""""""""""""""""
+
+QEMU 7.1 brought support for "platform version major/minor" fields in
+DeviceTree.
+
+Version 0.0
+'''''''''''
+
+It is a static system that reports a very minimal DT to the firmware for
+non-discoverable information about components affected by the qemu
+command line (i.e. cpus and memory). As a result it must have a firmware
+specifically built to expect a certain hardware layout (as you would in
+a real machine).
+
+Version 0.1
+'''''''''''
+
+Additional data are provided in DT to the firmware:
+  - address and size of GIC Distributor
+  - address and size of GIC Redistributor
+
+Simple "/intc/reg" field is used.
+
 Supported devices
 """""""""""""""""
 
-- 
2.40.1

