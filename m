Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2685876wrg;
        Mon, 17 Jun 2019 09:20:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVw9bx32n+TPFz5F0O9ER3pOdcDYEgAba9KhLzQcrqjujf2Qq5hearOJCCB87rUeGrO/GI
X-Received: by 2002:a17:907:20b7:: with SMTP id pw23mr4564481ejb.127.1560788406281;
        Mon, 17 Jun 2019 09:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560788406; cv=none;
        d=google.com; s=arc-20160816;
        b=xBAkpcl2EXfIZOJa8XxoYzLAI2NKfWRrlLu/bXjzSBW3CwupMFhAerk9pyXTKv9+yo
         UaZ1aRJ4bGeCI7LX0A+XQeUxTmlpgXbZoc5LYb2mT/04jZQ6MnXXTeeqbAO9ExbBGURn
         swWxLjR/nqSiu7w0Tqk9I6SciZiZJONmxZXTGP17GbOUudfaKvHS2m0Y980HQngwdtrJ
         EaYf0UBNPHLxf/VZPHkUJe2AsqLWkLB+0E4bKfo9iDBkVeO2XckYN/l0UC52fEvvIFwj
         6921XjzeLivaXRHDT2Uu9vm07ldnJOCasbLBBBDPHRvLpQiGlf5uWQzlnxfzQbIw4cjb
         XPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=he1SeEzOStwgaRq81JViivMBwTK9TrYX4K3Q/KZS7+Q=;
        b=H6o5Opbc8mw9uJaDsxgdhW0Ebzl2302KrfFFgt1HVvfnRlh5KdoWTjO5h7jTil7mFM
         PaClCdriZTw9rqBLcuG3PDoD6nnwHYiUX1F2rLxAMWvmVYuJ0M9zDa8QCbWA5p07GGvr
         flfQ2ftGQFMHZyvdeyf07hGMVK9vf7K3NCAw6QW+uHbp3tMOBO7M3k1r7RM1c3OOnZT5
         cjt5Xgm+2ZHhySFqMAuwwjdf2PUiFSRIFXiam1TjjsWwNXBmIVDMwwQbqAX37JNCBHIO
         fA56Htp7icl60deuinWZdTDSFf9TQ86oDiwkJ82xAJK/E7HgRROPwAeMEwQdHg8DzB3V
         tSxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x41si5783125edb.240.2019.06.17.09.20.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 09:20:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49036 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcuMX-00032n-AD
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 12:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44285)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcu56-0004Ys-MN
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:02:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcu54-0006lD-KK
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 12:02:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63750)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcu4x-0006QS-4l; Mon, 17 Jun 2019 12:01:55 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D98AEF9E85;
 Mon, 17 Jun 2019 16:01:44 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-19.brq.redhat.com [10.40.204.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C03F6A480;
 Mon, 17 Jun 2019 16:01:38 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 18:01:36 +0200
Message-Id: <20190617160136.29930-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 17 Jun 2019 16:01:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hw/arm/msf2-som: Exit when the cpu is not the
 expected one
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gyfQH3HxZjzR

This machine correctly defines its default_cpu_type to cortex-m3
and report an error if the user requested another cpu_type,
however it does not exit, and this can confuse users trying
to use another core:

  $ qemu-system-arm -M emcraft-sf2 -cpu cortex-m4 -kernel test-m4.elf
  qemu-system-arm: This board can only be used with CPU cortex-m3-arm-cpu
  [output related to M3 core ...]

The CPU is indeed a M3 core:

  (qemu) info qom-tree
  /machine (emcraft-sf2-machine)
    /unattached (container)
      /device[0] (msf2-soc)
        /armv7m (armv7m)
          /cpu (cortex-m3-arm-cpu)

Add the missing exit() call to return to the shell.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/msf2-som.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index 8c550a8bdd..2c9984bb3b 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -53,6 +53,7 @@ static void emcraft_sf2_s2s010_init(MachineState *machi=
ne)
     if (strcmp(machine->cpu_type, mc->default_cpu_type) !=3D 0) {
         error_report("This board can only be used with CPU %s",
                      mc->default_cpu_type);
+        exit(1);
     }
=20
     memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
--=20
2.20.1

