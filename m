Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5748777wre;
        Thu, 31 May 2018 03:21:24 -0700 (PDT)
X-Received: by 2002:adf:db4a:: with SMTP id f10-v6mr4692511wrj.271.1527762084425;
        Thu, 31 May 2018 03:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527762084; cv=none;
        d=google.com; s=arc-20160816;
        b=F7nBdX4cLxdZYMlnyrkisBFm/Gi2Scd+iLX+q15PpKYz7+eLcMiJGjlyDp1KQo31q+
         8EGJrE8V46Z5vfAtk9rO6SIlhT0+ySVuPQJ0bHzjfWpx2o73KTFKldbdmBe993RquSOc
         km+su7pgSDjmO9mZCeQS5yRSqyDd6hWoz83O/qHI1YJv7pcEn4cDahV0KHZuj5LA1XYs
         MBM3fwWMtESKFgx2cnDYkiYmHiIkU6y7q9rrb9js4uCGEz3FLXAMdcUeKL3FzwzLfYkL
         /oRCDVa/c2Ra1n5/Wvlf/E2XCnqTyJPATcsZExzWFWtq494MC3g50ayLxpRYFJXIe1q7
         4Mhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :arc-authentication-results;
        bh=GbjePLG6RfUCvbbJrrUTVLrvyrlUeb7Hx1XcTvot9B0=;
        b=MIJ5F6f3nF8gFGk02kN/1QdupfEapcqyZl7ZhXlJ2SkN8IXZX7z4OD/F5Wx8iNHNIi
         //hYR4eLeZYkpMUvbIWWx+S8uEU3FOx1gdErkuuw1QgcZbll4k+ZoGX5rMO53NWf6wZb
         kExWMT/BYGZRlW1UGmAzJtZWn6PdvrblUJyrc2XS8VVfLydl5e1lXcSVmnuArAlFHEJ8
         lqgzNRq+/XwUcQNjqPpLXBUlu8CDYaZIYPZnkQVEgx3A//ESX4Wf4ATH2UFtYorUyyd7
         F5oAvwpxuMGz7KYS+xeAvxeiiAycpnzX3Y6bzo8mD+ug8d857eHARz4JJvOqIpgOZMMd
         VIKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f11-v6sor5797279wre.53.2018.05.31.03.21.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 31 May 2018 03:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GbjePLG6RfUCvbbJrrUTVLrvyrlUeb7Hx1XcTvot9B0=;
        b=hE7q4o/7vmlipJYcndL20WujeYBoxhTY8efCjcxHNmP+FWFpLQW6alkAn1ihN1qBPf
         +eGcjRk5x440Rgbem6mqeEhnKn3Ay/wh+bXWm2884c678YS79ZJcr7pxFbm0Iozix0lI
         a9+Zy+1pLhKRlCPbguDuVFpyCF+YVZ7BErbC+wswNLCEHbXlD5HNPT/Lkta/YBVFMZNZ
         dsiNoaxXUQOeLhAIjEd0UO4dwaF2YKD5gFPzlHDcQdmK6gczczpVfpdMxygG9PROBL1n
         dAU8mpiVprzSHxbD4d851VRCDahR12eX1Er62PhLxPzycKGIeIsO2EaLDKkImDT1Sf9v
         ilaA==
X-Gm-Message-State: ALKqPwcj5LjMDw73aM0p3pidrTLHh7ILM437JS15jHFhqp7ksoS+0fgy
	foBUHZ/dHi1FrF305jVDUkpWyQ==
X-Google-Smtp-Source: ADUXVKJCnCGKvAQK/FVtBrgza+04gZNYs38Webi5W1c3ZuCq+5l7l56ZLX6GbQdJ9r4Oa+rNaGb3Fw==
X-Received: by 2002:adf:aadd:: with SMTP id i29-v6mr4833129wrc.149.1527762084160;
        Thu, 31 May 2018 03:21:24 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from [192.168.10.150] (dynamic-adsl-78-12-189-60.clienti.tiscali.it. [78.12.189.60])
        by smtp.gmail.com with ESMTPSA id e81-v6sm1517355wmi.28.2018.05.31.03.21.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 May 2018 03:21:23 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH 23/27] hw/core/or-irq: Support more than 16
 inputs to an OR gate
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "patches@linaro.org" <patches@linaro.org>,
 Richard Henderson <rth@twiddle.net>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-24-peter.maydell@linaro.org>
 <c049f864-304d-f8ee-4b2f-1476a602be30@redhat.com>
 <CAFEAcA_ErfYKnVrp=Dv9mNg55Y+=fFmg4eEMddGdMxUGVb9ztA@mail.gmail.com>
 <530bef1b-a143-1566-3089-32629ab250b8@redhat.com>
 <CAFEAcA94JAccGhbhSrBkTHUV+dLR-EvYQW_nuB9FodtLTDQPZw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c7e4c537-2174-005b-fa15-0e8286e540ad@redhat.com>
Date: Thu, 31 May 2018 12:21:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA94JAccGhbhSrBkTHUV+dLR-EvYQW_nuB9FodtLTDQPZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: mhTYOUtKlMW5

On 30/05/2018 19:35, Peter Maydell wrote:
> On 30 May 2018 at 17:59, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> On 21/05/2018 17:02, Peter Maydell wrote:
>>> On 21 May 2018 at 15:34, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>> Why do the levels have to be migrated at all?  It should be enough if
>>>> the IRQ level is either migrated manually, or restored (e.g. in
>>>> post_save callbacks) through other data that is migrated.
>>> This is standard behaviour for devices: they track their
>>> inbound irq/gpio lines, and then that becomes internal state for
>>> them that must be migrated.
>>
>> But or_irq's input are another device's outbound lines, so tracking them
>> should not be necessary.  The other device would do it for or_irq.
> 
> There's no mechanism in qemu_irq for the destination end to ask
> the source end about its current value. The information flow
> is strictly one-way.

On postload, the source must call qemu_set_irq and that will cause an
update of the or_irq, won't it?

Paolo
