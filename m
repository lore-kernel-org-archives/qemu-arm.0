Received: by 10.25.21.156 with SMTP id 28csp749711lfv;
        Fri, 15 Jul 2016 11:40:25 -0700 (PDT)
X-Received: by 10.55.192.88 with SMTP id o85mr26187364qki.15.1468608025844;
        Fri, 15 Jul 2016 11:40:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si6153043qkc.162.2016.07.15.11.40.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jul 2016 11:40:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34417 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bO82D-0002K5-8a
	for alex.bennee@linaro.org; Fri, 15 Jul 2016 14:40:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bO80i-0007gm-BU
	for qemu-arm@nongnu.org; Fri, 15 Jul 2016 14:38:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bO80e-0007HQ-02
	for qemu-arm@nongnu.org; Fri, 15 Jul 2016 14:38:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40344)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bO80d-0007HC-Nk; Fri, 15 Jul 2016 14:38:47 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0841AC01BCB3;
	Fri, 15 Jul 2016 18:38:47 +0000 (UTC)
Received: from igors-macbook-pro.local (ovpn-112-26.ams2.redhat.com
	[10.36.112.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6FIces3017989; Fri, 15 Jul 2016 14:38:41 -0400
Date: Fri, 15 Jul 2016 20:38:35 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160715203835.38565299@igors-macbook-pro.local>
In-Reply-To: <20160715174353.GD3727@thinpad.lan.raisama.net>
References: <575BB5AB.3010509@redhat.com>
	<20160612134810.posa6p4wyxhit4yt@hawk.localdomain>
	<20160614021216.GI4882@voom.fritz.box>
	<20160614061949.eh45x57tdimt6obr@hawk.localdomain>
	<20160615005620.GU4882@voom.fritz.box>
	<20160714200743.GC31865@thinpad.lan.raisama.net>
	<20160715063530.2ebl4v4vpdtrpx5a@hawk.localdomain>
	<20160715111138.114d8b5f@nial.brq.redhat.com>
	<20160715161009.GB3727@thinpad.lan.raisama.net>
	<ea2c5171-ec0d-39a8-42b8-02c3f5b6655e@suse.de>
	<20160715174353.GD3727@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 15 Jul 2016 18:38:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] QOM: best way for parents to pass
 information to children? (was Re: [PATCH RFC 07/16] qom/cpu: make nr-cores,
 nr-threads real properties)
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
	qemu-devel@nongnu.org, agraf@suse.de, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Thomas Huth <thuth@redhat.com>, pbonzini@redhat.com, dgibson@redhat.com,
	Andreas =?UTF-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n+yjSiDIiKUf

On Fri, 15 Jul 2016 14:43:53 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Fri, Jul 15, 2016 at 06:30:41PM +0200, Andreas F=C3=A4rber wrote:
> > Am 15.07.2016 um 18:10 schrieb Eduardo Habkost:
> > > On Fri, Jul 15, 2016 at 11:11:38AM +0200, Igor Mammedov wrote:
> > >> On Fri, 15 Jul 2016 08:35:30 +0200
> > >> Andrew Jones <drjones@redhat.com> wrote:
> > >>> On Thu, Jul 14, 2016 at 05:07:43PM -0300, Eduardo Habkost wrote:
> > >>>>
> > >>>> First of all, sorry for the horrible delay in replying to this
> > >>>> thread.
> > >>>>
> > >>>> On Wed, Jun 15, 2016 at 10:56:20AM +1000, David Gibson wrote: =20
> > >>>>> On Tue, Jun 14, 2016 at 08:19:49AM +0200, Andrew Jones
> > >>>>> wrote: =20
> > >>>>>> On Tue, Jun 14, 2016 at 12:12:16PM +1000, David Gibson
> > >>>>>> wrote: =20
> > >>>>>>> On Sun, Jun 12, 2016 at 03:48:10PM +0200, Andrew Jones
> > >>>>>>> wrote: =20
> > > [...]
> > >>>>>>>>>> +static Property cpu_common_properties[] =3D {
> > >>>>>>>>>> +    DEFINE_PROP_INT32("nr-cores", CPUState, nr_cores,
> > >>>>>>>>>> 1),
> > >>>>>>>>>> +    DEFINE_PROP_INT32("nr-threads", CPUState,
> > >>>>>>>>>> nr_threads, 1),
> > >>>>>>>>>> +    DEFINE_PROP_END_OF_LIST()
> > >>>>>>>>>> +}; =20
> > >>>>>>>>>
> > >>>>>>>>> Are you aware of the current CPU hotplug discussion that
> > >>>>>>>>> is going on? =20
> > >>>>>>>>
> > >>>>>>>> I'm aware of it going on, but haven't been following it.
> > >>>>>>>>  =20
> > >>>>>>>>> I'm not very involved there, but I think some of these
> > >>>>>>>>> reworks also move "nr_threads" into the CPU state
> > >>>>>>>>> already, e.g. see: =20
> > >>>>>>>>
> > >>>>>>>> nr_threads (and nr_cores) are already state in CPUState.
> > >>>>>>>> This patch just exposes that state via properties.
> > >>>>>>>>  =20
> > >>>>>>>>>
> > >>>>>>>>> https://github.com/dgibson/qemu/commit/9d07719784ecbeebea71
> > >>>>>>>>>
> > >>>>>>>>> ... so you might want to check these patches first to see
> > >>>>>>>>> whether you can base your rework on them? =20
> > >>>>>>>>
> > >>>>>>>> Every cpu, and thus every machine, uses CPUState for its
> > >>>>>>>> cpus. I'm not sure every machine will want to use that new
> > >>>>>>>> abstract core class though. If they did, then we could
> > >>>>>>>> indeed use nr_threads from there instead (and remove it
> > >>>>>>>> from CPUState), but we'd still need nr_cores from the
> > >>>>>>>> abstract cpu package class (CPUState). =20
> > >>>>>>>
> > >>>>>>> Hmm.  Since the CPUState object represents just a single
> > >>>>>>> thread, it seems weird to me that it would have nr_threads
> > >>>>>>> and nr_cores information. =20
> > >>>>
> > >>>> Agreed it is weird, and I think we should try to move it away
> > >>>> from CPUState, not make it part of the TYPE_CPU interface.
> > >>>> nr_threads belongs to the actual container of the Thread
> > >>>> objects, and nr_cores in the actual container of the Core
> > >>>> objects.
> > >>>>
> > >>>> The problem is how to implement that in a non-intrusive way
> > >>>> that would require changing the object hierarchy of all
> > >>>> architectures.
> > >>>>
> > >>>>  =20
> > >>>>>>>
> > >>>>>>> Exposing those as properties makes that much worse, because
> > >>>>>>> it's now ABI, rather than internal detail we can clean up
> > >>>>>>> at some future time. =20
> > >>>>>>
> > >>>>>> CPUState is supposed to be "State of one CPU core or
> > >>>>>> thread", which justifies having nr_threads state, as it may
> > >>>>>> be describing a core. =20
> > >>>>>
> > >>>>> Um.. does it ever actually represent a (multithread) core in
> > >>>>> practice? It would need to have duplicated register state for
> > >>>>> every thread were that the case. =20
> > >>>>
> > >>>> AFAIK, CPUState is still always thread state. Or has this
> > >>>> changed in some architectures, already?
> > >>>>  =20
> > >>>>>  =20
> > >>>>>> I guess there's no justification for having nr_cores in
> > >>>>>> there though. I agree adding the Core class is a good idea,
> > >>>>>> assuming it will get used by all machines, and CPUState then
> > >>>>>> gets changed to a Thread class. The question then, though,
> > >>>>>> is do we also create a Socket class that contains nr_cores? =20
> > >>>>>
> > >>>>> That was roughly our intention with the way the cross
> > >>>>> platform hotplug stuff is evolving.  But the intention was
> > >>>>> that the Socket objects would only need to be constructed for
> > >>>>> machine types where it makes sense.  So for example on the
> > >>>>> paravirt pseries platform, we'll only have Core objects,
> > >>>>> because the socket distinction isn't really meaningful.
> > >>>>>  =20
> > >>>>>> And how will a Thread method get that information when it
> > >>>>>> needs to emulate, e.g. CPUID, that requires it? It's a bit
> > >>>>>> messy, so I'm open to all suggestions on it. =20
> > >>>>>
> > >>>>> So, if the Thread needs this information, I'm not opposed to
> > >>>>> it having it internally (presumably populated earlier from
> > >>>>> the Core object). But I am opposed to it being a locked in
> > >>>>> part of the interface by having it as an exposed property. =20
> > >>>>
> > >>>> I agree we don't want to make this part of the external
> > >>>> interface. In this case, if we don't add the properties, how
> > >>>> exactly is the Machine or Core code supposed to pass that
> > >>>> information to the Thread object?
> > >>>>
> > >>>> Maybe the intermediate steps could be:
> > >>>>
> > >>>> * Make the Thread code that uses CPUState::nr_{cores,threads}
> > >>>> and smp_{cores,threads} get that info from MachineState
> > >>>> instead. =20
> > >>>
> > >>> I have some patches already headed down this road.
> > >>>
> > >>>> * On the architectures where we already have a reasonable
> > >>>>   Socket/Core/Thread hierarchy, let the Thread code simply ask
> > >>>>   for that information from its parent. =20
> > >>>
> > >>> I guess that's just spapr so far, or at least spapr is the
> > >>> closest. Indeed this appears to be the cleanest approach, so
> > >>> architectures adding support for cpu topology should likely
> > >>> strive to implement it this way.
> > >> If I recall correctly, the only thing about accessing parent is
> > >> that in QOM design accessing parent from child wasn't accepted
> > >> well, i.e. child shouldn't be aware nor access parent object.
> > >=20
> > > Can anybody explain why?
> > >=20
> > > In this case, what's the best way for a parent to pass
> > > information to its children without adding new externally-visible
> > > properties that the user is never supposed to set directly?
> > >=20
> > > Should Thread objects have an additional link to the parent Core
> > > object, just to be able to get the information it needs?
> >=20
> > I am not fully aware either and believe I ignored it in my x86
> > socket patchset, part of which it was RFC.
> >=20
> > The key thing to consider is that this breaks user instantiation of
> > a device, so it needs to be disabled.
>=20
> Good point, and this is hard to solve without changing the way
> device_add works. Setting extra properties, on the other hand,
> can be done easily by the hotplug handler if necessary (like we
> do with apic-id in PC).
>=20
> Also, if the properties are not supposed to be set directly by
> the user, then the hotplug handler could refuse to hotplug the
> device if the user tried to fiddle with them. Then the "external
> interface" problem is solved.
>=20
> Now, depending on how much information is needed, "extra
> properties" may be duplicating data that is already available in
> other objects (like nr-cores/nr-threads), or just a link property
> (e.g. a link to the Core object in the case of spapr). If we
> still don't have the right object topology implemented, then we
> may need to use individual properties like "nr-cores" and
> "nr-threads" (preferably as a temporary solution?).
>=20
> In other words, maybe "nr-cores" and "nr-threads" properties will
> be useful in x86, but only if we reject device creation in case
> the user tries to set them manually, and if we do _not_ expose
> them on TYPE_CPU.
Should be add a QOM API that could mark property as an internal
that would be beneficial in generic as we won't have to be scared
exposing internal stuff to users and be able to hide target specifics
behind properties?

it should be simple enough to do.

>=20
> Anyway, I think all that can be done as a second step. First, we
> need to replace existing usage of smp_{threads,cores} globals
> with MachineState fields. Later, remaining qdev_get_machine()
> calls can be replaced by a more QOM-friendly mechanism.
>=20
> >=20
> > Note that I'm just replying to this particular question without the
> > full context.
>=20
> No problem. I wanted it to be a generic question about what are
> QOM best practices. Thanks for your feedback.
>=20

