Received: by 10.25.27.66 with SMTP id b63csp761330lfb;
        Thu, 2 Jun 2016 08:06:01 -0700 (PDT)
X-Received: by 10.237.58.39 with SMTP id n36mr9597857qte.37.1464879961210;
        Thu, 02 Jun 2016 08:06:01 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u32si29213149qgd.61.2016.06.02.08.06.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 08:06:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8UC8-0007MB-N7
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 11:06:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pkrempa@redhat.com>) id 1b8UB7-0006qm-HC
	for qemu-devel@nongnu.org; Thu, 02 Jun 2016 11:05:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pkrempa@redhat.com>) id 1b8UB1-0003MN-G3
	for qemu-devel@nongnu.org; Thu, 02 Jun 2016 11:04:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55700)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pkrempa@redhat.com>)
	id 1b8UAw-0003LA-Lg; Thu, 02 Jun 2016 11:04:46 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7D2785545;
	Thu,  2 Jun 2016 15:04:44 +0000 (UTC)
Received: from andariel.pipo.sk (dhcp129-199.brq.redhat.com [10.34.129.199])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52F4eLH013541
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 2 Jun 2016 11:04:42 -0400
Date: Thu, 2 Jun 2016 17:05:06 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160602150506.GF5194@andariel.pipo.sk>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-5-git-send-email-imammedo@redhat.com>
	<20160601184620.GE13503@thinpad.lan.raisama.net>
	<20160602142222.307ec4ee@nial.brq.redhat.com>
	<20160602145322.GG19055@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20160602145322.GG19055@thinpad.lan.raisama.net>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 02 Jun 2016 15:04:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH RFC 4/8] target-i386: cpu: consolidate
 calls of object_property_parse() in x86_cpu_parse_featurestr
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, libvir-list@redhat.com,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	blauwirbel@gmail.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	Igor Mammedov <imammedo@redhat.com>,
	Jiri Denemark <jdenemar@redhat.com>, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4FHbq4Bh2d41

On Thu, Jun 02, 2016 at 11:53:22 -0300, Eduardo Habkost wrote:
> (CCing libvirt folks)
>=20
> BTW:
>=20
> On Thu, Jun 02, 2016 at 02:22:22PM +0200, Igor Mammedov wrote:
> [...]
> > >         /* Special cases: */
> > >         if (!strcmp(name, "xlevel")) {
> > >             numvalue =3D strtoul(val, &err, 0);
> > >             if (!*val || *err) {
> > >                 error_setg(errp, "bad numerical value %s", val);
> > >                 return;
> > >             }
> > >             if (numvalue < 0x80000000) {
> > >                 error_report("xlevel value shall always be >=3D 0x800=
00000"
> > >                              ", fixup will be removed in future versi=
ons");
> > >                 numvalue +=3D 0x80000000;
> > >             snprintf(num, sizeof(num), "%" PRIu32, numvalue);
> > >             val =3D num;
> [...]
> > >         } else if (!strcmp(name, "hv-spinlocks")) {
> > >             const int min =3D 0xFFF;
> > >=20
> > >             numvalue =3D strtoul(val, &err, 0);
> > >             if (!*val || *err) {
> > >                 error_setg(errp, "bad numerical value %s", val);
> > >                 return;
> > >             }
> > >             if (numvalue < min) {
> > >                 error_report("hv-spinlocks value shall always be >=3D=
 0x%x"
> > >                              ", fixup will be removed in future versi=
ons",
> > >                              min);
> > >                 numvalue =3D min;
> > >             }
>=20
> Those "fixup will be removed in future versions" warnings are
> present since QEMU 1.7. Assuming that libvirt never allowed those
> invalid values to be used in the configuration (did it?), I
> believe we can safely remove the hv-spinlocks and xlevel fixups
> in QEMU 2.7.

I couldn't find anything regarding xlevel (so we might actually not
support it at all), but we indeed do limit the hv_spinlock count:


                if (def->hyperv_spinlocks < 0xFFF) {
                    virReportError(VIR_ERR_XML_ERROR, "%s",
                                   _("HyperV spinlock retry count must be "
                                     "at least 4095"));
                    goto error;
                }

Peter

