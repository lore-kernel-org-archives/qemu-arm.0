Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2075404lfc;
        Mon, 25 May 2020 07:13:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQp0IMwoByH04bMVDHnZN2qDW64pBiofRSsCoQUcK0M7JTKSABgEyLrUh2kd+kOwBIpwtk
X-Received: by 2002:a25:44c5:: with SMTP id r188mr42474036yba.514.1590415989245;
        Mon, 25 May 2020 07:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590415989; cv=none;
        d=google.com; s=arc-20160816;
        b=EK0ZFvkjbXtytuLCkmL4IbpXgnLOf4r0sflzElcwZeuxdytDsw7x8RsXEsB59PHGHk
         aJBGm8brOxDzt5dwVes/c85ziwnAwMkFXhKCB9hIZCv7VXQFP9rEETXd5Jw1wSRynxwC
         zuyEI1oVUKH3RJU5qQZ2upFySMny9AY8EstT5MZd3SCB5vWZ5T2Y02L/cdhCWKADdlam
         e+SmkLW0hWNfrdnuSmfmjd1R+F2fM2Mnol/QRWvFrL+vIKto3uykx8DtlTjzEg9DCMO5
         XzwPrPbw1RtbHFJ3lRlYu7yTU0h8sNBlZQM9YoLfjTTel2+OGmuLPQ6+Yvn1hdIEb7vc
         zrPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=F1/MlzvgtYm4HqrWVwHKmSSWH9RCyf6QXCHR1rSWbNI=;
        b=wrzczKItFfuMJyaWrs7xqWXvordeuWTe6Hor9GlzLRzW0FmLgB06zqV/WKevNVRVFO
         tcB+rBh7N3z0B4MzfukDcxW/2lHskULjo/anxNdgbcKdshAsXUGMFVOa0GckPG+Cejqs
         mZ4J4FHhYYNxJyhBU5QkNzfaBDzaBnnL2vVugxlFaC1mLRI8bulxwY03SiqmD3jkvbqk
         ceUARig9qoA5f0VjBvNhILlWAJvpclmhLwHGq9T7VIJm5GJR3wcAqlwu5jKzHty6nJFG
         H9XEcmhZ1qFvwCPWcWwJpNwY5cKVTRsDxM/QxWm6JcAYODZER5HzhG5J+9MoVxDYpkTY
         ysPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dv5xuuIq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13si14920336ybq.173.2020.05.25.07.13.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 07:13:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dv5xuuIq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdDqm-0003LU-KU
	for alex.bennee@linaro.org; Mon, 25 May 2020 10:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdDqY-000382-Ut
 for qemu-arm@nongnu.org; Mon, 25 May 2020 10:12:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39230
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdDqW-0005Pv-Kf
 for qemu-arm@nongnu.org; Mon, 25 May 2020 10:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590415971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=F1/MlzvgtYm4HqrWVwHKmSSWH9RCyf6QXCHR1rSWbNI=;
 b=dv5xuuIq/GX0LzoYOXa5WKzC6m3uuicsrvIkVawkEE+PBo7aRqYOYHNN6j9Jvz0XO6Zgcv
 ICwlwJwd5jMVhozJaODVF1VY8ZuYeD8jB0LpeR5NsU+jpFoaN9136VbLM3NCWwjmrr3Myt
 FxJ8GceZo7QpVFwlYstLFgddjteR8d8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-isqpL-wVObKT8NhhL0Ajmg-1; Mon, 25 May 2020 10:12:48 -0400
X-MC-Unique: isqpL-wVObKT8NhhL0Ajmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB7F1107ACF3;
 Mon, 25 May 2020 14:12:46 +0000 (UTC)
Received: from thuth.com (ovpn-113-78.ams2.redhat.com [10.36.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D232C60C47;
 Mon, 25 May 2020 14:12:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Subject: [PATCH v2] tests/acceptance: Add a boot test for the xlnx-versal-virt
 machine
Date: Mon, 25 May 2020 16:12:37 +0200
Message-Id: <20200525141237.15243-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 08:28:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Cleber Rosa <crosa@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wh6yRqo9yBwI

As described by Edgar here:

 https://www.mail-archive.com/qemu-devel@nongnu.org/msg605124.html

we can use the Ubuntu kernel for testing the xlnx-versal-virt machine.
So let's add a boot test for this now.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Added "tags=device:pl011" and "tags=device:arm_gicv3"

 tests/acceptance/boot_linux_console.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 0653c8c1bf..965272387c 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -307,6 +307,32 @@ class BootLinuxConsole(Test):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def test_aarch64_xlnx_versal_virt(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:xlnx-versal-virt
+        :avocado: tags=device:pl011
+        :avocado: tags=device:arm_gicv3
+        """
+        kernel_url = ('http://ports.ubuntu.com/ubuntu-ports/dists/'
+                      'bionic-updates/main/installer-arm64/current/images/'
+                      'netboot/ubuntu-installer/arm64/linux')
+        kernel_hash = '5bfc54cf7ed8157d93f6e5b0241e727b6dc22c50'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
+        initrd_url = ('http://ports.ubuntu.com/ubuntu-ports/dists/'
+                      'bionic-updates/main/installer-arm64/current/images/'
+                      'netboot/ubuntu-installer/arm64/initrd.gz')
+        initrd_hash = 'd385d3e88d53e2004c5d43cbe668b458a094f772'
+        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
+
+        self.vm.set_console()
+        self.vm.add_args('-m', '2G',
+                         '-kernel', kernel_path,
+                         '-initrd', initrd_path)
+        self.vm.launch()
+        self.wait_for_console_pattern('Checked W+X mappings: passed')
+
     def test_arm_virt(self):
         """
         :avocado: tags=arch:arm
-- 
2.18.1

