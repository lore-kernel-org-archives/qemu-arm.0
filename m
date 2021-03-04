Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6564381lfg;
        Thu, 4 Mar 2021 12:40:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9J5AXqizIvduqxPaU22gW3kh+vkVplvCQg2IfB8bN6JUxPKqx+ItdBY2FiP3I8j17aF9D
X-Received: by 2002:a02:24a:: with SMTP id 71mr6119719jau.22.1614890402884;
        Thu, 04 Mar 2021 12:40:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614890402; cv=none;
        d=google.com; s=arc-20160816;
        b=S3y6NQtm/a7bhbCFmpjK3vlCyZtLQ8+I9wrpdbT0CmHx9x0+B7QVOz6zEv1UPa0hrl
         Lji58FgEuAVaUtQybyqkDhstURXTA10t51NfYYBsMrCgJLbTnF+POUA2l922TsSBsDzf
         yj9FhBM5dmUe6QQeWQObJLXZtdk29s7RTpwXWIjEMzOpfW1hRCZ2kgkkxwj89I5YGuEI
         6hkIopRBgwDwVk+vQEBaPu4TfTxm47JNB1BK53rQHa870/UylILLCIw5ohuHoB86e4Bu
         5tkQ2cQ+tBseDIbwtdDNRrkqzHVZoLLYVhoguJx3z3CeyMEJVo6MkW9rJTUlq4QbXTyR
         2oZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eX+StC+s06++yjOppbmGqXt7Tl26dHtgKxlBKwffk6k=;
        b=lCt45M2EE6AyeEWQPkwP6mEzRiLEObioOOABwO1rWskZWV1eaqNRAiSci/svmAzG4k
         O+8x0cpx0TtplSWtX/0BEu/0d/z83zY471r4Wa/p37xkcGiMHdhmri55ezawS4VYaBCz
         YCWpez4q5RbkuyJb0ej3W+hCzUWEWLHbQugdhky96ctvQ0U+IhsuiTve/rYe85OgjipX
         abmAO/Nc6Y0Hy6Q7kEUfwU33xpuX8rSZBeOueulpHt2OTfTKbDPUyijNZQzOnHSWPzj5
         2WJq7XWrHseKwFMViN+f3UsxaOLA2HXH3MJ+mFKjueC38+7lNbDNDMXC9GbnDd500iiS
         yLJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Pa91D94f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si414305jat.21.2021.03.04.12.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 12:40:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Pa91D94f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHulO-0005Kk-5K
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 15:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lHuhZ-0001hV-0a; Thu, 04 Mar 2021 15:36:05 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lHuhR-0005Kt-HT; Thu, 04 Mar 2021 15:36:03 -0500
Received: by mail-ej1-x636.google.com with SMTP id hs11so52058053ejc.1;
 Thu, 04 Mar 2021 12:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eX+StC+s06++yjOppbmGqXt7Tl26dHtgKxlBKwffk6k=;
 b=Pa91D94f0Ro9q7tplrIFam76VZ6YeYlC/qnBuLC1UqswZxg0YPzHYkDv8rGav1Oh4e
 WIXNXReBjACXXFCImrj/ATlTxQjuoPfJaWI+iRO5+PsXrtS+56vZkF176VpMvIFclsjG
 ykAp3HgcP1DixRegwDtQ3anlQQb7eCxDs8btY2ejsTVvINKK8vmXgORvG1IHFZ9KQO24
 bGbyd9YWoxgPa6iDTQdQurdSPZhNh958hN7H7t0HlDakh3RB7GhaF6fGl6kzQNoOK2lc
 WHxlNBPf4yEBFpXQKtnwiEXPWabtKQ2PynYSfO5m5xD8kjm77JCM/w6OJfMS4LERL75g
 Krsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eX+StC+s06++yjOppbmGqXt7Tl26dHtgKxlBKwffk6k=;
 b=IwNzS4G8AITZn2ZZ5SfWFHlhTlpSQjY6BB8HKKEmgP2DyylCnBI1lMhFRzOiHxHHzi
 LQhengqbv0GA/udNn8q/9UepRsSwLgkdQ88ExaXuKQYtAqO3zjll3mIlpHn2Nc9toj3+
 +2lutL9R+XET4ARQhVpOaR+exmkEuveMfYTSlRPTbX1Pnnw1nHaodx7l9SMsee5HRek4
 hF9KJdf0kflRo/oAqc2seSsx5FT28GMAG/ypoTH0pxKIcleiNXCa3RC1K+QiYC/rhveI
 dN+kMN+9FFp0r038W1u+pCyWp5AFmcopcHSOzkl4Y7o/gOg+shqbLyaC+enVJq2SpQUH
 LJEg==
X-Gm-Message-State: AOAM530VUKr3RfKCfFyscgqf06RI1s1Ctiy++DiTmypUR6AgZw/7RNor
 PjwtYYUD+pe1/vjJZyfsTz94X7/N8TPSYw==
X-Received: by 2002:a17:906:5295:: with SMTP id
 c21mr6304645ejm.67.1614890155644; 
 Thu, 04 Mar 2021 12:35:55 -0800 (PST)
Received: from tuf.home (2a02-a456-6be8-1-ebf2-7b2-6f3d-5954.fixed6.kpn.net.
 [2a02:a456:6be8:1:ebf2:7b2:6f3d:5954])
 by smtp.gmail.com with ESMTPSA id t8sm289956edv.16.2021.03.04.12.35.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 12:35:55 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] tests/acceptance/boot_linux_console: remove Armbian
 19.11.3 bionic test for orangepi-pc machine
Date: Thu,  4 Mar 2021 21:35:37 +0100
Message-Id: <20210304203540.41614-3-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304203540.41614-1-nieklinnenbank@gmail.com>
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 f4bug@amsat.org, b.galvani@gmail.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Pavel.Dovgaluk@ispras.ru, crosa@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P5kx2YCywhYd

The image for Armbian 19.11.3 bionic has been removed from the armbian server.
Without the image as input the test arm_orangepi_bionic_19_11 cannot run.

This commit removes the test completely and merges the code of the generic function
do_test_arm_orangepi_uboot_armbian back with the 20.08 test.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 tests/acceptance/boot_linux_console.py | 72 ++++++++------------------
 1 file changed, 23 insertions(+), 49 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index eb01286799..9fadea9958 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -802,7 +802,29 @@ def test_arm_orangepi_sd(self):
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
-    def do_test_arm_orangepi_uboot_armbian(self, image_path):
+    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
+                'Test artifacts fetched from unreliable apt.armbian.com')
+    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
+    def test_arm_orangepi_bionic_20_08(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:orangepi-pc
+        :avocado: tags=device:sd
+        """
+
+        # This test download a 275 MiB compressed image and expand it
+        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
+        # As we expand it to 2 GiB we are safe.
+
+        image_url = ('https://dl.armbian.com/orangepipc/archive/'
+                     'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
+        image_hash = ('b4d6775f5673486329e45a0586bf06b6'
+                      'dbe792199fd182ac6b9c7bb6c7d3e6dd')
+        image_path_xz = self.fetch_asset(image_url, asset_hash=image_hash,
+                                         algorithm='sha256')
+        image_path = archive.extract(image_path_xz, self.workdir)
+        image_pow2ceil_expand(image_path)
+
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image_path + ',if=sd,format=raw',
                          '-nic', 'user',
@@ -828,54 +850,6 @@ def do_test_arm_orangepi_uboot_armbian(self, image_path):
                                       'to <orangepipc>')
         self.wait_for_console_pattern('Starting Load Kernel Modules...')
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
-    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
-    @skipUnless(P7ZIP_AVAILABLE, '7z not installed')
-    def test_arm_orangepi_bionic_19_11(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:orangepi-pc
-        :avocado: tags=device:sd
-        """
-
-        # This test download a 196MB compressed image and expand it to 1GB
-        image_url = ('https://dl.armbian.com/orangepipc/archive/'
-                     'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.7z')
-        image_hash = '196a8ffb72b0123d92cea4a070894813d305c71e'
-        image_path_7z = self.fetch_asset(image_url, asset_hash=image_hash)
-        image_name = 'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.img'
-        image_path = os.path.join(self.workdir, image_name)
-        process.run("7z e -o%s %s" % (self.workdir, image_path_7z))
-        image_pow2ceil_expand(image_path)
-
-        self.do_test_arm_orangepi_uboot_armbian(image_path)
-
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
-    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
-    def test_arm_orangepi_bionic_20_08(self):
-        """
-        :avocado: tags=arch:arm
-        :avocado: tags=machine:orangepi-pc
-        :avocado: tags=device:sd
-        """
-
-        # This test download a 275 MiB compressed image and expand it
-        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
-        # As we expand it to 2 GiB we are safe.
-
-        image_url = ('https://dl.armbian.com/orangepipc/archive/'
-                     'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
-        image_hash = ('b4d6775f5673486329e45a0586bf06b6'
-                      'dbe792199fd182ac6b9c7bb6c7d3e6dd')
-        image_path_xz = self.fetch_asset(image_url, asset_hash=image_hash,
-                                         algorithm='sha256')
-        image_path = archive.extract(image_path_xz, self.workdir)
-        image_pow2ceil_expand(image_path)
-
-        self.do_test_arm_orangepi_uboot_armbian(image_path)
-
     @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
     def test_arm_orangepi_uboot_netbsd9(self):
         """
-- 
2.25.1

