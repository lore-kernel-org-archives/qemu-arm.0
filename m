Received: by 10.25.21.96 with SMTP id l93csp414585lfi;
        Wed, 15 Jun 2016 00:19:28 -0700 (PDT)
X-Received: by 10.140.248.2 with SMTP id t2mr4088385qhc.7.1465975168305;
        Wed, 15 Jun 2016 00:19:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w189si21184149qhw.111.2016.06.15.00.19.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Jun 2016 00:19:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bD56l-0003oI-PV
	for alex.bennee@linaro.org; Wed, 15 Jun 2016 03:19:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bD56c-0003nv-PP
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 03:19:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bD56V-0000Iz-It
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 03:19:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33126)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bD56V-0000Ia-AE; Wed, 15 Jun 2016 03:19:11 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 36DC53B72A;
	Wed, 15 Jun 2016 07:19:10 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-58.brq.redhat.com [10.40.204.58])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5F7J5nb013085
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 15 Jun 2016 03:19:07 -0400
Date: Wed, 15 Jun 2016 09:19:05 +0200
From: Andrew Jones <drjones@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20160615071905.3hoxfoii23rkb7rs@hawk.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-7-git-send-email-drjones@redhat.com>
	<d4b656c3-757d-7922-bd1b-38b4101a4519@redhat.com>
	<20160613203529.6ln7dlgnrcgda5x4@hawk.localdomain>
	<60ee196d-0292-3fb4-5d59-68c2d742eaa4@redhat.com>
	<20160614113904.2u5qvf7kasv5hact@hawk.localdomain>
	<c1f094e3-c41b-88d3-9bf2-91b334d9513a@redhat.com>
	<20160614140329.6oz6mzlgs4gswjls@hawk.localdomain>
	<20160615005108.GT4882@voom.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160615005108.GT4882@voom.fritz.box>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 15 Jun 2016 07:19:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 06/16] vl: move smp parsing
 to machine pre_init
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	agraf@suse.de, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	dgibson@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: umuZghMVbxqt

On Wed, Jun 15, 2016 at 10:51:08AM +1000, David Gibson wrote:
> On Tue, Jun 14, 2016 at 04:03:29PM +0200, Andrew Jones wrote:
> > On Tue, Jun 14, 2016 at 01:53:05PM +0200, Paolo Bonzini wrote:
> > > 
> > > 
> > > On 14/06/2016 13:39, Andrew Jones wrote:
> > > > On Tue, Jun 14, 2016 at 10:17:49AM +0200, Paolo Bonzini wrote:
> > > >> On 13/06/2016 22:35, Andrew Jones wrote:
> > > >>> On Mon, Jun 13, 2016 at 07:04:01PM +0200, Paolo Bonzini wrote:
> > > >>>> On 10/06/2016 19:40, Andrew Jones wrote:
> > > >> They should just not specify it and get a default of 1. ;)
> > > > 
> > > > Yeah, threads, the only one we should never calculate, could be
> > > > optional. If not specified, defaulting to 1 makes perfect sense.
> > > > But, threads=0, which is weird, but in a way specifying that it's
> > > > not specified, also makes some sense.
> > > 
> > > If it's weird, let's make it invalid. :)
> > 
> > I'm weird, and starting to like it :-)
> > 
> > > 
> > > >>>> - cpus % (cores * threads) != 0
> > > >>>
> > > >>> Hmm. This makes sense where cpus is the number of cpu packages,
> > > >>
> > > >> I'm not sure I understand what you mean here.  The point is that the
> > > >> machine starts with an integral number of sockets.
> > > > 
> > > > OK, s/cpus/maxcpus/ then. By using the currently online number, I
> > > > thought you were starting to prepare for cpu packages, which are
> > > > indivisible sets of cores and threads.
> > > 
> > > Yes, that's what I meant to do.  Isn't cpus what you call
> > > "total-online-threads" below?
> > 
> > It is. I was thinking it may need to be redefined if we wanted to
> > hotplug these "indivisible sets of cores and threads" (sockets),
> > instead of what we do today, which is to hotplug one "cpu" at a time.
> > However, I just chatted with Igor, and he says cpu hotplug operates
> > on logical processors, and thus it's fine to talk about hotplugging
> > threads. Even real hardware does this. Real hardware will plug a
> > socket full of threads, but then the firmware may keep most of them
> > disabled until they're "hotplugged". So, I think the value of cpus
> > can be anything. Even the useless value of zero.
> 
> Uh.. this depends on the platform (machine type).  ACPI allows
> (logical) hotplugging of individual threads.  However on pseries the
> hotplug mechanism works at core granularity only.  I don't know of
> real examples off hand, but it's easy to imagine a platform interface
> which worked at socket, or even a multi-socket-module level
> 
> In other words the "cpu package" doesn't necessarily lie at a fixed
> level of the thread/core/socket heirarchy.
> 
> This is something we're grappling with in trying to implement
> cross-platform cpu hotplug, and we obviously don't want to make it
> worse with these -smp changes.

Right now we're bringing hotplug up in this discussion purely to set
the largest range of inputs for each of the five properties, in
order to do a first pass of sanity checks. If a particular machine
has a stricter range for a given property then it's free to override
pre-init and do what it likes. If pre-init gets used for non-smp
related stuff in the future then we'll make a specific smp-init machine
method, allowing smp init to always be easily overridden by machines.

Thanks,
drew
