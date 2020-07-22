Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp426992lfm;
        Wed, 22 Jul 2020 00:22:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZLO/zd+i8zbxsXn+8l4y3Qvm8aR6mqC2LKTQdfFxLfvdW8lK44tKTE00I5NI3J6FeKfh4
X-Received: by 2002:a25:abe3:: with SMTP id v90mr51848417ybi.36.1595402567553;
        Wed, 22 Jul 2020 00:22:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595402567; cv=none;
        d=google.com; s=arc-20160816;
        b=JP+mw/H5mhQGKLDLl8wtQitWsfn/kqY0LgD+lr12VhOr/JnAk5/wbfsptGGXfYNcK3
         LMpdKwsPsZEjCz6uL6Xm8tHh5TgXZsx7cj7A8cx/K8od2mKW6JLcPDnWuIwRUC88P+KA
         k8Plcm9eB5eB1pYUsFTg3yW0qWO7FVGPWDwSa46GrJi5UU3uRBhoMx+EqXL+VexhEJ71
         cuk+hBL/L0VQhtU9kxuvJGYNkHWZNdwU0x8Qjf1stntseQLJPsmBvkUVTzOmWfZY5zHx
         0MuJ98SH3NUdcv8SJnkM/EEt6SYeDDVTagYn5PcRDnEUHLnJC03uLA0NJWT1QryDZ9lT
         lfcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=Voy1Dk6k2QdCie982rx41zKGzP7KxX19Wo/i1Q/B+c8=;
        b=OJl9MEvYBB2LKjOQpny2md9Lyvi/E6ynajeQl1EhyPxe1uytOgzADLBZkobJivJHm9
         pVYp79T2CIgyCU4i2O5YCPr3khVRV5rl8P+y/ekWpSAAkKrCRy6Zc/btZ/AYVU5rGDat
         PzQ7GYyFuwr5ZugSToCgbhmFFIc1K1yrHaukmEte9FbAHCB5QwdTnkcVyZBIyR/PbDiC
         OdjM0b1FH67dEgmze3pX3Ju/mxq0NIfrpUuDymNT5FgFxSaCzPMGFOnA9uAKDqP0a2bT
         Qp2w3iJgJcj2tF6C8Ki92v2XL3mrdPV/Kcwuj75QV5xL070FlMHYz875Y6StNeNtqGcj
         N/Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fkHZ5UP1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si9733032ybj.112.2020.07.22.00.22.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jul 2020 00:22:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fkHZ5UP1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jy95S-00019u-Uu
	for alex.bennee@linaro.org; Wed, 22 Jul 2020 03:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jy95J-00016f-AG
 for qemu-arm@nongnu.org; Wed, 22 Jul 2020 03:22:37 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48222
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jy95G-0006Fn-KX
 for qemu-arm@nongnu.org; Wed, 22 Jul 2020 03:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595402553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Voy1Dk6k2QdCie982rx41zKGzP7KxX19Wo/i1Q/B+c8=;
 b=fkHZ5UP1EmTIC6KvznQsedccJYWQna3CEBT/PQykL9TUHYUSe1ixWtPXnAP8+ijI6IwU8g
 80C2vBVH8tlZYzkz7UWe4qaOcqv3vC11ZmP3P3Is/Y0UFARRd+ByZLp3E8moHywWrBGk7D
 Z7DiM0X60iLmzLMXz/mqjCgKLUqzaP0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-yihqgqSZOy6I5xv77KCY_w-1; Wed, 22 Jul 2020 03:22:32 -0400
X-MC-Unique: yihqgqSZOy6I5xv77KCY_w-1
Received: by mail-ej1-f70.google.com with SMTP id x15so631975ejj.23
 for <qemu-arm@nongnu.org>; Wed, 22 Jul 2020 00:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Voy1Dk6k2QdCie982rx41zKGzP7KxX19Wo/i1Q/B+c8=;
 b=W9X6N/ZRIBlX8U3A7bdsDwl4PJm8am09PX7AqPYjqvLDqxJ7vG43vHHucKhtV+ihdG
 u3X1XoyASj4AbyPYnmA5Z2ATODXcL+vj8+5TtfiFAJAcCdVfH/eKfHRBApRVGNh919Qp
 cmUnNEbVTwL3HnHWWo2y7hV0OLyO8setY5YUFN01ZdUPW8yerKk8t/rLqYC9PaMJCioe
 x7ntBDcw40PKtDV3UutuRpZNTv778gTqLh7Pj6J7RUWacvO6nDXcSSKe2JfXzz975XL6
 eZ9JmA22jNK8S2sSyNZKi7mZNT1p0OmvQ50dUEBZTxzlazyx12ZfwFk5fyw3OdAJRHO9
 ydDQ==
X-Gm-Message-State: AOAM533wO0wRLg+k5DmsluHofQFQpTx5G7ezEX8EYKK6RK0wWC1jpB8r
 55L8OgrMT3pdOYKcwLYsViqbDRAS89Z0bCnUVtKprAuVFJ7eWlLV8+rL+eBecQPTQHrJFt/F1QJ
 un2QlX+oOBxPj
X-Received: by 2002:aa7:da89:: with SMTP id q9mr29974288eds.273.1595402550768; 
 Wed, 22 Jul 2020 00:22:30 -0700 (PDT)
X-Received: by 2002:aa7:da89:: with SMTP id q9mr29974255eds.273.1595402550452; 
 Wed, 22 Jul 2020 00:22:30 -0700 (PDT)
Received: from [192.168.1.36] (138.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id c18sm18027177eja.59.2020.07.22.00.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 00:22:29 -0700 (PDT)
Subject: Re: [RFC PATCH v2 8/9] sparc/sun4m: Use one cpu_reset() function for
 main and secondary CPUs
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>, qemu-ppc@nongnu.org
References: <20200722035016.469075-1-bauerman@linux.ibm.com>
 <20200722035016.469075-9-bauerman@linux.ibm.com>
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
Message-ID: <21df06b3-725f-9bba-7e98-db8b74d97902@redhat.com>
Date: Wed, 22 Jul 2020 09:22:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200722035016.469075-9-bauerman@linux.ibm.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 23:34:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0lKveBRwpbMH

On 7/22/20 5:50 AM, Thiago Jung Bauermann wrote:
> If we rely on cpu_common_reset() setting CPUState::halted according to the
> start-powered-off property, both reset functions become equivalent and we
> can use only one.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  hw/sparc/sun4m.c | 21 ++++-----------------
>  1 file changed, 4 insertions(+), 17 deletions(-)
> 
> NB: I was only able to test that this patch builds. I wasn't able to
> run it.
> 
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 7b3042a801..deb5e9f027 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -218,16 +218,7 @@ static void dummy_cpu_set_irq(void *opaque, int irq, int level)
>  {
>  }
>  
> -static void main_cpu_reset(void *opaque)
> -{
> -    SPARCCPU *cpu = opaque;
> -    CPUState *cs = CPU(cpu);
> -
> -    cpu_reset(cs);
> -    cs->halted = 0;
> -}
> -
> -static void secondary_cpu_reset(void *opaque)
> +static void sun4m_cpu_reset(void *opaque)
>  {
>      SPARCCPU *cpu = opaque;
>      CPUState *cs = CPU(cpu);
> @@ -818,7 +809,6 @@ static const TypeInfo ram_info = {
>  static void cpu_devinit(const char *cpu_type, unsigned int id,
>                          uint64_t prom_addr, qemu_irq **cpu_irqs)
>  {
> -    CPUState *cs;
>      SPARCCPU *cpu;
>      CPUSPARCState *env;
>  
> @@ -826,12 +816,9 @@ static void cpu_devinit(const char *cpu_type, unsigned int id,
>      env = &cpu->env;
>  
>      cpu_sparc_set_id(env, id);
> -    if (id == 0) {
> -        qemu_register_reset(main_cpu_reset, cpu);

IMO it is easier to review this patch in 2, first drop main_cpu_reset
as it is pointless (we rely on cpu_common_reset), then set the
"start-powered-off" property and drop secondary_cpu_reset().

> -    } else {
> -        qemu_register_reset(secondary_cpu_reset, cpu);
> -        cs = CPU(cpu);
> -        object_property_set_bool(OBJECT(cs), "start-powered-off", true,
> +    qemu_register_reset(sun4m_cpu_reset, cpu);

Why do you still keep it?

> +    if (id != 0) {
> +        object_property_set_bool(OBJECT(cpu), "start-powered-off", true,
>                                   &error_abort);

At this point the CPU is realized, so this is correct.

I'd use directly:

       object_property_set_bool(OBJECT(cpu), "start-powered-off", !!id,
                                &error_abort);

>      }
>      *cpu_irqs = qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
> 

