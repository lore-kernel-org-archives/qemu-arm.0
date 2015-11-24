Received: by 10.182.158.201 with SMTP id ww9csp2302319obb;
        Tue, 24 Nov 2015 12:52:44 -0800 (PST)
X-Received: by 10.31.138.74 with SMTP id m71mr28884038vkd.70.1448398364195;
        Tue, 24 Nov 2015 12:52:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n141si5123773vkd.179.2015.11.24.12.52.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Nov 2015 12:52:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41322 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1KZv-0007Ou-S7
	for alex.bennee@linaro.org; Tue, 24 Nov 2015 15:52:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a1KZt-0007No-Sk
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 15:52:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a1KZs-0001GQ-Of
	for qemu-arm@nongnu.org; Tue, 24 Nov 2015 15:52:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54307)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a1KZs-0001G3-Ho; Tue, 24 Nov 2015 15:52:40 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id B412A32B71E;
	Tue, 24 Nov 2015 20:52:39 +0000 (UTC)
Received: from hawk.localdomain (ovpn-116-38.ams2.redhat.com [10.36.116.38])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAOKqWLT000814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 24 Nov 2015 15:52:36 -0500
Date: Tue, 24 Nov 2015 15:52:31 -0500
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151124205231.GA4383@hawk.localdomain>
References: <1447944817-13286-1-git-send-email-drjones@redhat.com>
	<1447944817-13286-6-git-send-email-drjones@redhat.com>
	<CAFEAcA-NJUUQnOiXzZJ22NSh5AsiSzmHSvPLwzDQPxkCYba-Hg@mail.gmail.com>
	<20151120214121.GC20402@hawk.localdomain>
	<20151121150537.GA3701@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151121150537.GA3701@hawk.localdomain>
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
X-TUID: dsWnfW1vAW8H

On Sat, Nov 21, 2015 at 10:05:37AM -0500, Andrew Jones wrote:
> On Fri, Nov 20, 2015 at 04:41:21PM -0500, Andrew Jones wrote:
> > On Fri, Nov 20, 2015 at 06:19:14PM +0000, Peter Maydell wrote:
> > > On 19 November 2015 at 14:53, Andrew Jones <drjones@redhat.com> wrote:
> > > > +
> > > > +    if (is_a64(env)) {
> > > 
> > > Are you really sure you want the core dump format to depend on
> > > whether the CPU happens to be in 32-bit or 64-bit format at
> > > the point in time we write it out? (Consider a 64-bit kernel
> > > which happens to be running a 32-bit userspace binary.)
> > 
> > I simply forgot to consider the case where a 64-bit kernel would
> > run a 32-bit userspace binary. I'm actually quite sure we would
> > want 64-bit in that case, as crash is the only tool we're able to
> > generate dumps for at this time (gdb requires the 'paging' option
> > of dump-guest-memory to work). Is there something in the env I can
> > look at to determine that we have a 64-bit kernel? (Sorry for being
> > lazy and just asking, rather than reading...)
> 
> Duh, I momentarily forgot about arm_el_is_aa64(env, 1). I see we unset
> ARM_FEATURE_AARCH64 in aarch64_cpu_set_aarch64, so that should work
> fine for our 32bit guests on 64bit hosts.
> 
> > > > +    if (is_a64(env)) {
> > > > +        info->d_machine = EM_AARCH64;
> > > > +        info->d_class = ELFCLASS64;
> > > > +        if (cur_el == 0) {
> > > > +            be = (env->cp15.sctlr_el[1] & SCTLR_E0E) != 0;
> > > > +        } else {
> > > > +            be = (env->cp15.sctlr_el[cur_el] & SCTLR_EE) != 0;
> > > > +        }
> > > 
> > > Again, are you sure you want the core dump format to depend on
> > > whether we currently happen to be executing a BE userspace
> > > process?
> > 
> > We'll want to match the kernel. Hopefully we can determine it.
> 
> Here's a bigger, duh. I guess I just need to drop all the cur_el
> stuff and stick to el==1.
> 
> I'll wait to hear back on the 'should we add ptrace.h to linux-headers',
> and 'should we add floating point registers, even though crash won't
> care' questions before sending a v2.

Hi Peter,

I've pulled a v2 together that I'll be testing and posting soon. Here's
what I decided to do

1) Throw the fp registers in. Why not?
2) No linux-headers update, as we'd also need 
   include/uapi/linux/elfcore.h and arch/arm/include/asm/user.h.
   However I've added comments stating where the structs come from.
3) Base the vmcore type on the guest kernel, i.e. use arm_el_is_aa64()
   and (env->cp15.sctlr_el[1] & SCTLR_EE). However,
   aarch64_write_elf64_note() will shoehorn 32-bit state into 64-bit
   elf notes when the current state is 32-bit. Those analyzing the
   dumps will need to look at the captured pstate to determine the
   endianness of the registers.

How does that sound?

Thanks,
drew
