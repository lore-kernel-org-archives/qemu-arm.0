Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp68377lfy;
        Tue, 18 Aug 2020 20:10:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcbqFtRx7kRDbSVhaU0UtBIvSkh1em215zSbTJMt3MU/Hwg4GWRjkwqzqPK3+y/M/oJHVj
X-Received: by 2002:a25:86cf:: with SMTP id y15mr12547274ybm.25.1597806603631;
        Tue, 18 Aug 2020 20:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597806603; cv=none;
        d=google.com; s=arc-20160816;
        b=KPS1UEGV+Doq6YPVXvEPXqVfo8sTn2ORO7QXsJqQFbPxMZjRW4tUlR7BRgqbNroaH7
         tZmu+/PScK7pnEehBJhI02VmyMR8+ac7BHN5SVJOQnrPJ9Q3XpWGo/3aC3a/6ibn1msT
         Q8A116yum1QHJuiR59+jRB7q0/KvX3eO5AyNewgEahNaEBZbZ3n/l2ocP15Rck5g86k7
         zhAbdY5oAqeE5x/m0qVPMhpfgXeVeDg+VmhLusXaN4HnBxGb3bi8FaAQhNAXbh7fEWQG
         qPW6XmHDAUwGIUbWGETHbXdzE8HF/xt+7Ipu3pSAeN6uzybNpRSEnpqU/lGtdr/eNklH
         1sHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=/YWvTSaszlI35f1vwnHAS3xE4BBN5TDFZdtqdb59rKY=;
        b=GjXFJx/5XZrMwGu29JWtKNCzsOSVhaBAK8VOjHy6VZAfRrBv85j+jBwiniDAz3YfPM
         Uz4P3fsVLlsEMaRQEHmP5PZwU5oGTITWUFb4JlpYoz8KA6BlNeivqeK7iWZkE0C4mc/3
         16VkiFsx/Go4vMv292gR2em33v0MwqxOAhf/ntIKHXIdLBHfL9/BWtgjf7tJ4uWCY1Qp
         /dv/TmAqkA50TyPi1s7XZvg5GJ6VsS3EPlRtTcjhjOVJ+myzb7b4xDf0e/8mMnRIrmo/
         PVpOfrbXa+lzyZCGR2SaGj44yR4XnRSKN4kZYW9q3etxmiufxccXFO1oT5DMW6bw8coy
         Ry/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NZUQWiGf;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id b10si21244444ybq.340.2020.08.18.20.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 20:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NZUQWiGf;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597806603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/YWvTSaszlI35f1vwnHAS3xE4BBN5TDFZdtqdb59rKY=;
	b=NZUQWiGf+entMhZBpvVO23A7NPXj4HH3HBlHx7dbxjwSEwifUCwQHmdqLOyWbYKbJ2MBKw
	nP4/0HF1fFHRb5OH+obkCTopP6Rp9uocIGFiKWKlobHfWcTtq2Zac/kSWHxjBVAeMy70XN
	OixbJ1zD9FZF6wqwPxCGajrZqFEtZnk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-lnHuiZxsMH6Lwri39OQLYA-1; Tue, 18 Aug 2020 23:10:01 -0400
X-MC-Unique: lnHuiZxsMH6Lwri39OQLYA-1
Received: by mail-wr1-f70.google.com with SMTP id s23so8856335wrb.12
        for <alex.bennee@linaro.org>; Tue, 18 Aug 2020 20:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/YWvTSaszlI35f1vwnHAS3xE4BBN5TDFZdtqdb59rKY=;
        b=dCHRFRUKDKmRzspoqWACrUkjQ8troZVViLu44xXUnQvviOzLX9eGDi/lvaQMsAfNNq
         smpAlonk4AIEqHfynQ03y20Ri1D+QB15ziaYpj2CdvWXsQ51IxivPmFfhebeX2MimLYT
         N98fY7FkeEz8GGPP1gbFPpoYIclud5n9az1t/lW+cYosmrZojbgY5CbU5dzyiKgl0A3w
         yQ1bqth1Aa0Ii9GuRfONTyvEYENpO8xmIwYCtb63S7f86s6Qh9KRdPzQHdm2dhM0YyIV
         XfDetwRo/ZgVV/mKo+QunhFRh3L6nzPr/UojSjy1paOhcGH2Z8rgcuL6Yc5LmgoaOAYA
         ki7A==
X-Gm-Message-State: AOAM5337k3LcBEXOA/d0p00ul4F6DTthE6NAhQTdPF+YSLmtCNB4CqkF
	r8WMfxU50ggzuMcKmi1YQaBtnRGg/e6nqBklobyIdyenMOVt1C/zjKdYxDMw91FfInrKhz0qtng
	jfXUabKvirmzqVUGz
X-Received: by 2002:a1c:c906:: with SMTP id f6mr2818293wmb.5.1597806599762;
        Tue, 18 Aug 2020 20:09:59 -0700 (PDT)
X-Received: by 2002:a1c:c906:: with SMTP id f6mr2818280wmb.5.1597806599577;
        Tue, 18 Aug 2020 20:09:59 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net. [81.40.121.121])
        by smtp.gmail.com with ESMTPSA id k15sm37127010wrp.43.2020.08.18.20.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 20:09:58 -0700 (PDT)
Subject: Re: [PATCH v5 7/8] sparc/sun4m: Use start-powered-off CPUState
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
 Greg Kurz <groug@kaod.org>
References: <20200819024220.587612-1-bauerman@linux.ibm.com>
 <20200819024220.587612-8-bauerman@linux.ibm.com>
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
Message-ID: <350a0f8f-8db7-2e91-28e3-e114fc05c340@redhat.com>
Date: Wed, 19 Aug 2020 05:09:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819024220.587612-8-bauerman@linux.ibm.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: Jrdbf/hvh/gP

On 8/19/20 4:42 AM, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in secondary_cpu_reset(), use the
> start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
> 
> This makes secondary_cpu_reset() unnecessary, so remove it.
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
>  hw/sparc/sun4m.c | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 22c51dac8a..1925f415e7 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -218,15 +218,6 @@ static void dummy_cpu_set_irq(void *opaque, int irq, int level)
>  {
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
> @@ -810,21 +801,19 @@ static const TypeInfo ram_info = {
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
> -    if (id != 0) {
> -        qemu_register_reset(secondary_cpu_reset, cpu);
> -        cs = CPU(cpu);
> -        cs->halted = 1;
> -    }
> +    object_property_set_bool(OBJECT(cpu), "start-powered-off", id != 0,
> +                             &error_fatal);

Why not call here:

       qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);

?

>      *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
>      env->prom_addr = prom_addr;
> +
> +    qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
>  }
>  
>  static void dummy_fdc_tc(void *opaque, int irq, int level)
> 
