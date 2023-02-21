Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3134786ejb;
        Tue, 21 Feb 2023 02:50:41 -0800 (PST)
X-Google-Smtp-Source: AK7set9yAjI24mPDdOrnEsDoEzBmKfC+qJhMmZOlNbnrPZ47obpproAjB1tHkmt4HbvGRnP4RY/N
X-Received: by 2002:a05:6214:1d23:b0:56e:bdf4:d213 with SMTP id f3-20020a0562141d2300b0056ebdf4d213mr7215178qvd.10.1676976641779;
        Tue, 21 Feb 2023 02:50:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676976641; cv=none;
        d=google.com; s=arc-20160816;
        b=LEk//nY5kNR3rgVcSNqmkZNYsOdeJ2dLCWknGFsvl53ND4gqjTwlCh/PcSBu62JUjA
         wSwh7XrL/4t9Tc9uulC9o52+Yy/IHcvqtCshqsCP6yGrGmY1sdBU1faum4EnJyz4s/Yd
         7TBPpdkM5IzVk5OwkZAtqy5I0H/qcS1ViqQapsuoJuA6CGB7rKKON0mWO9xrozp1z2HR
         FldpjKEB7VwXYzBNMZLZKJmGUPaA4g/Wetqi56y/9pOqCtp7zUpkZiaz75jtSv6jj1Rk
         uPgRTcFIT3qvIrx/JZGxALKQdehwlxnWeIsoLUt+T5NO9QIB7L0w8FSWux0tzmfrhZ8a
         y0cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fqT6Bdu+GaVBwMBVVOf3EnB3ZNrPZ8Lt4F67E3VKzxQ=;
        b=A7Fm+FQrIv2IZUFR0LfMbCI24+/o1vswuNKnY3997yTSnqbjxQKIFbvj+hvLQ1CPlk
         Xs7/MyDd6df3ybKE43v3/ZYbmyidP53F5X/mDa5yXCjoQxQiAMl3NylAIoeJ8AveueAO
         CJdS9Ey+VIKSj4RYfGyNux8bTdaS1E+kujCZCDNx1Ni22g3AwDljpIQoQEF+Mo+cmRrN
         Dg9apqQfr1VLdusX6gb2OYyNcrZnCM6SXvW1ntrdQXIeA8LbHVEe/oUhaYspi4ifDGfY
         8e7FfVbbLQV/pNd7r7wQk95zRj0ZyPZtmJnsSOQqTM51oBnbPvZvnkofCCT1yELW+YQ2
         I1hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NF7dAwkS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k29-20020a0cb25d000000b0056bf1e3aaf6si11762758qve.544.2023.02.21.02.50.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 02:50:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NF7dAwkS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUQEA-0004Qa-IJ; Tue, 21 Feb 2023 05:50:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUQE3-0004Nt-BP
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 05:50:23 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUQE1-0002Zp-Lf
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 05:50:22 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 b14-20020a17090a8c8e00b002349579949aso4243761pjo.5
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 02:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fqT6Bdu+GaVBwMBVVOf3EnB3ZNrPZ8Lt4F67E3VKzxQ=;
 b=NF7dAwkS9TyGIMzMAS3FlziVO0JFLoUvBoP5wBlFV/OXB0D9Htglw8PWxx+IWHiLLx
 1GnvGwAjYnL9fYPo4xYDymkDX7Uxl6XFqEnMQw3v8+LTlKvvbNdB8gMoxsn0ye8+YgVg
 uFAxjyob85Xl+B1pYOIqIv1FUvnCH9rVNtZ9vRVLd8c19CxBsabr/KL6o0KARqkJBizS
 zwgcW4UJR6LBHcBzNwAz92H69CdYIhW/pimmwxfRi/v3e7AUPSNJEeR0mwLyQc/ANy5p
 CHknYjd/BWxrj1rJjVuXtIYEBLSmdcMLxw9Ix7FR+7583HEdZfC7Y7CqrOMTBJcdW078
 etlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fqT6Bdu+GaVBwMBVVOf3EnB3ZNrPZ8Lt4F67E3VKzxQ=;
 b=CtLUOBFIGx2XfX00I/IdQh2xUfH4ZRimBQjflO/0HvPT0Lfq1OTkIqj6msNd7XPUCa
 TcpnXE16KHIrour1EJFdkzNKcfAcrvQH60s+OC7Pz+oz+9MQHO8NhjuN1GLWYK2ZeZog
 HIBVOZ6oXNDpZMIj3yt1XQ0OeLuOB3C84wln1qOmIKlDAxaBPH/RZxSZ3efarSut0mQH
 UFgqBTE/byLJ8P4rT0aN+4psPJQoZdVzJXI8s8/U7aAcWQGEOpgmIY0UWfPZZrzBjCfL
 2ylKifMItYXGqeCXI0A977ljiAsIVn6ztmoIqZt9GFeeLuQK1IZ6e6+4waY/Y8QOmxOm
 KfEA==
X-Gm-Message-State: AO0yUKXTfRhul5SYGRBvw6GfLIhZd5M17QY/e8WsWImsmhPFUe8L0Xzt
 uX0cEGr+87Jq+uePFFeHoVCpHQ==
X-Received: by 2002:a17:903:27c4:b0:19a:af11:a0c7 with SMTP id
 km4-20020a17090327c400b0019aaf11a0c7mr4838840plb.3.1676976619966; 
 Tue, 21 Feb 2023 02:50:19 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 v20-20020a170902e8d400b0019a87ede846sm3141353plg.285.2023.02.21.02.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:50:19 -0800 (PST)
Message-ID: <14c3e3e0-1b1c-5b32-1bb9-8269e9facb7a@linaro.org>
Date: Tue, 21 Feb 2023 00:50:16 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 07/21] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
 <20230220232626.429947-8-richard.henderson@linaro.org>
 <b1a5b38a-73ae-9610-676b-b27dd4c7195a@linaro.org>
 <bf06cdce-aa5f-98f3-4544-31d08d6bd55e@linaro.org>
 <ac13c9ce-89e2-cd83-235d-be7bc0544284@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ac13c9ce-89e2-cd83-235d-be7bc0544284@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d53cIS/6P388

On 2/21/23 00:42, Philippe Mathieu-Daudé wrote:
> On 21/2/23 11:01, Richard Henderson wrote:
>> On 2/20/23 21:56, Philippe Mathieu-Daudé wrote:
>>> 'secure' & 'user' seem mutually exclusive. If we get short in bits,
>>> they could be shared.
>>
>> They are not.  ARM has Secure EL0, or secure user mode.
> 
> Oh, I misunderstood this field with user-emulation then (I tried
> commenting it and my TCG/HVF build succeeded).
> 

target/arm/ptw.c:2853:    result->f.attrs.user = regime_is_user(env, mmu_idx);

So... it shouldn't have built?

r~
