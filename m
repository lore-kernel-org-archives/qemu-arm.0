Received: by 10.28.71.155 with SMTP id m27csp372288wmi;
        Thu, 22 Mar 2018 06:49:56 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtvYCXv9IJVH0C1CoTEj3eiRIwcKKpKrYSTN6fbB3DVac0xLMV4am2RwXaTK8wD7gT1spdJ
X-Received: by 10.200.53.217 with SMTP id l25mr35533204qtb.317.1521726596002;
        Thu, 22 Mar 2018 06:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521726595; cv=none;
        d=google.com; s=arc-20160816;
        b=JM3Kg6RxSIaAcm6UEDuloBmmtQgRKI1kdLkKDXgvedQmYduzzp0HlOVqJe7jMrXFPk
         +9Nu9StsOLi3AQ0FHULrxubDJi30Mq0WJr0QgsvY3kyAyrMdpkgHQ9ijqxhAfqRwyM/F
         JGjL4Xl/ENjRWJLUFILYqkcWj+6laj8jbkD8kyNuHxu5otNmBU/DYYzonPBwgfb1Us/Y
         1XCYBDkoUHpNs3xMtfw6mf8QoMeFtOoXI6YDt3vMryM6sysbK4H81fDj8cehIrKJU+X1
         FMpWQSSslKGrLGuZ3u2qKZMcOy0kKRPQyi67YC+UsCnBNQpSfUenL3EyxcfI4SmhLAlB
         sxgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=P1dR2cVLcabdeLaY3AvkogWlLbralkMCGyijtyqRYDg=;
        b=q+iw+G3SdtH+POXRVlhJjk4EBuKXjHrUnoW6EmHl72rAtf46tDO/ZERmXT23guaPRs
         UhIMsXEG9byRBTQKlND/W7TBHuOebeId+p/RbhbeozMfp/EaaJfjVuDDZrYIRivzSk/D
         1p/jB9CPrwiF4vrvbvQn4Huehy/P+4UHfRIWsZizA1HjrhaM1Oy1dyseXUvHwRfCHqv2
         sWvTTOGuiEPbfHd6XI5mpNmNuzHyHtQoLOoMKF4h3p9IlrlpFWz4S89olUy2VmEQ2/MP
         tg5nwg4ScrZ+BJZXPIm5QDT15C36TznTcgU2dlj1N2PxGgrlO5+jTCuYbwi0lx1uVjLn
         WZWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 142si7139429qkf.454.2018.03.22.06.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 06:49:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez0bL-0005AX-Hv
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 09:49:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ez0bA-00058h-0H
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 09:49:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ez0b5-0001oO-Vh
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 09:49:44 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41576 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1ez0b5-0001oE-Pb; Thu, 22 Mar 2018 09:49:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 483C34068031;
	Thu, 22 Mar 2018 13:49:39 +0000 (UTC)
Received: from hawk.localdomain (unknown [10.40.205.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3148B2023230;
	Thu, 22 Mar 2018 13:49:38 +0000 (UTC)
Date: Thu, 22 Mar 2018 14:49:35 +0100
From: Andrew Jones <drjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20180322134935.n5u6aitfrfl2ppts@hawk.localdomain>
References: <20180322031216.14569-1-wei@redhat.com>
	<20180322110712.GN3583@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180322110712.GN3583@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 13:49:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 13:49:39 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] mach-virt: Set VM's SMBIOS
 system version to mc->desc
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yjh6fhXVes18

On Thu, Mar 22, 2018 at 11:07:12AM +0000, Daniel P. Berrang=E9 wrote:
> On Wed, Mar 21, 2018 at 10:12:16PM -0500, Wei Huang wrote:
> > Instead of using "1.0" as the system version of SMBIOS, we should use
> > mc->desc for mach-virt machine type. With this patch, "dmidecode -t 1=
"
> > (e.g., "-M virt-2.12,accel=3Dkvm") will show:
> >=20
> >     Handle 0x0100, DMI type 1, 27 bytes
> >     System Information
> >             Manufacturer: QEMU
> >             Product Name: KVM Virtual Machine
> >             Version: QEMU 2.12 ARM Virtual Machine
> >             Serial Number: Not Specified
> >             ...
> >=20
> > instead of:
> >     Handle 0x0100, DMI type 1, 27 bytes
> >     System Information
> >             Manufacturer: QEMU
> >             Product Name: KVM Virtual Machine
> >             Version: 1.0
> >             Serial Number: Not Specified
> >             ...
> >=20
> > Signed-off-by: Wei Huang <wei@redhat.com>
> > ---
> >  hw/arm/virt.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 2c07245047..da7228b297 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1132,6 +1132,7 @@ static void *machvirt_dtb(const struct arm_boot=
_info *binfo, int *fdt_size)
> > =20
> >  static void virt_build_smbios(VirtMachineState *vms)
> >  {
> > +    MachineClass *mc =3D MACHINE_GET_CLASS(vms);
> >      uint8_t *smbios_tables, *smbios_anchor;
> >      size_t smbios_tables_len, smbios_anchor_len;
> >      const char *product =3D "QEMU Virtual Machine";
> > @@ -1145,7 +1146,7 @@ static void virt_build_smbios(VirtMachineState =
*vms)
> >      }
> > =20
> >      smbios_set_defaults("QEMU", product,
> > -                        "1.0", false, true, SMBIOS_ENTRY_POINT_30);
> > +                        mc->desc, false, true, SMBIOS_ENTRY_POINT_30=
);
>=20
> Surely this needs to be handled in back compatible manner so that exist=
ing
> machine types are not changed - only the new virt-2.12 machine type sho=
uld
> get new format.

On real hardware this table can change when there's a firmware update,
so I don't think any OS would expect it to stay the same across reboots.
I also can't imagine any applications caring at all about this,
particularly because it's currently the useless "1.0" string. I think
we're safe to neglect compat code in this case, but I may be missing
something. Is there a particular issue you're aware of that we'd risk
hitting? (Well, besides Windows detecting its installation machine has
"changed", invalidating its license or whatever. We don't yet have any
Windows guests to worry about.)

Thanks,
drew
