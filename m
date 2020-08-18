Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3584514lfy;
        Tue, 18 Aug 2020 00:26:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxs6/eRbBjk0wCswIIlx5D+2iJ3h+QPnv6Y7ausZCSx2Exv7kzIcFF8NOk/fwG6Vl5FsIT
X-Received: by 2002:a17:906:1a0f:: with SMTP id i15mr19917854ejf.293.1597735599658;
        Tue, 18 Aug 2020 00:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597735599; cv=none;
        d=google.com; s=arc-20160816;
        b=nyYXziaTWajjUcXkFKB5rU1/yIJtNePfqTGzsNEph3hG85eMucYKVE0XA7l7mEQCHK
         Todm3m2RsEhslutgFlOAQlpmUIRanHFk21FdRWDkE995mgZBM/a8a8arV+dM9ultK1l1
         eQs30XaVUZgmK2G/JAokgXCV3jwe2pdlvvzIZya6NtV/YoIZ5b1mbPUjuJtdxaEyjJD0
         ub//9CnG1DMirgvYAQ619R664JFE3wm9w17myOVMQ4tDwr7m+fOODibWt4Gb6JE7fgQz
         47fwuLGurjWJgUgm/3RXNplvdM0/oPrRmPHG9B73OtFEVpKD2fNjiH8/DHHq0JMnzDgm
         widQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=26K6Cvx+pzLMebKlR4+Gmrhkv5wSgKlu3pbHjE2hMTw=;
        b=VZOF0z6BKQl65EF/GSb1r9jKBgdXqI0H21AAJ/oqVSYyu70d49WQLecl/tty3MZt7D
         a+yd0lNe/wQCXkfh/PlHqnWMON6BL4ZYyON/KlmfyWQvXf5ovyW5LrRU1sYNqNw6ydqK
         cY/2SzL1zrJsHoMFzze70U1TGgE0RIABhS9BbOiI3aMS7sHXw5T0gbNsgoGkUZI3+c4g
         C3RDb6J+jO/4NA2/v110Q60koTv14cg+AWKXKbQgCM3oa9I4mcfG2zewyZdCTjhAXunC
         ABp2xdBCKes5PP7ClF3jcEGdrOlIMgj1eWxJ8AE2MkAnT23FFP6M1nOBcUm8jj2BrMy/
         8p2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LztAq9Zn;
       spf=neutral (google.com: 207.211.31.120 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id i6si12796028ejc.494.2020.08.18.00.26.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 00:26:39 -0700 (PDT)
Received-SPF: neutral (google.com: 207.211.31.120 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LztAq9Zn;
       spf=neutral (google.com: 207.211.31.120 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597735598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=26K6Cvx+pzLMebKlR4+Gmrhkv5wSgKlu3pbHjE2hMTw=;
	b=LztAq9Zn65NuyG9Av/lGCFrxlkFS7/vjOOOJBFB0jEFy2eTAMGe2+U3X4NZJAYNB2yrbYE
	WohLJmmcTGeB4avAi2lBflNK9yxIcoD5+nI9QZMndChKnxbz5Zk27QLPa2/VyWfZSVYcPt
	U6NaGLP6VOAP/roVYdzn+rrmrMW5XvU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-0XBUQUa7OrW_eOO34eLJkA-1; Tue, 18 Aug 2020 03:26:35 -0400
X-MC-Unique: 0XBUQUa7OrW_eOO34eLJkA-1
Received: by mail-wr1-f71.google.com with SMTP id b18so7899197wrn.6
        for <alex.bennee@linaro.org>; Tue, 18 Aug 2020 00:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=26K6Cvx+pzLMebKlR4+Gmrhkv5wSgKlu3pbHjE2hMTw=;
        b=th2P7OxlOrkBn7NZ2xFKMStAFSzGz549RKcJxoOzYGs1TGowOgZnrwuV9D9/K5T80K
         H7mWj73I++n4CYF9X6MJm8AuYL4YOKlRyzrtRFLC3j1J1MYt9rISGSE7qXkTQnXzbrmU
         SwGzdhFTcskjJ45FLxHwjk0Dr8kUfLQ+2PoYtnyVBmUUcLvXjN0iGGlc3z5mUA6+MC5g
         0KPYbqTnKG6I7AZ9YTQ6WAKQ5Mo2RrnMv5ObOaSe2thxivIrTagJYIOpQIyqh/MMhZZe
         e2VG2ZfVuLHnjQIZcZqanc0ykdv3CLf5lMli/QyP3Q9TjLD7VRdh904WpzMX5zFGA2Na
         uqbg==
X-Gm-Message-State: AOAM532tdUy8TpE4TZMy4Q24jgybI3MCJiyQgVpBcE1t4NJZwBgcY7xh
	Fv/2dwNCFgKQlWthcym8XRfrO+hHjx75m1DxQdi0w3mvBXvtbSwaTMUXNNiMp1thvkJ6lozbKwc
	9AKrEUvwZlZgjpBR7
X-Received: by 2002:a1c:32c3:: with SMTP id y186mr17874195wmy.15.1597735593822;
        Tue, 18 Aug 2020 00:26:33 -0700 (PDT)
X-Received: by 2002:a1c:32c3:: with SMTP id y186mr17874168wmy.15.1597735593538;
        Tue, 18 Aug 2020 00:26:33 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net. [81.40.121.121])
        by smtp.gmail.com with ESMTPSA id t189sm33385299wmf.47.2020.08.18.00.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 00:26:32 -0700 (PDT)
Subject: Re: [PATCH v4 5/8] mips/cps: Use start-powered-off CPUState property
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
Message-ID: <8c454fa8-12a6-0258-04e8-6f3c093eb333@redhat.com>
Date: Tue, 18 Aug 2020 09:26:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818033323.336912-6-bauerman@linux.ibm.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: WN1kHFxxJyz1

On 8/18/20 5:33 AM, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in main_cpu_reset(), use the
> start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
> 
> Also change creation of CPU object from cpu_create() to object_new() and
> qdev_realize() because cpu_create() realizes the CPU and it's not possible to
> set a property after the object is realized.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  hw/mips/cps.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/mips/cps.c b/hw/mips/cps.c
> index 615e1a1ad2..be85357dc0 100644
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
> @@ -76,7 +73,9 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>      bool saar_present = false;
>  
>      for (i = 0; i < s->num_vp; i++) {
> -        cpu = MIPS_CPU(cpu_create(s->cpu_type));
> +        Error *err = NULL;
> +
> +        cpu = MIPS_CPU(object_new(s->cpu_type));
>  
>          /* Init internal devices */
>          cpu_mips_irq_init_cpu(cpu);
> @@ -89,7 +88,16 @@ static void mips_cps_realize(DeviceState *dev, Error **errp)
>              env->itc_tag = mips_itu_get_tag_region(&s->itu);
>              env->itu = &s->itu;
>          }
> +        /* All VPs are halted on reset. Leave powering up to CPC. */
> +        object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
> +                                 &error_abort);
>          qemu_register_reset(main_cpu_reset, cpu);
> +
> +        if (!qdev_realize(DEVICE(cpu), NULL, &err)) {
> +            error_report_err(err);
> +            object_unref(OBJECT(cpu));
> +            exit(EXIT_FAILURE);
> +        }

Here errp is available, so we can propagate the error to the caller:

           if (!qdev_realize(DEVICE(cpu), NULL, errp)) {
               return;
           }

For example in hw/mips/boston.c:

    object_initialize_child(OBJECT(machine), "cps", &s->cps, TYPE_MIPS_CPS);
    object_property_set_str(OBJECT(&s->cps), "cpu-type", machine->cpu_type,
                            &error_fatal);
    object_property_set_int(OBJECT(&s->cps), "num-vp", machine->smp.cpus,
                            &error_fatal);
    sysbus_realize(SYS_BUS_DEVICE(&s->cps), &error_fatal);

This will be propagated here ---------------^^^^^^^^^^^^^

>      }
>  
>      cpu = MIPS_CPU(first_cpu);
> 
