Received: by 10.28.71.155 with SMTP id m27csp378214wmi;
        Thu, 22 Mar 2018 06:55:58 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtfQj9Xm+jtaToxkLXn5JjEixDMV261+YLwJMbpHZdGrOhvXZmsQ+rJQ//YXfqhWTwjfoOz
X-Received: by 10.200.57.39 with SMTP id s36mr35589145qtb.328.1521726958394;
        Thu, 22 Mar 2018 06:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521726958; cv=none;
        d=google.com; s=arc-20160816;
        b=jFf01BZSh1Zk7atfq8GeiWt/cQOMwosPNsDJem4nIuJqGpJKPudkmFRQcLlFgAZCR/
         Theui4WgZlz7siMCMqRYt96Ok0txMLmMZU+xv48ZDvCSCcvpnIwG/tAogXi1ytjy9MLN
         RakjyexngS4u64VeAi7LeCtH9jTPxmsXbUopaW3qzt0Jj1vCdXC4cFSryPNBvU/aJi39
         ojxApxaIdAaaLHfaiMYolGxB4HfuWlB8nmtp6R9L87Hg6tj1D4AXuv5G+AB/ynaRRxls
         K/D+306eFKz7OwNTX0yeHRfsLwfOp5cAI0o3vYEdxFy2DhJaHPWP47A64588pjx8TJ9v
         CY3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=4CBUnmy2WK8FObeaynUU2CHY/SFRtalKcVeRhOpnm3w=;
        b=eKacd8BfJ2WoZOIL20DHFQtGlGGs6nDpVnzQfSYRDue9ibZBIVke6hm7EVRTOUTunk
         AMwiNu03lVYLERzQ8En/Enk0aHgx+mvCQ8P+KbsMfStBAQ8k0/S1rRlkiXAATjx+Aygs
         7S9yvjM0XiditXTXYC9Vgl2nF8j04IFN6cSAB4aHkFCVfdVpcKIO2FgyLPMGCcEh/CuE
         xkG+cz/b4YOdMbbyQikjKZJY1TKZstDJXGFN3bWUcTVyrrvLapeOpbrIFRj8M/I9CtH6
         turgI3DNwl3o2kENe7BaMxSJYX1dxisjG7gxLlhULguhmNLkOCsqk4V20cwhONLL19Ef
         bPmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x31si7112503qtc.442.2018.03.22.06.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 06:55:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez0hB-0008V3-Ue
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 09:55:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ez0gw-0008QL-Mh
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 09:55:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ez0gv-0007X2-GC
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 09:55:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46972 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1ez0gv-0007Wh-9x; Thu, 22 Mar 2018 09:55:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49031818595A;
	Thu, 22 Mar 2018 13:55:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F19A5111F3D9;
	Thu, 22 Mar 2018 13:55:36 +0000 (UTC)
Date: Thu, 22 Mar 2018 13:55:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20180322135534.GQ3583@redhat.com>
References: <20180322031216.14569-1-wei@redhat.com>
	<20180322110712.GN3583@redhat.com>
	<20180322134935.n5u6aitfrfl2ppts@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180322134935.n5u6aitfrfl2ppts@hawk.localdomain>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Thu, 22 Mar 2018 13:55:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Thu, 22 Mar 2018 13:55:40 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nZKizz/P52l4

On Thu, Mar 22, 2018 at 02:49:35PM +0100, Andrew Jones wrote:
> On Thu, Mar 22, 2018 at 11:07:12AM +0000, Daniel P. Berrang=C3=A9 wrote=
:
> > On Wed, Mar 21, 2018 at 10:12:16PM -0500, Wei Huang wrote:
> > > Instead of using "1.0" as the system version of SMBIOS, we should u=
se
> > > mc->desc for mach-virt machine type. With this patch, "dmidecode -t=
 1"
> > > (e.g., "-M virt-2.12,accel=3Dkvm") will show:
> > >=20
> > >     Handle 0x0100, DMI type 1, 27 bytes
> > >     System Information
> > >             Manufacturer: QEMU
> > >             Product Name: KVM Virtual Machine
> > >             Version: QEMU 2.12 ARM Virtual Machine
> > >             Serial Number: Not Specified
> > >             ...
> > >=20
> > > instead of:
> > >     Handle 0x0100, DMI type 1, 27 bytes
> > >     System Information
> > >             Manufacturer: QEMU
> > >             Product Name: KVM Virtual Machine
> > >             Version: 1.0
> > >             Serial Number: Not Specified
> > >             ...
> > >=20
> > > Signed-off-by: Wei Huang <wei@redhat.com>
> > > ---
> > >  hw/arm/virt.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index 2c07245047..da7228b297 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -1132,6 +1132,7 @@ static void *machvirt_dtb(const struct arm_bo=
ot_info *binfo, int *fdt_size)
> > > =20
> > >  static void virt_build_smbios(VirtMachineState *vms)
> > >  {
> > > +    MachineClass *mc =3D MACHINE_GET_CLASS(vms);
> > >      uint8_t *smbios_tables, *smbios_anchor;
> > >      size_t smbios_tables_len, smbios_anchor_len;
> > >      const char *product =3D "QEMU Virtual Machine";
> > > @@ -1145,7 +1146,7 @@ static void virt_build_smbios(VirtMachineStat=
e *vms)
> > >      }
> > > =20
> > >      smbios_set_defaults("QEMU", product,
> > > -                        "1.0", false, true, SMBIOS_ENTRY_POINT_30)=
;
> > > +                        mc->desc, false, true, SMBIOS_ENTRY_POINT_=
30);
> >=20
> > Surely this needs to be handled in back compatible manner so that exi=
sting
> > machine types are not changed - only the new virt-2.12 machine type s=
hould
> > get new format.
>=20
> On real hardware this table can change when there's a firmware update,
> so I don't think any OS would expect it to stay the same across reboots=
.
> I also can't imagine any applications caring at all about this,
> particularly because it's currently the useless "1.0" string. I think
> we're safe to neglect compat code in this case, but I may be missing
> something. Is there a particular issue you're aware of that we'd risk
> hitting? (Well, besides Windows detecting its installation machine has
> "changed", invalidating its license or whatever. We don't yet have any
> Windows guests to worry about.)

I don't have a particular scenario in mind - just the general rule that
we don't change something which is guest visible without tieing it to
machine type. I guess we've not tied machine types to specific
SeaBIOS / UEFI snapshot builds though, so in terms of firmware changing
we've already got that scenario.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
