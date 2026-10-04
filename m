Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9044ECA5FEC
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:33:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLJh-0006RP-Tw; Sun, 04 Oct 2026 08:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJe-0006PT-Fk
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:42 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJc-00076c-Nj
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:42 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912d37b6so5941835e9.0
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116859; x=1791721659; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=QZdFScQg3NGSD60DWAXoWDgIEl9U8i+CSKMs+i+Hrx0=;
 b=Kg+Q+CednN3+2IsEkif+unZhKwY9VaMrEElU3cfn8nWRbgXR+Q2sdjM/yH84wdgYOv
 dU1TuP+3/nV8afZjKp9FlCCNb+SEe23wreNXia+WGIdbGOtRdmUa/mQz0PykPHjXrNZs
 +gNO38gAnZgVwr+WscWp9/ACedC9tcXIWzlVb3ybXnwml4N3OTX2SDEnwR44VUm3pSWw
 GpzykPpD+xbVg2Vey42eD0YWMLtqRx0QS4hvxTuh6XRG3l7J+SPvsv4o9tmYXVeYyRDe
 hyorQFucLdfkD8IoXoFDLvLgjxjuJNmXjmeZAsV//SfCe8OWkj9jB+p0872oPg/B+ReR
 uKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116859; x=1791721659;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=QZdFScQg3NGSD60DWAXoWDgIEl9U8i+CSKMs+i+Hrx0=;
 b=2m+V5VUwNRuRNEp6WvCpP8dSLV+8PQcdhPga24647/dGyDL0aJeXGPLTBXJcFTDcs8
 u/1mcLt6joEkeFz/IjdZdpuw2AucxGjg5dKTiCkDJ0ST9AiLjtOnyIK9s5FwpKsSK4AO
 HLMQizJCy1/b7xaBZGS8XHQsGDGRnNvu56PBN2x7FIuOGze+7EciNRi4HTBaGeF0QMi7
 GQkz4xJjfVI0b+PdyU9oIZGAy4UtuX2UbA+f7WCvravnbePwttROebFkyBf8H9z44J75
 62MQA72h6GH6luVIY0pfqCUX6R0oTUBrkz+xkxpczPvS2R7fXE4GfD51XzTlCLb6OheE
 qa1A==
X-Forwarded-Encrypted: i=1;
 AKwUvByNcAfu2dpmnH5fYM94lI2wYjvqbz17ZnHqCZkfTUsulUYZBfNh1qDMbszDaLyDSbK79U2aCLN6NA==@nongnu.org
X-Gm-Message-State: AFuF++mQapA5Guw4LM8ZBRJ2IHU4ISf/j1geimthmrpi7osU2+L3Em0t
 Z0zNmgGZS3bLsNbIBEStDzBYh1DdWnWU7dZ0pgn25eeLoyUF7oQNMmQx
X-Gm-Gg: AYBFou1Z/1T2Dau7FEa9xmgHUEFBBoKQ/yviSlEM6qRJi9WqOg7MqAvfVAim8wCbTuX
 6XBFp3aq5WEor7NYnUvIXUvRd5neQIKkXBtZOtEWOn7zHwkyocRB+PUhvzFD5f7dJBJO7Gi+X3E
 QJ7zSG6wH++/Wobg+1YUCnSI+8lhlmQZQx3GwnI6q+Kv45LyRMnGGCO1xoWDF7AGryQntD3wMFM
 PplsILDI5+AXVP31CI9wormC9ZfuaY5daRlaNFsCmLF+aPvXzXwXsnKVUIXcsJKGbfLtbqyDRQb
 ZuTOCob7rdBWQRX6JmnFJhqRC+kSZaovf+L5Go4BwefC9riwm/oHbEVatpkNquWihO+VzbxYuwk
 3W7PCON3JRQD6q1oBD4U8Re+vv9q6LnQ4KdMa6p5sVkNK82pkj1XAvLTg3SwzjwqGwDYC6h9ORQ
 x9tk22M6UQvBsVl0YigqqDdYqap7UsOQqtWtF3G4aByycxTDfPhmY6aaAeJ37yA4Kz8vC4l9fot
 BQCqiuvgSkukcDn7Mi8CpYFWNVimnC6FV1G7iV+7+R270P4
X-Received: by 2002:a05:600c:3b2a:b0:4a1:6af4:c6be with SMTP id
 5b1f17b1804b1-4a16af4c9damr57707825e9.34.1791116858981; 
 Sun, 04 Oct 2026 05:27:38 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:27:38 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 05/30] docs,
 tests/functional: Drop redundant CLI arguments in imx8m*-evk
 invocations
Date: Sun,  4 Oct 2026 14:26:21 +0200
Message-ID: <20261004122647.3913-6-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004122647.3913-1-shentey@gmail.com>
References: <20261004122647.3913-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


