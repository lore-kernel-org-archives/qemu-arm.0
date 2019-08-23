Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp660308wrs;
        Fri, 23 Aug 2019 07:38:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDvuzbA4G5Y4wjaR+umV4KzgKFPVaXy9Xt8d2uLDSo+yO95IgPkl90cIgOmHv2GZkfnFsM
X-Received: by 2002:a37:5846:: with SMTP id m67mr4117677qkb.375.1566571112714;
        Fri, 23 Aug 2019 07:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566571112; cv=none;
        d=google.com; s=arc-20160816;
        b=TesiW9b+rdcM6/Og5SenRbmB919r5tNqeMZQi6ehtxD+RQWOtNtPPs0qGdbt9NPNXj
         akOEpYEQ8mhBdCbI8+E2Q7zXsYglkQ9bluGWUhDtQItASOagmgtDPAGoD6hlcHehMFaG
         1If7aN6vMpRgYvG+C6dxFAUtFKmDq/yUxzCsXdxMvWwpHNhCsmiRXkrCUujHT4yPKQ4F
         YQu+xH8zGRuws1Tb+jTiT3m5ZvVJOElm9DwKLN3lQDkjzxrBB1t5nzRaOVlBjYD/zh8S
         QJJ1FAmSQRCjifhFcldCdNEeMXoR4lac1PIghPbMxXSwhZccvqfhkOySrRhhuru4q8Jn
         MaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=gxcfOxYgf5rpPBgZvtFqP6O/MB6HQXL34fAhIg2s6k4=;
        b=kuk0WhlNBJWQz9FPAdrduhjxQzcjMTp+8oiUDDNUq2JdvDzxtDTvvPupqGY3fe/dqI
         RHfCTRx9apHrYqSBeETwlnA24r0cCat+3wlk4A5UnWl6IHLP/ZqJH81CGWMm2c2H8kjE
         ZXMOHeMo5RnUi8JfsAufVqU0mDGBiY2OhTlcRk/SCS+auGvqu+UOhAY3ZTh8JaF90iS3
         h3ruV5ZPwkhtqxtz4G0NfqUDIGTyObICThPvTmC99YUGgfEGctsxxghB3f2TIKi660Rq
         NIyVHTY8hf97ehL5BNjX7VOcvtNOgn5xHjIGGPcTu/012fdZceYolt7gNpWXWedcivN1
         FwUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y43si2015710qtj.353.2019.08.23.07.38.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 07:38:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1Ahz-0004X7-To
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 10:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50367)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i1AdC-0000Gb-CL
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:33:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i1AdB-0001mc-AM
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 10:33:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39436)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i1AdB-0001mF-4O; Fri, 23 Aug 2019 10:33:33 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 718C879704;
 Fri, 23 Aug 2019 14:33:32 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-118.brq.redhat.com [10.40.204.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C52E5D9CA;
 Fri, 23 Aug 2019 14:33:24 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 16:32:46 +0200
Message-Id: <20190823143249.8096-4-philmd@redhat.com>
In-Reply-To: <20190823143249.8096-1-philmd@redhat.com>
References: <20190823143249.8096-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 23 Aug 2019 14:33:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 3/6] hw/arm: Use sysbus_init_child_obj for
 correct reference counting
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: np2fruO4mczx

As explained in commit aff39be0ed97:

  Both functions, object_initialize() and qdev_set_parent_bus()
  increase the reference counter of the new object, so one of the
  references has to be dropped afterwards to get the reference
  counting right. Otherwise the child object will not be properly
  cleaned up when the parent gets destroyed.
  Thus let's use now sysbus_init_child_obj() instead to get the
  reference counting here right.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Corrected commit description (pm215)
---
 hw/arm/exynos4_boards.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
index f69358a5ba..2781d8bd41 100644
--- a/hw/arm/exynos4_boards.c
+++ b/hw/arm/exynos4_boards.c
@@ -131,8 +131,8 @@ exynos4_boards_init_common(MachineState *machine,
     exynos4_boards_init_ram(s, get_system_memory(),
                             exynos4_board_ram_size[board_type]);
=20
-    object_initialize(&s->soc, sizeof(s->soc), TYPE_EXYNOS4210_SOC);
-    qdev_set_parent_bus(DEVICE(&s->soc), sysbus_get_default());
+    sysbus_init_child_obj(OBJECT(machine), "soc",
+                          &s->soc, sizeof(s->soc), TYPE_EXYNOS4210_SOC);
     object_property_set_bool(OBJECT(&s->soc), true, "realized",
                              &error_fatal);
=20
--=20
2.20.1

