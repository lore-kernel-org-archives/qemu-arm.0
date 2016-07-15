Received: by 10.25.21.156 with SMTP id 28csp700884lfv;
        Fri, 15 Jul 2016 09:33:53 -0700 (PDT)
X-Received: by 10.55.220.70 with SMTP id v67mr27338789qki.127.1468600433198;
        Fri, 15 Jul 2016 09:33:53 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w6si107692qkc.67.2016.07.15.09.33.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jul 2016 09:33:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33733 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bO63k-0006T3-K2
	for alex.bennee@linaro.org; Fri, 15 Jul 2016 12:33:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1bO60t-0003yq-Lb
	for qemu-devel@nongnu.org; Fri, 15 Jul 2016 12:30:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1bO60r-0004jr-2J
	for qemu-devel@nongnu.org; Fri, 15 Jul 2016 12:30:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:58509)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1bO60k-0004iI-FB; Fri, 15 Jul 2016 12:30:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 9E5F5AC01;
	Fri, 15 Jul 2016 16:30:42 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-8-git-send-email-drjones@redhat.com>
	<575BB5AB.3010509@redhat.com>
	<20160612134810.posa6p4wyxhit4yt@hawk.localdomain>
	<20160614021216.GI4882@voom.fritz.box>
	<20160614061949.eh45x57tdimt6obr@hawk.localdomain>
	<20160615005620.GU4882@voom.fritz.box>
	<20160714200743.GC31865@thinpad.lan.raisama.net>
	<20160715063530.2ebl4v4vpdtrpx5a@hawk.localdomain>
	<20160715111138.114d8b5f@nial.brq.redhat.com>
	<20160715161009.GB3727@thinpad.lan.raisama.net>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Linux GmbH
Message-ID: <ea2c5171-ec0d-39a8-42b8-02c3f5b6655e@suse.de>
Date: Fri, 15 Jul 2016 18:30:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2
MIME-Version: 1.0
In-Reply-To: <20160715161009.GB3727@thinpad.lan.raisama.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Subject: Re: [Qemu-devel] QOM: best way for parents to pass information to
 children? (was Re: [PATCH RFC 07/16] qom/cpu: make nr-cores,
 nr-threads real properties)
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
	qemu-devel@nongnu.org, agraf@suse.de, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Thomas Huth <thuth@redhat.com>, pbonzini@redhat.com,
	dgibson@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ntEkFZzSKp5o

Am 15.07.2016 um 18:10 schrieb Eduardo Habkost:
> On Fri, Jul 15, 2016 at 11:11:38AM +0200, Igor Mammedov wrote:
>> On Fri, 15 Jul 2016 08:35:30 +0200
>> Andrew Jones <drjones@redhat.com> wrote:
>>> On Thu, Jul 14, 2016 at 05:07:43PM -0300, Eduardo Habkost wrote:
>>>>
>>>> First of all, sorry for the horrible delay in replying to this
>>>> thread.
>>>>
>>>> On Wed, Jun 15, 2016 at 10:56:20AM +1000, David Gibson wrote: =20
>>>>> On Tue, Jun 14, 2016 at 08:19:49AM +0200, Andrew Jones wrote: =20
>>>>>> On Tue, Jun 14, 2016 at 12:12:16PM +1000, David Gibson wrote: =20
>>>>>>> On Sun, Jun 12, 2016 at 03:48:10PM +0200, Andrew Jones wrote: =20
> [...]
>>>>>>>>>> +static Property cpu_common_properties[] =3D {
>>>>>>>>>> +    DEFINE_PROP_INT32("nr-cores", CPUState, nr_cores, 1),
>>>>>>>>>> +    DEFINE_PROP_INT32("nr-threads", CPUState, nr_threads, 1),
>>>>>>>>>> +    DEFINE_PROP_END_OF_LIST()
>>>>>>>>>> +}; =20
>>>>>>>>>
>>>>>>>>> Are you aware of the current CPU hotplug discussion that is goi=
ng on? =20
>>>>>>>>
>>>>>>>> I'm aware of it going on, but haven't been following it.
>>>>>>>>  =20
>>>>>>>>> I'm not very involved there, but I think some of these reworks =
also move
>>>>>>>>> "nr_threads" into the CPU state already, e.g. see: =20
>>>>>>>>
>>>>>>>> nr_threads (and nr_cores) are already state in CPUState. This pa=
tch just
>>>>>>>> exposes that state via properties.
>>>>>>>>  =20
>>>>>>>>>
>>>>>>>>> https://github.com/dgibson/qemu/commit/9d07719784ecbeebea71
>>>>>>>>>
>>>>>>>>> ... so you might want to check these patches first to see wheth=
er you
>>>>>>>>> can base your rework on them? =20
>>>>>>>>
>>>>>>>> Every cpu, and thus every machine, uses CPUState for its cpus. I=
'm
>>>>>>>> not sure every machine will want to use that new abstract core c=
lass
>>>>>>>> though. If they did, then we could indeed use nr_threads from th=
ere
>>>>>>>> instead (and remove it from CPUState), but we'd still need nr_co=
res
>>>>>>>> from the abstract cpu package class (CPUState). =20
>>>>>>>
>>>>>>> Hmm.  Since the CPUState object represents just a single thread, =
it
>>>>>>> seems weird to me that it would have nr_threads and nr_cores
>>>>>>> information. =20
>>>>
>>>> Agreed it is weird, and I think we should try to move it away
>>>> from CPUState, not make it part of the TYPE_CPU interface.
>>>> nr_threads belongs to the actual container of the Thread objects,
>>>> and nr_cores in the actual container of the Core objects.
>>>>
>>>> The problem is how to implement that in a non-intrusive way that
>>>> would require changing the object hierarchy of all architectures.
>>>>
>>>>  =20
>>>>>>>
>>>>>>> Exposing those as properties makes that much worse, because it's =
now
>>>>>>> ABI, rather than internal detail we can clean up at some future t=
ime. =20
>>>>>>
>>>>>> CPUState is supposed to be "State of one CPU core or thread", whic=
h
>>>>>> justifies having nr_threads state, as it may be describing a core.=
 =20
>>>>>
>>>>> Um.. does it ever actually represent a (multithread) core in practi=
ce?
>>>>> It would need to have duplicated register state for every thread we=
re
>>>>> that the case. =20
>>>>
>>>> AFAIK, CPUState is still always thread state. Or has this changed
>>>> in some architectures, already?
>>>>  =20
>>>>>  =20
>>>>>> I guess there's no justification for having nr_cores in there thou=
gh.
>>>>>> I agree adding the Core class is a good idea, assuming it will get=
 used
>>>>>> by all machines, and CPUState then gets changed to a Thread class.=
 The
>>>>>> question then, though, is do we also create a Socket class that co=
ntains
>>>>>> nr_cores? =20
>>>>>
>>>>> That was roughly our intention with the way the cross platform hotp=
lug
>>>>> stuff is evolving.  But the intention was that the Socket objects
>>>>> would only need to be constructed for machine types where it makes
>>>>> sense.  So for example on the paravirt pseries platform, we'll only
>>>>> have Core objects, because the socket distinction isn't really
>>>>> meaningful.
>>>>>  =20
>>>>>> And how will a Thread method get that information when it
>>>>>> needs to emulate, e.g. CPUID, that requires it? It's a bit messy, =
so
>>>>>> I'm open to all suggestions on it. =20
>>>>>
>>>>> So, if the Thread needs this information, I'm not opposed to it hav=
ing
>>>>> it internally (presumably populated earlier from the Core object).
>>>>> But I am opposed to it being a locked in part of the interface by
>>>>> having it as an exposed property. =20
>>>>
>>>> I agree we don't want to make this part of the external
>>>> interface. In this case, if we don't add the properties, how
>>>> exactly is the Machine or Core code supposed to pass that
>>>> information to the Thread object?
>>>>
>>>> Maybe the intermediate steps could be:
>>>>
>>>> * Make the Thread code that uses CPUState::nr_{cores,threads} and
>>>>   smp_{cores,threads} get that info from MachineState instead. =20
>>>
>>> I have some patches already headed down this road.
>>>
>>>> * On the architectures where we already have a reasonable
>>>>   Socket/Core/Thread hierarchy, let the Thread code simply ask
>>>>   for that information from its parent. =20
>>>
>>> I guess that's just spapr so far, or at least spapr is the closest.
>>> Indeed this appears to be the cleanest approach, so architectures
>>> adding support for cpu topology should likely strive to implement it
>>> this way.
>> If I recall correctly, the only thing about accessing parent is that
>> in QOM design accessing parent from child wasn't accepted well,
>> i.e. child shouldn't be aware nor access parent object.
>=20
> Can anybody explain why?
>=20
> In this case, what's the best way for a parent to pass
> information to its children without adding new externally-visible
> properties that the user is never supposed to set directly?
>=20
> Should Thread objects have an additional link to the parent Core
> object, just to be able to get the information it needs?

I am not fully aware either and believe I ignored it in my x86 socket
patchset, part of which it was RFC.

The key thing to consider is that this breaks user instantiation of a
device, so it needs to be disabled.

Note that I'm just replying to this particular question without the full
context.

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=FCrnberg)
