Received: by 10.223.172.38 with SMTP id v35csp893238wrc;
        Wed, 13 Sep 2017 03:53:00 -0700 (PDT)
X-Received: by 10.237.59.26 with SMTP id p26mr26379200qte.304.1505299980371;
        Wed, 13 Sep 2017 03:53:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505299980; cv=none;
        d=google.com; s=arc-20160816;
        b=P3/ZLtk5OwEtezXw0/KZTa7ZzknGn99czt8LOjK5ARndsGUVC7wUVxFXYPcub0R0Z3
         yl0IgPsFG1cfLE96UUd4UETyDj2oxKpXa/2G6P0wYdbe4YbPN/6puQi7pgipvoscKadN
         aw9H5Z+gq9J/eMD2sgDFqcTFt0rRitaasXJ7GHCC6AEJSGXLqOk3U0+VDNrpppx5gBXj
         W9NQOn9Vu6tTRDXbrh4EgR6fF5uBxWENHrsz0aaa56gk68KA+gKm7vevLtNdH+LTjPD1
         j5mfTWe+O2ZYeNg0GOA8uR43emMxt2GhJN324Tmy7y5dBf1v04pL+4ZvsiWiBa4tKHED
         tNVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc:to
         :subject:message-id:date:from:references:in-reply-to:mime-version
         :dkim-signature:arc-authentication-results;
        bh=VbBGTHXZyAmliaVqopLxy7JfNE8KbwmN1VVSWaJd7Ts=;
        b=xWaJS4mATUv2PAbaFP4mEFf/IfTqByBTA+MwaB/8ZSH7/YMMkfs2lzv7JfiMzcp2y/
         TjxWbKbgyY7WAu5bqV4Kk1hKpW3mH/lU3cbMFbGSgVSstTYHi+qqorr52xER+XQjKXUi
         Mnj06pmD58HniZbaQBkjZLa+ZShz03Gtd2cFNC9DtZVjpGtuiw1WfwWAL4gScRigZhkO
         V5cHzCUGjQg1qMlefzHq8Eqrz3k3HljbzxE2lfowrKWqNBgAJ210LaJaGkrZuRgKYWTq
         ZY7hhX3DxWx98CK1OMJdJVQ/d+35J7uSWH/FQMdNhVDD94iH0svtuxiO/ayzijqgNXsJ
         z8+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=SLMDVNI3;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id d30si14279245qte.37.2017.09.13.03.52.59;
        Wed, 13 Sep 2017 03:53:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org header.s=google header.b=SLMDVNI3;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 1A9F849C40;
	Wed, 13 Sep 2017 06:50:20 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: 0.909
X-Spam-Level: 
X-Spam-Status: No, score=0.909 required=6.1 tests=[BAYES_00=-1.9,
	DKIM_SIGNED=0.1, DNS_FROM_AHBL_RHSBL=2.699,
	RCVD_IN_DNSWL_NONE=-0.0001, T_DKIM_INVALID=0.01] autolearn=no
Authentication-Results: mm01.cs.columbia.edu (amavisd-new); dkim=softfail
	(fail, message has been altered) header.i=@linaro.org
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNSNwfUqECuQ; Wed, 13 Sep 2017 06:50:19 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 083B349C41;
	Wed, 13 Sep 2017 06:50:19 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 2589749C3F
 for <kvmarm@lists.cs.columbia.edu>; Wed, 13 Sep 2017 06:50:18 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7U6EfYK7Xiyt for <kvmarm@lists.cs.columbia.edu>;
 Wed, 13 Sep 2017 06:50:17 -0400 (EDT)
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
 [209.85.128.169])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id EB19040FAE
 for <kvmarm@lists.cs.columbia.edu>; Wed, 13 Sep 2017 06:50:16 -0400 (EDT)
Received: by mail-wr0-f169.google.com with SMTP id v109so27936049wrc.1
 for <kvmarm@lists.cs.columbia.edu>; Wed, 13 Sep 2017 03:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=k+NsZniIVJ/XDa0XTjrboaZaUSxZ9plhFC1TB7pfuxY=;
 b=SLMDVNI3i5yy5CcR6l7rYnVoyrCTawkUC9go8qW5br78z5NR734sB95k/J0QlkDL3m
 hB0uQB1Xp01gmaktXV9xhPsHF8bijhT+jw/VI+rSlUZUZuuTiHV/EHV+B+HsFh8O2hAy
 W1HZYox+aeEcSa8o+5OjZ8K5rLsbLEuU+8eYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=k+NsZniIVJ/XDa0XTjrboaZaUSxZ9plhFC1TB7pfuxY=;
 b=ZcuLaLWAzBCj4VQxa8ii7meFMIn0GNBE4r6MaCVsSBJAY8wVWgpPi5DS7LUlM+j45u
 /AnezFeLZxaaaM93Bf8E/LsQfs72E34R3p/2xnvx32f/TxibQBRl6xTzsTkpl8IGjoNT
 ERqXv62ztcoGfVQwKdh6ILfYz/59vGQo5KuO7BOmXoSo0wVn7s7svQHLYRvNhBYT6uag
 ZSBfc0vCJZtlRaV5TPgM6kreg6Anvb8W9HJdXE7hiprfi6NUpj9I8I3uB/Zv885t1cV7
 WGQ6uZjLuQMXSHBP+IhG778SC5/5W5jWp1I01iYYbTFuWABSqo1N5hukbaYo+k8E0nKk
 hH1w==
X-Gm-Message-State: AHPjjUhYHSDp5/233IU5JgDwvz4/TZYGMSUK8D+yHq+Ye8E3+Yztqb9i
 uaHFRqV2w5TSETZs33UhfrbAOh8XDPKpex7PaLMtUg==
X-Google-Smtp-Source: ADKCNb4BJTQvpjogueuaoW2wYSQPnv7JTFW6xm2QzpfYsa04YDehqVmFVA55liE+HpynvkzttsQ5suB3EuF9z7L5PSs=
X-Received: by 10.223.142.82 with SMTP id n76mr17001287wrb.272.1505299975285; 
 Wed, 13 Sep 2017 03:52:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Wed, 13 Sep 2017 03:52:34 -0700 (PDT)
In-Reply-To: <5552cf68-b998-686b-8e7e-710399c2b014@huawei.com>
References: <0184EA26B2509940AA629AE1405DD7F2015FE17F@DGGEMA503-MBX.china.huawei.com>
 <CAFEAcA8J5wZ23kQypzcbUScUResjWnN6rDG0b0idD1rv7F5Fsw@mail.gmail.com>
 <5552cf68-b998-686b-8e7e-710399c2b014@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Sep 2017 11:52:34 +0100
Message-ID: <CAFEAcA_zO_-kDYb0MkW=p5oY6tQPk4PpCqZoG0_01pn=sa3upw@mail.gmail.com>
Subject: Re: [PATCH v11 6/6] target-arm: kvm64: Handle SError interrupt for
 the guest OS
To: gengdongjiu <gengdongjiu@huawei.com>
Cc: kvm-devel <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Tyler Baicar <tbaicar@codeaurora.org>, Will Deacon <will.deacon@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
 "zjzhang@codeaurora.org" <zjzhang@codeaurora.org>,
 Ingo Molnar <mingo@kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 Huangshaoyu <huangshaoyu@huawei.com>, huangdaode <huangdaode@hisilicon.com>,
 "bp@suse.de" <bp@suse.de>, Wuquanming <wuquanming@huawei.com>,
 Marc Zyngier <marc.zyngier@arm.com>,
 "edk2-devel@lists.01.org" <edk2-devel@lists.01.org>,
 John Garry <john.garry@huawei.com>, Linuxarm <linuxarm@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 "Zhengqiang \(turing\)" <zhengqiang10@huawei.com>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 "devel@acpica.org" <devel@acpica.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Wangzhou \(B\)" <wangzhou1@hisilicon.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Shiju Jose <shiju.jose@huawei.com>
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
X-TUID: oAGhRDRox32n

On 13 September 2017 at 08:52, gengdongjiu <gengdongjiu@huawei.com> wrote:
>
>
> On 2017/9/12 0:39, Peter Maydell wrote:
>>>>> +    return  kvm_vcpu_ioctl(CPU(cpu), KVM_ARM_SEI, &syndrome);
>>>> This looks odd. If we don't have the RAS extension why do we need to do anything at all here ?
>>> This is because Qemu may need to support non-RAS extension as discussed with ARM James before.
>>> That is to say host hardware CPU does not support RAS, but guest supports.
>>> That is under discussion.
>>> When host hardware supports RAS, specify the syndrome to a valid value, otherwise, set it to 0.
>> If the guest CPU doesn't support the RAS extension then we have
>> no mechanism for delivering it a notification about the
>> memory problem at all, so setting the syndrome to anything
>> doesn't make sense.
>>
>> I'm not sure what you should do in the case of "host
>> supports telling us about a memory problem and has
>> done so, but guest does not support being told about it",
>> but I'm pretty sure it shouldn't be this.

>    in short, if the hardware CPU does not support RAS extension, do you think whether the Qemu or guest OS
> needs to support RAS(generate APEI table / record CPER / Error recovery).

This question seems to be not really related to the review
comment that it is responding to.

(1) If the host does not support notifying us about
errors, then there is clearly nothing to do in this
code, because we will never get a notification.

(2) If the host does support notifying us about errors,
but we choose not to expose RAS to the guest, then
there's not much to do either. We probably just want
to take whatever the default behaviour is for any
application when it touches memory that's bad.
We definitely don't want to tell the guest anything.

(3) If the host supports notification, and we choose
to expose RAS to the guest, then we need to do
whatever we have to do to notify the guest.

If we're in this signal handler and also
arm_feature(env, ARM_FEATURE_RAS) is false then that
is case (2), and my point is that doing anything with
the guest 'syndrome' value looks like the wrong thing.

thanks
-- PMM
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
