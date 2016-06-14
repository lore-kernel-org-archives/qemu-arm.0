Received: by 10.25.21.96 with SMTP id l93csp98931lfi;
        Tue, 14 Jun 2016 07:05:48 -0700 (PDT)
X-Received: by 10.200.40.181 with SMTP id i50mr19221237qti.89.1465913148646;
        Tue, 14 Jun 2016 07:05:48 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13si8800974qtr.72.2016.06.14.07.05.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 07:05:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35526 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCoyS-0003FT-1k
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 10:05:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bCowP-0001WP-SQ
	for qemu-devel@nongnu.org; Tue, 14 Jun 2016 10:03:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bCowO-00051N-Le
	for qemu-devel@nongnu.org; Tue, 14 Jun 2016 10:03:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56993)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bCowJ-0004zv-HR; Tue, 14 Jun 2016 10:03:35 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7A8C461E2;
	Tue, 14 Jun 2016 14:03:34 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5EE3U3a013091
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 14 Jun 2016 10:03:32 -0400
Date: Tue, 14 Jun 2016 16:03:29 +0200
From: Andrew Jones <drjones@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160614140329.6oz6mzlgs4gswjls@hawk.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-7-git-send-email-drjones@redhat.com>
	<d4b656c3-757d-7922-bd1b-38b4101a4519@redhat.com>
	<20160613203529.6ln7dlgnrcgda5x4@hawk.localdomain>
	<60ee196d-0292-3fb4-5d59-68c2d742eaa4@redhat.com>
	<20160614113904.2u5qvf7kasv5hact@hawk.localdomain>
	<c1f094e3-c41b-88d3-9bf2-91b334d9513a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1f094e3-c41b-88d3-9bf2-91b334d9513a@redhat.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 14 Jun 2016 14:03:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH RFC 06/16] vl: move smp parsing to machine
 pre_init
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	imammedo@redhat.com, dgibson@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VHJr6cqLLTRd

On Tue, Jun 14, 2016 at 01:53:05PM +0200, Paolo Bonzini wrote:
> 
> 
> On 14/06/2016 13:39, Andrew Jones wrote:
> > On Tue, Jun 14, 2016 at 10:17:49AM +0200, Paolo Bonzini wrote:
> >> On 13/06/2016 22:35, Andrew Jones wrote:
> >>> On Mon, Jun 13, 2016 at 07:04:01PM +0200, Paolo Bonzini wrote:
> >>>> On 10/06/2016 19:40, Andrew Jones wrote:
> >> They should just not specify it and get a default of 1. ;)
> > 
> > Yeah, threads, the only one we should never calculate, could be
> > optional. If not specified, defaulting to 1 makes perfect sense.
> > But, threads=0, which is weird, but in a way specifying that it's
> > not specified, also makes some sense.
> 
> If it's weird, let's make it invalid. :)

I'm weird, and starting to like it :-)

> 
> >>>> - cpus % (cores * threads) != 0
> >>>
> >>> Hmm. This makes sense where cpus is the number of cpu packages,
> >>
> >> I'm not sure I understand what you mean here.  The point is that the
> >> machine starts with an integral number of sockets.
> > 
> > OK, s/cpus/maxcpus/ then. By using the currently online number, I
> > thought you were starting to prepare for cpu packages, which are
> > indivisible sets of cores and threads.
> 
> Yes, that's what I meant to do.  Isn't cpus what you call
> "total-online-threads" below?

It is. I was thinking it may need to be redefined if we wanted to
hotplug these "indivisible sets of cores and threads" (sockets),
instead of what we do today, which is to hotplug one "cpu" at a time.
However, I just chatted with Igor, and he says cpu hotplug operates
on logical processors, and thus it's fine to talk about hotplugging
threads. Even real hardware does this. Real hardware will plug a
socket full of threads, but then the firmware may keep most of them
disabled until they're "hotplugged". So, I think the value of cpus
can be anything. Even the useless value of zero.

> 
> > But now that I think about
> > it, cpus % (cores * threads) isn't right for that either. It should
> > be total-online-threads % (cores * threads) != 0
> > 
> >> [...] you could just specify -machine cpus=16,maxcpus=32 and expect 1
> >> core/socket, 1 thread/core, and 16 to 32 sockets.
> > 
> > Or 32 cores/socket (only 16 populated), 1 thread/core
> 
> Does that make sense?  How do you "populate" parts of a socket lazily? I
> know it's all virtual, but... ;)

In real hardware that would be a socket of 32 cores, 16 disabled.
Hotplug can then enable them one at a time.

> 
> >> Though I think that we can at least agree on defaults for threads,
> >> maxcpus and cpus.  The only sticky point is sockets vs. cores.  We can
> >> make them both mandatory for now.  That is: cores and sockets are
> >> mandatory until we decide which one to default to 1; threads is
> >> optional; cpus is mandatory if you want hotplug, otherwise it's
> >> redundant; maxcpus is optional and always redundant.
> > 
> > Agreed. I'll do the following for the next round of this series
> > 
> >  threads: 1
> >  cores:   required
> >  sockets: required
> >  maxcpus: maxcpus ? maxcpus : sockets * cores * threads
> >  cpus:    cpus ? cpus : maxcpus
> > 
> > If maxcpus is input, it's redundant, but should be sanity checked.
> > Maybe the user wants to use the QEMU cmdline to check their math...
> 
> Yes, all this is fine.  As to the checks, here's my list:
> 
> >>> - any argument < 1
> >>> - any argument > some compile-time value (1024?) to avoid overflows
> >>> - cpus % (cores * threads) != 0
> >>> - cpus > sockets * cores * threads
> >>> - maxcpus != cores * threads * sockets
> 
> ?  The second, fourth and fifth are fine, and IMO the first too.  What
> about the "integral package" check?   It needs to be disabled with some
> ugly global when using -smp, but apart from that I believe it's better
> to have it.

I'd keep =0 allowed. In most cases it just means =1, same as if the
property wasn't input. In some cases, cpus,maxcpus it creates a
useless machine, but maybe could accelerate QEMU runs for the purpose
of probing? Eh, it probably adds more complication than necessary...

Considering cpus should mean logical processors, I think that can
have any value on (0, maxcpus]

Thanks,
drew
