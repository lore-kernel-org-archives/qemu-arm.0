Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp734352wrt;
        Fri, 7 Dec 2018 09:09:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X+gw2N8mAjXpSAaRIhkVApQWO/M4kEubUonR/EpbfAs1qncyYncVMINtkzFlluxEC3I4tk
X-Received: by 2002:ac8:2353:: with SMTP id b19mr2821510qtb.187.1544202592922;
        Fri, 07 Dec 2018 09:09:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544202592; cv=none;
        d=google.com; s=arc-20160816;
        b=zmCMaHEbyyQHJGeAXXXgj7EFC1Yi1vWAfRo5VnxMC7OCJgkZH5KRSxqbYPVDSIujyR
         R/F6MBrSclAYqBAtmXsRcfj+bKZlV2lVOQloeDj9LCFEza+boFNsQeiffrbDSESaQp74
         k3pIgLFojKtL3XXG9VFurx/p2yO/GVKOyla6Cyl/c27wgFSj7J4BoFTr/w3IxtXPmRde
         q8I4MrGeAPqSsgDjpR6doqDulXU5inJk1+nvhEMTfoMitR5FjIbOgAyyjraYxqokn30X
         x6pH/dnrqST+wnvlqwQGw9KlVOcEE4rsaUpok2SaeJnSw+9Ho3PAGwjtDSrRAcblbAxl
         BjYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=mL38lPUM3uZXgWd2+GVO/iytirfp7ebLlc7hXU99t00=;
        b=NRxbXdhc7WYxXikK5U8jze1VUhhwfUFzo/2pVuI3ICWZmqzlS9C7TAigmlQPe7ESWW
         z9XETj7ZSdOPgUQow8cRaO6nPeSvcChp+qzGrWdeOWaGRyvDSiChsQxJtG69kdFDCX0o
         e9ZBkuQAiQsFgEbXZ0myyEvUjhI0ZAknyqKVamBPxcIHjo8Sac67AjVZ45BCpfCV5VHQ
         YLP1oi3h95fH3ygQ+SgTj1aZb3sMQClUTRQyroIEJDlgHgZtZmp53SeJneD2cGz1Szav
         MBbLFoP1USTRy3Xy0jhhOOnOLAT/SbFFPUKvgN38p10+igrhME4p5DrXu5B8ruVmqYeU
         hfIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q12si628779qtk.47.2018.12.07.09.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Dec 2018 09:09:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47301 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gVJdQ-0003ka-8m
	for alex.bennee@linaro.org; Fri, 07 Dec 2018 12:09:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gVJYB-0005K9-JD
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 12:04:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gVJYA-0004yp-Py
	for qemu-arm@nongnu.org; Fri, 07 Dec 2018 12:04:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56422)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gVJYA-0004xV-KA; Fri, 07 Dec 2018 12:04:26 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB946C0586D3;
	Fri,  7 Dec 2018 17:04:25 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.154])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DFD019C7F;
	Fri,  7 Dec 2018 17:04:22 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  7 Dec 2018 18:03:56 +0100
Message-Id: <20181207170400.5129-3-philmd@redhat.com>
In-Reply-To: <20181207170400.5129-1-philmd@redhat.com>
References: <20181207170400.5129-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 07 Dec 2018 17:04:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/6] hw/arm: Remove unused include
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ifPS0wZpif2l

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/virt-acpi-build.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5785fb697c..98d7f7cf20 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -35,7 +35,6 @@
 #include "target/arm/cpu.h"
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
-#include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/loader.h"
 #include "hw/hw.h"
--=20
2.17.2

