Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1179128lfy;
        Sat, 22 Aug 2020 07:35:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNCjlmuRkBg+sL3Mu4NHSNycj7vITkgMpZLR6q6ABl4C4zQMCkMHQ80i1B7KNd1zzGz+jO
X-Received: by 2002:a17:906:4f08:: with SMTP id t8mr7791127eju.164.1598106933390;
        Sat, 22 Aug 2020 07:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598106933; cv=none;
        d=google.com; s=arc-20160816;
        b=xhQapm4U2JI4ghTizmSRnGnU4WXSOBHccD4JlWux/AqWC3W3hbXQghn6P0fKViLj1O
         VmOTE0yuyLZKbdP9DgJtyJmDARsCf+z2LXbYUj5ibYP+3I3vMUaZa4R5N1oefXiVysn3
         hSTbGXWTJAXtyGclxwGRcZYYiPKpZxGECvh9sYLZ6dya6rJhPdnPoe+slpSZhdtnBamG
         HmJLTeDdwXJPFaHHW8e7WvWyigXNitOWItxLX4aglvpQiYfrfZtRi8APb6AnQN9byov0
         ANoqM3d8yN95BEgacZoWLYkwwTmjDHnkymbqkPJ3xOshB9zP6GQoTSoFF+fn51eQUBm2
         wP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=a87a02siL9dCsA0yAEMZQ5Bq601ugwisDBkIdwi62ss=;
        b=fIyAj7/7mOMhBUujWmw4/eB+ZbI0P0o1B6TaOpKioWKSOYNmE831XG07R/Pth8vKc/
         GecnpW94GXNHRmde2Nvx8k9LyelzdBzQ9Rk/GocFwdraruggM5HAQYP/lL3Ep5anlY9S
         PTnTvTUilkU+FVencX5uB/aNLGwGFRRDsyDDWh4oePNd1bXy9jN1xAP9b3V3o0PZdjad
         R1NRtlovriMIISyw27MsOQ4b2FYM7N3e8DtbXvLORXV3gg5L4NBboB6ObHGI2cuG/xqb
         4UecAPr/YNsAwoypRrs4NZ2bcanOlTT5gePQhyRX/6Q5ruY1fd3yBZck11OOuAIjzL3u
         jPRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="UBTYMq/Z";
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id sb25si3430337ejb.338.2020.08.22.07.35.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Aug 2020 07:35:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="UBTYMq/Z";
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598106932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=a87a02siL9dCsA0yAEMZQ5Bq601ugwisDBkIdwi62ss=;
	b=UBTYMq/ZfwAX3WxY0Z2+iqSFJUaLCtOymsNz2SIH+QRjhWLzpGOi1kv74dC2wQXe4gCaSU
	S496oIqKfUmW32TYn2FJx+9XpvO3sHa6bPlnfPJgHp/NcZRtKcHq3/VRrC/rFqUgiAEvBp
	dK9hzk+w/WzIGwxapLd0SXR5thCfpro=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-AX52jgTBN0-E4HAKZiruMg-1; Sat, 22 Aug 2020 10:35:30 -0400
X-MC-Unique: AX52jgTBN0-E4HAKZiruMg-1
Received: by mail-wr1-f70.google.com with SMTP id r29so1763569wrr.10
        for <alex.bennee@linaro.org>; Sat, 22 Aug 2020 07:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=a87a02siL9dCsA0yAEMZQ5Bq601ugwisDBkIdwi62ss=;
        b=LPSwAf6WdoypRKpmvm3Q0YgE6KVlcCVOr/6cnWL9zkWdDkhGDQunc8cp9LxWbLDgdQ
         Ivpvokofa8sJB1+TTfFJFdSGns0PxzkuB0RBJRW4vrtd2ndla0BXSWAyZ7+3OdEbxrdK
         FiIJY+h9/gXbBG9lGONoSM8VVbxhKaMR+BrwoWKGo6jN5CF6N38OUbDhDndVSuHQ3Kke
         igi2P1Rck+5Q/OyXs6QCQfvaK0QncBOAoFe3GaelopY+DrU9ZEWSQGvhwSvhaS/1V06i
         eEpFdWkm1QI1JxKkAUszbMfYpGzW3GSvAG6rWM3ICd9KESTrEjzlu2Vl76Abg88uNQQX
         8Ehw==
X-Gm-Message-State: AOAM5333960TqzMrTjMCVOxDpNQvkLhtxlJrIoYQuTbHsUFSjYahy3qq
	1i+q4JkvAR+5HSdDjFfzm/LePH3wPu97J02Cj3miO/67x9puzwKYSdb7gxE/eViZ2Ab6k6HWkMc
	vOyOLJhatuHxAbTUQ
X-Received: by 2002:a1c:7fd3:: with SMTP id a202mr7699413wmd.67.1598106929753;
        Sat, 22 Aug 2020 07:35:29 -0700 (PDT)
X-Received: by 2002:a1c:7fd3:: with SMTP id a202mr7699399wmd.67.1598106929542;
        Sat, 22 Aug 2020 07:35:29 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net. [81.40.121.121])
        by smtp.gmail.com with ESMTPSA id p22sm11705808wmc.38.2020.08.22.07.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2020 07:35:28 -0700 (PDT)
Subject: Re: [PATCH v6 4/8] ppc/e500: Use start-powered-off CPUState property
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <rth@twiddle.net>,
 Cornelia Huck <cohuck@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20200819164306.625357-1-bauerman@linux.ibm.com>
 <20200819164306.625357-5-bauerman@linux.ibm.com>
 <3dd050ad-147e-c365-883a-3384130b0d2f@kaod.org>
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
Message-ID: <2fee9e37-f420-c0d0-dc57-c0ce273a1882@redhat.com>
Date: Sat, 22 Aug 2020 16:35:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3dd050ad-147e-c365-883a-3384130b0d2f@kaod.org>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: qyRGgvX+AFJG

On 8/22/20 10:59 AM, Cédric Le Goater wrote:
> Hello,
> 
> On 8/19/20 6:43 PM, Thiago Jung Bauermann wrote:
>> Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
>> the start-powered-off property which makes cpu_common_reset() initialize it
>> to 1 in common code.
>>
>> Also change creation of CPU object from cpu_create() to object_new() and
>> qdev_realize_and_unref() because cpu_create() realizes the CPU and it's not
>> possible to set a property after the object is realized.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> 
> 
> This is breaking make check : 
> 
>     tests/qtest/libqtest.c:175: kill_qemu() detected QEMU death from signal 11 (Segmentation fault) (core dumped)
>     ERROR boot-serial-test - too few tests run (expected 7, got 0)
>     make: *** [/home/legoater/work/qemu/qemu-powernv-5.2.git/tests/Makefile.include:650: check-qtest-ppc64] Error 1
>     make: *** Waiting for unfinished jobs....
>     
>     
>     gdb --args build/ppc64-softmmu/qemu-system-ppc64  -display none   -M ppce500
>     ...
>     Thread 1 "qemu-system-ppc" received signal SIGSEGV, Segmentation fault.
>     0x000055555596ebf2 in ppce500_init (machine=0x5555567aa6e0)
>         at /home/legoater/work/qemu/qemu-powernv-5.2.git/hw/ppc/e500.c:880
>     880	        irqs[i].irq[OPENPIC_OUTPUT_INT] = input[PPCE500_INPUT_INT];
>  
>     
>     AFAIUI, 'input is not initialized since the CPU is not yet realized.

Thiago, see ad938fc1d53 ("hw/arm/palm.c: Encapsulate misc GPIO handling
in a device") and eventually f8a865d36dc ("hw/arm/allwinner-a10:
Simplify by passing IRQs with qdev_pass_gpios") to get an idea how you
can fix that.

> 
>     C.
> 
>> ---
>>  hw/ppc/e500.c | 14 ++++++++++----
>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
>> index ab9884e315..d7b803ef26 100644
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
>> @@ -865,7 +862,7 @@ void ppce500_init(MachineState *machine)
>>          CPUState *cs;
>>          qemu_irq *input;
>>
>> -        cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
>> +        cpu = POWERPC_CPU(object_new(machine->cpu_type));
>>          env = &cpu->env;
>>          cs = CPU(cpu);
>>
>> @@ -897,7 +894,16 @@ void ppce500_init(MachineState *machine)
>>          } else {
>>              /* Secondary CPUs */
>>              qemu_register_reset(ppce500_cpu_reset_sec, cpu);
>> +
>> +            /*
>> +             * Secondary CPU starts in halted state for now. Needs to change
>> +             * when implementing non-kernel boot.
>> +             */
>> +            object_property_set_bool(OBJECT(cs), "start-powered-off", true,
>> +                                     &error_fatal);
>>          }
>> +
>> +        qdev_realize_and_unref(DEVICE(cs), NULL, &error_fatal);
>>      }
>>
>>      env = firstenv;
>>
> 
