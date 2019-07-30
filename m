Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3769089wrv;
        Mon, 29 Jul 2019 18:30:45 -0700 (PDT)
X-Received: by 2002:a17:90a:3ae8:: with SMTP id b95mr111950831pjc.68.1564450245796;
        Mon, 29 Jul 2019 18:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564450245; cv=none;
        d=google.com; s=arc-20160816;
        b=mEgS7OxZMBgAsxeCTSqbsixWK2BqB0bhIAnQ/rJmF0rgxYVXsgQXLvfudsjW4IZ+FG
         Fa/Y7O/GofE5vafgKP/o+mKD9rHafnIg4MoM/slCMdWpXyOptSnAeWUKcdL7yvQqqcf2
         /AeBefdxnTsUpJ4hY9nX7X7X5/Qe7yGcQVktZziOGWrxefeQRHSGmVtC6e/JCwwb1FRj
         CuS59M9zjMCP+fPO+/AXGMWZ8ANv6ehyt0uzTatBLkJI5+XLgBdGb62TRQWVr0gvNE3U
         WGT2AffZZQob+DEZ9Yzj0LD/syEFTBcXcnt1Fko2VK7IWWJbPSUmxLxOC/ezqoGcS9cU
         J5LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=ABulo+v5LIO2Y5kgYHTgh6ICRf6L1QUWNDuHmcYVHL8=;
        b=qCGYiH053Wq077IHXDSVxHsNJbl5qa/bpbVOGknypsKm0hYp+Q0EErY4zJ+0vMvqLf
         LGNwtZN6fk6+LshElfbS/+LoFgmgPo+OnhonJ5DcLVgg8O5LQNsHENSACcgDEu/O/amn
         dWSnEdZu2/8FlE7Tu07BGQhYhDxcInAn5pw1wc0Myq1whDb0bqHbsvz+xUM3Nf3W7S2d
         XNMbHBk0YzDrjknPnak1fx9ZRyZnDeN/nRq0RhddR648LoA0rRZYFekF0KXG6jFyKthT
         YSjMJF6G7oVKn4g9vnQSlBzY6IRef3fCKyDNOUrFBl/0lIEjaIhx/7iuA9kFFVDw6kii
         mfLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MjCVgN5W;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t4sor77697223plq.45.2019.07.29.18.30.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 18:30:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MjCVgN5W;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ABulo+v5LIO2Y5kgYHTgh6ICRf6L1QUWNDuHmcYVHL8=;
        b=MjCVgN5Wl1FCYMAhzVQ64xPccC6MUVsS/A7vYDyeb7nGOvz1KrKFYCLE2I/Ffs4a2w
         vDJYSNfjawUY/34IDMorgm/XBy9nApfaqFy2a6YuBb+euxh0Op/jDmemkVRX7NH3P6Z3
         QzZ/Pm6voD7p2dDfed1t+BXUDUDQmoNEFYx8KsO0zXtG3mSi6Qm0EBtLu63+sF88v0RT
         MpDZlNqsdfkg153zGvnPNAZ7fH05LiAxaYohzZ88wNZX4x2kWVrb1zdt9A3Yf2mGOx7I
         fe4Qok+wzSBCyDzd1B+83r5iBSKSqrQ8yr5Sl46b54DS++FyOxuNCXUx/jj29rha5LdY
         LWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ABulo+v5LIO2Y5kgYHTgh6ICRf6L1QUWNDuHmcYVHL8=;
        b=Fuk0Rp3+zG/RYnelQZ0XGb76F9hcMWY7q0HzKl0uKH80XhNjG5H6BJFQMdjR1DJgJY
         joLSLJV9y3uIyCvd4S83unY/7QNC5oYPbwjbavsCfGew2a1NxU3gxG6uR3xOb6nuXX3d
         pvuTNpNbl7ldcSsg7MKXoLeolKAB8RFSKHxHwt0bdmd0Ru0GwREzLbZ76HtTEQAe8l4K
         7NpFQR4CerY9i3ihmJ08hjdtVrLi17mMr+uZdFyEU0mAEp9BD6BryddBP0vzHQuD7Gt8
         GD6grmKjRex5nUMSSnjU/OjL4RTCoTK/3bmpg6hfXbt3UBWs/SRPPKeVLTZQ6oDkXdn/
         fxQg==
X-Gm-Message-State: APjAAAUOzwE8m2/ACk2UOBE5lUzuvWbRbr3can7vyGRBw013R7IgRhNR
	5fw0rKr6wzWa+l8zJMm7j4pdOkFAxCdKFQ==
X-Google-Smtp-Source: APXvYqx6wEoY0AFWBGDMZbvaVAeHiliMAg1EucMwjquuIMAdZXt3xiYFJeTb3RyqVczeAD2i2rBrVw==
X-Received: by 2002:a17:902:1004:: with SMTP id b4mr114708536pla.325.1564450245021;
        Mon, 29 Jul 2019 18:30:45 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.101.105] ([75.147.178.105])
        by smtp.gmail.com with ESMTPSA id j15sm92874681pfn.150.2019.07.29.18.30.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 18:30:44 -0700 (PDT)
Subject: Re: [PATCH 01/67] decodetree: Allow !function with no input bits
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-2-richard.henderson@linaro.org>
 <CAFEAcA-+PfEMDE9QJZJ+_yqV0KYY6ih2yxA8c_w1bmrz7GtUkA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4962c208-04d6-65e8-556d-b1805f4e4ebf@linaro.org>
Date: Mon, 29 Jul 2019 18:30:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-+PfEMDE9QJZJ+_yqV0KYY6ih2yxA8c_w1bmrz7GtUkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 9lKiNqsO5d09

On 7/29/19 6:43 AM, Peter Maydell wrote:
> On Fri, 26 Jul 2019 at 18:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> With this, we can have the function return a value from the DisasContext.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  scripts/decodetree.py             | 5 ++++-
>>  tests/decode/succ_function.decode | 2 ++
>>  2 files changed, 6 insertions(+), 1 deletion(-)
>>  create mode 100644 tests/decode/succ_function.decode
>>
>> diff --git a/scripts/decodetree.py b/scripts/decodetree.py
>> index d7a59d63ac..4259d87a95 100755
>> --- a/scripts/decodetree.py
>> +++ b/scripts/decodetree.py
>> @@ -195,7 +195,10 @@ class MultiField:
>>      """Class representing a compound instruction field"""
>>      def __init__(self, subs, mask):
>>          self.subs = subs
>> -        self.sign = subs[0].sign
>> +        if len(subs):
>> +            self.sign = subs[0].sign
>> +        else:
>> +            self.sign = 0
>>          self.mask = mask
>>
>>      def __str__(self):
>> diff --git a/tests/decode/succ_function.decode b/tests/decode/succ_function.decode
>> new file mode 100644
>> index 0000000000..632a9de252
>> --- /dev/null
>> +++ b/tests/decode/succ_function.decode
>> @@ -0,0 +1,2 @@
>> +%foo  !function=foo
>> +foo   00000000000000000000000000000000 %foo
>> --
>> 2.17.1
> 
> Could you also update the documentation in docs/devel/decodetree.rst ?
> 
> This code change looks like it also now allows definitions
> of fields that specify nothing at all (ie there's no check
> that a field definition with no "unnamed_field" parts has
> a !function specifier) -- what do they do, or should they
> be made syntax errors ?

Ah good point.  Should be syntax errors.

> Is one of these functions which just returns a constant
> from no input bits still a "static int func(DisasContext *s, int x)"
> taking a pointless input argument, or is it now a
> "static int func(DisasContext *s)" ? I guess from the fact
> this code doesn't change the way a call is output that it
> is the former, but would the latter be cleaner ?

Right on both counts.  Because of how the loop in MultiField is set up, x will
always be given 0.  I'll see about cleaning this up.

In the meantime, fyi, this is used for setting the S bit for thumb1 insns,
where S=0 iff the insn is within an IT block.


r~
