Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp428689lfe;
        Mon, 16 Mar 2020 11:55:41 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvG/HBRePi7jbd0nj1nN3lIa770EbE7OQ2BFIuc3w2JXysTdaupmBcnqtUAO5tO/Jqlr9Kz
X-Received: by 2002:a05:620a:13fb:: with SMTP id h27mr1148220qkl.344.1584384940846;
        Mon, 16 Mar 2020 11:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584384940; cv=none;
        d=google.com; s=arc-20160816;
        b=yqvW00eoIDfrmEaL3CeMEbMW8uuo2CVxbCubRjFu8oitHMTDx5WgTPbmCkTb0vMl7N
         2iReK0oh6hrlBj3cf4hsOsClNmksBYBWeAD67UPCUPVg5J0T8ko4X8AmQZUz19MtlRUY
         M912BuGXWVJ3RrvbvEtZRsrw/cjzSVU3+4CgJ0l0A/DMYJV0pRIh84uQony/63r785h3
         xl7S/PtCCtARZk+gz2vsLCOmA2mLHJgneVQwtkqUlTEapx/FN3Lv9yjsNaLydUORSPQ1
         z4M14NMZGxOGtyK7kGAqXyZ+bH0SYlYMgkVyctNqGjoXofvQMb0vH80oWikFEMnqwTKZ
         dGxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lSVtvfrX1T1hW1+GelbNbTHoIYbtGWi72bTWri8Gs/8=;
        b=I9V90hI6yh8ZYj5HN8K2BMuYvGRZ1pPQUQudAAePynI5pCePjlSDhwmyXmQkqrWTKp
         AtCu0qWMrJe1iHPeKaFi8MWzGk2+dtE/tC8HoZc+Rihjx3XAKAk3408GarCbQZFRPP6Y
         f4a35jLcG16ee1zldMxcbxa+7x9C7UWQP3gs8IHo5MK/GroGUPrE78z6DEEi25Xm4+0K
         08WGbSpgbwzWnY8fnv/+ntVS/epIRJbHrdVSP/196133DBpR7RmB9g5szwZVa3B1XIcU
         V0YQ0NIDEnNgVteoPPTe+0joda27MaxEKS9e7acKe81qGvECcc0GBNALzE8KdTHScW/Q
         UlxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a6UcuHiW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si269854qtq.360.2020.03.16.11.55.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 11:55:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=a6UcuHiW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDuto-0001Ct-8n
	for alex.bennee@linaro.org; Mon, 16 Mar 2020 14:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40992)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDuqc-0002iC-JK
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 14:52:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDuqb-00047h-D8
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 14:52:22 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:57726)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDuqb-00046l-9i
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 14:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584384741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSVtvfrX1T1hW1+GelbNbTHoIYbtGWi72bTWri8Gs/8=;
 b=a6UcuHiWHhdRBYAA/sfn4kfm08UZARUBNhPLLdLqQPIC4/wVeW3WkiLTdfHx6HWgUFml8/
 DEVtAJKLUjTgrHbveKocBrvAo+jc+a923uQa/vCFVna6rQ2D9thgYQg2vk+DoSIoPCWzrZ
 mcj+6LQ/REqgJfZw1eJF4N7a8BUUsBM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-f9VE3LPENHeyqzJEVf-r2A-1; Mon, 16 Mar 2020 14:52:19 -0400
X-MC-Unique: f9VE3LPENHeyqzJEVf-r2A-1
Received: by mail-wr1-f70.google.com with SMTP id b12so9538156wro.4
 for <qemu-arm@nongnu.org>; Mon, 16 Mar 2020 11:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NVKGwUr8B+LaX+EC0RuZtqH9nmzRuKTSjfiL8jyxkwg=;
 b=FtclrbDnCh1uec4kQ/whCsvRSBXwbzt7J8bSre4n+wbI1EnMnspHzGP1rTjdVDpatX
 cZwegySNIeycb9oEG56dUZbHvIamQR4hoBfsudIW3+UPSQTu1O4MnmnaBCPzlln2tTDw
 w3NlInpyZEQCgIhETYoB3OW4agUQz+39fZe2a4+Nnf3AFxxUVbffKGE9/BdifUYMbKNN
 kO+GMt8thAk5lX5jxbeRLAXLWekBebrVQ2qcOR7r+WSic8hG36QrqzsBr0d0lIYPg7w7
 +mRSy+l6rLbjUsneehu2Au5vWyEXBQMHdKTUQJynDTHZA/mtQbMc0EnKl3vrQDZ5DQD0
 DpZA==
X-Gm-Message-State: ANhLgQ14jrKw20ObFUWxVC6DJ/pvfNdm6VrfyIHxLMh8mexgJ4LwnVDD
 0bnTHCS1twANhEAxiO1EFX7FqsqTdObaji1vJ7ZlTvKOhFNLdeu1tKlS4g6D0GN5j5lw1OsOdg4
 kmtGvJFaS7V+f
X-Received: by 2002:a5d:5342:: with SMTP id t2mr809136wrv.104.1584384722417;
 Mon, 16 Mar 2020 11:52:02 -0700 (PDT)
X-Received: by 2002:a5d:5342:: with SMTP id t2mr809112wrv.104.1584384722219;
 Mon, 16 Mar 2020 11:52:02 -0700 (PDT)
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.96])
 by smtp.gmail.com with ESMTPSA id h15sm982743wrw.97.2020.03.16.11.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 11:52:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 22/25] hw/arm/stm32: Use memory_region_init_rom() with
 read-only regions
Date: Mon, 16 Mar 2020 19:50:03 +0100
Message-Id: <20200316185006.576-23-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316185006.576-1-philmd@redhat.com>
References: <20200316185006.576-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "open list:STM32F205" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YpescIoEhPR8

The scripts/coccinelle/memory-region-housekeeping.cocci reported:
* TODO [[view:./hw/arm/stm32f205_soc.c::face=3Dovl-face1::linb=3D96::colb=
=3D4::cole=3D26][potential use of memory_region_init_rom*() in  ./hw/arm/st=
m32f205_soc.c::96]]
* TODO [[view:./hw/arm/stm32f405_soc.c::face=3Dovl-face1::linb=3D98::colb=
=3D4::cole=3D26][potential use of memory_region_init_rom*() in  ./hw/arm/st=
m32f405_soc.c::98]]

We can indeed replace the memory_region_init_ram() and
memory_region_set_readonly() calls by memory_region_init_rom().

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/stm32f205_soc.c | 4 +---
 hw/arm/stm32f405_soc.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 627fd446f5..2de56275b7 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -93,12 +93,10 @@ static void stm32f205_soc_realize(DeviceState *dev_soc,=
 Error **errp)
     MemoryRegion *flash =3D g_new(MemoryRegion, 1);
     MemoryRegion *flash_alias =3D g_new(MemoryRegion, 1);
=20
-    memory_region_init_ram(flash, NULL, "STM32F205.flash", FLASH_SIZE,
+    memory_region_init_rom(flash, NULL, "STM32F205.flash", FLASH_SIZE,
                            &error_fatal);
     memory_region_init_alias(flash_alias, NULL, "STM32F205.flash.alias",
                              flash, 0, FLASH_SIZE);
-
-    memory_region_set_readonly(flash, true);
     memory_region_set_readonly(flash_alias, true);
=20
     memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index 9bcad97853..b8fca13f95 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -95,7 +95,7 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, E=
rror **errp)
     Error *err =3D NULL;
     int i;
=20
-    memory_region_init_ram(&s->flash, NULL, "STM32F405.flash", FLASH_SIZE,
+    memory_region_init_rom(&s->flash, NULL, "STM32F405.flash", FLASH_SIZE,
                            &err);
     if (err !=3D NULL) {
         error_propagate(errp, err);
@@ -103,8 +103,6 @@ static void stm32f405_soc_realize(DeviceState *dev_soc,=
 Error **errp)
     }
     memory_region_init_alias(&s->flash_alias, NULL, "STM32F405.flash.alias=
",
                              &s->flash, 0, FLASH_SIZE);
-
-    memory_region_set_readonly(&s->flash, true);
     memory_region_set_readonly(&s->flash_alias, true);
=20
     memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->fla=
sh);
--=20
2.21.1

