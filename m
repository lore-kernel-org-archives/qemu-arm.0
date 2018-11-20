Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp769773wrt;
        Tue, 20 Nov 2018 08:33:57 -0800 (PST)
X-Google-Smtp-Source: AJdET5empRZcxHRY6g2xSqUei+xHOwL4sFQo7M1fn06UuOAlkCYNlLyUW9MgMK1q7lkHlROSCFX7
X-Received: by 2002:a81:a381:: with SMTP id a123mr2653074ywh.295.1542731637473;
        Tue, 20 Nov 2018 08:33:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542731637; cv=none;
        d=google.com; s=arc-20160816;
        b=Rm5j/Fc94pC/lHn8F4ICSn8tfzaCKZ0SHFcpPH1WE1PaN9LBP8xDLZEKokDMUJ+TSc
         RdXyPqqhHkrg0FRT8DWjd3Bzxum1TYgfx44hJE1YnCKiqve7thkLHk9br3H271sfnIqw
         cMKe+LO3dzfXna6maeV6Sc2fib5nwxUibeMYks++lJm7ShkPfosKd+G53Kr7wHb8CPLu
         D+SwAJ+0obNcG0MkNsZqNteFvI3tCmBPtyQUcsB02ZaQdX+vOhp5BeQLL2J6nV/kw8dw
         5jhWRifQS4WB11tVLdVhrae0IHsqq0Xg9K4v2K2p6lPMldaQdqXmYsFkIFrKZgiL8ldE
         fbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=e2kNRnvf0MqFAlBo7m+VwRb1sa3iHfKhQsf14FaO8YQ=;
        b=z2TkziK7Tjkhh7X8xkIDXSL8xt4ZEcJtrPzW7SdMo5vMmOgDsPQEHwGnmbv7VPrmIv
         hDuJ9AVcaEwrbjZdgrmvErxI7Ntt2QGbPhsGqG4BfS9idOEyojYr0cfHnTo2Mq1JLfEC
         YSfUZ/TlOQA5rAzqX4o1QF0POET7/iKZPXlQSqLlBJa1mE8Yh4gKkDIRE4uilv9XSzKs
         4xppfqKcol4ta4ueK/EeXMaHoBeLGqYf7WPuQAArp+/3IoERSO5oKkq2FIkd0UujT5jD
         aq8aUzDPhQfEJmFTfC5SaEyn/QQ2nx71KymVXDteZNGqHrY7Z9NPnDJMEeyRSEvrF5Fe
         9upg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d76-v6si26135473ywh.448.2018.11.20.08.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 08:33:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34579 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP8yK-0005JK-SZ
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 11:33:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gP8y8-0005Hm-0p
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 11:33:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gP8y5-00072y-79
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 11:33:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60534)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gP8y4-00070C-Q7; Tue, 20 Nov 2018 11:33:41 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23EBD3078AC2;
	Tue, 20 Nov 2018 16:33:38 +0000 (UTC)
Received: from localhost (ovpn-204-50.brq.redhat.com [10.40.204.50])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B14CC88B3A;
	Tue, 20 Nov 2018 16:33:27 +0000 (UTC)
Date: Tue, 20 Nov 2018 17:33:24 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20181120173324.64a36d8e@redhat.com>
In-Reply-To: <20181107123652.23417-3-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-3-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 20 Nov 2018 16:33:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.2 v3 02/14] qom: make
 interface types abstract
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
	=?UTF-8?B?SGVy?= =?UTF-8?B?dsOp?= Poussineau <hpoussin@reactos.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>, lersek@redhat.com,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FxSfOvzDSTHr

On Wed,  7 Nov 2018 16:36:40 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:

> Interfaces don't have instance, let's make the interface type really
> abstract to avoid confusion.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/hw/acpi/acpi_dev_interface.h | 6 +-----
>  include/hw/arm/linux-boot-if.h       | 5 +----
>  include/hw/fw-path-provider.h        | 4 +---
>  include/hw/hotplug.h                 | 6 +-----
>  include/hw/intc/intc.h               | 4 +---
>  include/hw/ipmi/ipmi.h               | 4 +---
>  include/hw/isa/isa.h                 | 4 ----
>  include/hw/mem/memory-device.h       | 4 +---
>  include/hw/nmi.h                     | 4 +---
>  include/hw/stream.h                  | 4 +---
>  include/hw/timer/m48t59.h            | 4 +---
>  include/qom/object_interfaces.h      | 6 +-----
>  include/sysemu/tpm.h                 | 4 +---
>  target/arm/idau.h                    | 4 +---
>  tests/check-qom-interface.c          | 4 +---
>  15 files changed, 14 insertions(+), 53 deletions(-)
>=20
> diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_=
dev_interface.h
> index dabf4c4fc9..43ff119179 100644
> --- a/include/hw/acpi/acpi_dev_interface.h
> +++ b/include/hw/acpi/acpi_dev_interface.h
> @@ -25,11 +25,7 @@ typedef enum {
>       INTERFACE_CHECK(AcpiDeviceIf, (obj), \
>                       TYPE_ACPI_DEVICE_IF)
> =20
> -
> -typedef struct AcpiDeviceIf {
> -    /* <private> */
> -    Object Parent;
> -} AcpiDeviceIf;
> +typedef struct AcpiDeviceIf AcpiDeviceIf;
> =20
>  void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event);
> =20
> diff --git a/include/hw/arm/linux-boot-if.h b/include/hw/arm/linux-boot-i=
f.h
> index aba4479a14..7bbdfd1cc6 100644
> --- a/include/hw/arm/linux-boot-if.h
> +++ b/include/hw/arm/linux-boot-if.h
> @@ -16,10 +16,7 @@
>  #define ARM_LINUX_BOOT_IF(obj) \
>      INTERFACE_CHECK(ARMLinuxBootIf, (obj), TYPE_ARM_LINUX_BOOT_IF)
> =20
> -typedef struct ARMLinuxBootIf {
> -    /*< private >*/
> -    Object parent_obj;
> -} ARMLinuxBootIf;
> +typedef struct ARMLinuxBootIf ARMLinuxBootIf;
I like how it makes interface truly opaque and removes the need for
structure declaration but:

 1: I'm not sure if it's acceptable thing to do from language point of view

 2: For a reader not aware of a trick, it's sort of confusing to have forwa=
rd declaration but without structure itself. So if #1 is acceptable we prob=
ably should document interface trick in object.h

[...]
