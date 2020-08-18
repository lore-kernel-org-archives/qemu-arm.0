Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3582304lfy;
        Tue, 18 Aug 2020 00:22:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG3K3ixXlwLk06hrTRAQQ75IdmeWGhTXtDgSenhDdJHevYxTprEOmdnh/pszz7YfphNVuk
X-Received: by 2002:a17:906:5f84:: with SMTP id a4mr18444455eju.345.1597735332558;
        Tue, 18 Aug 2020 00:22:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597735332; cv=none;
        d=google.com; s=arc-20160816;
        b=Et28WVsUNIQEB6aCgCGaeLi/MivAuTTyPHyNF4iQ4YqkbddzE69qnEx2zmn9yoV8Ia
         /jnyaD3xNHgGWz8y7lMVXVzPjpAm/QU4nSQB1MSR/5SDE0eTSkm/BvQhLLU4h5WMkiYR
         FPOKx/mkbQjb6q+jfEvPB5qDqFfkuJ8I3wOH0irSPwdQm/n6MuA5FOClGsWb481uN3C+
         EBO6NX1I65tci3bZfJAn59EqMOZ3aUghgeQtMReo4IOqwmTw+3hi+lOIwgII+YuqkqER
         H0e3FWcYOdWCRZL+Hve/C0Zz8trK9EDitfhRoCx8A/qQlNkMpWW1fQY3X6u8M+BJbTrl
         3aSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=1aFoD9NLnkgELtDC6XBf2rb4o6xt4jtsjzDVmiFaWic=;
        b=AsALB+SekqnpQsxvZmSIY+Efv7xGLuDUczXAodRQtLtiyyomULnE+wzMBBS8ckJXDy
         +Zl0XZDMBxgS10XIZIwzBBgSynTJQChcdRdYEXimffgnBCKkQpnzBlGXxwxD6NkE/WYM
         ru2qBM5TU5ZwnVblJOqSL0yfbrvs/SccPokLiMFOoyQbouyaOAWEgsPnGoi/cr3Q68s9
         H5YlDiv5Cj+nAV8duE0XvSgtZbnQbx7XRk1IpsJ4lgC+jdtMQvuB4jtZD+/m1bTsh7td
         s3NZMocs1wR+zhI5eZ1dPe62urZBdmgwJIScBUrhg/5XMy7cLtqa38xlZYLWwIeEbAhA
         VPoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aenRYZgt;
       spf=neutral (google.com: 207.211.31.120 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id p62si13865561edb.9.2020.08.18.00.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 00:22:12 -0700 (PDT)
Received-SPF: neutral (google.com: 207.211.31.120 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aenRYZgt;
       spf=neutral (google.com: 207.211.31.120 is neither permitted nor denied by best guess record for domain of philmd@redhat.com) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597735331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=1aFoD9NLnkgELtDC6XBf2rb4o6xt4jtsjzDVmiFaWic=;
	b=aenRYZgtVV6zWN7nXF0fhOCr9idJfNqRdiV8nbkGBI3M7K7n7tSbif6LIUZdGTbev9LVXA
	WBmsQPVJTxMIUx6hYNPK6FQOL3m01BlEjCwlAAMt4f5DnWVdiLrI7MFK56q2lVENSog0H/
	2NO4ms3AmHjWHTChUCwwsy2MImlnuOg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-ilnrWPNPOVCvW3P89VcGGg-1; Tue, 18 Aug 2020 03:22:09 -0400
X-MC-Unique: ilnrWPNPOVCvW3P89VcGGg-1
Received: by mail-wr1-f70.google.com with SMTP id e14so7842567wrr.7
        for <alex.bennee@linaro.org>; Tue, 18 Aug 2020 00:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1aFoD9NLnkgELtDC6XBf2rb4o6xt4jtsjzDVmiFaWic=;
        b=o7WbmAZtuI9ItcLTL0HDCfibk+SAplA3xSpJRFW/KcPcSUOcR+YJmsIGlXrNGP6lS5
         T6q0GykuU2AQ1exTucpG2ubqTEEVeyfzNjIM3TGOok20/yz5R3EqU6eGa7HhAw6lpA4+
         Y0FPFQxu6HSKa8BGwiJMVqCUkW6EoBXEiJQ50l1SqsMWXLrNOl/Zjib72II/zjPmthI4
         6bcAi+lqQdvx2Ui5E0Dc+cVzW9MfQbXDTdhNDUVR82Da7DjDCw/1R1myHpPyljrYLLkw
         Xx8ckUAbp7XQHfL130SA19jBERndLEkPEES2ea9Wh/nIkiurn/kUl3xafiHa+80R41wC
         f09g==
X-Gm-Message-State: AOAM531s7OrT1YbTbVenaHXmz2P9ZiBUux7SzTnver4JBb/QxGXjpxiJ
	FfZTswkcaCK8ETU3SvTTlubbnxIaeRljvZrYWdz1xrtQoejn2QF/SuDB/QMRoXuBvZ9oVs2Uc8B
	XONf4UMu2s0sxBzia
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr18584257wml.126.1597735328300;
        Tue, 18 Aug 2020 00:22:08 -0700 (PDT)
X-Received: by 2002:a7b:c8da:: with SMTP id f26mr18584226wml.126.1597735328037;
        Tue, 18 Aug 2020 00:22:08 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net. [81.40.121.121])
        by smtp.gmail.com with ESMTPSA id n12sm35270545wrq.63.2020.08.18.00.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 00:22:07 -0700 (PDT)
Subject: Re: [PATCH v4 4/8] ppc/e500: Use start-powered-off CPUState property
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
 <20200818033323.336912-5-bauerman@linux.ibm.com>
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
Message-ID: <83c5045d-ee26-9433-46a3-4919bcea7cd3@redhat.com>
Date: Tue, 18 Aug 2020 09:22:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818033323.336912-5-bauerman@linux.ibm.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: OLPKEV0yDpkh

On 8/18/20 5:33 AM, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
> the start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
> 
> Also change creation of CPU object from cpu_create() to object_new() and
> qdev_realize() because cpu_create() realizes the CPU and it's not possible
> to set a property after the object is realized.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  hw/ppc/e500.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index ab9884e315..0077aca74d 100644
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
> @@ -864,8 +861,9 @@ void ppce500_init(MachineState *machine)
>          PowerPCCPU *cpu;
>          CPUState *cs;
>          qemu_irq *input;
> +        Error *err = NULL;
>  
> -        cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
> +        cpu = POWERPC_CPU(object_new(machine->cpu_type));
>          env = &cpu->env;
>          cs = CPU(cpu);
>  
> @@ -897,6 +895,19 @@ void ppce500_init(MachineState *machine)
>          } else {
>              /* Secondary CPUs */
>              qemu_register_reset(ppce500_cpu_reset_sec, cpu);
> +
> +            /*
> +             * Secondary CPU starts in halted state for now. Needs to change
> +             * when implementing non-kernel boot.
> +             */
> +            object_property_set_bool(OBJECT(cs), "start-powered-off", true,
> +                                     &error_abort);

[*]

> +        }
> +
> +        if (!qdev_realize(DEVICE(cs), NULL, &err)) {
> +            error_report_err(err);
> +            object_unref(OBJECT(cs));
> +            exit(EXIT_FAILURE);
>          }

The last 4 lines are equivalent to:

           qdev_realize(DEVICE(cs), NULL, &error_fatal)) {

This is also the preferred form, as we can not propagate errors
from the machine_init() handler.

Since you use &error_abort in [*], maybe you want to use it here too.

>      }
>  
> 
