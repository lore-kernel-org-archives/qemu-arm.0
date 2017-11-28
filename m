Received: by 10.223.159.82 with SMTP id f18csp3227856wrg;
        Tue, 28 Nov 2017 10:36:31 -0800 (PST)
X-Google-Smtp-Source: AGs4zMb+ffwLz5pGr0rLvSaEgHGtrpWmneHoYMLWM9sp62CJs4mKIFPOqhjOLz5oQC+YUTOTdRBg
X-Received: by 10.37.45.98 with SMTP id s34mr63900ybe.39.1511894191170;
        Tue, 28 Nov 2017 10:36:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511894191; cv=none;
        d=google.com; s=arc-20160816;
        b=e0Oi32p95qEO3xTe8/AGQZAOsSI24o3nmrqx8bB8RKp2yAas+Tay+QPqcVmDFQIfuM
         j7o1wv3Ik/u7JJxp1/P3N2Y8+rVcgGfoSzjIigUUt52XHVXOH9GW0ZAJAMjc2RHiAnTQ
         7hHD0J9/G6iU4EMdLNUFSRz1KV1eEsSWECrYR66uYY457MW60lEWf7+S3QgeSZkxR64H
         CdYjZxLksH6TGI+AtAUOJeaahQzvf4cWp/QhMrygubAvduxkbcs6/X4hWECCBe4H1JaN
         Q7LBcwsFpyw3NByhKXkny9LAHGHa4MnTHTXKWqh97zJWGjOB4h/wkGuxGfTakscX/YQe
         JLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=D6YR0+IwF9x6K5JCSl12xqP5CtjFyRvMzTq1bmlWr2k=;
        b=DFXAXywIJTiWADIP7SxB4+4w3Qox6jVKndc6OhjyyIcm18bv/6sWx0hvgKGEvL91d7
         qzaI5a7IEa9+h4fF4GJTtntjHkNNSjwmMdS0Ybsl6S5Ua3r30i0l7eSyPqXunxrLbN9a
         qctJfwI8W1AUs2EplSE0xjuxQneoZe8KzUsjHc61KM1VwRkFxyjDxgeuFsHbDb33E784
         MJMWnkiP5jRfSYQ3zfectrlzKwUnWCX8xZNF2UIidrQDFBHfd6BIkobNd8cWJbcd5FuL
         Md2+Qie1eiWVrQzYwx1CvjaipBL54wyZfdgVnIxMFgQtTZs1JvX6PG6Kxhn/mXgELQJJ
         WU8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j83si6402076ywb.385.2017.11.28.10.36.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Nov 2017 10:36:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39544 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eJkkA-00009c-IY
	for alex.bennee@linaro.org; Tue, 28 Nov 2017 13:36:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eJki5-0007Rd-Rp
	for qemu-devel@nongnu.org; Tue, 28 Nov 2017 13:34:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1eJki4-0002f0-QB
	for qemu-devel@nongnu.org; Tue, 28 Nov 2017 13:34:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44474)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1eJkhz-0002bt-Me; Tue, 28 Nov 2017 13:34:15 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54D67356E1;
	Tue, 28 Nov 2017 18:34:14 +0000 (UTC)
Received: from localhost (ovpn-116-44.gru2.redhat.com [10.97.116.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 024A760175;
	Tue, 28 Nov 2017 18:34:09 +0000 (UTC)
Date: Tue, 28 Nov 2017 16:34:08 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Message-ID: <20171128183408.GP3037@localhost.localdomain>
References: <20171125151610.20547-1-ehabkost@redhat.com>
	<20171125151610.20547-2-ehabkost@redhat.com>
	<CAJ+F1CJRkXNnU+NK93vvSg806=vUBwxx9KGLGoJ_XBQFi+-Nfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAJ+F1CJRkXNnU+NK93vvSg806=vUBwxx9KGLGoJ_XBQFi+-Nfw@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 28 Nov 2017 18:34:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 1/6] machine: Replace has_dynamic_sysbus
 with list of allowed devices
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
Cc: jgross@suse.com, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org, Laszlo Ersek <lersek@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P20IPP0mtYHp

On Tue, Nov 28, 2017 at 05:55:15PM +0100, Marc-Andr=E9 Lureau wrote:
[...]
> Hi
>=20
> On Sat, Nov 25, 2017 at 4:16 PM, Eduardo Habkost <ehabkost@redhat.com> =
wrote:
> > The existing has_dynamic_sysbus flag makes the machine accept
> > every user-creatable sysbus device type on the command-line.
> > Replace it with a list of allowed device types, so machines can
> > easily accept some sysbus devices while rejecting others.
> >
> > To keep exactly the same behavior as before, the existing
> > has_dynamic_sysbus=3Dtrue assignments are replaced with a
> > TYPE_SYS_BUS_DEVICE entry on the allowed list.  Other patches
> > will replace the TYPE_SYS_BUS_DEVICE entries with more specific
> > lists of devices.
> >
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Marcel Apfelbaum <marcel@redhat.com>
> > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > Cc: Alexander Graf <agraf@suse.de>
> > Cc: David Gibson <david@gibson.dropbear.id.au>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Anthony Perard <anthony.perard@citrix.com>
> > Cc: qemu-arm@nongnu.org
> > Cc: qemu-ppc@nongnu.org
> > Cc: xen-devel@lists.xenproject.org
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>=20
> Reviewed-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>

Thanks!

[...]
> > -    mc->has_dynamic_sysbus =3D true;
> > +    /*TODO: allow only sysbus devices that really work with this mac=
hine */
>=20
> cosmetic: why do you not leave a space between * and TODO ? (you did
> that repeatedly)

Good question.  :)

For reasons I can't explain, I thought "/*TODO:" was more common
than "/* TODO:", but I was mistaken.  I will change this to
"/* TODO:" when committing the patches.

--=20
Eduardo
