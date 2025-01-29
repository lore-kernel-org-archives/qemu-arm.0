Received: by 2002:a05:7022:6a3:b0:92:a90b:6588 with SMTP id y35csp3709298dly;
        Tue, 28 Jan 2025 23:20:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX30KOPRKQyWDcnQrl+ia/mxfeTykZbXkxg0j0dfgeatAZeVNAnopWd2+JhI3T2bWP8U8u85F5jG6Hrzg==@linaro.org
X-Google-Smtp-Source: AGHT+IHF840vt6JvhD1hU1uzAEpZf74FlrYXD0Weq0ayQ0yG7AYBAoylmOxEDnNPvTjG9F6CZ9a3
X-Received: by 2002:ac8:7f4b:0:b0:46e:2a18:93ab with SMTP id d75a77b69052e-46fd0b99574mr41472021cf.52.1738135247668;
        Tue, 28 Jan 2025 23:20:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738135247; cv=none;
        d=google.com; s=arc-20240605;
        b=PD9I7CJw/zyY+qIxjcGi8p6gjdsH9DOP8H6K1h5zSZOsD8LpTD1UewoIzHcoTAOP8L
         VQPOSQqV7ZG5476g4HsgXllwQXrLkMOgXLjOCSUhwal37JN/TjFbUyRhip8Ld5uOxDvv
         GtwrBram4nYw5bXorVxc1fi4S/fl90p63yKKBbrbtx4uOjz/DkkxcewcwWtqxf5Bccm/
         rlc8BcLgHBbUPiiqFmESHj6J600Hlx4ew6ng0heoBMO45tLm0XymBzOXbRrubulcIzGG
         7vKCBAJKbIbhUuXUoHP3suRLT8A1UXWa2cC9ZbfzHTkpyIBpixqqMEt/LE5sgAeXbUQa
         e+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IyI/sKmGzp9iUQiTh9HHoh1vQN0kavvwKghUO7Fad1E=;
        fh=XEUWnmNUzgDVltOtMw+UmOaRtoK2L8C0I2oKK3mImI4=;
        b=iauT2U7Do7usyu91Mf479lurV9PFKZHZezuEGafdL7OCnYvLYclGT56kVrtJZknPrt
         2/MUgvLpvrGgtaYHZwfayJwv9QDKE9Z6MA8rZ3E+hcFBccIlvGioIPef/1FWrHQ7cGNE
         TS+4Zjl8htBFYX5iobfzlpeIBLAF7tdB6QYBbKi2+JnT/y1yrKGz5x8Se4EG5uVCWNxB
         XiolZ1ro5pvICfRLi/gRXYQ6k147hgipisUCc8fwTd9Cg/H41v+1rYrhjeFUykvKMOxo
         pZX4gbbaPtabzjoyurSFAMXW+ctANxvPlAy6BdctoCJWiWJtVcip+A9FdtfEl1vWzfUb
         VIbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SmsxNDrb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66b87b92si139835851cf.396.2025.01.28.23.20.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 23:20:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SmsxNDrb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1td2Lr-00027s-PH; Wed, 29 Jan 2025 02:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1td2Ln-00021e-FT
 for qemu-devel@nongnu.org; Wed, 29 Jan 2025 02:19:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1td2Ll-0003gd-3G
 for qemu-devel@nongnu.org; Wed, 29 Jan 2025 02:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738135140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IyI/sKmGzp9iUQiTh9HHoh1vQN0kavvwKghUO7Fad1E=;
 b=SmsxNDrbGXvtMYtqI8LV3BaaBAyn0twlCq5VXxEy5fLoo76FJTF7mbfOdS1/k9HJvvNURo
 GliQuyTwhIvg+4GBZwwYiv6LIe0AEGfH5He4oSxRFahpAPjpRWowGjc3AQF845OfytkhnO
 4lWvEQgq7smvTwSevtbdFPl7IjttnEU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-443-EkCsDZoHPjWJBXf_JG9Ukw-1; Wed,
 29 Jan 2025 02:18:55 -0500
X-MC-Unique: EkCsDZoHPjWJBXf_JG9Ukw-1
X-Mimecast-MFC-AGG-ID: EkCsDZoHPjWJBXf_JG9Ukw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8E71F1956083; Wed, 29 Jan 2025 07:18:54 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.105])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BEADC19560AA; Wed, 29 Jan 2025 07:18:50 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 5/5] tests/functional: Introduce a bletchley machine test
Date: Wed, 29 Jan 2025 08:18:20 +0100
Message-ID: <20250129071820.1258133-6-clg@redhat.com>
In-Reply-To: <20250129071820.1258133-1-clg@redhat.com>
References: <20250129071820.1258133-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: pp2J6TqDUcLp

Use do_test_arm_aspeed_openbmc() to run the latest OpenBMC firmware
build of the bletchley BMC.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/meson.build                  |  2 ++
 tests/functional/test_arm_aspeed_bletchley.py | 24 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100755 tests/functional/test_arm_aspeed_bletchley.py

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 5c782ceb0a98..a8eb9c9a7af5 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -25,6 +25,7 @@ test_timeouts = {
   'arm_aspeed_witherspoon' : 120,
   'arm_aspeed_ast2500' : 480,
   'arm_aspeed_ast2600' : 720,
+  'arm_aspeed_bletchley' : 120,
   'arm_aspeed_rainier' : 240,
   'arm_bpim2u' : 500,
   'arm_collie' : 180,
@@ -86,6 +87,7 @@ tests_arm_system_thorough = [
   'arm_aspeed_witherspoon',
   'arm_aspeed_ast2500',
   'arm_aspeed_ast2600',
+  'arm_aspeed_bletchley',
   'arm_aspeed_rainier',
   'arm_bpim2u',
   'arm_canona1100',
diff --git a/tests/functional/test_arm_aspeed_bletchley.py b/tests/functional/test_arm_aspeed_bletchley.py
new file mode 100755
index 000000000000..10e6703b53cb
--- /dev/null
+++ b/tests/functional/test_arm_aspeed_bletchley.py
@@ -0,0 +1,24 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots the ASPEED machines
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import Asset
+from aspeed import AspeedTest
+
+class BletchleyMachine(AspeedTest):
+
+    ASSET_BLETCHLEY_FLASH = Asset(
+        'https://github.com/legoater/qemu-aspeed-boot/raw/master/images/bletchley-bmc/openbmc-20250128071329/obmc-phosphor-image-bletchley-20250128071329.static.mtd.xz',
+        'db21d04d47d7bb2a276f59d308614b4dfb70b9c7c81facbbca40a3977a2d8844');
+
+    def test_arm_ast2600_bletchley_openbmc(self):
+        image_path = self.uncompress(self.ASSET_BLETCHLEY_FLASH)
+
+        self.do_test_arm_aspeed_openbmc('bletchley-bmc', image=image_path,
+                                        uboot='2019.04', cpu_id='0xf00',
+                                        soc='AST2600 rev A3');
+
+if __name__ == '__main__':
+    AspeedTest.main()
-- 
2.48.1

