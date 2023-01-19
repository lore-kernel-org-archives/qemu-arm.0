Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp296919ejc;
        Thu, 19 Jan 2023 04:37:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvyBfDyg+O/BrPZZq2T4n5cTCl6eTt3N5lKaCGRJZv/44Viw6f3q/3QleLcI/7lJ2CMTTkC
X-Received: by 2002:a67:f88c:0:b0:3d0:d44f:c023 with SMTP id h12-20020a67f88c000000b003d0d44fc023mr5807167vso.23.1674131829841;
        Thu, 19 Jan 2023 04:37:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131829; cv=none;
        d=google.com; s=arc-20160816;
        b=QYe629zlkEcJI2H723lsrvmA0l4AmFijgU5uUzx83TGzkHcY3Tj4GSd4H/Vh0vjGAI
         /yV1IfJkPfXq4FRXcmyBtwCrc3lKo8OZ3D2VGqsaG/mv/vHxOUGNs+rwLw60TlPdXZDW
         zRY+QfihCtOQeXwgzGNa+BoYgptJtNoJ4xa0uWQspjR5oNaUPDJcqyRdFnPpJ+KQH1Aw
         KlsZjtUdp5UF+/sCgiVj5fdPSdhsKHudIgamIVkYVTLMFbFciOX+ST0rsyWBzU+LsA2K
         hdzEXPg2ewtSiipLzr2Oa6Uag0ranHBM3j/VlswJ60xRcyFcnEk8Wv0l5IEpjr+9yQR/
         D/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=lTA18JeV+pK1gHYXyKZqXai6WukMgtEGQdVpb1sNKDI=;
        b=EW1SqY8/2e3QrMTNYpGpQiy6Msn8b3YeIUDpAzHPKsbNbd7nLsRaCBWQS5ENHoNpsM
         bpPi0uMeDLWZrJ5T0drdljHwHaYjc6aXgPzZJxnCS0Vo/0XlW62AMS4UFUHqToPw/dOK
         LIid7+ezdMO2agStMOgYaa7yUyYn95GmiVDhA8aR7KkBcgCqDe85zpaIlQ9oH9fR+VW8
         wsUJVhcmSqDw+oKKTk9V7gB/Cvv9CJwk/B1Mt8QWGB61nlEVtqnwOQlLi4OL63sFYFyu
         1bTFAsCXL/staDTeEolbPavvheWAmYtHRqIZzgOrjaZZ0GAcV/Xdq6SqfrKJ4SmsRKaR
         EB1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020ae9ee07000000b007060e6e7f3asi12399423qkg.180.2023.01.19.04.37.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 04:37:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIU8c-0006LM-G5; Thu, 19 Jan 2023 07:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8W-0006Ic-8M; Thu, 19 Jan 2023 07:35:20 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU8U-0007Vb-DH; Thu, 19 Jan 2023 07:35:19 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMXg4Q8rz4xyK;
 Thu, 19 Jan 2023 23:35:15 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMXd48zxz4xN4;
 Thu, 19 Jan 2023 23:35:13 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 04/25] avocado/boot_linux_console.py: Update ast2600 test
Date: Thu, 19 Jan 2023 13:34:28 +0100
Message-Id: <20230119123449.531826-5-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: H5dZIn3WNMBp

From: Joel Stanley <joel@jms.id.au>

Update the test_arm_ast2600_debian test to

 - the latest Debian kernel
 - use the Rainier machine instead of Tacoma

Both of which contains support for more hardware and thus exercises more
of the hardware Qemu models.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220607011938.1676459-1-joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/boot_linux_console.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 8c1d981586..f3a1d00be9 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -1098,18 +1098,18 @@ def test_arm_vexpressa9(self):
     def test_arm_ast2600_debian(self):
         """
         :avocado: tags=arch:arm
-        :avocado: tags=machine:tacoma-bmc
+        :avocado: tags=machine:rainier-bmc
         """
         deb_url = ('http://snapshot.debian.org/archive/debian/'
-                   '20210302T203551Z/'
+                   '20220606T211338Z/'
                    'pool/main/l/linux/'
-                   'linux-image-5.10.0-3-armmp_5.10.13-1_armhf.deb')
-        deb_hash = 'db40d32fe39255d05482bea48d72467b67d6225bb2a2a4d6f618cb8976f1e09e'
+                   'linux-image-5.17.0-2-armmp_5.17.6-1%2Bb1_armhf.deb')
+        deb_hash = '8acb2b4439faedc2f3ed4bdb2847ad4f6e0491f73debaeb7f660c8abe4dcdc0e'
         deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash,
                                     algorithm='sha256')
-        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.10.0-3-armmp')
+        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.17.0-2-armmp')
         dtb_path = self.extract_from_deb(deb_path,
-                '/usr/lib/linux-image-5.10.0-3-armmp/aspeed-bmc-opp-tacoma.dtb')
+                '/usr/lib/linux-image-5.17.0-2-armmp/aspeed-bmc-ibm-rainier.dtb')
 
         self.vm.set_console()
         self.vm.add_args('-kernel', kernel_path,
-- 
2.39.0

