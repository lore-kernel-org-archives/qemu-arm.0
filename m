Received: by 10.28.91.67 with SMTP id p64csp1835649wmb;
        Thu, 1 Mar 2018 05:33:31 -0800 (PST)
X-Google-Smtp-Source: AG47ELvPvK6tcZ8jrZIm1716HAKycQ/pZgVffy0sMKXux4EISbhfZ8FysUe7atwMihtdJCOcXEC4
X-Received: by 10.55.195.138 with SMTP id r10mr2882111qkl.269.1519911211237;
        Thu, 01 Mar 2018 05:33:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519911211; cv=none;
        d=google.com; s=arc-20160816;
        b=lOeb2WqmoTKzY97oFNPf9dinfnMhJPWbo3uioxFuac9CVHvImbE1P1+jSw5M0oI8Y8
         QB35zf4YtkhG8Mup6QdM05BBf+HanG65eSWDiCt21OiYyWjEqjCJpwpAUGu4GrQ08x3r
         vdtrwNF1Mv2q8YyO4OmgV34oKk3F3NqK1ZSBiOFnsnthnfZyWHez5hZ+GYykb4q1tRNU
         v4ZVsU7SFFx+++olZNdFeucqhaZy/UGWHWduUbMBdVrlL6RVHuxHDxM6BRwiKsfkQcN8
         QMPAXRqw/x10AMTwHlWhkwmMPfqxF5udN2bS6YvTPt42ugPqYzIMVMxjV0dy/1Wqrw9l
         aA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject
         :arc-authentication-results;
        bh=hUooVSSFpRMJFpoXu5aPrey8FTbC0ji6myTmbaJOAUY=;
        b=qpQQ1LW23x4fxX5LO8O2P4gtiUnZ6BpVQPd1/8+IqTtUoCrlBv0oazj13IvKIPH+xA
         04pKuVDb+JYRTU8wjtor8w5IROhSCfTR9u1tPuFmaynXH8VVAcQZXVsG5f2RmDl6KPAk
         /sIa+9b/T/6gKmzisKheIyPEGDxfjHmol88Y/hR7NBvzxzc2HT9hgFEDLGOq0XpBSyPV
         IHf90roLPU63EotpHotZl4nckGmLQbIElYApjowmBXvBb3jN1fTgRh9M8xKHEqwp/9pe
         W1V+VH2fdqwJLWlBjmwnrk5/YAjtZkkkKgeB6l7MDmMwnHXkL87AOKKodYi1sDiTQMrS
         G9iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id v10si4550885qth.127.2018.03.01.05.33.30;
        Thu, 01 Mar 2018 05:33:31 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id EFE4749E56;
	Thu,  1 Mar 2018 08:26:31 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nNhhUGuuWdhi; Thu,  1 Mar 2018 08:26:10 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 8AF5949D6F;
	Thu,  1 Mar 2018 08:26:10 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 0B9DF402D3
 for <kvmarm@lists.cs.columbia.edu>; Thu,  1 Mar 2018 08:26:09 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vz+5W1+VvrcG for <kvmarm@lists.cs.columbia.edu>;
 Thu,  1 Mar 2018 08:25:42 -0500 (EST)
Received: from mx1.redhat.com (mx3-rdu2.redhat.com [66.187.233.73])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id D6D7D402C7
 for <kvmarm@lists.cs.columbia.edu>; Thu,  1 Mar 2018 08:25:42 -0500 (EST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4F00FEB6F4;
 Thu,  1 Mar 2018 13:32:41 +0000 (UTC)
Received: from [10.36.116.189] (ovpn-116-189.ams2.redhat.com [10.36.116.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B360E9C06B;
 Thu,  1 Mar 2018 13:32:39 +0000 (UTC)
Subject: Re: [Qemu-devel] [Qemu-arm] VCPU hotplug on KVM/ARM
To: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
References: <000e01d3afad$b9a13830$2ce3a890$@codeaurora.org>
 <20180227104708.GA11391@cbox>
 <ac329e1b1f5265a805916ab4f8708f9d@codeaurora.org>
 <20180227124604.GA2373@cbox>
 <20180227132131.fipafmnb56a7fj76@kamzik.brq.redhat.com>
 <20180301105030.2b716e68@redhat.com>
 <CAFEAcA9yaU745Asy--jM0nu8FDJ62CEXSH_TKa-ZZfC16qye6w@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <b049a501-cd5e-8c22-9c62-88c950e01b1b@redhat.com>
Date: Thu, 1 Mar 2018 14:32:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9yaU745Asy--jM0nu8FDJ62CEXSH_TKa-ZZfC16qye6w@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.11.55.1]); Thu, 01 Mar 2018 13:32:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
 Thu, 01 Mar 2018 13:32:41 +0000 (UTC) for IP:'10.11.54.5'
 DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
 HELO:'smtp.corp.redhat.com' FROM:'david@redhat.com' RCPT:''
Cc: Christoffer Dall <cdall@cs.columbia.edu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christoffer Dall <christofferdall@christofferdall.dk>,
 qemu-arm <qemu-arm@nongnu.org>, kvmarm@lists.cs.columbia.edu
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
X-TUID: UOMoAU7qD2pQ

On 01.03.2018 11:05, Peter Maydell wrote:
> On 1 March 2018 at 09:50, Igor Mammedov <imammedo@redhat.com> wrote:
>> In QEMU on x86 (and I think ppc, s390 as well), we create vCPUs on demand.>>
>> It would be nice if ARM would be able to do that too,
>> so that it could take advantage of the same code.
> 
> It's not clear to me how that would work, given that for
> instance the interrupt controller wants to know up-front
> how many CPUs it has to deal with.
>

So how is cpu hotplug handled in HW? Or doesn't it even exist there?

(we have max_cpus for the interrupt controller, but not sure if that is
what we want)

> thanks
> -- PMM
> 
-- 

Thanks,

David / dhildenb
_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
