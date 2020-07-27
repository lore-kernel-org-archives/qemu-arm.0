Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2893794lfy;
        Mon, 27 Jul 2020 07:15:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXAZnecg7JKdkNuYj7pUssSGMtzT2YfJhrVPCb5vww2IiJbUneUDRBR8CbHp2VKOJqCIRH
X-Received: by 2002:a25:7e85:: with SMTP id z127mr35305761ybc.384.1595859330521;
        Mon, 27 Jul 2020 07:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595859330; cv=none;
        d=google.com; s=arc-20160816;
        b=FJMZu4jCZIrje9teH+xxBQXgtP1l2hSEa/2nQ8xRDgJQ+1AN2TW8Se0yIFLAV4csNS
         fvZhZJiXRTDSwPgr5G8YNBZqTKNubBeWe+yWcQ8oDfNnzOEY+7P83evsJgzT4Nla3wHo
         lZgch6bMfp3G0oA/KLUYzbgGBISRQS7t46JeqS0SfObDepo9yO/rQd7EweG+HsWyHH8O
         pqJKQQbjwfX0zUlMMJoc3K/a9mchOh7yo5v/LI3CjNL7nqaGnGrcc+68m85ZUN3d9XOC
         gztQ+Jn/J5JujcZh0u6OaStl1Ijl93IExpxvxSbWUSdc4lx2ewLCNZoPMwa1ydldX6UR
         TMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=hvaGpv0VQMlEk7R7m7Nsyhs/O10vHvxs6gfdYnzr7zM=;
        b=htwYef8fKQle5UyWMtrBjCY3SjwqujfztwZ6ibGEMQTMhlCVbg545NgZ6UTK5KI+q2
         cep1hSRzS2g1kaKxvQ7xjgWxiq7ofE9+I7nHzL++eF4XnYKSS0TLis41dZVyNefdIqNP
         UmT72mjhcSnqbRXSXMSQfHcS0g9+2TNdBPupHxTgkyVqvF2FiEShle3tvoCrqM9HZT74
         RPjUn75fioIVtAt1ZFnSmSLMwRY0Iw2/zc+Ow5r1jeov3FN0iLGGMTzLBraplaH6qxNA
         ziYdMl3ivctZJ6SC7ki7MlOwVKxmBoPik53SMGfdYe1qM9QhoBZX0gtEb1tIHiWkSsn+
         8egg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hz3YQXEG;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id 190si9693912ybn.85.2020.07.27.07.15.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 07:15:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Hz3YQXEG;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595859330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hvaGpv0VQMlEk7R7m7Nsyhs/O10vHvxs6gfdYnzr7zM=;
	b=Hz3YQXEG/LCCj8VwEtgOXsk61YSD+zmpDF6dN/Pk8vV08jSHsuBfNw5Z+pLjICHKeY4O9x
	ahd9fZuGxsPAgZwQnL/laQoTpQrjquujgwsXN5pxDatvvhP2/LTquYi/N26EKNSa0ulouB
	8ZQj/dQD5xTgaAsCBgy7LRoRVM5flxw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-WdDBtJ6ANEG7XKSr9ms3PQ-1; Mon, 27 Jul 2020 10:15:27 -0400
X-MC-Unique: WdDBtJ6ANEG7XKSr9ms3PQ-1
Received: by mail-ed1-f70.google.com with SMTP id z12so5666863edk.4
        for <alex.bennee@linaro.org>; Mon, 27 Jul 2020 07:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=hvaGpv0VQMlEk7R7m7Nsyhs/O10vHvxs6gfdYnzr7zM=;
        b=bDnLDsUgwoGKfDaBiLFKwv/wYI5wSvoY2D2MNbiAd0+OMDmKRLRN/piKW7sRXa0/JZ
         WEtCC0rdBj9Q8Ydkf+OIHzFBo8vZKxJqqX4bNTbNDP43kzQ4gf/rN6AqCEa61A5X+XrY
         eIjgEKWUN2VP0jqapsfbOrM/7BfNtWkn82Gv0WAUnjrsXOUf5WI9/Ny/t0Q97cKJaJ2L
         B7hKbCFWr+dHVd0wvCX+FVxhwRTh6k1RDWkuCIcb5Z0yXUGjPS8Pe5J6Slvl57miPyzL
         /LPKj67/p2lVgSQS/3mP2BnO9itUZW5OwMVZK4veB1lJLO82c2wcfQnLVzVBhqz6bA0e
         pZlg==
X-Gm-Message-State: AOAM531UO/j44l96ONa/vAwH/xSm7+ZW/gasclBMJq3aYPDFWDYoMqR6
	0EAXxsona8rFiuKwpuxh/bV4FspRPJ9ZOfubsk7LMaQVfdFRIMkinFbEeLlw++fqtFaVnoToJuu
	RAzG0EKdTI8bnBP3Z
X-Received: by 2002:a17:906:178b:: with SMTP id t11mr20587009eje.489.1595859326638;
        Mon, 27 Jul 2020 07:15:26 -0700 (PDT)
X-Received: by 2002:a17:906:178b:: with SMTP id t11mr20586983eje.489.1595859326382;
        Mon, 27 Jul 2020 07:15:26 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.33] (214.red-88-21-68.staticip.rima-tde.net. [88.21.68.214])
        by smtp.gmail.com with ESMTPSA id o15sm7629392edv.55.2020.07.27.07.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 07:15:25 -0700 (PDT)
Subject: Re: [PATCH v3 7/8] sparc/sun4m: Use start-powered-off CPUState
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
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
 <20200723025657.644724-8-bauerman@linux.ibm.com>
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
Message-ID: <d56ebc7f-815e-73f2-9cb5-6ff16e2c9a2e@redhat.com>
Date: Mon, 27 Jul 2020 16:15:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200723025657.644724-8-bauerman@linux.ibm.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: oosOcsneeOKe

On 7/23/20 4:56 AM, Thiago Jung Bauermann wrote:
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
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  hw/sparc/sun4m.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
> 
> NB: I was only able to test that this patch builds. I wasn't able to
> run it.
> 
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index f1d92df781..fd74e516bb 100644
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
> @@ -810,7 +801,6 @@ static const TypeInfo ram_info = {
>  static void cpu_devinit(const char *cpu_type, unsigned int id,
>                          uint64_t prom_addr, qemu_irq **cpu_irqs)
>  {
> -    CPUState *cs;
>      SPARCCPU *cpu;
>      CPUSPARCState *env;
>  
> @@ -818,11 +808,8 @@ static void cpu_devinit(const char *cpu_type, unsigned int id,
>      env = &cpu->env;
>  
>      cpu_sparc_set_id(env, id);
> -    if (id != 0) {
> -        qemu_register_reset(secondary_cpu_reset, cpu);
> -        cs = CPU(cpu);
> -        cs->halted = 1;
> -    }
> +    object_property_set_bool(OBJECT(cpu), "start-powered-off", id != 0,
> +                             &error_abort);
>      *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
>      env->prom_addr = prom_addr;
>  }
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
