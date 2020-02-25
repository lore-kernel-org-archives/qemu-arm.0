Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1948797lfg;
        Tue, 25 Feb 2020 09:25:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqxrNKD9y/ug5Ue1vmEP5rgtpfILlRCHRCH5Y50yEUBTiy8ySpflMAUug9PVN4WQFcQnbpIo
X-Received: by 2002:ac8:592:: with SMTP id a18mr55079001qth.107.1582651553332;
        Tue, 25 Feb 2020 09:25:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582651553; cv=none;
        d=google.com; s=arc-20160816;
        b=UU4Io5d1Xa05EtHWH6/o53hOBZabM+J/Xs5oGLz2eJ6pQqyoZaV/cPX4YvLKfRdRKv
         Vbx9d+Nzg6LR4IskRgNeHKhF/aNE4TJPobgjTQrWQfxeEQQl//cgg8c99CfvPOxccku/
         BHQS+JAYIjyx/jtaxw1kLMAWlNP/SuSnoYrF2ZJI/VABkcdrovtTXKOg54KKmMlTBQ1n
         ouv4W8UYYBm2+dDnDncy6vGzDBLBlE/AlWIZ11+Q10/lie7/YhHnrRhn3j6Ut3tjHfHA
         nFDbqTkRA5iDJhb6SvFBHnj/YQKpLgyFXcpirSPfVmgo0Gy3IDDOtV6/eLIuRdVD7vnh
         AcOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dwOy7T6zNBV+JaHegxs0HatnwG/xt++Cu5QA75IMhb4=;
        b=CeIZ0t0GUSYOiV4SnEhjesJXzN3nQDHRUV138aJHETcgBqiXiKCrGkDMgnt/d42QBK
         g9DEZUC5XoSfdIEav0QfU+BuHHBdJyirSFMFgELrJ5Mbc9WZYPgboTzV3pDUfaDIHnaZ
         qgbZpa/if0G9ui9TueYja4RrsfgkHVDez3YQWl75IKlGL7PO3e5vb7xe1mdvblL320FQ
         MQnZcejxkA1pvdmI43o7g8oRYHdlQtzU56l+Vhx4awyskwDoVFMCMBhYJCm4tgKvFFc/
         1JxeQDiAJMNOxdd9VeLApKVLZH8dlqKa9BQ7Cv34GjNpVgPp4XDfmNfVBF2NLOmW9Gs0
         VhcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CY5X43vZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si7377744qvo.6.2020.02.25.09.25.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 09:25:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CY5X43vZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6dxw-0001YE-IN
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 12:25:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39383)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6dxZ-0001Sn-Dy
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:25:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6dxY-0008F7-7H
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:25:29 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38703
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6dxY-0008ET-4I
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 12:25:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582651527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dwOy7T6zNBV+JaHegxs0HatnwG/xt++Cu5QA75IMhb4=;
 b=CY5X43vZ7J0+FoCQLYJE0ok1zEXRqhmz3g2pj2E1/C0kk4VM/ku9slLUxKujW8aExcu+FV
 /Jm8Nrk66uuR+QPeR9Aheu3hueqYxG5W4ZvjbL2NLPiHPqHmnv2dGnmObSPhyoFlYwXcQL
 KDHFEGgu7GK/jInk4xiTvFxEw1DpGjg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-57o4NEeANhm5xs_CKFI0Rw-1; Tue, 25 Feb 2020 12:25:19 -0500
X-MC-Unique: 57o4NEeANhm5xs_CKFI0Rw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DD61477;
 Tue, 25 Feb 2020 17:25:18 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-195.brq.redhat.com [10.40.205.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26ED161069;
 Tue, 25 Feb 2020 17:25:14 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] tests/acceptance: Extract boot_integratorcp() from
 test_integratorcp()
Date: Tue, 25 Feb 2020 18:25:00 +0100
Message-Id: <20200225172501.29609-4-philmd@redhat.com>
In-Reply-To: <20200225172501.29609-1-philmd@redhat.com>
References: <20200225172501.29609-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MUfz4XYB0lww

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

As we want to re-use this code, extract it as a new function.
Since we are using the PL011 serial console, add a Avocado tag
to ease filtering of tests.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 tests/acceptance/machine_arm_integratorcp.py | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tests/acceptance/machine_arm_integratorcp.py b/tests/acceptanc=
e/machine_arm_integratorcp.py
index d928ed79b4..22afd3b82a 100644
--- a/tests/acceptance/machine_arm_integratorcp.py
+++ b/tests/acceptance/machine_arm_integratorcp.py
@@ -18,13 +18,7 @@ class IntegratorMachine(Test):
=20
     timeout =3D 90
=20
-    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code=
')
-    def test_integratorcp_console(self):
-        """
-        Boots the Linux kernel and checks that the console is operational
-        :avocado: tags=3Darch:arm
-        :avocado: tags=3Dmachine:integratorcp
-        """
+    def boot_integratorcp(self):
         kernel_url =3D ('https://github.com/zayac/qemu-arm/raw/master/'
                       'arm-test/kernel/zImage.integrator')
         kernel_hash =3D '0d7adba893c503267c946a3cbdc63b4b54f25468'
@@ -40,4 +34,14 @@ def test_integratorcp_console(self):
                          '-initrd', initrd_path,
                          '-append', 'printk.time=3D0 console=3DttyAMA0')
         self.vm.launch()
+
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code=
')
+    def test_integratorcp_console(self):
+        """
+        Boots the Linux kernel and checks that the console is operational
+        :avocado: tags=3Darch:arm
+        :avocado: tags=3Dmachine:integratorcp
+        :avocado: tags=3Ddevice:pl011
+        """
+        self.boot_integratorcp()
         wait_for_console_pattern(self, 'Log in as root')
--=20
2.21.1

