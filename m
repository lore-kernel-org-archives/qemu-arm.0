Received: by 10.25.21.96 with SMTP id l93csp2422865lfi;
        Wed, 22 Jun 2016 04:45:03 -0700 (PDT)
X-Received: by 10.55.197.82 with SMTP id p79mr15137056qki.138.1466595903701;
        Wed, 22 Jun 2016 04:45:03 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o70si5771213qki.85.2016.06.22.04.45.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 04:45:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57400 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFgad-0008Cr-7o
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 07:45:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bFgZ6-0007MK-1o
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 07:43:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1bFgZ4-0000sJ-MV
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 07:43:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54770)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1bFgYz-0000rr-Qt; Wed, 22 Jun 2016 07:43:21 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56577C05FBA7;
	Wed, 22 Jun 2016 11:43:21 +0000 (UTC)
Received: from work-vm (ovpn-116-97.ams2.redhat.com [10.36.116.97])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5MBhH5b022370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 22 Jun 2016 07:43:19 -0400
Date: Wed, 22 Jun 2016 12:43:17 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160622114317.GG2274@work-vm>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 22 Jun 2016 11:43:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 0/6] Runtime pagesize computation
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DsKoZvFnMK4Y

* Peter Maydell (peter.maydell@linaro.org) wrote:
> This set of patches is a development based on the ones from Vijaya:
> the general idea is similar but I have tried to improve the interface
> for defining the page size a bit.  I've also tweaked patches 2 and 3
> to address code review comments.
> 
> The basic idea here is that:
>  * the target CPU implementation has to opt into variable page size
>    by defining TARGET_PAGE_BITS_VARY, and then calling
>    set_preferred_target_page_bits() in its realize function
>    with whatever the CPU as instantiated actually requires
>  * the machine also has to opt in, by specifying a new MachineClass
>    field which states the value they guarantee will be no greater
>    than the preferred page size for any CPU they create
>  * we finalize the decision about page size in cpu_exec_init_all()
>    (and then later attempts to create CPUs which can't cope with
>    that decision are failed)
> 
> I would ideally have liked to finalize things much later, but
> this is in practice hugely difficult because so many things
> (in particular all the address space/memory system code)
> assume the target page size is known.
> 
> Note that setting minimum_page-bits for a machine is a migration
> compatibility break (the RAM migration format assumes both sides
> have the same idea of a page size). Mismatches will probably
> result in an unhelpfully obscure migration failure. (Possibly we
> could have the migration send the page size if it was different
> from TARGET_PAGE_BITS_MIN so we at least got a nice error?)

Yes, that would be a good idea;  how about adding it as a subsection
in the vmstate_configuration (migration/savevm.c); if you only
send it in the case where it's not the existing size then it shouldn't
break any old formats.  That configuration block gets loaded
very early.

Dave

> 
> This could in theory be extended to the user-mode binaries,
> but for the moment I have just required them to define a
> fixed TARGET_PAGE_BITS.
> 
> NB: I have only very lightly tested these and haven't attempted
> to measure performance at all. There is an assert() in the
> definition of TARGET_PAGE_BITS which is good for making sure
> it isn't used before it's valid but not so good for speed.
> 
> thanks
> -- PMM
> 
> 
> Peter Maydell (3):
>   cpu: Support a target CPU having a variable page size
>   target-arm: Make page size a runtime setting
>   hw/arm/virt: Set minimum_page_bits to 12
> 
> Vijaya Kumar K (3):
>   migration: Remove static allocation of xzblre cache buffer
>   exec.c: Remove static allocation of sub_section of sub_page
>   translate-all.c: Compute L1 page table properties at runtime
> 
>  exec.c                 | 47 ++++++++++++++++++++++++++++++++---
>  hw/arm/virt.c          |  2 ++
>  include/exec/cpu-all.h |  8 ++++++
>  include/hw/boards.h    |  7 ++++++
>  include/qemu-common.h  | 13 ++++++++++
>  migration/ram.c        |  4 ++-
>  target-arm/cpu.c       | 24 ++++++++++++++++++
>  target-arm/cpu.h       |  9 ++++---
>  translate-all.c        | 67 +++++++++++++++++++++++++++++++++-----------------
>  vl.c                   | 10 ++++++++
>  10 files changed, 160 insertions(+), 31 deletions(-)
> 
> -- 
> 1.9.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
