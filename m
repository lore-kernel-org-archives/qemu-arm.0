Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp718751wme;
        Thu, 17 May 2018 20:47:52 -0700 (PDT)
X-Received: by 2002:a37:6c02:: with SMTP id h2-v6mr6999120qkc.145.1526615272007;
        Thu, 17 May 2018 20:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526615272; cv=none;
        d=google.com; s=arc-20160816;
        b=PlILXA4PNIhz8OsrZXlQpdOADGqoOqd+Al+AbYormRTRI/ylEc0RbDJq2Gw4hOgYQK
         ZXr8QWTY5QzC8oSAB7YanNI+ifAS0rmkeyzfp1Hp/CKLjBArbZxqTzFXqp4Dqpv1CTUl
         +HDqttKlHT7btchSL7S+GGibyqIG4mgvZlvYk/5LReeuzLathKBlw2WQsZ92I3neUlvf
         3YCVR43vhfhVPEpjxaDj7G14OXHtfspgUnTbD5TXmTCrmJ3Y5iWjrY2JIX/mCnIMgeZK
         fMiHJf/jh8ElQRT5hOTjl2qGsm92A0U0LnvF3N1Naj67YydrB2SXbFSmzOlGsIYTyG/2
         hPiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :sender:dkim-signature:arc-authentication-results;
        bh=rvKi/NDQLrd49sYX77Nc7DyZ58IA1Pg/6FoBY09++6Y=;
        b=M0Rqj/kHlGMJYrr49pshXCRcfOr+33XF0zvzPLZqdJUcc7Bo7t+n4xeLmiWjUJgCgz
         Y+DBFw65p1OGAqlwPC//ZTO7fAOSmcimo0s9qpXMz+kXDKmn76tUd91dai9ikm0W58eH
         ESqpWd0cRyXppHWbUT6AVbkpfPiYkxe/KeLI6S+Rfk5vxO74pzQsuEnrOYoz6RFhp0cu
         kolLiLQqPnalGaMz8HV5H+hXndEEhpebkW95zHKEHyEcOXNRmbPKFsoEuoZJ1JYpUcEN
         J/+vPW91mvkAOEGrpOeksfytVJK1U/mxteDrhDOqKO24MWed/GSn1t2gcOGPjQN+gqwV
         4xwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=X0HrIcdV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x199-v6sor4913592qka.121.2018.05.17.20.47.51
        (Google Transport Security);
        Thu, 17 May 2018 20:47:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=X0HrIcdV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rvKi/NDQLrd49sYX77Nc7DyZ58IA1Pg/6FoBY09++6Y=;
        b=X0HrIcdVn/Exj8pemAE+c1VIN3Dn6RIPv5YGI8+5dm3OGJWNb8RG/Qd+SD/4DlyrLl
         jnK8qgSK/yeKNFv8KZ9lv6PvjAMCVL8GeglU1l7vCwMtOJObjORrarRIqIUtzE1xMtMg
         f9KQg9SrvCZZUDaUE5nNjCa1YDIDLz0uUIR0cny+9ROEbuVa6A57VkP54QmGmoN13z9S
         q1v3a/vf1MPwrv5Xg8/V4fKhhJtImzgPxLToPq25VLsplyvumrVEZvomHGoZ7UqHEK1z
         YX4POIkmZ/TMOaaonvA+T91qdnSj63ac1bF3IiJQ51JAe1HOBeAhgUPWQ4GgxupvybJu
         T4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rvKi/NDQLrd49sYX77Nc7DyZ58IA1Pg/6FoBY09++6Y=;
        b=d1l5mmu2js4CmW8MjZI5axUtRKSSXMQem1GDnlBrUzAE6P/TuVtcZrJj4YgjNkJAux
         9WFhVU6G2i9H8zT34vbToOdgnt65JxtTjgeGIMGB4fzhjKV522oxNrDBc6JNkf2SK5Hc
         VQz/rVZqs9c0bCvBR0diL8hvUI015XP4l8TZ0YrUY1cOvF1ILH5IXdZ8cRZIJKtcjAF3
         HYHj3+9en5V3ybW8pWc0MvN/MT9Nkvz0gYJoSmJ7chXBt2B5+XVPCY+TDfdBjJDHmB6Y
         6sALzNOZw53mt1ZYG8MjS+bNvRGEBAvZ8iPBRPRjSsNSfUk54zkTMSjxX4IQcVmKrTYQ
         5pZQ==
X-Gm-Message-State: ALKqPwegybBmR0xGaV9yP3pZQFrokSPhXzXr2kv1bDRogS2qNbfvufc8
	ZlTjspnPdPRSxDElB7pd3og=
X-Google-Smtp-Source: AB8JxZrrBbgf5rmggiEf+g+61Gn9B48cy/NvZ/G+IEoQQTNcytpwx7Mpy5gwc9lP7Pw/26P4OAVEtA==
X-Received: by 2002:a37:10cf:: with SMTP id 76-v6mr7523760qkq.16.1526615271677;
        Thu, 17 May 2018 20:47:51 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.11] ([138.117.48.222])
        by smtp.gmail.com with ESMTPSA id t184-v6sm4768272qkc.6.2018.05.17.20.47.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 May 2018 20:47:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v4 29/49] tests/tcg/arm: disable -p 32768 mmap test
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: cota@braap.org, famz@redhat.com, berrange@redhat.com, balrogg@gmail.com,
 aurelien@aurel32.net, agraf@suse.de, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, "open list:ARM"
 <qemu-arm@nongnu.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
 <20180517174718.10107-30-alex.bennee@linaro.org>
 <9b8a5a71-2071-ef5c-07b2-3797883ed22e@linaro.org> <87muwydlgc.fsf@linaro.org>
 <dd18fb0e-437e-d551-171e-a748ff3ede22@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <96968166-c412-bd9f-5b85-d6449308f895@amsat.org>
Date: Fri, 18 May 2018 00:47:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <dd18fb0e-437e-d551-171e-a748ff3ede22@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: W3dfknDm3m8C

On 05/17/2018 06:34 PM, Richard Henderson wrote:
> On 05/17/2018 02:24 PM, Alex Bennée wrote:
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> On 05/17/2018 10:46 AM, Alex Bennée wrote:
>>>> Broken since I updated to 18.04
>>>>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> ---
>>>>  tests/tcg/arm/Makefile.target | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>
>>> Meh.  Most of these fail for hosts with 64k pages.
>>> So, sure, disable this one, but I don't think that
>>> the others are useful either.
>>
>> I'm not entirely sure what the point of -p is meant to be. Is it just a
>> performance hack for linux-user to have bigger pages? We are not using
>> softmmu but I guess it affects the PageDesc structures?
> 
> I think it was just meant for testing, but I really have no idea.
> 
> If we actually had better support for mismatched host/guest page sizes, then
> one could view -p as a way to choose between legitimate guest page sizes.  E.g.
> 8k, 16k, 64k are all legitimate for aarch64.

8k + 16k on aarch64:
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
