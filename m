Received: by 10.25.0.6 with SMTP id 6csp345330lfa;
        Fri, 12 May 2017 10:25:13 -0700 (PDT)
X-Received: by 10.237.32.176 with SMTP id 45mr5012746qtb.30.1494609913761;
        Fri, 12 May 2017 10:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494609913; cv=none;
        d=google.com; s=arc-20160816;
        b=WE+W60quXOXMA9OuEfm3fK5m0lCxhCD30qkiKoioMm/uMG1PxOForQNpX9QYqoRyBR
         V4gQiE9FRnbx9eVN4q8/m9L/vIt0QRwQn13UDeXbsIWSha9+BTlSjJ/0cs1ek4EDuH0+
         0FzrU9XFPS0xlE8fiAxTWMKmh5+yXttIO/KsuQfR2XVEMm9Ct394QsmD/0vYXHI3kWDr
         xRhVZkHiObgB5xbARffPootED8HY5kbvrvJh9LAYcEU01OhgOclQ7MmYAhLiB7PMiZRg
         n6U8AHB+SiXAiNn3SgqJM0uXnlgSXj6JPiB8YTcA7Jw4E6SmCnKHAKcf5SxFrlV7Br6e
         La9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :in-reply-to:references:subject:to:mime-version:user-agent:from:date
         :message-id:arc-authentication-results;
        bh=HVU2Cjj+v+nKe6de1j2YmuAyYV1wuq8n5yFYZjCbv1I=;
        b=K5OFmdoBC/+crAf2q9EkhYQUOjmz70ipg32V0quY3mQSOVbW4PBav+eDYk07s92Tq0
         wCUK5OK+B4yCSVI3V0ogDPMR4OCIhNqiPrM0ODmInApzoJgpZL2bD1LopHfzuj2sZHG3
         ITWga5ml2wrzjM+PL7fnNkwZJar6PhCjM/PU+JvoM2eunOJo9kY233X1Z3gzR13tGT7Y
         48xNc0ejEnWYP/s3hHMe3mYkockMI1XTkn4K8A8VPZ+SpUgS7PROxceWclX5kqM4Vudq
         75Xy7I3sowZ3EE3UfsPHNC949GoJEzKgDZMubDER7KoA99ZK/WHIzeDSz8og/xiss2OD
         XjLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id 54si3902506qtv.179.2017.05.12.10.25.13;
        Fri, 12 May 2017 10:25:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 4DE9D40C2D;
	Fri, 12 May 2017 13:21:52 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.201
X-Spam-Level: 
X-Spam-Status: No, score=-4.201 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5] autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ni4xoBi+Tor6; Fri, 12 May 2017 13:21:51 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 0D18240B5E;
	Fri, 12 May 2017 13:21:51 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 183A640187
 for <kvmarm@lists.cs.columbia.edu>; Fri, 12 May 2017 13:21:49 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3+xxBDWabMMD for <kvmarm@lists.cs.columbia.edu>;
 Fri, 12 May 2017 13:21:47 -0400 (EDT)
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id CAE8840296
 for <kvmarm@lists.cs.columbia.edu>; Fri, 12 May 2017 13:21:47 -0400 (EDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 886CE15A2;
 Fri, 12 May 2017 10:25:08 -0700 (PDT)
Received: from [10.1.207.55] (melchizedek.cambridge.arm.com [10.1.207.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96BE13F220;
 Fri, 12 May 2017 10:25:04 -0700 (PDT)
Message-ID: <5915EFCE.7070202@arm.com>
Date: Fri, 12 May 2017 18:24:30 +0100
From: James Morse <james.morse@arm.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: gengdongjiu <gengdongjiu@huawei.com>
Subject: Re: [PATCH v3 2/3] arm64: kvm: inject SError with virtual syndrome
References: <1493530677-4919-1-git-send-email-gengdongjiu@huawei.com>
 <1493530677-4919-2-git-send-email-gengdongjiu@huawei.com>
 <5908A7CE.7030008@arm.com> <bbceff7a-1ebf-e6de-abc6-e35b71c939f1@huawei.com>
In-Reply-To: <bbceff7a-1ebf-e6de-abc6-e35b71c939f1@huawei.com>
Cc: mtsirkin@redhat.com, kvm@vger.kernel.org, tbaicar@codeaurora.org,
 qemu-devel@nongnu.org, wangxiongfeng2@huawei.com, ben@skyportsystems.com,
 linux@armlinux.org.uk, kvmarm@lists.cs.columbia.edu, huangshaoyu@huawei.com,
 lersek@redhat.com, songwenjun@huawei.com, wuquanming@huawei.com,
 marc.zyngier@arm.com, qemu-arm@nongnu.org, imammedo@redhat.com,
 linux-arm-kernel@lists.infradead.org, ard.biesheuvel@linaro.org,
 pbonzini@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: Kkiz3hPjahj3

Hi gengdongjiu,

On 05/05/17 14:19, gengdongjiu wrote:
> On 2017/5/2 23:37, James Morse wrote:
> > ... I think you expect an SError to arrive at EL2 and have its ESR recorded in
> > vcpu->arch.fault.vsesr_el2. Some time later KVM decides to inject an SError into
> > the guest, and this ESR is reused...
> > 
> > We shouldn't do this. Qemu/kvmtool may want to inject a virtual-SError that
> > never started as a physical-SError. Qemu/kvmtool may choose to notify the guest
> > of RAS events via another mechanism, or not at all.
> > 
> > KVM should not give the guest an ESR value of its choice. For SError the ESR
> > describes whether the error is corrected, correctable or fatal. Qemu/kvmtool
> > must choose this.

> Below is my previous solution:
> For the SError, CPU will firstly trap to EL3 firmware and records the syndrome to ESR_EL3.
> Before jumping to El2 hypervisors, it will copy the esr_el3 to esr_el2.

(Copying the ESR value won't always be the right thing to do.)


> so in order to pass this syndrome to vsesr_el2, using the esr_el2 value to assign it.

> If Qemu/kvmtool chooses the ESR value and ESR only describes whether the error is corrected/correctable/fatal,
> whether the information is not enough for the guest?

So the API should specify which of these three severities to use? I think this
is too specific. The API should be useful for anything the VSE/VSESR hardware
can do.

VSESR_EL2 is described in the RAS spec: 4.4.12 [0], its a 64 bit register. I
think we should let Qemu/kvmtool specify any 64bit value here, but KVM should
reject values that try to set bits described as RES0.

This would let Qemu/kvmtool specify any SError ISS, either setting ESR_ELx.IDS
and some virtual-machine specific value, or encoding any severity in AET and
choosing the DFSC/EA bits appropriately.


>> > I think we need an API that allows Qemu/kvmtool to inject SError into a guest,
>> > but that isn't quite what you have here.

> KVM provides APIs to inject the SError, Qemu/kvmtool call the API though IOCTL, may be OK?

(just the one API call), yes.


Thanks,

James

[0]
https://static.docs.arm.com/ddi0587/a/RAS%20Extension-release%20candidate_march_29.pdf

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
