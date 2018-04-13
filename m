Received: by 10.28.71.155 with SMTP id m27csp786633wmi;
        Fri, 13 Apr 2018 06:57:04 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/4EYjSX7xEJnSln57X00teqk/QQFP+AIje9RbBjh71UVguQaOSiGMPYqK/37Zul/AbazzF
X-Received: by 10.200.63.6 with SMTP id c6mr3388649qtk.286.1523627824205;
        Fri, 13 Apr 2018 06:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523627824; cv=none;
        d=google.com; s=arc-20160816;
        b=zKQ2wN5ZsHVXn7aHNID1Z5Hnoq5/dHBUFS5B71pFMjiJMAOxhd2NXLM8lSj2hQ1rK3
         xxkUQVsI5NeRnzjCovVZ2YinyOZjfuzFIPn28Z791Af81YLAgZUYXACVi/HvLL60Ww11
         3EoXgFGvZ6MPPRroRS8ky2BuYWY1jb7FQh6uuqktUzI1WD8AfCULH/ikDjc1UvR8g7E1
         4dqQIlgcspaGElLv6HZLFXIvB9MSiXdU3X5mC7pE4ceOPiXmQDgFfmzawOBNySfVb62q
         9jw1TUhjAmloXA7nlnsy0alPJMp0BJ9ad5AIW/JdNSR9AR1w0O4dGSWfjl4GYTCx6pKh
         rm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=qvltPTMADSR2MSru3cyUnnRfsCGwCLX1Wzk/RWzrAlM=;
        b=MWDyFRBNq6gWdYMtcXc1xWNUyG6DYSsqeDk3kFHMXRvawrSOEd5RJrkE3D18bUistZ
         am0fpCnssafLP3mEJNoBOIs4eSq3WzXJDVHxqGV5uRb5Aqa4U0fxto5wWpZ3E2vjvloC
         NvwCcD2MbIjq1qPSTE1C8wOaxZLqswRCLeOgc4F5Bd2k30fhqhX9iAgRmG3I63FSt529
         Rb5udutgOrLWlQmaXkn7yKZPnrDv5sjDtS3UH/TzZ1kXbhNyiNt6kRek+UVt162x6X0s
         msfXgCYP5TPj3/jN9TNcKigCwoVLxWflub7RlIFoAClBOB0TuEVHvMO9OpQfskuaFp8w
         48Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t19si4268119qtb.327.2018.04.13.06.57.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 06:57:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55474 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6zCJ-0006In-Od
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 09:57:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6zCA-0006HX-6o
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:56:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f6zC9-0003ct-DP
	for qemu-arm@nongnu.org; Fri, 13 Apr 2018 09:56:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60986 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f6zC9-0003cd-9D; Fri, 13 Apr 2018 09:56:53 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A6B1440267D8;
	Fri, 13 Apr 2018 13:56:52 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-192.ams2.redhat.com
	[10.36.116.192])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9756FD7DEA;
	Fri, 13 Apr 2018 13:56:48 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-5-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8sQSuVcYPyE58tjapxxe6FNdD5qcyftYrZeWQ0fbev8w@mail.gmail.com>
	<e2fcd39f-f7f9-f8a2-7ef2-68a626e6bd0f@redhat.com>
	<CAFEAcA-D083O3EVoF_DXPpXf2ax6Kfad9HOToFjZg8tnRE=g7Q@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <70d8e4a0-12ad-dd75-3b71-fd611b7ec0fe@redhat.com>
Date: Fri, 13 Apr 2018 15:56:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-D083O3EVoF_DXPpXf2ax6Kfad9HOToFjZg8tnRE=g7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 13 Apr 2018 13:56:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 13 Apr 2018 13:56:52 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 4/8] hw/intc/arm_gicv3: Implement
 register_redist_region API
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Christoffer Dall <cdall@kernel.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bBep31+orchh

Hi Peter,

On 13/04/18 15:46, Peter Maydell wrote:
> On 13 April 2018 at 14:44, Auger Eric <eric.auger@redhat.com> wrote:
>> Actually this is an API provided to the machine and not the device
>> itself directly playing with the mapping.
>>
>> If not acceptable, I need to match the existing notifier framework and
>> do something similar taking into account the new GROUP/ATTR address
>> semantics here.
> 
> I think I'd rather that we continue to tell the kernel about
> the addresses of device related regions in the same general
> way that we do at the moment.

OK I will rework in that direction then.

Thank you for the review!

Eric
> 
> thanks
> -- PMM
> 
