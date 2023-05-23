Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2038622ejb;
        Tue, 23 May 2023 10:29:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5YC2+F+diA8eX2wo1Y67ytk7X7/699R8C+fRFovmydK1fJCob+0xsL+gCTw02WIQpFBRsf
X-Received: by 2002:a05:620a:2728:b0:75b:23a0:d9ea with SMTP id b40-20020a05620a272800b0075b23a0d9eamr4858150qkp.64.1684862972653;
        Tue, 23 May 2023 10:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684862972; cv=none;
        d=google.com; s=arc-20160816;
        b=JYBrmL4EeJkxaaKpIwHEd54hHKQ9ejmR31+YWpv3R9xjtkDW5f0xJL1W+TTAqXze5J
         SDUMyOEZZZpfX7QmZ/hP2Ray9ZlXDl002/WT4E2+FHqXkfXOavj30bsuDAWuPiv7cOF+
         8BRKzR9cmrcB3cJqTaC7dsCOkPZrGxtrBRwqiKMGW4lumkbyf36UFbUlx+Y4kxoAzvLc
         v/G9eVauQORL0f7u1ulLv5rderc31VKkgGMCac6yyKEImqjzeeghyplBTeJg8Pdc3IFL
         /vbeeqIZMU1fCt6ha6q0/spjc0tW0M+gHg7spNOImpbvAY2VYhKeoaVGux5n9OLENf5g
         O9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=/68p9XaOvWPqPjwqmRIeLXcAnn3ICXc3EtcvDlCj9xU=;
        b=bopgObHH8z+5GAyQxDBILSKIK3CYA1cppO2LYikhE5MR4Gb7ux/J48pNcR31WaxqrZ
         9f0LzPV//Cfgd8x7kzq+P6bpLJmTQJOHYW1cQ12SNWODoJmiwggbZdV+f8lYGkd1atYd
         9q9Qt1deNi4Cc6pUmXnJKEe6NqIWAoTxH7jnRLcG2VHoYdjXcDM5T7QLWZXwIW0xrzMv
         qEduiEejSlcczBO3YfIlbSI3MQuXRNvphjwWykTMwNODjS19KDssIZfd2N4XmLO/nqwY
         vRD7SqD8jj0o6GEb4zCq/F9i7baQPm8wu1T51B5IgdWSYciFUNnlyHdjnSFcPwGPBhIx
         ptng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k25-20020ae9f119000000b0075b03bdb587si4183662qkg.313.2023.05.23.10.29.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 10:29:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1Voq-0001hl-S4; Tue, 23 May 2023 13:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1Vom-0001fy-11; Tue, 23 May 2023 13:29:04 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1Vok-0006rb-9s; Tue, 23 May 2023 13:29:03 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id DBCCA260BC8;
 Tue, 23 May 2023 19:28:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LjOCCkUvzGKz; Tue, 23 May 2023 19:28:57 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 25726260B85;
 Tue, 23 May 2023 19:28:57 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2 2/3] docs: sbsa: document platform version changes
Date: Tue, 23 May 2023 19:28:54 +0200
Message-Id: <20230523172855.679018-2-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523172855.679018-1-marcin.juszkiewicz@linaro.org>
References: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <20230523172855.679018-1-marcin.juszkiewicz@linaro.org>
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
X-TUID: ZrjiPcjgg4Qi

We plan to start using sbsa-ref platform version fields
in DT so firmware does not have to use hardcoded values.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 docs/system/arm/sbsa.rst | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
index 016776aed8..922a29700d 100644
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

