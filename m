Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B76C982ED
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:50:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lrT-00068o-4b; Mon, 21 Sep 2026 17:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrM-00065t-Tt
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:40 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrK-00005j-VG
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:36 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b91369d18so26350395e9.0
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027254; x=1790632054; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Uw/DMb2Uw5NZGDQy3g8IeeuOzOBZqBeZxwGT7qc8+Yc=;
 b=QOVDy+j/b/CynJhqdJ140qGox/StOXX488UvGiHWtGxRk4gkb1gCxQTWQof9rczdiz
 Oz5NYywMF8+rB9LOISMDUXql/pPAO18hd1EZhHWi+K3uki1qwqrF6TbNAeNPJymqebX8
 /g5kdptVC3bo7ZSC26qx0Ig55H7XJjhEKXS85VohnI/phIpTFZdDN7lTCcZsXHCzC4Uu
 JMZm4MmffxZfnyjyn4b54mds0PZ1Uwbe+nf/yk0NU9PL1aqa3pcXdn6FnVIvk4PspKbG
 1nY8jSwrTIF2hWsUt7QggWfHReXC014Ot+EX/Ta9WGtgRo5hQimAIezGaf4myLvl18Js
 +e6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027254; x=1790632054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Uw/DMb2Uw5NZGDQy3g8IeeuOzOBZqBeZxwGT7qc8+Yc=;
 b=bm7nZgq+MtboDvmx7P7uDq+tyFnnhl0Lk4J04Ot7Xdun1iouKTsj1+QuMGKaQmMgnK
 DVLZu/PyQsnq4duUA/UMaWNKrca8hxWx2CwbacyGtrub1y/DLgGyarNqBbiYM9lN/iM5
 5cTx2PxLJMUPVT+eCgEFXGoB2KvRb5yFKQLIndt0cqIPEBOCLZ4vbTQoY3G4dygKKRCc
 jJO/XB2Xy2j7gALjG5o+MuKI88Zs7mRlumcoU1A07JwfeHm9A0zo2LBC2GCxflfayBQZ
 O98eFZ/njUftDfyfBtt2T/8Bqc5/BQY1YTkremVIsVC88QDEcnWp7iK5PqNo3tn6LdQY
 gJlQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxsULjmr/Gn0NoB48HaOX05PTpm09SBu4yE8vxVoc+lT33iaNKQUbEAdiOLyxxgC4oQCaygaros3A==@nongnu.org
X-Gm-Message-State: AFuF++m/9xlpgocPgGVnIi6oNXLUQ6cw9MmbQzKhOb8h0x1D2NNSLoe9
 XWHx1KUfd5sNBUGMxQ58munElszD+jcB6fgdDSgGf5IDA0UJzGBpWhm5
X-Gm-Gg: AYBFou259q+S6+57EAZowVRhv5BBVfCuDidgDoB1kACL6mfkq4hJtQuYDGljnMYJyYc
 xluBs64iyLBi8KXjea79plJxDnbZjIErX31XiNCWzEz8d6qdQ/dW9A7Rw0vE8U3ERo3Y6kc3jgK
 xfVTYjZkhtu257heZ+bjlkMfyLKsVcj+Tlky0eRDP5IK2FHChAM4v6hhWI1H9/xlC4GU1VjhMJg
 nVc8/xSc16NizEJ17sU3KLk63+X5SBkgwQj7NGK8dmvL/8uck0WRoxNlXWJLHUo1iBfHpr+csC3
 t0b4Ia5g9yeG8TJeDpm6WDQ0SeZe8o6EIV++txiq82O5OzdUSGaOvvmaU88/LFdsOaZRehowVr0
 BHA3Uh9ziMF8GqarPNUXV9xinuUymh3JDYczzTZWv5g/lAFyVgB+P/6KuLy6hVY/C7AtjkEcDYJ
 CR02gyHkwPZdDbTveyB0+z9BA8PRr+UFaMuXNGQI90qQ0fnNAF/jhvdZpKmFC1Wvf2vXmHozE5I
 0aoFnrIst1twEMxtN7EnEiqKN6Q7s2CZe4Zi1zV/AGx+yNdMI8KrWDFBllcBeOUq5uLu4bGAUmZ
 +ghobjakjVWZuQ==
X-Received: by 2002:a05:600c:548d:b0:49e:816a:9bae with SMTP id
 5b1f17b1804b1-49fc58500e5mr176131855e9.28.1790027253542; 
 Mon, 21 Sep 2026 14:47:33 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.47.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:47:33 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 05/42] docs,
 tests/functional: Drop redundant CLI arguments in imx8m*-evk
 invocations
Date: Mon, 21 Sep 2026 23:46:33 +0200
Message-ID: <20260921214710.29422-6-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x11.google.com
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
2.55.0


