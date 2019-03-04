Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3450184wrx;
        Mon, 4 Mar 2019 02:19:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqzUCpxR34RtHgFCcWhXnx5AaNHO/CI6R+5hiJpS0zDsDHd+yyGTt46x9CVttHz6FqDsdyqo
X-Received: by 2002:a0d:cb15:: with SMTP id n21mr12842900ywd.209.1551694784467;
        Mon, 04 Mar 2019 02:19:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551694784; cv=none;
        d=google.com; s=arc-20160816;
        b=hDtMdNUnGbVCOZ7CBwot5brXwjpl5u8M2MUqXEATItt7GLBjVsYmF34mmqrQTQ/77v
         1j7aslutP3HyNFl2Sjv8Wrx9KascpHeUHy2zUAyA4qfYFnTls8ilRly6QLVLFh72I1sd
         OoTH7yIHqgkP4mdYmjlmt2g7BmUO4Zc1wmKY9xuiQlYe61vJ9ZXgf8bJK3IfiIxk/On0
         Uvqw1XcNGOBjxZlH5dkPXAG9dRQcJx1GhuUubCCcsFxQgBt9R8bQTDoGUK/mzNn59ol4
         eA8s4FGl8A0Sg++FkNZmADAc3K9iR4mHslrfZySiJ9IFOcJ5D7jZADaOyAJn64b6K4J0
         +7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=C705u9/o/zoFckAKBsthNoMQq3Jhceri1lkclkK5UFQ=;
        b=J+11P7k+ci2nN9Kbs0DfnrcLF5mkElhMqXbqRAZlGxUxcUEcXeL59XbBFiwCK6s4RG
         vckKazxR+5WyUDW50a5CSLCrCMORj0jBIna6fT9bAI3JXi63qIfslEUYiUJp+fYqLSjT
         6MMaBemtj1At07W0qf5SRwkSOQ27enpBko6fEpmHjrHHiXV+i60wWf/Z+2jCyg/TP1YA
         7Jz1WdYnDiF17iBWOGq9AnzB2gMgqFQlSb+xLYfX/Roo063d5s8joRxxX/CW6eV64xBA
         cgPvOdyeyAJwgL/1+QhhU9UihW4Vl7qAvpDRgdv5/Ukw/knC0xN88MBSKTnLg83exMgM
         iyhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b189si2984852yba.63.2019.03.04.02.19.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 02:19:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51383 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0khD-0005da-Rk
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 05:19:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h0kgu-0005bn-Qy
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 05:19:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h0kgt-00049y-NS
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 05:19:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42262)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1h0kgt-00048S-EH; Mon, 04 Mar 2019 05:19:23 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 627513097040;
	Mon,  4 Mar 2019 10:19:21 +0000 (UTC)
Received: from redhat.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AAA95D96F;
	Mon,  4 Mar 2019 10:19:14 +0000 (UTC)
Date: Mon, 4 Mar 2019 10:19:11 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190304101911.GE4239@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87va0zcdse.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 04 Mar 2019 10:19:21 +0000 (UTC)
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
	qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	Igor Mammedov <imammedo@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T8XhaG0kru/8

On Mon, Mar 04, 2019 at 08:13:53AM +0100, Markus Armbruster wrote:
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>=20
> > On Fri, Mar 01, 2019 at 06:33:28PM +0100, Igor Mammedov wrote:
> >> On Fri, 1 Mar 2019 15:49:47 +0000
> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >>=20
> >> > On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrote:
> >> > > The parameter allows to configure fake NUMA topology where guest
> >> > > VM simulates NUMA topology but not actually getting a performanc=
e
> >> > > benefits from it. The same or better results could be achieved
> >> > > using 'memdev' parameter. In light of that any VM that uses NUMA
> >> > > to get its benefits should use 'memdev' and to allow transition
> >> > > initial RAM to device based model, deprecate 'mem' parameter as
> >> > > its ad-hoc partitioning of initial RAM MemoryRegion can't be
> >> > > translated to memdev based backend transparently to users and in
> >> > > compatible manner (migration wise).
> >> > >=20
> >> > > That will also allow to clean up a bit our numa code, leaving on=
ly
> >> > > 'memdev' impl. in place and several boards that use node_mem
> >> > > to generate FDT/ACPI description from it. =20
> >> >=20
> >> > Can you confirm that the  'mem' and 'memdev' parameters to -numa
> >> > are 100% live migration compatible in both directions ?  Libvirt
> >> > would need this to be the case in order to use the 'memdev' syntax
> >> > instead.
> >> Unfortunately they are not migration compatible in any direction,
> >> if it where possible to translate them to each other I'd alias 'mem'
> >> to 'memdev' without deprecation. The former sends over only one
> >> MemoryRegion to target, while the later sends over several (one per
> >> memdev).
> >
> > If we can't migration from one to the other, then we can not deprecat=
e
> > the existing 'mem' syntax. Even if libvirt were to provide a config
> > option to let apps opt-in to the new syntax, we need to be able to
> > support live migration of existing running VMs indefinitely. Effectiv=
ely
> > this means we need the to keep 'mem' support forever, or at least suc=
h
> > a long time that it effectively means forever.
> >
> > So I think this patch has to be dropped & replaced with one that
> > simply documents that memdev syntax is preferred.
>=20
> We have this habit of postulating absolutes like "can not deprecate"
> instead of engaging with the tradeoffs.  We need to kick it.
>=20
> So let's have an actual look at the tradeoffs.
>=20
> We don't actually "support live migration of existing running VMs
> indefinitely".
>
> We support live migration to any newer version of QEMU that still
> supports the machine type.
>=20
> We support live migration to any older version of QEMU that already
> supports the machine type and all the devices the machine uses.
>=20
> Aside: "support" is really an honest best effort here.  If you rely on
> it, use a downstream that puts in the (substantial!) QA work real
> support takes.

If upstream deletes the feature, then that in turn breaks the downstream
unless downstream reverts the upstream change. When we have large overlap
between downstream & upstream maintainer, it is not beneficial to delete
the feature upstream as any effort saved upstream usually expands into
larger effort downstream.

> Feature deprecation is not a contract to drop the feature after two
> releases, or even five.  It's a formal notice that users of the feature
> should transition to its replacement in an orderly manner.
>=20
> If I understand Igor correctly, all users should transition away from
> outdated NUMA configurations at least for new VMs in an orderly manner.
>=20
> So, how could this formal notice be served constructively?
>=20
> If we reject outdated NUMA configurations starting with machine type T,
> we can remove the means to create those configurations along with
> machine type T-1.  Won't happen anytime soon, will happen eventually,
> because in the long run, all machine types are dead (apologies to
> Keynes).
>=20
> If we deprecate outdated NUMA configurations now, we can start rejectin=
g
> them with new machine types after a suitable grace period.

How is libvirt going to know what machines it can use with the feature ?
We don't have any way to introspect machine type specific logic, since we
run all probing with "-machine none", and QEMU can't report anything abou=
t
machines without instantiating them.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
