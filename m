Received: by 10.25.150.194 with SMTP id y185csp272776lfd;
        Thu, 24 Nov 2016 09:31:42 -0800 (PST)
X-Received: by 10.55.131.134 with SMTP id f128mr2892633qkd.97.1480008702353;
        Thu, 24 Nov 2016 09:31:42 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 94si15619576qtb.140.2016.11.24.09.31.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Nov 2016 09:31:42 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 327A93D96E;
	Thu, 24 Nov 2016 17:31:41 +0000 (UTC)
Received: from localhost.localdomain (vpn1-5-24.ams2.redhat.com [10.36.5.24])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uAOHVaVL008116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 24 Nov 2016 12:31:37 -0500
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH v7 11/11] arm/arm64: gic:
 don't just use zero
To: Andrew Jones <drjones@redhat.com>
References: <20161123165406.32661-1-drjones@redhat.com>
 <20161123165406.32661-12-drjones@redhat.com>
 <2f88f60c-f7a2-3916-cd1f-5a86453d9ba9@redhat.com>
 <20161124141103.yzfswsvi6ion7po5@kamzik.brq.redhat.com>
Cc: peter.maydell@linaro.org, kvm@vger.kernel.org, marc.zyngier@arm.com,
        andre.przywara@arm.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
        pbonzini@redhat.com, alex.bennee@linaro.org,
        kvmarm@lists.cs.columbia.edu, christoffer.dall@linaro.org
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f356b79e-efc0-342a-f14f-5926035e5145@redhat.com>
Date: Thu, 24 Nov 2016 18:31:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161124141103.yzfswsvi6ion7po5@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Thu, 24 Nov 2016 17:31:41 +0000 (UTC)
X-TUID: rpInJIEbctSR

Hi Drew,

On 24/11/2016 15:11, Andrew Jones wrote:
> On Thu, Nov 24, 2016 at 10:57:01AM +0100, Auger Eric wrote:
>> Hi,
>>
>> On 23/11/2016 17:54, Andrew Jones wrote:
>>> Allow user to select who sends ipis and with which irq,
>>> rather than just always sending irq=0 from cpu0.
>>>
>>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>> Tested-by: Eric Auger <eric.auger@redhat.com>
> 
> Thanks!
> 
> But if I spin a v8 then I may just dump all the command line parsing
> stuff, dropping the optional input arguments sender and irq, or at
> least irq. I'm feeling it's a bit crufty... Any thoughts on that?

Hum personally I don' have sufficient experience on this test suite to
advise. Maybe let's get inspired of the kind of tests written on x86 and
their kind of command lines. Anyway I don't want to further slow down
the pull. We will be able to refine later on when adding new tests.

Thanks

Eric
> 
> drew
> 
