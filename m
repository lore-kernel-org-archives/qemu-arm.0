Received: by 10.25.0.147 with SMTP id 141csp493125lfa;
        Tue, 21 Feb 2017 05:16:36 -0800 (PST)
X-Received: by 10.200.42.108 with SMTP id l41mr7559972qtl.58.1487682996250;
        Tue, 21 Feb 2017 05:16:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q14si15027457qkl.211.2017.02.21.05.16.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 05:16:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44491 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgAJ1-0004Ss-G8
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 08:16:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cg9ns-00081b-SV
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 07:44:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cg9np-0002mK-O8
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 07:44:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40688)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cg9np-0002mG-Ek; Tue, 21 Feb 2017 07:44:21 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55A9A80476;
	Tue, 21 Feb 2017 12:44:21 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1LCiIb4032327; Tue, 21 Feb 2017 07:44:18 -0500
Date: Tue, 21 Feb 2017 13:44:16 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170221134416.5803b3e5@nial.brq.redhat.com>
In-Reply-To: <CAFEAcA-VAY8LM+8jE4B-L=0QdcY5FLvwmwGVbUhcXjnC9-AW+w@mail.gmail.com>
References: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
	<CAFEAcA9JWzUEmGa2Wxd5xPE4dVknOKBkt=wMda7CAgxzrgOc+w@mail.gmail.com>
	<20170220195500.332a4844@nial.brq.redhat.com>
	<CAFEAcA-VAY8LM+8jE4B-L=0QdcY5FLvwmwGVbUhcXjnC9-AW+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 21 Feb 2017 12:44:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/3] generalize parsing of
 cpu_model
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	"patches@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q7mB2Dv99AUs

On Mon, 20 Feb 2017 19:11:00 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 20 February 2017 at 18:55, Igor Mammedov <imammedo@redhat.com> wrote:
> > Peter Maydell <peter.maydell@linaro.org> wrote:  
[...]
> 
> > its sole user netduino2 board has cpu_model hardcodded
> > at board level which could be left alone or converted
> > to this API.  
> 
> I think this may be for the benefit of the not-yet-in-tree
> netduinoplus2 board, which is a very similar SoC but
> with a cortex-m4. There are likely other ways we could
> model that, though.
> 
> > Using API would make code more consistent
> > at the cost of more code for default/valid callbacks.  
> 
> Mmm, we could have the board code just forward the
> default/valid callbacks through to the SoC (which
> would then either implement them or forward them again).
> But I think we should definitely see if we can make
> the code for handling "the CPU is actually inside some
> other object" as clean as we can, because I think
> that's by far the most common case. Machines like
> the x86 pc and the ARM virt board where the CPU is
> instantiated directly in the board code are the
> non-standard cases I think. We have a lot of boards
> where we do instantiate the CPU in the board code
> just for legacy reasons where we don't properly
> model the SoC the CPU is inside. But hardware that
> really has the CPU as a top level pluggable object
> is rare.

If we are to ditch legacy approach,
It would be cleaner for SoC to have fixed/unconfigurable
CPU type and each SoC being modeled as a separate
QOM object/type that would instantiate CPU directly
with QOM style, using type name, like:

    cpu = object_new(TYPE_FOO_CPU)
    set props if necessary               
    object_property_set_bool(cpu, true, "realized", &err)
    object_unref(cpu)

or similar with extra check/logic on top of plain object_new()

    prepare cpu_opts for cpu type TYPE_FOO_CPU
    cpu = qdev_device_add(cpu_opts)
    object_unref(cpu)

instead of using cpu_init/cpu_foo_init/cpu_generic_init()
with cpu_model parsing logic which is not really needed
there as concrete SoC model knows exact CPU type.

It should work for CPUs that are converted to QOM types,
i.e. a cpu_model maps to a distinct QOM type but we
still have legacy cpu_model handling where we have
not completely QOMifed single base CPU types, ex.

  cpu_mips_init(const char *cpu_model) 
      cpudef = get_feature_set_by_name(cpu+model)
      cpu = object_new(TYPE_MIPS_CPU)
      cpu->cpudef = cdef

which rely on cpu_model parsing like x86 used to be
before conversion from a single CPU type to a set
of concrete classes. QOMification of remaining
CPUs that rely on legacy cpu_model could be idea
for gsoc/outreachy project so students could learn
about QEMU internals (CCing Stefan). 

> 
> thanks
> -- PMM
> 

