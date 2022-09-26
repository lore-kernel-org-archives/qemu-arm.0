Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp2201941ocs;
        Mon, 26 Sep 2022 07:12:19 -0700 (PDT)
X-Received: by 2002:a17:907:2c4b:b0:77e:2c09:4111 with SMTP id hf11-20020a1709072c4b00b0077e2c094111mr19199434ejc.21.1664201539485;
        Mon, 26 Sep 2022 07:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664201539; cv=none;
        d=google.com; s=arc-20160816;
        b=GB/bpBbar8Ac7tWRFKfa/fB1m0vrULBWSIWcgjGl7sWPApmqZtdJYVUmIgq6i2PCJG
         PewDgsVLQUlYSnw8Vr8o/gvfedxRoToHMkM+IQpRBYcW357CYnE5FhoVKcojaGwz6p/e
         sFr9rurQDNxNzwYqFZsMqVkkskmk13Ut771aBZy2rGukrfW8X8Fd8g9dXyDMBu5JgF+S
         GVFTQCsCAN5mZUKPLfIF/jkzmzmyCWbft5Syun1jrOR/uTytcI+IuBLspy9PP3Z8dgKe
         SwijA7Djk/aRnhM5Vo7chltTqd8M4TI1UXNBG7e3jlomnw1rL4Y56JHuA5xwDuwtKTsy
         oMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CaidAlZg7Soxbuuw8bz/PaW5WGaWf4hBqsAlpPWMAgw=;
        b=0sxL4KUnm4RHQ0EgMrYz5IFqHfAKvc3wqOBh5VVeHeVJnmJmL9MhK4se6hvEOrfcdO
         Chq93pu1FVe0jwT1rHtspjWbbKAesN0I/0ZL+C67ij8C/r6PIlfT/9MY4nwDQOERPCcU
         rW1hUCtgwJ/CuJi7kosCLwTyluM66X9UO01kh79DQbsPJQWtK7UrWCafg+U++NqBJQfv
         6AGWzPRkm+m2bV0Ri8eZ36kcI2tV/J84AJMPRJ+N+SEaG7uatDM7Vxjl8WClCKHbtIEA
         mrW5PQQHoW8PzBqc96yxb7OElNu7miny036NmuVztI9WdtOAkwh5LSMXVpUpok4miEqq
         emUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U5+CH5pC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y6-20020a170906524600b0077b77760f91sor1667122ejm.106.2022.09.26.07.12.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 26 Sep 2022 07:12:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U5+CH5pC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=CaidAlZg7Soxbuuw8bz/PaW5WGaWf4hBqsAlpPWMAgw=;
        b=U5+CH5pCxU/6zO47d3U4bxBT5yzU6XpTnlFNYa2qXI4T4zNuHSJyb9gjLDN/2Ejj2p
         yWgBW8JHPHn+us3lP+1O2jcV2hrIIEKfAEyXreHDzFIca3pbJQwL+I2OssikSMQ1xucH
         UVUaJNJYiYPLEPJTUJqfb2RYVY97agH+VkuS5YrxeE/2IIs/DeVs9Yf/0ptTdjGOs1xg
         RLphL/mofhhG+Fyz+KaiqQbfuxoo7X/SUPaOJeale5yguyvR8DvmY4AqbP/FxKuUrXim
         njS3m57Wn0gJ7gM+vdFW7odms9FT/n2DxN7VeOPgHZ5zns55ChsgcTN+C4NOHkWzjJRU
         6UNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CaidAlZg7Soxbuuw8bz/PaW5WGaWf4hBqsAlpPWMAgw=;
        b=aCzPZgTJ6LmSL5uahiOkWXCJp8CNCQ7j2tzhDcHD5AYznPK6CwskSx8wZWjVMzGRbL
         36WXo5nzheK9zTXzY1oBHj0vUivK4Y8xntLkxPwAX7DPvFEwk5KE8pBPWazzusVJGdIJ
         AAakgTcr7kyZ4FyAuBDb2Y2mA+N94vP38WK4YUsJ8DAhmHa4qZfyP69a8iXRuFce9C6g
         QAFHIt2+aqkt72wFw9zObHPSn7ThP88AeqTIsax/sONC1PemU2GeZghKKEhPvgolUsed
         2mlcCflbfbyj76C7vBGmsMahzaPLDQvJDil5Ca261mzyv5hIKlCW8mq7tQEQzjvsVIIM
         q+XA==
X-Gm-Message-State: ACrzQf2t4tITP48vl26Gyo3QiFPydr/bNlm8XFpOXe7839OAF8QtMH73
	l3wIqy8g/qtrj4UaDFKd3owdSUxBABSUS9yVyLi2Ndg87O2VYw==
X-Google-Smtp-Source: AMsMyM6XONsSo7iCMaXINRY4adAyyGJG6rotK70Osc/TgyBKo04fPSemc5cBP5lkJFyY8kdtGvyc/A0CuKSmxyZXoDg=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr18027217ejc.619.1664201539159; Mon, 26
 Sep 2022 07:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org> <20220926133904.3297263-3-alex.bennee@linaro.org>
In-Reply-To: <20220926133904.3297263-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 15:12:08 +0100
Message-ID: <CAFEAcA-gpE6XYbiacSAso1_66RXYEJD04z4+HW4fFpqeCvpdQw@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] target/arm: enable tracking of CPU index in MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: WYKqxPMyM4s9

On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> Both arm_cpu_tlb_fill (for normal IO) and
> arm_cpu_get_phys_page_attrs_debug (for debug access) come through
> get_phys_addr which is setting the other memory attributes for the
> transaction. As these are all by definition CPU accesses we can also
> set the requested_type/index as appropriate.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/ptw.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 3261039d93..644d450662 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2315,6 +2315,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong a=
ddress,
>  {
>      ARMMMUIdx s1_mmu_idx =3D stage_1_mmu_idx(mmu_idx);
>
> +    attrs->requester_type =3D MEMTXATTRS_CPU;
> +    attrs->requester_id =3D env_cpu(env)->cpu_index;
> +

This only catches the case where the memory access is
done via something that does a virtual-to-physical translation.
It misses memory accesses done directly on physical addresses,
such as those in arm_ldl_ptw() and arm_ldq_ptw(), plus various
M-profile specific ones.

thanks
-- PMM
