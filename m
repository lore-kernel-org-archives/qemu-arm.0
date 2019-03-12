Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1041165wrs;
        Tue, 12 Mar 2019 16:52:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxlezKLAHTaMDr6ss9su0qVy0QTix3+fLEun/iz0YqrKFuELlSeH5L57XItURxzpv8vfYhE
X-Received: by 2002:a81:550b:: with SMTP id j11mr12275287ywb.463.1552434779553;
        Tue, 12 Mar 2019 16:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552434779; cv=none;
        d=google.com; s=arc-20160816;
        b=I8VHcT8pqp5N3Df4X5ppbhEyQrM5qRpGgIdUc/E5N0zUeLTPdT3ZbqVOXbaCH/t6v1
         gQGipfFooHt/XynNB4AjAVos/odckyJhRWFFASeI636YbS2EpWDrFRdtTljJvEGIuiXr
         NuwcAEefpRr/69DdwbCwZBuFKDXxNXQp2IQs8dRX1umiIdYA1Muf0LuTILgS8JMh5wKE
         qAcpyygKQPuMVtEMP7jTrKMOcIMeIVDoq6uTB6Iwy9CMyah1AP/6NULZuG1PwyTPl0iR
         N9f0/s5M0I8ZjQwH0JpCUAwNp2O0sLLgHKC7uP4HTaRubGNbXVwQnZwkVi5vxYWOGa73
         8nEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=m8svK6KAtQkLNuTtpAHeaq+2IbaZl/rztwCdIaLWuhc=;
        b=OT/1Ym0PCJFS76RbIeDLzukQqvBWbx1kU768Ecc8HWfnUtFnH3ScMAwv5QUVMYeo/V
         4rw22LO5r4d30rh4vGOckS+PELdBnKUS/2//1d36Nmcl3WMcI+Mv/V3dQavrIkQQ/voO
         2jHyBR+t++E/qlN7Ff0KBwzG1ZM+q9v3VptnijV1fxvZbVMT6f1oyVjKj7ixLq2s4QTk
         4KCPI52x+m5OSfB+ibUw0cbsM7mXFd/FYWnLgq86n8wH+y4xB2RNUdqXFMxDJuNdkOwv
         7M3tdliqJ/+rT8wg0P5b///MlQLzIzu7Hl3JjGuY2hu1bfwK61pLFhzyoqg6kI62vNZr
         4wtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1si4109486ywa.97.2019.03.12.16.52.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 16:52:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35202 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3rCc-00030w-V5
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 19:52:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3rCK-0002te-Qw
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 19:52:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3r5s-0002BF-Ao
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 19:46:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49404)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h3r5s-00029f-3I; Tue, 12 Mar 2019 19:46:00 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4FF5A3087921;
	Tue, 12 Mar 2019 23:45:59 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-23.brq.redhat.com [10.40.204.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37C8D1973B;
	Tue, 12 Mar 2019 23:45:55 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Cleber Rosa <crosa@redhat.com>
Date: Wed, 13 Mar 2019 00:45:41 +0100
Message-Id: <20190312234541.2887-3-philmd@redhat.com>
In-Reply-To: <20190312234541.2887-1-philmd@redhat.com>
References: <20190312234541.2887-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 12 Mar 2019 23:45:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 2/2] Boot Linux Console Test: add a test for
 the Raspberry Pi 2
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RhD4jSam8KN+

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Similar to the x86_64/pc test, it boots a Linux kernel on a raspi2
board and verify the serial is working.

If ARM is a target being built, "make check-acceptance" will
automatically include this test by the use of the "arch:arm" tags.

Alternatively, this test can be run using:

    $ avocado run -t arch:arm tests/acceptance
    $ avocado run -t machine:raspi2 tests/acceptance

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 tests/acceptance/boot_linux_console.py | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
index 0936589fd8..dd2733b55f 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -197,6 +197,35 @@ class BootLinuxConsole(Test):
         console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
         self.wait_for_console_pattern(console_pattern)
=20
+    def test_arm_raspi2(self):
+        """
+        The kernel can be rebuilt using the kernel source referenced
+        and following the instructions on the on:
+        https://www.raspberrypi.org/documentation/linux/kernel/building.=
md
+
+        :avocado: tags=3Darch:arm
+        :avocado: tags=3Dmachine:raspi2
+        """
+        deb_url =3D ('http://archive.raspberrypi.org/debian/'
+                   'pool/main/r/raspberrypi-firmware/'
+                   'raspberrypi-kernel_1.20190215-1_armhf.deb')
+        deb_hash =3D 'cd284220b32128c5084037553db3c482426f3972'
+        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
+        print("deb_path: ", deb_path)
+        kernel_path =3D self.extract_from_deb(deb_path, '/boot/kernel7.i=
mg')
+        dtb_path =3D self.extract_from_deb(deb_path, '/boot/bcm2709-rpi-=
2-b.dtb')
+
+        self.vm.set_machine('raspi2')
+        self.vm.set_console()
+        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=3DttyAMA0')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-dtb', dtb_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
+        self.wait_for_console_pattern(console_pattern)
+
     def test_s390x_s390_ccw_virtio(self):
         """
         :avocado: tags=3Darch:s390x
--=20
2.20.1

