Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2486158wrw;
        Wed, 7 Nov 2018 11:02:02 -0800 (PST)
X-Google-Smtp-Source: AJdET5dzROQR4GLh4e+t1P4CQIQwj9jalDo1EsjKVQg1Tftg6CGpNB2cbLPl9mUhP/Z4rtPcjC/0
X-Received: by 2002:ac8:101a:: with SMTP id z26-v6mr1479903qti.308.1541617322812;
        Wed, 07 Nov 2018 11:02:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541617322; cv=none;
        d=google.com; s=arc-20160816;
        b=oADUXhrvJldw+foASguZiS6MGDXS202BvFsZwisfHLCrR3s9LaBAAhxu2QyG9+Dfzb
         r9Ctfm89mIY0kjOMnu6xbUnDQMRSvyGxpvnwAogBZnZKYqVMZvryocWV8JBwe8WXwCbk
         F87A8/3JvgkRPs1BttZ24DYzUc3oMrVlhlMZ6i8zRjVuZN34mous1G/LcVf8NDyxgIeg
         Lp0B/LaB98UDx7eLPh4+OyZv5mhtjiHbVqh+SFL3u5+TMtEtugBEilmf5gStWIJO4eI1
         IZN1CJaxrAQFxfft4bC5weQWbtUho9vdrmG9wo/YbqZnJrt+c7WWmdFJU0DudpEeyGHr
         dCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=1mjLdyMtaeS79KnjSkBCw5bYW0S6WRZJsUACbsq2iZE=;
        b=OzzAU80qDdTci8uxdL9+u5oJ7Fn/JiD4Z2UGE3inzcB/vj3rlvz89UgzskpXAmUIKu
         Mg2rm6rFS1QaoMwahvfPRH+lRiO5a7s5ib30Pe578jm/nA7tgSfoP6FupwA21u1+b0K7
         DIsRyREm1edOwH7xEQhoTpV1MclimY59rvVDNPgidjvY7Bvf3iRqIaJIyeu5jJNMNzWD
         MmVKmOUTh4zroYe8+mCsA+CmWMycbRhmh8EFhALwWtDhcxiTA1IVyTsj8pjP9q5po6TA
         FHUwTrvQE6GJh6heRtrZRzJ1jIPAPtZHWWrwoIgvFiTBNuCniflIS8ROEHd0eoWH+kQa
         DnOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f18si1146566qtg.117.2018.11.07.11.02.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 11:02:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50218 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKT5W-0008CI-Aw
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 14:02:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gKT5L-0008BN-07
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 14:01:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gKT5G-000290-5C
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 14:01:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46612)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gKT5D-0001rb-GD; Wed, 07 Nov 2018 14:01:44 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A89D87642;
	Wed,  7 Nov 2018 19:01:18 +0000 (UTC)
Received: from localhost (ovpn-116-36.gru2.redhat.com [10.97.116.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACAFC6015E;
	Wed,  7 Nov 2018 19:01:15 +0000 (UTC)
Date: Wed, 7 Nov 2018 17:01:14 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Message-ID: <20181107190114.GD12503@habkost.net>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-14-marcandre.lureau@redhat.com>
	<CAJ+F1CLWy0xbb-Pc7yUNpHh70GsSTKJ=v+TeoTGJOThYO_xE2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAJ+F1CLWy0xbb-Pc7yUNpHh70GsSTKJ=v+TeoTGJOThYO_xE2g@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 07 Nov 2018 19:01:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.2 v3 13/14] hw/i386: add
 pc-i440fx-3.2 & pc-q35-3.2
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Corey Minyard <minyard@acm.org>, amit@kernel.org,
	"open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>, hpoussin@reactos.org,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	atar4qemu@gmail.com, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wQ1JygxoHDUd

On Wed, Nov 07, 2018 at 07:49:54PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
>=20
> On Wed, Nov 7, 2018 at 4:49 PM Marc-Andr=E9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > The following patch is going to add compatiblity parameters for
> > qemu <=3D 3.1.
> >
>=20
> I realize this may be good enough for x86 i440/q35 machines, but what
> about other machines & architectures?
>=20
> What do we officially support, for migration, across different versions=
?
>=20
> It seems we have versionized:
> - arm "virt" machines
> - "s390-ccw-virtio" machines
> - ppc "pseries" machines
> - x86 piix/q35 machines
>=20
> At least, I think I should update this patch to add new 3.2 machines fo=
r those.

This QEMU release seems to be unusual: normally we add features
that require adding new machine-types long before soft freeze.
If we didn't add new machine-types until now, this means we
didn't introduce any guest ABI changes that require them.

Now, this is an interesting case: we probably don't _need_ the
new machine-types, but users might be confused if they don't see
new machine-types.  Should we add them anyway?


>=20
> Is there any way to check compat properties are handled properly for
> those various machines? It looks like it is generally lacking. For
> example, if there is a new HW_COMPAT, it would be nice if something
> failed if a corresponding machine hasn't been added.
>=20
> It also looks like there is a bit of code duplication and a bit too
> much macros :) unfortunately, I don't yet have a good idea how to
> improve things...

I dream with the day all this compatibility data will be treated
like what it is: just data.  The ugly macro trickery needs to go
away eventually, but this requires making the QOM/machine-type
APIs more practical.

Removing very old machine-types will probably make this task
easier, because they are the main source of compatibility code
that is not represented as <driver.property=3Dvalue> tuples (grep
for "static void pc_compat_" and you'll see them).

--=20
Eduardo
