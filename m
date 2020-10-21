Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5893503lfa;
        Wed, 21 Oct 2020 10:04:34 -0700 (PDT)
X-Received: by 2002:a17:902:a407:b029:d2:2113:7f8f with SMTP id p7-20020a170902a407b02900d221137f8fmr4755523plq.70.1603299874420;
        Wed, 21 Oct 2020 10:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603299874; cv=none;
        d=google.com; s=arc-20160816;
        b=HBbV8JHJqHIk8yVaqHuzpgczuvfTzBvSQJkrMK8471uJlP8M4Bd8Ghh5T4mO7RAUf7
         sqPonm35so/tLu+GVtbmBP0a9edHeKqs3zxhRDhiuBsBeUoBrBymqGXVf9aV2aMgguIN
         V937K+ILVWQAElqyZNzkVw7F1KMLZFs7H50P5IjKFHgvXE08PTfzLDoY8nBZtXNI1rr2
         gj4pymO44960zwdpnNNx65JkXv2EfvmkDWusjcWQLEIe6ItVGXCBfnaLHr4fg43mtf5P
         tTGnppUpk+OSX6z9qHz4OasmG0WF39OIJTubLb3x6kwGy6hF5MsORAGk/317A12Sk+vz
         x4/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=FZySLE1DeHmDSOzGWeUchw5plzxWugRNguJAN2bX7NU=;
        b=Pn/B+3xEnj+u7nwE+OP/n8RzwcvMTMXdjYPE7cBrPGJBgWPO/J39AktokubVT+ZqNm
         JCNgXbekdES6hbREwP4o0zZ9DhBUXUe7yFMANFUpg/DmMkyOmJ1px/as2SUzJBz6RQFr
         DSFyt6R4hHXI6rtOhb2cbRCpN+IH4OZ1W8iV65pXprkKZBKwXqwbimQsPnwNubeTjaNh
         ZZAjDDFqx8mIO78fjChChGQoLgi4nb9F6brzC6Dw2rVLRj+trGdSD4zdpMovQK/j8GRk
         AA/oOljHDjx2SM530DFiRjANUvwT0gWeXg1CD5p94/vmazt3ZJJitVXgXVrV3vtpQW5y
         hnzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NSeyWbhg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j36sor1451114pgj.37.2020.10.21.10.04.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 Oct 2020 10:04:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NSeyWbhg;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FZySLE1DeHmDSOzGWeUchw5plzxWugRNguJAN2bX7NU=;
        b=NSeyWbhg95lDWvjLp1a5XO/kUtzALiN9bbpX8An+mOXF9gJ8BN3alT0BVqrsB6JbU3
         T1ZcM8MoP2RU1j69QeaJh8ggQ1oVqhfk7xym23CiUOHZah0tqtVqkJwi17LkYXTa3Wdb
         VKgTd029jz5MfgGv/vSfG+nzuYlo8av5PzjpmY4ZTm/D8fBV16EtX08cUjrfRxG0G1E7
         K17rgjuhmg+AHv1/Zy+r+s37yiNeiLTp86CeJB+WY8MXjv4O7V3zlE8o1VzEbrr49XKJ
         n3R8WSfvECvi2LtvcqQo5EnGIoNZgpzEL5loLESaElIYFsIOSUI+aIMxboc8dBOI0A2B
         h/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FZySLE1DeHmDSOzGWeUchw5plzxWugRNguJAN2bX7NU=;
        b=c43sJxKsv+ehhYLc0liFNbPNJCLNIb36y2gx/SOlv6XkBPwUpegOnm6cVOvWWJnON6
         cCwIRd2oMCnTCZlegYAWMLm6A0qWcGU87qqAPM3IgZVyRpCeVJt5zUR2CKgvefqEAXUZ
         cbrwViHONjhYmLDiy+H1vNsF2BbEIeAjdUV2ohb1XJa7QhKIsrOra3ZOm7aqDSi2wciB
         UfI0eBO/t8Rr8GO3Ti0naP/w4+liTuD2F03QWhPv5daiL5BSVBapxo7fgJh2d90NIZRc
         ZDvwBOF+/rJ8DU6bbDUQNQep5BlHhqt9XnY6Pib6cBnTxwOWa3/zUWH6aUDbytIiwAPD
         AqRA==
X-Gm-Message-State: AOAM5321cAx+DBMvKGX2ct2+vmDZ3XMCe0k3x65gT427U8fEAKFIkwLD
	7dW9g9Vh9fe7ctcBgliWRGG+IlkC
X-Google-Smtp-Source: ABdhPJxWEp03z9GnR2oXpZInMi5i7jl3QXwJRFTVT8mtub3oZNUtcifilmBc3Zu0XLRpuhF9pVo32Q==
X-Received: by 2002:a65:4485:: with SMTP id l5mr4257012pgq.121.1603299873714;
        Wed, 21 Oct 2020 10:04:33 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id e16sm3058332pfh.45.2020.10.21.10.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2020 10:04:32 -0700 (PDT)
Subject: Re: [PATCH v11 00/12] linux-user: User support for AArch64 BTI
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20201016184207.786698-1-richard.henderson@linaro.org>
 <CAFEAcA9d7h=LCKP7B3G+Wx5CUr41+bY9ziyycGamL0EsTMgxDQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbd4fc09-2637-07ec-3666-276d8b0ed4af@linaro.org>
Date: Wed, 21 Oct 2020 10:04:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9d7h=LCKP7B3G+Wx5CUr41+bY9ziyycGamL0EsTMgxDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 6Fb9kZ5QmVGh

On 10/20/20 1:09 PM, Peter Maydell wrote:
> On Fri, 16 Oct 2020 at 19:42, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The kernel abi for this was merged in v5.8, just as the qemu 5.1
>> merge window was closing, so this slipped to the next dev cycle.
>>
>> Changes from v10:
>>   * Include Phil's plug of interp_name memory leak.
>>   * Convert error reporting to Error api.
>>   * Mirror the kernel's code structure for parsing notes
>>     (though Error means that it's not exactly the same).
>>   * Split aarch64 stuff from basic note parsing patch.
>>
>> Changes from v9:
>>   * Split what is now patch 7 into 3 more (pmm).
>>   * All prerequisites are now upstream.
> 
> Unfortunately the bti-2 test dumps core (x86-64 Linux host):

This is odd.  Works on my laptop,

  TEST    pauth-1 on aarch64
  TEST    pauth-2 on aarch64
  TEST    pauth-4 on aarch64
  TEST    pauth-5 on aarch64
  TEST    bti-1 on aarch64
  TEST    bti-2 on aarch64
  TEST    semihosting on aarch64

However, this crashes on an aarch64 host.  Looking at the trace, the compiler
generated bad code -- the difference of two symbols resulted in 0.  So we never
copied the test code to the mmaped page.

I assume your x86_64 build is using the docker images for cross-compile?  I
wonder if my laptop is picking up a local cross-compiler instead.  And then the
aarch64 host compiler has the same problem as the docker version?


r~
