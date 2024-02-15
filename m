Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp652149ejb;
        Thu, 15 Feb 2024 07:46:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXxDfNfnww9bIz0npufN6ESRQW63HM8cZvexaXEgfKXxomyq3IJ+TtAioWsHyZOoDgcHXzjTibtvu1fz2MawV/Wemrgpfzu
X-Received: by 2002:a19:3814:0:b0:511:3a13:158 with SMTP id f20-20020a193814000000b005113a130158mr1311823lfa.35.1708011970290;
        Thu, 15 Feb 2024 07:46:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708011970; cv=none;
        d=google.com; s=arc-20160816;
        b=KYMQTBxjWIUm9Ktg1JsyZD+iB8ZOloDyBM6haPvIR2W+45WcODfMgU5mTdg7Sj619O
         bEYO83SQP7ZeAgkAirD4+Z3EIQvNKOhI081c9nofvmwBhG1mu5IA21cYw9/P14AUnEEc
         S8Fh23bompb+a0Rx4wgHlLlKxKh4G/K0nfo4NV47MfEEIynD/iPJ6goopTqfDmd5IGk9
         ABVvSjVvgKJT43jc9/gKH7tAtOyS3KHlu4q6lD9kOowoj9iCBmtmElAVvdMUp+RdW3jm
         R6nI8yDjos+3sRS2ZcFxzpUMwWNvZPHIaBf2908LG88HkoKZWTzRNoU/SZxkGfpJ5Ta6
         sT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4rBSgrX5YVivbEpiuFCj+73HjrmHSxalYOXOHIQ6N48=;
        fh=zgjKQyhMGkZRIlyatji/6o5c9egcjaqMhpKolCIqUsw=;
        b=HKffyjzECmIlmxbYBvcrQVUCR6LwQ9sgfTkecWb+c3bN/ewYFo4jEcqZ3iN9MOz2LJ
         tP7akPQgS7sNuBSZlXooGKf2kajoJ5lAEYtkDxt5zdSOfdXcAeQUon8o7w1QBCzmni1y
         Jpl7aWPvopR/pPIRV4zzqYuu5z2b5tYjnOdny28sOPGY2Osm3RqEdUYjqhgtk9Ou11uI
         rxDm4V1DHM+5N5JGu8qqcMYP5pMYlJgFNa+fZJPTHkkeYM10kb6Ltmpm860Imv6xfvUm
         6NKhbAUbYRQNusOxJYpcrWbrdPoBPzwDRbTJtHzgOdeezHP5uEf2WOVlCgPdef3uohtb
         lVMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nlD1HF9j;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y11-20020a19914b000000b005119d5420a9sor520216lfj.10.2024.02.15.07.46.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Feb 2024 07:46:10 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nlD1HF9j;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708011970; x=1708616770; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4rBSgrX5YVivbEpiuFCj+73HjrmHSxalYOXOHIQ6N48=;
        b=nlD1HF9jmsAG3ZkLOBpOndcrh7DDQh40zHTTzslbj0DGIC1gyDNJabuiAzYSNuEYat
         ni+7Gok7tMOn3LhIm7E/2i9wUpyoTeDxchuDF0TMe49bgwfiNW+HFCYn8FVFv42e5eDz
         5Ik5JAdgpgII1zFXVaTQQ64MhWMNpAUmfLBiw7ftF4as71s7MeKIihMHxTLR6EoVrRDj
         ufUwG3q0JPUZY1mU5OcOg+CqQ2lVP3oGZdD1eOrWCZxSVN5u6F/2vDhL3qTai6Tm4DIc
         i3KdxTuVENvTExAuX/f1a7HkJX223i1+pxRErb8/UkJwxv50xVNMZmV7Rj5e3ClltrAV
         R6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708011970; x=1708616770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rBSgrX5YVivbEpiuFCj+73HjrmHSxalYOXOHIQ6N48=;
        b=ucDLdPFTG+goq8/v5bA8MRzoGoG1DltYn9eKVfhkhWEe6UX97SC3sbvXEz4WkffsE+
         DQ0Rr7ylf17tsvKup9+Ec0Xy4PEfoxwnagAMgs4tP3Lk/USVIUn7jZ015De2r/kEbyT8
         jgoVemm489x7fMfpzf+tg9Mtn3JTvAZpbxTbe1+vFUBxZdZpqYfurIjmr+S/JQeOpkcl
         8gUCJQVG4CSTgfDx6muLDtWhctzik3F0O0TV243YNcTsobypDoJSeHNnynUAE44Mx6dM
         XwzSEYZ3Sp3SiqvGyyqQUaQOXzVIHcwsT0L8au1K967dNLwbaGDOO+j4MqEz7FWWu/rd
         QH4w==
X-Forwarded-Encrypted: i=1; AJvYcCX+gJcjEgtinvBYJpnRb+ecENW+p/P4VPEsTlmVZ+9z2pre7npYI5w0U47A0Jm61+nTjQsnagVRem2Ta5dBawIGn4lPOzzz
X-Gm-Message-State: AOJu0Yz87HBNctQ9Z0qtqzrJxZjEeAFlnMIotr+i9y1Xhs4CSpJLu3L9
	GRo8cjRxQpHNrCCpI+ZpoxQZZzaBGjXMmN0mFh4tYQzWo6qiyEXdTGUUUBaT0RPapBrTkNCSbSi
	pTWdyUTYZt3ZbPzYP0YeGXVEaX+rD9+VSx9jc/dH4
X-Google-Smtp-Source: AGHT+IERVKkfp9+r3RR8EamMBaAVeDZmMBnIM3VV1wDnqIAEzDXRbv0S+MnmCkslT/Ub4r1yMGquQcLzMR7LQ3JKSSc=
X-Received: by 2002:ac2:5333:0:b0:511:4e6a:12e7 with SMTP id
 f19-20020ac25333000000b005114e6a12e7mr1675056lfh.58.1708011969851; Thu, 15
 Feb 2024 07:46:09 -0800 (PST)
MIME-Version: 1.0
References: <20240215151804.2426-1-Jonathan.Cameron@huawei.com> <20240215151804.2426-2-Jonathan.Cameron@huawei.com>
In-Reply-To: <20240215151804.2426-2-Jonathan.Cameron@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Feb 2024 15:45:58 +0000
Message-ID: <CAFEAcA8YgJ-m6D6QZFsGCw9H0orF=DHKgs8t8Vaz=502+eXdcw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] arm/ptw: Handle atomic updates of page tables
 entries in MMIO during PTW.
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Gregory Price <gregory.price@memverge.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	richard.henderson@linaro.org, linux-cxl@vger.kernel.org, qemu-arm@nongnu.org, 
	linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: LyF8cXMq2BsS

On Thu, 15 Feb 2024 at 15:18, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
>
> I'm far from confident this handling here is correct. Hence
> RFC.  In particular not sure on what locks I should hold for this
> to be even moderately safe.

> The function already appears to be inconsistent in what it returns
> as the CONFIG_ATOMIC64 block returns the endian converted 'eventual'
> value of the cmpxchg whereas the TCG_OVERSIZED_GUEST case returns
> the previous value.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  target/arm/ptw.c | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 5eb3577bcd..37ddb4a4db 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -711,8 +711,38 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
>      void *host = ptw->out_host;
>
>      if (unlikely(!host)) {
> -        fi->type = ARMFault_UnsuppAtomicUpdate;
> -        return 0;
> +        /* Can I do a load and store via the physical address */
> +
> +        bool locked = bql_locked();
> +        if (!locked) {
> +            bql_lock();
> +        }
> +        /* Page table in MMIO Memory Region */
> +        if (ptw->out_be) {
> +            old_val = cpu_to_be64(old_val);
> +            new_val = cpu_to_be64(new_val);
> +            cpu_physical_memory_read(ptw->out_phys, &cur_val, 8);

This is definitely wrong because it takes no account of
address spaces. You need to also account for ptw->out_space.
Compare what arm_ldq_ptw() does.

> +            if (cur_val == old_val) {
> +                cpu_physical_memory_write(ptw->out_phys, &new_val, 8);
> +                cur_val = be64_to_cpu(new_val);
> +            } else {
> +                cur_val = be64_to_cpu(cur_val);
> +            }
> +        } else {
> +            old_val = cpu_to_le64(old_val);
> +            new_val = cpu_to_le64(new_val);
> +            cpu_physical_memory_read(ptw->out_phys, &cur_val, 8);
> +            if (cur_val == old_val) {
> +                cpu_physical_memory_write(ptw->out_phys, &new_val, 8);
> +                cur_val = le64_to_cpu(new_val);
> +            } else {
> +                cur_val = le64_to_cpu(cur_val);
> +            }
> +        }
> +        if (!locked) {
> +            bql_unlock();
> +        }
> +        return cur_val;
>      }


thanks
-- PMM
