Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3674050wrx;
        Mon, 4 Mar 2019 06:35:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzfnsoqtklmRj3r7oQPbOMIYW9h2HcMNKdeV3N5gKhg9QOVQ7Mc5znLDJlqzkZkWHfUdkdh
X-Received: by 2002:a0d:dd4e:: with SMTP id g75mr14027531ywe.441.1551710101163;
        Mon, 04 Mar 2019 06:35:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551710101; cv=none;
        d=google.com; s=arc-20160816;
        b=zRlUZGCufhERiAQX4Z1NEQuELQL0wgK/l6is5+neO48imD8PvmLvQlEHhl6Byz2aIZ
         v0LigJSWsSVyfJFp8n3cIqh0ecjuW9u9itFYdAzbKbvR2zfb6TRJxjhUuAvyQl5hlfwr
         6FNeYPKwAXjVjmaq+qavxDhYh1MQbx9PRTM4CidtX0WE9vtQEdcTH2XRvs+msc767j1m
         5vKtIKjQp3blPZ7qF+b5S8r8WHa6q2WEFil5MxMwS6XJaNRsbjFKD6laE78Y9udNwBfu
         P8djPLx4+QNPlVRXwFtfiWdRmohDoXebGidLuz/gHkaXK2dQOJLCCY1UEgJojIU+4d+d
         lJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=X1k67VH2jiIs9dRHWgFD47CzchRBpiu0IZ7x8D1BFv4=;
        b=t0qsUDMJ9fkcaVsbILPSor8gdTuHjmRpcdUlMw3gOG3Ym1Y1M3LLalpPbPntVCn6Zl
         UTdYqdZIE8JiTmIqIEUy4iiUQ4CHsfzJl75BDAQBiSmELqny/8to1iApMyQyDhA1nHgv
         b4WA3C2nIoCOY9mUQd1ZU0zGNHxVKtMI6iJkdwBuaQY0fgs5E86A/uBdSYgbU4n75DzP
         gEecjbCCFabShMVZ1LVUWvKX1i4Z+8kxQXQCptyWvku0wUvnBvwCIzhin56Z25gkY3kB
         n19LBOgMEgndwQpddUexUMJ6KNySslc/cahhL2oZs+G1z5d69MY4tKiBoQzwURB8dQxz
         /P4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d141si3571488ywb.143.2019.03.04.06.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 06:35:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55018 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0ogG-0007aL-MU
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 09:35:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1h0ofe-0007SY-Jd
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 09:34:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mprivozn@redhat.com>) id 1h0ofY-00088K-Ab
	for qemu-devel@nongnu.org; Mon, 04 Mar 2019 09:34:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mprivozn@redhat.com>)
	id 1h0ofV-00086v-9a; Mon, 04 Mar 2019 09:34:13 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 470013082E6A;
	Mon,  4 Mar 2019 14:34:12 +0000 (UTC)
Received: from [10.43.2.30] (unknown [10.43.2.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B96551A8F1;
	Mon,  4 Mar 2019 14:34:07 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com> <87va0zcdse.fsf@dusky.pond.sub.org>
	<20190304132507.39273826@redhat.com> <20190304123908.GK4239@redhat.com>
	<20190304151641.3deefc3b@redhat.com>
From: Michal Privoznik <mprivozn@redhat.com>
Message-ID: <762d9059-48fe-fe8a-42cf-bae6e802a1a9@redhat.com>
Date: Mon, 4 Mar 2019 15:34:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.2
MIME-Version: 1.0
In-Reply-To: <20190304151641.3deefc3b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Mon, 04 Mar 2019 14:34:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [libvirt] [PATCH 1/2] numa: deprecate 'mem'
 parameter of '-numa node' option
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, libvir-list@redhat.com,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d6mNYEe++Qg2

On 3/4/19 3:16 PM, Igor Mammedov wrote:
> On Mon, 4 Mar 2019 12:39:08 +0000
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>=20
>> On Mon, Mar 04, 2019 at 01:25:07PM +0100, Igor Mammedov wrote:
>>> On Mon, 04 Mar 2019 08:13:53 +0100
>>> Markus Armbruster <armbru@redhat.com> wrote:
>>>   =20
>>>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>>>   =20
>>>>> On Fri, Mar 01, 2019 at 06:33:28PM +0100, Igor Mammedov wrote:
>>>>>> On Fri, 1 Mar 2019 15:49:47 +0000
>>>>>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>>>>>>     =20
>>>>>>> On Fri, Mar 01, 2019 at 04:42:15PM +0100, Igor Mammedov wrote:
>>>>>>>> The parameter allows to configure fake NUMA topology where guest
>>>>>>>> VM simulates NUMA topology but not actually getting a performanc=
e
>>>>>>>> benefits from it. The same or better results could be achieved
>>>>>>>> using 'memdev' parameter. In light of that any VM that uses NUMA
>>>>>>>> to get its benefits should use 'memdev' and to allow transition
>>>>>>>> initial RAM to device based model, deprecate 'mem' parameter as
>>>>>>>> its ad-hoc partitioning of initial RAM MemoryRegion can't be
>>>>>>>> translated to memdev based backend transparently to users and in
>>>>>>>> compatible manner (migration wise).
>>>>>>>>
>>>>>>>> That will also allow to clean up a bit our numa code, leaving on=
ly
>>>>>>>> 'memdev' impl. in place and several boards that use node_mem
>>>>>>>> to generate FDT/ACPI description from it.
>>>>>>>
>>>>>>> Can you confirm that the  'mem' and 'memdev' parameters to -numa
>>>>>>> are 100% live migration compatible in both directions ?  Libvirt
>>>>>>> would need this to be the case in order to use the 'memdev' synta=
x
>>>>>>> instead.
>>>>>> Unfortunately they are not migration compatible in any direction,
>>>>>> if it where possible to translate them to each other I'd alias 'me=
m'
>>>>>> to 'memdev' without deprecation. The former sends over only one
>>>>>> MemoryRegion to target, while the later sends over several (one pe=
r
>>>>>> memdev).
>>>>>
>>>>> If we can't migration from one to the other, then we can not deprec=
ate
>>>>> the existing 'mem' syntax. Even if libvirt were to provide a config
>>>>> option to let apps opt-in to the new syntax, we need to be able to
>>>>> support live migration of existing running VMs indefinitely. Effect=
ively
>>>>> this means we need the to keep 'mem' support forever, or at least s=
uch
>>>>> a long time that it effectively means forever.
>>>>>
>>>>> So I think this patch has to be dropped & replaced with one that
>>>>> simply documents that memdev syntax is preferred.
>>>>
>>>> We have this habit of postulating absolutes like "can not deprecate"
>>>> instead of engaging with the tradeoffs.  We need to kick it.
>>>>
>>>> So let's have an actual look at the tradeoffs.
>>>>
>>>> We don't actually "support live migration of existing running VMs
>>>> indefinitely".
>>>>
>>>> We support live migration to any newer version of QEMU that still
>>>> supports the machine type.
>>>>
>>>> We support live migration to any older version of QEMU that already
>>>> supports the machine type and all the devices the machine uses.
>>>>
>>>> Aside: "support" is really an honest best effort here.  If you rely =
on
>>>> it, use a downstream that puts in the (substantial!) QA work real
>>>> support takes.
>>>>
>>>> Feature deprecation is not a contract to drop the feature after two
>>>> releases, or even five.  It's a formal notice that users of the feat=
ure
>>>> should transition to its replacement in an orderly manner.
>>>>
>>>> If I understand Igor correctly, all users should transition away fro=
m
>>>> outdated NUMA configurations at least for new VMs in an orderly mann=
er.
>>> Yes, we can postpone removing options until there are machines type
>>> versions that were capable to use it (unfortunate but probably
>>> unavoidable unless there is a migration trick to make transition
>>> transparent) but that should not stop us from disabling broken
>>> options on new machine types at least.
>>>
>>> This series can serve as formal notice with follow up disabling of
>>> deprecated options for new machine types. (As Thomas noted, just warn=
ings
>>> do not work and users continue to use broken features regardless whet=
her
>>> they are don't know about issues or aware of it [*])
>>>
>>> Hence suggested deprecation approach and enforced rejection of legacy
>>> numa options for new machine types in 2 releases so users would stop
>>> using them eventually.
>>
>> When we deprecate something, we need to have a way for apps to use the
>> new alternative approach *at the same time*.  So even if we only want =
to
>> deprecate for new machine types, we still have to first solve the prob=
lem
>> of how mgmt apps will introspect QEMU to learn which machine types exp=
ect
>> the new options.
> I'm not aware any mechanism to introspect machine type options (existin=
g
> or something being developed). Are/were there any ideas about it that w=
ere
> discussed in the past?
>=20
> Aside from developing a new mechanism what are alternative approaches?
> I mean when we delete deprecated CLI option, how it's solved on libvirt
> side currently?

Libvirt queries qemu capabilites via QMP. And in all places it can it=20
preferes the latest recommended cmd line options (well, those known to a=20
libvirt developer at the time he/she is writing the code). So as long as=20
you remove only old stuff and libvirt refreshes itself when following=20
best practicies we're okay.

>=20
> For example I don't see anything introspection related when we have bee=
n
> removing deprecated options recently.
>=20
> More exact question specific to this series usecase,
> how libvirt decides when to use -numa node,memdev or not currently?

It has a mechanism to tell if '-numa node,memdev=3D' is needed (i.e. ther=
e=20
is no other way to satisfy user requested configuration) and only then=20
it uses ,memdev. For all other cases it defaults to -numa node,mem=3D=20
simply to keep backwards compatibility (as I'm explaining in another=20
e-mail I've just sent to this list).

Anyway, in the libvirt code you want to be looking at:

src/qemu/qemu_command.c: qemuBuildNumaArgStr
src/qemu/qemu_command.c: qemuBuildMemoryCellBackendStr

Michal
