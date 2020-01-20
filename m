Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp555115lfp;
        Mon, 20 Jan 2020 11:00:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqxpYvEDOvNOcIlKptxryULRY7siOnB0Kw6xkICemXs0P0wkNGuAqISj0YuF9EqIlgmIBI/y
X-Received: by 2002:a05:6402:22d4:: with SMTP id dm20mr476031edb.353.1579546816656;
        Mon, 20 Jan 2020 11:00:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579546816; cv=none;
        d=google.com; s=arc-20160816;
        b=Cs81bbelujfMYLx1wi+aQTf484G0/RVaFxpXvuz2P8Um3OTqN+ZvwIxbsMuUqXvF3k
         u1eL06HqePhqydZPjlsQUhOsSWOk1WiwEjncdxIrP3+w+99ZFw++R+xYXgyF3020Q8uT
         yoJFFiQCIQ5cAf48x0kDgJ1sGFAcrg+zzYH6nCkLMDEuRrG3IfVwPR0EgM2TxXjMmECb
         7AJFEu5Uem30klrpGuvFoEI2WUo2DmloSMs8+yGVHBYOHQk2oYkBo95pg2uNYhpLk8k7
         Da8wjAAqM1zFDKhip8YL30ZnknOXWDspGXmMUnb3J4WV90SQf4zWXQSbU4t6lsEFouT8
         bddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2bpndsFJEwhvq3QvF0dJgfcdC1EMYmru72/TZYViLVM=;
        b=Pye4E3SP4eKVYoT5eoqHRiaCfQFXpota/oq4xrKe41h/fn+oIhklyPxazLAlcgunav
         eS6K7Ywu6XVueTN9pIFMJAQDUiN7T2cElhWB/2to2FdqxhpBpJWDTQrysfLgyXOYq1Ef
         r+dbFOQg430GD9T6AA+jz5ONkH3pSd5jREGRP2TOW3UNOsyPaRHRS/x4gUfYJDqvjGyO
         fRuOb3XdCKL9OYORBMWFEWg4/DBGzpwErNETKelbPmmB89SxQzNlZjEPWh9EduVYjEVK
         n4RiSGeQxzWW5v63DrD1XXGegmRDDOwkgB/FLR4/wVB/Dj7uiW2zOHOmadK1kSC3u81D
         yRvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HSv4DiDv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qx27si23249828ejb.402.2020.01.20.11.00.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 11:00:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HSv4DiDv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itcHX-0006Wm-5A
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 14:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33207)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1itcH2-00066u-Bg
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 13:59:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1itcH1-0004pl-6H
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 13:59:44 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:55377
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1itcH1-0004pV-2a
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 13:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579546782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bpndsFJEwhvq3QvF0dJgfcdC1EMYmru72/TZYViLVM=;
 b=HSv4DiDvZqAFP90KaYebhFlOxLkblB1uFcgHbwM6jYeFJdQfy/LywR4I2xmx8DbHEooNKP
 /t9rnr1VyqcXZ9UOGtPsxATEQqBPNjV6lJSHX3wGdjG4XLS2tuFoiqCB3K4mWAmdEweeDC
 aVOr/FAk5bZgXQSALIej/DZuNScaPts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-LVB7RWimPr-kYt7VvvGUDQ-1; Mon, 20 Jan 2020 13:59:41 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32D63800D4C;
 Mon, 20 Jan 2020 18:59:40 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-38.brq.redhat.com [10.40.205.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E3B95C1BB;
 Mon, 20 Jan 2020 18:59:37 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] MAINTAINERS: Cc the qemu-arm@nongnu.org for the ARM
 machines
Date: Mon, 20 Jan 2020 19:59:27 +0100
Message-Id: <20200120185928.25115-2-philmd@redhat.com>
In-Reply-To: <20200120185928.25115-1-philmd@redhat.com>
References: <20200120185928.25115-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: LVB7RWimPr-kYt7VvvGUDQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /YVnO78O0gyH

Not all ARM machines sections Cc the qemu-arm@nongnu.org list,
fix this.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v2: Also fix STM32F405 (commit 529fc5fd3)
    and Netduino Plus 2 (commit 60d6c4278)
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55d3642e6c..52fbc18566 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -807,6 +807,7 @@ F: hw/arm/virt-acpi-build.c
 STM32F205
 M: Alistair Francis <alistair@alistair23.me>
 M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/stm32f205_soc.c
 F: hw/misc/stm32f2xx_syscfg.c
@@ -819,6 +820,7 @@ F: include/hw/*/stm32*.h
 STM32F405
 M: Alistair Francis <alistair@alistair23.me>
 M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/stm32f405_soc.c
 F: hw/misc/stm32f4xx_syscfg.c
@@ -827,18 +829,21 @@ F: hw/misc/stm32f4xx_exti.c
 Netduino 2
 M: Alistair Francis <alistair@alistair23.me>
 M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/netduino2.c
=20
 Netduino Plus 2
 M: Alistair Francis <alistair@alistair23.me>
 M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/netduinoplus2.c
=20
 SmartFusion2
 M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/msf2-soc.c
 F: hw/misc/msf2-sysreg.c
@@ -852,6 +857,7 @@ F: include/hw/ssi/mss-spi.h
 Emcraft M2S-FG484
 M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
 M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/msf2-som.c
=20
@@ -1400,6 +1406,7 @@ T: git https://github.com/jnsnow/qemu.git ide
=20
 OMAP
 M: Peter Maydell <peter.maydell@linaro.org>
+L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/omap*
 F: include/hw/arm/omap.h
--=20
2.21.1

