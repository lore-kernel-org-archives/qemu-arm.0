Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1041169wrs;
        Tue, 12 Mar 2019 16:52:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzaCBSfHGdR239lLbG/JbQ7DLXazQU5wg/PwwXrc1zgnWXF2uAKVhhmIAouHhNPUUtZX00P
X-Received: by 2002:a0d:e80c:: with SMTP id r12mr32871860ywe.394.1552434779857;
        Tue, 12 Mar 2019 16:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552434779; cv=none;
        d=google.com; s=arc-20160816;
        b=UpvN9QEXVdZN0juugTBPcbpm2I0yIn23T48nApi3eNku5QpuXiuIjqb4SyIY30jpXS
         d0OX4EqDHp4/TDtop1v6MH0HgNAvCtIpz9COgleEWjgCZWkaBbdj1jhwPXAFAg2vKCrb
         kJ4qouGNMannyqTB0+AXEmz0TsZJSV/maScthjbx/QzHyzySBTSxrnQVBJRfh9sYzkWE
         JgLccJO16ztE8aqhFm6GP52l4cLonZsyMS4RsGuB/LhvrzDDpZmiB90rwakWRbJNk9zx
         mg4YK5NviZUX+NHLeqz8npVm0wq04VdRuVw2XmJfOwsG2CbNNocry56LnImYTtU3Ixdz
         ClQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=RzyJA2Q2cgHRwYKgk3C36tXvIPdfPlicw4QTMzcpBcY=;
        b=UadLDL3GADQPpC5cOBRzhSpc3DGBPkwP1Wm1aYccLmTyGOCmVTGeJwX2YvLUQCMH93
         fgpytEvwyAlJ2OPixaidIu0SBDdzT7OgPdwVfnw3Dj4zTmVdEU1yu+h9gH8w62v1Xwpg
         ukNVRKQtG7CgvXWVftgC0GoOYs3BfneSIT96633CGLuqPDM3+zE15YA4e4EYCg1cJAjJ
         xXENL8c5fVMqGYL8y5kO735fA0gxFi3E0mNJhjSmabhvlNy81JLSQGgYETUOSUqmkXnB
         1YJSd8e3K0LDoFKtMIsZDZSaJ9xMxeil32n0DavTYFBTveGhfsc2L8ASlQhV/7gcPNJu
         X62w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si5784582ywg.82.2019.03.12.16.52.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 16:52:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35204 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3rCd-000322-7g
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 19:52:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3rCM-0002te-8q
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 19:52:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h3r5o-00024D-Hv
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 19:45:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33958)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1h3r5o-00022o-Ac; Tue, 12 Mar 2019 19:45:56 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9887013A4D;
	Tue, 12 Mar 2019 23:45:55 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-23.brq.redhat.com [10.40.204.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36DB21973B;
	Tue, 12 Mar 2019 23:45:51 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Cleber Rosa <crosa@redhat.com>
Date: Wed, 13 Mar 2019 00:45:40 +0100
Message-Id: <20190312234541.2887-2-philmd@redhat.com>
In-Reply-To: <20190312234541.2887-1-philmd@redhat.com>
References: <20190312234541.2887-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 12 Mar 2019 23:45:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 1/2] BootLinuxConsoleTest: Let
 extract_from_deb handle various compressions
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8O4nWNh2H2os

Debian binary package format supports various compressions.

Per man deb(5):

  NAME
    deb - Debian binary package format

  FORMAT
    ...
    The third, last required member is named data.tar.  It contains the
    filesystem as a tar archive, either not compressed (supported since
    dpkg 1.10.24), or compressed with gzip (with .gz extension),
    xz (with .xz extension, supported since dpkg 1.15.6),
    bzip2 (with .bz2 extension, supported since dpkg 1.10.24) or
    lzma (with .lzma extension, supported since dpkg 1.13.25).

List the archive files to have the 3rd name with the correct extension.

The function avocado.utils.archive.extract() will handle the different
compression format for us.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Use process.run() (Cleber)
---
 tests/acceptance/boot_linux_console.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
index 23fca39422..0936589fd8 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -55,8 +55,9 @@ class BootLinuxConsole(Test):
         """
         cwd =3D os.getcwd()
         os.chdir(self.workdir)
-        process.run("ar x %s data.tar.gz" % deb)
-        archive.extract("data.tar.gz", self.workdir)
+        file_path =3D process.run("ar t %s" % deb).stdout_text.split()[2=
]
+        process.run("ar x %s %s" % (deb, file_path))
+        archive.extract(file_path, self.workdir)
         os.chdir(cwd)
         return self.workdir + path
=20
--=20
2.20.1

