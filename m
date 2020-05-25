Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1794053lfc;
        Mon, 25 May 2020 00:26:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQnM5cK0C6W+og3HZZLHdgnPJQ8bO0eS3xBOarwO944ndh7xM7rVNwtkkQ+aBC+kXuW6t9
X-Received: by 2002:a37:8844:: with SMTP id k65mr26320060qkd.309.1590391617304;
        Mon, 25 May 2020 00:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590391617; cv=none;
        d=google.com; s=arc-20160816;
        b=AsQ0or22e6S4e1yNDEjCHk2Vlnx40aEKD0aoKdalhlOeJ+Mzb61ZQKleWO89F9ecDj
         /uyy6EMKqNBp44eXpG3X4aec33yfvXy61o+/YC4i9mtmi/spJXkSXvV3RYcGuLBN4OTj
         hhjDQiurwzF4ZewWhq45mGIeY50V7n3XXgEMBVNd+Rtew7YSFPMBstop1+YQtdvkmngY
         UAziGsoiYJt3jJMuBEhLMZJUzcdifbhtQlbA6xefndosb2OJyLyuZlFvsuO6VU27Uiw9
         FNqk/SPgj2tvEsAXWCF61rSxCBhswbFprli1hiHB4YPKIkC8bVQbamEx4flLKpFQyGKf
         CE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=1bNu6oGRD8gxdN02xABNvQD2MATRZEUukTxl91nVRgU=;
        b=qQahAfMDn+Sr9m1qddLBl76vW1m7lgEpCMJoya3co0HTKntqJNs1XgZsKbnhfPxrqN
         JBSYfvoGgcg4Jsys3NS6V7fh+cZHllLpv1VjmsSUKSYbPX3ho+AnDMEFNN2t/CnUGDfp
         Hh4g538d3VpBXPwng3dSxJTzclNC4Nzax0eqn8EccO9cOu6x6fAjt8OjJ1pN7WeHXXCW
         d7g5+TWsc+Y9h+BxTP6HsLkcsD6gQRcs4kcwu0/GnFOSspwX/w/7+SS7tKeTysUqLlgj
         LIPsrVk2mF8//P1yMoVJMEjlvgmuD2dT8tP+7nQngMddBpYxS84FuIiz5PgavJEc2Yr3
         O+SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=An4ssYEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r20si9185324qtk.7.2020.05.25.00.26.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 00:26:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=An4ssYEC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jd7Vg-0002vx-Ow
	for alex.bennee@linaro.org; Mon, 25 May 2020 03:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jd7VZ-0002ue-4k
 for qemu-arm@nongnu.org; Mon, 25 May 2020 03:26:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27111
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jd7VX-0000zS-Ee
 for qemu-arm@nongnu.org; Mon, 25 May 2020 03:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590391606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=1bNu6oGRD8gxdN02xABNvQD2MATRZEUukTxl91nVRgU=;
 b=An4ssYECodq2/MG6kRPvpG+yMhISzzRfMgUG1KYkeY9ATXvVa+ZFAicF8Bsg81nWFOZ0aC
 o/4rmH8lEO935wQ7HkKdLHvMOOZL7SEPkDcoAFYdkLCzGHektX4Yn7yIMm3KrPrZMMIC4P
 QOBLZbpvUgT7k0wxCg5iK+ABgOdmQYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-AR_pXaXnPYCLfAUZugo2_g-1; Mon, 25 May 2020 03:26:40 -0400
X-MC-Unique: AR_pXaXnPYCLfAUZugo2_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A58C1107ACCA;
 Mon, 25 May 2020 07:26:39 +0000 (UTC)
Received: from thuth.com (ovpn-113-78.ams2.redhat.com [10.36.113.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCA9C5C1B2;
 Mon, 25 May 2020 07:26:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Subject: [PATCH] tests/acceptance: Add a boot test for the xlnx-versal-virt
 machine
Date: Mon, 25 May 2020 09:26:30 +0200
Message-Id: <20200525072630.22280-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/25 01:44:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: 9nd3jI+NNtes

As described by Edgar here:

 https://www.mail-archive.com/qemu-devel@nongnu.org/msg605124.html

we can use the Ubuntu kernel for testing the xlnx-versal-virt machine.
So let's add a boot test for this now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 0653c8c1bf..430a6c3b43 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -307,6 +307,30 @@ class BootLinuxConsole(Test):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def test_aarch64_xlnx_versal_virt(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:xlnx-versal-virt
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

