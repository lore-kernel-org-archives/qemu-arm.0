Received: by 10.182.158.201 with SMTP id ww9csp2329701obb;
        Tue, 24 Nov 2015 13:45:58 -0800 (PST)
X-Received: by 10.31.180.87 with SMTP id d84mr27093742vkf.83.1448401558049;
        Tue, 24 Nov 2015 13:45:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 84si20147855vkc.42.2015.11.24.13.45.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 13:45:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1LPR-00025H-Jl
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 16:45:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a1LPP-00024y-3w
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 16:45:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a1LPL-0007Vf-OF
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 16:45:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49378)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a1LPL-0007VY-J1; Tue, 24 Nov 2015 16:45:51 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 69A938F4EE;
	Tue, 24 Nov 2015 21:45:50 +0000 (UTC)
Received: from hawk.localdomain (ovpn-116-38.ams2.redhat.com [10.36.116.38])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAOLjiCf030200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 24 Nov 2015 16:45:47 -0500
Date: Tue, 24 Nov 2015 16:45:43 -0500
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151124214543.GB4383@hawk.localdomain>
References: <1447944817-13286-1-git-send-email-drjones@redhat.com>
	<1447944817-13286-6-git-send-email-drjones@redhat.com>
	<CAFEAcA-NJUUQnOiXzZJ22NSh5AsiSzmHSvPLwzDQPxkCYba-Hg@mail.gmail.com>
	<20151120214121.GC20402@hawk.localdomain>
	<20151121150537.GA3701@hawk.localdomain>
	<20151124205231.GA4383@hawk.localdomain>
	<CAFEAcA-E8hkOY05QVkZjzytpqYOYUJ2kDdCMNBjCaZ4A+6wo_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-E8hkOY05QVkZjzytpqYOYUJ2kDdCMNBjCaZ4A+6wo_g@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/5] target-arm: support QMP
 dump-guest-memory
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +aEC8vW2Oapg

On Tue, Nov 24, 2015 at 09:08:29PM +0000, Peter Maydell wrote:
> On 24 November 2015 at 20:52, Andrew Jones <drjones@redhat.com> wrote:
> >
> > I've pulled a v2 together that I'll be testing and posting soon. Here's
> > what I decided to do
> >
> > 1) Throw the fp registers in. Why not?
> > 2) No linux-headers update, as we'd also need
> >    include/uapi/linux/elfcore.h and arch/arm/include/asm/user.h.
> >    However I've added comments stating where the structs come from.
> > 3) Base the vmcore type on the guest kernel, i.e. use arm_el_is_aa64()
> >    and (env->cp15.sctlr_el[1] & SCTLR_EE). However,
> >    aarch64_write_elf64_note() will shoehorn 32-bit state into 64-bit
> >    elf notes when the current state is 32-bit. Those analyzing the
> >    dumps will need to look at the captured pstate to determine the
> >    endianness of the registers.
> 
> Not sure what you have in mind by "endianness of the registers" --
> typically registers aren't thought of as having endianness.

If a processor that was temporarily switched into the opposite endian
had just read a memory address into a register before generating the
core, then the data in that register will be in the format of that
temporary endianness. The person doing the dump analysis will need to
keep in mind that even though they should interpret a crash-tool read of
that same address in the endianness of the core type, the register will
have it swapped. Or maybe I'm wrong about how that should work?

> 
> Also, if we're currently executing a 32-bit guest when we take
> the core dump, you probably need to call aarch64_sync_32_to_64()
> somewhere.

I think we're covered here. We have

dump_init
  cpu_synchronize_all_states
    ... 
      kvm_arch_get_registers
        if (!is_a64(env)) {
            aarch64_sync_64_to_32(env);
        }

Thanks,
drew
