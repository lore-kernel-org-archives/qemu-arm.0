Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDC5CC6B3E
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 10:37:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHIm4-0006vF-63; Thu, 15 Oct 2026 06:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIif-0000Hq-Ca
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:29:55 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1xHIid-0004e1-CO
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 06:29:52 -0400
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a1688d7769so16849375e9.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 03:29:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792060190; x=1792664990;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=yjBmG+zuYRbjC22UGQURaHMUPP1uzHBYq+b+aCfLeJc=;
 b=kxlLOdC069f+Pmc/FZ3Fv1QpuyuSrRMvAHW4FMAXBJ4kpb6ZGAadASEHPn1pPRub16
 7Cx/zF5AkLzpQhtT81yFDvWgxTow2l3wC/CYSTK/nRo/nW/eRhkZh9jNqSFuJK/OZwFC
 3h8dBMBc3ZWM1xGh9BcfDoh65BisoylDMVMhyQkLn3GUsoOtda58VK8lNkxlQfDhxmVZ
 MQk/VP9eI75YrbJNZ/qcnCuGo8xRs7is55aRljnqx9gjI8uI1qTy815TF1u+SQx0aL8M
 /QrFrbADAH/PN67oxdhtiouCTpKdGzNuFtVUHEUnMu6+I4V37jczlA7B4kyOQAMS5Hkw
 q4VA==
X-Forwarded-Encrypted: i=1;
 AKwUvByBbj5HsSVVnyTZYt3RRZVMmLA5pVNbYa0s0g+uqO8dVR/4cIFUGN/VOP70wIv64PcBbyW3RB9ncA==@nongnu.org
X-Gm-Message-State: AFq9FYIdDTajfzPClsMerRoJFSdQku4NtdqauVhZeBJQeyRWdjA1ngPx
 s2LiijYc2iG352BExZu3qiQIyAMqPGt+8t/c5vg4FwSPFL7ehRzCw771
X-Gm-Gg: AYBFou3G37RpR26iUxPzpmFrtIFqmUQ7euVD/e3deokHEq2wHu9xxqzyL8lDXqh+KFB
 p5+zILlPvAJ1BlVeDafbDGBdnGulsbUTarc+ao9gf2K1QDkORjzGVeN41vtslt7eNKJ4isc/WlV
 JiAqST5NiCeNA9labjV46Kj35yNuK/42Svo3DjeIJawZqiyBoZ7gwK2y2DcrCmtHsjkFSoNAd2U
 BRR2yVEuZw/31ao1rcXlfkZen8XI2HIRvAGwugeZVpDrTW+W4HZCTp8nj88nyHTsST+udFEXdzl
 /pPrIg8/PuOnA5DiPJlMYWNsoHkK3sb5qJWSHkJutSfmrLTD6O4g1kfUJ7FghR7uIpDcFgau1wq
 +GniTLjajWwC0byaf91gTYRuaFclDgKr92xpU5njflH5TIungCgCSZN0KFGsphCowDPlpn/dsRQ
 lXvcOHpPZpmzS6jRGfwCvKGe8n7s3tQWvPGV+Fx1iODkrL4DYk4/3y5Jqt1afwZElnhH0yPg6ZO
 zGTUAe0CM0Blec34bwk9n3deSmohwjrFqCNpcKyYQeVdQ==
X-Received: by 2002:a05:600c:4e43:b0:4a0:1f90:594b with SMTP id
 5b1f17b1804b1-4a18e4b67e1mr365550045e9.22.1792060189894; 
 Thu, 15 Oct 2026 03:29:49 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1bd5f4319sm27199325e9.0.2026.10.15.03.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 03:29:48 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:28:37 +0200
Subject: [PATCH v3 50/50] tests/functional/arm: minerva: add BMC boot test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-bmc-minerva-v3-50-7d50c8a108e5@free.fr>
References: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
In-Reply-To: <20261015-bmc-minerva-v3-0-7d50c8a108e5@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Patrick Leis <venture@google.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792056477; l=2487;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=utRMkw0VXmaCFdITu3Kg7E0hjjFW9yC9c7a309pEC8o=;
 b=SABl57njXkNYtVhmFAMHi+9+Vh94V3yFVOyiJ6i4w7g/HzNMH4rEXJxxNzKHKDhDsKospncCz
 2RDPbzyCefZBmJQPxlpxQ6MtV28h4038LwoDLqgRGUTdZMXmVJn+Fja
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.128.43; envelope-from=eblot.ml@gmail.com;
 helo=mail-wm1-f43.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add a functional test booting the Facebook Minerva BMC machine.

Note: The boot image currently lives on a personal fork; a TODO in the
test notes it should be relocated under legoater/qemu-aspeed-boot before
upstreaming.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/functional/arm/meson.build            |  2 ++
 tests/functional/arm/test_aspeed_minerva.py | 30 +++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/tests/functional/arm/meson.build b/tests/functional/arm/meson.build
index 61b00932db..dd1ddf7f6f 100644
--- a/tests/functional/arm/meson.build
+++ b/tests/functional/arm/meson.build
@@ -16,6 +16,7 @@ test_arm_timeouts = {
   'aspeed_bletchley' : 480,
   'aspeed_catalina' : 480,
   'aspeed_gb200nvl_bmc' : 480,
+  'aspeed_minerva' : 480,
   'aspeed_rainier' : 480,
   'bpim2u' : 500,
   'collie' : 180,
@@ -51,6 +52,7 @@ tests_arm_system_thorough = [
   'aspeed_bletchley',
   'aspeed_catalina',
   'aspeed_gb200nvl_bmc',
+  'aspeed_minerva',
   'aspeed_rainier',
   'bpim2u',
   'canona1100',
diff --git a/tests/functional/arm/test_aspeed_minerva.py b/tests/functional/arm/test_aspeed_minerva.py
new file mode 100644
index 0000000000..925a82b139
--- /dev/null
+++ b/tests/functional/arm/test_aspeed_minerva.py
@@ -0,0 +1,30 @@
+#!/usr/bin/env python3
+#
+# Functional test that boots the ASPEED machines
+#
+# Copyright (c) 2026 Meta Platforms, Inc. and affiliates.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+from qemu_test import Asset
+from aspeed import AspeedTest
+
+
+class MinervaMachine(AspeedTest):
+
+    # TODO: the boot image currently lives on a personal fork; move it under
+    # legoater/qemu-aspeed-boot before upstreaming.
+    ASSET_MINERVA_FLASH = Asset(
+        'https://github.com/eblot/qemu-aspeed-boot/raw/refs/heads/minerva-bmc/images/minerva-bmc/openbmc-20260720025047/'
+            'obmc-phosphor-image-minerva-20260720025047.static.mtd.xz',
+        'bd713df39d3c09846299a2377315465187a4dcd33c29d3b3d683ef13b59f36bb')
+
+    def test_arm_ast2600_minerva_openbmc(self):
+        image_path = self.uncompress(self.ASSET_MINERVA_FLASH)
+
+        self.do_test_arm_aspeed_openbmc('minerva-bmc', image=image_path,
+                                        uboot='2019.04', cpu_id='0xf00',
+                                        soc='AST2600 rev A3')
+
+if __name__ == '__main__':
+    AspeedTest.main()

-- 
2.53.0-Meta


