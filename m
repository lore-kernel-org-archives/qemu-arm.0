Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3270736njb;
        Tue, 9 Jul 2024 05:59:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKvMAKWB9419V7uwseaC0Hp9fDQVZcfs+ifPd7uVSf4PeuvSrjHV5VOY7Dl8zzoc5L6mMzt/e9q15ZCpnnP8qtYZ0uPbX2
X-Received: by 2002:a5d:68cd:0:b0:367:9d21:22cb with SMTP id ffacd0b85a97d-367cea73551mr1657531f8f.22.1720529995157;
        Tue, 09 Jul 2024 05:59:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720529995; cv=none;
        d=google.com; s=arc-20160816;
        b=dh5HU0iYiH70DlVvTaLUY9gn5mDaparCx5i9em+Z1m3Fl1pXGd/YXP6MmJ6dSupi9d
         kYpXePAitCXQvekIZUEufvVdWuPjHbDsVuTpZJ4+oQVt9NQhMwcM0oJMygnr2yTWTiCO
         kD1/j6r5X9kpBBxtG8OitxFLxwZC+UmfY/09IaJHpxKZIQJD0k/hbb4a5yTMcWFLxNGT
         kpMOlInoaKcWIs9PozNI9JL9pEuUixGDt52ze5NxchJC9JZ+bhiUB+1sqVv/0UThw+jn
         lQCb39QwQurWCfNECsbtxIjwzuyblwKfPG+HPIjnkO5sUOUl8VKgtz6CulRl7FVPtQpf
         5fkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=OH8PMjNGj0lZClMO++2Cgit0qDr/sOYdin6QCfjAx3U=;
        fh=UUOxweKVOj4eiiAvtiQU3W54Am9khkogF+rnBUD3cq0=;
        b=AU1xLl7/TBn8pZRKnL3OG/RuEeF4pSkggUA8kq+upuIlOAGH0p/0sx0sRtgZyV+tUr
         XUVVtE3oqf8sdKcUme+v2+/vjIKqQcppBK26UR4AgwvkuejbF051bvmgKqljDqyVmbLw
         nDFcXjObFZjLPT47D+0oX3ZpZYUrqKXlb1vR/FDQODbu0yz/vf8HCghPlVQ5SpFCEIXc
         n+ST6qs7cFjuqy/lbaG/zMdFOo1nrtttvbtZHTCrylCjlqCQ3bKoiLMQ3R2bMiH3kWu+
         O/wcu355Neqz5MlUdQuxs2Kd25dV+pgmr8Ck1yTTb71sSUaq8LXnY6KAjp2H4V/12ApR
         K4cw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J+2MKecf;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-367cdfb466esor538412f8f.9.2024.07.09.05.59.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jul 2024 05:59:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J+2MKecf;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720529994; x=1721134794; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OH8PMjNGj0lZClMO++2Cgit0qDr/sOYdin6QCfjAx3U=;
        b=J+2MKecfLPTf7SYJWgLMlU4SGaJEjM9Bx1nBqrtGmpkFytBWz01LgeWdvs0aRfs+yQ
         Hjuq7mqUmCzkk7K25Dva28eqsMaMGCoFrty4fc2kbc8BZOVAVoRQ0pOiYBvisWnBvCUt
         ohjYO2tK8BzkdGJjsb3NW/D20OfgUO4ScdgVB7a93JPR4x287WSazpnglNfJ0yy0UaUp
         xTi4vEPg7e+Bn/V1cCOiq4RsJYqhscynimlPNiVpWIpC7STcGebJ1ulSkvulJO0n/tZD
         iu6R3l6Vz5Yncp53reCiNEdARjYjZcR6vsI3bAAYXqWQbeE8EhoX21bsHVQwKZ7kVSAa
         7Aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720529994; x=1721134794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OH8PMjNGj0lZClMO++2Cgit0qDr/sOYdin6QCfjAx3U=;
        b=aUsLdFxKaKQO0fKI6ViKIa0hJl2YOkwzCWu4d1PsrJ+Hn1uW9Gplz7OUlFxaaVtNrN
         QqMIHsJo1nnFpID8+Xmf9FRqXPSLT/SzSleJ0afnfUkeWLAdGwzcb+BoslJW5U7KRhVN
         zYeRZvhvluj9JzwuEbaPopmwA5nY45gOnrbeU54lbFyIoA3IFdKaY1b19ZvtkULJdipv
         Kh/nl5+zH7T9yNGGK7QFhPvKW4ajDyiD8DLRC2pRZ792XqUnLDsZGKdLD91j8pL/b7Ew
         qdgi+JyeuIIEdJD+d/XWiHvt4Sb4SbB8d2D6nuFdbwsZGpQ+O2PTZyOQ89MqCdFd/Wkb
         X1+w==
X-Forwarded-Encrypted: i=1; AJvYcCX5GmGMjWj5TAgRLuLCw178z2dXII3LYwfDnwWxVGpTlctlzOGVLkOelbUz1HIrgbiPiNfyc+u0L14vQ24mTZAmvX8F4JEU
X-Gm-Message-State: AOJu0YxigqLhZG32V4UVJZxmMdh1cVtRhqMdE1n70HD3ZYhI0zP2r+Fx
	6Dyrz1ca1GeafFLN5eHTy3hTswH9Hsp1QYwLbBg9vkZcsTCaassBOc+IW6W1x0ULPg==
X-Google-Smtp-Source: AGHT+IHa5j2Y8rjN4nn3QVxoY+dI1srnr9jU6L/pqXzK8s545HF1ZwrM8ajaNUXeYwuir6DAJVDDHw==
X-Received: by 2002:a05:6000:186e:b0:367:880f:b8d7 with SMTP id ffacd0b85a97d-367cea46a2cmr2009784f8f.3.1720529994581;
        Tue, 09 Jul 2024 05:59:54 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde890f6sm2494704f8f.53.2024.07.09.05.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 05:59:54 -0700 (PDT)
Date: Tue, 9 Jul 2024 14:00:04 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 08/19] hw/arm/smmuv3: Translate CD and TT using
 stage-2 table
Message-ID: <20240709130004.GB2189727@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-9-smostafa@google.com>
 <20240704180843.GE1693268@myrica>
 <Zozi-87pVHOdwJGN@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zozi-87pVHOdwJGN@google.com>
X-TUID: ubcHL8iIle0W

Hi Mostafa,

On Tue, Jul 09, 2024 at 07:12:59AM +0000, Mostafa Saleh wrote:
> > In this case I think we're reporting InputAddr as the CD address, but it
> > should be the IOVA
> 
> As Eric mentioned this would require some rework to propagate the iova,
> but what I am more worried about is the readability in that case, may be we
> can just fixup the event after smmuv3_get_config() in case of errors,
> something like:
> 
> /*
>  * smmuv3_get_config() Only return translation faults in case of
>  * nested translation, otherwise it can only return C_BAD_CD,
>  * C_BAD_STE, C_BAD_STREAMID or F_STE_FETCH.
>  * But in case of translation fault, we need to fixup the
>  * InputAddr to be the IOVA of the translation as the decode
>  * functions don't know about it.
>  */
> static void smmuv3_config_fixup_event(SMMUEventInfo *event, hwaddr iova)
> {
>    switch (event->type) {
>    case SMMU_EVT_F_WALK_EABT:
>    case SMMU_EVT_F_TRANSLATION:
>    case SMMU_EVT_F_ADDR_SIZE:
>    case SMMU_EVT_F_ACCESS:
>    case SMMU_EVT_F_PERMISSION:
>        event->u.f_walk_eabt.addr = iova;
>        break;
>    default:
>        break;
>    }
> }
> 
> What do you think?

Yes, I think that's also what I came up with. Maybe it would be simpler to
unconditionally do the fixup at the end of smmuv3_translate() and remove
.addr write from smmuv3_do_translate()?

A separate union field "f_common" rather than f_walk_eabt may be clearer.

Thanks,
Jean
