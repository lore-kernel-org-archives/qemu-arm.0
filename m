Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp848085wrt;
        Tue, 20 Nov 2018 09:42:35 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X2x8vwfBfzZ8zzWJZfp/NNtF8WyfFVZcPNNKqO8vd/AUfVMdGr7AFxD62DPbuGWpGFZrNg
X-Received: by 2002:a25:3450:: with SMTP id b77-v6mr2798933yba.269.1542735755627;
        Tue, 20 Nov 2018 09:42:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542735755; cv=none;
        d=google.com; s=arc-20160816;
        b=KAOzwktRgk3E2jmbYekfhvtgrqqYUkt/WWOVnSwUG1w6yhMzvxvHk3lTYc5xIsNPkI
         21xVGNCKN+OLl2u3q5goOM/Jx0w9vinpdzvPCQFtaT7drMiRghzvxX607N3/fm6cO/wt
         srFEVQFx54s56IGv/tgTfowm7dmlFaAggnw4/jC1Jq8pCBNiS7CRyv9z+eTLksnfObE2
         Pk3qYNyYrG9TUvtws/2uX8OBXMjLwnWJLCWYYRCi3efATxp1lRgOAYfsu530mQ05TzHF
         3ihrrAXlBBh6+vf6didhtAW0VU8u9VCqZbm9kajymBg01afGPHua60PcWsJD3f18mTkq
         kaTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=bQLSeqQbQhACl8BpIM4VYzgrPYvALf6ygdVQnbNfXSM=;
        b=GSegzXgwMrQjAhsIEPYsT3zeSOyVx+bH4fcOW0f+SEX5Hxx5rctN3ItP7zVVMWZSeL
         EnuM27YD6hSgNDgTR7x/ei4Hwic8c8E6Tgeq1yuPViuT23k1vUnZXLVAeueN1zZIQUs3
         4SFCOHkZ1+YuYil5LyTM+Sjjyk+boYEXeDUrOcU2RYXg+2K/PzfFk7vQAOL929p5wLfz
         rRlh75pWDyQmw159vbDm9nHJhHcGElXe0HdtPKm7bukA4sVmqqLF1KqEGXnNOgp9nyTh
         IrWjmNxzB3zezZfK4J/NgaZCkGz/Bz1cVxhXW+eNIZ0v6akLZdg+89/xmFg44kb31mQm
         S47g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e131-v6si1078453ybc.161.2018.11.20.09.42.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 09:42:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPA2l-0006U9-1p
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 12:42:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gPA2Z-0006ST-U5
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 12:42:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gPA2V-000066-Uz
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 12:42:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37984)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gPA2V-000053-Lz; Tue, 20 Nov 2018 12:42:19 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A4018830B;
	Tue, 20 Nov 2018 17:42:18 +0000 (UTC)
Received: from localhost (ovpn-116-21.gru2.redhat.com [10.97.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 964025C6C2;
	Tue, 20 Nov 2018 17:42:12 +0000 (UTC)
Date: Tue, 20 Nov 2018 15:42:10 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181120174210.GK4755@habkost.net>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-3-marcandre.lureau@redhat.com>
	<20181120173324.64a36d8e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181120173324.64a36d8e@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 20 Nov 2018 17:42:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, dgilbert@redhat.com, qemu-arm@nongnu.org,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Richard Henderson <rth@twiddle.net>, lersek@redhat.com,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YbkcoQo/hBgq

On Tue, Nov 20, 2018 at 05:33:24PM +0100, Igor Mammedov wrote:
> On Wed,  7 Nov 2018 16:36:40 +0400
> Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com> wrote:
>=20
> > Interfaces don't have instance, let's make the interface type really
> > abstract to avoid confusion.
> >=20
> > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/hw/acpi/acpi_dev_interface.h | 6 +-----
> >  include/hw/arm/linux-boot-if.h       | 5 +----
> >  include/hw/fw-path-provider.h        | 4 +---
> >  include/hw/hotplug.h                 | 6 +-----
> >  include/hw/intc/intc.h               | 4 +---
> >  include/hw/ipmi/ipmi.h               | 4 +---
> >  include/hw/isa/isa.h                 | 4 ----
> >  include/hw/mem/memory-device.h       | 4 +---
> >  include/hw/nmi.h                     | 4 +---
> >  include/hw/stream.h                  | 4 +---
> >  include/hw/timer/m48t59.h            | 4 +---
> >  include/qom/object_interfaces.h      | 6 +-----
> >  include/sysemu/tpm.h                 | 4 +---
> >  target/arm/idau.h                    | 4 +---
> >  tests/check-qom-interface.c          | 4 +---
> >  15 files changed, 14 insertions(+), 53 deletions(-)
> >=20
> > diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/a=
cpi_dev_interface.h
> > index dabf4c4fc9..43ff119179 100644
> > --- a/include/hw/acpi/acpi_dev_interface.h
> > +++ b/include/hw/acpi/acpi_dev_interface.h
> > @@ -25,11 +25,7 @@ typedef enum {
> >       INTERFACE_CHECK(AcpiDeviceIf, (obj), \
> >                       TYPE_ACPI_DEVICE_IF)
> > =20
> > -
> > -typedef struct AcpiDeviceIf {
> > -    /* <private> */
> > -    Object Parent;
> > -} AcpiDeviceIf;
> > +typedef struct AcpiDeviceIf AcpiDeviceIf;
> > =20
> >  void acpi_send_event(DeviceState *dev, AcpiEventStatusBits event);
> > =20
> > diff --git a/include/hw/arm/linux-boot-if.h b/include/hw/arm/linux-bo=
ot-if.h
> > index aba4479a14..7bbdfd1cc6 100644
> > --- a/include/hw/arm/linux-boot-if.h
> > +++ b/include/hw/arm/linux-boot-if.h
> > @@ -16,10 +16,7 @@
> >  #define ARM_LINUX_BOOT_IF(obj) \
> >      INTERFACE_CHECK(ARMLinuxBootIf, (obj), TYPE_ARM_LINUX_BOOT_IF)
> > =20
> > -typedef struct ARMLinuxBootIf {
> > -    /*< private >*/
> > -    Object parent_obj;
> > -} ARMLinuxBootIf;
> > +typedef struct ARMLinuxBootIf ARMLinuxBootIf;
> I like how it makes interface truly opaque and removes the need for
> structure declaration but:
>=20
>  1: I'm not sure if it's acceptable thing to do from language point of =
view
>=20
>  2: For a reader not aware of a trick, it's sort of confusing to have f=
orward declaration but without structure itself. So if #1 is acceptable w=
e probably should document interface trick in object.h

I'm not sure what's the question here.  We do this all the time
on typedefs.h, don't we?

--=20
Eduardo
