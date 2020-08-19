Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp620560lfy;
        Wed, 19 Aug 2020 10:04:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2+ZfPEJ1BGCU4bQ5mNmyOzFaa/bgJyHqiARYJdBicvjjKqvxk4divf6VnpMw0sfYVSAqZ
X-Received: by 2002:a25:6c86:: with SMTP id h128mr32818489ybc.115.1597856644075;
        Wed, 19 Aug 2020 10:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597856644; cv=none;
        d=google.com; s=arc-20160816;
        b=MMPFzM/dUHvYvj67TeEn5UwL7e/TWQNlr2QPpHE9WQLp/pFxOrBZC0o2AVS8afWXXL
         aZ4zpSPA8Eadq3zUl6cjMynf0XARgmMLMSutlceyVk94a90sV+qp8/QNUsWUP/LpdbYv
         1sOym9XEc00pWfU/vWAaCPzGDjOHndNapIW6Q8fQ7I0QHhSDC0lcruvZDcDIi+8XTYO9
         Q46SU/OFggrMcZJUDGDrEOn8Vhu1q5u+xqVh6tBWzLhwrbszIWuptmbBIxJ4iPu2xmod
         omNFv2ASys8K3MH+AH15ptJHCT4/kse+BC07PPYYh83d2pS+nIrux3/PfnBznX5Y3pWP
         To8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=othxj44z6LoF66IlNXxsV/Il/fDUkBQ/ZEddb0p57tE=;
        b=lkIBhg4RfTte+iKI7HGWq/DnIlWJSib0P886nPB8eIvBmywP8TmjDQtI+w4jS4vApm
         ORxPY1T8IqTSLHKmQJLk3Z97eyE1LhhxB7eKu3ZRvurIO4UB/z1VuSAA0GUVPo6NtFpL
         YUYx3mLZAuaN447fqy+x4AZbnn+CTT+Ndhwh0hb8SsLdXSjlxzW02Rc27swTGxrvuXi4
         IBNzESIS7/vwzjyFeDrs/rfUfri9Z1h0VzK0cg3YHcQpG6bUuqtGVsEggTVmi+AOF5s2
         I44THjwGwbBh6gm70nMniBvjT6sthok8QcurLeWF4cFynJ4+9Tja4SIiFgHxFT2QxJkQ
         N87Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KIVYg0yf;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id s16si22548828ybq.434.2020.08.19.10.04.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 10:04:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KIVYg0yf;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597856643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=othxj44z6LoF66IlNXxsV/Il/fDUkBQ/ZEddb0p57tE=;
	b=KIVYg0yfGEQVNgAjkX4AxetyofWPB/CeKYcTP7Fec3JGs7ewGz46Vy3x70r/w1FmAXdNnu
	p9rVYlDF5bGSpYAsPfR0lIvIsdv8BkCgyXtQslzhLgz/zXtiAjYV9KGRs7195Hq5UP0Vpo
	yZRRk8BTqXms7FWc3piqg5YvTKehAKI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-yRzhej64Pn-3J0mC3yrYgQ-1; Wed, 19 Aug 2020 13:04:01 -0400
X-MC-Unique: yRzhej64Pn-3J0mC3yrYgQ-1
Received: by mail-wr1-f72.google.com with SMTP id f14so9509217wrm.22
        for <alex.bennee@linaro.org>; Wed, 19 Aug 2020 10:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=othxj44z6LoF66IlNXxsV/Il/fDUkBQ/ZEddb0p57tE=;
        b=BPxR6CONARDQpyfGY8/PFSpY2wpeyr0a6pYn/VoxHmjvCua4bP+QwJCwZoi23vYKfr
         1/KrsZG9frgvkxP/zum7p6Lu9XyhAoMAfo+0GdO1tsghKuJESfYVtUK3/ATL/Qpo9Y7r
         Q8tAiOqqKPTUgj/1T/6rcBPTxZcIhV6ywJZguYkDe4X+zizQSKr3sxuh/t1+C6SeSSmi
         Wr8YysQrCaWHGzO5h1PvlVJ3IWjQ4N50yvHFFjqm8/JjoLr0GamNuoAt99GjJ5TTGnxr
         d+csbDqXMa/EZ7cvVyD0Q/YbTqqGGCljYycieZxP2N60hH5A0ZX9RpuKGPL83SwBGhob
         bfMg==
X-Gm-Message-State: AOAM5310/j3ITeiaxLuhzBvsPOxH1Y+8ipvbwpVHVprGwSb2GXPfhLBU
	ze8HoavqARePfp6EW3RwlTsNB48o7FhGVPOGux7vUZUnvVKzqkNtEH3gt3aaeEBh+9DpjG19+7E
	dBbEvSm81UR0ZLXDl
X-Received: by 2002:adf:ee51:: with SMTP id w17mr26739649wro.239.1597856640683;
        Wed, 19 Aug 2020 10:04:00 -0700 (PDT)
X-Received: by 2002:adf:ee51:: with SMTP id w17mr26739626wro.239.1597856640446;
        Wed, 19 Aug 2020 10:04:00 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net. [81.40.121.121])
        by smtp.gmail.com with ESMTPSA id p6sm39379578wru.33.2020.08.19.10.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 10:03:59 -0700 (PDT)
Subject: Re: [PATCH v6 7/8] sparc/sun4m: Use start-powered-off CPUState
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
 Greg Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>
References: <20200819164306.625357-1-bauerman@linux.ibm.com>
 <20200819164306.625357-8-bauerman@linux.ibm.com>
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
Message-ID: <e38d45c9-1505-d596-6c2a-e82f73dc2935@redhat.com>
Date: Wed, 19 Aug 2020 19:03:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819164306.625357-8-bauerman@linux.ibm.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: n5w9Je8dtHFh

On 8/19/20 6:43 PM, Thiago Jung Bauermann wrote:
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/sparc/sun4m.c | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 22c51dac8a..23991ccd47 100644
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
> @@ -810,19 +801,16 @@ static const TypeInfo ram_info = {
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
> +    qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
>      *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
>      env->prom_addr = prom_addr;
>  }
> 
