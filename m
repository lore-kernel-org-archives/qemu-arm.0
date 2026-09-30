Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFACACA5FC4
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 16:48:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBxSc-0001Gc-6V; Wed, 30 Sep 2026 12:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xBxSU-0001CR-2V
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 12:47:06 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xBxSR-00033Q-0W
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 12:47:04 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f63546c3so4389868f8f.1
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 09:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790786821; x=1791391621; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=1QNRedqYGyPzL6Ypuu1mQrHA3NbEFtuOcKMWfFPj6Ng=;
 b=aSroYiZRykUVMXd699g+lcKjUqKDA7jLEuRr3yoneeHSzk33K5IyqWaABxggm0p5wF
 3oZQMHEkS8ddLmIxWOuQOGVqIaOzxN6NbUL8a7Ezdy7iBrjEDhMvIdx+NSA2zfjuLjch
 NPM7ib9+E8HvQB5KszN+zIg8ceYuBWiACPeABmz9uDHSwSf735jDcC3Q3Mdn7NQFQIKo
 PUze6/yIoRPaVQzb+umL8q5pCslAyFCtYdzWmdAsvo04EBfP/4RFmKM+ura8I3s3J6ZN
 sfcLLKvILtlk0BXnJg97dSEpzGPfitFlr+XfRwhEMWHkVOvFpXQp2HNBBjsZ/xSiEkkH
 XKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790786821; x=1791391621;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=1QNRedqYGyPzL6Ypuu1mQrHA3NbEFtuOcKMWfFPj6Ng=;
 b=JDCe28Hf6apLK3+DdyU/J8lapl6cW7CoHLOmnNA1ucEOpAqRusQiWT1l34gMj+8TdD
 0D/9hXCrt1bV9dzIchvs9JVxZ8d9qvo6aHrbUvoQJqvejN+jcwsBvGGab9xQ3tLwl26S
 83tEcyY6E7M1EIaeHYnKQS6CJhcFayDWZzh+ScWbfPv6k8IsOjoT5h1sPIyMHFTHrcDM
 MOP1hiFJIa7T9EAITKKXMC06vJcegRmtRtaMJboT/ZmEQFIDrnh3ehUJIzgZiLN+a0YU
 b24P04b6Szkff5rtrYRV/BKxA+Ht0XBDOeEa/uhwrh5ur/3QySMcuRw0RDBDrwTIoUkk
 FmFA==
X-Forwarded-Encrypted: i=1;
 AKwUvByaH9DmCNHeJStnRrsx7Y8m+n2ZJXxA39HUogWVc2RYJjo8+LSeq1o3dOVscCHHSx/7GZnWUdQoKw==@nongnu.org
X-Gm-Message-State: AFuF++kHBA90YCg1Wqxlu3W5zG9gI5tR7qgg48pwBFfxKhtcT0MQk4nL
 IP+xf9zdkg1rfu+F4I4aQq0U8zr122aI2CEGMiYvx/6FPUz1OQvuk0n+3Tdnrv2iE6M=
X-Gm-Gg: AYBFou2A+kALLvzNjDJgYTgS+NzP11YDWl53Nf43gtNu6NhHay5zk+zg54X0Tbt5j9A
 fwG1QStXQn/DZnp4ASgZEjIchF3wmcA5jUItjMlDmN0unNB16joHMqJYiOUEQ2lK8jJCKSsAvR8
 so3K1FXc5Gm+QsuVODsVKCsS556tByGKEhKVM0mSThJQA0x/ncYQDkipI3aeftrcgjvnURA4CX4
 /EsaxBLPQnD2a6HGInCHQ8BSbfTZlxsFCGNBKREIwMHr4LhGhJhc3FAiozbbN40shOqEh5BQR9M
 oZ1L/LeYzJC0eh1k2Lz48B8NyeDZ7gdcNOpcjHxapyW75xOwL7fP5Lo/6H6EZFlYL6gVZiaU4Ry
 gZUtmfE05DpMHt7+SwV0boLfFUsJieNh7ik49Bz0MXJBoLIX7h+k0pqcTz45/zXXCVGZE4VjGku
 ixT2AC3EelXFbXgEchpN1IWhkadRsp+NPQ/oP1uGok15sSOjoi/N81SrKcNWNPyuvRDP0o8A==
X-Received: by 2002:a05:600c:3b1a:b0:49f:fe90:de63 with SMTP id
 5b1f17b1804b1-4a01b12cbb8mr35981125e9.28.1790786820781; 
 Wed, 30 Sep 2026 09:47:00 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd002bcsm24498565e9.4.2026.09.30.09.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 09:46:56 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 87A495FA65;
 Wed, 30 Sep 2026 17:46:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Song Gao <gaosong@loongson.cn>,
 Ani Sinha <anisinha@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Brad Smith <brad@comstyle.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Klaus Jensen <its@irrelevant.dk>,
 qemu-arm@nongnu.org (open list:Virt)
Subject: [PATCH 08/13] tests/functional: split aarch64 tuxrun into tcg and kvm
 run
Date: Wed, 30 Sep 2026 17:46:44 +0100
Message-ID: <20260930164649.433573-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930164649.433573-1-alex.bennee@linaro.org>
References: <20260930164649.433573-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add an explicit "kvm" run to the tuxrun tests. Although running on an
aarch64 host would probably have defaulted to "kvm" anyway we want to
exercise specific features later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/aarch64/test_tuxrun.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/functional/aarch64/test_tuxrun.py b/tests/functional/aarch64/test_tuxrun.py
index 7dd50c3de17..3870be8b6e3 100755
--- a/tests/functional/aarch64/test_tuxrun.py
+++ b/tests/functional/aarch64/test_tuxrun.py
@@ -32,6 +32,16 @@ def test_arm64(self):
         self.common_tuxrun(kernel_asset=self.ASSET_ARM64_KERNEL,
                            rootfs_asset=self.ASSET_ARM64_ROOTFS)
 
+    def test_arm64_kvm(self):
+        self.set_machine('virt')
+        self.require_accelerator('kvm')
+        self.cpu='cortex-a57'
+        self.console='ttyAMA0'
+        self.wait_for_shutdown=False
+        self.common_tuxrun(kernel_asset=self.ASSET_ARM64_KERNEL,
+                           rootfs_asset=self.ASSET_ARM64_ROOTFS,
+                           accel="kvm")
+
     ASSET_ARM64BE_KERNEL = Asset(
         'https://storage.tuxboot.com/buildroot/20241119/arm64be/Image',
         'fd6af4f16689d17a2c24fe0053cc212edcdf77abdcaf301800b8d38fa9f6e109')
-- 
2.47.3


