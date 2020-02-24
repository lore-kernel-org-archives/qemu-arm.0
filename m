Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp808897lfg;
        Mon, 24 Feb 2020 13:41:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqy9yxw0Apqug7jWI25Ckt5JYyyxr/iyNS3WNN60G9oJ7MK1B9vt9LNUxZlER5e+Z/xPy19v
X-Received: by 2002:a05:620a:5e:: with SMTP id t30mr50063515qkt.163.1582580479135;
        Mon, 24 Feb 2020 13:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582580479; cv=none;
        d=google.com; s=arc-20160816;
        b=L80Tk19T20h/ICYeJhk6Ei4rYIMGEDsQVMQNLsMEYAKiT7TcaOa1rpLr/3ny8IviM6
         +JcVnqmmK5bVpXdmPsFapa/dj5BBniCu05+TpY0BiiB50nSPsbBQhFD3kBoLPfc1/nyV
         oXsIs2y16nNiJE1l6DxfBWnnVmzojXoLQL1OPf1UNrfOWrCsBbmb1rZYUCQT2PaGKkga
         xoUv9fcm96Q0n5ISzzIBfO3d25iwYt8n8Q8xK/jP9xpacLCbsUKgll0LbAV06JBWKJOE
         J4tXeGCYVNx8I4t1wor7JIW1EK0zu3d0O38S+1Qqh6mhYOA8vYHo28sbJWTJ5CPW07gc
         fZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AR3d9nNMRFmjviCA9QeiC7WRyBhxuQ8IV0t5Cc30NxA=;
        b=z8mMRvHV+dlxRDbjh7QZMUaJNWy7jMWclO8aFt66TswvxmNnoAChHXve77iU+F2xYU
         ZmvOk7D4NLiQ0tRqmRZ9iuHgec1k0Po7phmzRjkQhoAZerITeE/Ceyu+6d/Oclovy7iu
         p9UGAOjm+QS0YaAxhmiORfjEVVCDwpLo7hktyuOhf0QFWmK6FrATQ8jl36lhcW76a+bY
         Buz7V0ABEzQUo2C33OwM72YCNJj2w6ERwIID1mVUq3qIH6uhjBWljR9FuAYymB38il0j
         RZKlYnR4mYdVcKN+Ea6ba8RT18nKcjGeH4yXPnIkPM4b2axe2LLtPv1UZ0hciFAoWKcY
         YfIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Tw/ez23+";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si6618070qkg.132.2020.02.24.13.41.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 13:41:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Tw/ez23+";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6LTa-0008F0-IQ
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 16:41:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52918)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6Kqa-0006Q0-5m
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:01:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6KqZ-0006xB-2j
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:01:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33991
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6KqY-0006wh-VH
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 16:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AR3d9nNMRFmjviCA9QeiC7WRyBhxuQ8IV0t5Cc30NxA=;
 b=Tw/ez23+anWkQ6DnSNH2oldW8g49glc6w5660oaug/+acnCtDig+6ncZPiSUq9S8EV4AR/
 yupTTi4hlmKcp9Uwyqjvfkpggv0EmAwjLxq1lx1qe8Xhb2coNhug7X8tcyBOZ3vCuRgMu8
 Zu+Lk/iMb3eRnvrD5ffi+57YEi93yHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-s20lJErAMzO7qprPBkpHUQ-1; Mon, 24 Feb 2020 16:00:54 -0500
X-MC-Unique: s20lJErAMzO7qprPBkpHUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2F93107ACC4;
 Mon, 24 Feb 2020 21:00:50 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7400B5C54A;
 Mon, 24 Feb 2020 21:00:36 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH RESEND v2 21/32] hw/arm: Remove unnecessary
 memory_region_set_readonly() on ROM alias
Date: Mon, 24 Feb 2020 21:55:22 +0100
Message-Id: <20200224205533.23798-22-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FKpXxe+8nnVx

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/exynos4210.c    | 1 -
 hw/arm/stm32f205_soc.c | 1 -
 hw/arm/stm32f405_soc.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 3af6502a5e..4e1fd7edb3 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -320,7 +320,6 @@ static void exynos4210_realize(DeviceState *socdev, Err=
or **errp)
                              &s->irom_mem,
                              0,
                              EXYNOS4210_IROM_SIZE);
-    memory_region_set_readonly(&s->irom_alias_mem, true);
     memory_region_add_subregion(system_mem, EXYNOS4210_IROM_MIRROR_BASE_AD=
DR,
                                 &s->irom_alias_mem);
=20
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 2de56275b7..6e93726d45 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -97,7 +97,6 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, E=
rror **errp)
                            &error_fatal);
     memory_region_init_alias(flash_alias, NULL, "STM32F205.flash.alias",
                              flash, 0, FLASH_SIZE);
-    memory_region_set_readonly(flash_alias, true);
=20
     memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
     memory_region_add_subregion(system_memory, 0, flash_alias);
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index b8fca13f95..d590cd040d 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -103,7 +103,6 @@ static void stm32f405_soc_realize(DeviceState *dev_soc,=
 Error **errp)
     }
     memory_region_init_alias(&s->flash_alias, NULL, "STM32F405.flash.alias=
",
                              &s->flash, 0, FLASH_SIZE);
-    memory_region_set_readonly(&s->flash_alias, true);
=20
     memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->fla=
sh);
     memory_region_add_subregion(system_memory, 0, &s->flash_alias);
--=20
2.21.1

