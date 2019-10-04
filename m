Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp268931wrp;
        Thu, 3 Oct 2019 20:10:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxoq0DEL8BpEjyKawN9jEQTL8IFBNBGKoGx8o6BWr4tDYcHjaodyveLcNscc92wR9/I6Uii
X-Received: by 2002:a0c:9082:: with SMTP id p2mr11962546qvp.197.1570158640769;
        Thu, 03 Oct 2019 20:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570158640; cv=none;
        d=google.com; s=arc-20160816;
        b=JXnIjq+XYEkBJs+oP0yn/OYl2+63B0JdN7NQQjih8g4R9VJj9UgjlTeCU3+rFrqOLS
         tHAhXC8WCQ607X+T1tEBsoReiRrvLmVk/lVnRny9PVpWzppYjWEykfvj2uUNPNOAyAgd
         JdTX01x6ifOLo5yqD70quuZrJgse8FLWnLXAvkOVA6gEMe03xuZKz2qWnhC85WWl2lW3
         /1cZrorsibohNfBfkftytjdvC7GK4d11x7meEqTJxUJ0tuU3Ks3q5m448wGz8n8sb3im
         PNx1OwLQA2CF1djg5y0bAyOXdaJ4Y/ys2BoGJi+ewKH0BzWdlD3n40KP5iAyBeEctLs/
         t0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=zMNiKEvhJmuqgd19l4ZDouj9KNlvltgfeGYf4onGdWw=;
        b=o35v2CEEVWOK3xmU6ESEBamhzwlxTuSGB1r1IX50eri6Zor9oameMRsV5NbRKFAI9R
         4E0Dm6+Pt9TrywIty4ga8yOg6dKyHravDJgR5xHVkDXmXiG2BcujZxgzdTtliw6D0Q+Z
         nVmBUby+4vBPPskqRZoDsNT2Wg9s3+uSokKTBSpIMbAwePz64OvFziMp/5AfT4CCgTqS
         2D2+o43HjQO0Yf1leApSUUffDDHpvnQpfTFsQzmMmGHfH/pt9rNPD4Oj5rOk/aSjbSV+
         ikc0E8ttrqc1tlk2xKuhJ5ZOzl+27UKgW1F4jomtDFbZHJFu5MYTppNoLhOQW/6GCWpg
         giEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gibson.dropbear.id.au header.s=201602 header.b=hJ+31lck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 142si4574717qki.300.2019.10.03.20.10.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 20:10:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gibson.dropbear.id.au header.s=201602 header.b=hJ+31lck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGDzM-00068e-7U
	for alex.bennee@linaro.org; Thu, 03 Oct 2019 23:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46558)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1iGDz7-000685-KN
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 23:10:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1iGDz6-0008Em-Bg
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 23:10:25 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:56505 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1iGDz5-00088f-3Z; Thu, 03 Oct 2019 23:10:24 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46kvy15zhRz9sPq; Fri,  4 Oct 2019 13:10:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1570158617;
 bh=6BzysK04Egnj4VKoHR3IxJqfPZVBBXwQCCXvuB1yqd8=;
 h=From:To:Cc:Subject:Date:From;
 b=hJ+31lckGHqwbdvDTm47x9QoXTsNuvXT6qeVH+0oXb2I0AerZUn0qIHvS9Xo8HCcs
 9pgMe5FK3eeUDyIPQYkfmgKOsi4MW8U+Fr3pt3GP//BWN3dpQh3VqwtaaZv+V+aZN5
 DaT/f1eLiT8pWDIQYAq/9gkP45GiqIQP9rilKUZA=
From: David Gibson <david@gibson.dropbear.id.au>
To: i.mitsyanko@gmail.com,
	peter.maydell@linaro.org
Subject: [PATCH] exynos4210_gic: Suppress gcc9 format-truncation warnings
Date: Fri,  4 Oct 2019 12:55:09 +1000
Message-Id: <20191004025509.3012-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6W5FfOGKi3Mo

exynos4210_gic_realize() prints the number of cpus into some temporary
buffers, but it only allows 3 bytes space for it.  That's plenty - I'm
pretty sure that existing machines will only ever set this value to 2
(EXYNOS4210_NCPUS).  But the compiler can't really be expected to figure
that out.

Some[*] gcc9 versions therefore emit -Wformat-truncation warnings.  Fix
that by allowing more space in the temporary buffers - these are on stack
very briefly before being essentially strdup()ed inside the memory region
code, so there's not much cost to doing so.

[*] The bizarre thing here, is that I've long gotten these warnings
compiling in a 32-bit x86 container as host - Fedora 30 with
gcc-9.2.1-1.fc30.i686 - but it compiles just fine on my normal x86_64 hos=
t
- Fedora 30 with and gcc-9.2.1-1.fc30.x86_64.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/intc/exynos4210_gic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index a1b699b6ba..2e5e47f9ec 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -290,8 +290,8 @@ static void exynos4210_gic_realize(DeviceState *dev, =
Error **errp)
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
     const char cpu_prefix[] =3D "exynos4210-gic-alias_cpu";
     const char dist_prefix[] =3D "exynos4210-gic-alias_dist";
-    char cpu_alias_name[sizeof(cpu_prefix) + 3];
-    char dist_alias_name[sizeof(cpu_prefix) + 3];
+    char cpu_alias_name[sizeof(cpu_prefix) + 10];
+    char dist_alias_name[sizeof(cpu_prefix) + 10];
     SysBusDevice *gicbusdev;
     uint32_t i;
=20
--=20
2.21.0

