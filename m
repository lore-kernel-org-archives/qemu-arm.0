Received: by 10.25.159.19 with SMTP id i19csp310990lfe;
        Thu, 11 Feb 2016 08:19:34 -0800 (PST)
X-Received: by 10.140.98.197 with SMTP id o63mr51366815qge.78.1455207574572;
        Thu, 11 Feb 2016 08:19:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j107si10219781qgj.89.2016.02.11.08.19.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Feb 2016 08:19:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51364 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aTtxu-0005hK-0O
	for alex.bennee@linaro.org; Thu, 11 Feb 2016 11:19:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aTtxs-0005fv-0N
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 11:19:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <somlo@cmu.edu>) id 1aTtxm-0003zy-TA
	for qemu-arm@nongnu.org; Thu, 11 Feb 2016 11:19:31 -0500
Received: from smtp.andrew.cmu.edu ([128.2.105.202]:36794)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <somlo@cmu.edu>)
	id 1aTtxm-0003zn-NL; Thu, 11 Feb 2016 11:19:26 -0500
Received: from HEDWIG.INI.CMU.EDU (HEDWIG.INI.CMU.EDU [128.2.16.51])
	(user=somlo mech=LOGIN (0 bits))
	by smtp.andrew.cmu.edu (8.14.8/8.14.8) with ESMTP id u1BGJIaP018631
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT);
	Thu, 11 Feb 2016 11:19:20 -0500
Date: Thu, 11 Feb 2016 11:19:18 -0500
From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160211161918.GN16357@HEDWIG.INI.CMU.EDU>
References: <1455136900-22334-1-git-send-email-somlo@cmu.edu>
	<1455136900-22334-4-git-send-email-somlo@cmu.edu>
	<20160211161959.7d939e7e@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20160211161959.7d939e7e@nial.brq.redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.5.24 (2015-08-30)
X-PMX-Version: 6.0.3.2322014, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2016.2.11.160617
X-SMTP-Spam-Clean: 8% ( MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05,
	BODY_SIZE_3000_3999 0, BODY_SIZE_5000_LESS 0,
	BODY_SIZE_7000_LESS 0, DATE_TZ_NA 0, FROM_EDU_TLD 0,
	NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0,
	__BOUNCE_CHALLENGE_SUBJ 0, __BOUNCE_NDR_SUBJ_EXEMPT 0, __CD 0,
	__CT 0, __CTE 0, __CT_TEXT_PLAIN 0, __FORWARDED_MSG 0,
	__HAS_FROM 0, __HAS_MSGID 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0,
	__MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0,
	__PHISH_SPEAR_STRUCTURE_1 0, __REFERENCES 0, __SANE_MSGID 0,
	__SUBJ_ALPHA_END 0, __SUBJ_ALPHA_NEGATE 0, __TO_MALFORMED_2 0,
	__URI_NO_PATH 0, __URI_NO_WWW 0, __URI_NS , __USER_AGENT 0)
X-SMTP-Spam-Score: 8%
X-Scanned-By: MIMEDefang 2.74 on 128.2.105.202
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp.andrew.cmu.edu id
	u1BGJIaP018631
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 128.2.105.202
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	matt@codeblueprint.co.uk, stefanha@gmail.com,
	ard.biesheuvel@linaro.org, qemu-devel@nongnu.org,
	leif.lindholm@linaro.org, luto@amacapital.net,
	qemu-arm@nongnu.org, kraxel@redhat.com, pbonzini@redhat.com,
	lersek@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 3/5] acpi: pc: add fw_cfg
 device node to ssdt
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
X-TUID: 1uE5PgJvMjk5

On Thu, Feb 11, 2016 at 04:19:59PM +0100, Igor Mammedov wrote:
> On Wed, 10 Feb 2016 15:41:38 -0500
> "Gabriel L. Somlo" <somlo@cmu.edu> wrote:
>=20
> > Add a fw_cfg device node to the ACPI SSDT. While the guest-side
> > firmware can't utilize this information (since it has to access
> > the hard-coded fw_cfg device to extract ACPI tables to begin with),
> > having fw_cfg listed in ACPI will help the guest kernel keep a more
> > accurate inventory of in-use IO port regions.
> subj and commit msg:
> s/SSDT/DSDT/

Thanks for catching that, got it lined up for v8 :)

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
> Will that unconditionally make all Windows guests ask for driver for un=
known device?

That didn't happen in my tests. With _STA set to 0xB, we have the
bit representing "device shown in the UI" set to "off", and so Windows
(XP and Win7 in my tests) completely ignore it.

Originally I was asked (by Eduardo, IIRC) to make insertion of the
fw_cfg acpi node conditional on the machine version, but then later we
collectively agreed to no longer require that, so there wasn't an if (...=
)
condition to put in front of the { ... } block anymore. I replaced the
condition with the comment that says "add unconditionally"; I can change
the wording on that if it's confusing, but I'd like to keep the extra
curly braces to match the way all other surrounding ACPI nodes are added.

Thanks,
--Gabriel

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
> > +
> > +        /* device present, functioning, decoding, not shown in UI */
> > +        aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> > +
> > +        crs =3D aml_resource_template();
> > +        aml_append(crs,
> > +            aml_io(AML_DECODE16, FW_CFG_IO_BASE, FW_CFG_IO_BASE, 0x0=
1, io_size)
> > +        );
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
