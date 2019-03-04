Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3517286wrx;
        Mon, 4 Mar 2019 03:45:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqxb+Q1eI/B6Q+d64J46yjlVfeCAXkOWvldsBxc+blNx2KOJnM05f2Lb9r0woRN5ffL3W0Ba
X-Received: by 2002:a25:a083:: with SMTP id y3mr14785370ybh.40.1551699942264;
        Mon, 04 Mar 2019 03:45:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551699942; cv=none;
        d=google.com; s=arc-20160816;
        b=U7/4bqHoCtsHRVvt+5cHM+9tIihHy0Al8O16rhkyUNYF+IKkNZaGv3n/6RMHvy5qoe
         xNza4njNVId4DTU2jaTDsn+sSc10DIlRiHwmFLA+xY37vSEdt9nai6fJ+JwRVQfZU73m
         JmdlIqBGHWnS7lFeSzaQhG1X5ycB6Ui27ieGnq7H7lib/monsJL/sVjd38MMEnbhooH/
         zxWWzA3Ng2WrtA6EE4kxr/crsh9FqmYFnRtWm8L7hVLY74qvXVncN9p/GzNhTB74yLFD
         d7iQ5idURyhFor+Lljfa5V9McdsVh1iAr2qlv3hSCzUnIzH8L3UF/n0wxIkZqBEZHiWk
         w2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=0u9oyXff7uCFh3z8R3devUviMcPAKCefwlpe0o7YQy0=;
        b=wZFQ95eFy2K57SKZKp0vBy+pd6r7tAetnejaaqk9Y8vEudKrSCveSurCGkKOQHotTN
         fGkBbOc7A4LIqNpJ2JX6/DCKCCp/13BzSUFadjuVP1+08UOe/KVT1oOwrVJry+D64yo4
         7Q+0lBYXKireublmyf13bRD6FMFloKl0Vevw0ZhzdEjS34AG5YZliGipOxCVaWWHBS4Q
         h0Jaj1GOi3+g43phKmQk70pmRB6ifQaCTokjgliavzDgql5aNVwaW5Sau5dJ/9hg3tOn
         v6suUBxO/h8xp4fBf3vDYcrya+hdgW4zxduHTYd6s7NfDBl9VB+rgpGnKZb/zCWlTwDY
         1V5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si1725947ybj.353.2019.03.04.03.45.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 03:45:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0m2P-0002TA-Kt
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 06:45:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h0m25-0002M3-3b
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 06:45:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h0m23-0005ZT-Uz
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 06:45:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39344)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h0m23-0005Ye-La; Mon, 04 Mar 2019 06:45:19 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD5583082AF0;
	Mon,  4 Mar 2019 11:45:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5580B6013C;
	Mon,  4 Mar 2019 11:45:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5CA441138660; Mon,  4 Mar 2019 12:45:14 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org> <20190304101911.GE4239@redhat.com>
Date: Mon, 04 Mar 2019 12:45:14 +0100
In-Reply-To: <20190304101911.GE4239@redhat.com> ("Daniel P. =?utf-8?Q?Berr?=
	=?utf-8?Q?ang=C3=A9=22's?=
	message of "Mon, 4 Mar 2019 10:19:11 +0000")
Message-ID: <87y35u3lth.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 04 Mar 2019 11:45:18 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, pbonzini@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gb4fMG7NstTR

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Mar 04, 2019 at 08:13:53AM +0100, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Fri, Mar 01, 2019 at 06:33:28PM +0100, Igor Mammedov wrote:
>> >> On Fri, 1 Mar 2019 15:49:47 +0000
>> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>> >>=20
>> >> > On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrote:
>> >> > > The parameter allows to configure fake NUMA topology where guest
>> >> > > VM simulates NUMA topology but not actually getting a performance
>> >> > > benefits from it. The same or better results could be achieved
>> >> > > using 'memdev' parameter. In light of that any VM that uses NUMA
>> >> > > to get its benefits should use 'memdev' and to allow transition
>> >> > > initial RAM to device based model, deprecate 'mem' parameter as
>> >> > > its ad-hoc partitioning of initial RAM MemoryRegion can't be
>> >> > > translated to memdev based backend transparently to users and in
>> >> > > compatible manner (migration wise).
>> >> > >=20
>> >> > > That will also allow to clean up a bit our numa code, leaving only
>> >> > > 'memdev' impl. in place and several boards that use node_mem
>> >> > > to generate FDT/ACPI description from it.=20=20
>> >> >=20
>> >> > Can you confirm that the  'mem' and 'memdev' parameters to -numa
>> >> > are 100% live migration compatible in both directions ?  Libvirt
>> >> > would need this to be the case in order to use the 'memdev' syntax
>> >> > instead.
>> >> Unfortunately they are not migration compatible in any direction,
>> >> if it where possible to translate them to each other I'd alias 'mem'
>> >> to 'memdev' without deprecation. The former sends over only one
>> >> MemoryRegion to target, while the later sends over several (one per
>> >> memdev).
>> >
>> > If we can't migration from one to the other, then we can not deprecate
>> > the existing 'mem' syntax. Even if libvirt were to provide a config
>> > option to let apps opt-in to the new syntax, we need to be able to
>> > support live migration of existing running VMs indefinitely. Effective=
ly
>> > this means we need the to keep 'mem' support forever, or at least such
>> > a long time that it effectively means forever.
>> >
>> > So I think this patch has to be dropped & replaced with one that
>> > simply documents that memdev syntax is preferred.
>>=20
>> We have this habit of postulating absolutes like "can not deprecate"
>> instead of engaging with the tradeoffs.  We need to kick it.
>>=20
>> So let's have an actual look at the tradeoffs.
>>=20
>> We don't actually "support live migration of existing running VMs
>> indefinitely".
>>
>> We support live migration to any newer version of QEMU that still
>> supports the machine type.
>>=20
>> We support live migration to any older version of QEMU that already
>> supports the machine type and all the devices the machine uses.
>>=20
>> Aside: "support" is really an honest best effort here.  If you rely on
>> it, use a downstream that puts in the (substantial!) QA work real
>> support takes.
>
> If upstream deletes the feature, then that in turn breaks the downstream
> unless downstream reverts the upstream change. When we have large overlap
> between downstream & upstream maintainer, it is not beneficial to delete
> the feature upstream as any effort saved upstream usually expands into
> larger effort downstream.

It can't "break" existing downstreams, only future ones forked off after
the deletion.  Such a fork cares only if it has backward compatibility
requirements to satisfy that require the feature.  My point is: it's not
a simple absolute, it's a complex tradeoff.

>> Feature deprecation is not a contract to drop the feature after two
>> releases, or even five.  It's a formal notice that users of the feature
>> should transition to its replacement in an orderly manner.
>>=20
>> If I understand Igor correctly, all users should transition away from
>> outdated NUMA configurations at least for new VMs in an orderly manner.
>>=20
>> So, how could this formal notice be served constructively?
>>=20
>> If we reject outdated NUMA configurations starting with machine type T,
>> we can remove the means to create those configurations along with
>> machine type T-1.  Won't happen anytime soon, will happen eventually,
>> because in the long run, all machine types are dead (apologies to
>> Keynes).
>>=20
>> If we deprecate outdated NUMA configurations now, we can start rejecting
>> them with new machine types after a suitable grace period.
>
> How is libvirt going to know what machines it can use with the feature ?
> We don't have any way to introspect machine type specific logic, since we
> run all probing with "-machine none", and QEMU can't report anything about
> machines without instantiating them.

Fair point.  A practical way for management applications to decide which
of the two interfaces they can use with which machine type may be
required for deprecating one of the interfaces with new machine types.
