Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp451522lfe;
        Mon, 16 Mar 2020 12:17:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtSrAw6LwYH7u0Wh8ojAUD8Nlyv3KYBa9GNIam1CZGHC49NqWga/OMH3ennZk80C0uC8eL5
X-Received: by 2002:ac8:4d09:: with SMTP id w9mr1655247qtv.279.1584386233284;
        Mon, 16 Mar 2020 12:17:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584386233; cv=none;
        d=google.com; s=arc-20160816;
        b=JAnSeFX4epGhZVa20h5EABIHdqTYxsSAdDQSoNAjfZN0eoiyFutZZwBr83mNVyRSS+
         mbL6NcX1eZOXZV80uA2feBoRizi60bDstHNmL7bIJ1F4huJ50gzxuCF+BHaNViFYzN87
         bNt8FsBuKslwETq1oJ7L1qaj3/yaKAl3WwZrdLclne8NSgL16sufVu7T/zKgnHzvuQLx
         j8xmVArIkK8rj9B7ZpwWvAbnGcpUSpJ77rNaquuToFKEBhbE4MJj8Pn9IYZW8rTKNMru
         9FhhlGIiVHA59LkRKPcLm4FXFptwEJ0RMeIc/++VYV7BJIEyXvQAyZGQygKFfdAGU0vR
         KOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AR3d9nNMRFmjviCA9QeiC7WRyBhxuQ8IV0t5Cc30NxA=;
        b=q5zP9vFfdZZMlI+noarFIKT9TS4wWR2xQe70i/aIGQhSkQrVwwDUQy4P7wkP2MGuX3
         uWzFrX7FsA3mzgyZlorvfnTbBuuZ6XQcv6CelAIlGJ0TNkRk85DvCf2JP4mKYmNIscKa
         G3MJewZIv43Aru3rZK3LovhJlSHUMnkSHZUk8JxNF2a6l7hst+hgFFbfCurcCSCyLSvC
         BfVf82mHs+GMk2MQlTE2grzywB3z93UlH0/hQD++6SFLPKgOzJ9Zo1JJTR6hIhMQphkJ
         Akq9s7JEglKFl9YUzkCeLZqBmlkz0nzFrEJh9Dfy0i/QKVstmVtsVom4rlnB3qA5hdDj
         nayA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FhHrLTD6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si461586qvb.42.2020.03.16.12.17.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 12:17:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=FhHrLTD6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDvEe-00047v-Og
	for alex.bennee@linaro.org; Mon, 16 Mar 2020 15:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDuqX-0002Z9-Qp
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 14:52:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDuqW-0003Yw-HD
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 14:52:17 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:24040)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDuqW-0003WD-C9
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 14:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584384735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AR3d9nNMRFmjviCA9QeiC7WRyBhxuQ8IV0t5Cc30NxA=;
 b=FhHrLTD6ngsyIZ7KGlOtjmt7OuJFS9+L4c2UgdZV1D+vD+3e1ceNTzou17LM8qYaXuIbHM
 24N94lqWMDS73nOqZRY1JYDncPFQv0yZjZX2/Wn1VupS4ypCwWb3q+t2+aO82I0TwIVenD
 ndI6O2FZQlDo1iBj5zncSQW5IzX3f7c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-qwegk1ifM8uKzz-HSlNrsg-1; Mon, 16 Mar 2020 14:52:14 -0400
X-MC-Unique: qwegk1ifM8uKzz-HSlNrsg-1
Received: by mail-ed1-f71.google.com with SMTP id l8so16060091edq.1
 for <qemu-arm@nongnu.org>; Mon, 16 Mar 2020 11:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TBpfmSRiP+jw9OHkhFWUdHoGBaG1dAqB4VuWEQEEYBw=;
 b=KwwrRozPA1GFs+GhM5mwVjGtNnrhlzDjOkNh+NrP+aHaGOlao0xKIZWAds8SObRDC0
 LjfNXdnaL0WkvNhlVWWjdhR1ct+z0Z/GZi0pETCFZx8rzMriI0TNXlrv0XyCZ7dF/ZDQ
 XOPJ8gHkBbuktgkyWI3tZDkNiUBcu60lSR2+W8F0wepIdX1BDXXE24RinGsGzKW7VfpD
 /9Wn0wh2vqCveBoKB/7ISZtRuVzAKNaiXjWkvQ7YtEoI4G5HQjk+Al3+6yCx6DzylZ/C
 Xv+iIgLendSOGLG342BgQGpCqtTGtljAxLaLpCPnieINAxcTrda3sXfR2aaSLyr2Gwzm
 pVTg==
X-Gm-Message-State: ANhLgQ2XkdxQTEtXEE8LHryHb+hPk8HRQZq+DKEX/mE1XRXVfdgxNpmN
 swKbsa0YvbGMf8XS6Qt5d3Zo7k+Z6z6hQXFMg91IGr+Y8Q5y3btNuAII64WmKF4vkenwYPc8eKZ
 lTljLTVgm2R/k
X-Received: by 2002:a50:ab5a:: with SMTP id t26mr1490336edc.380.1584384732773; 
 Mon, 16 Mar 2020 11:52:12 -0700 (PDT)
X-Received: by 2002:a50:ab5a:: with SMTP id t26mr1490321edc.380.1584384732567; 
 Mon, 16 Mar 2020 11:52:12 -0700 (PDT)
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.96])
 by smtp.gmail.com with ESMTPSA id e15sm51724eds.2.2020.03.16.11.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 11:52:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 24/25] hw/arm: Remove unnecessary
 memory_region_set_readonly() on ROM alias
Date: Mon, 16 Mar 2020 19:50:05 +0100
Message-Id: <20200316185006.576-25-philmd@redhat.com>
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oSO6ngUuheSL

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

