Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp2200806ocs;
        Mon, 26 Sep 2022 07:10:49 -0700 (PDT)
X-Received: by 2002:a17:907:6285:b0:781:cdfe:a1e with SMTP id nd5-20020a170907628500b00781cdfe0a1emr18302819ejc.158.1664201449238;
        Mon, 26 Sep 2022 07:10:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664201449; cv=none;
        d=google.com; s=arc-20160816;
        b=sBcFQnrSFNYzI6BUsim48R+VhONvspYLjmG7g+fVXswPWY1gZ/4loSOkG6FzflraeY
         0m9xw88HBonmTkB+8i9wR+k6Ikg79a3zP4QaoiThzPIhk//vAi0e5c1jLwv+LnvpusCc
         0t00dgwd4kyh56VViISiYsS1HDbRaLEZiofnung1KTEsGhjlycstvlFaGshjJj6F/ctM
         qWZf+X9DTfUvlmKtOK5QSyxW7GTmaTbZZMsSQqc2XhqT+LM+zA6ylOj2HsiF7/E2EsAs
         jiuzfsXr94b0pKYfv5WEamgi5vrXi7ont49Km5VhPYS9qrn2nZ8ZTNNuqttlugG3GT1v
         oRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tD+pb9b1e03R7duXlSF9Sq2SFAGrj/kZQapwl9bhPbY=;
        b=xVZQbvn92qFU/3SHmz+hivoDY2IrYyFjuAwHOht81bHN0QF6Q7k6dd8dDjpUL01R8C
         pEfBhHFw/C0I/EID57+7Qly+F7ABEhwf1mJEEBpXYvCrhtyon08ea093oBV5gGDL3M8H
         pq6I1WuAsCIJ66wVgQY7yyVnQyUgWICoNRlYUNo5F2G1qxOVzm72bO2Ly6GxHNqZKK2L
         IMG7k5DLXg0+o2EzVsZ4uv6vOsGGtOpFPWonmrxzECGajzFTzgZUNl/nFq9v6Jw63QzU
         vErcJ/RSUUccZlXcp8Wj9xP1pPuxHLB3IAEyiRTaXC1x3c/fY5XUHKbXi7xpfOu9yfs4
         jJRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YQAMU6O4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g15-20020a170906520f00b00773d6ce75eesor6471480ejm.26.2022.09.26.07.10.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 26 Sep 2022 07:10:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YQAMU6O4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=tD+pb9b1e03R7duXlSF9Sq2SFAGrj/kZQapwl9bhPbY=;
        b=YQAMU6O4yG3uXnzg7/dEBxzISe8BRPihdkfpRYERtz4Llj41U3VezrIR/Jdwm393ZN
         TtcEPb97M62qLFSkccjMZUaoyu7CY4z9hTKWUAWdJZ1xXxuweF8sta3cSab60It15aDo
         9kxPisIFInG3gi+4SdVFkkkoamXA1HakGAqUejidajzvV61uoO6a4IQ6/0R/fzPvT30a
         PkP5g49bqlESNYZbZ3TENPsPqafCCmBJC5o8bJTSvE/5s8rD/BHA8YLAruM+RvrBhyev
         B01wca9NtGdKEmMu4Lw1awjEi7HAkH1KlpOdglYrvRZZsufyPRfJeca+UgoCgQrGdo1J
         BEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tD+pb9b1e03R7duXlSF9Sq2SFAGrj/kZQapwl9bhPbY=;
        b=P18RQTXbOAbjqtx4kXsAfExf594GdSirS9ZMYcaegdk8sj8W9RmY07QnLJqusk93bQ
         pOmaa7cMWRcVimu32ChtbstolTFhgqjJlr8XOt4CmWbtlBrlei1HLoyE99GzX7CFN8hf
         kQEExKcApajDodQI3/EjRXscNj2MTCgher10J1O+0ym+vylstiE5w8U/oWY1G4u6rgG5
         A8ySZIzVyWhREBimCPuDHeJyyL+z3HL4yUJXyrRjxfKFg0qGY+KfuMINXcbqBVd1mAg2
         lPiAorgbNJw61vduUhfmvM0wtb1NgJSBogDWRQp3XhCVHdCqiO+65B5x/9rFcteLAzoS
         zpHA==
X-Gm-Message-State: ACrzQf2K7WwXrgPpXGWiifT7u/RqsyGNRjQXt8NjUULx8cQvenNi5He+
	WqcmlPXzOKQkqi7Sic4SbLQRe55fkUhPCyWrdw5xBg83nrBXWA==
X-Google-Smtp-Source: AMsMyM7yt43Gic4fd2TlqpqwlXpXkBtQHN1hm7EnIz8JBf7LEmcdxWKMAcoMxvP0TXJ8cIyLS4wQddd/1xDFe9Rdfig=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr17810672ejb.609.1664201448864; Mon, 26
 Sep 2022 07:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org> <20220926133904.3297263-4-alex.bennee@linaro.org>
In-Reply-To: <20220926133904.3297263-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 15:10:37 +0100
Message-ID: <CAFEAcA9OF4DOvYcfLJ6msAVNe9t_Ufxu9gHWUiuZFj-9qq9epQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] target/arm: ensure HVF traps set appropriate MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
	qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: tjJkGEcvOX3Y

On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> As most HVF devices are done purely in software we need to make sure
> we properly encode the source CPU in MemTxAttrs. This will allow the
> device emulations to use those attributes rather than relying on
> current_cpu (although current_cpu will still be correct in this case).
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Mads Ynddal <mads@ynddal.dk>
> Cc: Alexander Graf <agraf@csgraf.de>
> ---
>  target/arm/hvf/hvf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 060aa0ccf4..13b7971560 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1233,11 +1233,11 @@ int hvf_vcpu_exec(CPUState *cpu)
>              val =3D hvf_get_reg(cpu, srt);
>              address_space_write(&address_space_memory,
>                                  hvf_exit->exception.physical_address,
> -                                MEMTXATTRS_UNSPECIFIED, &val, len);
> +                                MEMTXATTRS_CPU(cpu->cpu_index), &val, le=
n);
>          } else {
>              address_space_read(&address_space_memory,
>                                 hvf_exit->exception.physical_address,
> -                               MEMTXATTRS_UNSPECIFIED, &val, len);
> +                               MEMTXATTRS_CPU(cpu->cpu_index), &val, len=
);
>              hvf_set_reg(cpu, srt, val);
>          }

Don't we need a similar thing for KVM ? (In that case it's in
the generic code in accel/kvm/kvm-all.c, for the KVM_EXIT_MMIO
handling.)

-- PMM
