Received: by 10.28.4.212 with SMTP id 203csp2432578wme;
        Mon, 16 Apr 2018 02:21:58 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+OMotG8Q7WI50Z7QuqIwPYzDbBQrF0FZP6AoMRQH6UHLCmqTXkzCPlSi/+go/Yk2T+2brk
X-Received: by 10.237.37.1 with SMTP id v1mr11120959qtc.66.1523870518839;
        Mon, 16 Apr 2018 02:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523870518; cv=none;
        d=google.com; s=arc-20160816;
        b=rSQbF684YXyCPGoUJY/VNgfdKGDKoHnTK1jP5Za11jACI7vV6zeJOVZc1hGRhfYIBg
         ILtVSsJCJqiLjIgoKI9WKZNlrO07CCCut0JxJMNUmlz9ad/8IsseZ0KZ/SEjIx9ucEc0
         1+28Y7+i6JbxOnlncKqUumm5bdZD3NU9Umo+Pqwphqiz86mpPcgV9Bb9rUJHfwgClZB4
         QmrqIk6bKqpgi2fAFgCovflm9uNLqunc+Sy6XEWSruR1d4VDcUfP3hwlp3aG+pqb41x4
         XwQnDL+tDHoszfwiLxJzHfsXXlP9F8UhsbTcqGbkox2ec8B2iaPP/psp7jaYKb1dh3SR
         9DGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=Sy93TMXOzV2uH1HvI7h8cG9M/35DqeTKee2gvPn6i0w=;
        b=apHUMXrZ8V4CelQJQmJqvRW/YtyxPpE5D9610k9/L0k5Y0dV+mxDQ4AJTERgFBl237
         hg3ULZ1Fluk/sjlgEBtVQfRZQQkXLJ18tawO83Q4IMn81+vLC5LevH4bgPEYDZI8f7dO
         CxrGTPdVXjLV7va1aXxotMz9pJ5zsDXeIduRwQkdy259Ki4DwHeRJF4aCGovdm4GqDiL
         QMk86u0tfGfISCFBkrydTYizIpMeBNniL8UJ525HwyAnBL844e15BmX298CxNJBT6MGN
         kaMTHZPVgraHS/f0FEVUlkm4Vw/udmJZmdmZ7e82wlTemL+Z9Uvf1FNfNQSfYGM22ore
         lOhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z19si3306367qtz.140.2018.04.16.02.21.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 02:21:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f80Kk-0006Pe-7s
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 05:21:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1f80Io-0005Lx-29
	for qemu-devel@nongnu.org; Mon, 16 Apr 2018 05:19:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1f80In-0005cj-3L
	for qemu-devel@nongnu.org; Mon, 16 Apr 2018 05:19:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58368 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1f80Ig-0005ay-Du; Mon, 16 Apr 2018 05:19:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A04C48182D1C;
	Mon, 16 Apr 2018 09:19:49 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFC997C5C;
	Mon, 16 Apr 2018 09:19:43 +0000 (UTC)
Date: Mon, 16 Apr 2018 11:19:41 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20180416091941.7n24dd3qjyuqh4h6@kamzik.brq.redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-9-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_O3QK0t5DHfnAFEOHv_yyxvL9HZX+0geHs0ibVVwTbNQ@mail.gmail.com>
	<57b01152-1179-9735-eb6a-a9dbfc933a6c@redhat.com>
	<CAFEAcA-wT8vERbkjq_HoROi1ymPauAe+y3oc16zoCJXsHKqBoQ@mail.gmail.com>
	<94299045-3027-517c-d634-4613f78de163@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94299045-3027-517c-d634-4613f78de163@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 16 Apr 2018 09:19:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 16 Apr 2018 09:19:49 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [RFC 8/8] hw/arm/virt: Allow up to 512 vcpus along
 with KVM VGICv3
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
Cc: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Christoffer Dall <cdall@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LlB8eK6hsJb5

On Fri, Apr 13, 2018 at 04:11:24PM +0200, Auger Eric wrote:
> Hi Peter,
> 
> On 13/04/18 16:06, Peter Maydell wrote:
> > On 13 April 2018 at 15:01, Auger Eric <eric.auger@redhat.com> wrote:
> >> On 13/04/18 15:41, Peter Maydell wrote:
> >>> I think it would be better to explicitly check "do we have
> >>> support for split redistributors" rather than looking at
> >>> KVM_MAX_VCPUS. It's not impossible that a distro kernel
> >>> might have chosen to backport support for one but not the
> >>> other.
> >>
> >> The issue is we have race here:
> >> to check whether the new ATTR is supported I need to query the GICV3 KVM
> >> device. This later is created in the GICv3 initialize. But to initialize
> >> the VGIC I need the VCPUs to be created. And to create the VCPUs I need
> >> to check their max number. Or do I miss somethinh?
> >>
> >> The KVM device create dry-run mode cannot be used here. I would need to
> >> really create the KVM device and then delete it. The issue is there is
> >> no kvm device DELETE ioctl at kernel level since KVM devices are deleted
> >> on VM deletion if I understand correctly. Adding a KVM device delete at
> >> kernel level may not be straightforward as I suspect some
> >> simplifications could be made in KVM device deletion knowing the VM was
> >> under deletion.
> > 
> > Two possibilities:
> > 
> > (1) do like we do in kvm_arm_get_host_cpu_features() where we
> > create a scratch VM to interrogate it and then throw it away
> > when we have the info we need
> Oh OK. I did not know this was in place. At first sight, this looks
> simpler than (2) to me. I will investigate this solution.

But (1) isn't awesome. It'd be better if we could avoid scratch VMs
altogether as they slow VM launch and create confusing traces when
debugging. Also, it's just not a pretty way to do things. If we must
keep a scratch VM, then let's at least make sure we only have one,
i.e. put all probing into a single scratch VM.

> 
> Thanks!
> 
> Eric
> > 
> > (2) add an API to the kernel to make it easier to query it
> > for this sort of feature

This is the cleaner choice, but I wasn't opposed to the max-vcpus
query getting double-duty though. While the backporting argument is
a good point, I'm not sure we've ever really cared about what
issues backporters have had to endure when they cherry-pick features
before.

Thanks,
drew


> > 
> > thanks
> > -- PMM
> > 
> 
