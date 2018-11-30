Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3873218wrt;
        Fri, 30 Nov 2018 10:14:56 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XqdU6K75H1d22mFfVbpZh1ktOUAHk1yiqs/q/pPpk+Ew3DgPFrKVzdiLxrgwRBJmJ5GQa4
X-Received: by 2002:a25:accc:: with SMTP id x12-v6mr6387543ybd.221.1543601696227;
        Fri, 30 Nov 2018 10:14:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543601696; cv=none;
        d=google.com; s=arc-20160816;
        b=xj48/bs4Wp8JaupnJT/xmlX5lEWJ1G/XJ+0KEXm26PDsKB3K58+XsNb6aSsvrcJzHz
         tEAyAE8CB01+pW+WN3X+UB5x0z8lPGrjXF3104eCPo48QaHHHP359az5CrhAU/V2gGp5
         4iAlgogjoAY7YHdL+rAbdabbIcB+uLHid0nHTa+JbmFwK2tfaX9GI8g1Psgps1bLLTh1
         HnDBi+wqjaKGRKvGbixjJGIxTn0k7NJqEY5l3VWDEtefTZ1NJ3+okJKNluCik+0u4M6g
         PI8AQxZQFQ4tTRELdwYEB9OtAT2YAIu+pEe9uVirM8UGo6/887PPvDeO3PHH7jul7Xxb
         o+tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=yHAZhIyZ4OOSRYldWNXjMCs93NizxcbUhlBQcz2/Zwc=;
        b=c5uU08K2pnh4ZfLQg/Sc+Jjhf/2DsIjaI7sRrX2ipx/rLkFjPTQYt9lr0YHoq1ClVD
         v05AJCGusFzcajMYyWLsWHC4MeF7PtUuMrLvCHWHLloxUhssgReFqSNiQwx5KcdyLFlq
         npITpJRVwhA9zfsctAd9PpagwD0Yjdp7wlGe5h0JG+l348mQQghV9/OHokD5Cr+AJIzN
         PYdi3kNRqlLZHPuJu473tvjGWvrwtxzPw0GdcqfGu7wR2twy4sCJ9aufnba3o9fgZsoU
         qSunwESuEDZVTEMqviBLv+GSvUzhPN7RXs8TMJnbsVoI6AOXmSp0sA9Je+WK8wvRUWTk
         e+Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v76si3567260ywa.38.2018.11.30.10.14.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 10:14:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34129 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSnJX-0004TQ-N3
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 13:14:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gSnJ8-0004S8-TF
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 13:14:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gSnJ8-0003Ax-3L
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 13:14:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51632)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gSnJ1-00037K-L0; Fri, 30 Nov 2018 13:14:23 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 410D031256D0;
	Fri, 30 Nov 2018 18:14:21 +0000 (UTC)
Received: from localhost (ovpn-116-21.gru2.redhat.com [10.97.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64B4E5D9C9;
	Fri, 30 Nov 2018 18:14:17 +0000 (UTC)
Date: Fri, 30 Nov 2018 16:14:15 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181130181415.GN18284@habkost.net>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
	<65d3a572-9a80-f332-1f88-69e43e8a3663@redhat.com>
	<20181126132731.GJ18284@habkost.net>
	<CAFEAcA8D7ZjO059Sgrx-4i0iT+V3gxT4f=DvdmUAJS7KomtyOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAFEAcA8D7ZjO059Sgrx-4i0iT+V3gxT4f=DvdmUAJS7KomtyOg@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 30 Nov 2018 18:14:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU clusters
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
Cc: Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZcvrJCICHucB

On Fri, Nov 30, 2018 at 04:52:31PM +0000, Peter Maydell wrote:
> On Mon, 26 Nov 2018 at 13:27, Eduardo Habkost <ehabkost@redhat.com> wro=
te:
> >
> > On Sun, Nov 25, 2018 at 10:27:04PM +0100, Philippe Mathieu-Daud=E9 wr=
ote:
> > > Hi Eduardo,
> > >
> > > On 23/11/18 19:10, Eduardo Habkost wrote:
> > > > If you really want to do this and assign cluster_id
> > > > automatically, please do it on realize, where it won't have
> > > > unexpected side-effects after a simple `qom-list-properties` QMP
> > > > command.
> > >
> > > This looks clean enough to me.
> > > Do you prefer we don't use static auto_increment at all?
> >
> > I would prefer to avoid the static variable if possible, but I
> > won't reject it if the alternatives make the API too complex to
> > use.
>=20
> I guess the alternative would be to require the cluster ID
> to be a QOM property on the cluster object. Usage would then
> be something like
>     object_initialize_child(OBJECT(s), "rpu-cluster", &s->rpu_cluster,
>                             sizeof(s->rpu_cluster), TYPE_CPU_CLUSTER,
>                             &error_abort, NULL);
>     object_property_set_int(OBJECT(s), 1, "cluster-id", &error_abort);
>     qdev_init_nofail(DEVICE(&s->rpu_cluster));
>=20
> (ie one extra line setting the cluster ID explicitly).
>=20
> SoC objects can probably reasonably assume that they are
> the only SoC in the system, ie that they can just assign
> cluster IDs themselves). If that turns out not to be true
> we can make the SoC take a property to specify a cluster ID
> base or something.
>=20
> I guess if we've been bitten by cpu-ID auto-assignment
> in the past, starting out with "user picks the cluster ID"
> would be safer, and it's not too much pain at the callsite.
> Plus it avoids the gdbstub changing its mind about which
> order the cluster "processes" appear in if we refactor the
> board code.

Agreed.

>=20
> > In either case, I'd like to ensure the caveats of the cluster_id
> > field are clearly documented: no guarantees about ordering or
> > predictability, making it not appropriate for external
> > interfaces.
>=20
> The gdb stub is sort of an external interface, of course...

Right, and it works if you treat it as just an opaque identifier.
It won't work only if you need it to be stable and/or
predictable.

Letting the board set "cluster-id" seems to be safer, and not too
complex.

>=20
> Luc: what are the requirements on boards using CPU cluster
> objects? I assume these are both OK:
>  * does not use cluster objects at all
>    (the gdbstub puts all the CPUs in one process?)
>  * all CPUs created are in some CPU cluster
>    (the gdbstub uses one process per CPU cluster)
> but what about
>  * some CPUs are created in a CPU cluster, but some
>    are "loose", not in any cluster at all
> ?
> Is that just invalid, or do the "loose" CPUs end up in
> a default cluster (gdbstub process), or do they get
> one cluster each?
>=20
> If it's invalid (which doesn't seem like a bad idea),
> is there an assert somewhere so that getting it wrong
> results in the board failing to start (ie a "make check"
> failure) ?

I'm having the impression that "cluster" has a very clear meaning
and purpose in this discussion, but this is not being documented
anywhere.  Can we clarify at cpu/cluster.c what exactly a cluster
is, and when it's appropriate (or necessary) to group the CPUs
into clusters?

Is it really possible describe the meaning of "cluster" in a way
that doesn't refer to GDB at all?  Is this all about memory
address spaces?  If this is all about memory address spaces,
can't the GDB code detect that automatically by looking at the
address space objects?

--=20
Eduardo
