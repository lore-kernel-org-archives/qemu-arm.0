Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B114CA5FCE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:23:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfol-0003eT-50; Mon, 05 Oct 2026 06:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmH-0002GJ-Co
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:38 -0400
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmD-0000w7-Ff
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:34 -0400
Received: by mail-wr2-x0e.google.com with SMTP id
 ffacd0b85a97d-48aff58e6abso822245f8f.3
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195510; x=1791800310; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=uBan2vPnuxZmPsBXKSBaOr/VE/70/QAtNwrFSmFxYy0=;
 b=OzEMMs0utPct/CFwCYkglLVxgsJtBXvhRrpy3DCrNJcnvtMvEk/o8q5zOqv8IwclcK
 dnR2tO2wB802k2HOVum+S3VUf6i/jAIZUSfjtKvPZ+K/1xX368QFMe+KBOmmTxb9q5au
 YjrzBdACUKUPrKX5Rm36st7alheEfeoNxUT6EN7bpnTy7NqqU+9d0zao+sPWvKy2W5En
 b3EmRvNss/Q5Y/bqzs1g7r7Z4CYYdhB0Trk9EU7V/NSzSKca7ZOPkRdkn91FPbj6Hkma
 OmvQrVpnUrz26AGIqunNzk8xjkLngKkicXZJM+HZKmTFjo0sYNhTE0oEx5Icxta/+DA0
 qGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195510; x=1791800310;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uBan2vPnuxZmPsBXKSBaOr/VE/70/QAtNwrFSmFxYy0=;
 b=qf2PevjhuBa9VewuhPKn4BWnlWTg0T9Cne8P/spjVnJu/6zvnW4O+N8fkUNkQW7mKZ
 0bqEZLLP/Jf85jGlqIYhROiNUsEimKd6GeDrhJsXJiJpk+xj08nN0I+4OK3zhs41e1NQ
 Eo0f6K+cd2v35yA9r/f8CD4SxAUYCWt6qWQfuJdqISyJpw5V5aRiUNKG51K4Ft2VyL2g
 ja3itZO0SDel3S/A1gToXFNpi/9VsQgEyQOUmrkpKPqQPk6EbnaVVHWWgvq+vHkWNgF4
 YSMKKzjhwhsM6DJUK/EdLgGmR3osZogcWkr9AWf6XF5+ka+jKZVHjzCVdxJfvXAId3iG
 EaVQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxnjI6tkPFaUyfHUoWg5qpmFRhjsaH5r+IVgvRJanRXGfWSnFUgjeZJc2cIc/f8p8zJmyJ5zkZVXg==@nongnu.org
X-Gm-Message-State: AFq9FYL+t5z7Q7bp1l8EQ8X4V02eHJZwxOhNrtJNXLu74bEPfiJl4L4A
 NQsedrOefb7UJjm8+P99MCMvt5vA7BLL3HiswWG3pc3tNTVdKvINRZXd
X-Gm-Gg: AYBFou1gggyTdHr9h06LEvlN++lV2v2JXxQO6jwKovbW5X2u1VB96VQJSOSSIaSYazL
 JU0/oUxlD77RG8FaVhhxQxufufhddnWJzCY4tFnYGDuj81lGx4sA5cEIdYkNRHAgY2RvjBgqGF7
 C/FmEoEi9G/qtT2SjerxDGIQBweVFucYsRDAf0KF1UIX78vwe4C+bNBzqvLvdFgWnEd3vmq+0+U
 8Ka7kKlakZM0TXjFOFvOlXO0frIRZgjzQx+W1Gv2T9pWtgPHhiBFyYM72Y6Sc6jlTGY/bhKlRlo
 +fMB+jD18TRuDSjvwbMaPo5eaaKD7s48Z7zhH/jHecQHpjlaLipCxEfK3IUdmXucZoJS9S7OQKk
 iMJKXXoWDsPtxTb4bMXABb78AH47IPQeuSteY3xWRwxzD68G7vv3W7NjuOLt/d724wR5gnlNLxI
 nPAthyamPIXzWYg6CVIRJhy9jEkEx42uk8l2IL+71lxMaywT/a/ea+QmjIiBrFKJQgDeYwGcw7J
 vuX9krg6xPsRzjVCC890yLncOg3l+M/LDpQjA==
X-Received: by 2002:a05:6000:40de:b0:48b:d2d:2fcc with SMTP id
 ffacd0b85a97d-48b1272d0c6mr17135319f8f.9.1791195510440; 
 Mon, 05 Oct 2026 03:18:30 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:18:28 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 06/31] docs,
 tests/functional: Drop redundant CLI arguments in imx8m*-evk
 invocations
Date: Mon,  5 Oct 2026 12:17:33 +0200
Message-ID: <20261005101800.10821-7-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::e;
 envelope-from=shentey@gmail.com; helo=mail-wr2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Both boards provide defaults matching real hardware. No need to ask
users to repeat these. Also, remove these redundant arguments from the
functional tests such that the defaults get tested.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/arm/imx8m.rst                   | 2 +-
 tests/functional/aarch64/test_imx8mm_evk.py | 4 +---
 tests/functional/aarch64/test_imx8mp_evk.py | 4 +---
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/docs/system/arm/imx8m.rst b/docs/system/arm/imx8m.rst
index 1bcb8255be..5348757089 100644
--- a/docs/system/arm/imx8m.rst
+++ b/docs/system/arm/imx8m.rst
@@ -79,7 +79,7 @@ For i.MX 8M Mini EVK:
 
 .. code-block:: bash
 
-  $ qemu-system-aarch64 -M imx8mm-evk -smp 4 -m 2G \
+  $ qemu-system-aarch64 -M imx8mm-evk \
       -display none -serial null -serial stdio \
       -kernel Image \
       -dtb imx8mm-evk.dtb \
diff --git a/tests/functional/aarch64/test_imx8mm_evk.py b/tests/functional/aarch64/test_imx8mm_evk.py
index 86725991f1..73d286167c 100755
--- a/tests/functional/aarch64/test_imx8mm_evk.py
+++ b/tests/functional/aarch64/test_imx8mm_evk.py
@@ -52,9 +52,7 @@ def test_aarch64_imx8mm_evk_usdhc(self):
         self.require_accelerator("tcg")
         self.set_machine('imx8mm-evk')
         self.vm.set_console(console_index=1)
-        self.vm.add_args('-m', '2G',
-                         '-smp', '4',
-                         '-kernel', self.kernel_path,
+        self.vm.add_args('-kernel', self.kernel_path,
                          '-initrd', self.initrd_path,
                          '-dtb', self.dtb_path,
                          '-append', 'root=/dev/mmcblk2p1',
diff --git a/tests/functional/aarch64/test_imx8mp_evk.py b/tests/functional/aarch64/test_imx8mp_evk.py
index 99ddcdef83..2ec421c326 100755
--- a/tests/functional/aarch64/test_imx8mp_evk.py
+++ b/tests/functional/aarch64/test_imx8mp_evk.py
@@ -52,9 +52,7 @@ def test_aarch64_imx8mp_evk_usdhc(self):
         self.require_accelerator("tcg")
         self.set_machine('imx8mp-evk')
         self.vm.set_console(console_index=1)
-        self.vm.add_args('-m', '2G',
-                         '-smp', '4',
-                         '-kernel', self.kernel_path,
+        self.vm.add_args('-kernel', self.kernel_path,
                          '-initrd', self.initrd_path,
                          '-dtb', self.dtb_path,
                          '-append', 'root=/dev/mmcblk2p1',
-- 
2.56.0


