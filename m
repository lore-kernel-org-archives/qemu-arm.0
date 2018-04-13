Received: by 10.28.71.155 with SMTP id m27csp788927wmi;
        Fri, 13 Apr 2018 06:59:40 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+o5zUaN7pLcarzbz7OlRC8/JCT4INN94HZUd01oJiDoABc1vByC0DnNICPXXg9kX+V9gdf
X-Received: by 10.129.98.197 with SMTP id w188mr4587581ywb.246.1523627980642;
        Fri, 13 Apr 2018 06:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523627980; cv=none;
        d=google.com; s=arc-20160816;
        b=aDFr6Io1VmYX/BfNxYOh1pZOAvW72a9khzHR2R0Jx5riN3xJmwlrlhFLDc8RK//fdq
         uF2ofAt7WOI2iXHm5+YjW4sOC8hY8EHPqakb04+7avMRsLkvWv8FrhnEoRF+zX6WIesg
         8fXFlITcyH8bqXDBll0QMtD+YNrWcbN5gnD8nJ+ULet241xFtFjPopJ5cKE0+7b/coRc
         dpGrxz/pbRndpyCov7krvqlDnOwp2J7m+n5PokhKU9QhgSdL9xdGcmAX8ZYfQFJuqh5M
         IEDR3RjQcuD9RNBgoN0X7l6EnsN0KBsFCvYKpyf5bD3nQh/gmReKEv2kI5bicm2fyv6h
         0TdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=q92iEP6846i6MVedyqtfNctO7bWU+MMYa9a0Dpyabl4=;
        b=OvuT3ftVTRoHn6gdPAJihaDpvQ+SYuTDN95aB73Yf2csr7EKXzH40ko7EmuXI0bCGX
         hTN53D2rJe/C42J4BQljvvaQF7WBP1Ba/tGXKnXdL4MRTHOavHM4+ZsQGUqO3YYbD6lS
         apu/4ecwL/w/mxbZyP6MrDpVFqg4hWShOAu523B5BAC4I0NhBX4AGN5L97Rzdu1OxN5K
         ZophNVuAUVn6RCHibyJg+XBmwrMDDKxFY/7Ubz3STf1FDtbxEpd35G0y8egUcnThtiaO
         q3BrJYnqaB+ja/uUlxqT/41/u1kmkGp0JnVzJjn2gogMl02bbQRGXp/4ZanBhaEgn45R
         X8pA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x48si1798458qtc.355.2018.04.13.06.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 06:59:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6zEq-0007uc-5B
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 09:59:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f6zEL-0007si-4G
	for qemu-devel@nongnu.org; Fri, 13 Apr 2018 09:59:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1f6zEK-00051R-9X
	for qemu-devel@nongnu.org; Fri, 13 Apr 2018 09:59:09 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:32814 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1f6zEI-00050Q-1H; Fri, 13 Apr 2018 09:59:06 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A1704027CCA;
	Fri, 13 Apr 2018 13:59:05 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D863D7DF9;
	Fri, 13 Apr 2018 13:59:02 +0000 (UTC)
Date: Fri, 13 Apr 2018 15:59:01 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180413155901.45a02b95@redhat.com>
In-Reply-To: <CAFEAcA-AVuHMao5kQUrfEYWpGL0y-CwbuqCA_8ZSZrVbqz9nCg@mail.gmail.com>
References: <1523551221-11612-1-git-send-email-imammedo@redhat.com>
	<1523551221-11612-4-git-send-email-imammedo@redhat.com>
	<CAFEAcA-AVuHMao5kQUrfEYWpGL0y-CwbuqCA_8ZSZrVbqz9nCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 13 Apr 2018 13:59:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 13 Apr 2018 13:59:05 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH for-2.13 3/4] arm: always start
 from first_cpu when registering loader cpu reset callback
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VrFnpxxGOiWT

On Thu, 12 Apr 2018 19:29:28 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 12 April 2018 at 17:40, Igor Mammedov <imammedo@redhat.com> wrote:
> > if arm_load_kernel() were passed non first_cpu, QEMU would end up
> > with partially set do_cpu_reset() callback leaving some CPUs without it.
> >
> > Make sure that do_cpu_reset() is registered for all CPUs by enumerating
> > CPUs from first_cpu.
> >
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  hw/arm/boot.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index 2f464ca..2591fee 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -1188,7 +1188,7 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
> >       * actually loading a kernel, the handler is also responsible for
> >       * arranging that we start it correctly.
> >       */
> > -    for (cs = CPU(cpu); cs; cs = CPU_NEXT(cs)) {
> > +    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
> >          qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
> >      }
> >  }  
> 
> Definitely a bug fix, so:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> I think though that in at least some cases we'll still mishandle
> being passed anything other than first_cpu as the CPU pointer,
> because in do_cpu_reset() we do some checks for "do this if
> cs == first_cpu", on the assumption that first_cpu is the
> primary CPU that we're booting. We should instead I suppose
> be checking against the CPU pointer we're given as the
> arm_load_kernel() argument (which I think do_cpu_reset() can
> get at via info->load_kernel_notifier.cpu).
Agreed,
only that load_kernel_notifier is being removed in 4/4,
but nothing prevents us from adding pointer to arm_boot_info directly.

> We should probably analyse which boards actually pass anything
> other than first_cpu -- I suspect it will end up just being
> the xilinx board which has both A and R profile cores...
Probably,
I've managed to stop myself digging deeper into reset handling for now,
and deal with firmware blobs regeneration first.
I still might have to look back at do_cpu_reset() later
if it proves to be in a way of cpu hotplug but not just yet.


> thanks
> -- PMM

