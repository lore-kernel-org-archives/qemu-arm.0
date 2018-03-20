Received: by 10.28.91.67 with SMTP id p64csp4125282wmb;
        Tue, 20 Mar 2018 10:50:18 -0700 (PDT)
X-Google-Smtp-Source: AG47ELunqq9NFsnvCipfdUoP4jSnXUtm6YSUsmwQ2ZaQKqkVZ/9+TtAy25a3uaSZeTWX4T+A5A5I
X-Received: by 10.200.39.67 with SMTP id h3mr12869939qth.115.1521568217873;
        Tue, 20 Mar 2018 10:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521568217; cv=none;
        d=google.com; s=arc-20160816;
        b=tWqcaG/4oevIBWeBP3MrgX59N2ItdJbI5WizVJwxLmV5Mq/Vx2JL66hRvoK/Bg++67
         4lq39xsQ8nrC/BRmBwmyfFkMAazcAWxbC2l1zLp72eJXAS4wMMwydWzeuVMJWVVI4Cuy
         YA3EFgjQhpLK4aa+B9PzMG7+ERTNrHFTUbGFINEciRakDyzj6hf+2AQBBoWNsiPg4PRm
         BO48Fyp2eyBeDY55PdsbxbjEsTY3Zi3hrlRgZD+coR+hGhRx0FR+OcplqzSb5+lEM4kJ
         p/tgpXX1arvHhWu9n+mlxgi7c9MLQGOyawShlM6agcBHg0fbsHZ3Fnzxee6GycqlPoEm
         nc2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=IkhGHHI2pXxb9ryYAm40dG1nZEcLfxmVL6sRfApFOC4=;
        b=HFN15bUJlKl6oLUyywUPHnbw9PJAc9admUmKDPLC/SMmv0Y0SV5E7HUCMwbBluTxhs
         FCxXedbg1meatrG9u1vGCZ4Nb8jA2YrBYR/5Q9P2Pp9dQUN8LnSqV27N/8I5bmXTIc/Z
         mjiwNLSUmFVwffLJ7eBIeFeIF6LBEds3rA0Cw4hk8j7pst2/zIRcHZKz9KUDzaqdGMWo
         wJDntazbhsuRx5pOqlOtgCgX5aop5UCdlA1Qqnl/nPRBd1GBwLv6AJEjAAjisxaSpLUY
         aQFkS2wxyRDgHKmEeVW1E4wW3A31qsKh0i8qxACooMfcmTeWSUMj+Se54lE2GcvJq304
         zj2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e94si3616802qkh.27.2018.03.20.10.50.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 10:50:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyLOr-00046x-EK
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 13:50:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyLOg-00045J-Lr
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 13:50:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1eyLOc-0001Fp-AM
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 13:50:06 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37404 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1eyLOc-0001FV-4k; Tue, 20 Mar 2018 13:50:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D65D8D774;
	Tue, 20 Mar 2018 17:49:50 +0000 (UTC)
Received: from redhat.com (ovpn-125-54.rdu2.redhat.com [10.10.125.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D933215CDA7;
	Tue, 20 Mar 2018 17:49:41 +0000 (UTC)
Date: Tue, 20 Mar 2018 19:49:41 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20180320194454-mutt-send-email-mst@kernel.org>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<b068cb91-b8ba-175c-40f5-a7c9c8163575@weilnetz.de>
	<20180320185130-mutt-send-email-mst@kernel.org>
	<20180320173401.GG4530@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180320173401.GG4530@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 20 Mar 2018 17:49:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 20 Mar 2018 17:49:50 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'mst@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] qemu: include generated files
 with <> and not ""
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
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Keith Busch <keith.busch@intel.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Greg Kurz <groug@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Hannes Reinecke <hare@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Jason Wang <jasowang@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Jiri Pirko <jiri@resnulli.us>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Lieven <pl@kamp.de>, Josh Durgin <jdurgin@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Liu Yuan <namei.unix@gmail.com>, xen-devel@lists.xenproject.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <famz@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +VyTyD6ZfHtK

On Tue, Mar 20, 2018 at 05:34:01PM +0000, Daniel P. Berrang=C3=A9 wrote:
> On Tue, Mar 20, 2018 at 07:10:42PM +0200, Michael S. Tsirkin wrote:
> > On Tue, Mar 20, 2018 at 05:33:42PM +0100, Stefan Weil wrote:
> > > Using <> for system include files and "" for local include files is=
 a
> > > convention, and as far as I know most projects adhere to that
> > > convention. So does QEMU currently. Such conventions are not only
> > > important for humans, but also for tools. There are more tools than=
 the
> > > C preprocessor which handle <> and "" differently. For example the =
GNU
> > > compiler uses -MD or -MMD to automatically generate dependency rule=
s for
> > > make. While -MD generates dependencies to all include files, -MMD d=
oes
> > > so only for user include files, but not for system include files. "=
user"
> > > and "system" means the different forms how include statements are
> > > written. QEMU still seems to use -MMD:
> > >=20
> > > rules.mak:QEMU_DGFLAGS +=3D -MMD -MP -MT $@ -MF $(@D)/$(*F).d
> >=20
> > To my knowledge, and according to my limited testing,
> > system headers in this context means
> > the default ones not supplied with -I.
>=20
> GCC's definition of system header is here:
>=20
>   https://gcc.gnu.org/onlinedocs/cpp/System-Headers.html
>=20
>=20
> Regards,
> Daniel

Proves my point, does it not?  You will note that it does not refer to
include <> anywhere.

    2.8 System Headers
    The header files declaring interfaces to the operating system and run=
time libraries often cannot be written in strictly conforming C. Therefor=
e, GCC gives code found in system headers special treatment. All warnings=
, other than those generated by =E2=80=98#warning=E2=80=99 (see Diagnosti=
cs), are suppressed while GCC is processing a system header. Macros defin=
ed in a system header are immune to a few warnings wherever they are expa=
nded. This immunity is granted on an ad-hoc basis, when we find that a wa=
rning generates lots of false positives because of code in macros defined=
 in system headers.

    Normally, only the headers found in specific directories are consider=
ed system headers. These directories are determined when GCC is compiled.=
 There are, however, two ways to make normal headers into system headers:

    Header files found in directories added to the search path with the -=
isystem and -idirafter command-line options are treated as system headers=
 for the purposes of diagnostics.
    There is also a directive, #pragma GCC system_header, which tells GCC=
 to consider the rest of the current include file a system header, no mat=
ter where it was found. Code that comes before the =E2=80=98#pragma=E2=80=
=99 in the file is not affected. #pragma GCC system_header has no effect =
in the primary source file.


Conclusion: #include <> is ignored for purposes of determining whether a =
header is
a system one or not.


> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
