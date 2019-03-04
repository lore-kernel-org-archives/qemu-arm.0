Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3558022wrx;
        Mon, 4 Mar 2019 04:33:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqyq63w2l/J769oiB4y0GCII0GIxUpv5Z41T5io14DBnEZ3j2E+LowhdQZOEMOTVBYPHpxta
X-Received: by 2002:a25:d04e:: with SMTP id h75mr15296852ybg.210.1551702823098;
        Mon, 04 Mar 2019 04:33:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551702823; cv=none;
        d=google.com; s=arc-20160816;
        b=TFdA2LdAEzoygM9GcS9VB6awihwwBO+7FnGk0RuQN1apU1hwYccJHCiUDM8qjFGUjZ
         1Rnu2EbEVXiZWBpl2SRfMOdXUbrgWS1iRP2YwGm5guSBnWpJKIiIaWCuI0HvdV9jar0v
         Tz0iqLK2Kl4Or7x5ADKsfm9ORxfqT5O+sSSpDFB1xOsO+hI6pTWNDs33LsktuDG+ns20
         gcYqb0mCvlG+Oz/5yVRy+2OvAv+jLf5FwzyyXtM0ZT2+ujriVBYbt62SnlmXuBW3xvnJ
         NLAZYpB4B+7ppxGvnze/UMWc/wPyGiJ7A4O3uZGSuoQQsRgUGdWcjo7NZ0D9JgC2OWIO
         l3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=9R8JUv289CsJGG49J8TgOaotB+G1ws9s9Yc/6YY2rOM=;
        b=R1yuUvavRJgtquHwb21Ws+hT0uoI+WWzW2P+g3htAwapA48ARdUOyer33gdHpDfA5M
         +3mUnVs9GV0um6c66pSmCeHHFvHIipEhzs35655ltcEuAwEMpbQ4Z3u6VerfhtY9ixNf
         a3e+ppyVATrNQWg5SqJ+jRLAcuF0ZCg2UpTJDCo905uznv4z36QdC38BI43R2SYT2Idq
         w7M9UQTgc7Jg2/GgqmZ7Px8npVZItYl/AUTVsoZ/SfLk0d1K2UmD/Qxc4ITTk/zf9C/g
         5cAv30JlP6UNhIdonPsX5nLI0M1jA31ZzLviPMeOrTtrYU+dBiPt7qjzY+SLotyZwE4D
         32hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 83si2988306ybz.147.2019.03.04.04.33.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 04:33:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53164 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0mms-0004Fz-IT
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 07:33:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0mm2-0003de-7L
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 07:32:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h0mei-0002kH-TS
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 07:25:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55034)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h0mei-0002jF-KI; Mon, 04 Mar 2019 07:25:16 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63F6881DFE;
	Mon,  4 Mar 2019 12:25:14 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7778160F8D;
	Mon,  4 Mar 2019 12:25:09 +0000 (UTC)
Date: Mon, 4 Mar 2019 13:25:07 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190304132507.39273826@redhat.com>
In-Reply-To: <87va0zcdse.fsf@dusky.pond.sub.org>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<87va0zcdse.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 04 Mar 2019 12:25:14 +0000 (UTC)
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
Cc: peter.maydell@linaro.org,
	"Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
	ehabkost@redhat.com, libvir-list@redhat.com, mprivozn@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	pbonzini@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yg1o2BWqiEU9

On Mon, 04 Mar 2019 08:13:53 +0100
Markus Armbruster <armbru@redhat.com> wrote:

> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>=20
> > On Fri, Mar 01, 2019 at 06:33:28PM +0100, Igor Mammedov wrote: =20
> >> On Fri, 1 Mar 2019 15:49:47 +0000
> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >>  =20
> >> > On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrote: =20
> >> > > The parameter allows to configure fake NUMA topology where guest
> >> > > VM simulates NUMA topology but not actually getting a performance
> >> > > benefits from it. The same or better results could be achieved
> >> > > using 'memdev' parameter. In light of that any VM that uses NUMA
> >> > > to get its benefits should use 'memdev' and to allow transition
> >> > > initial RAM to device based model, deprecate 'mem' parameter as
> >> > > its ad-hoc partitioning of initial RAM MemoryRegion can't be
> >> > > translated to memdev based backend transparently to users and in
> >> > > compatible manner (migration wise).
> >> > >=20
> >> > > That will also allow to clean up a bit our numa code, leaving only
> >> > > 'memdev' impl. in place and several boards that use node_mem
> >> > > to generate FDT/ACPI description from it.   =20
> >> >=20
> >> > Can you confirm that the  'mem' and 'memdev' parameters to -numa
> >> > are 100% live migration compatible in both directions ?  Libvirt
> >> > would need this to be the case in order to use the 'memdev' syntax
> >> > instead. =20
> >> Unfortunately they are not migration compatible in any direction,
> >> if it where possible to translate them to each other I'd alias 'mem'
> >> to 'memdev' without deprecation. The former sends over only one
> >> MemoryRegion to target, while the later sends over several (one per
> >> memdev). =20
> >
> > If we can't migration from one to the other, then we can not deprecate
> > the existing 'mem' syntax. Even if libvirt were to provide a config
> > option to let apps opt-in to the new syntax, we need to be able to
> > support live migration of existing running VMs indefinitely. Effectively
> > this means we need the to keep 'mem' support forever, or at least such
> > a long time that it effectively means forever.
> >
> > So I think this patch has to be dropped & replaced with one that
> > simply documents that memdev syntax is preferred. =20
>=20
> We have this habit of postulating absolutes like "can not deprecate"
> instead of engaging with the tradeoffs.  We need to kick it.
>=20
> So let's have an actual look at the tradeoffs.
>=20
> We don't actually "support live migration of existing running VMs
> indefinitely".
>=20
> We support live migration to any newer version of QEMU that still
> supports the machine type.
>=20
> We support live migration to any older version of QEMU that already
> supports the machine type and all the devices the machine uses.
>=20
> Aside: "support" is really an honest best effort here.  If you rely on
> it, use a downstream that puts in the (substantial!) QA work real
> support takes.
>=20
> Feature deprecation is not a contract to drop the feature after two
> releases, or even five.  It's a formal notice that users of the feature
> should transition to its replacement in an orderly manner.
>=20
> If I understand Igor correctly, all users should transition away from
> outdated NUMA configurations at least for new VMs in an orderly manner.
Yes, we can postpone removing options until there are machines type
versions that were capable to use it (unfortunate but probably=20
unavoidable unless there is a migration trick to make transition
transparent) but that should not stop us from disabling broken
options on new machine types at least.

This series can serve as formal notice with follow up disabling of
deprecated options for new machine types. (As Thomas noted, just warnings
do not work and users continue to use broken features regardless whether
they are don't know about issues or aware of it [*])

Hence suggested deprecation approach and enforced rejection of legacy
numa options for new machine types in 2 releases so users would stop
using them eventually.

*) https://www.redhat.com/archives/libvir-list/2018-November/msg00159.html

> So, how could this formal notice be served constructively?
>=20
> If we reject outdated NUMA configurations starting with machine type T,
> we can remove the means to create those configurations along with
> machine type T-1.  Won't happen anytime soon, will happen eventually,
> because in the long run, all machine types are dead (apologies to
> Keynes).
>=20
> If we deprecate outdated NUMA configurations now, we can start rejecting
> them with new machine types after a suitable grace period.
>=20

