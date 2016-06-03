Received: by 10.25.27.66 with SMTP id b63csp97399lfb;
        Fri, 3 Jun 2016 00:29:59 -0700 (PDT)
X-Received: by 10.55.201.22 with SMTP id q22mr1990610qki.34.1464938999117;
        Fri, 03 Jun 2016 00:29:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p79si1607303qkl.180.2016.06.03.00.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 00:29:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8jYM-0005kt-Hp
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 03:29:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pkrempa@redhat.com>) id 1b8jYI-0005kT-1U
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 03:29:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pkrempa@redhat.com>) id 1b8jYD-0007TV-0Z
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 03:29:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57310)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pkrempa@redhat.com>)
	id 1b8jYC-0007Sb-RK; Fri, 03 Jun 2016 03:29:48 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE3D364D0F;
	Fri,  3 Jun 2016 07:29:47 +0000 (UTC)
Received: from andariel.pipo.sk (dhcp129-199.brq.redhat.com [10.34.129.199])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u537Tggw007575
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 3 Jun 2016 03:29:45 -0400
Date: Fri, 3 Jun 2016 09:30:09 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160603073009.GG5194@andariel.pipo.sk>
References: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
	<1464799050-11002-5-git-send-email-imammedo@redhat.com>
	<20160601184620.GE13503@thinpad.lan.raisama.net>
	<20160602142222.307ec4ee@nial.brq.redhat.com>
	<20160602145322.GG19055@thinpad.lan.raisama.net>
	<20160602150506.GF5194@andariel.pipo.sk>
	<20160602183104.3720c55d@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20160602183104.3720c55d@nial.brq.redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 03 Jun 2016 07:29:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH RFC 4/8] target-i386: cpu: consolidate calls
 of object_property_parse() in x86_cpu_parse_featurestr
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
	libvir-list@redhat.com, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, Jiri Denemark <jdenemar@redhat.com>, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ksEcsvBQMWPW

On Thu, Jun 02, 2016 at 18:31:04 +0200, Igor Mammedov wrote:
> On Thu, 2 Jun 2016 17:05:06 +0200
> Peter Krempa <pkrempa@redhat.com> wrote:
> > On Thu, Jun 02, 2016 at 11:53:22 -0300, Eduardo Habkost wrote:
> > > On Thu, Jun 02, 2016 at 02:22:22PM +0200, Igor Mammedov wrote:

[...]

> > I couldn't find anything regarding xlevel (so we might actually not
> > support it at all), but we indeed do limit the hv_spinlock count:
> >=20
> >=20
> >                 if (def->hyperv_spinlocks < 0xFFF) {
> >                     virReportError(VIR_ERR_XML_ERROR, "%s",
> >                                    _("HyperV spinlock retry count must =
be "
> >                                      "at least 4095"));
> >                     goto error;
> >                 }
> >=20
> > Peter
> Peter,
> Does libvirt still uses -cpu xxx,+feat1,-feat2 syntax
> or canonical property syntax there feat1=3Don,feat2=3Doff

We use the legacy one:

-cpu core2duo,+ds,+acpi,+ht,+tm,+ds_cpl, ...

and

-cpu 'qemu32,hv_relaxed,hv_vapic, ...=20

for the hyperv features.

We probably can switch to the new one if there's a reasonable way how to
detect that qemu is supporting the new one.

Peter
