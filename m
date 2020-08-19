Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp66443lfy;
        Tue, 18 Aug 2020 20:06:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIo7oRWip6Q50BDtL9F+EO1Rn8ZyRKCgHptpYqip9NLhvdqRdoalWgk0vfj9ojqQbG2NUs
X-Received: by 2002:a5b:70d:: with SMTP id g13mr31217555ybq.160.1597806394536;
        Tue, 18 Aug 2020 20:06:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597806394; cv=none;
        d=google.com; s=arc-20160816;
        b=OdW9aAGYcSrl5N5lAQbLvkeattr99QeeFwG2+R+7HdeLD55DZOFIV6rJdanZLBYzkh
         quDB/550Qy/cmxigO+KJltAQxTTccQoxEN2M6pUGeordYEOzVNln33/6VTnlm5qxd92l
         nOQ5WY8iLrkFrpGimcniOUVoSXvJIqqVH/5MHBswB0UyB+yvpSr47twhrgbXjiFnVFg7
         HfS1UH+BTDd+KrWSl7UkYGxKLmeA1lbbfvdjEghosQ3a7s/UHp8TjJq3CRNVntIG0yJs
         O/DoHxlOgVAXB4jL7pbLaS1Q4Fz5bw9sV+15jH5tfb0FwLb8V+TuAbfS9eJi11Xnq1IP
         Ncwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=ez2Petedxsrbf32eX1lpixm2JVQcCqCdk4pW+ZtTgbE=;
        b=EhwiTM0UMk5nHIL15wgHCJTaASYM5Hg0xvunhbCFSrq8vpfjkSzVxDAoIzMc9YmEJ2
         8D37SS7L3yfEzaOZqZtGn3HJIWGKVEWP1AGzZ/37Bw5eeuGSBf20lHoONHHKoFoqZs8B
         LKSQguRdrbknqkDBBsqC+ZVg9PZckS6vroyqrKn3v9I/NLeFFxrAmxlsLAye0fCW3F0N
         rvgnAnuBmQJjcVG289pQVkYxFVadUgONI9MbhC+83INQEVqFZEi5KRbMjqvgsrZeY1mL
         afrleKxSiCSOASgxTlHudM51M35l95FPiARoclxEhxjEJuJ9dfE6KH4KpttPn76mAKHL
         PYqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JO5esLPX;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id x4si27551085ybt.336.2020.08.18.20.06.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 20:06:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JO5esLPX;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597806394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ez2Petedxsrbf32eX1lpixm2JVQcCqCdk4pW+ZtTgbE=;
	b=JO5esLPXpl11VzRdonUxVfNSlO60vT0VLecTkK8aTFcRwFQqZljSkXUofV8vaDrGSW6VyZ
	6NMz20rk7gvAthV2JoR5/3LfG40iRfWLLP65YAJEgWG+fPJ+mffGIvHstEI1OhNcQjH7g8
	t/PbtpqXJPBWg5q0jAaI/c7QotARmSI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-K2Zjt4wvM6uRJXdAPuTc1g-1; Tue, 18 Aug 2020 23:06:32 -0400
X-MC-Unique: K2Zjt4wvM6uRJXdAPuTc1g-1
Received: by mail-wr1-f70.google.com with SMTP id b8so8901265wrr.2
        for <alex.bennee@linaro.org>; Tue, 18 Aug 2020 20:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ez2Petedxsrbf32eX1lpixm2JVQcCqCdk4pW+ZtTgbE=;
        b=FPe9Ww8x4Tiieh+PDHMmdlZw7sUgMp/DVWndtjzs19PsXeBEErJWnOcCO857ZKL5TF
         PtCAj6QuPwx0EfFXL5xzZNTXXHLP1N1e8vEfT1zzp7ZzRC6wrErvwgVaRkx1DRXAwpAM
         hVy4PrVA4tmdM11guw5ZBp40XDxCI6qXWakmvCw8lWALKE2dr3vS4fnFrUzX2lc2riX0
         SP+/vt0fmxA0VELRF5PhZXIEsK+EbS7pZkP41wIASqNspHGIDc2+DnhA7ZJUt5xqKzIv
         EGtGU4kRv5I/Nzp+Sh+lGZHFHw4cU/ZFkx3GjNzFm1wi0z/qJH/i5wAFK7ybPVMkPRHD
         ZauQ==
X-Gm-Message-State: AOAM533713DTCMFQt4fMUPgfHQIyXAlwlPAPoQhK67Axw7rAK5ZMoT5a
	UDCKBvezqRmd701G+Ja9iBvod3/mCNA8KVBJP8kVbkMCAW4ZwUSITq5yAzyZICQYYv2bUdUKoh7
	4qlBpv/kvbFtTZYo+
X-Received: by 2002:adf:a15c:: with SMTP id r28mr22792819wrr.151.1597806391241;
        Tue, 18 Aug 2020 20:06:31 -0700 (PDT)
X-Received: by 2002:adf:a15c:: with SMTP id r28mr22792796wrr.151.1597806391052;
        Tue, 18 Aug 2020 20:06:31 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net. [81.40.121.121])
        by smtp.gmail.com with ESMTPSA id g14sm2765340wme.16.2020.08.18.20.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 20:06:30 -0700 (PDT)
Subject: Re: [PATCH v5 5/8] mips/cps: Use start-powered-off CPUState property
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
 <20200819024220.587612-6-bauerman@linux.ibm.com>
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
Message-ID: <48b61a7d-60e0-ed65-3ba9-cf8a65b56495@redhat.com>
Date: Wed, 19 Aug 2020 05:06:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819024220.587612-6-bauerman@linux.ibm.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: K4k7xrPqUB4R

On 8/19/20 4:42 AM, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in main_cpu_reset(), use the
> start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
> 
> Also change creation of CPU object from cpu_create() to object_new() and
> qdev_realize_and_unref() because cpu_create() realizes the CPU and it's not
> possible to set a property after the object is realized.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  hw/mips/cps.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
> index 615e1a1ad2..4a98cf2287 100644
> --- a/hw/mips/cps.c
> +++ b/hw/mips/cps.c
> @@ -52,9 +52,6 @@ static void main_cpu_reset(void *opaque)
>      CPUState *cs = CPU(cpu);
>  
>      cpu_reset(cs);
> -
> -    /* All VPs are halted on reset. Leave powering up to CPC. */
> -    cs->halted = 1;
>  }
>  
>  static bool cpu_mips_itu_supported(CPUMIPSState *env)
> @@ -76,7 +73,7 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>      bool saar_present = false;
>  
>      for (i = 0; i < s->num_vp; i++) {
> -        cpu = MIPS_CPU(cpu_create(s->cpu_type));
> +        cpu = MIPS_CPU(object_new(s->cpu_type));
>  
>          /* Init internal devices */
>          cpu_mips_irq_init_cpu(cpu);
> @@ -89,7 +86,16 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>              env->itc_tag = mips_itu_get_tag_region(&s->itu);
>              env->itu = &s->itu;
>          }
> +        /* All VPs are halted on reset. Leave powering up to CPC. */
> +        if (!object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
> +                                      errp)) {
> +            return;

Ah, better :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +        }
>          qemu_register_reset(main_cpu_reset, cpu);
> +
> +        if (!qdev_realize_and_unref(DEVICE(cpu), NULL, errp)) {
> +            return;
> +        }
>      }
>  
>      cpu = MIPS_CPU(first_cpu);
> 
