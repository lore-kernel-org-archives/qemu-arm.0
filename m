Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DE6CA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:00:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEMZs-0004Fl-El; Wed, 07 Oct 2026 04:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEGKn-0002dx-Um
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:20:52 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEGKf-00055z-8T
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 21:20:37 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c2e2007dd8bso193613866b.2
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 18:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791335746; x=1791940546; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=uBan2vPnuxZmPsBXKSBaOr/VE/70/QAtNwrFSmFxYy0=;
 b=Wh0RhwiUBFVAHuAmoIr1vWKOgMY5ktAl54RXbzdH63flobvEFOY+bCgBMCxkXNOIA4
 m3RmNa3IRZP2LBtEhoFapDLjMw+zMUl7gwhP7NxgeYb+Y/VRRnS7aiQo1LKPQdQKC2ym
 37jWBu7jjgUiDUnCjPEkyyXa8GNc5AUEeomzraJHK2CYRx4OvdINOBsUkBn56ydGcV1G
 JCXGg1q7CPkGYZu0msKwZsvMbjkp8Nh86pRB9gpDkLLTW2rA06KXOd2EB1R1O4TCZXV6
 F2CS2dWSyolFeVjF31cDiOkTxKl1liabTg7+i1zsnVYlNjOaNdRY5x+ZmSY5sekBhh6P
 bqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791335746; x=1791940546;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uBan2vPnuxZmPsBXKSBaOr/VE/70/QAtNwrFSmFxYy0=;
 b=pwSLSyPHI8c5ElvbECyTLUcHNQd7ngTP31aTR5vFD+aVhKW7e5J73uCYfZwqijc57n
 f0Ey8vbsdcL4BeCZoq1y5s5iac/DxBySkUXdPuYUvJApelzAxtN3Y9lWAT3OoiLhAT2C
 OX9V2b5nX6MRjafqsv5E3TEqmUE0XetiCaJ9fB2sHl2GPDrVez2mGSLGrMoQwiJZF7+4
 31FxNktEJ+1jA5cEbKCmnvfofuM1oTZd9PD1P+igLSPEtnZ2tS6oikthWM/0Qz4BOcH+
 IY7y2xTdwLJdjtnKthLlaB4hFPXv86xo6fHl6TFLET5rSysWhc8C4/EUIN/IL9F+rYSf
 skDQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwAcxeQHFkrzyP2PgtTrKPu7UAq8MdVTRgeV0QxtYNxsuWzoegGRrFzB9tRGu6QWUxWA8z2nrK1rw==@nongnu.org
X-Gm-Message-State: AFuF++lIqRk4Y0KbNUFb3FHyfarNXCrgMF0zvaZVc3kAB1gHzQSz2nrQ
 F8V56MKpLxbk1p0X2TDM9ye6PG9o+ubwW8+OB3vdcfVe1OWAKWiFrJUU+2KPIw==
X-Gm-Gg: AYBFou2/ooJt8EnMvge+dn6ogXbEIGYquBWc8bNpOw/j2uyUv9NXmV3kjgkAWHxc61D
 ArnPuqrc8MrfZUrBctJP/tV9/T34g52BlvxuVD6T0JCBdxmiGIIEiTve7bVoyAm7/YUoBGhnMKw
 WbVZykDaee1Fo4/xODMTfYy4SBH3HeXPVUfdSafGQz69bp3JYv6erlzTfwFhSg8tv3Syi3j9RPM
 bUfsm7cEZQ9keRyNaqTXd1iA9tqARidlaWwIywQaZuVd+6Oyt8rqwNj9rOUgbXDaneSaeFRNdkR
 ZZrT6d4/mJslHQF+v1FhsFYXatYRi5FnQZhqnCc0n/j+5cAyJfN6tTQ5E7FeeARvJHC+rCLK9Y5
 IfsJT2Io8thjCIHL1SU/a4tdDZKuRKoeo6VRX5Bq/fEHFF3iPjNILy7L6lhAw9BYYWSBsbR9JWy
 QIhaZ1Fw3r8ldkEfbwwIiE7B3aspkHonrShNRnzlsBQ58LC4aMUEPF3UqgFLG0w9skVQZ1qj6kh
 qfNlDvdKhFWzfQOQIYmzRHmwaabSSr4LNxxUA==
X-Received: by 2002:a05:6000:1448:b0:48b:1ed:db34 with SMTP id
 ffacd0b85a97d-48c6d1a5623mr1205063f8f.45.1791275726892; 
 Tue, 06 Oct 2026 01:35:26 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:26 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 06/31] docs,
 tests/functional: Drop redundant CLI arguments in imx8m*-evk
 invocations
Date: Tue,  6 Oct 2026 10:34:18 +0200
Message-ID: <20261006083445.30362-7-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


