Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A84CE6BF11
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Jan 2026 15:15:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlqDO-0001tb-7z; Fri, 30 Jan 2026 10:15:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vlqDH-0001sY-AZ
 for qemu-arm@nongnu.org; Fri, 30 Jan 2026 10:15:12 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vlqDF-0001Gu-Ft
 for qemu-arm@nongnu.org; Fri, 30 Jan 2026 10:15:11 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-432d2670932so2134575f8f.2
 for <qemu-arm@nongnu.org>; Fri, 30 Jan 2026 07:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769786107; x=1770390907; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+rjBPJgdUrswncn16/fJ7N+9sZAh70oa0q47Le06XK8=;
 b=ZMb4+lQz3uxJNxF5ZJeuDyKe5sEUmUV9PuK9PH19RSQrrqAXjN1p/w4hrPnls9Yj+k
 jEYGkkPriVu77TKxwuXa4olKRRF7ecG0OfgB3KrTShO15LF2BztIbOMwcGBhz2hsRCLY
 hFMXTVef9fWrTq7BFwbsSfRsC7CBgV53cesTtIR5EjTBE3JBqtCoTI4gDHY7+zFonxh7
 isXr/DJJB6s/Y28+w84+6KzS6ON67R8Qq8ninl6FIRLCp2OSllfHe87Xo+lDo3pggWY3
 BFGSbTlPK3gmBr8bSXzx0HmDy3OeGWMnOTMXyKP+jUWTRNme2kJV3/6D1AEYovMS09w/
 pGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769786107; x=1770390907;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+rjBPJgdUrswncn16/fJ7N+9sZAh70oa0q47Le06XK8=;
 b=qs7SFWk1tqNhBwucckgxYXvnG0TYEwy2IzsGn6m8ueN4NHRvw/ieDluOL/jyE5/iGX
 L7dwbwRlrjB3ZpUNfuXbDP0b0D6q115m7vtNDb/SFeX3LmCs4zJl+T6+ErQf9GX+45EK
 UUAj7tGUjK57lWbVMjawUjcHb3fAFkDwhlamE1HTGzRHGn4Ws8lCqZuowatXDNGBO+2o
 fOrIEeRSBhzXss9aVeklSEgWqAZ5jKga9P5ronjTP4XEE+g8z+l9g+YPbWHOeGIakpQ8
 irOY2KP1qezCenfbP8oLPMPgoSCy/ULRF+BXCj1eV1IL23SyPH/j0SXRHnutLJLhw83q
 kG7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVphAAS4/C+az4Xj5Tcb4Zi+EEuSUM2UfY0/lO3iO3bFmf2tzuWMO/AkPLoEs7mBZK+wlnj3zTQQ==@nongnu.org
X-Gm-Message-State: AOJu0YywhOa4Wxg15sWPPiRmSUQWOhKFTfKh+mPE47hOUVEYVaSErC1+
 usu9zBDHE4KZKz87AzqR3lvRYEHlebj7vgY05P6NMoSX5KUw0KTWcICYFztauJx73QA=
X-Gm-Gg: AZuq6aKn9Rztm7ib1/n1Hy8qXI6ZDWcLHfxInVe6ubqH6EYRV4pEpE3shMgJAASYCTM
 omCB6BmojfOfO8B+RSv61lrisDKNFo+zP3QvvCRcAa8XiS1BclnljIPa3UxqpTbigcQQfeMvAxK
 tfx2rVTI6pVeUlVobO7C3CBZH7XXU6/fvgMOqU/H3Uuzopn8eI/h1Qgb/EpRVSVs7fuw567xoZK
 Mk6Txz5zF6Zdj2/KJ2UeiVA5mLtumelKXQsYcw8PuzmOO5/UUmrb9V9EnA5q2/Ahx80yK2BlUD+
 wVCQ3h3/FdMo3Amv2Jg75zZxfAoMMcrNwfhVSLUjzh2bYVIFSbPyTh1sCwF5l1KJ4gu4JJ10plN
 D+6j5pOL1YA0RGZnlQPmiKi31wGU7mOcVks5SmSs9pyReeRKIx/FOTann5huc3mkeqJIenBZSBn
 oTKv4tUCgMnJOlywiwb0NMtw==
X-Received: by 2002:a05:6000:184d:b0:432:da3b:5941 with SMTP id
 ffacd0b85a97d-435f3a7b8camr4932213f8f.21.1769786107315; 
 Fri, 30 Jan 2026 07:15:07 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1322f40sm22297265f8f.34.2026.01.30.07.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 07:15:05 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 988395F89A;
 Fri, 30 Jan 2026 15:15:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 qemu-arm@nongnu.org (open list:SBSA-REF)
Subject: [PULL 2/2] tests/functional: migrate sbsa_ref test images
Date: Fri, 30 Jan 2026 15:15:04 +0000
Message-ID: <20260130151504.550929-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260130151504.550929-1-alex.bennee@linaro.org>
References: <20260130151504.550929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20260128105839.3487840-3-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/tests/functional/aarch64/test_sbsaref.py b/tests/functional/aarch64/test_sbsaref.py
index d3402f5080a..3ff674039e6 100755
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
@@ -54,15 +54,13 @@ class Aarch64SbsarefMachine(QemuSystemTest):
 
     timeout = 180
 
-    ASSET_FLASH0 = Asset(
-        ('https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/'
-         '20241122-189881/edk2/SBSA_FLASH0.fd.xz'),
-        '76eb89d42eebe324e4395329f47447cda9ac920aabcf99aca85424609c3384a5')
+    # SBSA_FLASH0.fd.xz
+    ASSET_FLASH0 = Asset('https://share.linaro.org/downloadFile?id=kyoMLGC9zXa4oA7',
+                         '76eb89d42eebe324e4395329f47447cda9ac920aabcf99aca85424609c3384a5')
 
-    ASSET_FLASH1 = Asset(
-        ('https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/'
-         '20241122-189881/edk2/SBSA_FLASH1.fd.xz'),
-        'f850f243bd8dbd49c51e061e0f79f1697546938f454aeb59ab7d93e5f0d412fc')
+    # SBSA_FLASH1.fd.xz
+    ASSET_FLASH1 = Asset('https://share.linaro.org/downloadFile?id=Dj1HRXnDnKtU6Nj',
+                         'f850f243bd8dbd49c51e061e0f79f1697546938f454aeb59ab7d93e5f0d412fc')
 
     def test_sbsaref_edk2_firmware(self):
 
-- 
2.47.3


