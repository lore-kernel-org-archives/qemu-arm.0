Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3585073lfy;
        Tue, 18 Aug 2020 00:27:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXvCDG5pu+T7FcsAXtTKwvcC4smRTJ3wd7SsEwTHMVirb5WU09i/PYGN88+F4dOhIj270C
X-Received: by 2002:a17:906:938f:: with SMTP id l15mr19657683ejx.539.1597735663865;
        Tue, 18 Aug 2020 00:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597735663; cv=none;
        d=google.com; s=arc-20160816;
        b=A+zIbUBiAf3WhT8ATrH4YPLHJ4XYP/q1uZoou7A76nd9u3fdurXQjxAV1lOu2iL/Yl
         t1/ch6dIqVPgkzJrC5f2fPRLtaX8IYVc5qNR0a+FKKDRt02o7DLItiwVfnG0FDPjT+GL
         EQkDHZsSfRVi0oGNB1ykj7YJ0JcUOJXMpqQ0xNgQxrK5YGnndlr+e0+zgvL/OL3nBaMV
         MEV/hYAKgnKSeXwo7evo71CMh49gBB5vpWsvjxEFd/Xltmuwr68uEe+HDtN0mIU90rFu
         SiCkGj8Ksrm6Dayr2MDxQazxQLUhPrVNG+p7nE3vhw5BDWScw5hMC22dX7OOxsUAt9FO
         3EMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=tYRhT1aOBhvFfuC2aTxR6G0prdl+VC17Z2TlTBkDptk=;
        b=evFUw2SGkK4YdpmmcUaj1viPf8olXYccLceYUyAwFsmDl7ZMzLdWC9LewxmYhKeK6f
         7pMHjRXtVwHf6Hz7K2i0ihUQk7Yl96I0/948w6B6W2WuQcGcXfYqKHltIt0k932FXYMT
         HgAuH1eRzTH9jOgUql6dHlJfcoJIRz1GDm1LXR9wFKy7z0VjZwldau7nU8mEcJkB1G01
         d9EhQ6Mag3XzL99NIRGVP4nihqJcesyUVcX2mORCtp73qMV67SmvLi1HxsBJSxDZFYuq
         JpYFL4VMdtSfPMq6s1XBVBe1TPtRYSmeiEmd/Nwc6oRzgfHJY2eQVFJPzrXWDWtDHM2y
         p4Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AkOzlJoo;
       spf=neutral (google.com: 207.211.31.120 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id r26si12367372edy.137.2020.08.18.00.27.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 00:27:43 -0700 (PDT)
Received-SPF: neutral (google.com: 207.211.31.120 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AkOzlJoo;
       spf=neutral (google.com: 207.211.31.120 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597735662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tYRhT1aOBhvFfuC2aTxR6G0prdl+VC17Z2TlTBkDptk=;
	b=AkOzlJooWeiRD3xPoEnYhE8s+F/7GrQ03UeroEOau0RinH0ivQTLJMRcxcu0CBiNvl4yVF
	HUjPAvB9g5uFt+2KQIxcy+cbgNWWspPwcPD49QCHukEyXdWUNHTwh/Pzwetv+YtKosW+UB
	xWsPr7g1ID0ZAFq+0WiYr32mUcMoQww=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-jj03l7uyO_e5r6dYJ079NA-1; Tue, 18 Aug 2020 03:27:40 -0400
X-MC-Unique: jj03l7uyO_e5r6dYJ079NA-1
Received: by mail-wm1-f72.google.com with SMTP id f74so7062705wmf.1
        for <alex.bennee@linaro.org>; Tue, 18 Aug 2020 00:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tYRhT1aOBhvFfuC2aTxR6G0prdl+VC17Z2TlTBkDptk=;
        b=dqk8vTENEKPHDlS9WxHsmD46YR7YS/jovsnW5DrlLEmdqJhIBbwiN9nbiG2f6ERfTM
         pE7Or/6l0Sz11T9akGyQ+prRp9xQ/WHvjtwcO9pRwlp8n2t5MTokZK1ofL/3n4WI5kdr
         fkE0ecv3APAmejzI3OX4vlRXN6593LKsdky1T2ic8V3u4upiitZArQyCvkAe73JclWyf
         fBU4R8Nsjb87Cg8Jv85bI862FhIhwDG+8s0pyXvHfIILdvS99yDp1QDRCBpYEP52f/rA
         ardlf31LjwqdhwItgLYUaCyewryv+JT3jL2/1Enw0Q2w4P0zsV4rUUrf5MccwknlhdWw
         DF9A==
X-Gm-Message-State: AOAM530O4pu50MLcJk1yVT6pJCYSHA7s+KPXfSiGjsDOYo6uJVzlP9Dg
	0nSy3LmlGy56BOQlLjPZqF9s8DJuNKNE8beZMLXlgLFPNYa2hVkckf9qUbsHnhCZY9OSlSynu7I
	lS2Df6uQ32VfjGfO7
X-Received: by 2002:a1c:5416:: with SMTP id i22mr18148608wmb.172.1597735659884;
        Tue, 18 Aug 2020 00:27:39 -0700 (PDT)
X-Received: by 2002:a1c:5416:: with SMTP id i22mr18148589wmb.172.1597735659651;
        Tue, 18 Aug 2020 00:27:39 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net. [81.40.121.121])
        by smtp.gmail.com with ESMTPSA id d7sm35050455wra.29.2020.08.18.00.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 00:27:39 -0700 (PDT)
Subject: Re: [PATCH v4 7/8] sparc/sun4m: Use start-powered-off CPUState
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
References: <20200818033323.336912-1-bauerman@linux.ibm.com>
 <20200818033323.336912-8-bauerman@linux.ibm.com>
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
Message-ID: <d1885e17-d5a8-6b87-1e73-729b686144ee@redhat.com>
Date: Tue, 18 Aug 2020 09:27:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818033323.336912-8-bauerman@linux.ibm.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: ZXeGHTxzzdJB

On 8/18/20 5:33 AM, Thiago Jung Bauermann wrote:
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
> and qdev_realize() because cpu_create() realizes the CPU and it's not
> possible to set a property after the object is realized.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  hw/sparc/sun4m.c | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index f1d92df781..41a7c5fa86 100644
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
> @@ -810,21 +801,24 @@ static const TypeInfo ram_info = {
>  static void cpu_devinit(const char *cpu_type, unsigned int id,
>                          uint64_t prom_addr, qemu_irq **cpu_irqs)
>  {
> -    CPUState *cs;
>      SPARCCPU *cpu;
>      CPUSPARCState *env;
> +    Error *err = NULL;
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
> +                             &error_abort);
>      *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
>      env->prom_addr = prom_addr;
> +
> +    if (!qdev_realize(DEVICE(cpu), NULL, &err)) {
> +        error_report_err(err);
> +        object_unref(OBJECT(cpu));
> +        exit(EXIT_FAILURE);
> +    }

Simply use:

       qdev_realize(DEVICE(cpu), NULL, &error_abort);

>  }
>  
>  static void dummy_fdc_tc(void *opaque, int irq, int level)
> 
