Received: by 10.25.85.209 with SMTP id j200csp1393453lfb;
        Mon, 13 Jun 2016 13:35:54 -0700 (PDT)
X-Received: by 10.140.84.42 with SMTP id k39mr15482269qgd.21.1465850152841;
        Mon, 13 Jun 2016 13:35:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d187si16261424qkf.188.2016.06.13.13.35.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 13:35:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59120 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCYaO-0008Mx-8e
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 16:35:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bCYaH-0008Jr-B2
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 16:35:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bCYaD-0001Qi-27
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 16:35:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49436)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bCYaC-0001QP-PQ; Mon, 13 Jun 2016 16:35:40 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AC0E7AE94;
	Mon, 13 Jun 2016 20:35:39 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-22.brq.redhat.com [10.40.204.22])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5DKZUZd020563
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 13 Jun 2016 16:35:34 -0400
Date: Mon, 13 Jun 2016 22:35:29 +0200
From: Andrew Jones <drjones@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160613203529.6ln7dlgnrcgda5x4@hawk.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-7-git-send-email-drjones@redhat.com>
	<d4b656c3-757d-7922-bd1b-38b4101a4519@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4b656c3-757d-7922-bd1b-38b4101a4519@redhat.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 13 Jun 2016 20:35:39 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	imammedo@redhat.com, dgibson@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VREdi3ZSoUZX

On Mon, Jun 13, 2016 at 07:04:01PM +0200, Paolo Bonzini wrote:
> 
> 
> On 10/06/2016 19:40, Andrew Jones wrote:
> > +    if (sockets == -1 || cores == -1 || threads == -1 ||
> > +        maxcpus == -1 || cpus == -1) {
> > +        error_report("cpu topology: "
> > +                     "all machine properties must be specified");
> > +        exit(1);
> > +    }
> > +
> 
> I think it's sane to accept some defaults.  It must not be the DWIM

I agree requiring all these properties means a lot of typing, but I'm
not sure we want to calculate defaults. Reasoning below

> thing that -smp does (which is targeted to Windows's dislike of
> multi-socket machine on consumer hardware).  It must be something that
> makes sense, and my proposal is:
> 
> - threads: 1
> - cores: 1
> - sockets:
>   - maxcpus / (cores * threads) if maxcpus given
>   - cpus / (cores * threads) if cpus given
>   - else 1
> - maxcpus: cores * threads * sockets
> - cpus: maxcpus

I think some machines may prefer

- threads: 1
- sockets: 1
- cores:
  - maxcpus / (sockets * threads) if maxcpus given
  - cpus / (sockets * threads) if cpus given
  - else 1

> 
> This is a simple, linear logic that assigns defaults to each argument in
> sequence.  At the same time -machine should fail for all invalid
> combinations, namely:
> 
> - any argument < 1

What if a user says threads=0, because they don't have HT, and assume
that a value of zero will get them a non-HT system? Or what about
machines that don't describe sockets, so a user inputs zero? In both
those cases I agree we should just use 1, but from a user's perspective,
it might seem weird.

> - any argument > some compile-time value (1024?) to avoid overflows

Agreed. We should do this regardless of this series.

> - cpus % (cores * threads) != 0

Hmm. This makes sense where cpus is the number of cpu packages,
but I guess that's not how things currently work. Maybe Igor's
work is changing that?

> - cpus > sockets * cores * threads
> - maxcpus != cores * threads * sockets

We check these two (the 2nd added with this series) already.

> 
> Alone the last relation shows that requiring all four of maxcpus, cores,
> threads and sockets is unnecessary. :)

Not really. It depends on if you assume sockets, cores or threads to
be the N in maxcpus=N. We could just require sockets, cores, and threads
to be input, which allows us to easily calculate maxcpus, and then set
cpus from that. In that case maxcpus would just be an available input
for sanity checking.

> 
> This will catch situations where assigning a default for sockets doesn't
> work well.  For example cores=2,cpus=4,maxcpus=5 will assign
> threads=1,sockets=2; then the last relation will fail and QEMU will give
> an error.
> 
> These invalid combination also make sure that other useful default cases
> work.  For example "maxcpus given, sockets and cpus not" works thanks to
> the following deduction:
> 
> - sockets = cpus/(cores*threads)
> - maxcpus = cores*threads*sockets
> - because cpus%(cores*threads) must be 0, this gives maxcpus=cpus
> 
> -smp should do its legacy magic and assign all five values based on it.
> If the results do not match the obvious s/smp/-machine/ command line it
> should warn, and perhaps suggest the equivalent -machine command line.
> It doesn't have to be a minimal command line, just equivalent.

This is a good idea. I'm just still not sure what the -machine command
line should/should not assume. I'm still leaning towards nothing, but
at least maxcpus and cpus could be optional, making it just 3 required
inputs. And, machines are free to override this, allowing -machine
MACHINE,cpus=N to generate their default topology supporting N cpus,
maxcpus also =N. Or, -machine MACHINE,maxcpus=N,cpus=M for their common
hotplug-enabling case.

> 
> Apart from this point, these are lovely patches. :)

Thanks!

drew
