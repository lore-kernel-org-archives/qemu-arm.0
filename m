Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1614240wrt;
        Wed, 21 Nov 2018 01:10:38 -0800 (PST)
X-Google-Smtp-Source: AJdET5fxGcbU4Eu4Y90CMsu6wKAfLsPAlaBw1nK2n009eRJ+aW6TBEkRPS1bqwi1kyrVUJo3TvnT
X-Received: by 2002:a0d:f302:: with SMTP id c2-v6mr5490041ywf.337.1542791438161;
        Wed, 21 Nov 2018 01:10:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542791438; cv=none;
        d=google.com; s=arc-20160816;
        b=SMvHR9t6mos49zwrmIC3T7w0Xg4OqAd4I57aW20Jr6xqQTqO+FvhiVcIjrGLfpgNxt
         ta0caR0Rol//p97eQQoLH51ecZtyiZ8WY2SpOguk20Dp9JZhlwBhNfxipiGKzC7/g/3k
         iqwyFzZn/9ilOaMH0FBULgDIXpINiWnfKD/h8oR5x7WDpnZveDuv+RLzfPiitce8UP0B
         fyejjIJ/aZgeXFZj5itK2/LM8nIwqdE2dLIEugbHsNRviNKWVyhcEih95BhhojI+vD/B
         O8fnuQUp6+ZcAK3dAxR1bLB7EgcQx9DH3G0RE67qt2phxHY7GmJPL3JavDa4HURKft3+
         oJIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=0Ckx1r5ASo9TFJZqDxu4zL3htFrAmdq+2fnRoKfwONQ=;
        b=zYOcELhOyaeW4uswh3vsJYVKtnHeULhd+2gHTjz8unVFu1QJ83bMPD3HiXNnAsGM5q
         FGGa+yRI1npThr43sdzQjkasupjFeTz9+z5lxuZqWxLsYAhAakblPVE4akY5EymwEA7d
         X9tQ7po1P3xZtX5XUxRIkISxLxX/b+tHI35iqUHC4ff7DWT1Z9icjnippF3cZTO9TGON
         npbLEcFQ9szcbXEggL0lniR2ctrY+w+yhfsdSw+gg3KfmIIFm3YOCkpT0Zty+XBK0lsR
         y/yE4SImdhaqxdmkv3XTqSNhtrK5Lt/f1Dk3N0fm2jzkYhH0dTjBv1elINGSkeE1phUB
         uycQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w16-v6si7829159ybl.441.2018.11.21.01.10.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 01:10:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPOWr-0003Rh-JP
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 04:10:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gPOWk-0003RK-2X
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 04:10:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gPOWg-0007Dx-W0
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 04:10:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58666)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gPOWg-0007Cz-Ov; Wed, 21 Nov 2018 04:10:26 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49409308624F;
	Wed, 21 Nov 2018 09:10:25 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3170F18E33;
	Wed, 21 Nov 2018 09:10:06 +0000 (UTC)
Date: Wed, 21 Nov 2018 10:10:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20181121101004.6405408a@redhat.com>
In-Reply-To: <d84bafe2-184b-bc62-9cde-0d1421cb484d@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-3-marcandre.lureau@redhat.com>
	<20181120173324.64a36d8e@redhat.com>
	<d84bafe2-184b-bc62-9cde-0d1421cb484d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 21 Nov 2018 09:10:25 +0000 (UTC)
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, dgilbert@redhat.com,
	xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
	Stefan Berger <stefanb@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	=?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XpwOkBNuwiaQ

On Tue, 20 Nov 2018 19:54:23 +0100
Laszlo Ersek <lersek@redhat.com> wrote:

> On 11/20/18 17:33, Igor Mammedov wrote:
> > On Wed,  7 Nov 2018 16:36:40 +0400
> > Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:
> >  =20
> >> Interfaces don't have instance, let's make the interface type really
> >> abstract to avoid confusion.
> >>
> >> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> ---
> >>  include/hw/acpi/acpi_dev_interface.h | 6 +-----
> >>  include/hw/arm/linux-boot-if.h       | 5 +----
> >>  include/hw/fw-path-provider.h        | 4 +---
> >>  include/hw/hotplug.h                 | 6 +-----
> >>  include/hw/intc/intc.h               | 4 +---
> >>  include/hw/ipmi/ipmi.h               | 4 +---
> >>  include/hw/isa/isa.h                 | 4 ----
> >>  include/hw/mem/memory-device.h       | 4 +---
> >>  include/hw/nmi.h                     | 4 +---
> >>  include/hw/stream.h                  | 4 +---
> >>  include/hw/timer/m48t59.h            | 4 +---
> >>  include/qom/object_interfaces.h      | 6 +-----
> >>  include/sysemu/tpm.h                 | 4 +---
> >>  target/arm/idau.h                    | 4 +---
> >>  tests/check-qom-interface.c          | 4 +---
> >>  15 files changed, 14 insertions(+), 53 deletions(-)
> >>
> >> diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/ac=
pi_dev_interface.h
> >> index dabf4c4fc9..43ff119179 100644
> >> --- a/include/hw/acpi/acpi_dev_interface.h
> >> +++ b/include/hw/acpi/acpi_dev_interface.h
> >> @@ -25,11 +25,7 @@ typedef enum {
> >>       INTERFACE_CHECK(AcpiDeviceIf, (obj), \
> >>                       TYPE_ACPI_DEVICE_IF)
> >> =20
> >> -
> >> -typedef struct AcpiDeviceIf {
> >> -    /* <private> */
> >> -    Object Parent;
> >> -} AcpiDeviceIf;
> >> +typedef struct AcpiDeviceIf AcpiDeviceIf;
> >> =20
> >>  void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event);
> >> =20
> >> diff --git a/include/hw/arm/linux-boot-if.h b/include/hw/arm/linux-boo=
t-if.h
> >> index aba4479a14..7bbdfd1cc6 100644
> >> --- a/include/hw/arm/linux-boot-if.h
> >> +++ b/include/hw/arm/linux-boot-if.h
> >> @@ -16,10 +16,7 @@
> >>  #define ARM_LINUX_BOOT_IF(obj) \
> >>      INTERFACE_CHECK(ARMLinuxBootIf, (obj), TYPE_ARM_LINUX_BOOT_IF)
> >> =20
> >> -typedef struct ARMLinuxBootIf {
> >> -    /*< private >*/
> >> -    Object parent_obj;
> >> -} ARMLinuxBootIf;
> >> +typedef struct ARMLinuxBootIf ARMLinuxBootIf; =20
> > I like how it makes interface truly opaque and removes the need for
> > structure declaration but:
> >=20
> >  1: I'm not sure if it's acceptable thing to do from language point of =
view =20
>=20
> Yeah, it's fine. If you have just
>=20
> struct ARMLinuxBootIf;
>=20
> (and, optionally, a typedef to it,) then this type is called an
> "incomplete type" (for translation units that don't see the actual type
> definition). You can't apply the "sizeof" operator to it, you can't put
> it in other structs and arrays etc. I'm too lazy to look up the exact
> details in the C standard now. :) But, importantly,
> "pointer-to-ARMLinuxBootIf" is a complete type, and you can do all the
> usual things with that. (Define variables of that pointer type, embed
> them in other structures, use it as an array element type, pass them to
> functions, and so on.)

Thanks Laszlo, that's the answer I was looking for.

> Thanks
> Laszlo
>=20
> >  2: For a reader not aware of a trick, it's sort of confusing to have f=
orward declaration but without structure itself. So if #1 is acceptable we =
probably should document interface trick in object.h
> >=20
> > [...]
> >  =20
>=20
>=20

