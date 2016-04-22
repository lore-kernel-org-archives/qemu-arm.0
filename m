Received: by 10.25.208.194 with SMTP id h185csp604526lfg;
        Fri, 22 Apr 2016 00:46:29 -0700 (PDT)
X-Received: by 10.55.164.66 with SMTP id n63mr3436788qke.189.1461311189687;
        Fri, 22 Apr 2016 00:46:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o24si2854179qko.113.2016.04.22.00.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 00:46:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atVnJ-0001R5-9P
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 03:46:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1atVnH-0001PK-Bz
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 03:46:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1atVnC-0003X4-8s
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 03:46:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38142)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1atVnC-0003X0-1X; Fri, 22 Apr 2016 03:46:22 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5462810F1B3;
	Fri, 22 Apr 2016 07:46:19 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-34.ams2.redhat.com
	[10.36.116.34])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3M7kIK3002719; Fri, 22 Apr 2016 03:46:18 -0400
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 17BB081C68; Fri, 22 Apr 2016 09:46:17 +0200 (CEST)
Message-ID: <1461311177.28204.67.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Date: Fri, 22 Apr 2016 09:46:17 +0200
In-Reply-To: <CAPokK=qiaGkd3oZ+r_cLNov4gvAF6Qtv-p6NwxHkY_m4_NrqRg@mail.gmail.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<CAFEAcA8mLk+3t+ypR96WPG9yMsvbJ4hmgk1NwfxPLHzk0R=Dwg@mail.gmail.com>
	<DD3027E2-6F96-4D87-B2C5-02E9926AA402@sylvaingarrigues.com>
	<CAFEAcA_nE2Ee_Ky+upz4veasmkyiVSHqyUe2-brtfopJA2-=_g@mail.gmail.com>
	<A03258E3-4CFE-49F8-8601-1467CD70AC29@sylvaingarrigues.com>
	<CAFEAcA-yDZKEgZfFmtgn3+j3qCKo_zUJwp40BRERF4rF-tjASw@mail.gmail.com>
	<DED29353-D9CE-45F5-990F-0A32DB57B4AE@sylvaingarrigues.com>
	<5718FA7F.5030903@wwwdotorg.org>
	<CAPokK=qiaGkd3oZ+r_cLNov4gvAF6Qtv-p6NwxHkY_m4_NrqRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 22 Apr 2016 07:46:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] bcm2835_property: use cached
 values when querying framebuffer
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
	Stephen Warren <swarren@wwwdotorg.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Sylvain Garrigues <sylvain@sylvaingarrigues.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KBH+4/7IkqQs

  Hi,

> > Ideally as was mentioned earlier this would be done by simply executing=
 the
> > existing bootloader under emulation, rather than building all that code=
 into
> > qemu. However, in the Pi case, the bootloader runs on the VideoCore (a
> > separate non-ARM CPU), so isn't (and likely won't be since IIUC it isn'=
t
> > fully documented) emulated by qemu. by the time the ARM CPU runs, every=
thing
> > (kernel, DTB/ATAGS, ARM boot stub, ...) is already loaded into RAM, the
> > display is already probed over HDMI and the controller scanning out a d=
ummy
> > image, etc.
> >
> > So I think if that were to be supported, it'd have to be coded into qem=
u. Is
> > that something that could happen, or would such patches not fit qemu's =
model
> > well?
>=20
> I made half a start on this project but had to shelve it.
>=20
> The hard part is the FAT filesystem. The basic approach I started on
> was to link in the relevant bits of the GNU mtools so QEMU can poke
> around in a FAT filesystem hosted on a block device. Then just mount
> the SD card and emulate the boot logic of the VideoCore bootloader.
> This amount of new code should actually be pretty small, as the FS
> driver is handled by mtools and the SDHCI can be shorted by just
> having this alternate bootloader go direct to the block device (fish
> the blockdev out from the SD card).

Alternatively we can just go for a later boot loader stage, i.e. put a
u-boot build for rpi2 to pc-bios/ (we already have one for ppc there)
and run that by default.

Our sdcard emulation seems to have problems though:

   U-Boot 2016.05-rc2 (Apr 22 2016 - 09:11:45 +0200)

   DRAM:  960 MiB
   RPI 2 Model B (0xa21041)
   MMC:   <uboot hangs here>

Recent linux kernels have trouble talking to the mmc too.
