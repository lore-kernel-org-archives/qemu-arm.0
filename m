Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1131686lfq;
        Thu, 10 Sep 2020 02:08:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxceG/1TZIC4YOtSHfgv4CAIiTjnELl9MNkUAUjYKEMChfaGEr089naUUFdCwQhQmpSzVnj
X-Received: by 2002:a17:906:b0a:: with SMTP id u10mr7631508ejg.226.1599728887490;
        Thu, 10 Sep 2020 02:08:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599728887; cv=none;
        d=google.com; s=arc-20160816;
        b=weq9/QCG/MOJH++X8s/gHulxk+3oAFfNwEp0P68Dg02HSt+h4x9/nn0mcKWEHClF0S
         8GK6TL2I6vgho8+eXMfXYb9QOs2WDSs7wJcsxl/O+OT+b5uLYvqEm8XuTZhGU5XxXy+m
         df2Csq1aTMGE5Mob1d4fxGFgz5NAtSPxUL0KWSWqL3G8APw6Z3mkrHuhQA2UBDrat6wX
         RE1D+ZXS7EyWHyExkj7GocNmhpBYiSkwONJ8XthHnVOqfg85f2whgkA3K9WmsQk4BnRm
         k4GS4sqH/y3fajj2h0UoEf41Rcwg6EKy7pDRj6V3IKw3pW0P8kHp3opQunikF2qU/QKJ
         K/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=MPFIhvjjZZMrZtxtj2VIAvzFKsc4panpciSld1za2uc=;
        b=iDgtXLQxNNu+5ERCXGFRe6teKQqNh1XMp70Ec/D36BnCaDf4nXVrd6YoPx/HRpo3DP
         XDGyEpcWmoWKaR1J8Bb7EOlyJ3LbgwTBEcz0YulNYUmPHsieG1kD1DIMwmWqh15i3aee
         KBRr58FSnBqC/n5/Oz/I+gjkXpIEWuYGcldJvA2FjAepLdoE5AaJfmL13TN+Pb2fZTNA
         CYFOvxzbM1pO0a13jh8EUl6gjvY/0BXSddbQNhXNpo6sxDMq9+JbVHZKXAJuq7SMhCvo
         yYHlneZgvZ+SlnxsajOvq/zL4QtUsa6JII8H1D4pLA0MrPx1J4GqO12tC3J5HFe+bG1Y
         Mgig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PbNBbNtz;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id n4si3095408edo.589.2020.09.10.02.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 02:08:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PbNBbNtz;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599728886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MPFIhvjjZZMrZtxtj2VIAvzFKsc4panpciSld1za2uc=;
	b=PbNBbNtzypN38UrlgI3Al1yihPnpqqVg3617doEpaUR7vlQ5x6B3oZ2XRyIEhMH1Z5DE6e
	RIRB+mS4DyQ4z2nC+b1+1kjHlADfBRIq1FNchk6pi+o5KvenLwbvGynA7h/HrBoFbOs25u
	XQ2jQF7Y9oqyw6Oxhp+hjbEXnuYgmRY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-hGXaoZBhNBy_2Nl7-ado7g-1; Thu, 10 Sep 2020 05:08:02 -0400
X-MC-Unique: hGXaoZBhNBy_2Nl7-ado7g-1
Received: by mail-ej1-f71.google.com with SMTP id b17so2464057ejb.20
        for <alex.bennee@linaro.org>; Thu, 10 Sep 2020 02:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MPFIhvjjZZMrZtxtj2VIAvzFKsc4panpciSld1za2uc=;
        b=kRwIJxtopkPhMmQ9lryU2MmqTdr8m6J8X2mtv/3uimdYDR+r67scObIWUuDfVsG80Z
         7KuSEaqX1a/e4Kq4QcZJ6aACcJbCd+k0RzXO8laxc5fFb6woHCtGOxZGLJ+U1Dz+tMaL
         C60EfZepH+aiOxt29HXfmofXOV8j70S/5VRg3nH4BJbTQBdyJJqCLkhB+F78oWsRvCgq
         rHsZcG9kO23uswsN/zWiWoRxgcJY8kGty+JpNPOYC6YB5hmzk3cTuKJ+YZ8YgLtIXjEi
         EJOrHEhtmJAMQjXUoN9ywWoSx+kEJpXRiC1rYbCb87yIlD45pW92rJsy7MYf0TJQJDdx
         0UHQ==
X-Gm-Message-State: AOAM53355JO3q9ytAciW1y6Cibf4qm5nxLnaHVdtZc+Mn1EXsJvao2cN
	2F1xXW9DXiHzgcL+R6/Q/1M719Ve7tHXjqsspfR/eqbPfycGDh83D1En9jn5KnUanzk6ZBLax81
	4x87p6a1b5sxdfzg+
X-Received: by 2002:aa7:d15a:: with SMTP id r26mr8264334edo.181.1599728881628;
        Thu, 10 Sep 2020 02:08:01 -0700 (PDT)
X-Received: by 2002:aa7:d15a:: with SMTP id r26mr8264297edo.181.1599728881331;
        Thu, 10 Sep 2020 02:08:01 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:2744:1c91:fa55:fa01? ([2001:b07:6468:f312:2744:1c91:fa55:fa01])
        by smtp.gmail.com with ESMTPSA id lr14sm6284398ejb.0.2020.09.10.02.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2020 02:08:00 -0700 (PDT)
Subject: Re: [PATCH 6/6] target/i386/kvm: Rename host_tsx_blacklisted() as
 host_tsx_broken()
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Joel Stanley <joel@jms.id.au>
References: <20200910070131.435543-1-philmd@redhat.com>
 <20200910070131.435543-7-philmd@redhat.com>
 <118a4cae-f220-8224-52ac-26a1795ac071@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cfc1c6be-8569-4150-6deb-136f930285ee@redhat.com>
Date: Thu, 10 Sep 2020 11:08:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <118a4cae-f220-8224-52ac-26a1795ac071@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: Bk6FkiXFeYo8

On 10/09/20 09:08, Thomas Huth wrote:
> On 10/09/2020 09.01, Philippe Mathieu-Daudé wrote:
>> In order to use inclusive terminology, rename host_tsx_blacklisted()
>> as host_tsx_broken().
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  target/i386/kvm.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
>> index 205b68bc0ce..3d640a8decf 100644
>> --- a/target/i386/kvm.c
>> +++ b/target/i386/kvm.c
>> @@ -302,7 +302,7 @@ static int get_para_features(KVMState *s)
>>      return features;
>>  }
>>  
>> -static bool host_tsx_blacklisted(void)
>> +static bool host_tsx_broken(void)
>>  {
>>      int family, model, stepping;\
>>      char vendor[CPUID_VENDOR_SZ + 1];
>> @@ -408,7 +408,7 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>>      } else if (function == 6 && reg == R_EAX) {
>>          ret |= CPUID_6_EAX_ARAT; /* safe to allow because of emulated APIC */
>>      } else if (function == 7 && index == 0 && reg == R_EBX) {
>> -        if (host_tsx_blacklisted()) {
>> +        if (host_tsx_broken()) {
>>              ret &= ~(CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_HLE);
>>          }
>>      } else if (function == 7 && index == 0 && reg == R_EDX) {
>>
> 
> Looking at commit 40e80ee4113, the term "broken" seems to be a good
> replacement here.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
