X-Received: by 2002:a05:600c:4f14:b0:353:32b7:b47 with SMTP id l20-20020a05600c4f1400b0035332b70b47mr4451797wmq.126.1645551223260;
        Tue, 22 Feb 2022 09:33:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645551223; cv=none;
        d=google.com; s=arc-20160816;
        b=swN1e8+s41t3++9MZOhpR1avLaauEVJFL1Ld1/P8f2OX2EplAqO0gwSvs+3L6HRp7C
         yqKliRPX5whwOhsFkebiGwxSsa/u7FM38y6UaWDn30suvvjrbQ62C42NLjXDRbVF5ne9
         /SYlxhLvnkWiVSFMibW7Ub/l4gLUzyOCUSFZk7VosO0vNGJWnHZZ8jda4ovX9exBgv6j
         gtEBS6LflScMXwtJImmC7MC8gHZc2fS5UbxUqkJUJgnZiIlkYXGfaLBLP7OQ1htcuRve
         72bMaOJSJYotAVTEsLf1yCLDlz0c9mwyWCIx1M3S1GRPhHOpIhenWn6aVToxAYsDU2Fa
         cTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qZLmnfjrVWGUsUh3atQSO7JD7Pzw6Vtie5hI2woz6dI=;
        b=tq/6R8zidPQjAhL4ZOAUs8kxAwjhSt2yXkk/S0kccMkPAebQJvFERCILJOCean2qnA
         GNQhtkbF0fsU58aGOENbz2AKmA0sOna50BDSKlSUJBPw17tvZ2YE6ORH460bBNhPnoH5
         /mNP5kH70Q5kt4TyEq9uI1VucCA5pCX47pcpqq3nOb1ZAoItivAVIuSWVv7I/DA8z6y8
         qrw4Civv6kuRZDjzS9ssQSqPgON/JQZPhgi8lLC63qikrppSz5kI/brXIqpn0v6IFQJl
         VOY5ioXHf6yqIa6dd1NU1L/Z81kBuIa59aUBiH1hj/BvmnYcM7KydEsDL08NrkMqzOtP
         Dvjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=acT60s1l;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s67-20020a1ca946000000b0037bffca3591sor1453913wme.1.2022.02.22.09.33.43
        (Google Transport Security);
        Tue, 22 Feb 2022 09:33:43 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=acT60s1l;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qZLmnfjrVWGUsUh3atQSO7JD7Pzw6Vtie5hI2woz6dI=;
        b=acT60s1lSiIGzhyqvZorD1b69R4aBJSZ+QAnwADjvGVMECGa50/CE3Sq70tclgN6+D
         eY0Ene6yPWxAFVxUAY4tfAig5R1VSoZ2x4YItuj7j3zyFlgZeasANCGGvbNq+0oQzuYl
         RtZFrPF7nvAQOYrFIumyTnhNmIxgj5yhMcNHtYhpEsY3jeXwVk5sRhdH/CQ3tfvRgirT
         UnEEsudpNRvwX6/I/iHJDugXLkcmJjYdjouB7J61wIEVSE5PLL60CXGK9LSdRzglGOkd
         ANaBhOgFqhBn1hrPXXG7FXKSaMUBa9LzEbiNLHp6WVYqPrUtFhVPq8ZiioWsS1jiFVy2
         Zp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qZLmnfjrVWGUsUh3atQSO7JD7Pzw6Vtie5hI2woz6dI=;
        b=zyi8A2yEsulCRC7Y+xHxQYPdCjJ6Pw7LsdsdSqf4FALwC0jfDrbNGgFLa7d6xgTT3L
         ylDKsLAQl75DRjPHe/Ft+JEArO1IxgUX+9lmvbln11bJqtH9c4Uty/vwkYO8oE/OLTbQ
         tbkAI2wd2EPnYW5kJsU8VTG5aYRloe/Tw0k5NsGiy/pl89Zs58wpTtIbFdBYPiZLjIiy
         d6A+WefV03s5YtMCvsnyhcQls/N9iNBC72TO8so0/wt+vrNVk7VPO261xVoqzpe5zki6
         V55WIMpjATORzbujTr/IuU4wQooDHNX05E7jJcv2/nUsSLexAVYMJkb1w0IsqCS5BC2I
         2ajw==
X-Gm-Message-State: AOAM532TGNfeRqf0PNc/Yy9KVv104+LoUwV9gXQkcUy63WM3whde+d6Z
	zj0hekp5ekR7ztG71bSj/Xw=
X-Google-Smtp-Source: ABdhPJx2QZMXe6tpcpZ30/gE56mY+F/lIGiBc9njhTNS7xX2No62I1ck7SjkOaA33z3q/mLtUYLz/w==
X-Received: by 2002:a05:600c:240a:b0:34d:c8ad:dc07 with SMTP id 10-20020a05600c240a00b0034dc8addc07mr4214655wmp.145.1645551222836;
        Tue, 22 Feb 2022 09:33:42 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net. [83.50.68.71])
        by smtp.gmail.com with ESMTPSA id i9sm33308870wrf.79.2022.02.22.09.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 09:33:42 -0800 (PST)
Message-ID: <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
Date: Tue, 22 Feb 2022 18:33:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Laszlo Ersek <lersek@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <cleber@redhat.com>,
 Oleg Vasilev <me@svin.in>, Richard Henderson <richard.henderson@linaro.org>,
 Emilio Cota <cota@braap.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Idan Horowitz
 <idan.horowitz@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <YhURfqMvRT4xbiz6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: x93EHuGHKoDL

+Igor/MST for UEFI tests.

On 22/2/22 17:38, Daniel P. Berrangé wrote:
> On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Bennée wrote:
>>
>> Alex Bennée <alex.bennee@linaro.org> writes:
>>
>>> Hi,
>>>
>>> TL;DR:
>>>
>>>    - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
>>
>> Laszlo,
>>
>> Would it be possible to do a less debug enabled version of EDK2 on the
>> next update to pc-bios/edk2-*?
> 
> NB, Laszlo is no longer  maintaining EDK2 in QEMU, it was handed
> over to Philippe.  I'm CC'ing Gerd too since he's a reviewer and
> an EDK2 contributor taking over from Lazslo in EDK2 community

We need the DEBUG profile to ensure the bios-tables-tests work.

If you want to boot a guest using EDK2, you should use the images
build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
not these images.

Regards,

Phil.
