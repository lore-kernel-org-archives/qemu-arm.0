Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3585974lfy;
        Tue, 18 Aug 2020 00:28:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLfTBOEVGiPt8Aq9bxUYi+O7RyBzqS2X3YZW6FElQVEVo+qDkn2RQvbx+YRiEmCxG7IuEN
X-Received: by 2002:a25:d150:: with SMTP id i77mr26317628ybg.45.1597735712753;
        Tue, 18 Aug 2020 00:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597735712; cv=none;
        d=google.com; s=arc-20160816;
        b=nhpK/4pNbGaP2XU3aNpsERsWFMgqML/yxRtlSDXskagBVK2LvZO4vkJMbGKl+iUIMY
         Jv+2/Y6jLmUqMC3Boh5KXBI+rL55g+bujSo9yghCvyqYzHNq9axspXlFJbt904+nltyk
         Pzr0nnC7nQypIUQ0jb1c/wJLJ9/pRCdn7OZjc83DgV4X5n+R2c+bbxYI8d9SlkP7qjtO
         HR9k2aRqFKofixfsRA41qQCiXZlR5FRAtGtiiLTbY/6f/ErnFIfLnkQt9ek33/Z1VmVP
         w5E/YZJd/QK9EE14+ZeYVC976P8bzNPgeU4tZ3WnW57onFE8XwyL3DLXaPD8GTsNKSx7
         HO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:references:cc:to:from:subject
         :dkim-signature;
        bh=m+Eogft0eH/F8D94Ip+Yff4IYCR4r9fJNY7fS2qBA54=;
        b=kqYh00VaQ+vjI1z2xmLbhpsPQt7kQjEw2bTS1nr41ye/8aKfJ5ajMt5rUP4u6PcQ+v
         l8sPXnxLFKlFv9jurgxMFT2tFBJOWVVWCMoa1WHyUaXgFmYCsKo76bln7Am6PLRq9MKk
         HrUgbiskiYM7M/U6ft++DnPCtTcqgOPDbDX4PhXhoyfY1RMb2iPW/6QphAcyYJ7FOITi
         BI6sWnt5BT4fZv8KFXUGGRCSHMMlCRBLFR/QN0l6zc4n8sJhcgdZbepvE4xXu/XdQyD0
         t/Az9XiIMr5TzFAegSDWRjjwVkjXUggfhszlVtuLQJsGOKGHPmjgVyd1+LObw6Emhknm
         R15A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JCfEINMc;
       spf=neutral (google.com: 205.139.110.120 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id f8si14090481ybm.367.2020.08.18.00.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 00:28:32 -0700 (PDT)
Received-SPF: neutral (google.com: 205.139.110.120 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JCfEINMc;
       spf=neutral (google.com: 205.139.110.120 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597735712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=m+Eogft0eH/F8D94Ip+Yff4IYCR4r9fJNY7fS2qBA54=;
	b=JCfEINMcfUbExRZPcHEMCn7IvpDgtMdyHpqvh8hbsDlR9lbMYBTI/LYCwalQGU1397uXUV
	4TGxJ7SmPeVJZ6/Ywwbq1By5JBP0fxeJOvah72zfVgIjpfrj+6J8XdQiVYh/w83kEOU+7t
	xMiwME2FiOglJieUS6cfumQpZDitGzQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-QvxOZ5AlOc2gkz_4wBFvDg-1; Tue, 18 Aug 2020 03:28:28 -0400
X-MC-Unique: QvxOZ5AlOc2gkz_4wBFvDg-1
Received: by mail-wr1-f69.google.com with SMTP id z12so7901476wrl.16
        for <alex.bennee@linaro.org>; Tue, 18 Aug 2020 00:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=m+Eogft0eH/F8D94Ip+Yff4IYCR4r9fJNY7fS2qBA54=;
        b=aGfQDKX8xVvG7cFFYbNrU8Eftf0wrpAadjN6etjhWBKPFXhwmXC7ctktY7RjskcKGM
         UkvRMsPgVH9gYJKs45OqrzQEQMYCEHwcQDgNUVSXtI7+nWyuezRNGU/4aHOFSgDBue/T
         HXG2af7w3PDL/wewcbosdHxI1X9qeRJ6Twae3jIJ+Lous05Yb8YuDHWomBbLHWCuUqCl
         +fGOmcbbaYpGSdGJi82e/cJBXxr9ZZbLlLH4fWU8+CQhrNqnRXZIU049T8dr4Gw3SIC7
         CNKnzls3vccVJHji2FgFFMlgJyZAWdfelyZvXORjAVXNhcvCHcIWrDgXh1pSTPujtuPI
         vtog==
X-Gm-Message-State: AOAM5309sSQRJUkLUzRThRYxhNFx9FpzlhWRisiI+6SLYsOW4YrEwmSv
	+IkqnX15yXkBi9dp3n3iyxCNeYg7V9w1M7wgimkdLPwOCfPRJ1gMfzzhfBnlq/OBiCO7wYAFyYH
	hsf/kZmhHJoAyTYwG
X-Received: by 2002:a1c:4c:: with SMTP id 73mr17641538wma.58.1597735707403;
        Tue, 18 Aug 2020 00:28:27 -0700 (PDT)
X-Received: by 2002:a1c:4c:: with SMTP id 73mr17641520wma.58.1597735707202;
        Tue, 18 Aug 2020 00:28:27 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net. [81.40.121.121])
        by smtp.gmail.com with ESMTPSA id q5sm32663260wrp.60.2020.08.18.00.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 00:28:26 -0700 (PDT)
Subject: Re: [PATCH v4 4/8] ppc/e500: Use start-powered-off CPUState property
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
 <20200818033323.336912-5-bauerman@linux.ibm.com>
 <83c5045d-ee26-9433-46a3-4919bcea7cd3@redhat.com>
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
Message-ID: <65395b58-82d7-fd6b-ebc2-3fa7cb25d324@redhat.com>
Date: Tue, 18 Aug 2020 09:28:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <83c5045d-ee26-9433-46a3-4919bcea7cd3@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: D/TEegRPk7YN

On 8/18/20 9:22 AM, Philippe Mathieu-Daudé wrote:
> On 8/18/20 5:33 AM, Thiago Jung Bauermann wrote:
>> Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
>> the start-powered-off property which makes cpu_common_reset() initialize it
>> to 1 in common code.
>>
>> Also change creation of CPU object from cpu_create() to object_new() and
>> qdev_realize() because cpu_create() realizes the CPU and it's not possible
>> to set a property after the object is realized.
>>
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> ---
>>  hw/ppc/e500.c | 19 +++++++++++++++----
>>  1 file changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
>> index ab9884e315..0077aca74d 100644
>> --- a/hw/ppc/e500.c
>> +++ b/hw/ppc/e500.c
>> @@ -704,9 +704,6 @@ static void ppce500_cpu_reset_sec(void *opaque)
>>  
>>      cpu_reset(cs);
>>  
>> -    /* Secondary CPU starts in halted state for now. Needs to change when
>> -       implementing non-kernel boot. */
>> -    cs->halted = 1;
>>      cs->exception_index = EXCP_HLT;
>>  }
>>  
>> @@ -864,8 +861,9 @@ void ppce500_init(MachineState *machine)
>>          PowerPCCPU *cpu;
>>          CPUState *cs;
>>          qemu_irq *input;
>> +        Error *err = NULL;
>>  
>> -        cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
>> +        cpu = POWERPC_CPU(object_new(machine->cpu_type));
>>          env = &cpu->env;
>>          cs = CPU(cpu);
>>  
>> @@ -897,6 +895,19 @@ void ppce500_init(MachineState *machine)
>>          } else {
>>              /* Secondary CPUs */
>>              qemu_register_reset(ppce500_cpu_reset_sec, cpu);
>> +
>> +            /*
>> +             * Secondary CPU starts in halted state for now. Needs to change
>> +             * when implementing non-kernel boot.
>> +             */
>> +            object_property_set_bool(OBJECT(cs), "start-powered-off", true,
>> +                                     &error_abort);
> 
> [*]
> 
>> +        }
>> +
>> +        if (!qdev_realize(DEVICE(cs), NULL, &err)) {
>> +            error_report_err(err);
>> +            object_unref(OBJECT(cs));
>> +            exit(EXIT_FAILURE);
>>          }
> 
> The last 4 lines are equivalent to:
> 
>            qdev_realize(DEVICE(cs), NULL, &error_fatal)) {

I meant:

             qdev_realize(DEVICE(cs), NULL, &error_fatal);

> 
> This is also the preferred form, as we can not propagate errors
> from the machine_init() handler.
> 
> Since you use &error_abort in [*], maybe you want to use it here too.
> 
>>      }
>>  
>>
> 
