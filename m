Received: by 10.25.208.211 with SMTP id h202csp2391799lfg;
        Wed, 23 Mar 2016 03:31:46 -0700 (PDT)
X-Received: by 10.55.221.200 with SMTP id u69mr2291348qku.0.1458729106689;
        Wed, 23 Mar 2016 03:31:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a19si1620860qha.48.2016.03.23.03.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 03:31:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aig4o-0000Xq-6G
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 06:31:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <christoffer.dall@linaro.org>) id 1aig4k-0000XT-Oh
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 06:31:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <christoffer.dall@linaro.org>) id 1aig4h-0001yO-Di
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 06:31:42 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:35325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <christoffer.dall@linaro.org>) id 1aig4g-0001xZ-Pv
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 06:31:39 -0400
Received: by mail-wm0-x22d.google.com with SMTP id l68so189093586wml.0
	for <qemu-arm@nongnu.org>; Wed, 23 Mar 2016 03:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6Z6+Kij8bMLnxpjo/aHm+HMoYbzczwONCvUP53HeQTU=;
	b=JjqNrqb3gHnt2cpumIHAoP9o7+WVR6jqnH+/ZHUW8439aBJzFNDIh3QT9XSVeHNzMM
	H6+rMgAbsXXzjZyILflc9LosKwHY6EV0Q4P8EwFd9qUr30ZB8vi42kzFk7vcE0UgwX65
	wWWyWrROZqBQ5iGt0dUI63DJ/a4XrhlfAXDuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6Z6+Kij8bMLnxpjo/aHm+HMoYbzczwONCvUP53HeQTU=;
	b=HdbLeX2AAE56HOpCOBKRZX4AERHHOxaijfuha3idjhRb+RJB3RZH05lR6lcmZqtCvQ
	ib1XNhM4NEGAtm6C5dxtpG4aQWpAnEfaalFJ94fnBsYzTWrq6gpRDVQq9mR5/Xx5tfqt
	CMObZA96zpI1MyyBTYbHoTZQV2R3rMjUTcww0W5TnQZuwi8mK6UbUYf+BdM7Z1+yaw6B
	JzrcmnGDhdx0tBwV3jFaY0XD+DloKtgNwlTJATW+czv20ZLrKnTRVD7qC0ilqeu1s0bb
	JNY3nwzEWpbKrHIL5LAtz95mFc0vkLGbW67wbueq08Nhwj1OujOe5a/iaKBoStFXaJhP
	z3yQ==
X-Gm-Message-State: AD7BkJIhcAt9FRvZY2QzxSTqw/avmtgiK89e9pbLXA2T0dji1W9HSvR7KOPdgLTmOPoItL7m
X-Received: by 10.194.111.229 with SMTP id il5mr2787322wjb.82.1458729097833;
	Wed, 23 Mar 2016 03:31:37 -0700 (PDT)
Received: from localhost ([94.18.191.146]) by smtp.gmail.com with ESMTPSA id
	w203sm2240445wmg.14.2016.03.23.03.31.36
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 03:31:37 -0700 (PDT)
Date: Wed, 23 Mar 2016 11:32:06 +0100
From: Christoffer Dall <christoffer.dall@linaro.org>
To: Peter Xu <peterx@redhat.com>
Message-ID: <20160323103206.GA12472@cbox>
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1458711153-15988-1-git-send-email-peterx@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Cc: peter.maydell@linaro.org, drjones@redhat.com, libvir-list@redhat.com,
	armbru@redhat.com, qemu-devel@nongnu.org,
	mdroth@linux.vnet.ibm.com, qemu-arm@nongnu.org, abologna@redhat.com
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 0/4] ARM: add
 query-gic-capabilities SMP command
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
X-TUID: Bs2BgsrqieHE

Hi Peter,

Stupid question: The subject says "SMP command".  Did you mean "QMP
command" ?

Thanks,
-Christoffer

On Wed, Mar 23, 2016 at 01:32:29PM +0800, Peter Xu wrote:
> v6 changes:
> - patch 1 (squashed into patch 2)
>   - explain more about the following in commit message: why we need
>     this command, and what does the entries mean [Markus]
>   - explain what GIC is [Eric]
>   - squash this patch into patch 2 [Eric]
> - patch 2 (new patch 1)
>   - fix "does not implement" english error [Eric]
>   - remove useless headers in target-arm/monitor.c [Markus]
>   - remove this command from whitelist [Markus, Eric]
>   - return dict rather than array, with single key points to the
>     original array results [Markus, Eric]
> - patch 5 (new patch 4)
>   - tiny change in implementation to suite the new interface.
> 
> v5 changes:
> - patch 2: moved to target-arm/monitor.c (from target-arm/machine.c)
>            [Peter]
> - patch 3: splitted into three patches: [all from Peter's comments]
>   - patch 3 (new): leverage kvm_arm_create_scratch_host_vcpu(), tiny
>     enhancement of old one to suite our need
>   - patch 4: introduce kvm_support_device() in kvm-all.c
>   - patch 5: do the implementation.
> 
> v4 changes:
> - all: rename query-gic-capability to query-gic-capabilities [Andrea]
> - patch 3: rename helper function to kvm_support_device, make it
>   inline and lighter. [Drew]
> 
> v3 changes:
> - patch 2: remove func declaration, add qmp header [Drew]
> - patch 3: being able to detect KVM GIC capabilities even without
>   kvm enabled [Andrea]: this is a little bit hacky, need some more
>   review on this.
> 
> v2 changes:
> - result layout change: use array and dict for the capability bits
>   rather than a single array of strings [Andrea/Markus]
> - spelling out what GIC is in doc [Eric]
> 
> This patch is to add ARM-specific command "query-gic-capability".
> 
> The new command can report which kind of GIC device the host/QEMU
> support. The returned result is in the form of array.
> 
> Sample command and output:
> 
> {"execute": "query-gic-capability"}
> {"return": [{"emulated": false, "version": 3, "kernel": false},
>             {"emulated": true, "version": 2, "kernel": true}]}
> 
> Testing:
> 
> Smoke tests on both x86 (emulated) and another moonshot ARM server.
> 
> Peter Xu (4):
>   arm: qmp: add query-gic-capabilities interface
>   arm: enhance kvm_arm_create_scratch_host_vcpu
>   kvm: add kvm_support_device() helper function
>   arm: implement query-gic-capabilities
> 
>  include/sysemu/kvm.h     |  9 +++++
>  kvm-all.c                | 15 +++++++++
>  monitor.c                |  8 +++++
>  qapi-schema.json         | 50 ++++++++++++++++++++++++++++
>  qmp-commands.hx          | 28 ++++++++++++++++
>  target-arm/Makefile.objs |  2 +-
>  target-arm/kvm.c         | 10 +++++-
>  target-arm/kvm_arm.h     |  6 ++--
>  target-arm/monitor.c     | 86 ++++++++++++++++++++++++++++++++++++++++++++++++
>  9 files changed, 210 insertions(+), 4 deletions(-)
>  create mode 100644 target-arm/monitor.c
> 
> -- 
> 2.4.3
> 
> 
