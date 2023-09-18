Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3032077ejb;
        Mon, 18 Sep 2023 09:34:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4e+ipN+qtyi014QrnKPhLswecrCdYHYle+oI4ZLhdRC9j7BVztMsKVwP8CYDmdX+YxL37
X-Received: by 2002:a05:620a:25ce:b0:773:a83f:413c with SMTP id y14-20020a05620a25ce00b00773a83f413cmr10460815qko.30.1695054855585;
        Mon, 18 Sep 2023 09:34:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695054855; cv=none;
        d=google.com; s=arc-20160816;
        b=ViV+ywC/OWZA92ZaARicqENEg4CqnBn4Cq+vwuZN4+NUEuPDemnL0Wi/2KCf4zIwAh
         A6UmFk+i9WS0L1qSUTlBGtqKO5ZSJkxyGM3WHilN0PconDBV/m0Np5TBRJDJ9lil+MiY
         rxeBZoIV0uJKKK3OUYGBkMuD3sA1Q5QakgNoE66kWoMcvxDhIzPXrOzIIqKNIgbuiFmk
         Sit27yRs2QwwjMLFzz5ejdtI1PuSFXnEm7xbJpuwNbEVc6vhTHs4U+rJBqz6uicHjKt0
         1+FMuwMz7TifiYhs5sexpJvNf8lG8sCveEjyZV08xiswO3PU9RFYU+dewgUsojeGSUk2
         vaWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:organization
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Yqit+L1v57rv4S72epM2gx/7IZWiOioPzhQAQ8pbRdo=;
        fh=lt3flTNDj3zyWt5/rmXR4CRASf6xjOSLbw4bUjk+zac=;
        b=LSUDj6hN0TmDzoC6Ytt9yTh9CfqU9hLXula3KTL3kKy8xT7AZj9PdptuidYmdRMETp
         YwLIevM5J1jmcig+z/rXLjdj2C4nshyCkCDZz1DqF0puvirAUlWQ/vN9bD9akwEyoDxa
         oeU9YwnY9MqaLnsmH8a6eYzvVrGqBhawdzftq84dHHltUUNBUUBnEk6mIKM1RzzOmIA7
         S13LoI6dv//jDxRK7QUtpDsg3MDAJAoTnU4E1OLfkL9uKvINiO5NocLKduJWhSUpzQKA
         rN9Cs1u3CvWKU1UhwCVxdi3qdvfFHhmp2+7UPPM8HZ2y2tYGWkhklEcCtXUAokKAmNnn
         UeeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=abgcl5YE;
       spf=pass (google.com: domain of david@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <david@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id qt3-20020a05620a8a0300b0076cddf925a6si6154084qkn.405.2023.09.18.09.34.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 09:34:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of david@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=abgcl5YE;
       spf=pass (google.com: domain of david@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695054855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yqit+L1v57rv4S72epM2gx/7IZWiOioPzhQAQ8pbRdo=;
	b=abgcl5YEDK7eAL3YPUawrWSSVVIdqEZcJl0kPBqMu6yC37DoFZqx331gSfEqtVJ1atL6Bg
	peCYBUSNCSojhTHpQWpFbW2f1m4Ofa4RPXzX333T73aun0Fmnz4XT+xFzSpq3OW9g9EcnL
	bjW3XHQ6AIpO+EkOxPD8TFrjSv8vkEU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-GMAHAMb8O76VYiqOgVC9sw-1; Mon, 18 Sep 2023 12:34:13 -0400
X-MC-Unique: GMAHAMb8O76VYiqOgVC9sw-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4043bc7c6c3so34824785e9.0
        for <alex.bennee@linaro.org>; Mon, 18 Sep 2023 09:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695054851; x=1695659651;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yqit+L1v57rv4S72epM2gx/7IZWiOioPzhQAQ8pbRdo=;
        b=CCRJ4cur1FMmvNEgtPoR3WPUWLqzs3SYbK8x9ojjGAyqttJ1IM92mmBT3g9/uMDZ/O
         jG1B7PTcRDIED8k/yWpXXH4ucAvCWl7kWY7p2AQMSB8DH16tWuwqnX4HneV3dPf0kXpR
         UfGeXIIdkFrI5fgP+xvIbuerzBJnN2SjHMH18Z8WzxV31lrJF+ZrSmYdAtbhlXyEGTg4
         tf/4tJCiZfi3XYn0LgC4kSXDTjgASW1wMmDuCfy/58ZcqOp+DtQFAsmcn+uZMzGVjwom
         2SVt2hfiM4nAgcIAY3gVcN9WDqqb+b0vQ89ABN5nkSSGRM0EnJ42dh/itgDCvxfmEHzM
         c8iw==
X-Gm-Message-State: AOJu0YwYfJY6YzBsboL2wsJQhBW8qU8XPglxujMefe8vso/cHjwAyNUF
	fR78IObz/NXAnynqzqbkDYbqRWFgY70liV8W78UNq5eI6+RN3HM1E2IUFRLoOOEXqs511a9+9HA
	Uhz3y39UvY6ZxPVle
X-Received: by 2002:a5d:5a15:0:b0:31f:f432:b541 with SMTP id bq21-20020a5d5a15000000b0031ff432b541mr11161269wrb.69.1695054851570;
        Mon, 18 Sep 2023 09:34:11 -0700 (PDT)
X-Received: by 2002:a5d:5a15:0:b0:31f:f432:b541 with SMTP id bq21-20020a5d5a15000000b0031ff432b541mr11161214wrb.69.1695054851162;
        Mon, 18 Sep 2023 09:34:11 -0700 (PDT)
Return-Path: <david@redhat.com>
Received: from ?IPV6:2003:cb:c702:9d00:cf36:8603:a1f5:d07? (p200300cbc7029d00cf368603a1f50d07.dip0.t-ipconnect.de. [2003:cb:c702:9d00:cf36:8603:a1f5:d07])
        by smtp.gmail.com with ESMTPSA id o12-20020adfeacc000000b003176c6e87b1sm4242342wrn.81.2023.09.18.09.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 09:34:10 -0700 (PDT)
Message-ID: <7bc15c25-2147-409b-0cf7-e3f1b56d5283@redhat.com>
Date: Mon, 18 Sep 2023 18:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 18/22] target/s390x: Call s390_cpu_realize_sysemu from
 s390_realize_cpu_model
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Peter Xu <peterx@redhat.com>,
 Anton Johansson <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, Marek Vasut <marex@denx.de>,
 David Gibson <david@gibson.dropbear.id.au>, Brian Cain <bcain@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Claudio Fontana <cfontana@suse.de>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Alessandro Di Federico <ale@rev.ng>, Song Gao <gaosong@loongson.cn>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Fabiano Rosas <farosas@suse.de>,
 qemu-s390x@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Luc Michel <luc@lmichel.fr>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Bin Meng <bin.meng@windriver.com>, Stafford Horne <shorne@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Greg Kurz <groug@kaod.org>,
 Michael Rolnik <mrolnik@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20230918160257.30127-1-philmd@linaro.org>
 <20230918160257.30127-19-philmd@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230918160257.30127-19-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: g0XoiLwkuexq

On 18.09.23 18:02, Philippe Mathieu-Daudé wrote:
> s390_cpu_realize_sysemu() runs some checks for the TCG accelerator,
> previous to creating the vCPU. s390_realize_cpu_model() also does
> run some checks for KVM.
> Move the sysemu call to s390_realize_cpu_model(). Having a single
> call before cpu_exec_realizefn() will allow us to factor a
> verify_accel_features() handler out in a pair of commits.
> 
> Directly pass a S390CPU* to s390_cpu_realize_sysemu() to simplify.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/s390x/s390x-internal.h | 2 +-
>   target/s390x/cpu-sysemu.c     | 3 +--
>   target/s390x/cpu.c            | 6 ------
>   target/s390x/cpu_models.c     | 4 ++++
>   4 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
> index 825252d728..781ac08458 100644
> --- a/target/s390x/s390x-internal.h
> +++ b/target/s390x/s390x-internal.h
> @@ -241,7 +241,7 @@ uint32_t calc_cc(CPUS390XState *env, uint32_t cc_op, uint64_t src, uint64_t dst,
>   unsigned int s390_cpu_halt(S390CPU *cpu);
>   void s390_cpu_unhalt(S390CPU *cpu);
>   void s390_cpu_init_sysemu(Object *obj);
> -bool s390_cpu_realize_sysemu(DeviceState *dev, Error **errp);
> +bool s390_cpu_realize_sysemu(S390CPU *cpu, Error **errp);
>   void s390_cpu_finalize(Object *obj);
>   void s390_cpu_class_init_sysemu(CPUClass *cc);
>   void s390_cpu_machine_reset_cb(void *opaque);
> diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
> index 8112561e5e..5178736c46 100644
> --- a/target/s390x/cpu-sysemu.c
> +++ b/target/s390x/cpu-sysemu.c
> @@ -122,9 +122,8 @@ void s390_cpu_init_sysemu(Object *obj)
>       s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
>   }
>   
> -bool s390_cpu_realize_sysemu(DeviceState *dev, Error **errp)
> +bool s390_cpu_realize_sysemu(S390CPU *cpu, Error **errp)
>   {
> -    S390CPU *cpu = S390_CPU(dev);
>       MachineState *ms = MACHINE(qdev_get_machine());
>       unsigned int max_cpus = ms->smp.max_cpus;
>   
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 416ac6c4e0..7257d4bc19 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -237,12 +237,6 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
>           goto out;
>       }
>   
> -#if !defined(CONFIG_USER_ONLY)
> -    if (!s390_cpu_realize_sysemu(dev, &err)) {
> -        goto out;
> -    }
> -#endif
> -
>       cpu_exec_realizefn(cs, &err);
>       if (err != NULL) {
>           goto out;
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index 98f14c09c2..f030be0d55 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -612,6 +612,10 @@ void s390_realize_cpu_model(CPUState *cs, Error **errp)
>           cpu->env.cpuid = deposit64(cpu->env.cpuid, CPU_PHYS_ADDR_SHIFT,
>                                      CPU_PHYS_ADDR_BITS, cpu->env.core_id);
>       }
> +
> +    if (!s390_cpu_realize_sysemu(cpu, &err)) {
> +        return;
> +    }
>   #endif
>   }
>   

That has nothing to do with CPU models and is, therefore, completely 
misplaced ... :/

Or what am I missing?

-- 
Cheers,

David / dhildenb
