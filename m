Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4432499lfc;
        Tue, 1 Sep 2020 02:55:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/rIzrLxWPd5k4U5qdxpGwUMIwnYdqPx1ubPEsiD5P+dYyPgafgLHFKG0vugqF911WTYq2
X-Received: by 2002:a25:4c84:: with SMTP id z126mr1402546yba.369.1598954104071;
        Tue, 01 Sep 2020 02:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598954104; cv=none;
        d=google.com; s=arc-20160816;
        b=K6WR++Ji6bw7B/5GcywVVniqn/uPOzl2kT6BeYo251cJ5WD3tPvCEQNFT1Q/jP7/GS
         AysbSo1jRyH9zyzXohV9l5nEv3HHYoUPyCRCL4mp+duEAGDCySHrf/JJ0xGU93ryV31s
         7MytgjwjsLhHjxbgqsi5m8aRw8EmkZ+a7ARqCTDpeBUjJ6Ty4xvlJMZfBtZmYz+KjvF2
         VM5o9d2T0BL1PmhsAe2D2o5DkG4IkwAOFgu6op2zu7/UoMmhpRbOKVgc8CUSruqJyDJq
         SHRz/7AlwnIl+xio584xMoM9VGGeX83kM08rSzwzgFQ1+s26sZGgExk9QgH09ClLvvQd
         CPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=ge0H5ZBrf27oPyk+7JrfmbQuYls4XE7mP+afTEUCt6w=;
        b=ckhim/cZZfrNpXhtMrlnrY6OoR4GRQ5VUg8FFgt/GG1C+Ap5vhNDOuYsCvl4Zy+qV3
         nPvnW+hm5lv0ehe+6rNbCjGk4TQzZB9jDJE47lnmYpBYhvTcR1tH6d2z1bQ4Vew65dpB
         NLel5X3ncrZUmOP0EehCq2831CErMHYAi6sS+XJ5NSGEgShomy51H03WXzW6EripbhX3
         I/3dVbxacNQ1SaZgJjTwnBJVdX4JynN+yxcsiuAdFvoge6HZaKCaozB1HWr7lR0tOruA
         o3sTrTVF4M0+eLBrEGWw47QrDmCvBlpb3oEMsIwDJk76LQdP5+T/Moby6GXfC/N3N7UQ
         Ierg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BdpLUKPV;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id n81si601637ybb.351.2020.09.01.02.55.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2020 02:55:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BdpLUKPV;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598954103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ge0H5ZBrf27oPyk+7JrfmbQuYls4XE7mP+afTEUCt6w=;
	b=BdpLUKPVxCw5HEo10IFVhD9Q1zO6z/75puOR2UepLcbZupEuCpvWrfWFL8LS0mflWTaJET
	6ogogXGCWMVNyzJqU3CxA3tOKo5WLFGWcZY5uiigsVzdevZhmM1Pj2xC8Y9cabGtO72FwA
	4bwqc2KukgALYw32bcqZjcV1cRa2Kac=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-2sZ3EerCMVqVJHQ6CVsD2A-1; Tue, 01 Sep 2020 05:55:01 -0400
X-MC-Unique: 2sZ3EerCMVqVJHQ6CVsD2A-1
Received: by mail-wr1-f72.google.com with SMTP id b18so365801wrn.6
        for <alex.bennee@linaro.org>; Tue, 01 Sep 2020 02:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ge0H5ZBrf27oPyk+7JrfmbQuYls4XE7mP+afTEUCt6w=;
        b=rwmg1V+nC3sDqBalsRdl0V6Jb5UnP7TsfJw3BLFikxfv3NPvcn1JrjB3RA+zKl4NK6
         iNMbYHVQxUdlFCxgKIxp3CiMs87JWewdADsTr+n76IOpv5PI+7s/2SQPuqfWVsT/Xqb9
         7X/LVMZ6oxsIUVtGh0aD/hTPdFCHWpGnbwpFS6taxdCuLsiUTR+NcnPjqmVGyD/2y2AE
         x22V9nGGrSuBO+XwXyRYMQtlvDhFsIcl2XzSsraz4oPDjVksQ1Pzcza5UE4voomDnSPE
         Iq+y2vaHDhY++AEWZ53MLgiPK7ziB+fscZGpnhI/yecGhZsKP0/pVv4VmwGhzumVBWhX
         0bhw==
X-Gm-Message-State: AOAM531e5Whc2oBSnO61jmMqYFF2qEc5jxyrcUgwrNGYQfFvUGVPwyVT
	Ni4XeMoRwog3Ehixy1aScBv5swujAbrCTh+zqL3tTAqWKIQvj+z/JnBILECkGXL1cW0PAngZftA
	tU0+XYL25dv36bsP4
X-Received: by 2002:a5d:4811:: with SMTP id l17mr1043118wrq.252.1598954100614;
        Tue, 01 Sep 2020 02:55:00 -0700 (PDT)
X-Received: by 2002:a5d:4811:: with SMTP id l17mr1043095wrq.252.1598954100434;
        Tue, 01 Sep 2020 02:55:00 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net. [83.52.54.50])
        by smtp.gmail.com with ESMTPSA id l10sm1487594wru.59.2020.09.01.02.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 02:54:59 -0700 (PDT)
Subject: Re: [PATCH v7 7/8] sparc/sun4m: Use start-powered-off CPUState
 property
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
 Greg Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20200826055535.951207-1-bauerman@linux.ibm.com>
 <20200826055535.951207-8-bauerman@linux.ibm.com>
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
Message-ID: <0f5fc8af-081a-3d2f-83a8-88303fe4e3d0@redhat.com>
Date: Tue, 1 Sep 2020 11:54:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826055535.951207-8-bauerman@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: 5wV3IaPXWt/H

On 8/26/20 7:55 AM, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in secondary_cpu_reset(), use the
> start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
> 
> Now secondary_cpu_reset() becomes equivalent to main_cpu_reset() so rename
> the function to sun4m_cpu_reset().
> 
> Also remove setting of cs->halted from cpu_devinit(), which seems out of
> place when compared to similar code in other architectures (e.g.,
> ppce500_init() in hw/ppc/e500.c).
> 
> Finally, change creation of CPU object from cpu_create() to object_new()
> and qdev_realize_and_unref() because cpu_create() realizes the CPU and it's
> not possible to set a property after the object is realized.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  hw/sparc/sun4m.c | 25 ++++++-------------------
>  1 file changed, 6 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 7484aa4438..6bf9d27d8a 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -218,7 +218,7 @@ static void dummy_cpu_set_irq(void *opaque, int irq, int level)
>  {
>  }
>  
> -static void main_cpu_reset(void *opaque)
> +static void sun4m_cpu_reset(void *opaque)
>  {
>      SPARCCPU *cpu = opaque;
>      CPUState *cs = CPU(cpu);
> @@ -226,15 +226,6 @@ static void main_cpu_reset(void *opaque)
>      cpu_reset(cs);
>  }
>  
> -static void secondary_cpu_reset(void *opaque)
> -{
> -    SPARCCPU *cpu = opaque;
> -    CPUState *cs = CPU(cpu);
> -
> -    cpu_reset(cs);
> -    cs->halted = 1;
> -}
> -
>  static void cpu_halt_signal(void *opaque, int irq, int level)
>  {
>      if (level && current_cpu) {
> @@ -818,21 +809,17 @@ static const TypeInfo ram_info = {
>  static void cpu_devinit(const char *cpu_type, unsigned int id,
>                          uint64_t prom_addr, qemu_irq **cpu_irqs)
>  {
> -    CPUState *cs;
>      SPARCCPU *cpu;
>      CPUSPARCState *env;
>  
> -    cpu = SPARC_CPU(cpu_create(cpu_type));
> +    cpu = SPARC_CPU(object_new(cpu_type));
>      env = &cpu->env;
>  
>      cpu_sparc_set_id(env, id);
> -    if (id == 0) {
> -        qemu_register_reset(main_cpu_reset, cpu);
> -    } else {
> -        qemu_register_reset(secondary_cpu_reset, cpu);
> -        cs = CPU(cpu);
> -        cs->halted = 1;
> -    }
> +    qemu_register_reset(sun4m_cpu_reset, cpu);
> +    object_property_set_bool(OBJECT(cpu), "start-powered-off", id != 0,
> +                             &error_fatal);
> +    qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);

It is cleaner to call qemu_register_reset() after realize().

Anyway,
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>      *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
>      env->prom_addr = prom_addr;
>  }
> 
