Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3315210wrx;
        Sun, 3 Mar 2019 23:14:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqw0a5+5FQqTloz8L1iQrWnWGRLuN3YmlUe+1VM6QQ35myejbFWnfN5YPzqeUpocC4f7xyDq
X-Received: by 2002:a25:485:: with SMTP id 127mr14113193ybe.327.1551683650117;
        Sun, 03 Mar 2019 23:14:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551683650; cv=none;
        d=google.com; s=arc-20160816;
        b=ToJYtJQ/4bJ4caa+lNSXuolgEIWpOoH8rb1BnTwBdW+94paURy83JP2WgNuhaSefH5
         OCsa60Wr5vxbF5Ewjx81/wF+9j6sD20Xm+tmKoIiqL4xFIigldwBe4ZslDtlCXIj7PHX
         t5Sb/13MV+P4IhhOt0LXVFm5WGnU3Ye3/Tcaw40+4KN66BHWe/Pi5KM1qkA5NSwd9272
         ZK8gZ4uiQgDYE57RGlC2Cupgth6peAD4zNqiCwjOOKKmr1hm7C5ovjqsxFDhgmh5NU1A
         iaZZ+EM+s/GcN8a6EW5Mt+FnL7uEZroetd6EgWkuHUu38OuI9vU5iu3CfI9x2bzK+O27
         2JJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:to:from;
        bh=N9x8GG+TE/Co0Z6799WeF13ZrTJiibfGWfevQybhKI4=;
        b=HlE0tPkL9wg0tcl7U6j/oGh2loO6hQ76xd4IAeCAdZ8wEujs3MCZsi5hF08xD/qiub
         SUo5sI+j7Sxazu9qkikpumhNVmApH6xien19iTtmk1I+4PmuLiZwxRQfTX7EIdgEgR3X
         nh5/RViqmxKR1hRwYxnCw+XqS29esBsstnKng51V9BWsufCHPugE4pQafHVquk0sko2R
         o0e3WZHi/tnfT7xnz1RFslQvWSk6Z9YKIJkOCps3AYmw67p5EhLVj+hJaF0CGEO0vcA6
         NZZhfZj2N6zb4QziAnMpJVPbY6Yv+FWtShXQqN9kBFYO7yB6uvv6wxOx32AFIrTaJaI4
         y/GA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6si2855122ywb.376.2019.03.03.23.14.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 03 Mar 2019 23:14:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0hnd-000693-IK
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 02:14:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h0hnU-00068o-CZ
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 02:14:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1h0hnT-0003wz-CO
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 02:14:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59964)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1h0hnT-0003vH-3Q; Mon, 04 Mar 2019 02:13:59 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E652E30821E2;
	Mon,  4 Mar 2019 07:13:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 784DF5C207;
	Mon,  4 Mar 2019 07:13:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BC8B91138660; Mon,  4 Mar 2019 08:13:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
Date: Mon, 04 Mar 2019 08:13:53 +0100
In-Reply-To: <20190301174806.GN21251@redhat.com> ("Daniel P. =?utf-8?Q?Ber?=
	=?utf-8?Q?rang=C3=A9=22's?=
	message of "Fri, 1 Mar 2019 17:48:06 +0000")
Message-ID: <87va0zcdse.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 04 Mar 2019 07:13:58 +0000 (UTC)
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
	qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	Igor Mammedov <imammedo@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e+nsR3x7728j

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Mar 01, 2019 at 06:33:28PM +0100, Igor Mammedov wrote:
>> On Fri, 1 Mar 2019 15:49:47 +0000
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>>=20
>> > On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrote:
>> > > The parameter allows to configure fake NUMA topology where guest
>> > > VM simulates NUMA topology but not actually getting a performance
>> > > benefits from it. The same or better results could be achieved
>> > > using 'memdev' parameter. In light of that any VM that uses NUMA
>> > > to get its benefits should use 'memdev' and to allow transition
>> > > initial RAM to device based model, deprecate 'mem' parameter as
>> > > its ad-hoc partitioning of initial RAM MemoryRegion can't be
>> > > translated to memdev based backend transparently to users and in
>> > > compatible manner (migration wise).
>> > >=20
>> > > That will also allow to clean up a bit our numa code, leaving only
>> > > 'memdev' impl. in place and several boards that use node_mem
>> > > to generate FDT/ACPI description from it.=20=20
>> >=20
>> > Can you confirm that the  'mem' and 'memdev' parameters to -numa
>> > are 100% live migration compatible in both directions ?  Libvirt
>> > would need this to be the case in order to use the 'memdev' syntax
>> > instead.
>> Unfortunately they are not migration compatible in any direction,
>> if it where possible to translate them to each other I'd alias 'mem'
>> to 'memdev' without deprecation. The former sends over only one
>> MemoryRegion to target, while the later sends over several (one per
>> memdev).
>
> If we can't migration from one to the other, then we can not deprecate
> the existing 'mem' syntax. Even if libvirt were to provide a config
> option to let apps opt-in to the new syntax, we need to be able to
> support live migration of existing running VMs indefinitely. Effectively
> this means we need the to keep 'mem' support forever, or at least such
> a long time that it effectively means forever.
>
> So I think this patch has to be dropped & replaced with one that
> simply documents that memdev syntax is preferred.

We have this habit of postulating absolutes like "can not deprecate"
instead of engaging with the tradeoffs.  We need to kick it.

So let's have an actual look at the tradeoffs.

We don't actually "support live migration of existing running VMs
indefinitely".

We support live migration to any newer version of QEMU that still
supports the machine type.

We support live migration to any older version of QEMU that already
supports the machine type and all the devices the machine uses.

Aside: "support" is really an honest best effort here.  If you rely on
it, use a downstream that puts in the (substantial!) QA work real
support takes.

Feature deprecation is not a contract to drop the feature after two
releases, or even five.  It's a formal notice that users of the feature
should transition to its replacement in an orderly manner.

If I understand Igor correctly, all users should transition away from
outdated NUMA configurations at least for new VMs in an orderly manner.

So, how could this formal notice be served constructively?

If we reject outdated NUMA configurations starting with machine type T,
we can remove the means to create those configurations along with
machine type T-1.  Won't happen anytime soon, will happen eventually,
because in the long run, all machine types are dead (apologies to
Keynes).

If we deprecate outdated NUMA configurations now, we can start rejecting
them with new machine types after a suitable grace period.
