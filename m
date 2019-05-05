Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1446726wrh;
        Sun, 5 May 2019 07:17:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMirkX8SVqbeuGNZYZzrqywYgtdFDpADDznzzEkJxfBJnUKZTO0/ZZ6HhPcLB8mmZyAbHi
X-Received: by 2002:adf:eb0c:: with SMTP id s12mr13868399wrn.229.1557065862305;
        Sun, 05 May 2019 07:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557065862; cv=none;
        d=google.com; s=arc-20160816;
        b=nYoE/nclCGsvHpLprnm3kvw2qJukT26y9nVAoqgmduFeo4FBJ0d0SjFsADUrZnOLy1
         c3m7s22xxzoGQfi0hFbQ9QcnEsKXKJ+qj9BpuQ6lpMYvC1KgkhIRFZn1qWZRuJfGNX/G
         5j57+uDuaAoIRjiPigDr1qFFU3gDziTdoA0YTpLeSCJAILLbuaQRrXOYDjggKaS4wJhB
         lA72t5cFwUDjtB9rmXd0/ECWC3HIkMhWA2XaQwrsohqyLBmn70aC0lAOvf70EpcD5DJD
         LdFqigxNWyJeXkP9DAwU1DMtyT3o7cR8M+CYGzk5mz9PMqVbsRzBSg6e0XhraoyQOqdR
         ja9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=jHP+ljXJEJNSfLdYybiCO0q8wAY/N0xKAICySc0IYmw=;
        b=cPt0y0wR5l/HA0ajn6xxMvA+nBo8hCdQBKq8ibCbJ0hDUffSiVEni/oet0BN2+3ewA
         r6qrG1Wd2Vw76KaMbw5hnMrr67yl0Pk5biYIuI2OBJCg+4GN4n4Rb/Nd3h8UhljHJ70D
         8jD/9rF7PsfUVlO+qBTzfB2HZCflXVvnjghuqzQqDBrm5NaSm1WgnCbFwzQJRk+LCkUH
         Z71dFeuGtvTyV1xt37hBEQen0wVdlteaTfoUhVKH+VyW+cmG0JBD9aXof7LavEzm2i8p
         v3luJVpxeFGYXoxE8rlWpZJDhO9lej0kVean5uNZQhijHIx3zq8hCFfGASvuRIS+Y0rb
         in0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si2950487wmh.152.2019.05.05.07.17.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:17:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHxV-00052T-Ce
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:17:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeU-0004ez-Mc
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeT-000541-Mt
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:58:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44826)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHeS-00050z-CV; Sun, 05 May 2019 09:58:01 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DAA1AC057E37;
	Sun,  5 May 2019 13:57:57 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB45D60C47;
	Sun,  5 May 2019 13:57:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:57:13 +0200
Message-Id: <20190505135714.11277-28-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sun, 05 May 2019 13:57:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 27/28] hw/arm: Express dependencies of the musca
 machines with Kconfig
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uDozXLUCSUt/

Dependencies have been determined with trial-and-error and by
looking at the musca.c source file.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 9609caef87..af8cffde9c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -75,6 +75,12 @@ config MAINSTONE
     select PFLASH_CFI01
     select SMC91C111
=20
+config MUSCA
+    bool
+    select ARMSSE
+    select PL011
+    select PL031
+
 config MUSICPAL
     bool
     select BITBANG_I2C
@@ -427,6 +433,3 @@ config ARMSSE_CPUID
=20
 config ARMSSE_MHU
     bool
-
-config MUSCA
-    bool
--=20
2.21.0

