Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1422876ejc;
        Mon, 13 Nov 2023 07:44:34 -0800 (PST)
X-Received: by 2002:a05:6512:3441:b0:507:99fe:28f3 with SMTP id j1-20020a056512344100b0050799fe28f3mr4092163lfr.34.1699890274565;
        Mon, 13 Nov 2023 07:44:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699890274; cv=none;
        d=google.com; s=arc-20160816;
        b=G3Kl/IAVXipHakUqSkHXvK30I2/na2BIec28TmyHN7QMVRKdt3eaJ6WPKKXPb3YboW
         ciLc00ar1fjlynXsuqSyzuRm3qLL9jnmtdy2KCmBdfppneUsv6ypyQvkziMSw7APIZbx
         IAB2JuoZYhI8S+CWEfRfbN0PMfifWAU+Xzf73hUqzoGyQMDrKfwVAdomV0kVLqypmR7L
         vAtrtnFYxQWoyupe4xtmdAR6yztMSZiRnZj7KP6Pj9AiOHyX6AXTa3DVqCQi2aiNpT2y
         n3rGi7x95bCWZqPN5qMFKhza1TgfzIZUsX79lBaz0+1l4beBZKZBH0CU77YeWaKB5b6W
         s+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=b8wJckh9c9DAIPaY8C9Mwpjrc/Mbkz3CSbjHl9DJNIQ=;
        fh=HqjL50fGvw0OCAHQh/59/6YtcdDPZ3EcW/Jc4dKzvD4=;
        b=iBse7S1dlgSY2qXU51NUNHsqyS9mod4lbZOCEUaiZchbdYkw2X2KrBJWQyvqOLZvh/
         ziwJQgBMMzUZdFhWN/a1ghGDFG87TeIKPJlInhAwFcXl8dNkBg5pIu/lwQRgrqly2OhC
         KsYP9qrQ+S6GvYE9l7Bl4Cv1axOC3PJO68wQrUz94WWu4/qpIgzFk/ybqeldoFSVIUZH
         fhcGUsLKrLYYocC/iYD2C1fM2AI7F/1B14U59zk1qCr4j6fhURkY4YZO1LAZc5lLH6QU
         FX0LcKGja9WpPy3OWqt3PCVYFfnLiHuaQjf+ynHRkFuR0IvkJ0+j0EpWISQ37vK/J8JG
         ojBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A0CVEV8a;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f13-20020ac2498d000000b005090be5cd4fsor1065066lfl.28.2023.11.13.07.44.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 07:44:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A0CVEV8a;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699890274; x=1700495074; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8wJckh9c9DAIPaY8C9Mwpjrc/Mbkz3CSbjHl9DJNIQ=;
        b=A0CVEV8a8MJl3duHUMCtnIEIh4KY5qMuNt2M+FJ/b2wSHEyEjifa5mtTHndeLxrGjA
         eV/3+g5H3LIEuaDBlodkOHA2qDfhLI8ZE0shIQMhsOqcj7+BSuHztmo/rpJZRYPjy2j3
         ZYr76SntYJYUcwFgZnWTDhJiMjaIjKYeYMeUTT7J4s0i7nVK1PBVh0QlbF6+obMi9RAM
         U3zYoS8ym8F0Jj6VyGKVCkeeDGt4lCTXp37Y7g7tSNoOWPlrsqfikS7i1ENV9woCAvEY
         mQmAknFfNauIR8M8M6VUOYCdr/po0KGODYNneEhy+dG/2NEBXAZ3pyeLEh5zkGH6d+Fc
         hW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699890274; x=1700495074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b8wJckh9c9DAIPaY8C9Mwpjrc/Mbkz3CSbjHl9DJNIQ=;
        b=RVFFadjNYEVtocFM/aDLnW9SDFZV81hpEbcygRACO7ZDa4UweAwLqANl80YMdLMQDu
         R5lxZjbTUQoyr41QInXQf8JlLNzFQo6jdltNAGk+JLIDGk5RwXWTyqgJou3MB+ALGoVC
         8S074rSlpDRHoLSTUiwrm65FMGBWkM7IVZxN+2umZyDwUdGK7mEWkNCGBaVIl/Ih4VYf
         Q3aDWNqoGLrgxx5EIITN/uXm1X+1SiwD/7vZmF4Zz33aumt+3Jl2egjOtbnj3n9BbfGH
         /7nx2zg7yTMSMLgPzWk87xaCRP68jwO0ooVQUZ6a0IetUSDFk0+XDTg2Vi0IrY7fDNVU
         LotA==
X-Gm-Message-State: AOJu0Yz5bGBGudqxf5+PW59mihlKfBfqFESooiSBe6T9YpG2h8yrhJ65
	MVZs7SAdfz15MxvI0NAVYYY/Sthz
X-Google-Smtp-Source: AGHT+IE3zFYvOZvg/BeMnFU/aXqqKzf/zcPPT7OJuFIBln2ZvlAfjekdREr2wAqFApWBEF5QzAOCRA==
X-Received: by 2002:ac2:4a74:0:b0:503:3278:3221 with SMTP id q20-20020ac24a74000000b0050332783221mr4282625lfp.69.1699890274055;
        Mon, 13 Nov 2023 07:44:34 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.164.221.204])
        by smtp.gmail.com with ESMTPSA id q24-20020a17090622d800b009db53aa4f7bsm4201445eja.28.2023.11.13.07.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 07:44:33 -0800 (PST)
Message-ID: <fe730485-9f49-4333-bcd5-c6e452a2787a@linaro.org>
Date: Mon, 13 Nov 2023 16:44:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2 v4 00/10] hw/char/pl011: Implement TX (async) FIFO
 to avoid blocking the main loop
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Gavin Shan <gshan@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
References: <20231109192814.95977-1-philmd@linaro.org>
 <CAFEAcA8MJeX1Jk_-ONP1nNgHYadL7Oa8P3jGQXwNoofQnJWk8g@mail.gmail.com>
 <4ffed8f5-6624-4488-a74f-567cbd926b78@linaro.org>
 <CAFEAcA_0BfGVDZWJUPs8hwYRKS8FmzppQgY+s83qxBXHjLJvnw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_0BfGVDZWJUPs8hwYRKS8FmzppQgY+s83qxBXHjLJvnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: T3uiM/zJX1dW

Hi Peter,

Cc'ing Mikko.

On 13/11/23 14:11, Peter Maydell wrote:
> On Thu, 9 Nov 2023 at 20:59, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Hi Peter,
>>
>> On 9/11/23 20:29, Peter Maydell wrote:
>>> On Thu, 9 Nov 2023 at 19:28, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>>>
>>>> Missing review: #10
>>>>
>>>> Hi,
>>>>
>>>> This series add support for (async) FIFO on the transmit path
>>>> of the PL011 UART.
>>>
>>> Hi; what's the rationale for the "for-8.2" targeting here?
>>> What bug are we fixing?
>>
>> The bug is on Trusted Substrate when the ZynqMP machine is used:
>> https://linaro.atlassian.net/browse/TRS-149?focusedCommentId=149574
> 
> And have we confirmed that the async FIFO support fixes that problem?
> That bug report seems to have mostly just speculation in it that
> maybe this XXX comment is why...

Mikko tested the v2 (or v1?) and confirmed it was fixing their problem
with TRS.

That said, besides the v4 last-minute review from Richard just before
his US holiday WE, I have to sadly recognize -- although I could argue
this is a bug fix -- this series is not yet ready, thus will miss the
8.2 release :(

(Mikko: no need to test this one, I'll Cc you on the next one to get
  your Tested-by tag on the list).

Regards,

Phil.
