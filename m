Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2ED8D35693
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Jan 2026 10:59:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vl3G6-00026w-F1; Wed, 28 Jan 2026 05:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vl3G4-00024u-Hk
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 05:58:48 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vl3G1-00029M-DV
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 05:58:48 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43590777e22so4188366f8f.3
 for <qemu-arm@nongnu.org>; Wed, 28 Jan 2026 02:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769597921; x=1770202721; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WoBh5xYB4SiZR0MTlQgtfh1lto9+PJhfKJnE7vgrSa0=;
 b=ML7F9jma64W7gtohZvjW6TEJJzW4AtS9I8/gsd4SfkNR7izP3YurxvKWtS7mf76pZM
 qfKOmnqKt7gvUnsaLPety9WZKBhNpy1UavsJwZubrsRQwtz+6IqmV/SoqAlAj69Wxn+H
 Ob7Y3goMCdsful2A6K7LGlK8McGeNk6XGj1w1sYalNB9rY9vG5bMAdvc9wIeph2eVVmn
 ChLYQ+JuIJISHex7FDvn+NVkPFn2uYldlJ0joMg1Qb2y3FQtHRAhW5oyMlk3M8r0gIdy
 r0Pg420lVlzh8+AhCo+/C+h32ZBr05Ccbv+/MRWPTc1zvMBy8YA/PQ4W5U2eno1roUkt
 YUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769597921; x=1770202721;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WoBh5xYB4SiZR0MTlQgtfh1lto9+PJhfKJnE7vgrSa0=;
 b=LfLWKTwLC33epwtuN3AY276CbMb3DSFpUVilxZL4y2Bo1hWMyOgfU0qyGTAkERnS0g
 45ESItCdzceQAm5g0Y9S4GJHcBHktni6EMvqHKQj5h1Gq6w4nDhJJ5L1EFTsBda1H2SE
 tJK1gjMUmo1mdid8zjl/UEIS/9FBE116FrAtLGNe6y9O/Tg3CNqUNhiDZexTS0vJyPhG
 OmH5L4nnzrMkmSem0fuC1YBlkMsrnRRvjvXzYxBEOTeaa9Cep0q+lJU8r1q9YX4rOfK9
 APtQlb0uxFZPOE1W9kubtqkBDJm0LHb8lkLv3NoP7Rp4zk+O+JPCIF4b21OYiywTWEHO
 1kfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU293dlDTgQd0s8jyS52/6suJ2S69zStsGAkLwZhY+UW7E05QyBtt7+UJVMhwcWIbnXY+Uonq1rrg==@nongnu.org
X-Gm-Message-State: AOJu0Yzjdb0GLvzsSf2DjZQvXCtKtT4W/Uk78IAu5YaRO1jdgJhGpB1l
 ceXAkoiUNU9Lrawf6etYIO8mNjb0OI2SNsNnOqlW63dyl9uRgXkZi4MLwu4CDYE28XA=
X-Gm-Gg: AZuq6aLF4p3w/jNRMQDYa9GWilgFSd4gRSRQYpn1McWLkE2QTRTJRk+93Z5vH7pMDW9
 ku9SYFtwFNKuUX4Lu2MoGK5svwSri5AdlqKySy4ddvytjBlWxv9MAJ/Sc2xYLhpColK677T79Iq
 EJ1Y2tSw0vln2r9BgCNMt3VVuStcGWiEcVijSmg69Lc8CN6+rVMP3jB5HVP/RxM5X7s6sCh1s0e
 fAD1Aae+CSqPmddp+QQ4Y1lmihuiwkq7/cv1hqfrOQuUBXUKyaJOjr/yDDns/Pm/Kp/WkfLGsBK
 whDXJZsnBog/NRirf4BLL1nBltbHouDnYgncxqExahCWzNF1bbfuXazTeakJ1piz2zYrFR3Pi6f
 HuQQB7IRYc446dFh5RWKyv2BbFG1hn6yKdn3yKL5+seuJylT0rjBKAI3ar947Kv9lPTcrIYuSRK
 zXeGXjlSgEHEo=
X-Received: by 2002:a05:600c:3595:b0:477:a978:3a7b with SMTP id
 5b1f17b1804b1-48069c78bdamr62185265e9.22.1769597920943; 
 Wed, 28 Jan 2026 02:58:40 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10edf62sm6881983f8f.13.2026.01.28.02.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 02:58:40 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 9FE2D5F89A;
 Wed, 28 Jan 2026 10:58:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH 2/2] tests/functional: migrate sbsa_ref test images
Date: Wed, 28 Jan 2026 10:58:39 +0000
Message-ID: <20260128105839.3487840-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260128105839.3487840-1-alex.bennee@linaro.org>
References: <20260128105839.3487840-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

As the builds in codelinaro.org are going away migrate the binaries to
share.linaro.org. As the hotlinks don't encode the filename we need to
explicitly tell uncompress how to handle the files.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/functional/aarch64/test_sbsaref.py | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tests/functional/aarch64/test_sbsaref.py b/tests/functional/aarch64/test_sbsaref.py
index d3402f5080a..48f1b7a86b8 100755
--- a/tests/functional/aarch64/test_sbsaref.py
+++ b/tests/functional/aarch64/test_sbsaref.py
@@ -31,10 +31,10 @@ def fetch_firmware(test):
     """
 
     # Secure BootRom (TF-A code)
-    fs0_path = test.uncompress(Aarch64SbsarefMachine.ASSET_FLASH0)
+    fs0_path = test.uncompress(Aarch64SbsarefMachine.ASSET_FLASH0, format="xz")
 
     # Non-secure rom (UEFI and EFI variables)
-    fs1_path = test.uncompress(Aarch64SbsarefMachine.ASSET_FLASH1)
+    fs1_path = test.uncompress(Aarch64SbsarefMachine.ASSET_FLASH1, format="xz")
 
     for path in [fs0_path, fs1_path]:
         with open(path, "ab+") as fd:
@@ -54,15 +54,11 @@ class Aarch64SbsarefMachine(QemuSystemTest):
 
     timeout = 180
 
-    ASSET_FLASH0 = Asset(
-        ('https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/'
-         '20241122-189881/edk2/SBSA_FLASH0.fd.xz'),
-        '76eb89d42eebe324e4395329f47447cda9ac920aabcf99aca85424609c3384a5')
+    ASSET_FLASH0 = Asset('https://share.linaro.org/downloadFile?id=kyoMLGC9zXa4oA7',
+                         '76eb89d42eebe324e4395329f47447cda9ac920aabcf99aca85424609c3384a5')
 
-    ASSET_FLASH1 = Asset(
-        ('https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/'
-         '20241122-189881/edk2/SBSA_FLASH1.fd.xz'),
-        'f850f243bd8dbd49c51e061e0f79f1697546938f454aeb59ab7d93e5f0d412fc')
+    ASSET_FLASH1 = Asset('https://share.linaro.org/downloadFile?id=Dj1HRXnDnKtU6Nj',
+                         'f850f243bd8dbd49c51e061e0f79f1697546938f454aeb59ab7d93e5f0d412fc')
 
     def test_sbsaref_edk2_firmware(self):
 
-- 
2.47.3


