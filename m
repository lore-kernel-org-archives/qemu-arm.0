Received: by 10.25.208.194 with SMTP id h185csp2483648lfg;
        Wed, 20 Apr 2016 11:57:55 -0700 (PDT)
X-Received: by 10.13.224.69 with SMTP id j66mr3386243ywe.117.1461178675559;
        Wed, 20 Apr 2016 11:57:55 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x22a.google.com (mail-qk0-x22a.google.com. [2607:f8b0:400d:c09::22a])
        by mx.google.com with ESMTPS id w199si17155164ywg.384.2016.04.20.11.57.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Apr 2016 11:57:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22a as permitted sender) client-ip=2607:f8b0:400d:c09::22a;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::22a as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x22a.google.com with SMTP id x7so17432528qkd.3;
        Wed, 20 Apr 2016 11:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=JOojKvTFG3P0jITM+jsW/V/ED44b+gDlMKlnX3L4dRY=;
        b=dlxhPlV2fa5sJMjWJj90icDZ3HNQmMLu7/Gn5GpfCtxBjtmiRpfhOp13DAxBbJ/ljk
         PLDrPPMQ0oFDdWnjYo+xcxH/Y0cwS9lzNvUwhs1utH6r/WJn6h4w7v+2eIenpYVYlyNU
         AaC5kubYp+TWPse3pyrw0YdE+6TEWwJ7727oFX4XfVHMrTF4S4isT2h3Io2dg5JkrTMU
         D1d11CsorhSh89013kBvNjIXv0nJSre5Sn9JLCZO8LnQVrnFOJjHHs8k15j1I4PJVwX3
         X7q+pquPAljGiDfEC2OUThYDr4Mt1XAmObRGV1tD5Y7TpL8newlOni4oSAYM20gnDhJL
         R+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=JOojKvTFG3P0jITM+jsW/V/ED44b+gDlMKlnX3L4dRY=;
        b=OcgPB/307aoIZgidhXwQ41+r3Z4cGTw+os7VQtX3zo9hPYsPw4ZkUb3i3kO5et721r
         /9HRRiGkcB0f21TgSRpH7rw6HOohsZ5icxV7HaGCJrWkdCuoCSUuZ4Lp7AO8rUti6Jyk
         cxp9r3e8sU0YmMjEmR/peJwrxhU9Ve6fP6ktXeMjRCMnzbEPM6sXaEVFQUFprj8mmAWg
         yIhfVXH4RGcnrSj/QxZcFD+tg6cGAb/Bq/hvIN782uCjmfxEStF3gFh+Tg6hCGkyy/SS
         /CDugbc76euBENrGAGkV1cGh3t/Cfd5Aayrh/N1cinm4ldlgC7FrEc2VhVwRgSSJDjUS
         yhqg==
X-Gm-Message-State: AOPr4FUdNgjq7hwLWzC8Nrg5BfAKFIfjCGjyOuaRnql2dUymlB+q6O9X07scg1gH3CgBFg==
X-Received: by 10.55.72.196 with SMTP id v187mr13543273qka.97.1461178675165;
        Wed, 20 Apr 2016 11:57:55 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (c-98-229-166-99.hsd1.ma.comcast.net. [98.229.166.99])
        by smtp.googlemail.com with ESMTPSA id 65sm31792529qgz.40.2016.04.20.11.57.54
        (version=TLSv1/SSLv3 cipher=OTHER);
        Wed, 20 Apr 2016 11:57:54 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH 08/11] tcg/aarch64: Make direct jump patching thread-safe
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1460044433-19282-1-git-send-email-sergey.fedorov@linaro.org>
 <1460044433-19282-9-git-send-email-sergey.fedorov@linaro.org>
 <87k2jsv0pv.fsf@linaro.org> <57179B80.9050800@twiddle.net>
 <87ega0uolz.fsf@linaro.org>
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>, qemu-devel@nongnu.org,
 Sergey Fedorov <serge.fdrv@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Claudio Fontana <claudio.fontana@huawei.com>, qemu-arm@nongnu.org
From: Richard Henderson <rth@twiddle.net>
Message-ID: <5717D130.8090100@twiddle.net>
Date: Wed, 20 Apr 2016 11:57:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <87ega0uolz.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: H1cMF0tIm7vB

On 04/20/2016 11:22 AM, Alex Bennée wrote:
>
> Richard Henderson <rth@twiddle.net> writes:
>
>> On 04/20/2016 07:01 AM, Alex Bennée wrote:
>>>
>>> Sergey Fedorov <sergey.fedorov@linaro.org> writes:
>>>
>>>> From: Sergey Fedorov <serge.fdrv@gmail.com>
>>>>
>>>> Ensure direct jump patching in AArch64 is atomic by using
>>>> atomic_read()/atomic_set() for code patching.
>>>>
>>>> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
>>>> Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
>>>> ---
>>>>    tcg/aarch64/tcg-target.inc.c | 14 +++++++++++++-
>>>>    1 file changed, 13 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/tcg/aarch64/tcg-target.inc.c b/tcg/aarch64/tcg-target.inc.c
>>>> index 0ed10a974121..15fdebec921f 100644
>>>> --- a/tcg/aarch64/tcg-target.inc.c
>>>> +++ b/tcg/aarch64/tcg-target.inc.c
>>>> @@ -73,6 +73,18 @@ static inline void reloc_pc26(tcg_insn_unit *code_ptr, tcg_insn_unit *target)
>>>>        *code_ptr = deposit32(*code_ptr, 0, 26, offset);
>>>>    }
>>>>
>>>> +static inline void reloc_pc26_atomic(tcg_insn_unit *code_ptr,
>>>> +                                     tcg_insn_unit *target)
>>>> +{
>>>> +    ptrdiff_t offset = target - code_ptr;
>>>> +    tcg_insn_unit insn;
>>>> +    assert(offset == sextract64(offset, 0, 26));
>>>> +    /* read instruction, mask away previous PC_REL26 parameter contents,
>>>> +       set the proper offset, then write back the instruction. */
>>>
>>> This comment could be moved from here and reloc_pc26 and made common for
>>> the two following functions.
>>
>> There's a significant amount of cleanup that ought to happen here, now that
>> we're not re-translating TBs.  I don't know if Sergey should be gated
>> on that.
>
> Is this stuff already in the works? Otherwise we are trying to get
> pre-cursors to MTTCG into the code (once the tree re-opens) to keep the
> main diff down. This also is beneficial for linux-user stuff.

We're talking past one another.

No, it's not yet in the works.  I'm saying that this patch set should not wait 
for it.  Thus I don't care if what he adds here is a little messy; we'll clean 
it all up at once later.  Thus don't bother refactoring reloc_pc26 and 
reloc_pc26_atomic.


r~
