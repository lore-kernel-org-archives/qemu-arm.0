Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2479935ejb;
        Wed, 24 May 2023 04:34:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ72FYIK9tVHD9omSbiRMQmGI1dG+S+sin1aHKa7D3r8jJAHwBkcDbzMQlTqVQDksdCtU8yP
X-Received: by 2002:a05:6214:20a4:b0:623:74d2:8750 with SMTP id 4-20020a05621420a400b0062374d28750mr26559065qvd.17.1684928062468;
        Wed, 24 May 2023 04:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684928062; cv=none;
        d=google.com; s=arc-20160816;
        b=SHCOOQKrDFPUlKOCyvaCyh0ftTdfzYg+bT+eucLzR6Hm0avkrIXD9BZirfdeA0B6tt
         0cfy/xkj/ycz3Cqy8L+pmhipZdGBpA5lciFzbw+O73dzkeAShbX+i3MW3jbSPlII3rSf
         Ii4VIPkUchigVioe0jdfQ9XD9Da1aIdgqfTgM+0oEIwk/VE2d82Fzj+rpplmrpapeTrC
         vR92odr+Yt8sp+5Iz6+VZ9J8ug4VudmFsvcyLQ9PxjzscxgsdNYKHGjT3xqnYVFDAWRS
         YXXb00wEqkaJhPsWrCqnidpFD5UcFKPaAFd0c1fRikCeQWvbzeYq5nmrLfHXnu+40LKl
         WFpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=qUjTF89z44rNM3coEMcwX6S2MayNcoDCperIVSibzug=;
        b=PN9XTWRWdeMlVoRXqUmyllJ1Itzlx1N99zeNVDrITm5T4EUfHe9peD9uN4ViebR65h
         6JzTdy8HYiMfVEEI+JZ8Loa1eIJrusKavXMiIPG8ZIRGwuZYo/9onNmtHEhttohrMp8M
         S5OUkEkJnuhjxSvqMKIGaILnOIorVdoNlGNAojmdcgJYS3dNJFbl8+E4r+zN3/Ot1Byp
         5oXfbKP4/axTKNAuJFQXjkbpjySIhSNgQ5tDuN20VfShWPW3tBKwIWY7pNasYp19H/2Z
         8MCv+3Pq2K75nLQ1UobhtPoXHH2ZpTvgqhR9SgHkxauJWk85U39RRJliX9DiOuZ1g9KX
         W9jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4-20020ad45c44000000b0057116a70032si6947448qva.495.2023.05.24.04.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 04:34:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1mk9-0005sW-Dr; Wed, 24 May 2023 07:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1mk7-0005qm-Ox; Wed, 24 May 2023 07:33:23 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1mk6-0002XX-0a; Wed, 24 May 2023 07:33:23 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 7D5552609C0;
 Wed, 24 May 2023 13:33:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5dJK8hCFjIfr; Wed, 24 May 2023 13:33:17 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id F35C3260B8B;
 Wed, 24 May 2023 13:33:15 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v3 3/4] docs: sbsa: document platform version changes
Date: Wed, 24 May 2023 13:33:08 +0200
Message-Id: <20230524113308.834675-4-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524113308.834675-1-marcin.juszkiewicz@linaro.org>
References: <20230524113308.834675-1-marcin.juszkiewicz@linaro.org>
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
X-TUID: 02HTXvwPnCLW

We plan to start adding more system information in DT so firmware does
not have to use hardcoded values.

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

