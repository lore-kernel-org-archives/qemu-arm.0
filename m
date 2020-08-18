Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3724860lfy;
        Tue, 18 Aug 2020 04:06:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn+hkMdfmi4KcbDqsePk98yi2agOlEE4preHFjhjIp0+2pHBTVcPfSXUZ6BXTSDPEIOi1K
X-Received: by 2002:aa7:c0d3:: with SMTP id j19mr18816654edp.157.1597748813089;
        Tue, 18 Aug 2020 04:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597748813; cv=none;
        d=google.com; s=arc-20160816;
        b=rHwrufdN5WLKiUrL7NLota7D43alEW4kvFLJx2YO73piqmHWoEDytEqsHw6ImRNb9q
         5NP5FfDPGEBM18Mp48MDaRsRy/rSis9Wf9prNgjIzyenKkJ2CN/LLTRLEq/YrRPWgOCt
         QWcZgIF34JjWYzo6b1FqSw9Vi1t056VXeDnfmqtngEBoC3dJIY3hyMpRZFr9fu7G9/4L
         ybG45x/dy5DRVyRw5gBF5VEitAKGndPpYpoeUVCYbxSxG93SNoOkECX82/neVX7oQoFV
         yTyQRQmqwD9nmh3xoIaqIWyphRYD62qShvjfG5DyT3kJQZwsxpE3fYRJYo+lNCF37jGK
         nP0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:references:cc:to:from:subject
         :dkim-signature;
        bh=HNI9clGw/sUFEDq82dWdYAOEYkRhAR53wSTu6Xe5Qtw=;
        b=b3o8hTz+dLjblustZf4x6ec67UGwKcLLBdYs3DruXPyeSQ6xxi3JdDwQEWQjeWlU4R
         17o8uXRV33qxTpUnjhOtICgtPvqduMozHg5SbbL5uj6nYWdHpqFpPZRACdaPMCvOVvnR
         UteQ4owTGMCCEc3e7JfHR66I2q5dDg351gyg3rlEfClQc5Ucit8Ao8A1uI3WuXZhEpxZ
         IgvnBJjwyfOuUwNdsIpSBO0cJP5b69C5+gdeK0bUPRwi7Q3AHRKwM78FYL6GGZlxm7Va
         SPp9ypswKXI0776nsfGU2HGkKykIjhNTHN2anhyOnT6il6+feH41Fbk77enVl2Yy9MJn
         ouSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f1QzPdC8;
       spf=neutral (google.com: 216.205.24.124 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id f21si13168525ejq.412.2020.08.18.04.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 04:06:53 -0700 (PDT)
Received-SPF: neutral (google.com: 216.205.24.124 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f1QzPdC8;
       spf=neutral (google.com: 216.205.24.124 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597748812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HNI9clGw/sUFEDq82dWdYAOEYkRhAR53wSTu6Xe5Qtw=;
	b=f1QzPdC812rmR09xyPdV75EcUzOGxMoHfQIoFi4Cz4lQxhzU5df/mXlDejQIeza6GGkcID
	uw2zNGp/fgAcQH/C1IlJk32ZbajNJaLe/1/4S2HZ5f6cRssXwMtjuOhL962SW06u3hxXDL
	cZfEmPADBeZGTv86j/kEWZk/Santul8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-xfDoYWQpM3iQx8BrCK0J3Q-1; Tue, 18 Aug 2020 07:06:48 -0400
X-MC-Unique: xfDoYWQpM3iQx8BrCK0J3Q-1
Received: by mail-wr1-f71.google.com with SMTP id k11so8107311wrv.1
        for <alex.bennee@linaro.org>; Tue, 18 Aug 2020 04:06:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HNI9clGw/sUFEDq82dWdYAOEYkRhAR53wSTu6Xe5Qtw=;
        b=tGBMjL3BV82iJG6qNIzuZ/kjDsInOOh/Pyf0xM0kRy1/WQxAjfaQVn3NxctrlCnkSZ
         sr7DIN6FRjdadFZOhfu8Lw8oxGdczk6vGldhvuxCTIR6tA9CD+MC8RsJm+1/XXp6OKEs
         UKEsJX9i9FBYOpXgWVrXNci2jivkztGJPEnT2e0obTua6rlSErbI2E6x6k0hnbioyZZY
         /DYIAKjJNGxD27cSwxjHY6rUXNalLKFyF+zMNwExmxGsngZ+sCKKf0+J1TazUbjyi390
         jvr+pgA5dmAAR4A1dJ459cy6Y+RxxE7qZe00W1UoIWDRdZq/2dNbZ9JobYcgjO1BFnH+
         RYuw==
X-Gm-Message-State: AOAM533zkVITqIKgpRL81lhWa3+SNhPDYI3be3eZgKJw5ipFkyBZkqNf
	RObw6MAuGO3uMmais/q6cfjdxH/HT1w0aAd3NYcOIb4vw0YlgE3ckNMuZsbu6FQU4LBHCtfWfKD
	y5RWGak9AoAxKu8rq
X-Received: by 2002:adf:82b2:: with SMTP id 47mr19110931wrc.17.1597748807214;
        Tue, 18 Aug 2020 04:06:47 -0700 (PDT)
X-Received: by 2002:adf:82b2:: with SMTP id 47mr19110908wrc.17.1597748806940;
        Tue, 18 Aug 2020 04:06:46 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net. [81.40.121.121])
        by smtp.gmail.com with ESMTPSA id k1sm35756474wrw.91.2020.08.18.04.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 04:06:46 -0700 (PDT)
Subject: Re: [PATCH v4 5/8] mips/cps: Use start-powered-off CPUState property
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Greg Kurz <groug@kaod.org>
References: <20200818033323.336912-1-bauerman@linux.ibm.com>
 <20200818033323.336912-6-bauerman@linux.ibm.com>
 <8c454fa8-12a6-0258-04e8-6f3c093eb333@redhat.com>
 <e2c48769-46e8-32ff-a83d-04b6993deee9@redhat.com>
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
Message-ID: <9d8fdd74-feaf-27e3-9f09-26bbf7ebd779@redhat.com>
Date: Tue, 18 Aug 2020 13:06:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e2c48769-46e8-32ff-a83d-04b6993deee9@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: knse7Tq5IWeE

On 8/18/20 1:03 PM, Philippe Mathieu-Daudé wrote:
> On 8/18/20 9:26 AM, Philippe Mathieu-Daudé wrote:
>> On 8/18/20 5:33 AM, Thiago Jung Bauermann wrote:
>>> Instead of setting CPUState::halted to 1 in main_cpu_reset(), use the
>>> start-powered-off property which makes cpu_common_reset() initialize it
>>> to 1 in common code.
>>>
>>> Also change creation of CPU object from cpu_create() to object_new() and
>>> qdev_realize() because cpu_create() realizes the CPU and it's not possible to
>>> set a property after the object is realized.
>>>
>>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>>> ---
>>>  hw/mips/cps.c | 16 ++++++++++++----
>>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
>>> index 615e1a1ad2..be85357dc0 100644
>>> --- a/hw/mips/cps.c
>>> +++ b/hw/mips/cps.c
>>> @@ -52,9 +52,6 @@ static void main_cpu_reset(void *opaque)
>>>      CPUState *cs = CPU(cpu);
>>>  
>>>      cpu_reset(cs);
>>> -
>>> -    /* All VPs are halted on reset. Leave powering up to CPC. */
>>> -    cs->halted = 1;
>>>  }
>>>  
>>>  static bool cpu_mips_itu_supported(CPUMIPSState *env)
>>> @@ -76,7 +73,9 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>>>      bool saar_present = false;
>>>  
>>>      for (i = 0; i < s->num_vp; i++) {
>>> -        cpu = MIPS_CPU(cpu_create(s->cpu_type));
>>> +        Error *err = NULL;
>>> +
>>> +        cpu = MIPS_CPU(object_new(s->cpu_type));
>>>  
>>>          /* Init internal devices */
>>>          cpu_mips_irq_init_cpu(cpu);
>>> @@ -89,7 +88,16 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>>>              env->itc_tag = mips_itu_get_tag_region(&s->itu);
>>>              env->itu = &s->itu;
>>>          }
>>> +        /* All VPs are halted on reset. Leave powering up to CPC. */
>>> +        object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
>>> +                                 &error_abort);
>>>          qemu_register_reset(main_cpu_reset, cpu);
>>> +
>>> +        if (!qdev_realize(DEVICE(cpu), NULL, &err)) {
>>> +            error_report_err(err);
>>> +            object_unref(OBJECT(cpu));
>>> +            exit(EXIT_FAILURE);
>>> +        }
>>
>> Here errp is available, so we can propagate the error to the caller:
>>
>>            if (!qdev_realize(DEVICE(cpu), NULL, errp)) {
> 
> Igor corrected me in the previous patch, to avoid leaking the
> reference this snippet misses:
> 
>                  object_unref(OBJECT(cpu));

Well this is simply:

              if (!qdev_realize_and_unref(DEVICE(cpu), NULL, errp)) {
> 
>>                return;
>>            }
>>
>> For example in hw/mips/boston.c:
>>
>>     object_initialize_child(OBJECT(machine), "cps", &s->cps, TYPE_MIPS_CPS);
>>     object_property_set_str(OBJECT(&s->cps), "cpu-type", machine->cpu_type,
>>                             &error_fatal);
>>     object_property_set_int(OBJECT(&s->cps), "num-vp", machine->smp.cpus,
>>                             &error_fatal);
>>     sysbus_realize(SYS_BUS_DEVICE(&s->cps), &error_fatal);
>>
>> This will be propagated here ---------------^^^^^^^^^^^^^
>>
>>>      }
>>>  
>>>      cpu = MIPS_CPU(first_cpu);
>>>
> 
