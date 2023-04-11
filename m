Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp501484ejc;
        Tue, 11 Apr 2023 06:26:04 -0700 (PDT)
X-Received: by 2002:a17:906:b0d:b0:94d:7e31:e338 with SMTP id u13-20020a1709060b0d00b0094d7e31e338mr4163782ejg.52.1681219564609;
        Tue, 11 Apr 2023 06:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681219564; cv=none;
        d=google.com; s=arc-20160816;
        b=lZ+PRatRfCl9O20i1nTRjWa2ljYIfPnLm0zuhDPpmhxOHjSwbmu20seimqbIgG9VLi
         tQDsUp0Ohd90gRdbrOJHKOlZPvh4SnRZiQcrmE99f0vulcxo98IkpM9L266RJeRMn+hF
         mHabyOkTMokoDnz5ocw6QYJ1C6QIhd86nyH5IFu30y0jMCLAbCUOtKwPiU7ChuMyRnrv
         Fu1/MnjOYYfQ85tQ09Y8SzAGIJLVU2h7jecdSIf3xIV9VE67T+cOuAf6K2vkw32De6sl
         WgqMXTr1i3GDyepXzH4yrXY/ybV/Y/Q4ckMMUoYSw9ni2kcTIOpIM0XURZwcSVXTo+kw
         PUXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wb+YGnaty5DSULxlmHSvvk1kuuAwAtd6fHRNzAXCewU=;
        b=p6ISgJLXZ3/QFWfGpQzhjFVMSaTmvnDz6urnyts4uKxoukBrlF7vykHzJtCOP9EVIJ
         EvCePlZ956Z2TkvhH3GnkrlpgNBTuiWqc2SWGZ3bZ6UnJi4uLQiAZPTesauztxRQahtg
         ekVXBmAxfT47TmLs3zJpEJDatYfVbj69J93JI06dkUnAmt9O8JbUrvrBT9dz7QrbjwFK
         5qIjeFNG7R9hJfcR6wO6A3c5enPTW+suflVSEm9HrK1CE8pXbHj8xppqnLesw7CYjDJ4
         Vuwu9vRMnaq144jdUcD4hAW3Ekwt+Ja/OSqWGISA9cF9Iz5yspuFabuu7J4HC2fmy5fC
         OJ1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b1fNiV6p;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z12-20020a1709063acc00b00930f45a51d5sor7077118ejd.30.2023.04.11.06.26.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Apr 2023 06:26:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b1fNiV6p;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681219564; x=1683811564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wb+YGnaty5DSULxlmHSvvk1kuuAwAtd6fHRNzAXCewU=;
        b=b1fNiV6p8A1UIksyvjDbduLrsmFgwPyCtNDQDQMtCcQ/eIk+ZMOj4rUSEihmMH5c4u
         wPFn7lfsg52k8C0RNA/i/mwgAUV9O4sB8zKHa4gyIzUacUiaQUlEwTbtdgjlOp9i2Htp
         hOzc9MzCQLxb5r6h8j5FUuvXAFsPg2+qn5Fri+W52xjGjQVkdnjXbAPV5N/rh7RPpuHp
         aPhspcfToHeU4a5UBbVgeqYKWRUrGZvw0d8p8DOirXoLxB/sU4UMNKLN3aV9nZOipkfr
         YlE14UAihXc1VrJYOWRDsnEqQh1KldR0qVdGFp6cHb1mGIP6MswaxhHPrR8aB4w/dkYJ
         tcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681219564; x=1683811564;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wb+YGnaty5DSULxlmHSvvk1kuuAwAtd6fHRNzAXCewU=;
        b=SspoZQdb2eBueq1skkZxyJsodZhGHNl0sqdBHb1UwGI4fiPdkHicuxu8AG+DHIkseP
         5mrvGrOUxDLUdrUyVYxZBCJMdcL2eVZ+R4rHYuxCbkYDrwC4V02hwQjnRuDXBksFO7/r
         YYpRGgumHNXzKiihZmKuKj/TcgIm5YM7SCI14gPsFN0o6hVzt6WVAAR7YNP9MfhW9cFS
         S4gNQ2qOYfu384FaOD/v0FNT6+AJJKo+qiBM7FRutl7F73/v25Yu7AY7Nfk9x8ukSLt5
         ZKoWWKBnNynxymmkEJIRmPWkfSw26FP+Z5A/gWRME/afKVmxZzOFXdzvkUP0PVjYT/VX
         44MQ==
X-Gm-Message-State: AAQBX9f7Yu7dTghIu5dwAPm4ke5xNQSzdj4EC28iJAtS+7B+nlDF9vZL
	1yH9y3h2kMR5vloSclV4GUpD6jNWxk+DWZNuXBl4TLZ7
X-Google-Smtp-Source: AKy350Yab4gFZbvF0sEUpkqTJKkwjUrwd65/sLjn/XKHk8Q/xY++i0/Kl1CrlZo3SgVBe8WAW6i/dIUeiccAO6BIKPI=
X-Received: by 2002:a17:907:a094:b0:947:f389:58ca with SMTP id
 hu20-20020a170907a09400b00947f38958camr5735398ejc.2.1681219564277; Tue, 11
 Apr 2023 06:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230313151058.19645-1-farosas@suse.de> <20230313151058.19645-3-farosas@suse.de>
In-Reply-To: <20230313151058.19645-3-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 14:25:53 +0100
Message-ID: <CAFEAcA8KapG3-PdoNO+mPdWrbokJ8oWR8J2ZOZzh=Pi65PZ52Q@mail.gmail.com>
Subject: Re: [PATCH v9 02/10] target/arm: Move 64-bit TCG CPUs into tcg/
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: zLRArhBPePa0

On Mon, 13 Mar 2023 at 15:11, Fabiano Rosas <farosas@suse.de> wrote:
>
> Move the 64-bit CPUs that are TCG-only:
> - cortex-a35
> - cortex-a55
> - cortex-a72
> - cortex-a76
> - a64fx
> - neoverse-n1
>
> Keep the CPUs that can be used with KVM:
> - cortex-a57
> - cortex-a53
> - max
> - host
>
> For the special case "max" CPU, there's a nuance that while KVM/HVF
> use the "host" model instead, we still cannot move all of the TCG code
> into the tcg directory because the qtests might reach the !kvm && !hvf
> branch. Keep the cortex_a57_initfn() call to cover that scenario.

> -static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
> -                                   void *opaque, Error **errp)
> -{
> -    ARMCPU *cpu = ARM_CPU(obj);
> -    uint32_t max_vq;
> -
> -    if (!visit_type_uint32(v, name, &max_vq, errp)) {
> -        return;
> -    }
> -
> -    if (kvm_enabled() && !kvm_arm_sve_supported()) {
> -        error_setg(errp, "cannot set sve-max-vq");
> -        error_append_hint(errp, "SVE not supported by KVM on this host\n");
> -        return;
> -    }
> -
> -    if (max_vq == 0 || max_vq > ARM_MAX_VQ) {
> -        error_setg(errp, "unsupported SVE vector length");
> -        error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
> -                          ARM_MAX_VQ);
> -        return;
> -    }
> -
> -    cpu->sve_max_vq = max_vq;
> -}

The deleted code has 3 if() conditions...

> +static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    uint32_t max_vq;
> +
> +    if (!visit_type_uint32(v, name, &max_vq, errp)) {
> +        return;
> +    }
> +
> +    if (max_vq == 0 || max_vq > ARM_MAX_VQ) {
> +        error_setg(errp, "unsupported SVE vector length");
> +        error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
> +                          ARM_MAX_VQ);
> +        return;
> +    }
> +
> +    cpu->sve_max_vq = max_vq;
> +}

...but the version of the function moved into the new file
has only 2. What's going on here?

Anyway, this fails to apply to current head of git.
I had a go at trying to sort it out but gave up when I
found this place where what looks like it's basically
just a "move code around" patch is actually also making
code changes.

Please can you rebase your series and rearrange it so
you aren't making code changes in the middle of
+700-700 patches?

thanks
-- PMM
