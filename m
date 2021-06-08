Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4486116lfa;
        Tue, 8 Jun 2021 07:36:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVEHjgbn/ceR3jqq/qPQKwkhnkrvyc5uwEi9HkG9vaQWcjXGQ/+dibLuuPigufIx+BGLYa
X-Received: by 2002:a50:c8c3:: with SMTP id k3mr26366162edh.318.1623163013973;
        Tue, 08 Jun 2021 07:36:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623163013; cv=none;
        d=google.com; s=arc-20160816;
        b=AyBcs9H7zt9akdeTDktzQtWa4sY14luTAbPiA3qutqpR2iKSy08Jc73MY84juWj65i
         4EC/2m/qXT/WydAp8TsmrFROZ3n8v8kp6DF9IFYoVuQnweRuJLaWaJYPmpExrugYjKOT
         AQCS9uV33QiU+5xpFeFHVqKTRg0CWSe678UsaeBIMei9UkK0uMxguVe0JbYr7t/3O/tM
         /xQ8QjB+/bcUKOHUnWS+LJPf5BparWzKR+wOEgXEwuPtHPjLDlp1VtH0f+Qk6kwMd+Po
         7490neon0wrhrElAGTANSQQgkSZJrUOfg3j6WHR7Dr1i069ZCQOJBnZ4xXVgEyhWe3sR
         QC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=VL6+l3wKLGjMGfm7gE4hwGjp6kySXrCs/qv9TUuboiY=;
        b=uGJ+UUTcs9RCYrCjRv15LuuX8+1mJww7lJ9lV44Th/YCJAUQNMNN9AnRLtKequ7lXN
         H51cBxgNTv3+UGkjHImR0y7TU6/BUX6bwukUYCbOmDaE7ZRExNX4VcQvSfV4xMMPRINM
         fskMZyjSMrdHqdDHIeJdr91ioB+UkpguFb2WR8fRPXJnSBMInfcjq3CljpiNs8XNZPaU
         bv7FxlBjJZyx3pug4JEggku9SoM8NdO9WLmzaX3cC2xcvtBeQMnRQfG3/OSuyDS6wLtQ
         IjUZtnPNVPFrp/MWiPxLq0FcDQxYbwK3RFn5i6hg6Jy94dB+Ci+0kbtwsMVezjSgvh18
         FJAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WemI3Auw;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id op2si15671618ejb.522.2021.06.08.07.36.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 07:36:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WemI3Auw;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623163013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VL6+l3wKLGjMGfm7gE4hwGjp6kySXrCs/qv9TUuboiY=;
	b=WemI3AuwRK50lcXWuBTzAh7n8OeaMGrKncPr93TvHliIy4ebqybxC2QqogFewUjlYhWATM
	yDRgWWYiR7/zgUAzIQi2aXdsYOThP8fLoH1HybFU7NfUzZhcSUZrxk1/DnPlSGTpwyYviL
	EwCgfAKfzK0Ydl4wZSSQCGM88aXr8+Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-LoTedET3Ocio-yOSXxSZlQ-1; Tue, 08 Jun 2021 10:36:51 -0400
X-MC-Unique: LoTedET3Ocio-yOSXxSZlQ-1
Received: by mail-wm1-f69.google.com with SMTP id f186-20020a1c1fc30000b02901aaa08ad8f4so1249370wmf.8
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 07:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VL6+l3wKLGjMGfm7gE4hwGjp6kySXrCs/qv9TUuboiY=;
        b=iQxZw0owXsBrtkrsOqLq7oEQmYcNXjDYULhLVosy7bJ+0QZh4a1qziuS0MDAiRHeHJ
         qiZ/X5iwnL6WxIEAQ+Ndmj8KHCaUVokDufaSPs5U6Gr8ZPqUE931xCiQTvZkhBaodtm0
         KSMJpDWaiPE2dbJotR2x2+cNgEq0gZsuxKBg3eiJUHOOdspbs9W5jO4sRWjCCwGemJF0
         eVD6pRLRBoqPLAl2SFTDnNsTYjBIlzBm9COLD8ekatLyyR8m0JkYgzQhcw9jKFum+mv1
         1iWnguFCLjLVYNjYfzX61glogbFWedzqIY0q0hG3bIXNa9hb20LdPIo23rCmVcC3fVPJ
         2+Lg==
X-Gm-Message-State: AOAM531xO/j/NzEh8K+7DrFPoVKGzwSLxFXwRQYlU0tNT1EKT1ugROoj
	jkeFkPgAUhgUONAk+VvUgDT70u0yFiwY5l0dJrgXeFsIWrzB30gp+itis3pkRf793pU+EZZrBpY
	ghYaKcdZHT+b5pPli
X-Received: by 2002:a05:600c:154f:: with SMTP id f15mr4642715wmg.116.1623163010687;
        Tue, 08 Jun 2021 07:36:50 -0700 (PDT)
X-Received: by 2002:a05:600c:154f:: with SMTP id f15mr4642694wmg.116.1623163010534;
        Tue, 08 Jun 2021 07:36:50 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9e83d80.dip0.t-ipconnect.de. [217.232.61.128])
        by smtp.gmail.com with ESMTPSA id b15sm19128700wru.64.2021.06.08.07.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 07:36:50 -0700 (PDT)
Subject: Re: [PATCH v16 96/99] tests/qtest: split the cdrom-test into
 arm/aarch64
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "open list:IDE" <qemu-block@nongnu.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-97-alex.bennee@linaro.org>
 <83b32ad3-18a6-c9d4-6561-c3c880234e09@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8f6c0b14-16da-4699-a279-fcbacd1e862d@redhat.com>
Date: Tue, 8 Jun 2021 16:36:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <83b32ad3-18a6-c9d4-6561-c3c880234e09@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: BpFFSyyRP7zm

On 08/06/2021 15.42, John Snow wrote:
> On 6/4/21 11:53 AM, Alex Bennée wrote:
>> The assumption that the qemu-system-aarch64 image can run all 32 bit
>> machines is about to be broken and besides it's not likely this is
> 
> What's changing? I'm not deeply familiar with aarch64. Why is this 
> assumption about to be broken?

That's also quite a surprise to me. Do you have any pointers?

>> improving out coverage by much. Test the "virt" machine for both arm
>> and aarch64 as it can be used by either architecture.
>>
> 
> Sounds fine to me, but I didn't write this part of the test. Thomas, you 
> wrote this section IIRC -- does this reduce coverage in any meaningful way?

I think we built only aarch64 in a couple of our CI pipelines, assuming that 
it covers all normal arm machines, too ... so we might want to revisit our 
CI pipelines to check whether we then need more test coverage for 
qemu-system-arm instead. But apart from that, the patch looks ok to me.

  Thomas
