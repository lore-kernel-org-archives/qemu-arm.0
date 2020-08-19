Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp65779lfy;
        Tue, 18 Aug 2020 20:05:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAGXvAcpssBOQ5SNWyrSEGLSQCs1ffFgJBH1zvDUKtzRNw/Qm+72VBTd8rhc+cF6q9cH3i
X-Received: by 2002:a17:906:d9db:: with SMTP id qk27mr22972000ejb.37.1597806318735;
        Tue, 18 Aug 2020 20:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597806318; cv=none;
        d=google.com; s=arc-20160816;
        b=j9BqDEol0y1WvDRuG49GBqiJ7UlM03CdWyNDG5nr4ZW7ORbtC0FTvD8hCzbaFVXYgY
         2gmbs+IY4ffY75hAC3Tt2HfOn71AlGO10lqgPAgDiC7hWclOPRQR4bxNoG1lob93TS1W
         CWNcNhQJzd+adFgwSx4AkoH+laxyC+IPgInN3RGNnIeR/OMHEATFvECvvlKgB3wAhVKh
         BcGPWtrtM68mwd/0K3391+8g8/CRPLk/Kl5qsSHbEKlP57tdbIOo6XgHnu+X5tGksdol
         MymFK42xN8IjGRp/3rKs6ki4k3lcdEOAkdVzoAG3vPIPoIqVe7sKeAqj2GBN4aBpcwbd
         PO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=MWacM+NIVvc3VByuyCmZGI1Q8qi5g5iae7qqbUb/Knk=;
        b=riPeoc23/HzcvOYQU32wqsVxskEDAMntPxFKltA/NPjiO+Py3M9BDMX/Ifze2B/uVd
         vmMd1e9rYOA1vxGflIyMXxCnOud68Hc3aouybsTuOUHMvBevYFfiMjcc6Ale+u663d88
         3R0+KVqDyM+T8gfW9MevhUY9/aK6BDlIxiiRYGGMV6ojygeNXnLNFyERvq5mro0+wC8I
         7AznURp5cN+nlE0MTtb+FMgxvHYz20yrwk+3MB/f/9ue5y62Y92dot8wlriZtMpxfhqe
         km4RBSdKaiQQ1j5+qJwYtl6r2sbY6tLrGGlfGYXCtN+LAdkxXsCObAXWdOjwgVUC4ms2
         SZtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JTZAdBDx;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id dp16si21182271ejc.17.2020.08.18.20.05.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 20:05:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JTZAdBDx;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597806317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MWacM+NIVvc3VByuyCmZGI1Q8qi5g5iae7qqbUb/Knk=;
	b=JTZAdBDxWVaKRNt0VTWWAUzGiWQFnGuR9HQUagCzaMinBbiZjxa3K9TgYqjOf4MYdsWuP6
	1AhEti4+SrlMDQumq/2Hw/jEo4KxeAbNVvwU6PPs0KcGhKhEy7Bip4F5C0HiviHx3GFvmg
	mOUk1XIXGavJLMJlIG1+K7B+qughqL0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-NNO619mTMHWXgMMewIR91w-1; Tue, 18 Aug 2020 23:05:15 -0400
X-MC-Unique: NNO619mTMHWXgMMewIR91w-1
Received: by mail-wr1-f72.google.com with SMTP id l14so8874835wrp.9
        for <alex.bennee@linaro.org>; Tue, 18 Aug 2020 20:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MWacM+NIVvc3VByuyCmZGI1Q8qi5g5iae7qqbUb/Knk=;
        b=kzmeCNOl2oat2zvMHIUZdP2YXOvxDbe2ornWp31oCrJiMkVnn/rPPnkuod7OG+DHbt
         c6oXwd+f07MTVlS61xAId/VCvtiGSdTudtv04YQ1Cwr1AtLyICMoUYpKpK9+UEnsQHJP
         8XhC4GEy0rl9AcyEwszoLR3YseHLwUVGt6/g73UUshtNxgdNjZ+98u1b20UfBlGK0jCq
         L5iYdc3eXTlm47K2qXe9HGQzdPYfUMYSPrOYXC8jkj8rnkvUX9WWzFCLuzoUaluc0sel
         EyqLu5VsBFYUV+Y/D6DOG/mDbUY+LSKoJ+5OWgJiaPaB8Mz+k+rj9c3+M+FlhhwT47bv
         mx/w==
X-Gm-Message-State: AOAM532zdSFoRZJTRdoeWMLELSZkghaoROqWXfQnD4kTyAYJ98WFPPEc
	KUSUIjIjm+A0vB54uRXgaRkHrqUDtBzn0NiWlJm7t0sLFSFl3fQNtRmvKLLYkHcTM2Eerj/BKKj
	uKEUNaUGOgiLnd2Zk
X-Received: by 2002:a5d:514c:: with SMTP id u12mr23762847wrt.90.1597806314723;
        Tue, 18 Aug 2020 20:05:14 -0700 (PDT)
X-Received: by 2002:a5d:514c:: with SMTP id u12mr23762819wrt.90.1597806314480;
        Tue, 18 Aug 2020 20:05:14 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net. [81.40.121.121])
        by smtp.gmail.com with ESMTPSA id i6sm35347757wrp.92.2020.08.18.20.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 20:05:13 -0700 (PDT)
Subject: Re: [PATCH v5 4/8] ppc/e500: Use start-powered-off CPUState property
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
References: <20200819024220.587612-1-bauerman@linux.ibm.com>
 <20200819024220.587612-5-bauerman@linux.ibm.com>
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
Message-ID: <1d7c519a-d0db-a579-e6d7-26255db07226@redhat.com>
Date: Wed, 19 Aug 2020 05:05:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819024220.587612-5-bauerman@linux.ibm.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: 39Rme+HBNAgp

On 8/19/20 4:42 AM, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
> the start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
> 
> Also change creation of CPU object from cpu_create() to object_new() and
> qdev_realize_and_unref() because cpu_create() realizes the CPU and it's not
> possible to set a property after the object is realized.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/ppc/e500.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index ab9884e315..d7b803ef26 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -704,9 +704,6 @@ static void ppce500_cpu_reset_sec(void *opaque)
>  
>      cpu_reset(cs);
>  
> -    /* Secondary CPU starts in halted state for now. Needs to change when
> -       implementing non-kernel boot. */
> -    cs->halted = 1;
>      cs->exception_index = EXCP_HLT;
>  }
>  
> @@ -865,7 +862,7 @@ void ppce500_init(MachineState *machine)
>          CPUState *cs;
>          qemu_irq *input;
>  
> -        cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
> +        cpu = POWERPC_CPU(object_new(machine->cpu_type));
>          env = &cpu->env;
>          cs = CPU(cpu);
>  
> @@ -897,7 +894,16 @@ void ppce500_init(MachineState *machine)
>          } else {
>              /* Secondary CPUs */
>              qemu_register_reset(ppce500_cpu_reset_sec, cpu);
> +
> +            /*
> +             * Secondary CPU starts in halted state for now. Needs to change
> +             * when implementing non-kernel boot.
> +             */
> +            object_property_set_bool(OBJECT(cs), "start-powered-off", true,
> +                                     &error_fatal);
>          }
> +
> +        qdev_realize_and_unref(DEVICE(cs), NULL, &error_fatal);
>      }
>  
>      env = firstenv;
> 
