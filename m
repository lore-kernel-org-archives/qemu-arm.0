Received: by 10.103.98.197 with SMTP id w188csp397482vsb;
        Tue, 21 Feb 2017 06:00:21 -0800 (PST)
X-Received: by 10.55.212.133 with SMTP id s5mr27115614qks.105.1487685621019;
        Tue, 21 Feb 2017 06:00:21 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a64si15123231qkf.331.2017.02.21.06.00.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 06:00:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45503 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgAzM-0003WY-DU
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 09:00:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cgAvG-00089m-J1
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 08:56:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cgAvF-0002vN-Lr
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 08:56:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36756)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cgAvD-0002uO-DL; Tue, 21 Feb 2017 08:56:03 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C45442BB7;
	Tue, 21 Feb 2017 13:56:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-55.ams2.redhat.com
	[10.36.116.55])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1LDu1Jx022702
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 21 Feb 2017 08:56:02 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 546191138647; Tue, 21 Feb 2017 14:56:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
	<CAFEAcA9JWzUEmGa2Wxd5xPE4dVknOKBkt=wMda7CAgxzrgOc+w@mail.gmail.com>
	<20170220195500.332a4844@nial.brq.redhat.com>
	<CAFEAcA-VAY8LM+8jE4B-L=0QdcY5FLvwmwGVbUhcXjnC9-AW+w@mail.gmail.com>
	<20170221134416.5803b3e5@nial.brq.redhat.com>
	<CAFEAcA-MggU5T1fO8GonkSpLF0SNe0jtygEHtEBkpWC8hyShSw@mail.gmail.com>
Date: Tue, 21 Feb 2017 14:56:00 +0100
In-Reply-To: <CAFEAcA-MggU5T1fO8GonkSpLF0SNe0jtygEHtEBkpWC8hyShSw@mail.gmail.com>
	(Peter Maydell's message of "Tue, 21 Feb 2017 12:55:20 +0000")
Message-ID: <87poibr6kv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 21 Feb 2017 13:56:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC 0/3] generalize parsing of cpu_model
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pkRaDpR7c/ms

Peter Maydell <peter.maydell@linaro.org> writes:

> On 21 February 2017 at 12:44, Igor Mammedov <imammedo@redhat.com> wrote:
>> If we are to ditch legacy approach,
>> It would be cleaner for SoC to have fixed/unconfigurable
>> CPU type and each SoC being modeled as a separate
>> QOM object/type that would instantiate CPU directly
>> with QOM style, using type name, like:
>>
>>     cpu = object_new(TYPE_FOO_CPU)
>>     set props if necessary
>>     object_property_set_bool(cpu, true, "realized", &err)
>>     object_unref(cpu)
>>
>> or similar with extra check/logic on top of plain object_new()
>>
>>     prepare cpu_opts for cpu type TYPE_FOO_CPU
>>     cpu = qdev_device_add(cpu_opts)
>>     object_unref(cpu)
>>
>> instead of using cpu_init/cpu_foo_init/cpu_generic_init()
>> with cpu_model parsing logic which is not really needed
>> there as concrete SoC model knows exact CPU type.
>
> Mmm, I think that's probably best. Would the end-user
> still be able to set CPU properties if necessary via
> a -global command line switch (since -cpu type,foo=on
> wouldn't work)?

-global is a qdev thing.  It affects only instances of TYPE_DEVICE and
its subtypes.  Since TYPE_CPU is one...

> (I just worry slightly that we might have users doing
> weird things which we'd break.)

I suspect we'd hand out a foot or two of extra rope, in addition to the
miles our users already got.
