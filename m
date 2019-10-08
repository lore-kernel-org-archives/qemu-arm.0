Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5255016wrm;
        Tue, 8 Oct 2019 07:45:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwweHMq5PsDTjt9hLv8tBGF3WzcaDVC30xYgNzNwoodU/2T79bki6XEUasDGcNvFVnm4dm4
X-Received: by 2002:ae9:f443:: with SMTP id z3mr28876885qkl.193.1570545935047;
        Tue, 08 Oct 2019 07:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570545935; cv=none;
        d=google.com; s=arc-20160816;
        b=0pWdqfYSH15LxxopQdL5Sv04hYPxiXYaSDEuP1QZcXYhtgeopmSwqeF1sgPz/i5Wa2
         idHzIq/a7lx1neZTYugw8U6hafQd6Z7b9udx2EMy8/rN6PUUEmY+32Gjj+cMQ1BPZhGH
         TO2O1AFHDF1SsrSm7j7sq1Xf/0H97A4o4WpLLouU6CShDKKKoYOH3Cc5v4vkSHDU6nUr
         XwRIOuuVSKnaGwCZoqw7fYkVMyDnMVMQvPesUuvYJbrLTi0oIY9N2Yf+B7BBxNk6Tsu1
         xENKsCFI8lUjP3cI8CREHkDM8W7CxHJrPqN9XAQI4YoJdRaupqcQKR8E9TBh17X3NV1+
         h4gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=sKelYanOjjA6HkGGpVGabIMsCakhRURJWUfCJk7AOI4=;
        b=AQgCdVB6TgecwLwJ5vQ3oSEsZyKVRmmI4jfikAlB9GdUwIpghZ+yrX+MtLGiHjCcWD
         2SzB2Cyp2tD/UMb1TfdzaoUJg6GzW9ktyjXqSandA2rLCzNDRw7ZgDIvgYVNHFpwoCI7
         rPiuThjt/B9FzsKadqokJBpCCicpexvaAoihLhwM+Fzu3V8XyCcwinKOT4H17HFeCi0n
         KoQ7VAzKdf1fA33Yjg1MiVETPpMlmc6+7sL+ZgkI30DKxzhACJPT2+pIdSnwoOjJU9/D
         iZn0s8yca4NxasNbNqh8sPTPpSUgUoRb1HQdcT6l2k1/B2AY2Fk/YK42Ts4u6Z7K1v2Y
         8tgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z134si15824609qkb.84.2019.10.08.07.45.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 07:45:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHqk1-0000uc-GV
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 10:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iHqR8-00061w-KS
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 10:26:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iHqR7-0008JE-Eq
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 10:26:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45758)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iHqR7-0008Ir-9V; Tue, 08 Oct 2019 10:26:01 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1CE2130ADBB4;
 Tue,  8 Oct 2019 14:26:00 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-43.brq.redhat.com [10.40.204.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0D5819C69;
 Tue,  8 Oct 2019 14:25:42 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] hw: Convert various reset() handler to DeviceReset
Date: Tue,  8 Oct 2019 16:25:31 +0200
Message-Id: <20191008142539.7793-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 08 Oct 2019 14:26:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V17YCt3KJNbL

Since v1:
- Removed the pci-host devices
- Removed the vmcoreinfo conversion (elmarco) but add a comment.
- Added Igor's R-b tag.

Following the thread discussion between Peter/Markus/Damien about
reset handlers:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg617103.html
I started to remove qemu_register_reset() calls from few qdevified
devices (the trivial ones).

Regards,

Phil.

v1: https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg06367.html

Philippe Mathieu-Daud=C3=A9 (8):
  hw/acpi/piix4: Convert reset handler to DeviceReset
  hw/isa/piix4: Convert reset handler to DeviceReset
  hw/ide/piix: Convert reset handler to DeviceReset
  hw/ide/sii3112: Convert reset handler to DeviceReset
  hw/ide/via82c: Convert reset handler to DeviceReset
  hw/isa/vt82c686: Convert reset handler to DeviceReset
  hw/input/lm832x: Convert reset handler to DeviceReset
  hw/misc/vmcoreinfo: Document its reset handler

 hw/acpi/piix4.c      |  7 +++----
 hw/ide/piix.c        |  8 +++-----
 hw/ide/sii3112.c     |  7 +++----
 hw/ide/via.c         | 10 ++++------
 hw/input/lm832x.c    | 12 +++++-------
 hw/isa/piix4.c       |  7 +++----
 hw/isa/vt82c686.c    | 11 ++++-------
 hw/misc/vmcoreinfo.c |  1 +
 8 files changed, 26 insertions(+), 37 deletions(-)

--=20
2.21.0

