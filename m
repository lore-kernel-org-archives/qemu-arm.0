Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2094799ejc;
        Tue, 14 Nov 2023 07:00:13 -0800 (PST)
X-Received: by 2002:a17:907:36c5:b0:9e7:c1cd:a4dc with SMTP id bj5-20020a17090736c500b009e7c1cda4dcmr6543822ejc.6.1699974013419;
        Tue, 14 Nov 2023 07:00:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699974013; cv=none;
        d=google.com; s=arc-20160816;
        b=Qp5rJMedvj2Sk/SoqfaoCwvAqFZZUb0vBqjyL1XsRKVMXsrZhvScqp3cmzHgNvMsVo
         IVAnMXUy3G2JBuecp1+qpbrvLH404e56b+DWYkuXsr6WQd/fEFmPz6U/vQeYQgCxeJt0
         ojsjGaWZCtLLBxv4sAcz/86sZWEKfjtXSG+lZo0J6l7Gp115L/rrQs0Rk/L/ZICVrb8g
         je8d9pGoRYT72KwLXc1oaK4imlpf/KpdCWbg+d/DIDTlr2WSHCiQRYbtbdgtUYMijySc
         fwkaiiW3hKhUK8eMVsQPZ32YKsEqBUgYYFoGgpk+FHR7xnp8ki0dLmIkkuI8ufh3222H
         D35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=hvwMnVTQaJD67434mMenkNkErgsf9DqTmkoP4qGMiTA=;
        fh=UHvDv+zkP5t6T7JK4PPrDv1YBJtZN5X3weQkuBCbTMk=;
        b=hOOlsSX6EJm92YXq2wn1hZTUchvJ4cn1NNp1D87hscFMCn/cM+ffw/EM7Sbk/J2WAb
         HDmJ8R8wVxBlc1r6v80KK2loa+ESaAKDOIqlUYkw/kFpBkynKAtVCbHR7JxxhCazrnxu
         8nMtbwmCRNaAzuD+1I2A4OPoQ/oN/bDOeM4AgcM26vt8bjsqB13q0xPr1l0T6yFjLROt
         yDC5HfEZJvR1/KReB9YXNxUjRVJjDRW9VM7U+jahhe+Z2rChW07rdyeGu41ei+chZe5w
         88bJjuZDWzcf3QcUMVwGa0E21b8x34y/2arisFEExshpwCYFkyfj0L1OD23u6IMKDoUg
         kEkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mP02VFcs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z11-20020a17090674cb00b009cc5a59054csor1889361ejl.7.2023.11.14.07.00.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 07:00:13 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mP02VFcs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699974013; x=1700578813; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hvwMnVTQaJD67434mMenkNkErgsf9DqTmkoP4qGMiTA=;
        b=mP02VFcso9iJG1S2qbadPjk4tkNwIszixBFnGEMhsR2XnU0cw+0DQLtkqRmGq43+VS
         l3IBzZ5o4dCrtU74UUphrSJ0A2zEUee1AdwRtKj72kzFzbonMy0r5m+GpZwfZQ5xQscS
         d/L4CTR/p6PhE6g3YTqyuOYsn2CfNmWMZjjbiKes8MHAbUuMZVj0vtBqY7SFmTgiud+y
         t9N1VRr9IXwMLydmvqNsATmNT5wMp4WodYBmm0xeflgiNJwtPUAj2XmXxzU74US1l9L6
         rfAFODoGN5SuasIXX9fNcBMpP0iyPILma0yLhOGv6tPh/4LfM6LoGQU1efwIxL37dy5d
         8bwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699974013; x=1700578813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvwMnVTQaJD67434mMenkNkErgsf9DqTmkoP4qGMiTA=;
        b=E4M/N7IxPY9lMF3lzAX3tDurIhtawkt8VrFwaVSnIV9ldHgEOYeBDNRZLU38AtOm2a
         KDNig3Wrn6Oz+cV1QD8CpbOmOqqPqS8NcI0qiH1nuyoxmzfkTHTD4L+Q1/j8Tf8BdTIB
         E5sLV02+WZLVKdfFy33GrgDjKM8JULZZM1gox6Ffn0yuxctgvTEiq7ReuRizrdbTUaOg
         l+hvQxB8XLB5aXsQ/9iYbNw1l399d/oyooBkSLDpI6Eq6BW/EQF28bMPU60T2xQoBaNl
         BBPrWDq4RTcXuTZOQLAmiMaSYpvo6bs8MSxjFtKUSL2JN10PerinN4KFfGYnD/FKYLuQ
         t9JQ==
X-Gm-Message-State: AOJu0YwtAAAH9RVzPoacMgZw532qTjdsLUwcbr5LsYiy77E0r/KG1pcQ
	mvgb68MjYYKQQayD3X9BCaQz4c8N
X-Google-Smtp-Source: AGHT+IHf7MXlWtvkPtL4rKaxAjHGg7eiFZd1cU9GCPUEE1OMwcKoAJdSYUPudWARuJ4FPvDMOa6uyA==
X-Received: by 2002:a17:906:7e06:b0:9d3:5d4a:8b6a with SMTP id e6-20020a1709067e0600b009d35d4a8b6amr7254726ejr.42.1699974013091;
        Tue, 14 Nov 2023 07:00:13 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id ay18-20020a170906d29200b009ce03057c48sm5685319ejb.214.2023.11.14.07.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 07:00:12 -0800 (PST)
Message-ID: <407f32ee-e489-4c05-9c3d-fa6c29bb1d99@linaro.org>
Date: Tue, 14 Nov 2023 16:00:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 v2 01/19] tests/avocado: Add 'guest:xen' tag to
 tests running Xen guest
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, David Woodhouse
 <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paul Durrant <paul@xen.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, kvm@vger.kernel.org,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20231114143816.71079-1-philmd@linaro.org>
 <20231114143816.71079-2-philmd@linaro.org>
 <94D9484A-917D-4970-98DE-35B84BEDA1DC@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <94D9484A-917D-4970-98DE-35B84BEDA1DC@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 2HIVADjQ4o4I

On 14/11/23 15:50, David Woodhouse wrote:
> On 14 November 2023 09:37:57 GMT-05:00, "Philippe Mathieu-Daudé" <philmd@linaro.org> wrote:
>> Add a tag to run all Xen-specific tests using:
>>
>>   $ make check-avocado AVOCADO_TAGS='guest:xen'
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> tests/avocado/boot_xen.py      | 3 +++
>> tests/avocado/kvm_xen_guest.py | 1 +
>> 2 files changed, 4 insertions(+)
> 
> Those two are very different. One runs on Xen, the other on KVM. Do we want to use the same tag for both?

My understanding is,
- boot_xen.py runs Xen on TCG
- kvm_xen_guest.py runs Xen on KVM
so both runs Xen guests.

Alex, is that incorrect?
