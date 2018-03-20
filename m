Received: by 10.28.91.67 with SMTP id p64csp3868013wmb;
        Tue, 20 Mar 2018 06:59:41 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtNBqFjeCYLeZQRC9XWi4eumMDjRihlN+i2jvLehsYZ5L4MCYgNe4zHBtr5HdzbhKnuvyo7
X-Received: by 10.200.24.82 with SMTP id n18mr24710370qtk.241.1521554381829;
        Tue, 20 Mar 2018 06:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521554381; cv=none;
        d=google.com; s=arc-20160816;
        b=dk50yHkqqaHljxD1w0+P9C61sNt0RpQbP7r6S31WoN+Xg7OpJ3tKuZSnTApaAO3io8
         t8WfeJog11qXlxvFGIuDZo6v33JPxONji309P3dc1sJQuRfGCBizGK2+7QwFIcDXUcRR
         ZEPCP9j8hDryH9NO8uLQQLvUA242u4RwiY6+W4VBj/WTEF7+tCcouoo7s7aGn7osvZ59
         nouI9cUDEKhrp0FEdb8zM3VAlriuP+PoPWWRgq3Q8TFz1Vuknw4kBW0j1GqmFm1jDkFM
         lyxY0qpkDjSiH/24gqj9BAvYJwUC3YOW+tplza61PRalpNINGnZlXbo+FyNRmXPynwXa
         YsrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=KsRFD1WvEnpbYVSbxk1aeluy1nG8mFa643j6apdLOQk=;
        b=J7G2gm+NZUn2nqvNdga6QH13nZHQly0Xi2PfkS42gf0fzZhk8z3qbCvH2AQUZbFKwl
         0wwKJZOXKt7AnrtH3klXnX4+WMfV7jU+xgOyQcxiVGcr0NkVX+9cRp34WezpaTA2YXS3
         0b47NLK2so7p2+RNW+GaxrXQUljq6CHkaJ4U5eRSdiW1m0GAOkD1oO9w+y9W8ffoCQq2
         krbLQ1+R+zlDUcfNCKzgTEimAaKf/ab1hSQdnjHBrig6Im5krbDLyKunHxugpK+QZ3yr
         oPrBkqLUr4QIZPIad6833fLMbMB6QFVzBvg1ncXwhGYmw4dWXod0WM2lpgb536NDXcvx
         Em4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z17si2094768qth.191.2018.03.20.06.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHnh-0006lZ-BZ
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:59:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyHmx-0006F9-Nl
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:58:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1eyHmu-0007DO-H4
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:58:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59514 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1eyHmu-0007DC-Bi; Tue, 20 Mar 2018 09:58:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C58E4072CF7;
	Tue, 20 Mar 2018 13:58:51 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 372FB215CDB7;
	Tue, 20 Mar 2018 13:58:35 +0000 (UTC)
Date: Tue, 20 Mar 2018 13:58:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20180320135832.GT4530@redhat.com>
References: <1521510562-529051-1-git-send-email-mst@redhat.com>
	<8f06e1e3-4823-d8e8-43bd-c092c523849e@vivier.eu>
	<20180320094406.GD4530@redhat.com>
	<20180320141107-mutt-send-email-mst@kernel.org>
	<20180320121841.GN4530@redhat.com>
	<20180320142756-mutt-send-email-mst@kernel.org>
	<20180320123900.GO4530@redhat.com>
	<20180320133216.u4hdijttdnyjbfpu@sirius.home.kraxel.org>
	<20180320134117.GS4530@redhat.com>
	<20180320154703-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20180320154703-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 20 Mar 2018 13:58:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 20 Mar 2018 13:58:51 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
X-Mailman-Approved-At: Tue, 20 Mar 2018 09:59:16 -0400
Subject: Re: [Qemu-arm] [PATCH] qemu: include generated files with <> and
 not ""
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, sheepdog@lists.wpkg.org,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	David Hildenbrand <david@redhat.com>,
	Jeff Cody <jcody@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, "Richard W.M. Jones" <rjones@redhat.com>,
	Keith Busch <keith.busch@intel.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Ben Warren <ben@skyportsystems.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Markus Armbruster <armbru@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, kvm@vger.kernel.org,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Liu Yuan <namei.unix@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
	Fam Zheng <famz@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Stefan Weil <sw@weilnetz.de>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, Peter Lieven <pl@kamp.de>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, Greg Kurz <groug@kaod.org>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>,
	Yuval Shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org, BALATON Zoltan <balaton@eik.bme.hu>,
	John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	qemu-block@nongnu.org, Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Juan Quintela <quintela@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
	qemu-ppc@nongnu.org, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Igor Mammedov <imammedo@redhat.com>, Hannes Reinecke <hare@suse.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XZ3VhM9QYvxS

On Tue, Mar 20, 2018 at 03:50:02PM +0200, Michael S. Tsirkin wrote:
> On Tue, Mar 20, 2018 at 01:41:17PM +0000, Daniel P. Berrang=C3=A9 wrote=
:
> > On Tue, Mar 20, 2018 at 02:32:16PM +0100, Gerd Hoffmann wrote:
> > >   Hi,
> > >=20
> > > > > So for these, we should use "".  None of these are generated fi=
les though.
> > > >=20
> > > > That leads to crazy inconsistent message for developers where 50%=
 of QEMU
> > > > header files must use <> and the other 50% of header files must u=
se "".
> > >=20
> > > The rules are pretty simple though:
> > >=20
> > >    (1) Headers which are generated use <>.
> > >    (2) Headers which are in include/ use <>.
> > >    (3) Headers sitting in the same directory as the source files us=
e "".
> >=20
> > We have 1200 header files in QEMU - a developer might just reasonably=
 remember
> > which header file is a QEMU header, vs which is a 3rd party system he=
ader.
> > Expecting devs to remember which of those 3 buckets each QEMU header =
falls
> > under is unreasonable IMHO.=20
>=20
> That's the C language for you though.  For better or worse, these are
> the rules that K&R came up with.

No one seriously tries to keep compliance with original K&R C these days,
things have moved on massively since then.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
