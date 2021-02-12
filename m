Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp3449734lfc;
        Fri, 12 Feb 2021 10:38:08 -0800 (PST)
X-Received: by 2002:a5d:47ae:: with SMTP id 14mr4884754wrb.378.1613155088541;
        Fri, 12 Feb 2021 10:38:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613155088; cv=none;
        d=google.com; s=arc-20160816;
        b=cV+hOFz0BZ2+CEPFdmvDNwCqwtv5iJ6gQK0XV/bBfSpmxrJQYtBr6rKYUd1/cZj8Ea
         LNVDqrl98JJY4v4W5KUhHdby10myVafE4uF8+mYI4edpKQvnHS5qFEDmzuHzoco/58Tg
         GCZgEUpzKiGhwCdq/K8ltLezIICB6cWKQx51dq9oY0Csz6so9XRbCAoyU1Zs7PRE2NUH
         ZO8YJ4sZi7Vt68SznTW12cXaWqJk7OG5FxU/Zjc6oNehCJ5AkZdd82YuVazewRBoYEL+
         s7XihiAIX5EdmiopAkujZWd2qLyhCioOPpDCAoDL9SFLmDsbg1L/KH59uk4ng0KgrpXm
         23ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=FFIi3TXvMYzhbt4jBTGb8g8HO7wJ0jCnBq/XPrkq11Y=;
        b=VFfUmSCjss0pzGC3hzKp7MUY1GoGUwyLEZLTmz3IRiGnbO1538w5BRILOUPPlOHMTx
         nkXlUrXvpQsUUd67IdPEpwwratWpKTgmjgh/zQc/n4HNGWiclge/jkrpCb7xs2dvNJ4U
         v91u76sj/JGhkISTxENJ0CGVIRjjnE50KfO8/skAxhTNaF+hnBRSz+Syg+pJTidTmmGW
         cms6tpVAzz4Qwl1QH3Sj/4ITVw2AEuYE3ThrVvTICEBt3ioicQG0OAkdRzwXMPlNVt9e
         kavEUmDF3ErlH/crqSrz1Cr6Q+4xCfuPqaqaiITrKhidfsiq1xfQy0gbj/V1LNsul2TJ
         PsYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JG2KnB4K;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y16sor5240129wmo.17.2021.02.12.10.38.08
        (Google Transport Security);
        Fri, 12 Feb 2021 10:38:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JG2KnB4K;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FFIi3TXvMYzhbt4jBTGb8g8HO7wJ0jCnBq/XPrkq11Y=;
        b=JG2KnB4K3cGEUqbKsrKB3SP+uoTNeagqpJW2vOJVRBEgMoAu+0fCHAdNJTO86wGP5Y
         rfpgvhAw18v2NU9iE4hlATT7wuuTGtvVjHZJ9n02PUc71VSOgL+FaLMqMODmt//cm7D+
         rb7678KUSe70sDDVvY0FwdnGKZbMMHIlwSSaG9b8PSQA5xZ0K5pE4aP/EPxK2OWxWJW6
         my4le/1nmzCkzqM19XTYk0bKvtqwXC9s5qNGGteS5O0Ip7klB2EAk65sGt7f7rWP6tZr
         yMB3aOazDrTko/v/AqXHVnbHzjNciFVeyg4IEi5xvEbEFwNP0+Sb+ceevSpHNUdfjI5A
         +F8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FFIi3TXvMYzhbt4jBTGb8g8HO7wJ0jCnBq/XPrkq11Y=;
        b=B5HhPZ75vhj1lgxRaOmRCDSZunemfNsfJYlnZ1uoonmiqzPRys9oaxQV56Eskgcdyc
         e6sXUtTdM7CgaSpdN9RHKzfrll7Am7hxKknxNfK2LCAuwl5fcuL6+S+ZalNqXJdCpMdl
         LXdl95NgCQzQvL+eDwfSNDA8iGteG7K5uoC0EFHc6yHZrbur6M3e6U6zeMrjjdNWxJVE
         cOhpVpYGYKa3A3Qidnt4FtfLnPnejiVcYR2kiC1lW+dTb7M0eVKBkpXuI/Wq4ZDbgyFT
         hPjIXut8KT8fGI9kbWkfCHgXsmIvyvcS3JsYCU3IX5AByTF1cIcOIBH+Rthg98EVD1E/
         ENfQ==
X-Gm-Message-State: AOAM530zPXOPFlN6eYTJ4cg6ISzjCuZ3J43F5il6NHy8rB61LfJBz8V3
	Vck33FoLWn1b06nX3Dk7oB0=
X-Google-Smtp-Source: ABdhPJzT9cDjFafhPtUm/g7cE6GCsCnTTbMO5zu0+kiqgsSZWLjUPM+rZGlvnKECyRk0CvWsrYYSBQ==
X-Received: by 2002:a7b:cf19:: with SMTP id l25mr3802092wmg.85.1613155088340;
        Fri, 12 Feb 2021 10:38:08 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id u14sm12117300wro.10.2021.02.12.10.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Feb 2021 10:38:07 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 00/24] hw/arm: New board model mps3-an524
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
 <7d4db6f0-1e11-afb1-2b58-2e115a0a2dd0@amsat.org>
 <CAFEAcA_qZ-k7jZQ7NUxQ+BXQ5LtLC1ogorKaE1iwz2Mm00Xwcw@mail.gmail.com>
 <CAAdtpL5Aq_1nQhXPPEinosdoD6sUV20d-kDWTZcKhiQZtr94Fw@mail.gmail.com>
 <CAFEAcA9vvfC_DOnrzSxftXPydfUnucqN6VQtRcpP7LEm+Wy+qA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <edd96a95-f484-96d0-1b1b-7481a13e8d88@amsat.org>
Date: Fri, 12 Feb 2021 19:38:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9vvfC_DOnrzSxftXPydfUnucqN6VQtRcpP7LEm+Wy+qA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: dQH++ZH+x8WX

On 2/5/21 8:34 PM, Peter Maydell wrote:
> On Fri, 5 Feb 2021 at 19:31, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On Fri, Feb 5, 2021 at 8:21 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On Fri, 5 Feb 2021 at 18:05, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>> On 2/5/21 5:59 PM, Peter Maydell wrote:
>>>>> (The selftest is part of the AN524
>>>>> download so it's behind a EULA click-through and we can't put it
>>>>> into an acceptance test. We might be able to get something
>>>>> based on Zephyr or Arm TFM.)
>>>>
>>>> Wondering about that... If anyone can go/click/accepts the EULA and
>>>> download artifacts, then I'd like these tests to be committed to the
>>>> repository, with a comment containing the download link, and the test
>>>> can use the skipUntil(BLOB_PATH && BLOB_HASH) syntax to assert the
>>>> binary I downloaded is the same you used for your test.
>>>
>>> I would rather not get into that. The selftest doesn't actually
>>> exercise as much of the emulation as you might think anyway.
>>
>> This was clear from the previous paragraph, I was asking about the possibility
>> to have developers/maintainers individually accept EULA to download artifacts
>> for integration testing.
> 
> Yes, and that is the thing I would rather we didn't get into.
> We should just have suitably redistributable acceptance tests
> where we can.

OK, understood.
