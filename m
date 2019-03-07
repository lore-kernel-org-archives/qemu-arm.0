Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6950856wrx;
        Thu, 7 Mar 2019 01:59:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqwZXTtFAPkiD5r589URgbHStwrR/oeQ8+SYLgXvQtox5XVuC6k96HOQYrErV3HNWRDExF0t
X-Received: by 2002:a25:7390:: with SMTP id o138mr10209333ybc.156.1551952765284;
        Thu, 07 Mar 2019 01:59:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551952765; cv=none;
        d=google.com; s=arc-20160816;
        b=fo0eSC4ljN0dYH0Y/iHxJhO265Z/wETjfWKKwNfoVB45EwVnrncDbqQRoCgRd0300i
         xMVbgOei/E8rbHFspPf8UtMLQHCWB2vfzObERpfaMsPpq+zX9JV2v14AZIyZCzm6cTeV
         9i+A1QzRzRm/2xpeVqNEMMicsJREeZatcvbnzdkbG2pnuzPbIoPuzLPgw8cBR60MlJgl
         9dp0ZzaS2zsc/a/aFYTZHsJWeK/kbNVTuNinG9T/M+O4Tyw7mbkdNB+KxFW3mq8fpAev
         EWQ39iBhjaYSMwc2fBrVEgoYJBgkIqnKfHablgCXA30uGZpmKQAm+QRGte2cwuzsFUGg
         kUUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=kcyOvnRy131qJLuHry+NpOgq/roQ5pp6erEzbsDfx/A=;
        b=0ezBKc8xfqv1iJD0FWu1pXX7uJqKDJRlW4vCGJ91Zoyq0CFTYAzWkqg0ghgh/YELqM
         9MXmWDI9JC2X8fk9MCVpX3llFnhETOiwW47wN0wuTqpWaWrtTfqEQcbdHRvSRDD51yRm
         u2uF3LcazydcrarVGyfLWEdUIt851u/5HivrkpQnsbHL4wIrZyW3wiXH57GuPD37DS4H
         eVcH+CwR0GMddgm6dD9R2KYZIB8b1t9wegsClW2AnRl/7YG/vxBt6fwptWBcIAtKJBdG
         02WJHLlFKu1qCk0DtjpEUGoDmoWvUg/mCo2M4mxdhqczF4VYq92oA2bS4nDCY76gk+QW
         bSXg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 190si2242315ybm.481.2019.03.07.01.59.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 01:59:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1poC-0000iT-RT
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 04:59:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h1po1-0000he-Ji
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 04:59:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h1pnz-00034u-Qx
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 04:59:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:65210)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1h1pny-00034K-Og; Thu, 07 Mar 2019 04:59:11 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0AD487637;
	Thu,  7 Mar 2019 09:59:08 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8133F5D78D;
	Thu,  7 Mar 2019 09:59:03 +0000 (UTC)
Date: Thu, 7 Mar 2019 09:59:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190307095901.GF32268@redhat.com>
References: <20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304132507.39273826@redhat.com>
	<20190304123908.GK4239@redhat.com>
	<20190304151641.3deefc3b@redhat.com>
	<20190304142432.GM4239@redhat.com>
	<a6081774-c9d5-0496-3e65-ffb885408261@redhat.com>
	<20190304163516.GQ4239@redhat.com>
	<20190306200348.11e9eece@Igors-MacBook-Pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190306200348.11e9eece@Igors-MacBook-Pro.local>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 07 Mar 2019 09:59:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [libvirt] [PATCH 1/2] numa: deprecate
 'mem' parameter of '-numa node' option
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, pbonzini@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: osPvhxL0EvzU

On Wed, Mar 06, 2019 at 08:03:48PM +0100, Igor Mammedov wrote:
> On Mon, 4 Mar 2019 16:35:16 +0000
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>=20
> > On Mon, Mar 04, 2019 at 05:20:13PM +0100, Michal Privoznik wrote:
> > > We couldn't have done that. How we would migrate from older qemu?
> > >=20
> > > Anyway, now that I look into this (esp. git log) I came accross:
> > >=20
> > > commit f309db1f4d51009bad0d32e12efc75530b66836b
> > > Author:     Michal Privoznik <mprivozn@redhat.com>
> > > AuthorDate: Thu Dec 18 12:36:48 2014 +0100
> > > Commit:     Michal Privoznik <mprivozn@redhat.com>
> > > CommitDate: Fri Dec 19 07:44:44 2014 +0100
> > >=20
> > >     qemu: Create memory-backend-{ram,file} iff needed
> > >=20
> > > Or this 7832fac84741d65e851dbdbfaf474785cbfdcf3c. We did try to gen=
erated
> > > newer cmd line but then for various reasong (e.g. avoiding triggeri=
ng a qemu
> > > bug) we turned it off and make libvirt default to older (now deprec=
ated) cmd
> > > line.
> > >=20
> > > Frankly, I don't know how to proceed. Unless qemu is fixed to allow
> > > migration from deprecated to new cmd line (unlikely, if not impossi=
ble,
> > > right?) then I guess the only approach we can have is that:
> > >=20
> > > 1) whenever so called cold booting a new machine (fresh, brand new =
start of
> > > a new domain) libvirt would default to modern cmd line,
> > >=20
> > > 2) on migration, libvirt would record in the migration stream (or s=
tatus XML
> > > or wherever) that modern cmd line was generated and thus it'll make=
 the
> > > destination generate modern cmd line too.
> > >=20
> > > This solution still suffers a couple of problems:
> > > a) migration to older libvirt will fail as older libvirt won't reco=
gnize the
> > > flag set in 2) and therefore would default to deprecated cmd line
> > > b) migrating from one host to another won't modernize the cmd line
> > >=20
> > > But I guess we have to draw a line somewhere (if we are not willing=
 to write
> > > those migration patches).
> >=20
> > Yeah supporting backwards migration is a non-optional requirement fro=
m at
> > least one of the mgmt apps using libvirt, so breaking the new to old =
case
> > is something we always aim to avoid.
> Aiming for support of=20
> "new QEMU + new machine type" =3D> "old QEMU + non-existing machine typ=
e"
> seems a bit difficult.

That's not the scenario that's the problem. The problem is

   new QEMU + new machine type + new libvirt   -> new QEMU + new machine =
type + old libvirt

Previously released versions of libvirt will happily use any new machine
type that QEMU introduces. So we can't make new libvirt use a different
options, only for new machine types, as old libvirt supports those machin=
e
types too.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
