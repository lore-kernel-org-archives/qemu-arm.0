Received: by 10.25.0.147 with SMTP id 141csp147482lfa;
        Mon, 20 Feb 2017 11:02:22 -0800 (PST)
X-Received: by 10.237.42.164 with SMTP id t33mr22607523qtd.27.1487617342711;
        Mon, 20 Feb 2017 11:02:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m10si3900038qtb.28.2017.02.20.11.02.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Feb 2017 11:02:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40509 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cftE4-0007kx-QL
	for alex.bennee@linaro.org; Mon, 20 Feb 2017 14:02:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cft7A-0002Xu-Gp
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 13:55:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cft79-0003RY-IV
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 13:55:12 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54946)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cft74-0003Mn-JV; Mon, 20 Feb 2017 13:55:06 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6D34E80F9C;
	Mon, 20 Feb 2017 18:55:06 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1KIt35W015423; Mon, 20 Feb 2017 13:55:04 -0500
Date: Mon, 20 Feb 2017 19:55:00 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170220195500.332a4844@nial.brq.redhat.com>
In-Reply-To: <CAFEAcA9JWzUEmGa2Wxd5xPE4dVknOKBkt=wMda7CAgxzrgOc+w@mail.gmail.com>
References: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
	<CAFEAcA9JWzUEmGa2Wxd5xPE4dVknOKBkt=wMda7CAgxzrgOc+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 20 Feb 2017 18:55:06 +0000 (UTC)
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hNgdIig+QayV

On Fri, 17 Feb 2017 19:05:20 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 17 February 2017 at 18:56, Igor Mammedov <imammedo@redhat.com> wrote:
> > Some callers call CPUClass->parse_features manually to convert
> > '-cpu cpufoo,featurestr' string to cpu type and featurestr
> > into a set of global properties. And theni do controlled
> > cpu creation with setting properties and completing it with realize.
> > That's a lot of code duplication as they are practically
> > reimplement the same parsing logic.
> >
> > Some don't and use cpu_generic_init() instead which does
> > the same parsing along with creation/realizing cpu within one
> > wrapper.
> >
> > And some trying to switch to controlled cpu creation,
> > implement object_new()/set properties/realize steps
> > but forget feature parsing logic witch lieads to 'bugs'
> > commit 00909b585 (hw/arm/integratorcp: Support specifying features via -cpu)
> >
> >
> > This series moves -cpu option parsing to generic machine code
> > that removes a little of code duplication and makes cpus creation
> > process more unified.  
> 
> This API seems a little awkward for the SoC case, where
> the board model doesn't actually know what the default
> CPU model or the valid CPU models are, because it just
> wants to say "create me a BCM2836 SoC" and let the SoC
> object deal with determining whether it's always a cortex-a15
> or if it might allow some user configurability either in
> cpu choices or in optional flags.
> Any thoughts about that use case?
I've probably been too aggressive trying to force
conversion of all boards, assuming that all boards support
"-cpu CLI" option, currently option could be specified for
any board but it is ignored if board doesn't care
about it explicitly.

 "-cpu cpu_name,feat_str" handling is always based on
 availability of base CPU type supported by target as
 it's needed both for
   - translating cpu_name to QOM CPU type
       cpu_class_by_name(typename, name)
   - converting feat_str into set of global properties
     for matching QOM CPU type
       cc->parse_features(object_class_get_name(oc), featurestr, &err);

Boards that don't care/need '-cpu' support won't need
to do anything as we can skip cpu_name,feat_str parsing
if MachineClass::base_cpu_type isn't set (NULL by default),
that way we won't break ignored CLI if we care.
And currently we don't have convenient way to disable
feat_str parsing, but machine could be extended
with flag to [en|dis]able it explicitly.

The goal of this series is generalizing/consolidating
parsing of '-cpu' for boards that use it, removing
code duplication scattered around codebase and trying
normalize default cpu_model initialization.

For SoC with fixed CPU type it would be better to use
directly CPU type names directly but that hits legacy
cpu_init()/cpu_foo_init() wall, which is currently
cpu_model based and would be a lot of re-factoring.
I would convert cpu_init(cpu_model) to cpu_init(cpu_type)
and call '-cpu' handling logic from generic
machine/user_[bsd|linux] code (3 places in total).

> (The stm32f205 SoC object has a "cpu-model" QOM property
> that the board sets, but I think that's as much because
> we somewhat awkwardly need to pass it into armv7m_init()
> as a deliberate design choice.)
its sole user netduino2 board has cpu_model hardcodded
at board level which could be left alone or converted
to this API. Using API would make code more consistent
at the cost of more code for default/valid callbacks.

> 
> thanks
> -- PMM

