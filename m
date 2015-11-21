Received: by 10.182.158.201 with SMTP id ww9csp458923obb;
        Sat, 21 Nov 2015 07:05:54 -0800 (PST)
X-Received: by 10.31.178.84 with SMTP id b81mr6538635vkf.121.1448118354370;
        Sat, 21 Nov 2015 07:05:54 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u133si4896200vkd.49.2015.11.21.07.05.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Nov 2015 07:05:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a09je-0004QK-34
	for alex.bennee@linaro.org; Sat, 21 Nov 2015 10:05:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a09jb-0004Mp-JB
	for qemu-arm@nongnu.org; Sat, 21 Nov 2015 10:05:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1a09jW-00074k-EE
	for qemu-arm@nongnu.org; Sat, 21 Nov 2015 10:05:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40090)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1a09jW-00074Z-8R; Sat, 21 Nov 2015 10:05:46 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id E0174C0F3005;
	Sat, 21 Nov 2015 15:05:44 +0000 (UTC)
Received: from hawk.localdomain (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tALF5cJv029700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sat, 21 Nov 2015 10:05:41 -0500
Date: Sat, 21 Nov 2015 10:05:37 -0500
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20151121150537.GA3701@hawk.localdomain>
References: <1447944817-13286-1-git-send-email-drjones@redhat.com>
	<1447944817-13286-6-git-send-email-drjones@redhat.com>
	<CAFEAcA-NJUUQnOiXzZJ22NSh5AsiSzmHSvPLwzDQPxkCYba-Hg@mail.gmail.com>
	<20151120214121.GC20402@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151120214121.GC20402@hawk.localdomain>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
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
X-TUID: VCpUyH6EO27s

On Fri, Nov 20, 2015 at 04:41:21PM -0500, Andrew Jones wrote:
> On Fri, Nov 20, 2015 at 06:19:14PM +0000, Peter Maydell wrote:
> > On 19 November 2015 at 14:53, Andrew Jones <drjones@redhat.com> wrote:
> > > +
> > > +    if (is_a64(env)) {
> > 
> > Are you really sure you want the core dump format to depend on
> > whether the CPU happens to be in 32-bit or 64-bit format at
> > the point in time we write it out? (Consider a 64-bit kernel
> > which happens to be running a 32-bit userspace binary.)
> 
> I simply forgot to consider the case where a 64-bit kernel would
> run a 32-bit userspace binary. I'm actually quite sure we would
> want 64-bit in that case, as crash is the only tool we're able to
> generate dumps for at this time (gdb requires the 'paging' option
> of dump-guest-memory to work). Is there something in the env I can
> look at to determine that we have a 64-bit kernel? (Sorry for being
> lazy and just asking, rather than reading...)

Duh, I momentarily forgot about arm_el_is_aa64(env, 1). I see we unset
ARM_FEATURE_AARCH64 in aarch64_cpu_set_aarch64, so that should work
fine for our 32bit guests on 64bit hosts.

> > > +    if (is_a64(env)) {
> > > +        info->d_machine = EM_AARCH64;
> > > +        info->d_class = ELFCLASS64;
> > > +        if (cur_el == 0) {
> > > +            be = (env->cp15.sctlr_el[1] & SCTLR_E0E) != 0;
> > > +        } else {
> > > +            be = (env->cp15.sctlr_el[cur_el] & SCTLR_EE) != 0;
> > > +        }
> > 
> > Again, are you sure you want the core dump format to depend on
> > whether we currently happen to be executing a BE userspace
> > process?
> 
> We'll want to match the kernel. Hopefully we can determine it.

Here's a bigger, duh. I guess I just need to drop all the cur_el
stuff and stick to el==1.

I'll wait to hear back on the 'should we add ptrace.h to linux-headers',
and 'should we add floating point registers, even though crash won't
care' questions before sending a v2.

Thanks,
drew
