Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2517983ejb;
        Tue, 24 Oct 2023 22:56:21 -0700 (PDT)
X-Received: by 2002:a19:760d:0:b0:507:99fe:28f3 with SMTP id c13-20020a19760d000000b0050799fe28f3mr9662962lff.34.1698213380960;
        Tue, 24 Oct 2023 22:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698213380; cv=none;
        d=google.com; s=arc-20160816;
        b=O0KBUtxHQUNdYDvuXHz2I9P8WnAHjLXn6vJywQHFDjf/eo6sVjtYYVUtdtad2lq/zA
         Nymei46L1JkM4Vyt7dfubdQg6h4uzJXsXAHx1LzO/B6XKbGxRz1jZSU2K1mMCxMVYDYf
         2UPigJ2xWWX3gD7dhjWrMrz5cqSRxgyv2568lfprZh0gRSPC40Efo0ir/2xmgu1FJsKc
         3zsURMBrVVXD5CxrpWJ/IJsB0Y364HAf/jqib/mI8mD0NQF9q+IhKNGGVwYlImhhcsbo
         usb7987kwx4UmZHWOs6/qoorHpslpTcQKy2eJQd5Xrd6jbdvK7D9I5rpa/BplfANhFa0
         NreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Zs2gbkRDyur7pDchslP/aRzZiddSMfd3l/SL3nFyX28=;
        fh=v5DAvpHimjbHRY6WvbvbJNku45/2ADu0pMweeoySuIc=;
        b=Z8MrEeob2IgQWMfTZtZtlKOemj4uHoZIn5N42+i+x7aMcJwllryjErUMuUXIL0+jLG
         EJMJF2ihbZBJnbd95mjX22wCbhDdlfXYgEY8kAdYIvHJ8BOlvtCPx2nDEUhMCFQFTZ3l
         HHZHuIB5Ac+wNz8dA0OROL21AgsX8Gap/YotjR1N6Mo77QmyGeUmRJp6550FXFt1Auur
         HThvTpVfGSCB4+uUjt/GI44rlrcztAtB1RFYSwy9ZGcijTrpK9UGbzFyexmn7wJ6rcq7
         ttJeYyAENL8kZ2L1Qd+ioK0aYxvojvkuJ/4JyqV7fcMytVOQ/Ap7HZeNd+HoesgEDZgh
         zNgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hw0MubMu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a8-20020adfe5c8000000b0032de6f06cf1sor2130724wrn.9.2023.10.24.22.56.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 24 Oct 2023 22:56:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hw0MubMu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698213380; x=1698818180; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zs2gbkRDyur7pDchslP/aRzZiddSMfd3l/SL3nFyX28=;
        b=hw0MubMuG4wcY7jGz2PG3woM1oaBu3gPfmxEvhtQD+BdrlarsfMbYqJWaE4u2aN5c/
         /JUauIlxB7BLj3eliTyhf6RnusJOYx1w6ePKXlyqLFx/5Pf0CZjYTGqt8odWtCo4bjqX
         evxbq9CCXg9NGb4XcvH6C8TtPr/cmd+be/8Q6lYO9Fuapfq8klib9WdnakxWYurq6L02
         3vfW241SUaDpI5HkC1d/pTc+AUA0IkDYBN16BOBSV0n31JYy92vIqom5r5tnW2JB97ET
         +/MwT1OAFlhGDHB7ank1w3PW9y2oXfHppa0HhjxDKZOT2bV9ggM6osDRCGf7u78sP/bk
         zZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698213380; x=1698818180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zs2gbkRDyur7pDchslP/aRzZiddSMfd3l/SL3nFyX28=;
        b=Fm7wkbRMABHxkpzkOkbx8QFsaePdY/oo5pQEnyGomd2Npvfd79qlSrnd7PT5yx72AF
         9r6xKllIsOA/Vrf064FB8JMmQNRT0mvXgLxK9Z0G/1fYNvvGacNXmH1uMDkKFBlXV52u
         SwDHPerPNhqdlkGxB0G6ZhrB+7dtZLC42y922pXMFHxCDA7XT3P6RIBd68FIiz7F8MRk
         T8NlUd+yoC7LvfU3Fhq/lgsiJu/ZoK4xGoAvosa4n35WXSTMSZp/OadcOh2NO0U6+crc
         uOOJPpjHHk1oKgj76B52DLWNbYmHkCilsW7JceCS9NgHKZSdWJpTtWzOmurIT+shoBTE
         EIFQ==
X-Gm-Message-State: AOJu0YyOP0Er141yWx+ExrNQwElaQEh99pBhFKkd1/aev1TCUTLwgh68
	iNN6HA+7oHUvAv09nGI25rU/NAop
X-Google-Smtp-Source: AGHT+IFwV3DobD21uGM0FXN6Tbc8qhFQQ3RNRMrGncB1heXMwwTT3NCxlhg2JTW5kfdAQ+x9nTvYyQ==
X-Received: by 2002:a5d:5744:0:b0:32d:82d8:3442 with SMTP id q4-20020a5d5744000000b0032d82d83442mr8044347wrw.53.1698213380397;
        Tue, 24 Oct 2023 22:56:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr. [176.171.219.76])
        by smtp.gmail.com with ESMTPSA id p7-20020a5d4587000000b0032db430fb9bsm11280228wrq.68.2023.10.24.22.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 22:56:20 -0700 (PDT)
Message-ID: <98eb2407-8612-c617-ec80-a6ac1ddda3fd@linaro.org>
Date: Wed, 25 Oct 2023 07:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v3 0/8] PMBus fixes and new functions
To: Titus Rwantare <titusr@google.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, minyard@acm.org, qemu-devel@nongnu.org
References: <20231023180837.91785-1-titusr@google.com>
 <874jih40a3.fsf@linaro.org>
 <CAMvPwGpXZxyoX1WNypgNCW+Uj+bcVPn99vF71Myx7jn_c2Fjdg@mail.gmail.com>
 <87zg082twp.fsf@linaro.org> <c87866ad-568b-1917-7617-c63b137a196a@linaro.org>
 <CAMvPwGpyE0BVKJVEo+bZsQz99W_O61fW4TzEwm7A6bCd0bsJ0g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAMvPwGpyE0BVKJVEo+bZsQz99W_O61fW4TzEwm7A6bCd0bsJ0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1WkilyDlNOXw

On 24/10/23 18:07, Titus Rwantare wrote:
> On Tue, 24 Oct 2023 at 04:50, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 24/10/23 12:06, Alex Bennée wrote:
>>
>>> A pull request is really just a GPG signed tag that you push to a repo.
>>> You can use the existing git tooling to create the cover letter for it.
>>>
>>> I've included my exact steps at the end of the email but really it comes
>>> down to:
>>>
>>>     git tag --sign your-pr-tag
>>>     git push your-pr-tag
>>>     git format-patch <series details>
>>>     git request-pull origin/master your_repo_details your-pr-tag
>>>
>>> and finally
>>>
>>>     git send-email
>>>
>>> My personal exact steps are integrated with my editor but are:
>>
>>
>>> 8 Preparing a QEMU Pull Request
>>> ═══════════════════════════════
>>
>>> 9 And send the pull request
>>> ═══════════════════════════
>>
>> For these steps I just do:
>>
>> $ git publish -b origin/master \
>>       --pull-request --sign-pull --keyid=0xMYKEY
>>
>> which uses .gitpublish from commit 08bb160e02,
>> calling get_maintainer.pl for each patch.
>>
>> Using GSuite, I also have in ~/.gitconfig:
>>
>> [sendemail]
>>       smtpServer = smtp.gmail.com
>>       smtpBatchSize = 1
>>       smtpReloginDelay = 3
> 
> Thanks all, I'll do some dry runs to walk through these approaches.

Tell me if you want me to unqueue your v4, otherwise I'll send a PR
with it in a few days.

Regards,

Phil.
