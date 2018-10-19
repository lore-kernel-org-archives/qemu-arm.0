Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4293255wrt;
        Fri, 19 Oct 2018 12:54:15 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60VWtedcyPdOxeh1FD0Dm6iBnlHCQ1tqull16H17k1/t7Wh2K3QUb+ggjpS93b9sf4gqWI9
X-Received: by 2002:a37:c24b:: with SMTP id j11-v6mr33544254qkm.270.1539978855595;
        Fri, 19 Oct 2018 12:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539978855; cv=none;
        d=google.com; s=arc-20160816;
        b=tOtCN+wG5bF4Hv0ztm9+uwrSIhOgW+1uRNfzS1RWVdwWndcz2URhQMZq1sKwYZCVj4
         AtKSCtQJ8Pn/loV6BehwbWA4ftZ33lFcxnXYTOV2ebqQ8EIiTFB48aLOKqBhKmbMw5G/
         0I808tk0PzHNUESn9C5jZFErsefJuhvtHq/tIl8iG9Ze3kfsIdrs6QS7ldUuAEmRLz+w
         wndJAtK7sEiMoNU5UfP9pkST3I2PulA4Nf2Kakt0SkmOoDY27JRZtF1t9yUm1h8+5jII
         8AwBMo8X1VFzUhLkQNDX71Qm11MsKw2TfDURpwxkEO5ZzPEaei5mOG+EErntlWqK49aR
         XJUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=7Wp879D019R4k49FsEaGCzaPlLipDIv55Gq/XS/IY1U=;
        b=w/bDp1nWAUKh2WlgoKlXB/q5DBhAF5JL8AzPmusi1/bqp+ANPjdd8nlfnON1e7HT8t
         t6XAV3K0mT/q/svZlPQ5Mb9pWNHx8TVpEgmNLs4SJmLtz0/dtzXIIjke3M//ByqOUiRZ
         W6UfSMjBn7z4z4KYO9KHWShB3TCnJ0WpQ1XEyYeINvggfoZYHoc9fLnZaROJfbcHu/WW
         NouuZtCw/XmW8sBuTBWexu6we6upnBG7+AXWHyesKrOUGikWrAcqIRBMWIjVE0omBSiA
         fdUiklQhsRAoyPKhGAr6BxdCm8cG8lIRXgEF0OcXELBpCALvPx4qyS8jiz8eJsTyhmRr
         dDMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k193-v6si1653856qke.234.2018.10.19.12.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 12:54:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDaqd-0005Li-3z
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 15:54:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gDaqW-0005LR-NJ
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 15:54:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gDaqR-0007qY-Ke
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 15:54:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50324)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gDaqQ-0007nv-OD; Fri, 19 Oct 2018 15:54:02 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8E24C0587CA;
	Fri, 19 Oct 2018 19:54:00 +0000 (UTC)
Received: from igors-macbook-pro.local (unknown [10.36.112.11])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 516291001914;
	Fri, 19 Oct 2018 19:53:49 +0000 (UTC)
Date: Fri, 19 Oct 2018 21:53:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181019215345.521d58d7@igors-macbook-pro.local>
In-Reply-To: <20181019184408.GG31060@habkost.net>
References: <20181018200422.4358-1-ehabkost@redhat.com>
	<CAFEAcA9p0dLoNQy7kBdcXMz0HiMGEZTBX67Lq2SizTY3kgeksw@mail.gmail.com>
	<20181019184408.GG31060@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 19 Oct 2018 19:54:01 +0000 (UTC)
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
X-TUID: rEgdk4h7TZ2a

On Fri, 19 Oct 2018 15:44:08 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Fri, Oct 19, 2018 at 03:12:31PM +0100, Peter Maydell wrote:
> > On 18 October 2018 at 21:03, Eduardo Habkost <ehabkost@redhat.com> wrot=
e:
> > > The following changes since commit 09558375a634e17cea6cfbfec883ac2376=
d2dc7f:
> > >
> > >   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm=
-20181016-1' into staging (2018-10-16 17:42:56 +0100)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://github.com/ehabkost/qemu.git tags/machine-next-pull-request
> > >
> > > for you to fetch changes up to 6d8e1bcc7dd5e819ce81e6a87fffe23e39c700=
cc:
> > >
> > >   numa: Clean up error reporting in parse_numa() (2018-10-17 16:33:40=
 -0300)
> > >
> > > ----------------------------------------------------------------
> > > Machine queue, 2018-10-18
> > >
> > > * sysbus init/realize cleanups
> > >   (C=C3=A9dric Le Goater, Philippe Mathieu-Daud=C3=A9)
> > > * memory-device refactoring (David Hildenbrand)
> > > * -smp: deprecate incorrect CPUs topology (Igor Mammedov)
> > > * -numa parsing cleanups (Markus Armbruster)
> > > * Fix hostmem-file memory leak (Zhang Yi)
> > > * Typo fix (Li Qiang)
> > >
> > > ----------------------------------------------------------------
> > >
> >=20
> > Hi. This had some problems in merge testing, I'm afraid:
> >=20
> > On aarch64 host, warnings running tests/cpu-plug-test for i386 and s390=
 targets:
> >=20
> > TEST: tests/cpu-plug-test... (pid=3D12602)
> >   /i386/cpu-plug/pc-i440fx-3.0/cpu-add/1x3x2&maxcpus=3D12:
> > qemu-system-i386: warning: Invalid CPU topology deprecated: sockets
> > (1) * cores (3) * threads (2) !=3D maxcpus (12)
> [...]
> >=20
> > (plus similar ppc64, x86_64 targets)
>=20
> Ouch.  Apologies.
>=20
> Can we please do something make sure "make check" will fail on
> these cases?  I'd like to be able to trust CI systems like
> travis-ci.
>=20

we probably don't want make check fail on warning.
Test was written with assumption that s/c/t tuples matches initially presen=
t CPUs, hence a warning.
Would something like following fix the issue (local x86 build/test looks fi=
xed with it)?

diff --git a/tests/cpu-plug-test.c b/tests/cpu-plug-test.c
index 3e93c8e..f4a677d 100644
--- a/tests/cpu-plug-test.c
+++ b/tests/cpu-plug-test.c
@@ -32,12 +32,12 @@ static void test_plug_with_cpu_add(gconstpointer data)
     unsigned int i;
=20
     args =3D g_strdup_printf("-machine %s -cpu %s "
-                           "-smp sockets=3D%u,cores=3D%u,threads=3D%u,maxc=
pus=3D%u",
+                           "-smp 1,sockets=3D%u,cores=3D%u,threads=3D%u,ma=
xcpus=3D%u",
                            s->machine, s->cpu_model,
                            s->sockets, s->cores, s->threads, s->maxcpus);
     qtest_start(args);
=20
-    for (i =3D s->sockets * s->cores * s->threads; i < s->maxcpus; i++) {
+    for (i =3D 1; i < s->maxcpus; i++) {
         response =3D qmp("{ 'execute': 'cpu-add',"
                        "  'arguments': { 'id': %d } }", i);
         g_assert(response);
@@ -56,7 +56,7 @@ static void test_plug_without_cpu_add(gconstpointer data)
     QDict *response;
=20
     args =3D g_strdup_printf("-machine %s -cpu %s "
-                           "-smp sockets=3D%u,cores=3D%u,threads=3D%u,maxc=
pus=3D%u",
+                           "-smp 1,sockets=3D%u,cores=3D%u,threads=3D%u,ma=
xcpus=3D%u",
                            s->machine, s->cpu_model,
                            s->sockets, s->cores, s->threads, s->maxcpus);
     qtest_start(args);
@@ -79,12 +79,12 @@ static void test_plug_with_device_add_x86(gconstpointer=
 data)
     unsigned int s, c, t;
=20
     args =3D g_strdup_printf("-machine %s -cpu %s "
-                           "-smp sockets=3D%u,cores=3D%u,threads=3D%u,maxc=
pus=3D%u",
+                           "-smp 1,sockets=3D%u,cores=3D%u,threads=3D%u,ma=
xcpus=3D%u",
                            td->machine, td->cpu_model,
                            td->sockets, td->cores, td->threads, td->maxcpu=
s);
     qtest_start(args);
=20
-    for (s =3D td->sockets; s < td->maxcpus / td->cores / td->threads; s++=
) {
+    for (s =3D 1; s < td->sockets; s++) {
         for (c =3D 0; c < td->cores; c++) {
             for (t =3D 0; t < td->threads; t++) {
                 char *id =3D g_strdup_printf("id-%i-%i-%i", s, c, t);
@@ -113,7 +113,7 @@ static void test_plug_with_device_add_coreid(gconstpoin=
ter data)
                            td->sockets, td->cores, td->threads, td->maxcpu=
s);
     qtest_start(args);
=20
-    for (c =3D td->cores; c < td->maxcpus / td->sockets / td->threads; c++=
) {
+    for (c =3D 1; c < td->cores; c++) {
         char *id =3D g_strdup_printf("id-%i", c);
         qtest_qmp_device_add(td->device_model, id, "{'core-id':%u}", c);
         g_free(id);
@@ -148,7 +148,7 @@ static void add_pc_test_case(const char *mname)
     data->sockets =3D 1;
     data->cores =3D 3;
     data->threads =3D 2;
-    data->maxcpus =3D data->sockets * data->cores * data->threads * 2;
+    data->maxcpus =3D data->sockets * data->cores * data->threads;
     if (g_str_has_suffix(mname, "-1.4") ||
         (strcmp(mname, "pc-1.3") =3D=3D 0) ||
         (strcmp(mname, "pc-1.2") =3D=3D 0) ||
@@ -203,7 +203,7 @@ static void add_pseries_test_case(const char *mname)
     data->sockets =3D 2;
     data->cores =3D 3;
     data->threads =3D 1;
-    data->maxcpus =3D data->sockets * data->cores * data->threads * 2;
+    data->maxcpus =3D data->sockets * data->cores * data->threads;
=20
     path =3D g_strdup_printf("cpu-plug/%s/device-add/%ux%ux%u&maxcpus=3D%u=
",
                            mname, data->sockets, data->cores,
@@ -229,7 +229,7 @@ static void add_s390x_test_case(const char *mname)
     data->sockets =3D 1;
     data->cores =3D 3;
     data->threads =3D 1;
-    data->maxcpus =3D data->sockets * data->cores * data->threads * 2;
+    data->maxcpus =3D data->sockets * data->cores * data->threads;
=20
     data2 =3D g_memdup(data, sizeof(PlugTestData));
     data2->machine =3D g_strdup(data->machine);


