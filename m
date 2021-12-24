Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp4271839lfb;
        Fri, 24 Dec 2021 11:56:20 -0800 (PST)
X-Received: by 2002:a17:90a:8041:: with SMTP id e1mr9443283pjw.60.1640375780450;
        Fri, 24 Dec 2021 11:56:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640375780; cv=none;
        d=google.com; s=arc-20160816;
        b=d7bOFhmyi7zB2lDuMrs2Z92amQ4J8wOMEpWr+QvEEJTOQ6TTbDmjHYZBSIXykZB15T
         BDDeyCYoFbhH5CGJ8bdPspBGc0ft10dFOidNnpXii9PsSnU2GQg2rb5cXhruHk/PTue9
         udntUgkOZdjkEfQFRpIMsgoVUh1jTFAGhow2S6CJxeSv4WMic0H2gHr8+BXp7oY5oDkx
         acTI9tVC9R29ilo3vsHnDVX1P6OF89CXCh5hgoXznyOOYRo2jE1wgg0oEz0YqqrVHCmk
         ijk3TDyQFL24j4m4/CQu4il6xDdWdTiR7AQfk0gN7eZSYEhs61VVVD0B7OykOeHhdNSI
         2YFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=SLENTLDKVX6gByRL9WSy8A9SbPO7USBuaJHCAX9qNa4=;
        b=k7o0fXJkU4VyfQGEdkaALTV2CTk8FYlrNvNyiH9OLDsbdqf7ISXEjdxNlm0falmQqt
         bOlnkiCJflXpg8qhMlGlmuy0RP36eP5rmQeexJSDBI5UBx8GrA9hct1YWI/V2ueXMexe
         LtqJKRA96fxyGh6aEAXMxhkI+/h+mz5QoshmbV8FGX6RxepiuT0CZfLqKGrpnMhtpk6f
         xIMZOXNDxAmxa/qZM2OQIEQCcTPtwVjE4n98/zuLCdUIJ/i3vnPSifQhradGEzNIIirv
         FQXPkeicNJBiLmXkoanRevtXBiI46wQOMFkjpcPxUssSS78Z3rim9qQUefb8c04nH+hv
         AYYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bXeMyODw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j15sor3285149plh.46.2021.12.24.11.56.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 24 Dec 2021 11:56:20 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bXeMyODw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SLENTLDKVX6gByRL9WSy8A9SbPO7USBuaJHCAX9qNa4=;
        b=bXeMyODwrlusjuGcnSp4W2KiHA9oCy7lp8vv/TW1yNIpglnoWex7gyC0rkg8WgsSP7
         WTRWLLYYoP2ej1N3g64+/KdqgvfRkJJJMHReltnVAC4iDWF0FGgPPSdZmItFHsfZvEfp
         k5VJmq7MUiGJFbemY+Be5zZ/c+Bu3/hSvIOhY8PUMXKxjMQlLWPMIUU6Vh28YXgCCkk0
         +NgenWc5H0V1bvIrwZITIo1VGzR0iU/bqNgdCOQG4aNXwAtVR0tkI0DfSGNXFlCtkB1b
         APIsWGCwanUjyUi2lRxiWXXvtwb3mm6FsJa0oOl7KDerq79Olkga2MmrE+x2OZa1UmK7
         N+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SLENTLDKVX6gByRL9WSy8A9SbPO7USBuaJHCAX9qNa4=;
        b=sbVND3oLRvzKa8i6tXl/KrP8Cps87Vyra2tokWB00GaXMax52dEkg9DEV0zuYlojcL
         pnmj4YqmJNZ9MH7T6Ai6kezPZwydRBDuB+bPYrAB8x9Ppz+NUwC5GB6qjqccS76/XJMN
         9TCTZSKj5C4jpLhI0+jVXb4w4/8sP53BjtubEiJ3LUGWDERUUETY3yQeH9irXBM76/Mu
         AH0InmXay4YkUjGPhcaUlGw8Au4Re+qOjf4lYrPsXDsxaK1YmJz5TeZib+VxxL2l1sio
         q4HYCWjFcLJU3BXCuQTbVxZ7pqFUXRM0IhDWHmtGCbrq+0TwFJ/60K8gOB8KqhRoZ086
         5YNw==
X-Gm-Message-State: AOAM531jy1xyXmsNqMI4RNw1qDi25XoiVHRzMKIH7+FM/p8ETMSI/z9d
	/QoguOUGcCKpLx06cuv9kTINSwTQ
X-Google-Smtp-Source: ABdhPJwBzM/1sOnFPFiEshwb/DafzE/psYhS5635tg4I8wiW4ZJsfydeGkdqJo2M3UNlGszIVSiURg==
X-Received: by 2002:a17:902:6b46:b0:142:8470:862e with SMTP id g6-20020a1709026b4600b001428470862emr7971833plt.49.1640375779789;
        Fri, 24 Dec 2021 11:56:19 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.100.20] ([156.19.246.20])
        by smtp.gmail.com with ESMTPSA id y16sm9968131pfl.179.2021.12.24.11.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Dec 2021 11:56:19 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] accel/tcg: replace phys_pc with asid in TB htable
 key
To: Vasilev Oleg <vasilev.oleg@huawei.com>, Oleg Vasilev <me@svin.in>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211222164947.634759-1-me@svin.in>
 <20211222164947.634759-3-me@svin.in>
 <3f3440c3-4a1b-a272-c445-58ff7341bfd3@linaro.org>
 <e05dd835e5ad4cb9aec3ccf0c7369c30@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6df7fd7-7f0f-a223-0fe6-2ab25cf6eb59@linaro.org>
Date: Fri, 24 Dec 2021 11:56:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e05dd835e5ad4cb9aec3ccf0c7369c30@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 0UZ4Wl+M1XpP

On 12/24/21 5:02 AM, Vasilev Oleg wrote:
> On 12/23/2021 7:31 PM, Richard Henderson wrote:
>> On 12/22/21 8:50 AM, Oleg Vasilev wrote:
>>> From: Oleg Vasilev <vasilev.oleg@huawei.com>
>>>
>>> Using a physical pc requires to translate address every time next block
>>> needs to be found and executed. This also contaminates TLB with code-related
>>> records.
>>>
>>> Instead, I suggest we introduce an architecture-specific address space
>>> identifier, and use it to distinguish between different AS's
>>> translation blocks.
>>
>> Why do you believe that asid is sufficient here?  You're not invalidating any more TBs
>> that I can see.  What happens when the kernel re-uses an asid?
> 
> Hi,
> 
> Sorry, I had some comments for the patch, but forgot to put it in.
> 
> So, I think I interpret the term "asid" in some other sense, namely, an
> identifier, which is constant during whole lifespan of an address space.
> Same as PID in that sense. Do you think this is a viable approach?

No, I do not.

> If we assume translation table wouldn't change during process life,
> after the death of the process, all it address space would be anyway
> unmapped and corresponding translation blocks would be invalidated.

While this assumption is often true, it certainly isn't universally true.
Consider the cases of dlclose, followed by another dlopen; or any JIT.


r~
