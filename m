Received: by 10.182.105.169 with SMTP id gn9csp1090211obb;
        Mon, 9 Nov 2015 03:03:36 -0800 (PST)
X-Received: by 10.13.225.10 with SMTP id k10mr22441240ywe.237.1447067016476;
        Mon, 09 Nov 2015 03:03:36 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 204si5991320ywv.417.2015.11.09.03.03.36
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 03:03:36 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id BB9F0461EA;
	Mon,  9 Nov 2015 11:03:35 +0000 (UTC)
Received: from [10.36.112.64] (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id tA9B3Ucs025734
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 9 Nov 2015 06:03:33 -0500
Subject: Re: [PATCH 09/16] target-arm: Support multiple address spaces in page
 table walks
To: Peter Maydell <peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-10-git-send-email-peter.maydell@linaro.org>
 <56407AC8.9020100@redhat.com>
 <CAFEAcA9KrB0wZwQzYUmGBW2NPZWkxHFk-JUnW-XwOfbo4wbWUQ@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
        Patch Tracking <patches@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        qemu-arm@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56407D82.4090005@redhat.com>
Date: Mon, 9 Nov 2015 12:03:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9KrB0wZwQzYUmGBW2NPZWkxHFk-JUnW-XwOfbo4wbWUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-TUID: w9WGbpvMraTz



On 09/11/2015 11:58, Peter Maydell wrote:
> On 9 November 2015 at 10:51, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>>
>> On 05/11/2015 19:15, Peter Maydell wrote:
>>> If we have a secure address space, use it in page table walks:
>>>  * when doing the physical accesses to read descriptors,
>>>    make them through the correct address space
>>>  * when the final result indicates a secure access, pass the
>>>    correct address space index to tlb_set_page_with_attrs()
>>>
>>> (The descriptor reads are the only direct physical accesses
>>> made in target-arm/ for CPUs which might have TrustZone.)
>>
>> What is the case where you have no secure address space and you have
>> TrustZone?  KVM doesn't have TrustZone, so it should never be in a
>> secure regime, should it?
> 
> You mean "what is the case where is_secure but cpu->num_ases == 1" ?
> That happens if you have a TrustZone CPU but the board has only
> connected up one address space, because there is no difference
> in the view from Secure and NonSecure. (vexpress is like this
> in hardware, and most of our board models for TZ CPUS are like
> that now even if the real h/w makes a distinction.)
> 
> I could have handled that by making the CPU init code always
> register two ASes (using the same one twice if the board code
> only passes one or using system_address_space twice if the
> board code doesn't pass one at all), but that seemed a bit wasteful.

I think it's simpler though.  Complicating the init code is better than
handling the condition throughout all the helpers...

Paolo
