Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp865322wrt;
        Wed, 28 Nov 2018 02:42:06 -0800 (PST)
X-Google-Smtp-Source: AJdET5cW15aYGJS5DuaE44ayd/VgjEJpZtw4a2nzYzHlb1O2P3GTSsAcwXtbs5Gptdoa5z00ZfcR
X-Received: by 2002:a81:a887:: with SMTP id f129mr37790703ywh.221.1543401726127;
        Wed, 28 Nov 2018 02:42:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543401726; cv=none;
        d=google.com; s=arc-20160816;
        b=gQiUxAXx8KbjV9aCU3160qEOHswPWisOuqhOmPBXk6ArZyESny5dsjgGB1aNhmD3Z3
         U+LskZHbVikBtFfDdeuRBxdfSSub1CpoGYVPONA0X7S9vqIH5CNlCYKuPD5Vs0M3PTP1
         gvlp7SZV8sfw1TILwkbkXxapNru7Nn4KwDgv3SId21iHwR/Laz3MLA5SPmzdypfzacc1
         7t1cSNJYpuGmQHA/KnSumYsvTn+uz+T8obg7ieB/3++Z9uu7RQkoeF67MRaQroj5gak5
         W27hmP0wsJ/Bb7ZMaloT0GER7QI1QnR1SO6JiBhOjtxWWYirWfKISYGIBZyQDL1wtmgG
         oXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=WIA8ctzq9Mm3h8nS7PYTzcC6IdUEf9HZygH5kNArmc4=;
        b=r+GZ1/EM20KeBZT8ESXOmEaC17T57QpO4SbNJtw248pcsnE5qVyiY3K0fpQX5yw+c9
         TKcVu/1tdQ3XDABRTKJvlJLrs1Y5Hrf4ZYtpM6CWfo27jTdqx7bh84F3IbMBskfY73Ia
         jh1LdN0+wJixS/36avUEavxyuUdFwFCFsOXO5Oq++MT8NSL66sJU5rWAwvi/HGm3QvQs
         bFiepmciiHhXxT83cVCCwqdd0SHhyK9nR7MthSH6546x+Ul9WyC/4h6/MjY8lPHxEi3F
         Olh8NISlh50oE3m3T6Bd+aM04pkj4liq1uQOeRny7CbdwI21o0ivRQanuKjMAEsiHXXp
         ZLSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d67-v6si4593571ybb.324.2018.11.28.02.42.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 02:42:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:46984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRxID-0003Em-4B
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 05:42:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRxHC-0002zW-Oi
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 05:41:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRxH8-00048O-04
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 05:41:02 -0500
Received: from mga01.intel.com ([192.55.52.88]:59983)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gRxH7-00047c-NL; Wed, 28 Nov 2018 05:40:57 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Nov 2018 02:40:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,290,1539673200"; d="scan'208";a="287302242"
Received: from bdoyle2-mobl.ger.corp.intel.com (HELO caravaggio)
	([10.251.86.101])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2018 02:40:54 -0800
Date: Wed, 28 Nov 2018 11:40:24 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181128104024.GD4393@caravaggio>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-5-sameo@linux.intel.com>
	<CAFEAcA9wvrnshOTYz-jZ0n6m7SfusYY+bnB-iPnQuVNqqdg5Ww@mail.gmail.com>
	<20181127153551.GC4393@caravaggio>
	<CAFEAcA9B5DPeot26-oGtR-h+xdfg+tmUPrYpKhaneaT1tr1yqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9B5DPeot26-oGtR-h+xdfg+tmUPrYpKhaneaT1tr1yqQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: Re: [Qemu-devel] [PATCH 04/13] target: arm: Move all interrupt and
 exception handlers into their own file
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cA2CjhUd2KPn

On Tue, Nov 27, 2018 at 03:46:30PM +0000, Peter Maydell wrote:
> On Tue, 27 Nov 2018 at 15:36, Samuel Ortiz <sameo@linux.intel.com> wrote:
> >
> > On Tue, Nov 20, 2018 at 01:45:03PM +0000, Peter Maydell wrote:
> > > What is your plan for dealing with the way that the KVM code
> > > for injecting a breakpoint exception into the guest works
> > > by calling the do_interrupt code ?
> > > (see target/arm/kvm64.c:kvm_arm_handle_debug(),
> > > which calls cc->do_interrupt(cs).) This patch moves those
> > > functions to a file which won't be compiled and a later one
> > > in the series seems to stop cc->do_interrupt being set at all
> > > if CONFIG_TCG is not defined. That will result in QEMU crashing
> > > when it tries to inject an exception, won't it?
> > Yes, indeed.
> > So it seems we need to inject an exception back into the guest when
> > doing hardware assisted debugging and when we have not set any
> > breakpoint from QEMU. So it's essentially handling the debugging from
> > the guest case.
> > Would returning an error when that happens be an acceptable solution? So
> > when building qemu for arm64 with TCG disabled, one would basically no
> > longer be able to debug from the guest.
> 
> I don't think that's a good idea. --disable-tcg shouldn't imply
> "and you lose some features of KVM".
I see your point but as you're certainly aware, at the moment
building with --disable-tcg implies you don't get an ARM QEMU
binary at all. I felt this was an improvement over the current
situation ;)

> This code is used in both TCG
> and KVM, so needs to still be in the binary for KVM.
Given that this piece of code effectively builds a dependency to TCG
from the KVM code, I see a few solutions but I need your input here. We
could:

- Decide we don't want to support --disable-tcg for ARM. We'd then carry
  this patch serie from the NEMU code repo. Worst case scenario, at
  least for us.
- Manage to implement exception injection from userspace without TCG.
  Would it even be possible?
- Offload exception injections back to the kernel in those cases. I feel
  this would be the cleanest solution but may need kernel changes.

Any other suggestions?

Cheers,
Samuel.

