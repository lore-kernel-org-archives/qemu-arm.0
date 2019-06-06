Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp5016431wrg;
        Thu, 6 Jun 2019 16:08:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzoLHE3ogHWhzAvyYI1pCr9Pt6dfeCpAD51edOHE3cI6An7wZTSrzpFTeI7/C4aLMeyJ+OJ
X-Received: by 2002:a0c:afcd:: with SMTP id t13mr41228156qvc.58.1559862526090;
        Thu, 06 Jun 2019 16:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559862526; cv=none;
        d=google.com; s=arc-20160816;
        b=ZGVCbpEHy4RoXX9PDMLv+msHjzjOqwsYyxKg4w4/Lobkxcb7I/8XnnH8V2qn4OmHiR
         D/ZtQa9RKvyR+7dTQYpRIF3UzkbXdOMjPxdAT7k3/w1PEM4mdxAuYAT8KyKMiPC3wpkr
         fWS49lR9iZMLNjwnXAB9PIS1T5/J2n3IPQ8rfe5sNKXevJib1V9UyOcLa873rFfz21/k
         q7P5WGDV5TwUuJSyco2HZbn01OC3XW3AEcXk2LbsmDQd8f0lgExCAcXRHJ1PRfdN1jRI
         CXYCdZJbHlynP6FeGx3/aIgo/LQEOe7YxQXII0rH6W8XSH31d6RgyAn1gt1BhGrJO6RM
         aHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=zg7fqS/H6yzy6AKwE1QItjwqgFfAKJMn4TIBcp8Po+Y=;
        b=CzUbpo98heC1wulrlr9gZn9lvMkAIo0G2iq+O+ZP3JyglD4E48wR72jXjnJtqN86R3
         dXTgL/iriKD0PFGIbSko7ucdQXyIAMFSXMbFRlveXHu/4sQv25w7MP/XRE6xLCARB2Vr
         87cAnSM9q+aRE854l2NKPF2o3SCPVDLRESkQeAws5UIyzLEZATpW8WGAjb8Qhgi46vWj
         v4EfvbIWEzYylvQld5ac2y50x+OO6T4pYb9FlhXiTEJfUpjp4jWj8ZGOICyXd9RdvUxd
         JsbO5fHlzREnFkMJXmNmavGgQ8JThrpi3Pzmlem4/w/NFzipqtgbmkU7+tSYOvIQse/9
         8s7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.47])
        by mx.google.com with ESMTPS id 43si259913qtr.78.2019.06.06.16.08.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jun 2019 16:08:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) client-ip=209.51.188.47;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZ1Uz-0002XP-LF
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 19:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40193)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hZ1Rw-0007Wl-88
 for qemu-arm@nongnu.org; Thu, 06 Jun 2019 19:05:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hZ1IL-0006lw-9u
 for qemu-arm@nongnu.org; Thu, 06 Jun 2019 18:55:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51736)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hZ1IK-0006Xp-HE; Thu, 06 Jun 2019 18:55:41 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5125059469;
 Thu,  6 Jun 2019 22:55:33 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-32.brq.redhat.com [10.40.204.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2D732E19B;
 Thu,  6 Jun 2019 22:55:29 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Fri,  7 Jun 2019 00:55:20 +0200
Message-Id: <20190606225521.9187-2-philmd@redhat.com>
In-Reply-To: <20190606225521.9187-1-philmd@redhat.com>
References: <20190606225521.9187-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 06 Jun 2019 22:55:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 1/2] BootLinuxConsoleTest: Do not log empty
 lines
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vSEWsZLRNg5d

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Avoid to log empty lines in console debug logs.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Acked-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
v2: no change
---
 tests/acceptance/boot_linux_console.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
index d5c500ea30..f593f3858e 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -37,8 +37,10 @@ class BootLinuxConsole(Test):
         console =3D self.vm.console_socket.makefile()
         console_logger =3D logging.getLogger('console')
         while True:
-            msg =3D console.readline()
-            console_logger.debug(msg.strip())
+            msg =3D console.readline().strip()
+            if not msg:
+                continue
+            console_logger.debug(msg)
             if success_message in msg:
                 break
             if failure_message in msg:
--=20
2.20.1

