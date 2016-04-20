Received: by 10.25.208.194 with SMTP id h185csp2478617lfg;
        Wed, 20 Apr 2016 11:44:53 -0700 (PDT)
X-Received: by 10.112.146.164 with SMTP id td4mr1356472lbb.82.1461177893689;
        Wed, 20 Apr 2016 11:44:53 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lb0-x22c.google.com (mail-lb0-x22c.google.com. [2a00:1450:4010:c04::22c])
        by mx.google.com with ESMTPS id a184si4280892lfe.113.2016.04.20.11.44.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Apr 2016 11:44:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::22c as permitted sender) client-ip=2a00:1450:4010:c04::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::22c as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lb0-x22c.google.com with SMTP id b1so12708581lbi.1;
        Wed, 20 Apr 2016 11:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=N9UrFk09CrnQattxlGn7KiaSpjBIklkM26WPJQhGkQk=;
        b=AJYyDJb395JAtEXGzkUNS+jedOUHmBSjhRPoua4nkaMXdA9eJRPHSxNNYnnVLILY7Z
         Y5i4J3lxLGSEEledCoWZPOORtGFzMqNIGBRgZsRtJnjXHGvWksR46RZLSpJtK+l8PhHe
         HtfHJ2mXIZ0qMZAA1zOw9Ut9hETPP5A8Rdo3JDsu5WKLI9f1emY2bcyMpSV/gi1QwYHw
         ze9rDXJ6GtfQ51OQr+rsOLqXZCVMMcwStZYgr6VfzFUPWQ9erbp11azM5jnjXGZyk+L4
         OuhY69dUOc763rwR0MDcasdB9F3YOZWUj1h6G/NwhLbLKb61V9pvkfqN43GcNwQ0kvqy
         WLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=N9UrFk09CrnQattxlGn7KiaSpjBIklkM26WPJQhGkQk=;
        b=QQANyRKkXWWHd4DH4MMfc5p63YJDUIYjPdj0N15HYI1cqgpV6FCVlgqDUusfs8jvtK
         /B5066+G4fEQuSbyzRq6yld/ir+rtO/wRGk8+XOl9yjXx+1OLGHNgTJU7uC3V0iVL3J2
         O7P+Tbw3HCZ/6OwIvIfzWLNZWm64LtFyq43vbDgkwKRNxSv4JRc/tvDEEj92f5+zph0f
         iRHn5au8aaSubeBWsjYbemCSkc9DsniY/IGSZxbj4NEmsk8PJ8HsFxsuq3t+L0bz+YE/
         TXox4SZShHSKRWVIPdpXW7r7dQeN6vMwf2V/MvQ8cVVSAg3m1uZldA6J0vJmsF4Mjiq0
         /mWg==
X-Gm-Message-State: AOPr4FWOpRIH27qVVEiwjdITtFPfkH5mG68q4sKRxNIgS2qfNpYuzMPe8dNtJirtRImn0Q==
X-Received: by 10.112.160.163 with SMTP id xl3mr4361163lbb.19.1461177893299;
        Wed, 20 Apr 2016 11:44:53 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.0.65] (broadband-46-188-121-115.2com.net. [46.188.121.115])
        by smtp.gmail.com with ESMTPSA id v72sm1346720lfd.24.2016.04.20.11.44.51
        (version=TLSv1/SSLv3 cipher=OTHER);
        Wed, 20 Apr 2016 11:44:52 -0700 (PDT)
Subject: Re: [PATCH 08/11] tcg/aarch64: Make direct jump patching thread-safe
To: Richard Henderson <rth@twiddle.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Sergey Fedorov <sergey.fedorov@linaro.org>
References: <1460044433-19282-1-git-send-email-sergey.fedorov@linaro.org>
 <1460044433-19282-9-git-send-email-sergey.fedorov@linaro.org>
 <87k2jsv0pv.fsf@linaro.org> <57179B80.9050800@twiddle.net>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Claudio Fontana <claudio.fontana@huawei.com>, qemu-arm@nongnu.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <5717CE23.1080603@gmail.com>
Date: Wed, 20 Apr 2016 21:44:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <57179B80.9050800@twiddle.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: sdki99T4V7ch

On 20/04/16 18:08, Richard Henderson wrote:
> On 04/20/2016 07:01 AM, Alex Bennée wrote:
>>
>> Sergey Fedorov <sergey.fedorov@linaro.org> writes:
>>
>>> From: Sergey Fedorov <serge.fdrv@gmail.com>
>>>
>>> Ensure direct jump patching in AArch64 is atomic by using
>>> atomic_read()/atomic_set() for code patching.
>>>
>>> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
>>> Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
>>> ---
>>>   tcg/aarch64/tcg-target.inc.c | 14 +++++++++++++-
>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tcg/aarch64/tcg-target.inc.c
>>> b/tcg/aarch64/tcg-target.inc.c
>>> index 0ed10a974121..15fdebec921f 100644
>>> --- a/tcg/aarch64/tcg-target.inc.c
>>> +++ b/tcg/aarch64/tcg-target.inc.c
>>> @@ -73,6 +73,18 @@ static inline void reloc_pc26(tcg_insn_unit
>>> *code_ptr, tcg_insn_unit *target)
>>>       *code_ptr = deposit32(*code_ptr, 0, 26, offset);
>>>   }
>>>
>>> +static inline void reloc_pc26_atomic(tcg_insn_unit *code_ptr,
>>> +                                     tcg_insn_unit *target)
>>> +{
>>> +    ptrdiff_t offset = target - code_ptr;
>>> +    tcg_insn_unit insn;
>>> +    assert(offset == sextract64(offset, 0, 26));
>>> +    /* read instruction, mask away previous PC_REL26 parameter
>>> contents,
>>> +       set the proper offset, then write back the instruction. */
>>
>> This comment could be moved from here and reloc_pc26 and made common for
>> the two following functions.
>
> There's a significant amount of cleanup that ought to happen here, now
> that we're not re-translating TBs.  I don't know if Sergey should be
> gated on that.

Do you mean I'd better avoid using stuff like reloc_pc26()?

Kind regards,
Sergey
