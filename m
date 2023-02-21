Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3292615ejb;
        Tue, 21 Feb 2023 06:17:11 -0800 (PST)
X-Received: by 2002:a17:902:d506:b0:19a:7e36:f50a with SMTP id b6-20020a170902d50600b0019a7e36f50amr6479634plg.7.1676989031572;
        Tue, 21 Feb 2023 06:17:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676989031; cv=none;
        d=google.com; s=arc-20160816;
        b=Vr4tJP+De2XwTodRF+lDHPjW9YTaQYuMHRUYfxNgVpdDG2CcKjF5LG938nm2OeK//F
         jmXIJzae7N7NAYRk1tYM4iAb5IHCum5zEkl6mkyl8/TEyL5MmGBCaoPL1O6rpiWH5pZP
         diVQf2cXHYomVPP+lgHVBDYY4bu9ABcgRJvES0SiP+diycyaX98R9TVAi7NEYRgzDreo
         q1Ex7J1FS652uAiRjscLBfiMnjVwVEBekhNVFHx0CsloM2aONZ9PtzES8XN+Z51I2cIG
         6HcmNgEkD3sS5j0ORVWAxq/bC3g9gRCElqShb7mf19JQloma43r129mLHZsxeb9x6eS5
         zeXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eZaSr6p/WigV9S3zd4nAD9I7Yy+ujBKyZXaSjM8ooak=;
        b=cgNlMHg2jLgalpquIIOh1wQryVvGSzOR8jSIewJik4ux7Q9EL/Q3hz8JhQM1snXqW9
         sz+ck0bX5QlnaosaBAfo451E46yvTwAAAQiWoh1tZIJbvHma7CbjHbGBoWoZBPs23Toa
         dlXwacJauhnb+5u3ETRRkxof/E8SnAXwOjzC3IfVfpFJCi3QJoGLwoXoP+3JjBx6SDYx
         nap3fi7LKwHlJU7FqMmRHAhuYCOYKAtK3gDYfoy6PGTWm1fV8kgufjPzEi+BF/pLsku3
         /myrBldTR3e4YoRc0D0GGZa0/ZqM9lMVaT0HgwAmlXrAaEt9TUuE9Nq9lE0onoiyY68v
         96VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W12+tKs4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l12-20020a170903120c00b0019aa7cf68a8sor3166722plh.91.2023.02.21.06.17.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Feb 2023 06:17:11 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W12+tKs4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eZaSr6p/WigV9S3zd4nAD9I7Yy+ujBKyZXaSjM8ooak=;
        b=W12+tKs4T0WGCfMlgFz3dSzQNe3rySgr20kK9KX2+XTSXlRn1l6uZPLS3+5nBxM0o5
         SMiofaXsVbIi7mAYSAF6GUrYLqvSROg9daeQBc4YPZqi63L8CBBvnDYgMz4ZXVKgUwM0
         IS34kVPgsolDmTTDRyDoDBBTl1D7Boiri6X2vrWNYi8WN5Hd7KxpWv44FITn/PyHPsHI
         ArL6NtiBfM8p+Db67JXdo2GN5QPIg5REXiW3pyqcNHOf3u42hFKnKez5RxfCPYOqWKXK
         fOnMNXtn53KKU6nFWQ8NeVLvpaOTrQj8BsBi4npiV16T4fvjv1EWB8S7YlMVw8QnLUh9
         x8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZaSr6p/WigV9S3zd4nAD9I7Yy+ujBKyZXaSjM8ooak=;
        b=sbilH781HiM7oNm8mGLhHBu/P2xv2lCIhFrpRq42w6j+VhMDUtLas7tEqq/TesjUsD
         xEmaUEZ1JoCqO2GQfVmpcxz2Sgnx2nmR8zXKrUwcPUjDMN4qk7kOp+2Uj8+bxyWExDOs
         nWBpDpocT8EeZ3evykMdFOb7lGdCzW5w02qF3bmdnhM2N47x/TtYVwuAf8NzMczFQ8OO
         DU+DhEhYU9hgvwuwxinYoq0OTIO6PAG1ieC9DdoxOgDKwWD2xQK8y8qZaazDG8UpXBJ7
         oFH8MYk699htQZuhZ7OGbYDHrL/J7LkNLo/eGhqCdYSU1a2HUmPoyvSZjTnA8MsAtIfE
         WKwg==
X-Gm-Message-State: AO0yUKVkiSlRYeGKdHiUFqJ6sCJUhJ1YAkZgiNghr4QfPcAQXkuQ2lyR
	0KPfB/9PS3V51h1D/DKNxX5i4S9icIXmINOkkANJCHhN
X-Google-Smtp-Source: AK7set8VIGtnBrIYnrw0YIA+QaV0Lh45iuUK/mJru/tdVYAQjQY3OkGE4eJ93tzPaa1CA5AU1xhN6ASPJQqldG66nwQ=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1776771pjb.92.1676989031048; Tue, 21
 Feb 2023 06:17:11 -0800 (PST)
MIME-Version: 1.0
References: <20230217201150.22032-1-farosas@suse.de> <20230217201150.22032-20-farosas@suse.de>
In-Reply-To: <20230217201150.22032-20-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 14:16:59 +0000
Message-ID: <CAFEAcA__kyfbPv5tmSTiBJ_O15ND5-QpKpATx856s8XCoUNORw@mail.gmail.com>
Subject: Re: [PATCH v6 19/29] target/arm: Move 64-bit TCG CPUs into tcg/
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: yIA2QqAOD54S

On Fri, 17 Feb 2023 at 20:15, Fabiano Rosas <farosas@suse.de> wrote:
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
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> -/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
> - * otherwise, a CPU with as many features enabled as our emulation supports.
> - * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
> - * this only needs to handle 64 bits.
> - */
>  static void aarch64_max_initfn(Object *obj)
>  {
> -    ARMCPU *cpu = ARM_CPU(obj);
> -    uint64_t t;
> -    uint32_t u;
> -
>      if (kvm_enabled() || hvf_enabled()) {
>          /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
>          aarch64_host_initfn(obj);
>          return;
>      }
>
> +    if (tcg_enabled() || qtest_enabled()) {
> +        aarch64_a57_initfn(obj);
> +    }
> +



> +    if (tcg_enabled()) {
> +        aarch64_max_tcg_initfn(obj);
> +    }

Why do this only for TCG, and not qtest ?

>  }

thanks
-- PMM
