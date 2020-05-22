Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2666428lfb;
        Fri, 22 May 2020 08:15:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySVgJoBBO8qtabORZYCjagqN2X/ZxI4sy5fNUl8PNGUJiQHcyf2aa0pXf/NAtULmOrT8/P
X-Received: by 2002:aa7:d39a:: with SMTP id x26mr3160153edq.207.1590160539504;
        Fri, 22 May 2020 08:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590160539; cv=none;
        d=google.com; s=arc-20160816;
        b=fl1BGI4zZCEsJo7LcW4q65entmt6IJGXrYZI7btUHW8p61H7UPOT6Rlc9+twVLPAqu
         capFibjeZhtuPxr5+clJZ2OlquGtZedcILUKsps23NOIODJvucnPWIc5oopB1+eY3Gmy
         cM1OCzdDWRtGqZYwgZPam9R/SXpXmRjsW5P44XTvbLwMYPK7S0UcXZN5V7ck1Q29aGwl
         8iiUmd/fPfhoXPLM34j4sfTGEBCNhiUEFiqnvETH5UqEDBmn002K2SUTxzyhoS0rjg3k
         YJCmauR8jlqnxT0tMqhjFADR2v8xyK2dxNSQ+eAcdeAabjVdUGnNRgVlC0tUhj4gYUac
         3WPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=bgwxBnm8VD+Y/kxKW7/OF/c/OhXh/FcLyD2iTqVqTJ8=;
        b=y1OD4PDjtLA7Tu1+PfzF6uVtGeTZF0VlvIkMgLitOVQYC29zeyku/enTHIiJFfBZBK
         EnJ/bqj1QhxzKIXbT2Ft87ScygBRgMHGTZUEmaI0X0gjJ54KsGrLZtGPipOI3OGnCeUi
         PIZDuIgTbMpp87Y5vr/JUIMSvsTTg0xUsFfmLusZuN++8nd8aAtWXZu6C4K/TumvXL+/
         4nZoerpvboh/VelmKKO6Lm7uHKafSpoo7j7DdpwXUiCd/jDRNdg7Cr38O2RDX/dZkGA4
         EaGmDrp52KQLR0LxhZ4GWK37LL/uZKmDHg92db6/E5QPd6Tb2h5VwsTWe0LQZf/HNqwZ
         1YAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YBGni59k;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id c18si910284ejr.84.2020.05.22.08.15.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 May 2020 08:15:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YBGni59k;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590160538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bgwxBnm8VD+Y/kxKW7/OF/c/OhXh/FcLyD2iTqVqTJ8=;
	b=YBGni59kksS5yPDeGTejEX+WzWSIddW594ejNWEWxMso3V10M5uYHyPPALDFpS1i7CxbS3
	PtmMI6bC7wNZOgf0jY2NYxBYePxRQmKhttVXWuEiXSGkZd8Zrgxph2GzCUhI9ynBc7nzQB
	2FjGe2E1Fd4590szUS6bwoh7nVf2pec=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-MijILOt9OXO-tl2v0xxX7A-1; Fri, 22 May 2020 11:15:36 -0400
X-MC-Unique: MijILOt9OXO-tl2v0xxX7A-1
Received: by mail-wr1-f72.google.com with SMTP id n17so2349751wrr.22
        for <alex.bennee@linaro.org>; Fri, 22 May 2020 08:15:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bgwxBnm8VD+Y/kxKW7/OF/c/OhXh/FcLyD2iTqVqTJ8=;
        b=l+/+kDOzrnVLaWr/khTdylpV4NmNmVHlB+5tZXCDp3aZG80tnCe41nHwt+fxUme6U/
         /A8B0wN+DdjQB9xNOWveQPmzT3geWRf47WwunzLW1bzu8Zh7mmsyz+99zc+TanifyBPT
         hpZ+XWb5ABTDFRrdO/p1i+yRmux6fkpuZrIueR0+bJViushQMFMeMaKyg6RW0Jev1kvv
         Mt/CphC8qWHijf0hT4OC2KQ5QQU1WcRpl1Oci94bznw+YWxJ7aLOpImyJWhEsO+OXCPf
         WDMDH4xgdbWamILBo0FGXBgTY/4bKoiMlkh/0sjxSq+bMIgxM8M8MpQMR6s787LZPtdi
         ZMGA==
X-Gm-Message-State: AOAM5332+Ik4Be99sTgdZBTQJXOCq5Z5dwbXoH43UA3uGyGlOknUec7s
	6VOe72tTgz8vgJKR98qQB9Aoorqk6+9ZkuexNXwQyAkAYqRek0wrJ90+6YIYlgO8uIOAbmejAmL
	3jDmQMqQZafSRa5va
X-Received: by 2002:a5d:40d2:: with SMTP id b18mr1546089wrq.131.1590160535594;
        Fri, 22 May 2020 08:15:35 -0700 (PDT)
X-Received: by 2002:a5d:40d2:: with SMTP id b18mr1546051wrq.131.1590160535216;
        Fri, 22 May 2020 08:15:35 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id r9sm9719735wmg.47.2020.05.22.08.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 08:15:34 -0700 (PDT)
Subject: Re: [PATCH v3 09/11] rules.mak: Add base-arch() rule
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
 qemu-arm@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
References: <20200521195911.19685-1-philmd@redhat.com>
 <20200521195911.19685-10-philmd@redhat.com>
 <ccd78343-795e-8874-e4f3-bb6861ea64f0@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <c96d1032-d702-c957-f85b-82ac4663c859@redhat.com>
Date: Fri, 22 May 2020 17:15:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ccd78343-795e-8874-e4f3-bb6861ea64f0@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: Q75pqt8mBNh/

On 5/22/20 6:24 AM, Richard Henderson wrote:
> On 5/21/20 12:59 PM, Philippe Mathieu-Daudé wrote:
>> +		$(if $(findstring risc,$1),risc,\
> 
> Eh?  riscv{32,64} vs openrisc.

Nice catch, because with this patch openrisc builds with a riscv
config-devices.h =)

> 
>> +		$(if $(findstring x86,$1),i386,\
> 
> Do we really not need an exact match for x86_64?

OK.

> 
>> +		$(if $(findstring aarch64,$1),arm,$1)))))))
> 
> Exact match?

OK.

> 
> 
> r~
> 
