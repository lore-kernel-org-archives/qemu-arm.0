Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3722369lfy;
        Tue, 18 Aug 2020 04:03:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQIz48xfYN9RI5yn0+XiXNoMaFmIC2hPirOl1e3tE46KG6DgnBuh9EGqzfB35Xs/rUbyM8
X-Received: by 2002:a05:6402:3196:: with SMTP id di22mr18766872edb.193.1597748625289;
        Tue, 18 Aug 2020 04:03:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597748625; cv=none;
        d=google.com; s=arc-20160816;
        b=JqfbxuOEQEp34ZaPmmOnUBS1b72s+4Ej0+oqTnFxabKTOp1txFTfi44ViKjrZdnCYP
         +S6A3BQesR0FI35BBfgrMaPlEdGsmuIYdSfg9TUO1SBkVr6man0wKfU7eiUAtDpMQ1RY
         34zuVrJsoDHKZgpHf8rCcXdOs0mz/09nMU/PpZ+XUg3HC9hMnAPuXIZiIs35ha9Vtveb
         GEptsZ2SZZb3R39PNlOetzVY1CYUUE7kGxRoekwnpU4Dfbi5hdLRS68ppDNBdtn064GC
         AGbkPEP3yxMfkhmLX7/BoI/tsuK846bJphUtRGzZqyWGJVZkMS4dIxMcOlofnWx21Xk9
         zdVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:references:cc:to:from:subject
         :dkim-signature;
        bh=0G/9XC/qhufIHimx5KTehndt8GIdDyqkjOGca1jiAwE=;
        b=qgOqDD2bRFCbaoM0+pMdskQzO7ZI7xbzGkPVm8x4G5Nlo0zT6oOXeK4qjtVkHw4UX6
         PaOuad/yo1624takFCM18VoURg1SfClZb1mUCWoyZ+JucRJrGaf+Yk1eA8JOA0+lBC8e
         mDc59bJMVIR0hYAeqDEsavo3V+ncD6oEDLz3eJlpoWg6bVxjPozsUCyXvgpk/3f87MqV
         2eM+3LusO2f0j3yYD2/JlJLJPsfYJmOzF1n3+bDEROQR+xMyd5IAuDnLH8oN1gfS83VJ
         emsmv2GmS/vvJpJo2/+G1RBbGK/Nch2zDswt/npSBVGng70Y4lJjzl4WwX7FcT1x7KCW
         Hi7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TDwLh9q4;
       spf=neutral (google.com: 207.211.31.120 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id q25si12963047edr.402.2020.08.18.04.03.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 04:03:45 -0700 (PDT)
Received-SPF: neutral (google.com: 207.211.31.120 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TDwLh9q4;
       spf=neutral (google.com: 207.211.31.120 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597748624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0G/9XC/qhufIHimx5KTehndt8GIdDyqkjOGca1jiAwE=;
	b=TDwLh9q4mzCrLb8/x0d0+FKeF1Z3vEFtGPVLqr28HwTNn39lqlraMhOt8/20xBjKyLlspa
	PzmzkSd6f7fEz85/Ci8a/pi4/K9rMc5eoV/y+uDH/fVvGqcgWL0QsuMYxXeLVbWYo+CdmM
	wwU/n321LTXf4Tpgbn+Wkk5UnuGd32s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-hQdFZyiHN4eMrhTNEuti0Q-1; Tue, 18 Aug 2020 07:03:43 -0400
X-MC-Unique: hQdFZyiHN4eMrhTNEuti0Q-1
Received: by mail-wr1-f72.google.com with SMTP id t12so8140578wrp.0
        for <alex.bennee@linaro.org>; Tue, 18 Aug 2020 04:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=0G/9XC/qhufIHimx5KTehndt8GIdDyqkjOGca1jiAwE=;
        b=nDzrD+rJmHqFSIX67uWNQSm+YRCwcDBl1IKgNnGVkrdupVX2YScUKqLW24z51CaKte
         zlbl73f9AIX1JXeECV23Q/NMRJgfD/asxd/4Vwo+BCzqJGOGV7AqjbMTuFPVswL/72Nk
         b+OF7e2V4lBBifGX6J9t4B//iJGG+2PksXDkvc64DbyGI8rVZz4vQvQn3ABKd6Aqy8Hf
         1wXJIakVBAiugrsgnw3oAnPqgdQqDZzdrgcmHnj+x3Fu/wY0EFWRJEFS69hpj8vMt3hj
         y898fE4u9NHv4rTq6R2WiGDV3aHd6fMwmlYxjiyjME8BUnT1o2DrzYfQ/hxOWtO71xR/
         F/bw==
X-Gm-Message-State: AOAM531UpRf98P1jD31rdMpSuPkr8ahFh0XlNgHpEzHUFpyDF+SJ+Oqs
	9cieUOZj6gIXaSCcdF+gPIdFqnzw9EtUVeyNA15pmaQ3dFXME6aj5HhWLkXvXeOXbx7Il6Z9asP
	xXsmQu7Hr7IZap9Xf
X-Received: by 2002:a7b:c941:: with SMTP id i1mr18694110wml.73.1597748621502;
        Tue, 18 Aug 2020 04:03:41 -0700 (PDT)
X-Received: by 2002:a7b:c941:: with SMTP id i1mr18694039wml.73.1597748620770;
        Tue, 18 Aug 2020 04:03:40 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net. [81.40.121.121])
        by smtp.gmail.com with ESMTPSA id z8sm31461374wmf.10.2020.08.18.04.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 04:03:40 -0700 (PDT)
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
Message-ID: <e2c48769-46e8-32ff-a83d-04b6993deee9@redhat.com>
Date: Tue, 18 Aug 2020 13:03:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <8c454fa8-12a6-0258-04e8-6f3c093eb333@redhat.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: bi72fvm7FN/2

On 8/18/20 9:26 AM, Philippe Mathieu-Daudé wrote:
> On 8/18/20 5:33 AM, Thiago Jung Bauermann wrote:
>> Instead of setting CPUState::halted to 1 in main_cpu_reset(), use the
>> start-powered-off property which makes cpu_common_reset() initialize it
>> to 1 in common code.
>>
>> Also change creation of CPU object from cpu_create() to object_new() and
>> qdev_realize() because cpu_create() realizes the CPU and it's not possible to
>> set a property after the object is realized.
>>
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>> ---
>>  hw/mips/cps.c | 16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
>> index 615e1a1ad2..be85357dc0 100644
>> --- a/hw/mips/cps.c
>> +++ b/hw/mips/cps.c
>> @@ -52,9 +52,6 @@ static void main_cpu_reset(void *opaque)
>>      CPUState *cs = CPU(cpu);
>>  
>>      cpu_reset(cs);
>> -
>> -    /* All VPs are halted on reset. Leave powering up to CPC. */
>> -    cs->halted = 1;
>>  }
>>  
>>  static bool cpu_mips_itu_supported(CPUMIPSState *env)
>> @@ -76,7 +73,9 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>>      bool saar_present = false;
>>  
>>      for (i = 0; i < s->num_vp; i++) {
>> -        cpu = MIPS_CPU(cpu_create(s->cpu_type));
>> +        Error *err = NULL;
>> +
>> +        cpu = MIPS_CPU(object_new(s->cpu_type));
>>  
>>          /* Init internal devices */
>>          cpu_mips_irq_init_cpu(cpu);
>> @@ -89,7 +88,16 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>>              env->itc_tag = mips_itu_get_tag_region(&s->itu);
>>              env->itu = &s->itu;
>>          }
>> +        /* All VPs are halted on reset. Leave powering up to CPC. */
>> +        object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
>> +                                 &error_abort);
>>          qemu_register_reset(main_cpu_reset, cpu);
>> +
>> +        if (!qdev_realize(DEVICE(cpu), NULL, &err)) {
>> +            error_report_err(err);
>> +            object_unref(OBJECT(cpu));
>> +            exit(EXIT_FAILURE);
>> +        }
> 
> Here errp is available, so we can propagate the error to the caller:
> 
>            if (!qdev_realize(DEVICE(cpu), NULL, errp)) {

Igor corrected me in the previous patch, to avoid leaking the
reference this snippet misses:

                 object_unref(OBJECT(cpu));

>                return;
>            }
> 
> For example in hw/mips/boston.c:
> 
>     object_initialize_child(OBJECT(machine), "cps", &s->cps, TYPE_MIPS_CPS);
>     object_property_set_str(OBJECT(&s->cps), "cpu-type", machine->cpu_type,
>                             &error_fatal);
>     object_property_set_int(OBJECT(&s->cps), "num-vp", machine->smp.cpus,
>                             &error_fatal);
>     sysbus_realize(SYS_BUS_DEVICE(&s->cps), &error_fatal);
> 
> This will be propagated here ---------------^^^^^^^^^^^^^
> 
>>      }
>>  
>>      cpu = MIPS_CPU(first_cpu);
>>
