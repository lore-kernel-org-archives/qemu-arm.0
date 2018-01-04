Received: by 10.223.134.117 with SMTP id 50csp12832659wrw;
        Thu, 4 Jan 2018 08:45:32 -0800 (PST)
X-Google-Smtp-Source: ACJfBoutAnoIWyTYrgk2ClpqAs3qVUlCSfOJ1IyQ2+xVjgJHFew3WaIJQNeVuizo2iv5znBiHCjD
X-Received: by 10.129.75.196 with SMTP id y187mr119861ywa.511.1515084332438;
        Thu, 04 Jan 2018 08:45:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515084332; cv=none;
        d=google.com; s=arc-20160816;
        b=0DJisxtyHH/f8NBLNp2LNIus4UkUJn7HfT9b8iH+c5KYTMvelZ6zI0Av59OZQFxyRp
         GXmrfcM+li875UT2cdnHTHbJ8oAssxMuIPHV3o1PYE40tYDc8f+JXnFkwFtiuZsYu/Dd
         QcC5YaSL+wUatGdXQB23q5OD6pq3H7R/Q9jvZ7nJQcEBG+5Unw6Q94excayWZg78uZlN
         AolADrFBX9gpZcyvqmv88E2HzD5XwidIlTuNRm82ZAp+oRU/24DN6MTbRvVKtDxmVgiA
         L2AxrETmOjXzjl1beE4v0LiNVpzsbh9X74KdUgQk6MZ3++c83k21F+zioZRUfzrBTfQ2
         PFqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=CnJZyx+cWFznql/ZHpRpcY2gZWawYeqgE2OeRLih/3A=;
        b=kI8dwmwqFFmBpDy2nHv+Tu8NXqARxc70Se5/CK2iPTA7HHh/pJzuNnGhKKidh0k2fY
         zV98Mm/6HFwt31t9FyWi4GUdOjPgjRAu3cdk2qJ1C0MG9lP4VbLjffqwsgBEkKrwti8z
         PZe8RLb4ngVh1CJ/Vg8FhrrCXxS19xM2jE6od/hzGZa+EQloLO8hi/PfHYNBpAZ1q8OX
         tLxKO/vxEgEzca5S+Zqwa35jbKSPYdtT37ZOnwpt/GZoQmf2zba0EBqR/3N7BhxJ70Bu
         NZGD6xvu96E89UOGYf2RCe0jsRzz6viplgK+X0ZglutREvV/apmm8MraAevpH5zKj2a2
         4urw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q13si777958ywl.511.2018.01.04.08.45.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Jan 2018 08:45:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eX8e3-0001Qe-Pi
	for alex.bennee@linaro.org; Thu, 04 Jan 2018 11:45:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1eX8a0-0005wy-Mc
	for qemu-devel@nongnu.org; Thu, 04 Jan 2018 11:41:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1eX8Zz-0000NM-Qy
	for qemu-devel@nongnu.org; Thu, 04 Jan 2018 11:41:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47374)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1eX8Zw-0000Fs-64; Thu, 04 Jan 2018 11:41:16 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 356385B302;
	Thu,  4 Jan 2018 16:41:15 +0000 (UTC)
Received: from work-vm (ovpn-116-225.ams2.redhat.com [10.36.116.225])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A1586018A;
	Thu,  4 Jan 2018 16:41:06 +0000 (UTC)
Date: Thu, 4 Jan 2018 16:41:03 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180104164103.GA2635@work-vm>
References: <20180104144046.30793-1-f4bug@amsat.org>
	<20180104144046.30793-3-f4bug@amsat.org>
	<20180104162400.GB2618@work-vm>
	<44abdde4-4543-f5a4-aca3-d6549497bd7b@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <44abdde4-4543-f5a4-aca3-d6549497bd7b@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 04 Jan 2018 16:41:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH 2/6] hw/net/e1000: real device name is
 'e1000-82540em', 'e1000' is an alias
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Alexander Graf <agraf@suse.de>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Sascha Silbe <silbe@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OwuKqoF/OU9C

* Philippe Mathieu-Daud=E9 (f4bug@amsat.org) wrote:
> Hi David,
>=20
> On 01/04/2018 01:24 PM, Dr. David Alan Gilbert wrote:
> > * Philippe Mathieu-Daud=E9 (f4bug@amsat.org) wrote:
> >> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> >> ---
> >>  hw/net/e1000.c | 5 ++++-
> >>  1 file changed, 4 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> >> index 05a00cba31..2280f7fdf9 100644
> >> --- a/hw/net/e1000.c
> >> +++ b/hw/net/e1000.c
> >> @@ -1648,6 +1648,7 @@ typedef struct E1000Info {
> >>      uint16_t   device_id;
> >>      uint8_t    revision;
> >>      uint16_t   phy_id2;
> >> +    const char **aliases;
> >>  } E1000Info;
> >> =20
> >>  static void e1000_class_init(ObjectClass *klass, void *data)
> >> @@ -1695,10 +1696,11 @@ static const TypeInfo e1000_base_info =3D {
> >> =20
> >>  static const E1000Info e1000_devices[] =3D {
> >>      {
> >> -        .name      =3D "e1000",
> >> +        .name      =3D "e1000-82540em",
> >>          .device_id =3D E1000_DEV_ID_82540EM,
> >>          .revision  =3D 0x03,
> >>          .phy_id2   =3D E1000_PHY_ID2_8254xx_DEFAULT,
> >> +        .aliases   =3D (const char * []) {"e1000", NULL},
> >>      },
> >>      {
> >>          .name      =3D "e1000-82544gc",
> >> @@ -1725,6 +1727,7 @@ static void e1000_register_types(void)
> >> =20
> >>          type_info.name =3D info->name;
> >>          type_info.parent =3D TYPE_E1000_BASE;
> >> +        type_info.aliases =3D info->aliases;
> >>          type_info.class_data =3D (void *)info;
> >>          type_info.class_init =3D e1000_class_init;
> >>          type_info.instance_init =3D e1000_instance_init;
> >=20
> > Can you just check that this doesn't break migration compatibility
> > either way please;  I think there's some alias code somewhere but I
> > can't remember the details.
>=20
> Good point.
>=20
> Something related to qdev-monitor.c?

The thing I was worrying about was when names end up in the migration
stream;  that can be a bit subtle so the only way is to just check it
doesn't break.

> > One thing I do remember that broke when it previously changed was
> > entries in PC_COMPAT_* tables like the one in hw/i386/pc_piix.c's
> > PC_COMPAT_1_3 - so check with an 'info qtree' that the property is OK=
.
>=20
> Ok, I'll verify and think about a qtest for that.
>=20
> I took this device because I wanted to test another arch than ARM (whic=
h
> strongly use FDT).
> If there is an issue migrating this particular device we can drop this
> patch for this only device, and the series still stands for the ARM/FDT=
.

Yes, although my concern was more general, I just had a previous case
where I had to fix e1000 downstream because of renaming; but just keep
in mind other places where names turn up, like the compatibility lists.

Dave

> Regards,
>=20
> Phil.
>=20



--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
