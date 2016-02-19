Received: by 10.25.208.211 with SMTP id h202csp1259893lfg;
        Fri, 19 Feb 2016 08:59:17 -0800 (PST)
X-Received: by 10.140.31.5 with SMTP id e5mr16967899qge.2.1455901157463;
        Fri, 19 Feb 2016 08:59:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n73si15109170qhc.34.2016.02.19.08.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 08:59:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53817 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWoOj-0000Yj-0W
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 11:59:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aWoOg-0000YY-Do
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 11:59:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aWoOd-0005Sa-Lt
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 11:59:14 -0500
Received: from smtp.andrew.cmu.edu ([128.2.105.203]:37684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>)
	id 1aWoOd-0005SK-GM; Fri, 19 Feb 2016 11:59:11 -0500
Received: from HEDWIG.INI.CMU.EDU (HEDWIG.INI.CMU.EDU [128.2.16.51])
	(user=somlo mech=LOGIN (0 bits))
	by smtp.andrew.cmu.edu (8.14.8/8.14.8) with ESMTP id u1JGx2q8016631
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT);
	Fri, 19 Feb 2016 11:59:03 -0500
Date: Fri, 19 Feb 2016 11:59:02 -0500
From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160219165902.GY16357@HEDWIG.INI.CMU.EDU>
References: <1455228365-13666-1-git-send-email-somlo@cmu.edu>
	<1455228365-13666-4-git-send-email-somlo@cmu.edu>
	<20160219144953.03aff7eb@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20160219144953.03aff7eb@nial.brq.redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.5.24 (2015-08-30)
X-PMX-Version: 6.0.3.2322014, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2016.2.19.165117
X-SMTP-Spam-Clean: 8% ( MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05,
	BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, DATE_TZ_NA 0,
	FROM_EDU_TLD 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0,
	__BOUNCE_CHALLENGE_SUBJ 0, __BOUNCE_NDR_SUBJ_EXEMPT 0, __CD 0,
	__CT 0, __CTE 0, __CT_TEXT_PLAIN 0, __FORWARDED_MSG 0,
	__HAS_FROM 0, __HAS_MSGID 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0,
	__MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0,
	__PHISH_SPEAR_STRUCTURE_1 0, __REFERENCES 0, __SANE_MSGID 0,
	__SUBJ_ALPHA_END 0, __SUBJ_ALPHA_NEGATE 0, __TO_MALFORMED_2 0,
	__URI_NO_PATH 0, __URI_NO_WWW 0, __URI_NS , __USER_AGENT 0)
X-SMTP-Spam-Score: 8%
X-Scanned-By: MIMEDefang 2.74 on 128.2.105.203
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.andrew.cmu.edu id
	u1JGx2q8016631
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 128.2.105.203
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, qemu-devel@nongnu.org,
	leif.lindholm@linaro.org, luto@amacapital.net,
	qemu-arm@nongnu.org, kraxel@redhat.com, pbonzini@redhat.com,
	lersek@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v8 3/5] acpi: pc: add fw_cfg
 device node to dsdt
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: a1yWgatTZBXz

On Fri, Feb 19, 2016 at 02:49:53PM +0100, Igor Mammedov wrote:
> On Thu, 11 Feb 2016 17:06:03 -0500
> "Gabriel L. Somlo" <somlo@cmu.edu> wrote:
>=20
> > Add a fw_cfg device node to the ACPI DSDT. While the guest-side
> > firmware can't utilize this information (since it has to access
> > the hard-coded fw_cfg device to extract ACPI tables to begin with),
> > having fw_cfg listed in ACPI will help the guest kernel keep a more
> > accurate inventory of in-use IO port regions.
> >=20
> > Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
> > Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> > Reviewed-by: Marc Mar=ED <markmb@redhat.com>
> > ---
> >  hw/i386/acpi-build.c | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >=20
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 4554eb8..4762fd2 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -2190,6 +2190,35 @@ build_dsdt(GArray *table_data, GArray *linker,
> >      aml_append(scope, aml_name_decl("_S5", pkg));
> >      aml_append(dsdt, scope);
> > =20
> > +    /* create fw_cfg node, unconditionally */
> > +    {
> > +        /* when using port i/o, the 8-bit data register *always* ove=
rlaps
> > +         * with half of the 16-bit control register. Hence, the tota=
l size
> > +         * of the i/o region used is FW_CFG_CTL_SIZE; when using DMA=
, the
> > +         * DMA control register is located at FW_CFG_DMA_IO_BASE + 4=
 */
> > +        uint8_t io_size =3D object_property_get_bool(OBJECT(pcms->fw=
_cfg),
> > +                                                   "dma_enabled", NU=
LL) ?
> > +                          ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_=
addr_t) :
> > +                          FW_CFG_CTL_SIZE;
> > +
> > +        scope =3D aml_scope("\\_SB");
> > +        dev =3D aml_device("FWCF");
> > +
> > +        aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")=
));
> From my tests with different Windows versions, it doesn't prevent
> WS2003 and WS2008 from showing a prompt for unknown device that asks fo=
r a driver.

I installed windows 2008 server r2 64bit, on both pc and q35 machines,
and still only saw the "unknown device" in the Device Manager after
forcing _STA to 0xF (instead of 0xB).

> One however could shut it up by allowing OS look for a driver
> which is not found and then tell  not to ask for it anymore.

It's entirely possible that "after a while" something would pop up and
ask for a driver anyway. I did try to "humor it" by allowing it to
search for a driver, and it failed, and the device was still showing
up as unknown (remember, this is with _STA set to 0xF, which I did
only to force it to show up :)

I never waited around long enough for it to prompt me, so that may be
the difference between our tests...

>=20
> So existing users will have to perform this action once
> they have migrated to newer QEMU regardless of machine version.
>=20
> > +
> > +        /* device present, functioning, decoding, not shown in UI */
> > +        aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> > +
> > +        crs =3D aml_resource_template();
> > +        aml_append(crs,
> > +            aml_io(AML_DECODE16, FW_CFG_IO_BASE, FW_CFG_IO_BASE, 0x0=
1, io_size)
> > +        );
> that creates \_SB.FWCF._CRS=20
> +            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource=
 Settings
> +            {
> +                IO (Decode16,
> +                    0x0510,             // Range Minimum
> +                    0x0510,             // Range Maximum
> +                    0x01,               // Alignment
> +                    0x0C,               // Length
> +                    )
> +            })
>=20
> which collides with \_SB.PCI0._CRS
>             WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, En=
tireRange,
>                 0x0000,             // Granularity
>                 0x0000,             // Range Minimum
>                 0x0CF7,             // Range Maximum
>                 0x0000,             // Translation Offset
>                 0x0CF8,
>=20
> that shouldn't happen, and solution for this is to put
> FWCF device descriptor in \_SB.PCI0 scope so FWCF would consume
> from PCI0 IO range.
>=20
> That won't help Windows to notice a conflict, if there is any,
> as there aren't any drivers for QEMU0002 device but at least
> when Windows gets a driver it won't crash due above conflict.

OK, so the difference between "\_SB" and "\_SB.PCI0" is that, with
_STA forced to 0xF, the "resources" tab of the "unknown device" no
longer shows conflicts on the IO range of 510-518.

With that being said, I still hope most people won't ever make it this
far (with _STA set to 0xB). But in case they ever do, yes, placing
FWCF in \_SB.PCI0 should take care of it -- thanks for showing me that!

V9 (coming up soon) should reflect that change.

Thanks much,
--Gabriel

>=20
> > +        aml_append(dev, aml_name_decl("_CRS", crs));
> > +
> > +        aml_append(scope, dev);
> > +        aml_append(dsdt, scope);
> > +    }
> > +
> >      if (misc->applesmc_io_base) {
> >          scope =3D aml_scope("\\_SB.PCI0.ISA");
> >          dev =3D aml_device("SMC");
>=20
