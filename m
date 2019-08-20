Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3910490wrs;
        Tue, 20 Aug 2019 05:35:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyARI3wwRyMy7tAExdeVMJ1Z1SKwfspVP17r5XnJoV4JsIeYf3sfvLrB91ZyW+jFANiQhwS
X-Received: by 2002:a17:906:948a:: with SMTP id t10mr25610010ejx.111.1566304509112;
        Tue, 20 Aug 2019 05:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566304509; cv=none;
        d=google.com; s=arc-20160816;
        b=XU3t796ZpK/6X0u/X13rdVnofTjvSTMsk+0VuEElJLt4TYUz8Z5ARqH1Ms0I1v6rW3
         Cr73U1sphx3BElSt7/SBWKhoFu+BiliAbYk7e3Ru073q1oyuR0M4q3kWSEcxMHRpn/8P
         K8zGtP9qmCUrg1HsIpHxI18+gGWjDEgyvfROhzhieFslVW9TfjUVYDVDxIbKPijdWTwW
         FRRoVHfVfUqm1Pz9qexxvh9e3J03QO2gT/PcEf9JlsVl9Q88EQzCJJXEG5NAYdainKMl
         DFrnXo9OH7n8aR1NwyaoYLK4w2Ji2Jqv3mh4D9WHgVAdUqoLQG/VOrOEmI/+1DCOSfBN
         6Z1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=IcHRtU8j5UjBsD5HZGR2ATlFu3cbetgICUnsM5712ko=;
        b=F51o7x+U7bzCfzpzY9284ZCqXa23SY4o3G7krt/YjCIneRHjGcDqCbeHWqOVBUoycT
         GXsCKkYeU/QbmvRzYR1VPHt7Md6UaZ3P1ETXYoLjvtFwqXrN3kNywKHSRGancxavDMbO
         rNIW7lIgvdwDDwoNUCAhnnmuU2HL0gAVyfMOAxk4rSewmj46wHtBytx/1O/ARP1OCzxg
         9TC0QYsSwomoPEcsnVSenO2Uo3HYiLY6BsAd5xLvJ45XKcs+BQkcBP7DeHRGAc0KbdGF
         sZxWrmW/tc438PdqgCGyYMVHwwh78vrcTkgMnR5ZE+cEiJfJ14oATWyolcuVWGXCKUTs
         7m4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l48si9771996edb.254.2019.08.20.05.35.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 05:35:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i03Lv-0005sh-AB
	for alex.bennee@linaro.org; Tue, 20 Aug 2019 08:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i03LW-0005s2-84
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 08:34:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i03LV-0002HV-6o
 for qemu-arm@nongnu.org; Tue, 20 Aug 2019 08:34:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36156)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i03LU-0002Bq-W8; Tue, 20 Aug 2019 08:34:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1679789AC2;
 Tue, 20 Aug 2019 12:34:39 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B23CA5C21F;
 Tue, 20 Aug 2019 12:34:31 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Aug 2019 14:34:16 +0200
Message-Id: <20190820123417.27930-2-philmd@redhat.com>
In-Reply-To: <20190820123417.27930-1-philmd@redhat.com>
References: <20190820123417.27930-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 20 Aug 2019 12:34:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/2] hw/char/serial: Add a helper to set the
 divisor register
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ao0CotYEnqD0

Some chipsets provide 16650 compatible UART with exhanced
features. The BCM2835 provides a register to directly set
the baudrate divisor register without having to use the
LABD bit.

Add a helper to allow models to directly set the divisor.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/char/serial.c         | 6 ++++++
 include/hw/char/serial.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index b4aa250950..12eb93705d 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -191,6 +191,12 @@ static void serial_update_parameters(SerialState *s)
            speed, parity, data_bits, stop_bits);
 }
=20
+void serial_set_divider(SerialState *s, uint16_t divider)
+{
+    s->divider =3D divider;
+    serial_update_parameters(s);
+}
+
 static void serial_update_msl(SerialState *s)
 {
     uint8_t omsr;
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 8be3d8a4f9..ef211f695d 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -83,6 +83,7 @@ extern const MemoryRegionOps serial_io_ops;
 void serial_realize_core(SerialState *s, Error **errp);
 void serial_exit_core(SerialState *s);
 void serial_set_frequency(SerialState *s, uint32_t frequency);
+void serial_set_divider(SerialState *s, uint16_t divider);
=20
 /* legacy pre qom */
 SerialState *serial_init(int base, qemu_irq irq, int baudbase,
--=20
2.20.1

