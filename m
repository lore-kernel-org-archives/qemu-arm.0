Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3845990njb;
        Tue, 10 Dec 2024 22:35:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWyBvds31qDfjzswqvR8cxi815JmitH8dCnEcH/RpA5HmziIMz53NN/hDX59T7AiqX6AQSI4IwjCwhmyg==@linaro.org
X-Google-Smtp-Source: AGHT+IE017/iXheFHf4T4fs2ZWm7d43avREWQdEaifMHJOKrdT+Yw9EZ2ELoYlEmlIvJ//8AWNDp
X-Received: by 2002:a05:622a:9013:b0:467:45f2:58b with SMTP id d75a77b69052e-467894dc99amr27490211cf.6.1733898903942;
        Tue, 10 Dec 2024 22:35:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733898903; cv=none;
        d=google.com; s=arc-20240605;
        b=Zl3ad8x3Hsy2MUlFvOYrX2Q43+LqfIRahWbPsA4NxPU1GR71XlMs90sE+6wiQno3Wq
         RLAMBm+DSlgFns0y6GOCbIft0O2g8e07EGVZ7h9H5DviT1qdrO+XNgfMuZj0hgRO83yD
         dfIL2DnfgbZTIUQ9sHDR3kHOn5SvcbRusZAxw4fnGskOSea7mgcVJhKC7zpeeBuZrnSh
         awp/0nGTMcFky2KOsyhh44nmUt8Ykxysmr/THekP+7EwzddgXiENqkdIELOSV2+I6Fhi
         MeAtgVrgpFt3YI4gCms6G9WmgkZ4oWeBNTWEmR7DH01ocGOS7GwupEYEhetwvIvimwLR
         xSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CNBqPx336DLTVky+zcW0GEcgKcrVHbF97M4lHBU9XJQ=;
        fh=dCqPeOMyJN6b1xLXHrHk9Vfv4bvn90zVm2nOfsHEFC8=;
        b=ewiExyOTP0VB3re7sXKZbxIZUZZWu93ls2uV4vH/NKtwm78C2PRx8fmqI7yM5UF6Ew
         L114FfE9ke7q8qAnd9c+nEok5cwzfhSS63kc/DGAgsCWpXQe7xE56/QRsNRaiGJtxD7L
         QQnUN8ZRPeP67Omnfo7QCALnH6VxkfdA3D8Ly/3Z0Fuc4B+cNqpWEpL0kqz/ZpObU3yC
         GgzmFZtjOXIEQq7OWNj14A9K9sv3Jyo/lGAtjDMrT4zMACUADyLpu2FFa+qat+Yv8CDW
         gF2ogpQ+W0Qxphg5ZpJAQojecmXAqoaSjbnBBJUmlBWvx93QY0qJIjTWn3cKwuduXP+Y
         iWvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z14tCNs4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4676d10bd5dsi54144751cf.521.2024.12.10.22.35.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 22:35:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z14tCNs4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLGHG-0006x1-7J; Wed, 11 Dec 2024 01:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGGD-0004la-Mw
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 01:31:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tLGGB-0008VK-JL
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 01:31:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733898701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CNBqPx336DLTVky+zcW0GEcgKcrVHbF97M4lHBU9XJQ=;
 b=Z14tCNs4autshh3a/aC9Rg799KE9AxG2vnJSW8yEJH+S+MZQW4motBhbKkT09vqyS/DKPS
 nr50VmIiHB6CPxCaZq22EKTAOxTxbBnhCvQDqweOaLB4iCh26fC2fez+SscIxMF0ckKNtE
 Fw+vykgqgNUK4Mj6joEbsH8s+U9MyKw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-7XpgGyhvNpWl24mNGD3Oxw-1; Wed,
 11 Dec 2024 01:31:37 -0500
X-MC-Unique: 7XpgGyhvNpWl24mNGD3Oxw-1
X-Mimecast-MFC-AGG-ID: 7XpgGyhvNpWl24mNGD3Oxw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CD57D1956048; Wed, 11 Dec 2024 06:31:36 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.144])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4D53C1956054; Wed, 11 Dec 2024 06:31:35 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 14/24] tests/functional: Move debian boot test from avocado
Date: Wed, 11 Dec 2024 07:30:48 +0100
Message-ID: <20241211063058.1222038-15-clg@redhat.com>
In-Reply-To: <20241211063058.1222038-1-clg@redhat.com>
References: <20241211063058.1222038-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.52,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: MkSkBIvfdQF2

This simply moves the debian boot test from the avocado testsuite to
the new functional testsuite. No changes in the test.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Link: https://lore.kernel.org/r/20241206131132.520911-8-clg@redhat.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/avocado/boot_linux_console.py         | 26 ---------------------
 tests/functional/test_arm_aspeed_rainier.py | 24 +++++++++++++++++++
 2 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 12e24bb05a75..738dd5a8c4bf 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -470,29 +470,3 @@ def test_arm_quanta_gsj_initrd(self):
         self.wait_for_console_pattern('CPU1: thread -1, cpu 1, socket 0')
         self.wait_for_console_pattern(
                 'Give root password for system maintenance')
-
-    def test_arm_ast2600_debian(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:rainier-bmc
-        """
-        deb_url = ('http://snapshot.debian.org/archive/debian/'
-                   '20220606T211338Z/'
-                   'pool/main/l/linux/'
-                   'linux-image-5.17.0-2-armmp_5.17.6-1%2Bb1_armhf.deb')
-        deb_hash = '8acb2b4439faedc2f3ed4bdb2847ad4f6e0491f73debaeb7f660c8abe4dcdc0e'
-        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash,
-                                    algorithm='sha256')
-        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.17.0-2-armmp')
-        dtb_path = self.extract_from_deb(deb_path,
-                '/usr/lib/linux-image-5.17.0-2-armmp/aspeed-bmc-ibm-rainier.dtb')
-
-        self.vm.set_console()
-        self.vm.add_args('-kernel', kernel_path,
-                         '-dtb', dtb_path,
-                         '-net', 'nic')
-        self.vm.launch()
-        self.wait_for_console_pattern("Booting Linux on physical CPU 0xf00")
-        self.wait_for_console_pattern("SMP: Total of 2 processors activated")
-        self.wait_for_console_pattern("No filesystem could mount root")
-
diff --git a/tests/functional/test_arm_aspeed_rainier.py b/tests/functional/test_arm_aspeed_rainier.py
index a60274926d6f..b856aea6dbd7 100644
--- a/tests/functional/test_arm_aspeed_rainier.py
+++ b/tests/functional/test_arm_aspeed_rainier.py
@@ -36,5 +36,29 @@ def test_arm_aspeed_emmc_boot(self):
         self.wait_for_console_pattern('mmcblk0: p1 p2 p3 p4 p5 p6 p7')
         self.wait_for_console_pattern('IBM eBMC (OpenBMC for IBM Enterprise')
 
+    ASSET_DEBIAN_LINUX_ARMHF_DEB = Asset(
+            ('http://snapshot.debian.org/archive/debian/20220606T211338Z/pool/main/l/linux/linux-image-5.17.0-2-armmp_5.17.6-1%2Bb1_armhf.deb'),
+        '8acb2b4439faedc2f3ed4bdb2847ad4f6e0491f73debaeb7f660c8abe4dcdc0e')
+
+    def test_arm_debian_kernel_boot(self):
+        self.set_machine('rainier-bmc')
+
+        deb_path = self.ASSET_DEBIAN_LINUX_ARMHF_DEB.fetch()
+
+        kernel_path = self.extract_from_deb(deb_path, '/boot/vmlinuz-5.17.0-2-armmp')
+        dtb_path = self.extract_from_deb(deb_path,
+                '/usr/lib/linux-image-5.17.0-2-armmp/aspeed-bmc-ibm-rainier.dtb')
+
+        self.vm.set_console()
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-net', 'nic')
+        self.vm.launch()
+
+        self.wait_for_console_pattern("Booting Linux on physical CPU 0xf00")
+        self.wait_for_console_pattern("SMP: Total of 2 processors activated")
+        self.wait_for_console_pattern("No filesystem could mount root")
+
+
 if __name__ == '__main__':
     AspeedTest.main()
-- 
2.47.1

