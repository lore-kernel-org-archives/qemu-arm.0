Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1078034wrt;
        Wed, 28 Nov 2018 06:05:33 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UEOv8OVjzsuO6twaTtEVSuPzHrKH9EjerM6GvHv4n0lKVwKIKtoNMbyN/kXAHjBxmMYrfB
X-Received: by 2002:a25:8242:: with SMTP id d2-v6mr36873885ybn.489.1543413933177;
        Wed, 28 Nov 2018 06:05:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543413933; cv=none;
        d=google.com; s=arc-20160816;
        b=pPO4vrX25j4iQxQW7vaGtLh3DGNVtIc+9M8WkEmsy2g/YVD7PjsmRYJN0c7fYYwBIY
         gmiTyziRzT32l+xksn/sFwHpdJVpDnf0CQdvBvfuRQYU+MMllkb6Ek0r08Iac118g346
         41/3mABbxkfqCGOpLegpEkt49kaOtj/VH4MVRZ72PDUXzTVESiT2uOvBwOa63wX9QSni
         ZzFJ8WAyptS4IhehkxrECq+7dkalkWUb8SW714i+ih97bj7GlQeQiDt/IRxVLG/qx0PP
         25nh1RYwakIwsA4AvZTWaoK3ARYUePPJTHgByZZfrysX3I/oIsHuXicaGqn6T5pyaQfB
         RFbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=M1o8CgzRamKSzn0i1mpgXWzoLU+iPD4cl9E6PvFz6XY=;
        b=1HQxLT5ppUMeRE70nrEBz5N9VVk+Y6S7yq+OsKHHnMk5jAMMG5Ng1vEIjvKKLhw4N2
         ZxpF1g0NgQi87CXOLBCAhgfpKQ7Cje6j7qGoqIwNKvOaRtE5KlaYwAygqw0zRK7AP1Hg
         lZOHTqTGP26BMEXVGNeQ0RylcFeCz5g/dy609uu7orLfuDUgFx9tGzCI+laTV0gipu/V
         aT47WwiC8q2HGMvH17+vpTXmiwX6Ip8jD9GLiYQEXh8Qp9tkxKSgMHeosWpp7y28rcym
         6ZLCVTQuaFd0wRJwoaGcpQVT4oVm1qtYm64Yc09LPfKd82xuMu/XKTAg2drOwy9qt/An
         sIwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h184-v6si4718836ybc.239.2018.11.28.06.05.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 06:05:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:47945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gS0T6-0004Qg-4X
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 09:05:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gS0Lk-0007L1-GE
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 08:57:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gS0Lh-0006EX-8B
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 08:57:56 -0500
Received: from mga14.intel.com ([192.55.52.115]:12547)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gS0Lh-0006Dj-0D; Wed, 28 Nov 2018 08:57:53 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Nov 2018 05:57:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,290,1539673200"; d="scan'208";a="113976807"
Received: from bdoyle2-mobl.ger.corp.intel.com (HELO caravaggio)
	([10.251.86.101])
	by fmsmga004.fm.intel.com with ESMTP; 28 Nov 2018 05:57:49 -0800
Date: Wed, 28 Nov 2018 14:57:19 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181128135719.GE4393@caravaggio>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-5-sameo@linux.intel.com>
	<CAFEAcA9wvrnshOTYz-jZ0n6m7SfusYY+bnB-iPnQuVNqqdg5Ww@mail.gmail.com>
	<20181127153551.GC4393@caravaggio>
	<CAFEAcA9B5DPeot26-oGtR-h+xdfg+tmUPrYpKhaneaT1tr1yqQ@mail.gmail.com>
	<20181128104024.GD4393@caravaggio>
	<CAFEAcA-G3_uhH134_n8yobkJQJ7pOvu-vpLe9MkwVp5DmJOeag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-G3_uhH134_n8yobkJQJ7pOvu-vpLe9MkwVp5DmJOeag@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
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
X-TUID: oswfjgJOLbZD

On Wed, Nov 28, 2018 at 11:39:57AM +0000, Peter Maydell wrote:
> On Wed, 28 Nov 2018 at 10:40, Samuel Ortiz <sameo@linux.intel.com> wrote:
> > Given that this piece of code effectively builds a dependency to TCG
> > from the KVM code, I see a few solutions but I need your input here. We
> > could:
> >
> > - Decide we don't want to support --disable-tcg for ARM. We'd then carry
> >   this patch serie from the NEMU code repo. Worst case scenario, at
> >   least for us.
> > - Manage to implement exception injection from userspace without TCG.
> >   Would it even be possible?
> > - Offload exception injections back to the kernel in those cases. I feel
> >   this would be the cleanest solution but may need kernel changes.
> 
> The kernel folk were firmly against 3, IIRC, but you can go
> and have the discussion if you like.
> 
> I don't really see what the problem is. This is just a bit
> of code that's used by both TCG and KVM. Therefore it goes
> in the binary whether TCG is enabled or not. Other functions
> and bits of code are TCG only and therefore don't go in a
> KVM-only binary.
Keeping this code with --disable-tcg means:

Keep arm_cpu_do_interrupt -> Keep check_for_semihosting -> Keep the arm
instruction loading code -> Keep a large chunk of the TCG core code
itself. Does that dependency chain looks fine to you?

Cheers,
Samuel.

