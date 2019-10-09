Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp948242wrm;
        Wed, 9 Oct 2019 06:42:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIXRYwa5RN5q/pJPdHk7IT+BZHg1hC8iArYn4mhVO3mxUmaO3708y4vRa5XMh96FO50VWR
X-Received: by 2002:a37:c07:: with SMTP id 7mr3388791qkm.299.1570628544684;
        Wed, 09 Oct 2019 06:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570628544; cv=none;
        d=google.com; s=arc-20160816;
        b=OolppZ/AYeIm1/0tKuEwOpmat/WxWUME1GWwh5vIdTJSIBvithg29WNnsCTihIZ8d1
         KHFTTvCfAX4P12imwhb+qFCSYW/9LbosCAMw60UizIpy4sKDJlJ7+vBhTUieOknjRqkn
         iwXJGglCix+SZfcLllUpc1rJQPijIprlILmCoYEadXne3bfYks6DblzmlkVvLqbagt2w
         voWWB8U5metWJ2cMxHn/IE4f6VrmcgR5swMi5JOoePi80c+mXdfOD1lT625UIuWY1ET4
         exabm/uzgfPr8mjUIeDiFaGzv6xKczcmsUnmaJSdP1t2zo38nDjkmK7zOSpOy5TvCco9
         m7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=+Y5C/2jxkVwqNMVzp8KkSyu5V4YB5VixvHoZAOWwS7Y=;
        b=PBg4Xq1gmaieXVOtP+0E6SXwHZ1Xvh/lAYdi+71tCnPaVbeHxid9v+6oIOueeyrwap
         Jk8/S7EhZ/6R5jQzB9J0ocP6b1xGLOYP6iyaF15h6+GuM3zUC081kc/GkPr4qHPptaMu
         gfXD3jh1SLzZe9qqdXYNE/rBJ0ln72hVNM8AJG3nJYgMnt6QgXHxwgr+fBQJpqnKcbUu
         gpFp+NBVum+UuEnyQ+zm3XHdctrswQFEdvlb51P9QXGgVA09axajtOUchN4gPTnEKFPs
         CSzPqQj3pwBCDod3XXF43F+183Cobdf25OzpJVmKbuOcUqs5MiV2Lb4oDnvR7oroyOW5
         NSGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id t26si1924897qkt.315.2019.10.09.06.42.24;
        Wed, 09 Oct 2019 06:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 2637A4A8C2;
	Wed,  9 Oct 2019 09:42:24 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzQkpAD54-Vz; Wed,  9 Oct 2019 09:42:23 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 152904A8B7;
	Wed,  9 Oct 2019 09:42:23 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 34B9B4A8B7
 for <kvmarm@lists.cs.columbia.edu>; Wed,  9 Oct 2019 09:42:21 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJ3tJiHVlSE6 for <kvmarm@lists.cs.columbia.edu>;
 Wed,  9 Oct 2019 09:42:19 -0400 (EDT)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id E12FF4A8B6
 for <kvmarm@lists.cs.columbia.edu>; Wed,  9 Oct 2019 09:42:17 -0400 (EDT)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E295C36A5D818A856480;
 Wed,  9 Oct 2019 21:42:13 +0800 (CST)
Received: from [127.0.0.1] (10.133.216.73) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Wed, 9 Oct 2019
 21:42:03 +0800
Subject: Re: [RFC PATCH 00/12] Add SDEI support for arm64
To: Peter Maydell <peter.maydell@linaro.org>
References: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
 <CAFEAcA_ztr0_Bu9d__dSr9oH75s2DSd5=6NZvVMrxuDTxf31mw@mail.gmail.com>
From: Guoheyi <guoheyi@huawei.com>
Message-ID: <84e1a629-bdd3-faaf-e12f-17930945adf4@huawei.com>
Date: Wed, 9 Oct 2019 21:42:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ztr0_Bu9d__dSr9oH75s2DSd5=6NZvVMrxuDTxf31mw@mail.gmail.com>
X-Originating-IP: [10.133.216.73]
X-CFilter-Loop: Reflected
Cc: Marc
 Zyngier <marc.zyngier@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Dave Martin <Dave.Martin@arm.com>, qemu-arm <qemu-arm@nongnu.org>,
 kvmarm@lists.cs.columbia.edu,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: Dw2FNLBYOTai



On 2019/9/30 21:15, Peter Maydell wrote:
> On Tue, 24 Sep 2019 at 16:23, Heyi Guo <guoheyi@huawei.com> wrote:
>> As promised, this is the first RFC patch set for arm64 SDEI support.
> Hi; for the benefit of possible reviewers who aren't familiar
> with every corner of the arm ecosystem, could you provide a
> summary of:
>   * what is SDEI ?
SDEI is for ARM "Software Delegated Exception Interface". AS ARM64 
doesn't have native non-maskable interrupt (NMI), we can rely on higher 
privileged software to change the pc of lower privileged software on 
certain events occur, to emulate NMI mechanism, and SDEI is the standard 
interfaces between the two levels of privileged software. It is based on 
SMC/HVC calls.

In virtualization situation, guest OS is the lower privileged software 
and hypervisor is the higher one. Major interfaces provided by SDEI include:
1. interrupt bind: guest OS can request to bind an interrupt to an SDEI 
event.
2. register: guest OS can request to register a handler to an SDEI 
event, so hypervisor will change pc of guest to this handler when 
certain event occurs.
3. complete: guest OS notifies hypervisor that it has completed the 
event handling, so hypervisor will restore the context of guest when it 
is interrupted.
>   * what do KVM and QEMU want/need to do with it ?
KVM is supposed to pass SMC/HVC calls to qemu, and qemu will serve the 
SDEI requests after parsing SMC/HVC calls. qemu also takes the 
responsibility to trigger the events. If an interrupt is requested to be 
bound to an event, qemu should not inject the interrupt to guest any 
more; instead, it should save the context of VCPU and change the PC to 
event handler which is registered by guest, and then return to guest.

To make the conversion of interrupt to SDEI event transparent to other 
modules in qemu, we used qemu_irq and qemu_irq_intercept_in() to 
override the default irq handler with SDEI event trigger. I saw 
qemu_irq_intercept_in() should be only used in qemu MST, but it seemed 
fit to override interrupt injection with event trigger after guest 
requests to bind interrupt to SDEI event.
>   * what is this patchset trying to solve ?
This patchset is trying to implement the whole SDEI framework in qemu 
with KVM enabled, including all SDEI v1.0 interfaces, as well as event 
trigger conduit from other qemu devices after interrupt binding.

I will also provide the above context in the cover letter of v2 RFC.

Thanks,

Heyi

>
> That would provide some useful context for trying to
> review the patchset.
>
> thanks
> -- PMM
>
> .
>


_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
