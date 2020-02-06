Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1717825lfp;
        Thu, 6 Feb 2020 09:30:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqzpyx8TwhPxfpHyeWBDXUJnZXMsPhF+3swE0lRJShyZbXJJeOiOO2qAyLye3UTzw78yxvjm
X-Received: by 2002:ac8:5486:: with SMTP id h6mr3637644qtq.17.1581010250017;
        Thu, 06 Feb 2020 09:30:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581010250; cv=none;
        d=google.com; s=arc-20160816;
        b=qDK2AacZLfrJ8kGsVRtWAHKZl0JlDx7zf8c+QHsXyZGcuSw61ihsv1NJbP0UON+qb2
         Yj3T9+9nTbxH3RjxZDxUiTLwo613nh1VWJq/Ipp3KzPkF0VSLeXOH9E9mBFFavN9YP22
         rM0V8q5EiKS3a65Rdly2AKGf8qR/92YJdnIsmR+BYj2e4sQncQcZIHXvGM00KvQU9zb9
         HWZabm46p4wSI2g3nCj2mLakVKSp5eYeWEoUGA9fwDtb1CEdX2nCaVUtd6wMexzpWtJR
         zBsuCdP42dz/54aXHCmQlu+7f5zQBKafawjL3NsDhmwIOlkrB3xjzln3Bk2guCP8CROh
         m3Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:message-id
         :references:in-reply-to:subject:to:from:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=p3nOElGs4FgRyRbynlw45GcGbw46Wv3nwR5p7nap+68=;
        b=JjTp1eI02IPRAYvDAlRMhcFhTw53bewGMP105tSAG1t9ZJJYUaL7j3SQKloGXb7CZH
         aI20Y56t/ZlHTgM+65eDkUUmhKbj3UVXQ2pMa+j7L4PwzwwWpjNLwwTHbY3rRJ7UNRTq
         lYRqw0xfh8Et4qJuea9BdB5vTMoGayPuy6TAo+O+rqnvauv7+QqWZdW2i+GY+Ow6v7s1
         eNyIYSXjDD2YO7uWuAPsJ3vwj1E6MAbeOS2syDa/+2Y0Fxi7hwl81JIS9tsmq0Vpf/ox
         qWZyCnHnLgis4i0mwwEYkpctPXr3jk0hYwofrG65XsdINZ8dvtKRwiSkEnrYxMZ6hWkY
         l51w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b="SZdU/2UA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ew19si1750863qvb.129.2020.02.06.09.30.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2020 09:30:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b="SZdU/2UA";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:43122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izkzH-0005os-PL
	for alex.bennee@linaro.org; Thu, 06 Feb 2020 12:30:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43209)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maz@kernel.org>) id 1izkz1-0005lJ-CY
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 12:30:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maz@kernel.org>) id 1izkyx-0002Wp-Vj
 for qemu-arm@nongnu.org; Thu, 06 Feb 2020 12:30:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:50926)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <maz@kernel.org>)
 id 1izkyx-0002Pg-L1; Thu, 06 Feb 2020 12:30:27 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6C6421741;
 Thu,  6 Feb 2020 17:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581010225;
 bh=O09wmBQDGjMvuEahncvzprNfE4F9flL20Vq1HRYdJng=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SZdU/2UA6tSSMSiqc1MjeWT40i+MWgDaMKYsJhNaqoQYU3+fyTUgGMdcPbZ+TuAsR
 fO4YD32UxHE1aRTQ3Sb4/Xx3VbhbF58x8rHcbZsHgnuCsjIueKldg/QDXQqZIaMaCK
 7wv64zKBXvSl2H/rpYPgM35t3kiMeFQoCQ2UO4sY=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1izkyt-003N8T-Ma; Thu, 06 Feb 2020 17:30:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 06 Feb 2020 17:30:23 +0000
From: Marc Zyngier <maz@kernel.org>
To: Heyi Guo <guoheyi@huawei.com>
Subject: Re: [RFC v2 00/14] Add SDEI support for arm64
In-Reply-To: <c67c1563-045f-a5f8-8b8b-97d792aa1912@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
 <CAFEAcA-+tAbb9h2wZOm56TqUvjQJT0OYFLwTVS-UxKrF5PO3mQ@mail.gmail.com>
 <5aece614-4341-35e5-53a6-2f3d788e6e8d@huawei.com>
 <e8b93460-48e6-43cd-4608-370c07cb45ec@huawei.com>
 <350aa4ca1b57a466ed882236caf23051@kernel.org>
 <c67c1563-045f-a5f8-8b8b-97d792aa1912@huawei.com>
Message-ID: <f8394aafb2adb513186cd2784a1cb077@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: guoheyi@huawei.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com,
 Dave.Martin@arm.com, mark.rutland@arm.com, james.morse@arm.com, mst@redhat.com,
 cohuck@redhat.com, pbonzini@redhat.com, shannon.zhaosl@gmail.com,
 imammedo@redhat.com, gshan@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 198.145.29.99
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gavin Shan <gshan@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FcFoe8sbxkry

On 2020-02-06 01:20, Heyi Guo wrote:
> Hi Marc,
> 
> On 2020/2/5 21:15, Marc Zyngier wrote:
>> Hi Heyi,
>> 
>> On 2020-02-04 08:26, Heyi Guo wrote:
>>> Update Marc's email address.
>>> 
>>> +cc Gavin as he is posting a RFC for ARM NMI.
>>> 
>>> Hi Marc,
>>> 
>>> Really sorry for missing to update your email address, for the 
>>> initial
>>> topic was raised long time ago and I forgot to update the Cc list in
>>> the commit message of the patches.
>>> 
>>> Thanks Gavin for forwarding current discussion on ARM NMI to me.
>>> 
>>> For you said SDEI is "horrible", does it mean we'd better never
>>> implement SDEI in virtual world? Or do you have any advice on how to
>>> implement it?
>> 
>> My concern is that SDEI implies having EL3. EL3 not being 
>> virtualizable
>> with KVM, you end-up baking SDEI in *hardware*. Of course, this 
>> hardware
>> is actually software (it is QEMU), but this isn't the way it was 
>> intended.
> 
>> 
>> It's not the first time we've done that (PSCI is another example), but 
>> the
>> logic behind SDEI looks much more invasive.
> 
> Thanks for your comments.
> 
> Thinking about them for quite a while, below is my understanding,
> please correct me if I'm wrong:
> 
> So should the KVM based virtual machine be treated as one with CPUs
> only having NS-EL1 and NS-EL0, ideally? And SDEI messes up this model,
> isn't it?

Well, that's exactly what it is (until we have nested virt, in which 
case
you will be able to add NS-EL2 to the mix).

> PSCI only contains some one-shot operations, so it is much less
> invasive than SDEI.
> 
> 
> I've another question. The origin of "virtual" SDEI requirement comes
> from the lack of hard lockup detector in VM.

Sure. But nothing guarantees that the guest is going to register a SDEI
entry point anyway.

> We can have some kind of
> watchdog, but how can the watchdog trigger the VM OS to panic and run
> kdump, even in irq-off state?

Nothing. All the events, including SDEI, are maskable, one way or 
another.

Gavin's approach to inject a SError is probably OK for Linux, given that
it tends to run with PSTATE.A==0. But that's not a guarantee either (if
you take a recursive exception, SError won't be delivered).

The long and the short of it is that there is no way to do what you want
with absolute guarantees on the ARM architecture. It just doesn't exist.

         M.
-- 
Jazz is not dead. It just smells funny...
