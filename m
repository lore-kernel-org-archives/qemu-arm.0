Received: by 10.25.21.96 with SMTP id l93csp619830lfi;
        Thu, 23 Jun 2016 09:49:32 -0700 (PDT)
X-Received: by 10.176.69.141 with SMTP id u13mr17116718uau.133.1466700572111;
        Thu, 23 Jun 2016 09:49:32 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com. [2607:f8b0:400d:c09::242])
        by mx.google.com with ESMTPS id u93si482722uau.86.2016.06.23.09.49.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jun 2016 09:49:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) client-ip=2607:f8b0:400d:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x242.google.com with SMTP id l81so16818835qke.3;
        Thu, 23 Jun 2016 09:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=sUjbhv2e1SKa6heFFe60B1ahsB1xXa6YNjGnuLTMEF4=;
        b=J2U3PliNP4swLVy+LoZ7ZANMaw2HrwN9rH0yjOYLbw7Be+dutt/DFol644jVaYAWby
         tP8+daHz6qZ2lwvhlVUPtmULTzsk++WexMAYk0PfZE0vER6SmuNHO4Jh64IjRbgmPPc6
         qqcW0XIvW0DU+P2Ex9e+8Lf5gLGkqheGSXIRkDLfAG0EKf+5VGodSfnNjSoGxGLS4s6o
         U0zqIrycuxwpgiwrHzk7MwFYe90aMzmGDI9+AGcBlL87lFAAW7C7+R8WZwrNnu/rlZll
         8cDs05SCO5h6f9mZ2Hpdlcc5skkol6ZvqyLyMDYU8DcUpOPuAcYiPDhAHNCADzqUl13g
         t2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=sUjbhv2e1SKa6heFFe60B1ahsB1xXa6YNjGnuLTMEF4=;
        b=DRqvZwychJeqJfbH4hIXNoRgbhFX8biwyauIw4IEx5ilhlvPKa4Lz/xnAY/7ebJFEd
         NQSL+xeoTd0HabUz1lrKtXlOuKI7Dt/VJwTO8n4z5MVFjUuvsZhHog9jY8+DmIBhwo2H
         KTZf3jvJqZfZ0JI3rfSuvV+cAXAgBxWlLq/mf2PORyLY0MSqoF91iV2o2cPLOBabQvYf
         xpNhGzypTnOh0wx904w+fILZ5AXDTCecg2Z8qtnfmUnQyTKRKd3TEGKLYKc6UxruPv2A
         /wV08V0/rY+1KTLYIVcSlmGPNsRgBYKuVXLQp4qDrxJBzYJlhIZypm+QIRWi93cvZocJ
         CXZA==
X-Gm-Message-State: ALyK8tKiS957iLIHFh012yM9o5Bsvi6pSxEs7LxyM/6NKAQGclMDfR6QULTBtlib24Q0Sw==
X-Received: by 10.233.237.14 with SMTP id c14mr43313295qkg.88.1466700571606;
        Thu, 23 Jun 2016 09:49:31 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net. [71.37.54.227])
        by smtp.googlemail.com with ESMTPSA id u53sm394745qtc.23.2016.06.23.09.49.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jun 2016 09:49:30 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC v3 PATCH 04/14] tcg/arm: Add support for fence
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Pranith Kumar <bobby.prani@gmail.com>
References: <87h9cjrhp6.fsf@linaro.org>
Cc: Andrzej Zaborowski <balrogg@gmail.com>,
 "open list:ARM target" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 serge.fdrv@gmail.com, Peter Maydell <peter.maydell@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <9f3debdd-fcd2-34fe-3a88-4d7f8f3db1d9@twiddle.net>
Date: Thu, 23 Jun 2016 09:49:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <87h9cjrhp6.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ygBnHmZELjqz

On 06/23/2016 09:30 AM, Alex Bennée wrote:
>
> Pranith Kumar <bobby.prani@gmail.com> writes:
>
>> Cc: Andrzej Zaborowski <balrogg@gmail.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
>> Signed-off-by: Richard Henderson <rth@twiddle.net>
>> ---
>>  tcg/arm/tcg-target.inc.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/tcg/arm/tcg-target.inc.c b/tcg/arm/tcg-target.inc.c
>> index f9f54c6..1447aa8 100644
>> --- a/tcg/arm/tcg-target.inc.c
>> +++ b/tcg/arm/tcg-target.inc.c
>> @@ -313,6 +313,10 @@ typedef enum {
>>      INSN_LDRD_REG  = 0x000000d0,
>>      INSN_STRD_IMM  = 0x004000f0,
>>      INSN_STRD_REG  = 0x000000f0,
>> +
>> +    INSN_DMB_ISH   = 0x5bf07ff5,
>> +    INSN_DMB_MCR   = 0xba0f07ee,
>
> Again I think you might want to split the instruction encoding. Also
> where did you get these encoding from? Is it right the byte-order has
> been reversed if it is being written out by endian aware helpers?

I don't think there's any point in separating out ISH, or all the parts of the 
MCR move.

As for the endianness... I must have read the number out of objdump incorrectly.


r~
