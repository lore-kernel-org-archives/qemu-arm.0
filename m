Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4324949wrt;
        Fri, 19 Oct 2018 13:23:50 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61d+b8QdoZqTyY3nDboyj/M1VmcoN+XBv7rLH0av25dLmN98n6ZcPhYqlmjWLKcTVt8vnkl
X-Received: by 2002:a37:a804:: with SMTP id r4-v6mr32642419qke.143.1539980630577;
        Fri, 19 Oct 2018 13:23:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539980630; cv=none;
        d=google.com; s=arc-20160816;
        b=adVTW7lGBJ+8aQ+defLiVTJGvB7aX+3ijwpo0LoN46NIS6gcCFQWvgQDJFdFxrPm0h
         MCJTJ+GqsTR9CrSXaV/e5Aa8LyL9+4CFu9BGnhR0lzo40XSfFfALU8NsfEGdFSQHWF7x
         uGtttiu2sAMEOukEZf6GThh5O6UrEPaU+wTzdpcFVJYLxtM0RZPCALSCAVAnZKzYDkcu
         9jnjrR7qa025U/MNnypd6GswaFvcAupoE1NbNBUlEfs4rOWItRzCrHmiJ8VXcMNGDw3P
         snYGpetuDccP7rl0Ja+oV1GmlzNKagzrY9ul+N0wOcwcsNV8IolGVoKBA2/76nBCrEcU
         olew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=5PXwuw09H+gXPnxyyFDfFCEdyT4AtWH7cbjyAIOWtnE=;
        b=LM9dZVtix+nli+mndlzk3p2dUsa/KnA4D3G7SmY1TxrjRMIfm5q6PGv1Q6taeHd1IP
         4VT+ZVSvD3DTUl4kd7vw3b1s81MSg/EIwCXE9iLF9QIQx5asKyzY0p4g2rbG/fw9mSSZ
         6vqynNW7ChYX07JDUkjI+92luIx092gQktJkwz9qqRt38/NfNWVu83f8hPxZ+LF5nIpo
         u0FknlEGV+/NfNVcsoYIy4ScBFWqAyiSFXXnE61y+2HQn1FjltPV98S5vmud1LOoWS1C
         /EVDegEijD3EMXJsTonKCpwCWoSnsBUl5JT+1sRbK2uZagngz55xNtG11TOa7fDNsMBg
         mTRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p33-v6si9093067qtd.311.2018.10.19.13.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 13:23:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52560 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDbJG-0000Hr-1t
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 16:23:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDbJ0-0000Hl-Ed
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 16:23:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDbIx-0003J4-4s
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 16:23:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49538)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDbIw-0003IS-S9; Fri, 19 Oct 2018 16:23:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F164930C8AD6;
	Fri, 19 Oct 2018 20:23:28 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABB676888E;
	Fri, 19 Oct 2018 20:23:22 +0000 (UTC)
Date: Fri, 19 Oct 2018 17:23:21 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181019202321.GM31060@habkost.net>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<CAFEAcA9p0dLoNQy7kBdcXMz0HiMGEZTBX67Lq2SizTY3kgeksw@mail.gmail.com>
	<20181019184408.GG31060@habkost.net>
	<20181019215345.521d58d7@igors-macbook-pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181019215345.521d58d7@igors-macbook-pro.local>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 19 Oct 2018 20:23:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL 00/45] Machine queue, 2018-10-18
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
	"Michael S. Tsirkin" <mst@redhat.com>, Libvirt <libvir-list@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GrsWDz27xovl

On Fri, Oct 19, 2018 at 09:53:45PM +0200, Igor Mammedov wrote:
> On Fri, 19 Oct 2018 15:44:08 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
>=20
> > On Fri, Oct 19, 2018 at 03:12:31PM +0100, Peter Maydell wrote:
> > > On 18 October 2018 at 21:03, Eduardo Habkost <ehabkost@redhat.com> =
wrote:
> > > > The following changes since commit 09558375a634e17cea6cfbfec883ac=
2376d2dc7f:
> > > >
> > > >   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target=
-arm-20181016-1' into staging (2018-10-16 17:42:56 +0100)
> > > >
> > > > are available in the Git repository at:
> > > >
> > > >   git://github.com/ehabkost/qemu.git tags/machine-next-pull-reque=
st
> > > >
> > > > for you to fetch changes up to 6d8e1bcc7dd5e819ce81e6a87fffe23e39=
c700cc:
> > > >
> > > >   numa: Clean up error reporting in parse_numa() (2018-10-17 16:3=
3:40 -0300)
> > > >
> > > > ----------------------------------------------------------------
> > > > Machine queue, 2018-10-18
> > > >
> > > > * sysbus init/realize cleanups
> > > >   (C=E9dric Le Goater, Philippe Mathieu-Daud=E9)
> > > > * memory-device refactoring (David Hildenbrand)
> > > > * -smp: deprecate incorrect CPUs topology (Igor Mammedov)
> > > > * -numa parsing cleanups (Markus Armbruster)
> > > > * Fix hostmem-file memory leak (Zhang Yi)
> > > > * Typo fix (Li Qiang)
> > > >
> > > > ----------------------------------------------------------------
> > > >
> > >=20
> > > Hi. This had some problems in merge testing, I'm afraid:
> > >=20
> > > On aarch64 host, warnings running tests/cpu-plug-test for i386 and =
s390 targets:
> > >=20
> > > TEST: tests/cpu-plug-test... (pid=3D12602)
> > >   /i386/cpu-plug/pc-i440fx-3.0/cpu-add/1x3x2&maxcpus=3D12:
> > > qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
> > > (1) * cores (3) * threads (2) !=3D maxcpus (12)
> > [...]
> > >=20
> > > (plus similar ppc64, x86_64 targets)
> >=20
> > Ouch.  Apologies.
> >=20
> > Can we please do something make sure "make check" will fail on
> > these cases?  I'd like to be able to trust CI systems like
> > travis-ci.
> >=20
>=20
> we probably don't want make check fail on warning.

I disagree.  If a warning is blocking a pull request from being
merged, it must make CI systems fail too.  Otherwise we're
defeating the purpose of CI systems.


> Test was written with assumption that s/c/t tuples matches initially pr=
esent CPUs, hence a warning.
> Would something like following fix the issue (local x86 build/test look=
s fixed with it)?

It works for me.  I will queue it on machine-next, thanks!

>=20
> diff --git a/tests/cpu-plug-test.c b/tests/cpu-plug-test.c
> index 3e93c8e..f4a677d 100644
> --- a/tests/cpu-plug-test.c
> +++ b/tests/cpu-plug-test.c
> @@ -32,12 +32,12 @@ static void test_plug_with_cpu_add(gconstpointer da=
ta)
>      unsigned int i;
> =20
>      args =3D g_strdup_printf("-machine %s -cpu %s "
> -                           "-smp sockets=3D%u,cores=3D%u,threads=3D%u,=
maxcpus=3D%u",
> +                           "-smp 1,sockets=3D%u,cores=3D%u,threads=3D%=
u,maxcpus=3D%u",
>                             s->machine, s->cpu_model,
>                             s->sockets, s->cores, s->threads, s->maxcpu=
s);
>      qtest_start(args);
> =20
> -    for (i =3D s->sockets * s->cores * s->threads; i < s->maxcpus; i++=
) {
> +    for (i =3D 1; i < s->maxcpus; i++) {
>          response =3D qmp("{ 'execute': 'cpu-add',"
>                         "  'arguments': { 'id': %d } }", i);
>          g_assert(response);
> @@ -56,7 +56,7 @@ static void test_plug_without_cpu_add(gconstpointer d=
ata)
>      QDict *response;
> =20
>      args =3D g_strdup_printf("-machine %s -cpu %s "
> -                           "-smp sockets=3D%u,cores=3D%u,threads=3D%u,=
maxcpus=3D%u",
> +                           "-smp 1,sockets=3D%u,cores=3D%u,threads=3D%=
u,maxcpus=3D%u",
>                             s->machine, s->cpu_model,
>                             s->sockets, s->cores, s->threads, s->maxcpu=
s);
>      qtest_start(args);
> @@ -79,12 +79,12 @@ static void test_plug_with_device_add_x86(gconstpoi=
nter data)
>      unsigned int s, c, t;
> =20
>      args =3D g_strdup_printf("-machine %s -cpu %s "
> -                           "-smp sockets=3D%u,cores=3D%u,threads=3D%u,=
maxcpus=3D%u",
> +                           "-smp 1,sockets=3D%u,cores=3D%u,threads=3D%=
u,maxcpus=3D%u",
>                             td->machine, td->cpu_model,
>                             td->sockets, td->cores, td->threads, td->ma=
xcpus);
>      qtest_start(args);
> =20
> -    for (s =3D td->sockets; s < td->maxcpus / td->cores / td->threads;=
 s++) {
> +    for (s =3D 1; s < td->sockets; s++) {
>          for (c =3D 0; c < td->cores; c++) {
>              for (t =3D 0; t < td->threads; t++) {
>                  char *id =3D g_strdup_printf("id-%i-%i-%i", s, c, t);
> @@ -113,7 +113,7 @@ static void test_plug_with_device_add_coreid(gconst=
pointer data)
>                             td->sockets, td->cores, td->threads, td->ma=
xcpus);
>      qtest_start(args);
> =20
> -    for (c =3D td->cores; c < td->maxcpus / td->sockets / td->threads;=
 c++) {
> +    for (c =3D 1; c < td->cores; c++) {
>          char *id =3D g_strdup_printf("id-%i", c);
>          qtest_qmp_device_add(td->device_model, id, "{'core-id':%u}", c=
);
>          g_free(id);
> @@ -148,7 +148,7 @@ static void add_pc_test_case(const char *mname)
>      data->sockets =3D 1;
>      data->cores =3D 3;
>      data->threads =3D 2;
> -    data->maxcpus =3D data->sockets * data->cores * data->threads * 2;
> +    data->maxcpus =3D data->sockets * data->cores * data->threads;
>      if (g_str_has_suffix(mname, "-1.4") ||
>          (strcmp(mname, "pc-1.3") =3D=3D 0) ||
>          (strcmp(mname, "pc-1.2") =3D=3D 0) ||
> @@ -203,7 +203,7 @@ static void add_pseries_test_case(const char *mname=
)
>      data->sockets =3D 2;
>      data->cores =3D 3;
>      data->threads =3D 1;
> -    data->maxcpus =3D data->sockets * data->cores * data->threads * 2;
> +    data->maxcpus =3D data->sockets * data->cores * data->threads;
> =20
>      path =3D g_strdup_printf("cpu-plug/%s/device-add/%ux%ux%u&maxcpus=3D=
%u",
>                             mname, data->sockets, data->cores,
> @@ -229,7 +229,7 @@ static void add_s390x_test_case(const char *mname)
>      data->sockets =3D 1;
>      data->cores =3D 3;
>      data->threads =3D 1;
> -    data->maxcpus =3D data->sockets * data->cores * data->threads * 2;
> +    data->maxcpus =3D data->sockets * data->cores * data->threads;
> =20
>      data2 =3D g_memdup(data, sizeof(PlugTestData));
>      data2->machine =3D g_strdup(data->machine);
>=20
>=20

--=20
Eduardo
