Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2714489njb;
        Mon, 17 Mar 2025 22:55:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXt8hGMPUWFVPA8YMmERQ7oYiZc9xT8aXXyvI6jD6SPj2woYthu89kjfeC2R5pvRBWonnq70hgLSPrlCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEJYZPCnGBEJIYxDcTkBh/mQ1FD8pTDOobc5alH9QyYvJOoMnFXpKsH26GJUujLwgNTYr3i
X-Received: by 2002:a5d:648a:0:b0:390:f460:77b0 with SMTP id ffacd0b85a97d-3971ddd9877mr14299960f8f.26.1742277310324;
        Mon, 17 Mar 2025 22:55:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742277310; cv=none;
        d=google.com; s=arc-20240605;
        b=kUYj6Y1/T0MWh/V/R/PiH5NbiLQWAenkQh8yYoHV3ZhmaqnhPp+HR1QJau0I7U5F+i
         iXH0ogcPP1kRUqHka5Ulz12QxRUFDv3WRwcNlP8HUpjdBdxRT0FJeeZL7xvDWb1CtvIu
         BOBgz65XjrHvCbdrTqPUNbMSDBOsjXUGflPLw8TssJ0W4LotUyfgKAhjDVLlSR2jtL5L
         cSbebU5cz0Nes1bELbfDy/Z1zFPfHZSLT6chOEPqT8eqG0bVPrvi7YdX/GbV5P9OVosw
         oQFLU4pRS0LEzVQME26ziwxkuuTsdR17ziXuy4X4QHWi4cluHjNERBdDZVxj00jeeBNQ
         ierQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=CE259BpaNvuidCqDkrVqSHZvjw0om3Zlq8id+yeozUQ=;
        fh=QN8IGD8aHW7xi1XYW6KCE2KBE2fihwpZprj60/ZjQag=;
        b=NkdJ2nvhgcKbsQEUXv9eT1kuZgbSqXqcF4ATrRgeSi8etxNAU2dYSbIffvtPMAOGfD
         +qr5GI/v8j58A0PAe64HIwZM0+5z2EPwFbRCWWE0peetEvdsY5fjg1Eih2dlXFZ384cF
         CZKJSXZja8i7MSEYAbZVBbotc6vfEaqPdDDSmo6qmO9kC5JT7FsH3lA+t+8tWZ1YSYpw
         rIyMrC6xJ11CHTy3tKJB+WWgn77q6qKKJNE6L1hikL4fV7YbvseYfrsi1GtbPf/ADMDb
         tP7M9VxWaYmusul0LQLXm6mVONccAbAlYH7sexKnwp486i9cfuA4/PXbv5gfApTZQZMi
         g0lA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WthM2NXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-395c85a1098si10845284f8f.225.2025.03.17.22.55.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 22:55:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WthM2NXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuPuI-0005o2-8o; Tue, 18 Mar 2025 01:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tuPuH-0005na-6s
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 01:54:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tuPuF-0004BP-NJ
 for qemu-arm@nongnu.org; Tue, 18 Mar 2025 01:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742277265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=CE259BpaNvuidCqDkrVqSHZvjw0om3Zlq8id+yeozUQ=;
 b=WthM2NXn9YedVzmCQtlDW00cBRC8OQK/NLSQXaAdvUeWdVFhZAMOogedDhADr5zQlHkFXt
 gQ5y/7h+IltDaRUAJz9f3J2e+1I2SSkEWE1eNg6mihR1+e7E9usCaGTn8eZy4uEHoZkkcA
 HrSkIVkWrKhzEGquKbr7Qur++tFHamc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-227-O0-sr1KmM8eJDcjUDJO5dw-1; Tue,
 18 Mar 2025 01:54:22 -0400
X-MC-Unique: O0-sr1KmM8eJDcjUDJO5dw-1
X-Mimecast-MFC-AGG-ID: O0-sr1KmM8eJDcjUDJO5dw_1742277261
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BD9C5195609F; Tue, 18 Mar 2025 05:54:20 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.224.69])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2940C1956095; Tue, 18 Mar 2025 05:54:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-arm@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>
Subject: [PATCH] docs/system: Use the meson binary from the pyvenv
Date: Tue, 18 Mar 2025 06:54:15 +0100
Message-ID: <20250318055415.16501-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.335,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ezRutYgmSkz7

From: Thomas Huth <thuth@redhat.com>

To avoid problems with the meson installation from the host
system, we should always use the meson from our venv instead.
Thus use this in the documentation, too.

While we're at it, also mention that it has to be run from
the build folder (in the igb.rst file; the other two files
were already fine).

Suggested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/arm/bananapi_m2u.rst | 2 +-
 docs/system/arm/orangepi.rst     | 2 +-
 docs/system/devices/igb.rst      | 5 +++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/docs/system/arm/bananapi_m2u.rst b/docs/system/arm/bananapi_m2u.rst
index d30db8d04c3..6efa222c16f 100644
--- a/docs/system/arm/bananapi_m2u.rst
+++ b/docs/system/arm/bananapi_m2u.rst
@@ -136,4 +136,4 @@ provide the following command:
 
   $ cd qemu-build-dir
   $ QEMU_TEST_ALLOW_LARGE_STORAGE=1 \
-    meson test --suite thorough func-arm-arm_bpim2u
+    pyvenv/bin/meson test --suite thorough func-arm-arm_bpim2u
diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
index 8b9448ca7b0..716062fca9c 100644
--- a/docs/system/arm/orangepi.rst
+++ b/docs/system/arm/orangepi.rst
@@ -262,4 +262,4 @@ provide the following command from the build directory:
 .. code-block:: bash
 
   $ QEMU_TEST_ALLOW_LARGE_STORAGE=1 \
-    meson test --suite thorough func-arm-arm_orangepi
+    pyvenv/bin/meson test --suite thorough func-arm-arm_orangepi
diff --git a/docs/system/devices/igb.rst b/docs/system/devices/igb.rst
index 9145af5c757..71f31cb1160 100644
--- a/docs/system/devices/igb.rst
+++ b/docs/system/devices/igb.rst
@@ -57,11 +57,12 @@ directory:
   meson test qtest-x86_64/qos-test
 
 ethtool can test register accesses, interrupts, etc. It is automated as an
-functional test and can be ran with the following command:
+functional test and can be run from the build directory with the following
+command:
 
 .. code:: shell
 
-  meson test --suite thorough func-x86_64-netdev_ethtool
+  pyvenv/bin/meson test --suite thorough func-x86_64-netdev_ethtool
 
 References
 ==========
-- 
2.48.1

